Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2A8E77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 00:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJL0PVWacK+xGubdB8yj8Qufnec/nGx/Vtx+xf0kBaE=; b=fuvQQMLrR5EpSx8JQ8K30KiWID
	eg58ksobaTSzzIFV0etMKzdThuh3JVGTD02xciO0ulNE5GC4xV4xSy5RpXj4cINLoatxUvG1g0AkY
	OW6ZJymcxUY1TGrPbIRGdP1m9fvcntlTHHo/j1311Ve7GIzi1x1cDL0gWUqDQU3TPA9JLenLMH9XM
	SGyoIVI2/dSc98OmQ9tn4/zWMKoBzLcYeA/zJbAt8sQVPCMnYZNCaQKNgmK2YLIiV6Q/Jy72nsfJR
	4kajBKxjULvAHK97drISqph5xdiBHeGN8rGd22UVxaH8jZEQi3DMGjdT87I2r2cnyveOXZ9mtVkQS
	3cRQLsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVK6g-00000006eGi-1KEM;
	Wed, 08 Jan 2025 00:39:34 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVK5T-00000006e7R-0kBr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 00:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736296697;
	bh=iJL0PVWacK+xGubdB8yj8Qufnec/nGx/Vtx+xf0kBaE=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Ss4Pa9yAg+I0HqIcKHvJe+cy/0dMiwco2Svs0rc4Opbo20D9bjGWBPDN05vZAelEa
	 jrqGK0WVwuNuORPVUrkZtXgzuVEb3iXrfk1HpFcIzmZT81Rq45P8CAO0Wyh2h76ZeL
	 rfC6iatuQuUFTQr405VBoTrgTkACXqSJYP9jGmjYJoxfINUzqJSLgLMdS3TFdgRhg4
	 KJ+bIvn9r0JSKGT8bCt0PIbaJK+8wO2ib4cJ0O20Z6J5v7CeWUhq3WssZjOJHOXS/P
	 gA1hgZRrtnhvKv+vPl52l75USr2KmgTWWEzzYJcWR4qe/CtVVGBrNZ6kTc+UZlFJBp
	 FFfxprNQ+HW4A==
Received: from [192.168.68.112] (ppp118-210-64-24.adl-adc-lon-bras32.tpg.internode.on.net [118.210.64.24])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 96B7E70B92;
	Wed,  8 Jan 2025 08:38:16 +0800 (AWST)
Message-ID: <f7619bff61f400faa2174e8a861916ce4f68c4b4.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Correct indentation
 and style in DTS example
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Date: Wed, 08 Jan 2025 11:08:15 +1030
In-Reply-To: <20250107131108.246898-1-krzysztof.kozlowski@linaro.org>
References: <20250107131108.246898-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_163819_426416_8C095E49 
X-CRM114-Status: UNSURE (   8.79  )
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

On Tue, 2025-01-07 at 14:11 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces
> and
> aligned with opening '- |', so correct any differences like 3-spaces
> or
> mixtures 2- and 4-spaces in one binding.
>=20
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0.../aspeed,ast2400-vic.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 =
+++----

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au> # aspeed,ast2400-vic=
.yaml

Cheers,

Andrew

