Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC1DD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 09:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmOI5XkCdt6aFWYWwPrZQnRrS4RuF9Zn0GXPXr/VsrM=; b=d2dtU3289T18c3TMRpGChwcAWe
	cIRqeM5UO1jbxIhz+5huhVuL4wVOJcM4fMKXuP/sbs+/p3Dc7DHMHsvapGjxBeUglA2/lVmLutFmb
	qAYClnb9y33jeleBp/atdsxDBqsrLtV/DYrpCUKTbPZ7eKXdBWmvbqBhYf1TEgh2eoXoHFOfRQOkM
	SGxaWxuJLxWiMRUkSpvIz+zlHeo8PB1bfat584+ZrOy9e5+gHfzixoVMrda9S/R8WsfEiud6PKfXa
	aF6cpJvZYtvY0GZmy0UNpDxBQiPy91eo70jZ+HeNxluXiwlO95rbugmFRun2WghJUI2lwAjGmanH2
	94g0t7DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ03I-00000003CUA-3ibE;
	Mon, 01 Dec 2025 09:18:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ03G-00000003CTK-0K8J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 09:18:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9594444D0;
	Mon,  1 Dec 2025 09:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83074C4CEF1;
	Mon,  1 Dec 2025 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764580712;
	bh=0Zqtlj0hA/RG41hc9tgzKQYiuOnCrhAHK7oTRiFyuG8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=gMh9w0N6YiLvFrXymf5nb0oS8UxZo5B8fkAvQWYN0Q3U8j20rslyOcv2ib0tgzJTB
	 KUllD62g8OudNDwRwMW1hFxpB21qbZf1+josr71+hKKdRoA8OjVGl0G0WTR7A1n14S
	 LmM8mttp75yt/LMvAF0nMp46n9Ybt+WzLi87EFrCDMz45YshlMsvG5dKj94+L5R+1T
	 CWXHTpcz3xPcQe0L/4/nHSGeggbARky0xPYhuQdUb5pKZownvfyk1W7KpyJuXQBqUO
	 EbgvRdGyKT/nckFglFIEX19EdDNmrW4ywzH307O6ac/VYZ+LBMRKyDUtMMo6eNQE2H
	 DlYls8ndrohDA==
Date: Mon, 01 Dec 2025 03:18:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 wsa+renesas@sang-engineering.com, nicolas.ferre@microchip.com, 
 romain.sioen@microchip.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org
To: Horatiu Vultur <horatiu.vultur@microchip.com>
In-Reply-To: <20251201082629.2326339-2-horatiu.vultur@microchip.com>
References: <20251201082629.2326339-1-horatiu.vultur@microchip.com>
 <20251201082629.2326339-2-horatiu.vultur@microchip.com>
Message-Id: <176458071087.2473678.8963589050190334759.robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: at91: add lan966 pcb8385
 board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_011834_158409_EA00F54E 
X-CRM114-Status: GOOD (  10.47  )
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


On Mon, 01 Dec 2025 09:26:28 +0100, Horatiu Vultur wrote:
> Add documentation for Microchip LAN9668 PCB8385
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251201082629.2326339-2-horatiu.vultur@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


