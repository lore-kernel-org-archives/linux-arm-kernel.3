Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C3BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmvS0+8GuBtd9iAyjF4Cr9VcLF3E0Yy+Gdartxxdr3w=; b=ykf+GAqBwuOFHCZ91EHhD02pUN
	zQLAkBvQJ76fFH8YhwxK2Qly3wWUKdOo+6ZUAxULe9dsQJkcv4/ADHMjQYcHY7zM3AovJ+e6Rd7GR
	0k4x3BtLUiXinxRpZCsZv1E7p6HgWQmUUNBwdeAaPIuhxmRclUOXZ9r3a5y1OPFa8uKgC3OTll0I+
	3Yp+asCkmDpYUtJ1KJs1ZMmrpAcCX6bl2h/0jHS5o/ki7U14BPfnuPZSTH1MA8IvJ2f9Be8ArFtWb
	hdvRQRmLi/96NDAXGxF9WJBNd40qW0EsCpxi/LMApiYFPqcXBB6fFm2rFUuGILODu+7o9CzdwiYT7
	Z/p8ufsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbug-0000000BrHc-2aLT;
	Tue, 14 Jul 2026 12:07:02 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbud-0000000BrFW-2xYJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZmvS0+8GuBtd9iAyjF4Cr9VcLF3E0Yy+Gdartxxdr3w=; b=NmLFuFUgt84zB+sJBpji4IR+V9
	20r7IQxycTJ5nZIvLCCCcE8txKiuKDzb8A8VOEDwnGUDxe9nMnCJCo1bakM3xwTMFu6LkMzQo6oFX
	PymRum5aj4xs2ui+ySp3ilSH9rQChvq5Wrvv3wzR0MDOwW+yaMRx0WGbDojvVfRlZZF5/AgHpjeCl
	0lECrvC9RvDqB3Y3Bqb0aCL/y2WJH3JPlztY2A3CsOofSE8XyvcWmFyrw99eNTh5ZEsDlKtD/36q8
	M7shaEpFu5S0FP4g2A3y3hvK/Ac9e1AjCTvBlPCzuIhzR1pWH/FEOL4NLz6jiw4bf9fAE7/x/YFmh
	zohUrpQg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjbuK-000K0H-1G;
	Tue, 14 Jul 2026 14:06:40 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjbuJ-0008J7-12;
	Tue, 14 Jul 2026 14:06:39 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-arm-kernel@lists.infradead.org
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Frieder Schrempf <frieder@fris.de>, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware driver
Date: Tue, 14 Jul 2026 14:06:38 +0200
Message-ID: <2420855.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260714093354.GC22086@francesco-nb>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <4b7b7823-00c5-4801-8ba4-19e5670f339d@kontron.de>
 <20260714093354.GC22086@francesco-nb>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28060/Tue Jul 14 08:25:07 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_050659_861312_948E56EB 
X-CRM114-Status: GOOD (  34.24  )
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

Am Dienstag, 14. Juli 2026, 11:33:54 CEST schrieb Francesco Dolcini:
> On Tue, Jul 14, 2026 at 10:43:56AM +0200, Frieder Schrempf wrote:
> > On 14.07.26 10:32, Francesco Dolcini wrote:
> > > On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
> > >> Hi Francesco,
> > >>
> > >> On 14.07.26 08:59, Francesco Dolcini wrote:
> > >>> Hello Frieder,
> > >>>
> > >>> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
> > >>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> > >>>>
> > >>>> Add the ELE firmware API node and pass its handle to the OCOTP
> > >>>> driver. This allows us to gain read/write access to the OTP fuses.
> > >>>
> > >>> This seems something we should have in the soc dtsi (imx93/imx91), =
it
> > >>> does not seems board specific.
> > >>
> > >> My original intention was to move as much as possible into the SoC d=
tsi.
> > >> The problem is that the memory node is somewhat board specific due to
> > >> the DDR. And I can't move the firmware node into the SoC dtsi and as=
sign
> > >> the memory node in the board dts as the checks for all boards not
> > >> specifying a memory node would fail then.
> > >=20
> > > What is the reason to have this memory address different on various
> > > boards? Can we have a default in the soc dtsi, and allow the board to
> > > override the address if needed?
> >=20
> > There is no real point in having different addresses on different
> > boards. But the node describes memory that is physically on the board
> > and not on the SoC. And I think that is why DT maintainers want to have
> > it in the board DT. It's the same with the memory nodes for the
> > remoteproc drivers to communicate with the Cortex M-Cores in the i.MX.
> > But maybe I'm wrong and if there is a possibility to move this to the
> > SoC DT I will definitely take it.

We are talking about reserved memory, so this is highly board-specific.
So for different hardware variants with different amount of RAM you have to
go for the minimum anyway.

> > >=20
> > > Or can't you add the address in all the boards, and keep everything e=
lse
> > > in the soc dtsi?
> > This could be a possible way, yes. In that case maybe we could even
> > create a generic dtsi to contain such defaults for all boards.
>=20
> I would go for this solution, we could have something like
> `k3-am62-ti-ipc-firmware.dtsi`, include it from all the boards, have a
> sane default memory address, and have an easy way to override the memory
> address from the board dts, if needed.

So what is a sane default? At the end of the minimal possible RAM?
I'm not really fond of something you have to make sure matches to your
hardware, but won't raise an error if you forgot.

How about providing defaults for the SoC part and users have to provide the=
ir
memory on board-level? Similar to the VPU nodes on imx8qm/imx8qxp. There you
have to specify memory-region in your board.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



