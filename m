Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D0AC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 13:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfbhKchye1zWdhAskekFU3MNTE6H+5NvaeNmX+nq66M=; b=ddeeAfo+brvYJg+/GzxK9y/WTO
	DeerQWdqvDN9uYB2T+YBkaYB+eLD9UT1DWxXY67c6EX5QcpNQ3J7YKdvU++ZoWfgSjBMXC2tex1WF
	qB64i5cnDa2bvxlE2tjHVEA3KRq0ynt9ln/B7qecgj/0ospVPYCawvkTVIyev4UUywpUgovF6GbF4
	FSKuIL5TDnSbpVu9apyzCBBKY+UAqo8Q8qxf+csnkJk+KhFCFfRi1NoMNKQ6UOEJ9kVOrhbfS6J2E
	JTE5QDwEyNHhaV+uQ6LLYLse1Ix999qzOOtPSInG02c9S2KHKjVIvDmvoC3BLqUfzf261ty3hH764
	p9WjrL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFHb-00000000SXJ-2157;
	Mon, 31 Mar 2025 13:34:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFFt-00000000SEf-0CxS;
	Mon, 31 Mar 2025 13:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B0885C46E1;
	Mon, 31 Mar 2025 13:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF23C4CEE3;
	Mon, 31 Mar 2025 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743427963;
	bh=/lgLZPuxiweVn5v5ms1kIG4weriLChhI1yLLxFdQFkQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qqXIbSe1IqWEFV4QJicIu9v3qtoS0zEtopDvEYE/eKPC7JuFYO1ofC82kpyPvBqQ6
	 By9qPtC/0psX/JW0yYtuAGXwmPIoyDDG0FwTelITStOmCeJ2LvZ76wwmpyBg5fO6Mq
	 OkBr7yBY+BuumMkYIEN11vTC9Ah6/awXL6Ylf7471sUR+lsPWdPk+K1LTIGL+98eUV
	 t1RyXjb0swRoCcvDa/bG8/1EmRsFjxThewpkOa5pYE4blS1tvCaJH6rL1wVsNJEsY+
	 k25FTkgCF2heMno2m/8B4pMrrrXRvWCNS9Up6CmuSEY91YbwJt7/wWAoC/ThKhROTq
	 krlygGt6bDXjQ==
Date: Mon, 31 Mar 2025 08:32:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250330143254.3159519-1-christianshewitt@gmail.com>
References: <20250330143254.3159519-1-christianshewitt@gmail.com>
Message-Id: <174342765349.2641741.12813558256280243493.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: amlogic: gxlx-s905l-p271: add saradc
 compatible
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_063245_129969_DA50D0B0 
X-CRM114-Status: GOOD (  13.04  )
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


On Sun, 30 Mar 2025 14:32:54 +0000, Christian Hewitt wrote:
> Add the saradac node using the meson-gxlx-saradc compatible to ensure
> MPLL clocks are poked and audio output is enabled on the p271 (S905L)
> board.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> The meson-gxlx-saradc compatible is now merged via the IIO tree, see [0].
> 
> [0] https://patchwork.kernel.org/project/linux-amlogic/cover/20250330101922.1942169-1-martin.blumenstingl@googlemail.com/
> 
>  arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts | 4 ++++
>  1 file changed, 4 insertions(+)
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250328 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250330143254.3159519-1-christianshewitt@gmail.com:

arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: adc@8680: compatible: 'oneOf' conditional failed, one must be fixed:
	['amlogic,meson-gxlx-saradc', 'amlogic,meson-saradc'] is too long
	'amlogic,meson-saradc' was expected
	'amlogic,meson-gxlx-saradc' is not one of ['amlogic,meson8-saradc', 'amlogic,meson8b-saradc', 'amlogic,meson8m2-saradc', 'amlogic,meson-gxbb-saradc', 'amlogic,meson-gxl-saradc', 'amlogic,meson-gxm-saradc', 'amlogic,meson-axg-saradc', 'amlogic,meson-g12a-saradc']
	from schema $id: http://devicetree.org/schemas/iio/adc/amlogic,meson-saradc.yaml#
arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: /soc/bus@c1100000/adc@8680: failed to match any schema with compatible: ['amlogic,meson-gxlx-saradc', 'amlogic,meson-saradc']






