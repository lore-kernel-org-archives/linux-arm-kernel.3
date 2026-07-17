Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721FBC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHnjMIAGRm2ejsywkpInpP3dH/N1dPQydtPOOeL+IoE=; b=TA6ZavPFibGTUPJWNSWk+SqlPp
	lsRz19/FOl1VJbX3YaFWqmOf0690wWEHyfI/isjaZW5V3eaypbrE+tVzlihUJR/Q1/QONQkP9ftYs
	NSaw8LJUX0wfTnsA620jp+L6anPuVaSLIB91B6uGrVO768SMBoz1yVUbg05j2wKZzKbPROBAoMkj0
	46pI8f4QiQ+fSvvoiBFCpVtroqI9RGoqAuM+GiU3anhBaUDIOWwDMO+6ReKo9gRdNPEgVTuG1/VrN
	uV5vqwYHvFl8j/Jffi0a0HIMmEo0GwtRtYWCQJbaV6hHkPDK+rJ2gOouJrV5pMtFtzFbO44cd7Rci
	qQ92IV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkegz-00000001oN6-3J8f;
	Fri, 17 Jul 2026 09:17:13 +0000
Received: from [2a0f:4ac0::3a11] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkegx-00000001oH0-3yW2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:17:13 +0000
Message-ID: <5439c27a-84c9-455d-9c2d-be84a37469fe@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1784279814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tHnjMIAGRm2ejsywkpInpP3dH/N1dPQydtPOOeL+IoE=;
	b=p0YeJ7J5SHfYAAl34NLbf0yPli175elPbpLSRPmFGKTsrMkQgqwBQvdM1sVdP1rjJIYQQS
	iEld3eWbyM4t71a0BQ7o2xqdyxD2oMSj1nqb7Q+AjfIcdtqxtIaEQr/0yoA3mWbYj88keW
	Z4cbd3/7xkEdcCsUnyiUu1Zsug2+9c0=
Date: Fri, 17 Jul 2026 11:16:48 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 08/10] dt-bindings: pwm: apple,s5l-fpwm: Add t8132
 compatible
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Thomas Gleixner <tglx@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 Sasha Finkelstein <k@chaosmail.tech>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
 <20260705-apple-m4-initial-devicetrees-v1-8-e5655ee56523@cyberchaos.dev>
 <alj0EbuIzZUa48di@monoceros>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <alj0EbuIzZUa48di@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_021712_163972_260D275F 
X-CRM114-Status: GOOD (  14.34  )
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

On 7/16/26 17:11, Uwe Kleine-König wrote:
> Hello,
>
> On Sun, Jul 05, 2026 at 03:17:27PM +0200, Yureka Lilian wrote:
>> The PWM controller on the Apple silicon t8132 (M4) SoC is compatible
>> with the existing driver. Add "apple,t8132-fpwm" as SoC specific
>> compatible under "apple,s5l-fpwm" used by the driver.
>>
>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>> ---
>>   Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
>> index 25ef04b60ca1..c85a2b85a66a 100644
>> --- a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
>> @@ -19,6 +19,7 @@ properties:
>>             - apple,t8103-fpwm
>>             - apple,t8112-fpwm
>>             - apple,t8122-fpwm
>> +          - apple,t8132-fpwm
>>             - apple,t6000-fpwm
>>             - apple,t6020-fpwm
>>         - const: apple,s5l-fpwm
> There is no merge plan specified in the cover letter, but I assume this
> should go via arm-soc?

Yes, this will go through the appropriate -soc trees since there is no 
driver change.
Sorry for not mentioning it in the original cover letter, I wasn't aware 
of the procedures at the time.

>   In that case:
>
> Acked-by: Uwe Kleine-König <ukleinek@kernel.org>
>
> Best regards
> Uwe


Thanks,

— Yureka


