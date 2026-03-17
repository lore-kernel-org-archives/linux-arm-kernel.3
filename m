Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D98FB5EA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 01:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SmP2+4heY2mqxSh+2kpDHacvKUssfAIu1YMw99U9Uc=; b=Lj9x4Gs3jMKgs5W96V/o0IIzBb
	5qnhTroBAlAaRyB8xxLyKCUYLsJOWetVS3SaZeo9Afq1nzjV0pFx/fHFBIFyhfEbcV8CjmOmnOOG8
	g6noZoz3AiOAkOAtaLGJwvc72k/ibV7i9APuaaanzh5nygCvP4nRUhleLMLC6TEKwKgVwmUC24lQG
	HmX8RtPxvpl8WfCR+0UXI66ncQH0Kk49TwcqafqNKvyZQRIWRtHnyBFGLSNj2RTodtCXU7eQCILuK
	BkJHpdGRfWV+TmagmwceB4xCHOVskokoG20zJfdiyrNnJCkx6+0q8NCnz++x5+1qYRmW7kgAfihNs
	RUeTDoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JTO-00000005Cmj-2Fqq;
	Tue, 17 Mar 2026 01:43:54 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JTM-00000005CmG-1Y0s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 01:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1773711830;
	bh=9SmP2+4heY2mqxSh+2kpDHacvKUssfAIu1YMw99U9Uc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BgZqPQglYjGenbMZ0Xry4Vi0J1fUs7CVX0RMnYCDdEszoZdhji6xgedEDz+ah9kVW
	 Etk0ivyOAztnVJEysv7ZT9sFMW0Y8pv76leRIKsT3953qGb97mA+Q18A/AdmHw0lXp
	 Ey1/3IIKZCQFyjKj5v3zGbkfeNZ/BbblQa15T/hey98kRyWRFh1Te8r5pgMrUCeteD
	 w0omaMe3yiDJXxGrErJ5gJOaSL+2p5AKbEjB9Kcj8FzQ4FU8Iyws/jKEwklYPA2kHR
	 88XiwfeQr1IXCQJnuu1AYjYpIxlV3U65Dt3TCPkzsKQIUBDnLz7/V0xkb4UU6lWxsI
	 fk0uIShtMwILQ==
Received: from [192.168.72.167] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AF97D6009B;
	Tue, 17 Mar 2026 09:43:49 +0800 (AWST)
Message-ID: <9dec962eb510d947a458fd2318a3812d58b3553a.camel@codeconstruct.com.au>
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
Date: Tue, 17 Mar 2026 09:43:49 +0800
In-Reply-To: <TY2PPF5CB9A1BE6EAA73D3AD6F75F1ABD53F241A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
	 <20260309-upstream_i2c-v26-2-5fedcff8ffe8@aspeedtech.com>
	 <20260313232125.GA3618633-robh@kernel.org>
	 <TY2PPF5CB9A1BE6A19D439C675AF5028C13F242A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
	 <7ae8222bf6abd83a3c2ac976f54a2edbe4e9727a.camel@codeconstruct.com.au>
	 <CAL_JsqKQp=HyA90rQ2Hzu148k63k5-qrGLH6sEHXNcjAu3QSwg@mail.gmail.com>
	 <eeac1db0a5692ae45b5528a85ed1510b8b1cf771.camel@codeconstruct.com.au>
	 <TY2PPF5CB9A1BE6EAA73D3AD6F75F1ABD53F241A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_184352_611035_024A9F83 
X-CRM114-Status: GOOD (  13.36  )
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

Hi Ryan,

> Your understanding is correct; the byte and buffer mode is mostly the
> same. And also mode should be decided before xfer, due to the
> controller/target both use the same xfer mode, not decide by transfer
> time. The original my submit is only buffer mode and dma mode, and use
> only one Boolean property, aspeed,i2c-dma-enabled, but someone suggest
> add byte mode select, so I start to add at v17. I can drop the byte
> mode, if this is confused.
>=20
> byte mode request:
> https://lore.kernel.org/all/010e55e9-d58b-444c-ab57-
> ddf8c75f2390@gmail.com/

OK, that sounds like more driver configuration than hardware description
though.

> > Ryan: I think this gives us a much cleaner approach to the binding.
> Thanks the feedback, do you mean, just one boolean property for mode
> selection,
> Am I right?

It's less about "mode selection" (which is a driver implementation
consideration) and more about "hardware capability", which I think the
boolean property better represents.

The driver implementation could do whatever it likes with the
information about whether a DMA channel is allocated (and select a
suitable mode depending on that, and/or other runtime data).

This property only seems to be applicable to 2600 though, as there is no
need for it on 2700, if all controllers are DMA-capable.

Cheers,


Jeremy

