Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CED0D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cNY+/FUd/IBV/h9UWHNCoCWcoOb2X9BnybSWYJUhIw=; b=A22Dynd2N1AlVh2sxCnL2grH9p
	9DYfGWe61HI1zMUxYY6k14LzfAbPeYyTMFjRkJm76OAh+iIrFqQaT7jdF60SHFc6ekCUQoJaHfbwX
	IUcUglm6tKqw6vkc5gVKgZer0FSImBQR80fx4Wrm1gumiSojLNL2O1L4q6zwOnmgqgQNg4sB0HWxS
	khfCnX8Yq8Ea+CiE9bH/fLeqarz4QK6zMidRdsQiC2xA6NV+8B+InRkUSs7MCGUg0NFB7vEo/xJY5
	2iB5O7iPBs/tYQq+L19bF9USIdYkGlyAFP7BxXUf8wLCl9AZ+p8K97n2tsFZqiPvHWHqpUvfj7Qio
	fWhBooLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvYf-00000000HXT-1QfU;
	Fri, 28 Nov 2025 10:18:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvYd-00000000HX0-0qdY;
	Fri, 28 Nov 2025 10:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B45041ADD;
	Fri, 28 Nov 2025 10:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46EBC4CEF1;
	Fri, 28 Nov 2025 10:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764325110;
	bh=MIRw/XQDzki0yYk9yy1qFYTV+4LJdxp2n7mtv2S6cJE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VJtCBMc2puZK2SPkOBZugVaKh3d/nnUAb7qHqvNxAXOWa6wj3Puvkzimrf+NZv9Rn
	 9vCOWwDm+XFqxXpWCEXkL/TcIdLa3/UBCUsDgP0Do2rM52L4R5xhFB2+HnHv1kReW5
	 TlzaDl+Ua+Ag19kX0JhlsavflsPsdfgYZFyFdqn3OoAPbwcWfRe/OAZpSEl5INjm/A
	 +P5s0kKx64+c6x6xD8EFq2bE4G4QCrlzyyKwLaSN7TGSmOKWWwLYdi7F9v0ZobNrGd
	 JnC9koZoG64iFFQ2RYZnVTPtHmZgaWAP7v79PpYU/szDsRFXYcJWTFRABfMlfhCY3w
	 BwchZ9RkC+8ew==
Date: Fri, 28 Nov 2025 04:18:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: james.tai@realtek.com, cy.huang@realtek.com, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 linux-realtek-soc@lists.infradead.org, stanley_chang@realtek.com, 
 linux-arm-kernel@lists.infradead.org, afaerber@suse.de, lee@kernel.org
To: Yu-Chun Lin <eleanor.lin@realtek.com>
In-Reply-To: <20251128090825.27365-2-eleanor.lin@realtek.com>
References: <20251128090825.27365-1-eleanor.lin@realtek.com>
 <20251128090825.27365-2-eleanor.lin@realtek.com>
Message-Id: <176432510804.1675441.8031317541737023322.robh@kernel.org>
Subject: Re: [PATCH v3 1/2 RESEND] dt-bindings: arm: realtek: Add Kent Soc
 family compatibles
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_021831_285539_F32BD9D5 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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


On Fri, 28 Nov 2025 17:08:24 +0800, Yu-Chun Lin wrote:
> Define compatible strings for Realtek RTD1501s, RTD1861b and RTD1920s.
> 
> Additionally, convert legacy DTS-style comments to YAML description
> properties, following the pattern from the ARM bindings conversion series
> [1].
> 
> [1] https://lore.kernel.org/lkml/20200622125527.24207-2-afaerber@suse.de/
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../devicetree/bindings/arm/realtek.yaml      | 42 +++++++++++++------
>  1 file changed, 30 insertions(+), 12 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251128090825.27365-2-eleanor.lin@realtek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


