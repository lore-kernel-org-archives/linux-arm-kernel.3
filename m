Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36C2F30296
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 01:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkGznBF1XyO8DVSgDpTBwSZfSOT93qCEm7hJnIBqTf8=; b=VhKyNo4FUFZKX9hOHuislfP/L9
	OXWk/YOeA7ByAezYJBxZrZFcV1AdaZMiu9F0TNiY0A+OCZKsJlhXhFCyiQ9ldeleLoDxZaDJBdXKj
	0H8ajHxvoFMBQSV9hbHGzjLyP0cEVLNlXP02wMquIMqcE859X3tyR2th1X6AfJ4V+lq9CLZ5bAajq
	Nqg6Sapgn0EdM7hlSiXK003COeuoIvj66wdbi7EXpCWQQ4T9iGZlZCT/WOGLldlqQ1sbraApAmsXU
	NX4M8U9z41aYUZaRasga3cC95sbUDtwsk5Q6oY11wKM4WfYo5iMBHvQpR2Z9Z2VhXbgz1iYejgFMo
	+MWpoT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1x5m-00000003917-1LrL;
	Mon, 16 Mar 2026 01:50:02 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1x5j-000000038zw-1Un2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 01:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1773625789;
	bh=nkGznBF1XyO8DVSgDpTBwSZfSOT93qCEm7hJnIBqTf8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=c4ExRsynMm40V9We4mPTyAQ1gMSRmWj67Whu9oyw2qfM5dhrnt1Za/xhR24MZzEjE
	 wE6BS33UEf+oWRBXfIrfXIgaLjxZCscKQEyaW2ILSaH7sVj/3S5aKwXOZOX/JdAGtK
	 oL1ErnHTMy6VKZbjzRCFZ4/PEBSFNTHSJ5/U87wbIKJ43/0QVIQhMCotzD0Pnj1rh5
	 OFkJHP1MuIe3Mn6su+WhadLr+OpA0579MY9xO+u9yHWRsEqrsQpNOI9twi3DvWA4mH
	 uCLYz46YLZXeYU6Y/sVdaFd9g9ec13XAyajn+VC3M3M70j03sOHZQlydpTRGRW/KT3
	 ot8IedAXEoYaQ==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 74B1960929;
	Mon, 16 Mar 2026 09:49:46 +0800 (AWST)
Message-ID: <7ae8222bf6abd83a3c2ac976f54a2edbe4e9727a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v26 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
  Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>,  "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Mon, 16 Mar 2026 09:49:45 +0800
In-Reply-To: <TY2PPF5CB9A1BE6A19D439C675AF5028C13F242A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
	 <20260309-upstream_i2c-v26-2-5fedcff8ffe8@aspeedtech.com>
	 <20260313232125.GA3618633-robh@kernel.org>
	 <TY2PPF5CB9A1BE6A19D439C675AF5028C13F242A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_184959_652657_9A2CD2C4 
X-CRM114-Status: GOOD (  14.38  )
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

Hi Ryan & Rob,

> > > +=C2=A0 aspeed,transfer-mode:
> > > +=C2=A0=C2=A0=C2=A0 description: |
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASPEED ast2600 platform equipped with=
 16 I2C controllers each i2c controller
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 have 1 byte transfer buffer(byte mode=
), 32 bytes buffer(buffer mode), and
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 share a DMA engine.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Select I2C transfer mode for this con=
troller. Supported values are:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "byte": Use 1 byte for =
i2c transmit (1-byte buffer).
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "buffer": Use buffer (3=
2-byte buffer) for i2c transmit. (default)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Better performance then by=
te mode.
> >=20
> > Good, I like worse performance so I can use byte mode.
> Thanks your review.
> Will remove performance statement.

I don't think that really addresses Rob's point there.

The selection of mode is somewhat a driver implementation decision (and
so would not belong in a DT binding) - *except* that there are
considerations around the use of hardware DMA channels, as covered in
earlier review.

[My understanding is that the mode needs to be defined here to select
which i2c devices have a DMA channel allocated to them. I also
think that byte mode may be useful in some scenarios, but that
consideration certainly does not belong in the DT binding spec]

So, how about we refine this to *just* the hardware-specific component:
whether a DMA channel is allocated. A driver implementation can then
select the appropriate mode (dma, byte or buffer), depending on
implementation-specific details.

In that case, we would just have a boolean property, like:

    aspeed,i2c-dma-enabled;

- to signify that this controller may use a DMA channel. The choice of
actual mode is left up to the driver implementation.

Rob, would that suit better?

This way, we don't have ambiguity on "buffer" default vs. absent
property, and we're no longer specifying actual driver behaviour in the
DT.

Cheers,


Jeremy

