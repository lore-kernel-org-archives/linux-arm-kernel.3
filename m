Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FD2C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 22:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHkRYFpt3aAz3Ej/RQi+PIx1eipvqLkRoOf6Sl8ioRw=; b=OFhMuttUGXhWVWgO04K6nGQgbF
	sJ+/KMzcTHoN2hymtktxGs1zmeecBmajdfW+JNv82c9TKhIoL5yNnDkDqGtoW81YpKrktNOh4dvwW
	VrwUHWtWS1NxxQ8+DfBh37PmZ9CUKAAgCZ1QdAj/iwGv50kUKnGyeIcV66pCr5OycUjzn4mjv4nX7
	zSTAEcw42hHFi5bUq32RxqnkTW4xhBbn36XCsnfYTHJWQkcelk8KkBn1gJqrK4v5V8jlsA5CMFnoh
	Q/HjvDvlLgL0ciHDC7ULCdxAR0IvzvZ0FcuRfk9kAr8Up3Siqp7Kh4KKIHd1obcblutXe1wgiVmUc
	G+jSJqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmfWx-0000000CuHq-2gyA;
	Wed, 22 Jul 2026 22:35:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmfWu-0000000CuHI-1ebk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 22:35:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA9CF168F;
	Wed, 22 Jul 2026 15:35:01 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 409FE3F86F;
	Wed, 22 Jul 2026 15:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784759705; bh=+zDJ7KLhhR+L+X9r/DA6AC2Lf372VvSm+QWFUxozOwA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oiWFDpuF5h9pwDpPeb15VijbnoV2ZHGWRK70PUU+bzkZdDpUv0IT+teFxshkBiS0+
	 ZhY9Rq1AgzBRHKgAx9chfa1nRPQnjUlvuGsU8U31oNJcmNJ9MN+e+j1AM/J35tNy6u
	 VXkTmR0cLi5bORUQVR5v56UVJHRsILMJgSCd+WtA=
Date: Thu, 23 Jul 2026 00:31:15 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 0/3] media: rc: sunxi-cir: support the A523/H728/T527
 IR receiver
Message-ID: <20260723003115.3087bf3e@ryzen.lan>
In-Reply-To: <20260722201717.2205609-1-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_153508_487678_87F5D72D 
X-CRM114-Status: GOOD (  19.90  )
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

On Wed, 22 Jul 2026 16:17:14 -0400
Justin Suess <utilityemal77@gmail.com> wrote:

Hi Justin,

> Sorry for the delay,

no worries, thanks for the update.

> This is v2 of the series that adds support for the CIR
> receiver found in the Allwinner A523/T527/H728 family (sun55i).
> 
> Unlike the previous version of the series, this version has no driver changes,
> and just uses a fallback compatible and enables the receiver.
> 
> Tested again on my X96Q Pro+ (H728) TV box with the Google TV remote that
> came in the box (using NEC keymap). Was able to press buttons and
> get readings from lirc / ir-keytable again.

this all looks good to me. As mentioned on the individual patches, I
tested this on two boards here. I sent a patch [1] to enable IR on the
Avaota board, which goes on top of this series.

[1]
https://lore.kernel.org/linux-sunxi/20260722222627.14138-1-andre.przywara@arm.com/T/#u
 
> The series is (re)based on tag v7.2-rc4 on mainline.

Please base your submissions on -rc1, that simplifies merging/rebasing
for the maintainers, because then all new patches have the same base.
Not a particular problem for this series, since everything still applies
cleanly, but keep that in mind for future submissions.

Cheers,
Andre

> 
> Justin Suess (3):
>   media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
>   arm64: dts: allwinner: a523: add IR receiver nodes
>   arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
> 
>  .../media/allwinner,sun4i-a10-ir.yaml         |  8 ++++--
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
>  .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
>  3 files changed, 39 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f


