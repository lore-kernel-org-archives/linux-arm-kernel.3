Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA17C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 13:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52yYloJE8V1JzcU39yNpMtvB1l1P9VRylhZ6UCVZjpw=; b=olHvLB37vSfuJANGxr6+u9Fc6H
	AbHm7YkiJy+nSeR4/N2O70PdMUWxYEIOSi3eqVVbp4A/6nYnJ7v7IW1xPZ2HzT/AG+JbtoveVavTU
	uP2PWh7Bg+boNzAwGaGQIDmmleTRbR6vwsZAEWP7J4mTk2n+ci4Yyh7pmRAckq8nCB+tBD7lfaPhu
	z8bwRkVlYrdrxO4Hbr22IrA8cZTD4nclCbqGwEVDM989pFmFJMzW928PVLTcBCrR9YvfOd0+7UCoZ
	4I2+GEFBzFcXiYll0R9UPOA4oqOmDibZEu5+6Jm/KIAudrr3qVM5dTr+caByePnJPyZalUEX2LgsY
	/uVphtpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjIHe-000000009hR-3qsy;
	Sat, 15 Feb 2025 13:32:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjIEn-000000009F8-3mAQ;
	Sat, 15 Feb 2025 13:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B70BD5C480F;
	Sat, 15 Feb 2025 13:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6B3C4CEE6;
	Sat, 15 Feb 2025 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739626180;
	bh=v07NLwnORgC/H0e++oVg4DTMt03GjGLqNa/Cm3BNWRA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Hb0Pa/AE/uEFOEjiqZQqXCQIC6iezuOQhOzemPZ8XUsa5o4VY+JOmYPsL3Sm8DIh0
	 13vDy57PVgWJ6X+DD+cWu8y518LiatTqdJOWgr/KZKNRM5jCcITxRFGzU2ch5+agCO
	 SAlNCYI6yJjmpRCS5hE43b3jfFSDbyeYmH0mp5Ps0wmioKjbnhMpBYatTjYXN9vm6F
	 Sk8hoQ2ZJw9xRD3Gff1tY95k19SjFLW9syR2qKbIfv7bAiCHkhQrXtnqW9wP5yyfAr
	 ACPenKhj8hhU/XVkkA1RX0UYniYSkGvjfIBMW8WVmj+szM57d3EEVQyLiVzDh7wMIq
	 9ZAlGsSAoV18A==
Date: Sat, 15 Feb 2025 07:29:39 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250215122409.162810-3-ivo.ivanov.ivanov1@gmail.com>
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-3-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <173962617803.765517.17948286888997426214.robh@kernel.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: phy: add
 samsung,exynos2200-usbcon-phy schema file
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_052941_992258_3672E2AB 
X-CRM114-Status: GOOD (  10.62  )
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


On Sat, 15 Feb 2025 14:24:07 +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC has a USB phy controller block that controls the
> usage of USB phys. Add a dt-binding schema for the new driver.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250215122409.162810-3-ivo.ivanov.ivanov1@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


