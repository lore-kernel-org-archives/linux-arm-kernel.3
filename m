Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C874CD35693
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fl4sYJRAfaPvJq+rD6WIfA9roqE5yw0+JWLXHL0Mt+Q=; b=d02ou/R9NELpfpwwnx+52LxiL0
	SY8gEkPV4XwInFzvF4vAO2k5XaUVuuDM1p60+eUW+ANsHY5+s9tN7n2qVvOwH2ZJFzFMubTJvmDLY
	TpIZmBMDXiNazYHph4SoBQtH/nRP205GtWf72WVya9aw+VoLONS4WKFSBJ9GmFHqDihvWJypY25Ql
	kAbMKBSk/yluAHz9xgqTjKWHMhJTYYmH5kunxjt8Ija/T5bJGJYYINkAGGXwSXoapBM2iHOII3Tem
	/e+9Q8Y+Gafe/pAFKYLSelQq1IC9bKBDeu2pcRdpjyr3hQOETgm7CXWXjcW09C0BHZyAT98fJ1N07
	kzEd3wnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl35Z-0000000FqxN-0U14;
	Wed, 28 Jan 2026 10:47:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl35W-0000000Fqwr-2uYy;
	Wed, 28 Jan 2026 10:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Fl4sYJRAfaPvJq+rD6WIfA9roqE5yw0+JWLXHL0Mt+Q=; b=jUs+J0rgHb8ycxAmuApWhPpuS5
	+VQWO0tl6o5iqwsM8hj5dekOEnA4QlUyMF8jV6CanFP8VqeuqWZJjGCpH/VXqLNOrkztKXaVBYQYD
	HQ5zraR5wnCtZsPcbQTwVz7wzLKvz6xWxoN2TRMoKN3dvrz5bJwHN1XKG/gO43RDMlWXrYruvL8gV
	TnOQZN2msYJtlc5WmztZUeLJP6LYLw18J1g86SM2ESh3gKhUwjGvPAajAVRP1LYtUSIFexv0BS3oc
	a6hj+yvlDw7iwmEgaNvdCKqrGFPvTYafwfLx8Fe3OA5MeZGueGwCzgrodH2+SOWmIhdhyFkCPXhEP
	OYltMUpA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54694)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vl35N-000000007CT-3lIa;
	Wed, 28 Jan 2026 10:47:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vl35M-000000006uO-0cOS;
	Wed, 28 Jan 2026 10:47:44 +0000
Date: Wed, 28 Jan 2026 10:47:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <fustini@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/2] net: stmmac: report active phy interface
Message-ID: <aXnpTy6XckPGcmg0@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_024754_733354_E3B32EEF 
X-CRM114-Status: UNSURE (   6.93  )
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

The original patch needs dwmac-thead fixed so the PHY_INTF* definitions
do not clash.

 drivers/net/ethernet/stmicro/stmmac/common.h       |  6 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 10 ++---
 .../net/ethernet/stmicro/stmmac/dwmac1000_dma.c    |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 52 ++++++++++++++++++++++
 7 files changed, 69 insertions(+), 5 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

