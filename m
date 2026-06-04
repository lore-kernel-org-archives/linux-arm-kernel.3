Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A17CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAYNoi9z2XrkP30NSWWkWVNm0tZX6tGRbCpHrwaHTcI=; b=R/zDKUAV8wTzbfpBGtnkYudVxz
	atHuuxUocMqML3QZYg815DKnzuuVxqRyCW8ouAAFsU0sqQ+OY+nxvwXolMMotyhg6zRpiiKauKKRr
	vDwKAte2kfKr0voy64ZtOWI89h7XJg7Qif7ZHUvJq+zNAJyAY/uspp3r2PJVQcrX1iquOPiKb0P38
	vYk3BeDbpEl4pzaVSpHeZYAWNRf46EOPWpwjQoO6Rxg/LEImoXyonDFsw6LRic7NkgoQu+2QYOXol
	NqamygG7OqDvUlskqB8y63HKAkECPmvFh8FI3xfkRA+BsBCqz5NawbIqUBAQlOE1hv+Wehict131c
	sSg3J4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8NJ-0000000GotH-0AOe;
	Thu, 04 Jun 2026 13:44:45 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8NF-0000000GosQ-0bfC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:44:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV8Mz-0000Us-9i; Thu, 04 Jun 2026 15:44:25 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV8Mz-0015UZ-0i;
	Thu, 04 Jun 2026 15:44:25 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV8Mz-00000000AB7-0Z7A;
	Thu, 04 Jun 2026 15:44:25 +0200
Message-ID: <15ab692f367e9fb607324a3d648ae9fd0b5a5af9.camel@pengutronix.de>
Subject: Re: [PATCH RFC v3 3/5] clk: zte: Introduce a driver for zx297520v3
 top clocks and resets.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 04 Jun 2026 15:44:24 +0200
In-Reply-To: <7973709.EvYhyI6sBW@strix>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
	 <20260529-zx29clk-v3-3-c7fe54ea388f@gmail.com>
	 <99743c29fe81a90d3c1f51889d42ef9d4766de3c.camel@pengutronix.de>
	 <7973709.EvYhyI6sBW@strix>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_064441_181049_8BD64DFE 
X-CRM114-Status: GOOD (  14.72  )
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

On Mi, 2026-06-03 at 23:49 +0300, Stefan D=C3=B6singer wrote:
> Hi,
>=20
> Thanks for the comments!
>=20
> Am Mittwoch, 3. Juni 2026, 12:14:21 Ostafrikanische Zeit schrieb Philipp=
=20
> Zabel:
>=20
> > Is this delay long enough for all potential users of reset_control_rese=
t()?
> > Are there actually any at all?
>=20
> You mean drivers that are in use on this SoC that call reset_control_rese=
t?=20

Yes.

> Afaics not, they all call reset_assert/reset_deassert, or only ever deass=
ert a=20
> reset that is set on boot. It isn't called at runtime and the only driver=
=20
> calling it that is in use on zx297520v3 is stmmac, which only calls it if=
=20
> assert/deassert aren't available.
>=20
> I implemented the reset() callback because other drivers had it and grabb=
ed=20
> the magic usleep(100) from ZTE's USB code. It looks like I should just /d=
ev/
> null it.

If it is not used, please just drop it.

The .reset callback exists for self-clearing resets [1]. It's ok to
emulate those in software for the benefit of consumer drivers that have
to work with both types of reset controllers, but I'd like this to be
limited to those case where it's actually needed.

[1] https://docs.kernel.org/driver-api/reset.html#c.reset_control_ops

>=20
regards
Philipp

