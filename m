Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60762C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjhULqYYe7aqWqvOdN5jU6JmlKc3RFwCqnUuIsbeyD4=; b=uUc7FzCGSX5ZaEFp4ZuAmy+gTR
	x9124eqt4qQGmQ47JeKi4cRC4PsspTIjOqTYuPNZfG9YyzoYsFVdwMU/lbJ9ORMF1BwuVkIemioJP
	+wk294ZOkv1KNQuWBPGZ7m9x2KCN6NsxS9icEYUrT2cOXbxVRMvIDw5ONS6zX4OlH/dFsOb2i8LGF
	cNZVT496kMONSeG4hLk01vddx5HSgFnL0Hm22lzI2LdJc9T19L9s4xlWpoNU2ZwcphAPQ/j6Rqlk6
	Q+IZix/5uddea/Rr6rV9/3pPQidf0e2MDxgKqwIkdg7+q3MOG5Q87RhGvtLnfDrReWH9AAfy9CtL+
	R61QUFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewW1-00000002Mq0-3mOU;
	Wed, 01 Jul 2026 15:06:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewVz-00000002Mof-005h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 15:06:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3D2964E40BEF;
	Wed,  1 Jul 2026 15:06:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A64460288;
	Wed,  1 Jul 2026 15:06:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89E6C104C9645;
	Wed,  1 Jul 2026 17:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782918368; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=BjhULqYYe7aqWqvOdN5jU6JmlKc3RFwCqnUuIsbeyD4=;
	b=JLv7Ai2yY6blvstUvW3ztpWuaqzlMgb1OZsGbyufFN0tuKY8MF14/EhvfK0iqJTIXYxXlC
	iMcc82BsKs1eFYCi64PUIyx/sgXkAePL9LOu99ZRKfga6KlmHwH2aAnm3C7Et2GJATOKU8
	baSQvvz2LReir8Hs+pjfJ0l7W2Vnv3cZT6azWlATwKH0gIsABHhGjZBjPL2qexVbZoTjUg
	ooOYoyhyobJJHbxIKLSPAKArlZlbBwMgNk6k0osnpkyLmMpRPGM8NDM9FIHsvs6Pk9ZJQA
	K/ChPLWTCUx4tc+MLKzOS+tVJE0cgRDIxwgB8LulUCm3txoxgRX73ne7mtMbgA==
Date: Wed, 1 Jul 2026 17:06:04 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add sii,wakealarm-output-pin
 property for S35390A
Message-ID: <202607011506045358209c@mail.local>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
 <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_080615_174689_B08AFD35 
X-CRM114-Status: GOOD (  19.66  )
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

On 30/06/2026 19:22:21+0000, Markus Probst wrote:
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
> +

Ideally, we'd get a proper pinctrl driver part for this because what
happens if you want interrupts on both pin or clock output on both pins
or any combination of interrupts and clocks?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

