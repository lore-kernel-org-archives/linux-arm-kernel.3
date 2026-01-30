Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58633E6BF0C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRMRyXmY9tgfoDCkctSdX1Iu1xwbUhfDkogoS4yqx58=; b=nGdsGKt88afCPdc+XYazgX94B7
	5FvboVLMO5PesPJLo9F5SQWKBVXAugUVaKW9snTiFiR31/+Jpime25aV+Ncpp0PEBirbEvROOACOo
	whuUNMlcYY3PLgJrL3zqarPy224jd/vyEyb4T+8SG+Ccss1e3ltSYUo1lXWNoWZrh6kXSKxv/J6cS
	DUk8/FsnGR7IBAokNJv/KtvfwNIMzbzLOCB3pr/SDEAfG+8IxucVswzyTXSWdM7qtsS//I+ouyPbS
	YmQ1zQaECdzaGOTsjsIvSG63vZsVEhedVhyAKSmHFYIyIgPI95+YgxlTq16oGGa9vDwZBSnuBH3QB
	yZxJ2CiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlnpo-00000001UQh-0wzL;
	Fri, 30 Jan 2026 12:42:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlnpm-00000001UQA-2eaA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 12:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gRMRyXmY9tgfoDCkctSdX1Iu1xwbUhfDkogoS4yqx58=; b=wkFCJEHrGYBgy22kGdVJiCa5Al
	KEpH0kjQ4SNJ1ivzT5RA21SRe173/8w29ZfrE/XOPrv0+1ZxsfVDFIDPAi7AkjbQeRJMkKWnLjKL1
	aWVnp3k4tlxOQ3Rn/fAx5dbF2Buu1DsVqtKcwXgulO2kfgCrgpHuHd1ZpVmXhZGrN7oZjW5A1sRQ5
	6ROaYHoKcHvEklCTq4ZB9xtv37CmnsB+7oqsVjMmvqCEVgVwBn6G4HsOyb0RnUW8gwItMT2knfIlg
	PaNd9Myl0gtcTlvLuxuSByOh/Tezie/4m236L4PjK2GzenQ3WHbkthuUZFwOxp3rINWaUNrig/8WC
	YQ5CEd6w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59482)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vlnpW-0000000016u-25xs;
	Fri, 30 Jan 2026 12:42:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vlnpS-000000000WM-2b5B;
	Fri, 30 Jan 2026 12:42:26 +0000
Date: Fri, 30 Jan 2026 12:42:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju <biju.das.au@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-renesas-gbeth: Add
 support for RZ/G3L SoC
Message-ID: <aXynMiZJJhikfIRM@shell.armlinux.org.uk>
References: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
 <20260130114744.252533-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130114744.252533-3-biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_044246_673514_C60B2878 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jan 30, 2026 at 11:47:40AM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP use
> the version Synopsys DesignWare MAC (version 5.30). It has an extra clock
> compared to RZ/V2H and has ptp_pps_o interrupts. Add support for RZ/G3L
> GBETH by reusing device data of RZ/V2H and can be extended to add other
> functionalities later.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

This seems to be patch 2 of 2, but there's no sign of patch 1 nor the
cover message. I'm guessing patch 1 was updating the DT binding
docuentation.

For this patch:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

