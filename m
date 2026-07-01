Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DEAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWZJoeJoNohkFigQwsvNlPCMXb9v9+Knd2dj3qEQhCg=; b=3RRwQbzrfrNzqoBus3h0kwDSz7
	zmrg10w1gGOSD4EAtrvEF+6eCeRwjVXbN6SijKkqTssGI1snyk+1XzZXpT9cL5ag6uUMMoKjjsQaw
	FT7AwjWJp5GGpSFHhelgxHXEO1LEodGKr5mQH2qF7jW7zM9Torcgh08xyhMo9gpD7Mz6rS89P95Q7
	Nfxng4yc7R4FKjDcrytoIN3CgjvNQfV2I2ZGaDhVo28TlYDKeqxfI0gd/kVVU/zvhL7WVCz8pLEi6
	siBlB4b6K0agDryXwz1UZw0ophpDhCJrrH79SIapUES4nHhYLAx5kjA5uqfXTduNdB9tixYwS1k+Z
	Nw1aHknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepTl-00000000ulh-0jjT;
	Wed, 01 Jul 2026 07:35:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepTi-00000000ulX-3M5j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:35:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23CE440A08;
	Wed,  1 Jul 2026 07:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACC11F00A3A;
	Wed,  1 Jul 2026 07:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782891326;
	bh=PWZJoeJoNohkFigQwsvNlPCMXb9v9+Knd2dj3qEQhCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h6dXafSUTFStFuOmQ9Hlh8cWTlu/uF8OU2bnz0hnFaE4kQ0BcAsdvY+1s6751nMc9
	 7LtVFV7eDmbyqrN2lxVQpefZsDQxlNjGB6RQI0aLNt+bxt7rHApl9XJRP/VLixDSpe
	 YpKdRW8XTGReHDQmywiVDtKebmgNtEh4pQpWw4edbxan8nx/2VBpEK+1VDc/RDgcMI
	 RuReQhGJRkXvorgYbnezB5fUr/vwb1CtZtEDQQq1d8R73SLaf1v2u98vb6C4sSWKEs
	 lqksyGJHJZDhQEOwurGU9/7VSZg0t9R2Qma7tWBg5A6qscjF3zRaKTeq49H1oHW75O
	 ppjneriYIgHpA==
Date: Wed, 1 Jul 2026 09:35:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add sii,wakealarm-output-pin
 property for S35390A
Message-ID: <20260701-bronze-jaguar-of-perfection-028bac@quoll>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
 <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
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

On Tue, Jun 30, 2026 at 07:22:21PM +0000, Markus Probst wrote:
> Synology NAS devices use the output pin for interrupt signal 1 to wake up
> the system.
> 
> Move devicetree bindings for sii,s35390a into its own file.
> Add sii,wakealarm-output-pin property to enable the use of the output
> pin for interrupt signal 1 for the wake alarm, which makes it possible to
> set an wake alarm on Synology NAS devices.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  .../devicetree/bindings/rtc/sii,s35390a.yaml       | 54 ++++++++++++++++++++++
>  .../devicetree/bindings/rtc/trivial-rtc.yaml       |  3 --
>  MAINTAINERS                                        |  1 +
>  include/dt-bindings/rtc/s35390a.h                  |  9 ++++
>  4 files changed, 64 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
> new file mode 100644
> index 000000000000..31a578673870
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/sii,s35390a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: S-35390A 2-WIRE REAL-TIME CLOCK
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>

This should be someone caring about this hardware.

> +
> +description:
> +  The S-35390A is a CMOS 2-wire real-time clock IC which operates with the
> +  very low current consumption in the wide range of operation voltage.
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    const: sii,s35390a
> +
> +  reg:
> +    maxItems: 1
> +
> +  sii,wakealarm-output-pin:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2]
> +    description: |
> +      The output pin to wake up the system.
> +      Default will use the output pin for interrupt signal 2.
> +        <S35390A_OUTPUT_PIN_INT1> : Output pin for interrupt signal 1
> +        <S35390A_OUTPUT_PIN_INT2> : Output pin for interrupt signal 2

Does that mean device generates the interrupts?

Best regards,
Krzysztof


