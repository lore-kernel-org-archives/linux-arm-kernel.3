Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A94C02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T4RI4nX9+gSCb65G1EaTQtd7vTXqjAhlRZ71a0d/Fho=; b=HgzO04VrCLlcyzpVMjR4Eh+6WH
	mbkE2sferZbKNAzguWMDpS1+X+LzPxS8He/KhqOnKhBN+UYFaWcBum4w3jJtjnC8oJg99n+yoH8UJ
	izz0uO/wWYJSoV2sgVKSF21sKkK4lzTCAfAf1hszrTdEA2HlmYeConFV+5G5KTj/Ruvo5Lp3J6fEm
	u1mTkcF4JffOyjha895DGl1cP8GQ1dAJyWAg1gDX53Q4TG4N32ZNmux3c3zNOvJmVPE6CJETGNyJM
	FFZjCFsTtQ+tocXjuSQ9dKElTWumge5hR4LWfgVqIYAMgGp8xvR34ruORd+TpbiaWxzXJuPw4mWKV
	P/CK9cSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgO7x-00000009bow-09sj;
	Fri, 07 Feb 2025 13:10:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgO6Z-00000009bbe-1KYH;
	Fri, 07 Feb 2025 13:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T4RI4nX9+gSCb65G1EaTQtd7vTXqjAhlRZ71a0d/Fho=; b=dR2rJva/ceVGAF2nIpm+KjWRMj
	52PJ0R4PPoRZ+3WJwmEXgvlTI8xzW0nmpzoKQWG14q0NfoqO+QaST1N+RMvmHEYw0bv9mf/NlJaOR
	Wo664Z6lzYpm8e4qmWiZHMoM2zaS6KWb50N0RxWCAQLOnmtKpriXGW7ek7rAvqezgr2yiK2wjgy+f
	yyOiJg4YFISeqWS11YZXeFEN6LM6lux5fj5zyjHdS+JNq93evvQF1lHXOvA/x10V56Nm3aEt10r+Z
	5NXg1dz9Z/m3Z/kqDWeZ2zTYznFw0WjW6QPv9STeea/O+dczD9PqWmpawNvJENzIzCsxtaNXSA8tI
	6+Getf3Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36072)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tgO6K-0005gr-0H;
	Fri, 07 Feb 2025 13:08:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tgO6E-0004T4-1s;
	Fri, 07 Feb 2025 13:08:50 +0000
Date: Fri, 7 Feb 2025 13:08:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH net-next v2 0/3] net: dsa: add support for phylink managed EEE
Message-ID: <Z6YF4o0ED0KLqYS9@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_050911_354190_0A5249FC 
X-CRM114-Status: UNSURE (   9.35  )
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

This series adds support for phylink managed EEE to DSA, and converts
mt753x to make use of this feature.

Patch 1 implements a helper to indicate whether the MAC LPI operations
are populated (suggested by Vladimir)

Patch 2 makes the necessary changes to the core code - we retain calling
set_mac_eee(), but this method now becomes a way to merely validate the
arguments when using phylink managed EEE rather than performing any
configuration.

Patch 3 converts the mt7530 driver to use phylink managed EEE.

v2: fix mt7530 build error

 drivers/net/dsa/mt7530.c  | 68 ++++++++++++++++++++++++++++++++---------------
 drivers/net/phy/phylink.c |  3 +--
 include/linux/phylink.h   | 12 +++++++++
 net/dsa/user.c            | 21 +++++++++------
 4 files changed, 73 insertions(+), 31 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

