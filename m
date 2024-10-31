Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A1FD767D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fr+EOZK/x0+/oHbug9qtyJ7kXfBPzyIO/cOV92KsetM=; b=GJ1f8hanxKcMvBA4eumn9RQIQM
	wUJtg4xex9NprCxo2hbbUo2PVk4ir6guJVgWubH4ROYyts5RTbhy4QnPijZOXrbZVbVJxqBMnHzcv
	z1wR4MJL1KMoo+tbxLzjM1ysikqJWcQDQJzkJHZqSP4vsBPHbUJSvwBvOjnsgknRg52bUQCoUi1Vn
	hOHrbmDDK9FcbhOMmc9xqNuPS+tcKBzjDcYN2oonrjbdQz4FntP0MMQW9UAf1TISU87XnKhrOYDHT
	jvBS1InfSF1ssTEzr169zEvRmvBJGmL6YWHDfIdgB1UgkovB3QecD9f49Apa8QCn/lFwDtctGIL6j
	J5lWZ7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WJr-00000003q46-2e4M;
	Thu, 31 Oct 2024 14:38:42 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WB8-00000003oNh-3Yiv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:29:41 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 28DF8201059;
	Thu, 31 Oct 2024 15:29:30 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 10B5320102E;
	Thu, 31 Oct 2024 15:29:30 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 719D52033F;
	Thu, 31 Oct 2024 15:29:29 +0100 (CET)
Date: Thu, 31 Oct 2024 15:29:30 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 13/16] dt-bindings: net: Add DT bindings for DWMAC on
 NXP S32G/R SoCs
Message-ID: <ZyOUSgMo0chsGnCa@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-13-03618f10e3e2@oss.nxp.com>
 <erg5zzxgy45ucqv2nq3fkcv4sr7cxqzxz6ejdikafwfpgkkmse@7eigsyq245lu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <erg5zzxgy45ucqv2nq3fkcv4sr7cxqzxz6ejdikafwfpgkkmse@7eigsyq245lu>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_072939_175301_63CE2C65 
X-CRM114-Status: GOOD (  21.29  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Oct 29, 2024 at 08:12:37AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 28, 2024 at 09:24:55PM +0100, Jan Petrous (OSS) wrote:
> > Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> > and S32R45 automotive series SoCs.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 98 ++++++++++++++++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |  3 +
> >  2 files changed, 101 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> > new file mode 100644
> > index 000000000000..b11ba3bc4c52
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> > @@ -0,0 +1,98 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2021-2024 NXP
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
> > +
> > +maintainers:
> > +  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > +
> > +description:
> > +  This device is a Synopsys DWC IP, integrated on NXP S32G/R SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nxp,s32g2-dwmac
> > +      - nxp,s32g3-dwmac
> > +      - nxp,s32r-dwmac
> 
> Your driver says these are fully compatible, why this is not expressed
> here?
> 

They are compatible on current stage of driver implementation, the
RGMII interface has no any difference. But later there shall be
added SGMII and this provides some level of difference, at least
from max-speed POV.

The S32R allows higher speed (2G5) on SGMII, but S32G2/S32G3 has
1G as maximum.

> > +
> > +  reg:
> > +    items:
> > +      - description: Main GMAC registers
> > +      - description: GMAC PHY mode control register
> >
> 
> ...
> 
> > +        mdio {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +          compatible = "snps,dwmac-mdio";
> > +
> > +          phy0: ethernet-phy@0 {
> > +              reg = <0>;
> 
> Messed indentation. Keep it consistent.
> 

Thanks. I will fix it in v5.

> Best regards,
> Krzysztof
> 

