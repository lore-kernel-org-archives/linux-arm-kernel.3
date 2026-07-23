Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F57C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 08:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqQFt11wRLk0RXD2GjnBPO36Ju47FY1BOW01qu3lNFw=; b=CceGp8Kdu8QPZBn8YnuepEi7oM
	8godVUp/yCqMBEwPsDjwyCGQ/0lzrFJyk+G9HOh6pDrxSQtH5xzwpV6GHXL2yZHXbetZaXXpuwpdf
	IDi6EJMvdRz0G3gm3RHCchUK7iF3c9986pD6Vai3abmxX6IVrRRs+A5EGajEszjJ7ZpAV+ryw9Qdo
	OdWzEdium93GvdoM+ubMsWrFeWnGBMzYxlbNjobLxzsURagEBu14hM4RQyKX2fGaGYUyMekjOhaTM
	MEHjRC33ncTRftgoYFswL1SfL/1X9737HjU5x1TZ+l6+pD8LOsfJvtg2+TeVvqvJikCY8i618Mgzm
	1l1eMwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoLW-0000000Dgt2-3FUK;
	Thu, 23 Jul 2026 07:59:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoLU-0000000Dgsa-0mek
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:59:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B30E1477;
	Thu, 23 Jul 2026 00:59:51 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8916B3F66F;
	Thu, 23 Jul 2026 00:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784793595; bh=PZ9cLd5vXkqOcuFGnstrDDKPwunq3EKIElywadcD1Iw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=in8JzGId0LC6dWY2LG9U0bwdrm9y2fF3m1ARSmEluWsmMdrRWnb+EKMBXrBI7dxOD
	 LKpuBQq2q3TL14hNjQRo/UF8UTKHsIQOssMkZQoD002FPpztu3NxCdBqE+8jQ/MDuI
	 noaTYFrjxhlkfG/oUs7w2cvZcojS5yIHdjen7lxg=
Message-ID: <f28ea754-5b13-4bf4-a3a6-585605f38ff1@arm.com>
Date: Thu, 23 Jul 2026 09:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] media: rc: sunxi-cir: support the A523/H728/T527
 IR receiver
To: Justin Suess <utilityemal77@gmail.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Sashiko <sashiko-bot@kernel.org>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_005956_568947_F8066760 
X-CRM114-Status: GOOD (  14.40  )
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

Hi Justin,

thanks for the update, but ...

On 7/23/26 01:36, Justin Suess wrote:
> Hi,
> 
> Quick series respin for easier application.

please try to avoid that. Leave *at least* 24 hours between revisions, 
to give all reviewers at least a chance to look at the series. Otherwise 
they might get frustrated if they started reviewing a series, and get 
ambushed by an updated version in the middle of the process.
And in this case here you are probably waiting for a DT maintainer 
review still.
Also maintainers can fix up minor issues when doing the merge, so there 
is no pressing need to send a whole new series for just a minor hiccup 
or just for adding the tags.

> This series adds support for the CIR receiver on the
> Allwinner A523/T527/H728 family (sun55i).
> 
> One-line function name change s_cir -> s_cir_rx at Andre's
> suggestion, with his patch for the Avaota A1 applied on top
> for convenience.

Thanks for taking that in, but please note that you would need add your 
Signed-off-by: on top of the author's in this case, to document the flow 
of patches, and for legal reasons.

Nothing worth to a respin again ;-), just wait for the DT approval and 
for what Chen-Yu suggests.

Cheers,
Andre

> v2: https://lore.kernel.org/linux-sunxi/20260722201717.2205609-1-utilityemal77@gmail.com/
> v1: https://lore.kernel.org/linux-sunxi/20260702214750.3428694-1-utilityemal77@gmail.com/
> 
> Andre Przywara (1):
>    arm64: dts: allwinner: a523: enable IR on the Avaota A1
> 
> Justin Suess (3):
>    media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
>    arm64: dts: allwinner: a523: add IR receiver nodes
>    arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
> 
>   .../media/allwinner,sun4i-a10-ir.yaml         |  8 +++--
>   .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 35 +++++++++++++++++++
>   .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
>   .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  6 ++++
>   4 files changed, 52 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f


