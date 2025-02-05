Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25309C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 00:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9dR3JEhqnb9OApW3VcHCh5n2riOWy7LJANruYsyTtU=; b=eaTFs3aMdAcisNlIfAoQfKv0Xq
	77w/De5f8dfO/T5/VmLTWLap7gCBUOUmyskqR38L5fRxED2c+hT6L5GS7psiFL19ajjnnoYAAYFBR
	kZoiqFMqPis6yGYpI3RscUc6l2RYHVhb1z2XYtIbKX2n0v7XhUlbRf6G/bXpiGkhxGQpCcJD9g0Uv
	46PvYWIE1ck2G+JCDBI/7u0LoNY9s0bUWdkyEpMb3ExyD2nmacIQGVQjf5Z8IoN+F+SkuH+6P7oPf
	rSbA+gWQKX1RV0Y6Fj0X88d/SGbN4Gl2lOmob64iyZ31+X5rG0bKaWDSlKCXrN1o6Qr/0xHqPN6C/
	OzvHCpJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSvQ-00000001sz5-3ah2;
	Wed, 05 Feb 2025 00:05:52 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSry-00000001sW9-1Vlt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 00:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738713736;
	bh=n9dR3JEhqnb9OApW3VcHCh5n2riOWy7LJANruYsyTtU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ck3e/lCEXFFuuoAL69bUJWIek/Bsj52kXXFN9+Kl+6EcYVipvo8ygxrtNA4uMA1rt
	 t8UHG4JeGtRi/K1MhrhztJoZrDC6WPv9ESbvBEmNQ8sDfoqES0Q8Dxr7DSXZaCBG7G
	 FsyjTczGpcz21wcVTOqimjz4E+oHG6J5ABSwcd5nm6vx9P3rhr+I7F5ee6nNxnEnhv
	 z9AOwwanF4AZO/zfrRJwdBAtop2B8lrKQ394MTiFEPsrMHRBCh/a84XlYfYJhvWiW7
	 a9/g7PIXNWyWs8tHO/8KTFCI8uh3UXtHQ6dmZyKxzL7IUvqP6jfd3tt7ZgBam590Ec
	 y2AaxNBlxyPIQ==
Received: from [192.168.68.112] (ppp118-210-185-209.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.209])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A112C7104E;
	Wed,  5 Feb 2025 08:02:15 +0800 (AWST)
Message-ID: <114b92f993a1b5e2c77bbc91b42c21817af2874f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v9 2/9] dt-bindings: gpio: ast2400-gpio: Add hogs parsing
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, brgl@bgdev.pl, 
 linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
 krzk+dt@kernel.org,  conor+dt@kernel.org,
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au, 
 devicetree@vger.kernel.org, eajames@linux.ibm.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: andrew@lunn.ch
Date: Wed, 05 Feb 2025 10:32:15 +1030
In-Reply-To: <20250204194115.3899174-3-ninad@linux.ibm.com>
References: <20250204194115.3899174-1-ninad@linux.ibm.com>
	 <20250204194115.3899174-3-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_160218_603357_95654642 
X-CRM114-Status: UNSURE (   6.83  )
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

Hi Linus, Bartosz,

On Tue, 2025-02-04 at 13:41 -0600, Ninad Palsule wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> =C2=A0.../devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 6
> ++++++
> =C2=A01 file changed, 6 insertions(+)

Would you like to take this through the GPIO tree? Otherwise I'm happy
to take it through the BMC tree with your ack.

Andrew

