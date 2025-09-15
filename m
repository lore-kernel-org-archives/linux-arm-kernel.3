Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AF3CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 03:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McZskAG0UGaWRlZ5lR1vVezxW/M358PczFizXXezyt8=; b=LPeY1iUGMG/WCUXV7EXYPMU/S2
	LBVtYOCqjgetIpaG+OvyRcCtxiiIXeMJWl5zNourVvN5ItyA5IWzXH7nJiNAtI3wfJC6efgxm35jZ
	OcZgSHiAIKPXFGwQ8JOdmfyASPauUDmcsq7ZZOXCKulh1BaSSN10rUMs2qLtN1WMk5ifSvH6JMxm3
	/Bya498p+rgv2EiT9Qg92LHC172nxtdT3E3Po/b07PtMbLomUzLEhwb4Z4557ISTnmwdKgBxiwKPI
	cQgbe6Q5IVzQXehG1j3iiG156zkZFfBfPygYH0tWSh2gyOY35Y0gnlD4WX556u/M1Hzz7lLym8Q7v
	kbWvY2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy064-00000002gqT-2Hmw;
	Mon, 15 Sep 2025 03:41:44 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy062-00000002gq1-0wpy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 03:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757907696;
	bh=McZskAG0UGaWRlZ5lR1vVezxW/M358PczFizXXezyt8=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Xcvd+m79AusxjVSN/vAg8wz4KIWiLRryRepPb4eS0IUkszuJGo2V11TGyAvc1SqMi
	 9S1J8r+3SD7UrRoOwxjMpTx795/XvVFw55TE6h/q653GYizk/UiZY3p8+ZG5py3MP7
	 OxVCYfPKpPlqAQYZlTX7B83F2QFXuBVrf9xcIb7lNam3d38IAqjnvw3ipfAs2M9Pwv
	 fASRz3/FjxRZNLV8ViFFG0k2VlfDS/im8a80Ib4zgQ1xSfa5RD7PNnf7ljaZYcwYk4
	 2HkpFpETo3rZWtUexQHqjsIV1JDMO9qPgU2t+FHY6y09m986X0HhKK9Cz15owqyw7N
	 YG3MGYCBDbp2w==
Received: from [192.168.72.160] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 68AFC64CF0;
	Mon, 15 Sep 2025 11:41:32 +0800 (AWST)
Message-ID: <03abda47219b8b0b476a3740c7ed2acc4b2b16dc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>, 
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>,  "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,  "andrew@codeconstruct.com.au"
 <andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>,  "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "naresh.solanki@9elements.com"
 <naresh.solanki@9elements.com>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Mon, 15 Sep 2025 11:41:31 +0800
In-Reply-To: <OS8PR06MB7541C0D6696FC754D944D45EF208A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250820051832.3605405-1-ryan_chen@aspeedtech.com>
	 <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
	 <9d6660f0bf5119cedee824cf764f15838622833a.camel@codeconstruct.com.au>
	 <OS8PR06MB7541C0D6696FC754D944D45EF208A@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_204142_463960_405EF182 
X-CRM114-Status: GOOD (  17.07  )
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

> > OK, but the ast2400 and ast2500 I2C peripherals - which this binding al=
so
> > describes - do not have that facility. Given the 2600 is a distinct per=
ipheral (as
> > discussed on the v16 series), this would seem to warrant a distinct bin=
ding.
> >=20
> > Should this be split out into an ast2600-specific binding, to reflect t=
hat it is
> > different hardware? The reference to the global registers and transfer =
modes
> > would then be added only to the ast2600-i2c-bus binding.
>=20
> I agree it would be cleaner to split out a new binding file specifically =
for AST2600,
> for example: `aspeed,ast2600-i2c.yaml`
> But also I think `aspeed,i2cv2.yaml` more better name, that compatible wi=
ll=20
> support next generation such like AST2700 .....

The ship may have already sailed on that one, as you already have the
existing compatible string describing existing hardware.

I would assume that the compatible string should be fixed for an
instance of the specific hardware, but the DT maintainers may be able to
provide some input/precedence on changing an existing binding, if
necessary.

If this does get changed, I would expect that you would need a
corresponding update in the old driver too.

Or, another option may be to keep the current generation ("v2 core with
compat registers") as-is (ie., at ast2600-i2c-bus), and introduce a new
string for the next - where the primary hardware change might be the
removal of compat registers, but it's still new hardware

Cheers,


Jeremy

