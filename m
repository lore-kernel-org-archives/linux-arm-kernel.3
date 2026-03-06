Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDAFFC9EC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TpbWWX1cj1QogQtOXMz884aeH8NNZvqQ7fJ4Elb1a4=; b=L66axTXISwkIB/FEaNnRsHEi4X
	pZuBeYfVksS1p1+H9PzVgKXuvUItEw6V+WPMo7MJJIuRe9E9am00CgrQWeGxCiwfInA+jkS5gqZ5A
	nR3waS/R41lN+C5X2gdg17TJvw8zFb5WpVN1apOQB/sf0B4D9UWogcCtsFJvH0YtJOCAc/85Pm6Vl
	CklwmTvhIg/t/ASjpfQWxAB7hxk5WVOxG3ATk10X6aGVD3wCn2xJwJkxhg0hFBUGav9EkuRhhlvYj
	GD1zbrEG2ZxbJs8B1577Uq97OypII9Re5+Iyxwd9Z7guODwNFbNVfdrQXaHZUeqSTxBX9e9gxXpKV
	pyRUe6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyewA-00000004gOK-4AD1;
	Fri, 06 Mar 2026 23:50:30 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyew8-00000004gMr-243o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: References: Cc:
 To: From: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1772841025;
 bh=7TpbWWX1cj1QogQtOXMz884aeH8NNZvqQ7fJ4Elb1a4=;
 b=WLz4UxpZz2cHHWeIlEpaCrfGVGI6FsAwm7Uvq+dNTfgASzhQLiBkt9QYdpJ0q8WPyOaF8Yqzl
 wOwQWc8akhsYi94HwyDVYK/UPVgPIEnZM1ru9OE4X7hDztLtE4ChcS5MQxVFNlDe2mnAeDxPsjZ
 dzQqhWgpo9+L5RhImdSwRMU4s1Z/boRMRKDRlJ1nDPRqGPjfSwZFQc7gTavlaDz9qYCCC34NXww
 aA7aURNXjEPkZwEeok+dNx844lSZFcUBqv3Hj8GuCpyK0oQ8xA6ud76HLCuaP2Bat/kbZgEcOeB
 2J5gPvwjelC4ORK3nbojiOKMqo62Bq85wMDi5pfkRyiw==
X-Forward-Email-ID: 69ab683dce06037f1b6bb7be
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <3a42ce98-b552-43d2-aaf3-8ca071c3afd3@kwiboo.se>
Date: Sat, 7 Mar 2026 00:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] Raspberry Pi HEVC decoder driver
From: Jonas Karlman <jonas@kwiboo.se>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 review list <kernel-list@raspberrypi.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
 <1d666c43-688b-4cc1-aeed-5296d2608327@kwiboo.se>
Content-Language: en-US
In-Reply-To: <1d666c43-688b-4cc1-aeed-5296d2608327@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_155028_619749_FFAB8E8B 
X-CRM114-Status: GOOD (  11.47  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi again,

[snip]

>> Testing is with a downstream patchset to FFmpeg. I'm told FFmpeg
>> currently has no stateless decode support, but we will be reviewing
>> works that have been in progress and our downstream patches to see
>> whether that can be pushed onwards.
> 
> Please see FFmpeg PR20847 "Add V4L2 Request API hwaccels for MPEG2,
> H.264, HEVC, VP8, VP9 and AV1" [1] for pending upstream FFmpeg work.
> 
> My 4l2request-v3-pixfmts branch [2] also contains extra commit to make
> it work with downstream rpi kernel version, using non-MT pixfmts.
> 
> I will give this a spin together with the FFmpeg PR, adding support for
> the MT based pixfmts should hopefully be easy.

My FFmpeg v4l2request-v3-pixfmts branch [2] got a small update that adds
support for this decoder and pix formats. Tested on a rpi5 using the
downstream rpi-6.18 kernel and kodi-gbm for visual playback confirmation.

  [AVHWFramesContext @ 0x7ffeb81abc50] Using V4L2 media driver rpi-hevc-dec (6.18.15) for S265
  [AVHWFramesContext @ 0x7ffeb81abc50] Using CAPTURE buffer format Nc12 (1920x1088)
  [V4L2RequestContext @ 0x7ffeb81abb00] frame-based decoder with SLICE_PARAMS=600, ENTRY_POINT_OFFSETS=0 and SCALING_MATRIX=1 controls

Will update the main FFmpeg PR (and backport branches) with the required
changes after some more testing.

Regards,
Jonas

> [1] https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/20847
> [2] https://code.ffmpeg.org/Kwiboo/FFmpeg/commits/branch/v4l2request-v3-pixfmts
> 
> Regards,
> Jonas

[snip]

