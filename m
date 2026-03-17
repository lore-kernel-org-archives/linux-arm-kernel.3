Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBC1FB5EA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 00:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Wva0cCBDpLbK0JVmBe4Ub0EUtCjNYf1GYoc0uieWEk=; b=pxMFf48jooq1RKBpi9oKjQf8Om
	h9+H4sVw00szDAVmaejPkCHrDqUFisPbf7K/rr6itetqSCkuwo2jQ0Wk89LqXm1yzpR5QiEoMoiDo
	jUBuq+4XH5yrAhROl5nLVYIJL1RdcGLxBdXlVlgKOfxJHkHUV5t4roGZpp/hbTeAAnHHZ5EVsw2QV
	iOxFWqe00awx7q5tIlc2GG5Z1jGxfd98DVbD3xy14ONUoKKmpMZQDu15mIMxCvoM2zzax9U994X21
	U9rda9k3QKbJMDv94Gt1CQxAAF5idhgBIZYN0jUcMbnDBggJXwIZxLLyZ7NLjpge5SD6CPhGnan9J
	rKWcndNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2IfO-000000059hm-3pXL;
	Tue, 17 Mar 2026 00:52:14 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2IfL-000000059hR-4B6W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 00:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1773708723;
	bh=7Wva0cCBDpLbK0JVmBe4Ub0EUtCjNYf1GYoc0uieWEk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GzkAukyhJbTthnB88ExXDqDQGE2jqt5wnSezRMJF/nKkq1miLa0jjJu7FsM6JU7y8
	 HXKCxxPAoh+7kuQFvbvs8SRgYpkb3CqApgFvWPP4aVySvcSkGnL/zrGUiw0l6yPDbd
	 XYU8i6Gd5hjtCTmSG9Qi1BKyrz6plS00DEAK9msDg7NuO/xA1FiH2Dyx6l0W4kC68D
	 nHehRORN+FihBZog5/cJVewhMxKdu2qKYkWNMGm45o4KB2asEF0iv9YHOO27XbFB07
	 QYnL8jlJJpDqpxkAEgKxybD6zW9VeQQqzU2V8Mp9vhvk5PJx0QCwY+Tpoq4fqxNiHo
	 fgr2dIbmEuINQ==
Received: from [192.168.72.167] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E07786009B;
	Tue, 17 Mar 2026 08:52:01 +0800 (AWST)
Message-ID: <eeac1db0a5692ae45b5528a85ed1510b8b1cf771.camel@codeconstruct.com.au>
Subject: Re: [PATCH v26 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Tue, 17 Mar 2026 08:52:03 +0800
In-Reply-To: <CAL_JsqKQp=HyA90rQ2Hzu148k63k5-qrGLH6sEHXNcjAu3QSwg@mail.gmail.com>
References: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
	 <20260309-upstream_i2c-v26-2-5fedcff8ffe8@aspeedtech.com>
	 <20260313232125.GA3618633-robh@kernel.org>
	 <TY2PPF5CB9A1BE6A19D439C675AF5028C13F242A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
	 <7ae8222bf6abd83a3c2ac976f54a2edbe4e9727a.camel@codeconstruct.com.au>
	 <CAL_JsqKQp=HyA90rQ2Hzu148k63k5-qrGLH6sEHXNcjAu3QSwg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_175212_391971_D9E135A0 
X-CRM114-Status: GOOD (  22.26  )
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

Hi Rob,

> > I don't think that really addresses Rob's point there.
> >=20
> > The selection of mode is somewhat a driver implementation decision (and
> > so would not belong in a DT binding) - *except* that there are
> > considerations around the use of hardware DMA channels, as covered in
> > earlier review.
>=20
> Am I supposed to go read the prior 25 versions?

Not at all - the next paragraph was my attempt at a recap of those, but
Ryan, please correct me if I am wrong on any of those points.

> > [My understanding is that the mode needs to be defined here to select
> > which i2c devices have a DMA channel allocated to them. I also
> > think that byte mode may be useful in some scenarios, but that
> > consideration certainly does not belong in the DT binding spec]
>=20
> But this is selecting DMA for the bus, not specific devices. I would
> think the decision would be dynamic based on some xfer size. Certainly
> if the xfer is less than the buffer size (32bytes), then there is no
> advantage of DMA.
>=20
> Or do you mean some instances of the I2C controllers have DMA and some
> do not?

Yes, some of the controllers may be allocated a DMA channel. A driver
implementation may (or may not) make use of that channel.

Since the hardware has a limited numbers of DMA channels, Ryan's aim
here is to specify which controllers may consume a channel.

(in relation to the 'bus' terminology though: there is a 1:1 mapping
between i2c buses and controllers here, plus a small area of global
registers which apply to all controller peripherals)

>  If so, then ...

[...]

> > In that case, we would just have a boolean property, like:
> >=20
> > =C2=A0=C2=A0=C2=A0 aspeed,i2c-dma-enabled;
>=20
> ... yes, this is fine.

Brilliant, thanks.

Ryan: I think this gives us a much cleaner approach to the binding.

Cheers,


Jeremy

