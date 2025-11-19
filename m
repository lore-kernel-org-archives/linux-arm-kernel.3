Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9BECF3185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y+sgIiXuLSX8878BXnZdAURbfpZ/7Ejmg1bqP8JP5ck=; b=bkqcZosmTlquT/tDHVYR0cUZVN
	o4PzDiZYnjzxE8EsyjAb+NK5U+8GY9ReHhsfFS4f8pP2rU6ez+J13Qzn2sLs0BSXXtB/2h5+85kEM
	Jxh5wnzXteuGSCnGV+Pzw3VPAaJlg79LtttiOQMrq9WJaNnz42J0loL8gQ6Gw4Y7bJXSSpmshDiRu
	4tu8DTldDcmNtjwWrFSsvbPTGfXG3AS7eAVz+J8wn2i9BjKR2Ee9D73NaqLOkjjoE8TnTdU9TpORT
	k6KyHhDXVMaFn/7ftqWpj+7F+EZvFqQXDCXmvnsNGMzZs4emUDmaNB/zVds6k+P4IHaFtf85RJuc6
	muLlifCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLf2S-00000002uyU-0yy9;
	Wed, 19 Nov 2025 10:03:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLf2P-00000002uxw-21Ho;
	Wed, 19 Nov 2025 10:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y+sgIiXuLSX8878BXnZdAURbfpZ/7Ejmg1bqP8JP5ck=; b=kpFo9qM7iuPsdM+zYOjqS02txO
	4M7kLehtYNmXBJfY73fpDpk3On1guAxfTdG3f4/+cB+hDWj4idMIug9TUrx8eqs7yy0IupTxLV2qG
	D6959asz+TtdSGQiUzwGyJ4MlKUAo0S3goHu9FNs4pswpYkWgv/PECttzzMI6yzoyzHSjhKtgy2zE
	u2QeQIJ7CmdDzj1QOIkaOS0RvSIGGF22MtkkLBSY9+bfqK+zczx8GFugnk1THmhmI88MPrFpWROJ9
	lhZ220fN1y6GKdujBRN0FEIb8nFjbSX2LL3amzluVFeyhPXQB6rGX5QLGe0v3wHRI9GytQ6/g7Ouc
	+KwYFJeg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52384)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vLf1k-000000004QW-32gK;
	Wed, 19 Nov 2025 10:03:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vLf1d-000000003Ji-0q5P;
	Wed, 19 Nov 2025 10:02:57 +0000
Date: Wed, 19 Nov 2025 10:02:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <fustini@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, s32@nxp.com,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH net-next 0/3] net: stmmac: pass struct device to init/exit
Message-ID: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_020345_805654_711CF9F3 
X-CRM114-Status: GOOD (  10.10  )
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

Rather than passing the platform device to the ->init() and ->exit()
methods, make these methods useful for other devices by passing the
struct device instead. Update the implementations appropriately for
this change.

Move the calls for these methods into the core driver's probe and
remove methods from the stmmac_platform layer.

Convert dwmac-rk to use ->init() and ->exit().

 .../net/ethernet/stmicro/stmmac/dwmac-anarion.c    |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac-eic7700.c    |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson1.c  | 12 +++---
 .../ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c  |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     | 47 +++++++++-------------
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 14 +++----
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 10 ++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c  |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 47 ++++++++++++++++------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 35 +++++-----------
 include/linux/stmmac.h                             |  4 +-
 14 files changed, 94 insertions(+), 99 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

