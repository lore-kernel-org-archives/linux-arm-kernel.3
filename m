Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C33CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a07AlzEBsjaw0D7q9ZWc3mal7xVaRUPY1G/jmENFoZQ=; b=ReqqWgSt/OW9D/L07Ope8CqOuE
	5pVyVBQGQO0xyU66vEqYOA1lsyWBrMNrbFhlY/MqVrGRT81sAyO5TgNwS3hsLNGzISe9Ssl4Ss8LA
	Gh74QKF/maxt5K/Rh3EaIL59bdIv0QqlXoooZM29YYUJDaYFzDtuOe11XyObIxKrrwaOLVB0fuJwL
	S1fAh57EY8DetxxtWNA5VwhaytvacklGmtfwUJWr+aX6gyFiAjkHJbXOGC60h8EKfNH58TQH+XiNf
	eXsAjNWoHfimNuyvl7ZKhr66ekINLfAXK2LTC5x6LtBHINksbF8Ur1p8KJvGLCEUA+McPcEOLPU43
	Z+G8n4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7B1S-00000006nsN-3gbV;
	Tue, 22 Apr 2025 10:38:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AVU-00000006fyT-3CqV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6716E614AC;
	Tue, 22 Apr 2025 10:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4C3C4CEE9;
	Tue, 22 Apr 2025 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745316335;
	bh=MCyas/ZQmYRO09vMAKd2USMq+gG5S05o1bktOFmHhNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdgRI5u2eSVDkgPTyjkZeU9I2EZJMTtkmgGFzP4nGBa+cBskbl3uPU+QVvemp7Wi3
	 xeO6ReDhaeJPrA1YOGZDQ5rt5yxJbyhavge4ibVUbYmHsrY0KKVZoaN9zSjIF/dPSW
	 TlUjjDUguI4NB8dOsfUcKJUQFx1PS53+dPVmS14eOjeFCIM+lC9L/SY+Tc5IvIVbPF
	 uEwx3pdOoTz3GxGpPtr0qqAt7mAH1BvVM/ohs862zQ5ozkhy7gitskklDI9JMc1QE+
	 VR/loMlqCBpT5DYXb8dG3MTCOvHSeo6/MWfu9UMQgqzOqJVq64fp6wFmm+9BJLVMQ2
	 Tj1O6BHLccrSw==
Date: Tue, 22 Apr 2025 12:05:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thomas Antoine <t.antoine@uclouvain.be>
Cc: Rob Herring <robh@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: power: supply: add max77759-fg flavor
Message-ID: <20250422-tireless-swine-of-fascination-6eba8b@kuoka>
References: <20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be>
 <20250421-b4-gs101_max77759_fg-v3-3-50cd8caf9017@uclouvain.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250421-b4-gs101_max77759_fg-v3-3-50cd8caf9017@uclouvain.be>
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

On Mon, Apr 21, 2025 at 08:13:34PM GMT, Thomas Antoine wrote:
> +allOf:
> +  - $ref: power-supply.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max17201
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max77759-fg
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            minItems: 1

If there is going to be resend, drop minItems.

> +            maxItems: 1
> +        shunt-resistor-micro-ohms:
> +          description: The value of current sense resistor in microohms.

Property should be defined top-level list of properties and in other
variant if:then: you disallow it if it is not applicable at all
(shunt-resistor-micro-ohms: false).

Best regards,
Krzysztof


