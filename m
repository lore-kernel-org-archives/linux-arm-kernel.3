Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4640CC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kUAcGsdRUecIBBUdBWsk12JgFxfSk+w/xOLNeSxYqU=; b=wczH4Vo/bftjyZZWkBmkwopjnB
	5TjSBdU2mnKWXyn5R4MLrcvGLnUT5MdAZWjFSrP4MRe6tJttDNKQWV8rNWxpYfJwV3P4Y5CdZ13Pq
	2eF7hwng+LqM9zfwxbljlC5h4ynRCPFKHDw3GlVKnfaDQNAXxMR6xxinK53Nh146mnNUlv/+RAgeD
	MJ9EwOHdecrOxiByQOgUCdpGNy8bBkeAis9E4a12fPT93yCly8i9o0Mwag2/EItQQadXcwqqsKoVg
	/pAm97OTlZVKQIC/Qgf0z9jaK8rGy3r7ua3D3Vj4x+DIk/Qt7+VMi/hX7hF+/oSNT7Ueg1M5/0hsj
	45y/19KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ44F-00000004o1Y-1eng;
	Tue, 08 Jul 2025 08:52:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3nV-00000004lSX-2Dwd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:35:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB9E261473;
	Tue,  8 Jul 2025 08:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C8EC4CEF0;
	Tue,  8 Jul 2025 08:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751963728;
	bh=zaiKQlWEdrcffQVeIreYh3y190tWcHJleeTNcRNgNAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RccMEPDRS7gbem7CDc3prPbkm1sAP+E+zjNzqp+9hWDqxnu3P/4/TeFD9DuTyprbr
	 skhoMNVUzPx18ofPCZZDuxOSzam6iFFm7aQsg7uhE5ixrOJxvlz/zCO3474lHXp+vG
	 Qd/ndwCqbNcuztl5CwnMdxozs+GfC44WYQlx3Ui7EEYhylX6Ro8RlzURtoiLGdQTSa
	 r6inRgKx5iYt7peQnYrMM+p/cIR9rBBF1moNSUfEW4sDyEsNo0I+Oqit4iz1+mTDrl
	 PLw6X+fihSY+W3W0gsJn6ToxjS9TO/RhJ90zmI4/mu00m3UKRQrVNYIfqfPpmp2mOt
	 ffa1m12pj+prA==
Date: Tue, 8 Jul 2025 10:35:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taishi Shimizu <s.taishi14142@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Rafal Milecki <zajec5@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 1/2] dt-bindings: arm: bcm: Add support for Buffalo
 WXR-1750DHP
Message-ID: <20250708-tall-roadrunner-of-tact-e6fb11@krzk-bin>
References: <20250625154315.114139-1-s.taishi14142@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625154315.114139-1-s.taishi14142@gmail.com>
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

On Thu, Jun 26, 2025 at 12:43:14AM +0900, Taishi Shimizu wrote:
> Add Buffalo WXR-1750DHP under BCM4708 based boards.
> 
> Signed-off-by: Taishi Shimizu <s.taishi14142@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


