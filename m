Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF49C44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB+cpqmLQ5TvquFyBkVqXjC4cUU8Rx0rLzive8Z2Klw=; b=d+k/m2R/kROggSo7YRH23vpJS9
	Xw2MAhmCCK8t3A30WBeMfgENMKokqbmvm8JjRIVSR5vmDKd8zFiz0XwxRnX+PGOH2E4Lv8WVDFU4Q
	arSx3PYsRVWhv7D4SOIOZ+daU1uggCJx8t4cK2bKcEb7zM7ZS9yA2o9EuInXf4H7onU77LR3o2MvK
	Jn8Fp9IBbY9hwCXIxaHz/SAoUdWcCJwXdkJpAV8s1CdHOy9KZBqrUFitvAUeD5cmn9yi/ZM5KlelW
	kyRdV7F702qxUhjAj5OJMrZNFT7tZwG0eOzoBwZEGSIS/7hPvsYdqzVhR/In2lvOVPHq3YYwY2hHW
	8J835drA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiDt-000000019pV-32UD;
	Thu, 09 Jul 2026 06:27:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiDs-000000019oZ-0Yaq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 06:27:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29865601D9;
	Thu,  9 Jul 2026 06:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E3F1F000E9;
	Thu,  9 Jul 2026 06:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783578418;
	bh=nB+cpqmLQ5TvquFyBkVqXjC4cUU8Rx0rLzive8Z2Klw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=FIchCuaJZfI3hMERE7nFlfjJMObH+5Xvhdauf1jzYaSKlEWnVskZzT+A78UIbRvq5
	 wxX+Lj6NdAv6fmgEz7gmZRbcpWoL0H5ZOAUfUVLb+tCYqyTt9DtY+VLdqe/hWecZZ7
	 x+7hx8UmZPZZBe0cqHE9fbbc5WMpOYXp4/UcfZMBwbv6bZSr4tIRa041Jsugh59nW4
	 f4A653EJbP2EOuI/oF2QWANakQ/8d52otcMD0vQiDCqnB0qoiH15X4BvucK4XifodR
	 TYwpv8IvqGGplFixKe/hAJTV4ig986fgATtQiSBhanBMj3DQ6HDk9hdOy0ijLJtnWy
	 OKcbsOkxm3SYw==
Date: Thu, 09 Jul 2026 01:26:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org
To: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
In-Reply-To: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v1-1-00f88f42930b@cn.bosch.com>
References: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v1-0-00f88f42930b@cn.bosch.com>
 <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v1-1-00f88f42930b@cn.bosch.com>
Message-Id: <178357841806.2262413.17682316564929970184.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: imx: Document calibration
 offset property
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


On Thu, 09 Jul 2026 13:43:27 +0800, HaoNing Cheng wrote:
> Some boards need a small per-design correction to align the reported CPU
> temperature with board-level measurements.
> 
> Document the optional fsl,temp-calibration-offset-millicelsius property,
> a signed offset in millicelsius that is added to the calculated sensor
> temperature. The property is optional and the existing behaviour is kept
> when it is omitted.
> 
> Update the binding example to show its usage.
> 
> Signed-off-by: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
> ---
>  Documentation/devicetree/bindings/thermal/imx-thermal.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/imx-thermal.yaml: properties:fsl,temp-calibration-offset-millicelsius: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/imx-thermal.example.dtb: tempmon (fsl,imx6sx-tempmon): fsl,temp-calibration-offset-millicelsius: -6400 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v1-1-00f88f42930b@cn.bosch.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


