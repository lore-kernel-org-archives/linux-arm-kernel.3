Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5E6C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbYmLEJ5QJ3n246rV0S+a91Iwiri5zbLi7J1dNUxz+A=; b=Z0LoHvycQKUfKzL4PRbfRo5ONo
	N6lgE6kXyMzSxYELrTd/J/VKDQ4Z+pJ4c004JI3S7wnz98zrlHvTugMOIwU6zD06vTuS4haScfpt0
	Ngu9c1kIJjPs4UJXplf5PmHAeyyvW4Fn6HiDQlhq/GQyD1UonHm8DKz6/dG0rBwFt8yWJQdBwU6AV
	tKlcltySBdmB64iKrszdgILNMSjvTLytbNb2dvSZiJhgmhiUOTeQ+UQsWC1SiYMUP/tb66U49wURs
	JBU1T961tFnTGt+xHN1xhm+3pS2sjxKHi5iPhd48qTKDgiVwBJCoUAUG0lXhlewxdMBoQ1ysc1tww
	ZbEW84Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidnZ-0000000CCCP-0JRW;
	Thu, 13 Feb 2025 18:18:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticv0-0000000Bzf3-2Scv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:22:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9389BA426B8;
	Thu, 13 Feb 2025 17:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB04C4CEE4;
	Thu, 13 Feb 2025 17:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739467349;
	bh=l0FlV3JhqBNb6Iht2yHMwP7PfD3TpYDSZvC58kqj4RM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Nor8JpPQH4ysaE2ZABWo48WXNTp5scAGRpgLahkWwLdOn/x6ZOv5zuPNxKJJpWLR8
	 cpkQYQkafOsOBwzpKKRaOTmIWZyf1wJj1dQfvofUjXwzC6BFbGTx+YYDO5WL53ENmv
	 0axggrRHUfooRztP4qO1wrZ6cYro0D2FaKLbNwitKmQin7VsK1nJ0oS5Y7zDxbnD8W
	 msJif7Y5XQFuxN/XZpIAk3hyo61SGscfzgkgDT6BJhEehzRgCJAeOl/zhi1k6s08bq
	 EwLQ2ix4q5anihWhLRverV+znGn+FFT2SU6I9pLD+f+biNxDr/UI6pLc/t3RljXFOd
	 U1Vl6ccUlhykA==
Date: Thu, 13 Feb 2025 11:22:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250212204258.57514-1-krzysztof.kozlowski@linaro.org>
References: <20250212204258.57514-1-krzysztof.kozlowski@linaro.org>
Message-Id: <173946704368.3328478.14106859473786211510.robh@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: marvell: armada: Align GPIO hog name with
 bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_092230_752530_F7AF8FE8 
X-CRM114-Status: GOOD (  12.91  )
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


On Wed, 12 Feb 2025 21:42:58 +0100, Krzysztof Kozlowski wrote:
> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warnings like:
> 
>   armada-385-clearfog-gtr-s4.dtb: wifi-disable: $nodename:0: 'wifi-disable' does not match '^.+-hog(-[0-9]+)?$'
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Add forgotten Rb tag.
> ---
>  arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi | 8 ++++----
>  arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/marvell/' for 20250212204258.57514-1-krzysztof.kozlowski@linaro.org:

arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: gpio@18100: Unevaluated properties are not allowed ('gpio-ranges', 'phy1-reset-hog' were unexpected)
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: gpio@18100: Unevaluated properties are not allowed ('gpio-ranges', 'wifi-disable-hog' were unexpected)
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: gpio@18140: Unevaluated properties are not allowed ('gpio-ranges', 'lte-disable-hog', 'poe-reset-hog', 'sar-isolation-hog' were unexpected)
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: gpio@18100: Unevaluated properties are not allowed ('gpio-ranges', 'wifi-disable-hog' were unexpected)
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: gpio@18140: Unevaluated properties are not allowed ('gpio-ranges', 'lte-disable-hog', 'poe-reset-hog', 'sar-isolation-hog' were unexpected)
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#






