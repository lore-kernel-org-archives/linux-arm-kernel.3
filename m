Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C95C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgTLQ8uwman0lLyw9cc4IPWO6BS2HmXsRVj/qpzG7AM=; b=OlqOZ2C0TqlddMwMcmKC3/85BA
	9Fz8l8uVXd+Z+L1fbntM3d0Qupm+XvuMgTk1cDbZ9LeD/aURj/D9Q0/8Z5Zr49rSh+aTHFknsftUq
	dqR3wBQFbgirn3r//7aBCHYnqXBFVgxusd+2VJiHfIf8/QZXM4Z57zQximc7LD1Kq9+/TMSgyvdw0
	97Yjio/6wv/t3tWzsIufHUlirx+1hwBtowS2YLRoci3ptvP4u2w/jm+33EkHfmJSphioK34ytdMLj
	uTnRPCIABR/jGAs2RWZVC9vxWgabfLW2kkyaOA39qUOJggMpUCyqXkuMvUcob4Lf+BJukkMFGD8WB
	7QK6cOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjD4d-00000008kvE-2IDK;
	Mon, 13 Jul 2026 09:35:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjD4b-00000008kut-1UES
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:35:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EACF6004E;
	Mon, 13 Jul 2026 09:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CFC1F000E9;
	Mon, 13 Jul 2026 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783935336;
	bh=GgTLQ8uwman0lLyw9cc4IPWO6BS2HmXsRVj/qpzG7AM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=LJjWcwCpOVWguIJ8+S6Ex3xdAJSBzh57FCfNLUBAfs1hYUYICauAG9fLUO2DbWWQL
	 wDStrijG+9ypPEQQvq33DtfiC2dOplak8cVIzix3BEiioPKyyUQo1ogZn9zqQ51NhH
	 spbXn+4DK3s1JNvdi/Q5ITO1+aS7IJ2GpTTH5oYXeKnBx5IWMJi/NtiIOo5SppG7n1
	 ZVMesfuCl8BE3TqUUBvl5idFY2rkKpIuJT2QTLSYNoCIOzzq6NfDHMa+raoHma1Y7P
	 CC7DtX9ATgOedLyUmXDTq5Uv3KYI3QTTcu4hcKi9ykxFXQQm0XpjqzER/qDv9+MTFu
	 jwqmb7e4mOwdg==
Date: Mon, 13 Jul 2026 04:35:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: nuno.sa@analog.com, dlechner@baylibre.com, devicetree@vger.kernel.org, 
 cwweng@nuvoton.com, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, jic23@kernel.org, 
 linux-iio@vger.kernel.org, andy@kernel.org, linux-kernel@vger.kernel.org, 
 krzk+dt@kernel.org
To: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260713081127.115197-2-cwweng.linux@gmail.com>
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
 <20260713081127.115197-2-cwweng.linux@gmail.com>
Message-Id: <178393533549.3982391.11335351167555265751.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
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


On Mon, 13 Jul 2026 16:11:26 +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> Add devicetree binding for the Enhanced ADC controller found on
> Nuvoton MA35D1 SoCs.
> 
> The controller has one register region, up to four end-of-conversion
> interrupts, one functional clock, and an optional reset line. The
> binding also describes the optional external reference supply and the
> optional DMA request supported by the hardware.
> 
> ADC input pins are described using standard channel child nodes. The
> external ADC input channels are 0 to 7. Differential inputs are described
> with diff-channels and are limited to the fixed hardware pairs.
> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
> ---
>  .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml: properties:interrupts: {'minItems': 1, 'maxItems': 4, 'items': [{'description': 'ADINT0 end-of-conversion interrupt'}, {'description': 'ADINT1 end-of-conversion interrupt'}, {'description': 'ADINT2 end-of-conversion interrupt'}, {'description': 'ADINT3 end-of-conversion interrupt'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260713081127.115197-2-cwweng.linux@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


