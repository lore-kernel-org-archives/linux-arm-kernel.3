Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55117D63930
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 11:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFEfmDE6EY6x+4ZEYf7jS5zoNOAhxJI+CCT+t6uH1+U=; b=Hy8HgjDx6kRoN3T0Ce+Umdh3xC
	MQhWRxRheS4+br1xb+2VWmkBfEUUEZ1tMv3H27HuRCYM8VOOS8fWUvB/b1tBs7FBCbCAdb1UWsJ57
	qP7gv0woPJPPO499bzTxOorUrfu+2Hl9q9wi8ZnXFG04OX7/3Anem9bwfEunZKCPUVCt+AM+ST61R
	dtZpuObyTlDVpyBBJxhZ1OiG8F5nxjOeFLGL7Dx8vdHYk02VtNfQ2cxLwWPSlGXvJZRXA25I0d3tN
	SRVdTxF+emu4c4tlUDENgQ25RKNk5RPrRpdrdGAbHUSD97CJpnTNbt33+0ULqYnkYLDnlxDXSTFRw
	Ay8+MBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDjMT-0000000FFUs-03Eb;
	Wed, 20 Nov 2024 11:59:09 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDjLV-0000000FFM0-3e6L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 11:58:11 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A66E21A0134;
	Wed, 20 Nov 2024 12:58:07 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A2B3C1A010C;
	Wed, 20 Nov 2024 12:58:07 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 65FE420358;
	Wed, 20 Nov 2024 12:58:07 +0100 (CET)
Date: Wed, 20 Nov 2024 12:58:07 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH v5 00/16] Add support for Synopsis DWMAC IP on NXP
 Automotive SoCs S32G2xx/S32G3xx/S32R45
Message-ID: <Zz3Oz3JiRLyD1qKx@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <Zzy_enX2VyS0YUl3@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zzy_enX2VyS0YUl3@shell.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_035810_034736_C28725A9 
X-CRM114-Status: GOOD (  19.54  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>, Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2024 at 04:40:26PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> On Tue, Nov 19, 2024 at 04:00:06PM +0100, Jan Petrous via B4 Relay wrote:
> > The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> > the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> > interface over Pinctrl device or the output can be routed
> > to the embedded SerDes for SGMII connectivity.
> > 
> > The provided stmmac glue code implements only basic functionality,
> > interface support is restricted to RGMII only. More, including
> > SGMII/SerDes support will come later.
> > 
> > This patchset adds stmmac glue driver based on downstream NXP git [0].
> 
> A few things for the overall series:
> 
> 1. Note that net-next is closed due to the merge window, so patches should
>    be sent as RFC.
> 
> 2. The formatting of the subject line should include the tree to which
>    you wish the patches to be applied - that being net-next for
>    development work.
> 
> For more information, see:
> 
> https://kernel.org/doc/html/v6.12/process/maintainer-netdev.html#netdev-faq
> 

Hi Russell,

thanks for review and hints with series proper targeting. I will
reformulate series to 'RFC net-next v6 x/y' for v6.

BR.
/Jan

