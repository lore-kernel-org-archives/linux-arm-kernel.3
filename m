Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EBCC369CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DduY/z6YD9rJWMzbXzcUc6E7+rj2F8/dDrYVZjaDonw=; b=3ZkOJGmm7kFA+S1Ps1sHLc+gtz
	P4TnWcJuASB9YFnSTEIRlG2xrU8atka7J08zT0ZP/c0gVgULb4mtcbKdrKcPQgJmoenLP45UaTTd0
	kd61egFELUxgUOvjmPHEuW+AhWzPn3n9+MfmvwGBO8vgPMV+rVRU/dUh5QK+aoJlEMRDitE6rebyV
	1ChGX88pM5LW4moys0ie4mVNto7mYkYUXZIB1H4XXlnYybVGB75b9KdSqwgL5xRVkHdzibWf7fwL9
	gS03T5d/7I6dRBN3bk3PHWXwJsExMrZtMvpc5D0cAVr9VoRo2o9ZWiinkdg8HTzHDGO/vexhpN4hk
	d5iYyKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Pbe-0000000DCNH-1jz1;
	Thu, 17 Apr 2025 13:48:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PLR-0000000DA7M-1CTl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:31:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 331DDA4B3B1;
	Thu, 17 Apr 2025 13:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EA5C4CEE4;
	Thu, 17 Apr 2025 13:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744896716;
	bh=zfrzax3mWQXR8qlR6MDGWvmUK0vDJj6YaPGr03m2Vo8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pVjmrjYUu5O0NoIDjMzVXG8v4ILt1lM/qibhB/8NXY9tBhGRgYs+At83h7Ey9sixL
	 9YnZ8F1p5sZ03KR+VfvLZAEATteT8WrW5jXBHAVwkmtK4yT1YvkZgzzwtoi0OCG6cl
	 BOyfQ2w8nXCcXw+hxPHIvZ+XGfT7d8MSaaWe4463RUZ5cuAE8ffn9WOJ9Q3SY8dR5l
	 TbSmviz4r7WhBG+DKcnhcc4sWxRRorqu4kuQRZsYnwvFNcK18LwFUKCr5zmBkL03rA
	 iHrevWGyTD8dkIHSL8yXyBV4wv4yYeQf/Uqb0NwG0dMHpy2tQos2rxbLWgLkpjk07D
	 JkiXYsih/QVjQ==
Date: Thu, 17 Apr 2025 08:31:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, Yashwanth Varakala <y.varakala@phytec.de>, 
 Jan Remmet <j.remmet@phytec.de>, imx@lists.linux.dev, 
 upstream@lists.phytec.de, Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Teresa Remmet <t.remmet@phytec.de>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Benjamin Hahn <b.hahn@phytec.de>
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-1-ccb885b38ffd@phytec.de>
References: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-0-ccb885b38ffd@phytec.de>
 <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-1-ccb885b38ffd@phytec.de>
Message-Id: <174489671445.1639679.13539167647516312025.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: add imx8mp-libra-rdk-fpsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_063157_451274_7D4BD009 
X-CRM114-Status: GOOD (  12.53  )
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


On Thu, 17 Apr 2025 14:01:12 +0200, Yannic Moog wrote:
> imx8mp-libra-rdk-fpsc is a development board based on the phyCORE-i.MX
> 8M Plus FPSC SoM. Add its description and binding. The
> imx8mp-phycore-fpsc som differs from the existing phyCORE-i.MX 8M Plus
> (dts: imx8mp-phycore-som.dtsi) in its physical form regarding the ball
> grid array. Other differences between the SoMs are missing SPI-NOR on
> this SoM and 1.8V IO voltage instead of 3.3V as found on the existing
> imx8mp-phycore-som. As a result the imx8mp-phycore-som is not compatible
> with this new libra development board.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Documentation/arch/powerpc/cxl.rst: Documentation/ABI/testing/sysfs-class-cxl
MAINTAINERS: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
MAINTAINERS: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
lib/Kconfig.debug: Documentation/dev-tools/fault-injection/fault-injection.rst

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-1-ccb885b38ffd@phytec.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


