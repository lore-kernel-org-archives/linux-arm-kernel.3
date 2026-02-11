Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A06EEB596E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 07:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekwU2eOw8Ug7JuWGM23DP3Zt8xIe9aWbc8KSy6O2ZiA=; b=j3+rS4o/7eYKq4tEj/T2dVX5Em
	7ef68KI2qzGTwfspP7Dt5UBSMBHtJ0qfe45PqUAu7RnqPvhTYCqieNvG2a4KsNlxDEHLc7nZl0dlJ
	RyaAZtHzFMKNBbZn+auIjSLA9807If4mW34UUJtgHp5X/ZQZ5GbAYj6yxLseQ5D1tLTBw2x8HshBi
	MQd+FyM6DUS6iDtPwQA0/KBDjz1RIHFGqALWTiQsodWHLX1fAEFnR35nxZ447oyncLCyGUIEGW6S+
	ydYkl+m2yCClV9HSinSMToaKdLDVPJenqrA7ZhoKfvifkJwml0CP8jANCH5+So5b5vUOZEXHGwynZ
	/t9LgUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq4JZ-00000000JhR-3vLX;
	Wed, 11 Feb 2026 07:07:09 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq4JX-00000000JgT-2nDb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 07:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770793620;
	bh=ekwU2eOw8Ug7JuWGM23DP3Zt8xIe9aWbc8KSy6O2ZiA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P9M0s6tmcbwCi6R7qtb9G7n9zjrlhTdWDjrCSNhFhzlYolQSCANRFcMHilkBkkoOH
	 8C5d/18JDioaWOfFnBe2EfO/xlBqrzgtBJAguPI3qj1EYxv7Dmr02z8pkSxyfXNGLT
	 csWtmJ1Dc9ePK7bk/9tlbaS/74ddev/TnjVEHKUALXGsFrOS4S7plZBx++8fxXhrVN
	 cyFEYZlQkcA+/xsPsE85UoTevoL6bMD6PQN9OJaBLQr65pYpJL5fJEtrpL5Hmov0wX
	 KqSDB4BjiWyVO2czOwvkUksWj133s+z8bmHW8NTQFEEyaY5vfYClOdMHmHyQbM0L35
	 /9wVgqf3VefZw==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BEB226040B;
	Wed, 11 Feb 2026 15:06:58 +0800 (AWST)
Message-ID: <31a3283787df06b7b44796ef78cca3fd380ee18d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 1/3] Add compatible strings for AST2700 pinctrl to
 the SCU binding.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Conor Dooley <conor+dt@kernel.org>, 
 Joel Stanley <joel@jms.id.au>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>,  Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, bmc-sw@aspeedtech.com
Date: Wed, 11 Feb 2026 17:36:57 +1030
In-Reply-To: <459f84c56a5010910ecbf8b445c092674f060691.camel@codeconstruct.com.au>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
		 <20260120-upstream_pinctrl-v3-1-868fbf8413b5@aspeedtech.com>
	 <459f84c56a5010910ecbf8b445c092674f060691.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_230707_906955_599AAC12 
X-CRM114-Status: GOOD (  10.54  )
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

On Fri, 2026-01-23 at 17:03 +1030, Andrew Jeffery wrote:
>=20
> Going down this path for pinctrl to fix the SCU situation will require
> some rework of what's already merged for the AST2700. However, we've
> not yet merged either a DTS or DTSI using the compatibles (and by
> extension, aren't using the AST2700 support from the drivers), so I
> hope that allows us to do a course-correction without too much
> collateral damage.
>=20
> A possible path forward is to:
>=20
> =C2=A0* Move AST2700 definitions out of mfd/aspeed,ast2x00-scu.yaml into =
one
> =C2=A0=C2=A0 of:
> =C2=A0=C2=A0=C2=A0 - soc/aspeed/aspeed,ast2700-scu.yaml: Follow the examp=
le of
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mobileye,eyeq5-olb?
> =C2=A0=C2=A0=C2=A0 - arm/aspeed/aspeed,ast2700-scu.yaml: We already have =
e.g. the secure
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boot controller documented under arm/aspee=
d
> =C2=A0* Retain compatible strings but require simple-mfd is not specified
> =C2=A0* Rework AST2700 support introduced in:
> =C2=A0=C2=A0=C2=A0 - drivers/irqchip/irq-aspeed-scu-ic.c
> =C2=A0=C2=A0=C2=A0 - drivers/soc/aspeed/aspeed-socinfo.c
>=20

... but perhaps that is too much churn for this stage.

Krzysztof: If you think the rework is worthwhile, let me know and we
can look at that design, otherwise I think Billy can proceed by
incorporating your current feedback for a v4.

Andrew

