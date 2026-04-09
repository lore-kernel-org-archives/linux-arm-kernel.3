Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE49E9DE62
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZbQdVfmKFQPrvXx2OWfxO1ipd5MSxGipNTJmcP0amc=; b=tpW4fN401qvDdQG9R+I9gU98Qn
	CJI5eltqCSXmTTGFMsR8zb9r+RZfiHgLiUXQBmtRJ8z3FzBwRmOevOlXHv0qK8KVHq1VJQbotMkw8
	XFfaFkxM9L8DtXan/L/sTjZlxAbUuK8w8E8tf0nuC+kIhRuiqOsymC0S0JDO9rv79Y7HnSZTF3Cto
	Z97gYClc8c4vh3LaH14NoamlO88Adnez3GudvyuE/ipREbMt2yn/2BQQHYfOLnZ+mcrzU/7r/FLWh
	f82PP1UeI7OrRmphY2ktrJ1T5wy3nk1/cAdPaaoDX1b8A8iB+4+tGYwtwjNRu6nim7qMTlxMmH/R6
	qm8QANew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkVz-00000009v74-3vnM;
	Thu, 09 Apr 2026 08:13:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkVw-00000009v6H-3cbP;
	Thu, 09 Apr 2026 08:13:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3400141A2F;
	Thu,  9 Apr 2026 08:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89625C4CEF7;
	Thu,  9 Apr 2026 08:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775722404;
	bh=CgU7whiQMd3BptzzMKu/4KAdATHpRf7rC84jNQ/3l0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQnXBfz4tEMNrwlgBQmt+XZHESHzNgKRETe5j7yv52Nyy4kCGlgHfEov2kff4zfov
	 idfL+6y6wMUbGv0u28HKfAFrWFMF8PmKMIUXKOEHzYGbs8klp8+yYAdAGst8fzWBSL
	 LwNW586jTkmrq+D8J+RbP5hnhbKH9f/yI11/ut/FPcKutJIdqYh5qv5SqIWct5uEMG
	 v51hqf6T3pnvbo+i0BQxMh2XID1fP4S1MdxN462FRoGo+WWfmqVosjLJuP0/sKrsN7
	 +8qe1uraHN/Xps2wmYKagbFIyEwkWHFHOhbxBK6gmGcxzzd/xQ0qebfJF7vJMESUQn
	 CFHjXAo92atzQ==
Date: Thu, 9 Apr 2026 10:13:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: Add a binding for the RPi
 Firmware OTP register
Message-ID: <20260409-intrepid-discerning-peacock-bbf19a@quoll>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-1-e02d1dbe6008@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408-rpi-otp-driver-v1-1-e02d1dbe6008@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_011324_945442_E6E038A1 
X-CRM114-Status: GOOD (  16.51  )
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

On Wed, Apr 08, 2026 at 10:00:15AM +0200, Gregor Herburger wrote:
> The firmware running on the Raspberry Pi VideoCore can be used to access
> OTP registers. There are two OTP regions (private and customer). Add a
> binding for these.

A nit, subject: drop second/last, redundant "a binding for the". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> index 983ea80eaec9..975c8927d75b 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> @@ -137,6 +137,20 @@ required:
>    - compatible
>    - mboxes
>  
> +patternProperties:
> +  "^otp-(customer|private)$":

Not a pattern but just "otp".

> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - raspberrypi,firmware-otp-customer
> +          - raspberrypi,firmware-otp-private

I don't understand why having OTP regions is not deducible from
top-level compatible. I also do not get why do you need per OTP
compatible.

There are no resources here, so standard review would be "no" and you
need strong justification in terms of DT.

Best regards,
Krzysztof


