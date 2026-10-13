Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CE2CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YvLdAwQ5X/d6i0CWOkXozRVSPaQ80YaSPGDBi9y6cs=; b=mAdDvKd8seakezTyafLlglln32
	YadcByjc45VtzcTBSMbH15uezR/CM5KYq92ZKr4z5bICWptQ3rwNki6iPpdlK9DJPh4bEFDHNQRDV
	Z0gdmrQv2T0fMLaVd9Pg9w9ZCDbxDAZcByL+JbUJyyesDqw61QparHkb7Z/Wp9V7X8UaBYjOD6jtl
	pPFEQxxdsQGSnFkjWpLXD/RLc7Chk+4S4gaAa80aTrlkLXtWrM1W9nW4oVqI5EDGXcCfDO/jEMADS
	ONuOnT79Vsogx9KXQBtFe++86c19zIwjkJ0wWCcXRAeB7i+l3Cj/TPe8bRKQPyPlHcR4nrRFTVgFG
	PR9jNLrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGddI-0000000D8Oj-3SOD;
	Tue, 13 Oct 2026 14:37:36 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdd8-0000000D8JR-0C8w;
	Tue, 13 Oct 2026 14:37:35 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EC50A1A01A5;
	Tue, 13 Oct 2026 16:37:21 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C89A01A00E9;
	Tue, 13 Oct 2026 16:37:21 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 516EE202DA;
	Tue, 13 Oct 2026 16:37:21 +0200 (CEST)
Date: Tue, 13 Oct 2026 16:37:21 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH RFC v3 03/12] dt-bindings: PCI: nxp,s32g-pcie: Fix SerDes
 PHY phandle in example
Message-ID: <as5CIYxKJTra4hqM@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
 <20260919-s32g_serdes-v3-3-9d68868c1e89@oss.nxp.com>
 <as0qORxP0Roh9ktO@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as0qORxP0Roh9ktO@SMW015318>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_073726_363855_872BEC68 
X-CRM114-Status: GOOD (  24.78  )
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

On Mon, Oct 12, 2026 at 01:43:05PM -0500, Frank Li wrote:
> On Sat, Sep 19, 2026 at 08:54:31AM +0200, Jan Petrous via B4 Relay wrote:
> > [You don't often get email from devnull+jan.petrous.oss.nxp.com@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> >
> > The example references the SerDes PHY as
> >
> >   phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> >
> > i.e. the SerDes node itself with three PHY cells. That does not match
> > the SerDes binding: the per-lane child node is the generic PHY
> > provider and carries '#phy-cells = <0>', while the SerDes node itself
> > has no '#phy-cells' at all.
> >
> > Point the example at the PCIe lane child instead, which is also what
> > the S32G3 board device trees use. The dt-bindings/phy/phy.h include is
> > dropped along with the now-unused PHY_TYPE_PCIE constant.
> >
> > The schema itself is unchanged; 'phys: maxItems: 1' already describes
> > the corrected form.
> >
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > index 66a050028278..29323e50bd8b 100644
> > --- a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > @@ -82,7 +82,6 @@ unevaluatedProperties: false
> >  examples:
> >    - |
> >      #include <dt-bindings/interrupt-controller/arm-gic.h>
> > -    #include <dt-bindings/phy/phy.h>
> >
> >      bus {
> >          #address-cells = <2>;
> > @@ -124,7 +123,7 @@ examples:
> >                  ranges;
> >
> >                  device_type = "pci";
> > -                phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > +                phys = <&serdes0_pcie0>;
> 
> I don't think it fix somethings. The "serdes0" just a label, point to
> provider, which is not neccsary that "#phy-cells" is 0.
> 
> Examples just show need how many phys and don't care about phy provider's
> arguments
> 

The example validates either way, agreed. The three cells are the
'#phy-cells = <3>' of the downstream nxp,s32cc-serdes binding, which
was never posted upstream; patch 1 is the only SerDes binding for S32G
and has no three-cell provider. I would rather have the example match
it.

The form depends on the outcome of your patch 1 comment, so I will
keep this patch in sync with that. If you prefer the phys line
untouched, I can drop it and keep only the ranges fix v4 adds here.

BR.
/Jan

