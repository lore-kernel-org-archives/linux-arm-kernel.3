Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3D8C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 03:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfsuTILH/eWQPUyqwomkj6abdgucor8q4nBTCb+4ETc=; b=HuUvpjXlKKhphFIRs6zmgESm65
	c4obUhZ/ANGLL3HnaGVT9XS7Ozw1N/j2oz5cBsohgh5TuEg/p15K2+3j+Oiv5Eulpbr8JNjE+80Ss
	LxISWcjP45Jq14YZ+JnTUP+NSO9tYpE8glVZXU1X8y9qtnmrk8jwe6qfQj+q/kb4OdYwmNfh4GwI4
	/MzWpeG3fdWX46hdXT+8kEcgQDqot+Skj3a/IOwnFayK89IgQoEx8hk/itpNqAYicbB4n8tj7voZk
	z6Tjdps1wK41Hk7GkA8GdepT7SZoF5nyOIHGbhWwOgA/q98kaSQDoiJT5TLlw5ceYQEdoG8Peuzfy
	Fd1FcG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tenL1-0000000EUue-04El;
	Mon, 03 Feb 2025 03:41:31 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tenJg-0000000EUqs-1GY1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 03:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738554005;
	bh=zfsuTILH/eWQPUyqwomkj6abdgucor8q4nBTCb+4ETc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HOwZ4qqwuL2nhQDO404IUhiOe6WgQ0UWJ16RPrNcLSbwR/Hrc19MOhREnPeveUeGI
	 MvCdTW9QM1Fqe4+XlwgL2Vj9T/YcmUDxJvWG/kFYvUeDJJhQl9IkZH6fvs8eNONBtY
	 yqbMbwjarHMi1+fi4zfrW9wOjpfFei24503rqo7prYGErIRl2SvKFnB/oPqb/vwhsJ
	 ciG4Pp5T1+yB8JCOym/n2V+PNOJv1EbvmwlW+wGm371p6nObXvu2ryu37FjTD2lPPr
	 /BTJW5+Fe38J4r9Nam2iUNio8CAdQvyvkiz9Kh4hehIqknWlQW2dgy5IWGf4SpWGfw
	 og3yw2L4w86hA==
Received: from [192.168.68.112] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 64E8A73C54;
	Mon,  3 Feb 2025 11:40:01 +0800 (AWST)
Message-ID: <df21af9083a189bf9d2598ee4658f9e45fcdde5f.camel@codeconstruct.com.au>
Subject: Re: (subset) [PATCH v6 1/3] dt-bindings: mfd: aspeed: support for
 AST2700
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Lee Jones <lee@kernel.org>, 
	"robh@kernel.org"
	 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org"
	 <conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"mturquette@baylibre.com"
	 <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"p.zabel@pengutronix.de"
	 <p.zabel@pengutronix.de>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	 <linux-clk@vger.kernel.org>, "dmitry.baryshkov@linaro.org"
	 <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 03 Feb 2025 14:10:00 +1030
In-Reply-To: <OS8PR06MB75417CF1E84556D1492EADF4F2E82@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241023090153.1395220-1-ryan_chen@aspeedtech.com>
	 <20241023090153.1395220-2-ryan_chen@aspeedtech.com>
	 <173047754439.1930424.6922132618537420144.b4-ty@kernel.org>
	 <OS8PR06MB75417CF1E84556D1492EADF4F2E82@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_194008_543565_A8B1A530 
X-CRM114-Status: GOOD (  16.49  )
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

On Fri, 2025-01-31 at 03:51 +0000, Ryan Chen wrote:
> > -----Original Message-----
> > From: Lee Jones <lee@kernel.org>
> > Sent: Saturday, November 2, 2024 12:12 AM
> > To: lee@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; joel@jms.id.au; andrew@codeconstruct.com.au;
> > mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> > linux-clk@vger.kernel.org; dmitry.baryshkov@linaro.org; Ryan Chen
> > <ryan_chen@aspeedtech.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Subject: Re: (subset) [PATCH v6 1/3] dt-bindings: mfd: aspeed:
> > support for
> > AST2700
> >=20
> > On Wed, 23 Oct 2024 17:01:51 +0800, Ryan Chen wrote:
> > > Add reset, clk dt bindings headers, and update compatible support
> > > for
> > > AST2700 clk, silicon-id in yaml.
> > >=20
> > >=20
> >=20
> > Applied, thanks!
> >=20
> > [1/3] dt-bindings: mfd: aspeed: support for AST2700
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 commit: 76c6217c31266e800b67a476bba59dfe=
b9858a90
> >=20
> > --
> > Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
>=20
> Hello,
> Since this patch have been applied, if I still want modify I will do
> the rebase and still patch base on this.
> Am I right?
>=20
> For example I want to modify include/dt-
> bindings/clock/aspeed,ast2700-scu.h
> I send the patchv8 [1/3] patch for aspeed,ast2700-scu.h
> Others [2/3], [3/3] still progress, am I right?

I'd rebase the series on top of v6.14-rc1 and continue incrementing the
series version. You've replied to v6 here, but I see v7 at [1], so I
guess v8 as you suggest?

[1]: https://lore.kernel.org/all/20241028053018.2579200-1-ryan_chen@aspeedt=
ech.com/

Andrew

