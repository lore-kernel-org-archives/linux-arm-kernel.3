Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDF3CE8D47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jab9jcwJkgBbHQXKWRyzjApbhnO4x6UAw5acef1S3rY=; b=ng+fTqvShpN3wt/4sA0C/JBZi7
	/xqN34LJegw+Rv784CcstEBEZjWL4LYog4kOxlBsa8xCyqS+rHZT3FAEznueRFTkq/gFTxXnK+BuC
	G8TERe9i5Qyz1zltjVAwXNsAh1omTQFG6rq82IMNxVQq7AhEURQ9UwD/a+oTVHhYuap5J5KdmO/ku
	PpESDlHvzTEnZs1XCanX1PDUIBDTaPS1so3RSrpwNuawzymKTsq9uXr3n5oKOPM3nsT3obFG+HtqX
	X4QbBaQFTSWD7XFbLkYlxZVSUzAHH7WP4a8gZaVUQef6JhXqTwTadmXqozuC18eA8y9Ky0GJRkjO5
	jt6etPbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwBr-0000000Cdfc-0CAF;
	Fri, 14 Nov 2025 15:58:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwBp-0000000CdfD-0f8W;
	Fri, 14 Nov 2025 15:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5430060121;
	Fri, 14 Nov 2025 15:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6AAC19421;
	Fri, 14 Nov 2025 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763135900;
	bh=tRFbjnnnGYoNv0ovOhf9bdB3gNHViLXElGTT7OSRUNM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kn0voBfhkFcXuamgxp1cypg5mRJYcDjJPdn2UBLK5ris48B7Oq4H9FkY+NzEziugS
	 evjYPPdviDkQKxDhod7Iwuia4NcBUHWlURuhu8l3nV5jIXRUJDNvbsOlRU17PgRnpt
	 ydRlUnBhMFjd1BCDD6Wrer0ZAtSZ9v4+rghuXZWmfW76LnavEl68TDiXj6w6Ikimjd
	 o3Z5BoZcJ0kywb7tQ/z2YIa31/KC0hy+6ewhU1G5kyJKcIEg6D09PAWAzNh42kuWo2
	 DK5bvlI7S0M2dKiJ5mSfxkRQrmXSQjE1c+ewXIG4vSr86DsX6NEPCg0R0bgkiAKFN9
	 5mxW4hSujkSdg==
Date: Fri, 14 Nov 2025 09:58:18 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-kernel@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-5-b4d1fe4781c1@amlogic.com>
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
 <20251105-irqchip-gpio-s6-s7-s7d-v1-5-b4d1fe4781c1@amlogic.com>
Message-Id: <176313578804.3261993.9727195642647352249.robh@kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: Add gpio_intc node for Amlogic S7D
 SoCs
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


On Wed, 05 Nov 2025 17:45:36 +0800, Xianwei Zhao wrote:
> Add GPIO interrupt controller device.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
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


This patch series was applied (using b4) to base:
 Base: cb718411c4c05a4a424c2b73790a1648be97a4af (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20251105-irqchip-gpio-s6-s7-s7d-v1-5-b4d1fe4781c1@amlogic.com:

arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: interrupt-controller@4080 (amlogic,s7d-gpio-intc): compatible: 'oneOf' conditional failed, one must be fixed:
	['amlogic,s7d-gpio-intc', 'amlogic,meson-gpio-intc'] is too long
	'amlogic,meson-gpio-intc' was expected
	'amlogic,s7d-gpio-intc' is not one of ['amlogic,meson8-gpio-intc', 'amlogic,meson8b-gpio-intc', 'amlogic,meson-gxbb-gpio-intc', 'amlogic,meson-gxl-gpio-intc', 'amlogic,meson-axg-gpio-intc', 'amlogic,meson-g12a-gpio-intc', 'amlogic,meson-sm1-gpio-intc', 'amlogic,meson-a1-gpio-intc', 'amlogic,meson-s4-gpio-intc', 'amlogic,a4-gpio-intc', 'amlogic,a4-gpio-ao-intc', 'amlogic,a5-gpio-intc', 'amlogic,c3-gpio-intc', 'amlogic,t7-gpio-intc']
	from schema $id: http://devicetree.org/schemas/interrupt-controller/amlogic,meson-gpio-intc.yaml
arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: /soc/bus@fe000000/interrupt-controller@4080: failed to match any schema with compatible: ['amlogic,s7d-gpio-intc', 'amlogic,meson-gpio-intc']
arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: interrupt-controller@4080 (amlogic,s6-gpio-intc): compatible: 'oneOf' conditional failed, one must be fixed:
	['amlogic,s6-gpio-intc', 'amlogic,meson-gpio-intc'] is too long
	'amlogic,meson-gpio-intc' was expected
	'amlogic,s6-gpio-intc' is not one of ['amlogic,meson8-gpio-intc', 'amlogic,meson8b-gpio-intc', 'amlogic,meson-gxbb-gpio-intc', 'amlogic,meson-gxl-gpio-intc', 'amlogic,meson-axg-gpio-intc', 'amlogic,meson-g12a-gpio-intc', 'amlogic,meson-sm1-gpio-intc', 'amlogic,meson-a1-gpio-intc', 'amlogic,meson-s4-gpio-intc', 'amlogic,a4-gpio-intc', 'amlogic,a4-gpio-ao-intc', 'amlogic,a5-gpio-intc', 'amlogic,c3-gpio-intc', 'amlogic,t7-gpio-intc']
	from schema $id: http://devicetree.org/schemas/interrupt-controller/amlogic,meson-gpio-intc.yaml
arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: /soc/bus@fe000000/interrupt-controller@4080: failed to match any schema with compatible: ['amlogic,s6-gpio-intc', 'amlogic,meson-gpio-intc']
arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: interrupt-controller@4080 (amlogic,s7-gpio-intc): compatible: 'oneOf' conditional failed, one must be fixed:
	['amlogic,s7-gpio-intc', 'amlogic,meson-gpio-intc'] is too long
	'amlogic,meson-gpio-intc' was expected
	'amlogic,s7-gpio-intc' is not one of ['amlogic,meson8-gpio-intc', 'amlogic,meson8b-gpio-intc', 'amlogic,meson-gxbb-gpio-intc', 'amlogic,meson-gxl-gpio-intc', 'amlogic,meson-axg-gpio-intc', 'amlogic,meson-g12a-gpio-intc', 'amlogic,meson-sm1-gpio-intc', 'amlogic,meson-a1-gpio-intc', 'amlogic,meson-s4-gpio-intc', 'amlogic,a4-gpio-intc', 'amlogic,a4-gpio-ao-intc', 'amlogic,a5-gpio-intc', 'amlogic,c3-gpio-intc', 'amlogic,t7-gpio-intc']
	from schema $id: http://devicetree.org/schemas/interrupt-controller/amlogic,meson-gpio-intc.yaml
arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: /soc/bus@fe000000/interrupt-controller@4080: failed to match any schema with compatible: ['amlogic,s7-gpio-intc', 'amlogic,meson-gpio-intc']






