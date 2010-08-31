#!/bin/sh
#
# Vimeo Downloader
#
# Copyright (C) 2008  Denver Gingerich
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

if [ $# -ne 1 ]; then
	echo "Vimeo Downloader v0.1.1"
	echo "by Denver Gingerich (http://ossguy.com/)"
	echo
	echo "Usage: $0 <vimeo_id>"
	exit 1
fi
VIMEO_ID=`echo $1 | sed -e 's/^http:\/\/vimeo\.com\///'`

GET_CMD="./wgetgood"
GET_STDOUTARGS="-q -O -"

VIDEO_XML=`${GET_CMD} ${GET_STDOUTARGS} http://www.vimeo.com/moogaloop/load/clip:${VIMEO_ID}`

REQUEST_SIGNATURE=`echo $VIDEO_XML | sed -e 's/^.*<request_signature>\([^<]*\)<.*$/\1/g'`
REQUEST_SIGNATURE_EXPIRES=`echo $VIDEO_XML | sed -e 's/^.*<request_signature_expires>\([^<]*\)<.*$/\1/g'`

echo $REQUEST_SIGNATURE
echo $REQUEST_SIGNATURE_EXPIRES

echo "Downloading video..."
${GET_CMD} "http://www.vimeo.com/moogaloop/play/clip:${VIMEO_ID}/${REQUEST_SIGNATURE}/${REQUEST_SIGNATURE_EXPIRES}/?q=sd" -O ${VIMEO_ID}.flv

echo "Video saved to ${VIMEO_ID}.flv"
