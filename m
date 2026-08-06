Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967ABC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFv2iJY7nFCn3LAnBmQhdsOf0WSz+DzcRO1lvKl2Q2A=; b=dIlSc9QgFrQqiamIwO08UMrQ1J
	pEqJbHFpUGpNVt5kmrFrZknuEFEKf/2M6YyzmUulPNNguYVP03tWrsABk67FLObjMK4ADQPMrm1yO
	lqi28pitHTkAso0WdkHNwn0bjEDGdJY/Rtv6Ot6e5xY2pu7PepTL6i8ah49ype1SJhEbzggQS59am
	EjfWa/Yf2p4pdJ0A2/O8PIkx06pV/NOPjgWhLFYDOUxR9SipZ2tGsbOS6MSenFU0f9H7JVPlVAQG8
	3RoBbGn59gGO6kOAO+0DArYA3KMXYL6i2H3aXpkew7i8+O8kN69g9V8N7PXNT3TZTzLo1vtWTW76L
	hdPs1aIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvXQ-00000005Zvg-1EPn;
	Thu, 06 Aug 2026 10:41:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvXP-00000005ZvV-1BiH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:41:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5532E60A64;
	Thu,  6 Aug 2026 10:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDB41F000E9;
	Thu,  6 Aug 2026 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786012882;
	bh=tFv2iJY7nFCn3LAnBmQhdsOf0WSz+DzcRO1lvKl2Q2A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=LOVpehUxOOI0m/Jyi4E4q/irl+rgL0EGvfyDGvkfnioyBMD3G2NkRRLu6bWS2CcmE
	 2rnVXbnMghyrkb5qNzt7ngA4HKgavgRiVdFoKi4WC1B7WZCyPPAlnnejk7Pk1Bs1qd
	 elXzOLQ37I+3qYLyQW1EPXjj5dDNsUdUjv1X9ccTFjBSCKJ9LZEnVCs7HvobwSwlcL
	 KizhiraQ8n8cL6rQ+mX9dfvqGe/5HvqCBPY7RscYq4cMC3vMsEiur6gRxyRfxawbin
	 aCqvP9HYXFBC0w4w3YwZ1QK9wpyA2AOdNd1TnjtzHB/XnWG7XKoU11j4EIJuZ0EKLe
	 hVRWJvp2J4WKg==
Date: Thu, 06 Aug 2026 05:41:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 linux-pwm@vger.kernel.org, Harshit Shah <hshah@axiado.com>, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, Karthikeyan Mitran <kmitran@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Akhila Kavi <akavi@axiado.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <20260806-axiado-ax3000-pwm-fan-v1-1-f6db4cf2166b@axiado.com>
References: <20260806-axiado-ax3000-pwm-fan-v1-0-f6db4cf2166b@axiado.com>
 <20260806-axiado-ax3000-pwm-fan-v1-1-f6db4cf2166b@axiado.com>
Message-Id: <178601288105.794443.11219080206181724677.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005
 PWM fan controller
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


On Thu, 06 Aug 2026 02:01:29 -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the PWM fan controller found on the
> Axiado AX3000 and AX3005 SoCs.
> 
> The controller measures fan speed using a hardware tachometer block.
> Fan speed is controlled through a PWM signal supplied by an external
> PWM controller.
> 
> Add a MAINTAINERS entry for the binding.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  .../bindings/hwmon/axiado,ax3000-pwm-fan.yaml      | 68 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++
>  2 files changed, 76 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.example.dtb: fan@33001400 (axiado,ax3000-pwm-fan): reg: [[0, 855643136], [0, 1024]] is too long
	from schema $id: http://devicetree.org/schemas/hwmon/axiado,ax3000-pwm-fan.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260806-axiado-ax3000-pwm-fan-v1-1-f6db4cf2166b@axiado.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


