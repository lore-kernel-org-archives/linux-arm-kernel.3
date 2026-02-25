Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B227BEFD214
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=id9ft50ikpeYq2+DbJZJyBUEH3jA2m0GVsep0KOPZy4=; b=gfloVhcQv7PFRT22S5VcLGvSqc
	ltA1MFnctySbI96EUk3Y1s0n+gFaO9oekIXkiTQylWvmQorlcT9IYJ4pzC8xCaAtJIxnAkcB/o2jN
	cOnlqmjhOxsztAOB9DneXZcGYA7TKdNiI794pYgF3bFT6cvxcezNrsAaVk8ZhbpTDnpxFfs5aL/ZJ
	fThkMw3HqqbethBS4gPu1z+YJO648K9bcTmAr5UbT2Y/pUa+zNTKTu+/L7NAfQuou12+BgGN7krF0
	c52UFiX1bFeMcn/mVZXdmtt1IsIGllRpVzA9TQ0VuBK05ad11QTsi8OdJqYVjnKBdF5cPWPySPEMB
	Woexmj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB9Y-00000003ghP-2ge7;
	Wed, 25 Feb 2026 09:25:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB9W-00000003ged-06BA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=id9ft50ikpeYq2+DbJZJyBUEH3jA2m0GVsep0KOPZy4=; b=hlifViC1PGDWeKiILXqnlayMso
	ML3lAMkdhTOBBO9Q7f/62nWqghLstcjiKEe2DJci0UOgpAUqXOzzx0RPIyepl68I/nr9mEg5/tqr4
	0ge+0080csH7Cf9webe7Nj7vj+3VM5itj5uwP1rCjk+T1oPTBZFm0w+hqelpvhsAsRt6RUcX1VTmJ
	L6QIiwR4Rv3WtzI8idcTPYnpENciT49idMr69PlYCwIB5AQmdDticanOvDeqXfx5hCRoIqDXfSKD0
	MlQJyTX5mezGgVjhCqHVPz9aYRQpTMPyQsJPsqWafrYW6LTySQSiKTchGrefDZSiHEvJqJQiOiVbG
	gzyvf4NQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46704)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vvB9B-000000006Lo-0h2P;
	Wed, 25 Feb 2026 09:25:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vvB96-000000000pi-2Vrn;
	Wed, 25 Feb 2026 09:25:28 +0000
Date: Wed, 25 Feb 2026 09:25:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jan.petrous@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/5] dt-bindings: net: nxp,s32-dwmac: Declare
 per-queue interrupts
Message-ID: <aZ7ACLx1yUMWPAsZ@shell.armlinux.org.uk>
References: <20260225-dwmac_multi_irq-v6-0-245bf1d7110c@oss.nxp.com>
 <20260225-dwmac_multi_irq-v6-3-245bf1d7110c@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225-dwmac_multi_irq-v6-3-245bf1d7110c@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_012554_086849_18751A22 
X-CRM114-Status: GOOD (  10.30  )
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

On Wed, Feb 25, 2026 at 10:20:35AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The DWMAC IP on NXP S32G/R SoCs has connected queue-based IRQ lines,
> set them to allow using Multi-IRQ mode.
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 44 +++++++++++++++++++---

As you have added support for these IRQs into the generic code,
shouldn't the generic dwmac binding doc reflect that this is now
supported?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

