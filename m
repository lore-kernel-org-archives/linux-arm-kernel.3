Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F70CC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 13:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlgX4TMk80eDKr/d+XlB6V4DGTr3ukEOsuvUGRFeyvE=; b=nTIitzqiTFYBHx6RnNGPGl+0xK
	dGRgUFJkgmgO4gqdAeBQZT5JeAGWJywgDFOi+htg4Uvtr3aLRr3Vf7jRVka96wXjm9hXLRELtvMYU
	9yt8M9GW0a7IQCBJLOz6WbwdD0w6i2ZdIMh1P74e5VycR6ntokAoKt2YagtCHLZN2QuwZxXHm8lR+
	DjoI8+iA9kL54OTZSlgMbqIUk1wXPG2U//JW+jAP0cZXCdxIcyI79J/U/a1sTy+NxPyHcthjI2H9L
	Pe9+Tv7YlefCVWymApg6/pIpQ3aphmli4VZnDw2diRvxQB/x/AYAYRaPSmVpzuDMSBWDvANuiF68N
	4fQXcDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjIGF-000000009UJ-0B5L;
	Sat, 15 Feb 2025 13:31:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjIEm-000000009Ek-2okJ;
	Sat, 15 Feb 2025 13:29:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 829B3A4007D;
	Sat, 15 Feb 2025 13:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A27C4CEDF;
	Sat, 15 Feb 2025 13:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739626179;
	bh=k40pzK1X79s+z6fpQsmQlU2BYJ+/ZjGGtejZR++BQ+Q=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZWLWWDkjTgH38wQ58i+33SPUXdx2MkdONt7xOanhGnnvhKaz88Rvbm4IrB36h0DjM
	 FovtO81IQDykZ2khWnojpXM4eqNI9FeOmqQvpP9BLSApZsP4OcgP1Cxpf6b1Yu1Hmt
	 nx73NRuXCkX7OUp/aEnQGuDp0BTRqj55Uev1q0hCxNSpZylgGjtSTFrR3MI9XXeVI0
	 gUpDdFkzLwtv+8s6SGbuXKg9ZVvgIPPHnOTsMHyf9xnAfMJS7EbO5hFPfNQggxDdwt
	 aXMOfSwNXMKIb3RuhjRR9dOLY7W7enw7mzHQTzSt0EWOyIIncys2Zd1kCAktD30qei
	 zEwa86Tgif6KQ==
Date: Sat, 15 Feb 2025 07:29:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com>
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <173962617692.765204.2321221334905169840.robh@kernel.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: phy: add
 samsung,exynos2200-snps-eusb2-phy schema file
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_052940_776288_D25493D1 
X-CRM114-Status: GOOD (  11.28  )
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


On Sat, 15 Feb 2025 14:24:06 +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC uses Synopsis eUSB2 PHY. Add a dt-binding schema
> for the new driver.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../samsung,exynos2200-snps-eusb2-phy.yaml    | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.example.dts:18:18: fatal error: dt-bindings/clock/samsung,exynos2200.h: No such file or directory
   18 |         #include <dt-bindings/clock/samsung,exynos2200.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


