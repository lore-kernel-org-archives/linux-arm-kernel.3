Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E2AD61037
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3k8TRdhaXeM2i6zJgXaeR4nkYItV8+qlQs+6J4fCWbo=; b=jwvugtiyb6WBN8aZ4y1rR8BWaH
	VrdzbeJCQDcnSz3ahnBfyVlDU+f8TU+NRw/5myVDs1g2onglq9/mIBw5CPGimffRYh0rVohbIcI0O
	BgS2EeZ6Gmprq9ZGhW+AiDk0ZzizS1IJQG1RQLSGNkDXmMKqXLG29xUamGGmRqzRVPRMlfn2jl2EO
	eSsbVX53+hqzpiezOSSGLYHBL8VMoaSkIdTKUQOMgz5kLCPli0168a7/uFMd1510ADmeKtbnGzn1K
	L8nZb59XdB+/khy1mQpbKO3e3EO/zpf4t/DH9vfPu5REfkoFy+o6dANGgB6w2r4tNdKZVyORS25pK
	D5pXu8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmOM-00000001P7N-01mI;
	Fri, 30 Jan 2026 11:10:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmOJ-00000001P6f-45RB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 11:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3k8TRdhaXeM2i6zJgXaeR4nkYItV8+qlQs+6J4fCWbo=; b=bmTK0DWC5RF/7ippF0fl7kF3Zr
	ihBB4O7eJDOapBuT8ZpT7Tphf+RY8R49Fqd8jesCBeZWPtjCh8qKZ3538jnW+eIMi2xoT7B4VhGjc
	TCAw+318c1zuuOFIX2cpMUSC4IGe71/gll3hflsdiWZJy6Q+5tBilpRhwFRLAQpKmZm+Hc30QBwvt
	mhAjMISXD8Ob+obvY41rQcA4lP7clVw42nckn0x64m/R1KTg860WiROVah0AZRJordPbp/gOji9R9
	GpVBAS8RljgZKhDbQ7Q/iERbgafoLzcmvWgcTUJ90+8jcv373KHvR4ub916c5P/YEDA+wzCSSxeUF
	tgrONKWA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47814)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vlmOE-0000000012b-2SoS;
	Fri, 30 Jan 2026 11:10:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vlmOC-000000000Sl-33GT;
	Fri, 30 Jan 2026 11:10:12 +0000
Date: Fri, 30 Jan 2026 11:10:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/3] net: stmmac: pcs preparation
Message-ID: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_031020_016647_9FADE681 
X-CRM114-Status: UNSURE (   7.33  )
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

Hi,

These three patches prepare for the PCS changes, which, subject to
Qualcomm testing, should be coming in the next cycle.

 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  2 --
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 31 +++++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 24 ++---------------
 4 files changed, 44 insertions(+), 31 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

