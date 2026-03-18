Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A90510854C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 01:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JThk0kPSAg9d5X5Swzc6oumoGxMPTx0zxcz2YCRC5w=; b=Ocu+aWoVPoMMWnYCYEsz6lEcbO
	D4sQ4hgMW/McnYRR+RwPJOPRHRAXG6Nyx9+IizLpDOsKgFc74n/tc1Qq7agh19Xm2P9rSqlwokypU
	duqCvBz1Brr52NIMG2AoHc2wguohTod6vr6DBile5wxrcVjHbNV4E8+0leP8nY0VBgR2xcyBc6fBg
	APdRrCidkEtaFDTZ/kBhjKjDOvzPUKVjJH6hnGFqhr/9itX5YoCuexLe4Nhwvlq8Aq/7Ndaswl21I
	deLTGbS1Ag1hWFtizJSxRkvpb6Jg44co0vVyaaEaKsRs6urb4MArrKWCDH8mZfmO17f9eYFZRXocU
	rofsPkjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2g8Z-00000007aCT-1wtr;
	Wed, 18 Mar 2026 01:55:55 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2g8W-00000007aBd-2qNK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 01:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1773798943;
	bh=3JThk0kPSAg9d5X5Swzc6oumoGxMPTx0zxcz2YCRC5w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eltBYvKcITP0xHs321ACs74jrhtX41HLi324xDPVprg8uoy3LRLpDbASpZSS9W8KJ
	 wwVB8Xd3P17NelBT1MyKWm2gg/tGN+RisolDk4blV1nidbZrwvZ649K5Sid8QYCGoK
	 yQd3SqvvIIQbpo5XgT/4l01J+f+ZIb/IBVytDapnBVLinY6V+udzANQfDX3gN6QRU2
	 M4ocEkXCJ6y+Cy/LTMx2mwcaG8IAfI4ghduDGKL2YgGGKh2vy8LEykNdugwnZjUj8q
	 gWPW5jY8nPq5LSRHhpgGxDEYyE+mG5sCMGbZaM1Qfs74um+Xw0ZUl63H5a05+7fPG3
	 LJCPvPpPtIIvg==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8DA5660BA5;
	Wed, 18 Mar 2026 09:55:41 +0800 (AWST)
Message-ID: <071adc5f76b71b3e8d2691945e7b178602b285f9.camel@codeconstruct.com.au>
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
Date: Wed, 18 Mar 2026 09:55:41 +0800
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
X-CRM114-CacheID: sfid-20260317_185552_921572_AE3B0CBD 
X-CRM114-Status: GOOD (  17.77  )
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

> > Not at all - the next paragraph was my attempt at a recap of those, but=
 Ryan,
> > please correct me if I am wrong on any of those points.
>=20
> Your understanding is correct; the byte and buffer mode is mostly the sam=
e.
> And also mode should be decided before xfer, due to the controller/target
> both use the same xfer mode, not decide by transfer time.
> The original my submit is only buffer mode and dma mode, and use only one
> Boolean property, aspeed,i2c-dma-enabled, but someone suggest add byte
> mode select, so I start to add at v17. I can drop the byte mode, if this =
is confused.
>=20
> byte mode request:
> https://lore.kernel.org/all/010e55e9-d58b-444c-ab57-ddf8c75f2390@gmail.co=
m/

I understand that there may be valid uses for byte mode, but that does
not mean the configuration belongs in the device tree.

We do not seem to have much data on what those valid uses are, but I am
assuming it is not an attribute of the controller peripheral hardware.

[As an example: I suspect MCTP cannot be fully spec-compliant without
byte mode, in order to support the NAK window on target-mode RX. In that
case we can enforce byte mode when the controller is selected for MCTP
use, without requiring a mode selection property in the DT]

> > Ryan: I think this gives us a much cleaner approach to the binding.
> Thanks the feedback, do you mean, just one boolean property for mode sele=
ction,
> Am I right?

The property would not select a mode, it just indicates whether DMA is
available.

A driver implementation can use that indication, along with any other
configuration data, in order to select a mode. The Linux driver
implementation may use other runtime facilities to control that
selection, if you need, like sysfs or configfs.

Cheers,


Jeremy

