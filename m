Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72863EFCBBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 06:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qi/hMEQwJEADQPSwkWCysi/W3ni7SPe9RdFJbblJhi8=; b=CWnwjMGwLXQVidbLQK010Jz2QO
	8n0nOW/zdTYDwEtt/GTMb7AniDEkTlM1+UpbQOeA/rXzQJZVI94djw3fJoXUQ+RQ0pWz72cm8Udk3
	Rf6vIyYCrAlPboXOh0UzTE9ZTxymT0Y2mhBttGz9QjPxFyJL7FIJpxuXxZOaHoyhrKwmZf7Vj0144
	4zjGig1Ih4f0viPai1TCZKBmSMH5/RHvr7MRDKLsdXYihtJkRQ7MdZb/7sGrKHC5wK7AKNf5CYr7C
	TZ8c9hhwZzXQf2Ql8NCq2AoGo12MGcL23DC1A4NAwRcIIzi6ie4UiHdvMKp0oSYRVXIENTj6PqzD7
	xxO5o0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21Wy-00000003QBu-3vYf;
	Mon, 16 Mar 2026 06:34:24 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21Wx-00000003QA3-03zt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 06:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1773642852;
	bh=Qi/hMEQwJEADQPSwkWCysi/W3ni7SPe9RdFJbblJhi8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Eu8zQqTZrgdd5zingl1ok2g8/jiEzlf8ZASl/Y7r5RNVblLY9kIdD2nLCNpvwDmcO
	 2R+V7UYJaW1NCVNtt6yMySmC972GZ9rcH8XMxEiHvXwT46LSMiFO/8XpaZ7KY/kvEl
	 eZRTEEpVQRAKrpCUZProsW38IwWa6ep9F2YfYCmfaV9AUR2mtpOlsXpEDJV8W4jA0s
	 zGnZGrekR8vtP56Wdy+1JOGeqrtaW5BO0hnNhqNHhgCdPIb45ASmA0wbl1ojb7Bbiw
	 hUrjxY331P+CmSiwQE/CVmawgI30Fm7mQhnknwFxDBbjaiYp12g3seOkaBJ9G6PA4V
	 8/yvBiSP8adSA==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1430A6009B;
	Mon, 16 Mar 2026 14:34:10 +0800 (AWST)
Message-ID: <c3b28ee92fa46700887d0c68b23045b2418358a7.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>, aspeedyh
	 <yh_chung@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Ryan
 Chen <ryan_chen@aspeedtech.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, maciej.lawniczak@intel.com, Mark Brown	
 <broonie@kernel.org>
Date: Mon, 16 Mar 2026 17:04:10 +1030
In-Reply-To: <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
	 <20260313-energy-casket-ca8adc1f1fd1@spud>
	 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_233423_256150_59A425B0 
X-CRM114-Status: GOOD (  24.68  )
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

On Fri, 2026-03-13 at 22:36 +0100, Arnd Bergmann wrote:
> On Fri, Mar 13, 2026, at 17:24, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 06:07:35PM +0800, aspeedyh wrote:
> > > This series adds initial support for the eSPI controller found on ASP=
EED
> > > AST2600 BMC SoCs.
> > >=20
> > > The series introduces a eSPI controller framework for ASPEED SoCs und=
er
> > > drivers/soc/aspeed/, adds AST2600-specific controller support for
> > > peripheral and flash channels, defines the corresponding devicetree=
=20
> > > binding, and adds the AST2600 eSPI controller node to the SoC dtsi.
> > >=20
> > > The driver is intended to support host-BMC communication over the BMC=
-side
> > > eSPI slave controller present on AST2600 systems.
> >=20
> > This all seems to be in the wrong places entirely, shouldn't an eSPI
> > driver and bindings go in the spi subsystem?
>=20
> From an initial reading, my impression is that patches 1, 2, 3 and 7
> should be modified to use the normal SPI interfaces to implement
> an spi target driver, possibly a combined host/target driver.
> Reworking this should be fairly straightforward because the interfaces
> to the SPI core are well documented.
>=20
> It is possible that the hardware can only be used to provide espi
> device emulation. From what I could see in the code, there is
> not much special in there, but I'm not that familiar with SPI
>=20
> Patches 4, 5 and 6 in consequently would need to be reworked so
> these can implement the TAFS spec independent of the SPI controller,
> and can be shared e.g. with other OpenBMC targets using the same
> module and the same user interface. None of this should be aspeed
> specific.=20
>=20
> There is a good chance that both the user interface and the placing
> of the code will need a more debate, but I would suggest first trying
> to move everything over to use the SPI subsystem but leave other
> parts untouched for the moment.

To extend Arnd's points here, some previous attempts were made to
support Intel's eSPI protocol on Aspeed's SoCs which aren't discussed
in this cover letter. I think it would be helpful to cover the history
and why we now have a third approach:

- https://lore.kernel.org/linux-aspeed/20240319093405.39833-1-manojkiran.ed=
a@gmail.com/
- https://lore.kernel.org/openbmc/20220516005412.4844-1-chiawei_wang@aspeed=
tech.com/

Previously, Jeremy had some suggestions covering the various channels:

https://lore.kernel.org/linux-aspeed/20c13b9bb023091758cac3a07fb4037b7d7965=
78.camel@codeconstruct.com.au/

Andrew

