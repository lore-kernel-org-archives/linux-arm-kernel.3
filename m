Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8FECA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 06:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQ0ulA4YhA2k9sure8/+XmwuTEUYeI9TUHMynB0cq0U=; b=X+5oj6xIGQL3U+WFhT2isMSIvc
	I5iET1MYTFW7QtGYp9r4C7tqq2adu+wOPNRsyYv853kKrbJktYzvVgqqZ90M7es7aUM6Y45ang/mf
	bbOH4nbfPDa0XGwOhaWEKaU2SnIf5gphVmW2itrkyFUrlVgdC88uz7w+TYDILLSli1bqRNnRyuz6w
	xWC0SXqDEirTXh4okCgORUWkUy16zxKIO0yRc4cDMBpPOpIBk3iJpSONC4wK5RIGWNxLqAoKlqAuH
	d8aoqjuzwDHtZjrKklkY2CIpGG770EfSfZRibSFIpPOyoLXL3svvpItzlHyhCSK4HQYGYzn1qY0QX
	x7fiGKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFmdC-00000008k83-1ghZ;
	Sun, 11 Oct 2026 06:01:58 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFmd8-00000008k7R-0pol;
	Sun, 11 Oct 2026 06:01:56 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 605DF1A00C4;
	Sun, 11 Oct 2026 08:01:52 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4719A1A00C3;
	Sun, 11 Oct 2026 08:01:52 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id A8FF920301;
	Sun, 11 Oct 2026 08:01:51 +0200 (CEST)
Date: Sun, 11 Oct 2026 08:01:52 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Coia Prant <coiaprant@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH RFC v3 04/12] net: pcs: add NXP SerDes XPCS shared core
Message-ID: <assmUIvWMuZsp8OO@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
 <20260919-s32g_serdes-v3-4-9d68868c1e89@oss.nxp.com>
 <6aabb56e-406f-4d13-9fd8-54822202039f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aabb56e-406f-4d13-9fd8-54822202039f@bootlin.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_230154_513523_383C1C88 
X-CRM114-Status: GOOD (  24.39  )
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

Hi Maxime, Coia

On Sat, Sep 19, 2026 at 05:31:42PM +0200, Maxime Chevallier wrote:
> Hi Jan,
> 
> On 9/19/26 08:54, Jan Petrous via B4 Relay wrote:
> > From: Clark Wang <xiaoning.wang@nxp.com>
> > 
> > The SerDes subsystems found on NXP S32G and i.MX SoCs integrate a
> > Synopsys DesignWare Ethernet XPCS and an Ethernet PHY (PMA) with an
> > identical register layout. Only the register transport differs: indirect
> > memory mapped access on S32G, Clause 45 MDIO on i.MX.
> > 
> > Add a transport agnostic phylink PCS core which operates on regmaps
> > provided by the platform glue. It implements the phylink PCS operations,
> > the Clause 37 SGMII / 2500BASE-X / USXGMII / 10GBASE-R configuration and
> > link state handling, soft reset and polling helpers, and the common
> > feature sets. The platform specific register sequences, compatibility
> > tables and quirks are supplied through a per revision descriptor by the
> > platform drivers selecting this core.
> > 
> > The register sequences and the feature lists are derived from the
> > Synopsys pcs-xpcs driver, so its copyright is retained. A separate driver
> > is needed because struct dw_xpcs is built around an mdio_device and owns
> > the transport, the reset and the identification of a standalone PCS,
> > while here the PMA can be shared with a PCIe controller, the bring-up is
> > sequenced across both XPCS instances by the SerDes PHY driver, and the
> > transport is not always MDIO.
> 
> Is there a way to avoid code duplication by wrapping the accesses into
> a mii_bus ?
> 
> This is what the Rockchip submission does : 
> 
> https://lore.kernel.org/r/20260919125119.2107089-8-coiaprant@gmail.com
> 

Yes. The S32G accessor is the same DW indirect scheme pcs-xpcs-plat
implements (page into the viewport at 0xff, then the low address byte
at a 4-byte stride), so there is no reason for S32G to carry its own
copy of the XPCS code. The next version drops the shared core, exposes
each XPCS instance as a mii_bus from the SerDes PHY driver and creates
the PCS with xpcs_create_pcs_mdiodev(), much like the RK3568 glue.
Details in my reply to Andrew.

The part that does not fit pcs-xpcs-plat as-is is ownership, not
access: the XPCS windows sit inside the SerDes subsystem register
space, and their bring-up is ordered against the PCIe lane and the
other XPCS instance, so the bus is registered by the SerDes PHY driver
rather than by a standalone snps,dw-xpcs device. The accessor itself
is a few lines; if Alex's pcs-xpcs-regmap is merged first I will use
it rather than open-code another bus.

On 9/20/26 00:31, Coia Prant wrote:
> A callback in dw_xpcs would let platform glues express those
> differences without copying the register sequences.

S32G needs the same kind of thing: skip the generic soft reset, and no
EEE registers. I will start with the existing PMA-ID mechanism, since
that is what TXGBE and FBNIC use today, and switch to a callback if one
is agreed in the Rockchip thread. I'll Cc you on those patches.

Thanks,
Jan

