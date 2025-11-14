Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D2FCE8D44
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x8I9KPnocTwYvke4KmXVCDz7cZG6pMchNENixp9PaBs=; b=NIFghO39OgWsWCOZcVyR45gwTA
	EjtSwy7m9nOC3Fdq8+YSG3S4dghENy48b4Y3C2K8UXrXKbbO1og9k1yvLU048B612YHFZxe2yy3qm
	YlOjcx1cN/xO1zp+v9dUVG2XFwqOfjH8FKvQ8QisCj9z+i0YqSDQqA3/blzwmS5GiVkxxwL7l6jvD
	ZUFk7ztYLLbwUGG/i/KbeHKRKn2nqSNi1ea5MLzxEp81QC0Ra3JrGlzLcO8q+UL8kh3smWqlRb+v1
	pkV4k1KNbmRO7DWbZBbhCDg6vF09pIpbe9GWq4/HIB+RMG9sEHey5DGWhUHETOI/rhrMDBNfkxccd
	AtAb2Otw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvi4-0000000CYTa-3tK5;
	Fri, 14 Nov 2025 15:27:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvi3-0000000CYTS-230Q
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=x8I9KPnocTwYvke4KmXVCDz7cZG6pMchNENixp9PaBs=; b=SfLfimekNYUqeTPdogfAfKCRSZ
	8GiK4/wrIZJaEuQYYrw8pdCWV7kZo5UMMWoCRF3Z+5Sr9zZkWpiKR4jJrEIiNBR7MQvSQxfS3S0A9
	IKbuKjHslY9GRUJIFQxtbcNI3iBV+HwWLbusOGQNgQ004z8wgOejV0OsVgvdh9g4ALJtUumE9YOr9
	Keeqk8pmkPYuFA/nqqiMhMB+BHjmCqiEhMHu4GCNBAd9rWlb6wjdv1U9MpqYv8XDC2rISXr/tzIZ1
	0g9dW3wCOYwRX8uHTHVwGLHbuLwnIymYOAoEbJbMOsS/bLg/UPbnkmXs5OR5iD+VP5gKOI0ABbB7q
	loEzv0Cw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuqL-00000002owC-0NXH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:32:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x8I9KPnocTwYvke4KmXVCDz7cZG6pMchNENixp9PaBs=; b=Zn9Awb85lPONKsoStmaW7puSJd
	sWvTakfmHty+CMm9yYGn2u9kg/IUnrIviU8J6r5+kbjT2c+0wtalE3+CQn/03msl6F6/VZrPMbHGN
	SIUgk6n5hY7iVXH8HC565xoQMEjiJg6gFliLTIarrIhlSYHmFiGQ0rUDvcG+D9jhTV/iuCzoMyxLg
	26hEe04rdRWNm3bEIBDiqg1tYbPZAsQo3Y9Tamx1CNrxYEHaKhKoVwZgm9ogMPW3psyb12bFKmQd8
	rmH+Xyh4lmrtsZACjXvvFBQRK4WyREdITOuOn74qX++CZCzNG5vHB5w1eAVUvsJMW3pl2a4KDOZUd
	HTD62yYg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35954)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJvho-0000000075e-1H7F;
	Fri, 14 Nov 2025 15:27:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJvhk-000000005wa-1i8p;
	Fri, 14 Nov 2025 15:27:16 +0000
Date: Fri, 14 Nov 2025 15:27:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen Wang <unicorn_wang@outlook.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, sophgo@lists.linux.dev
Subject: [PATCH net-next 00/11] net: stmmac: clean up plat_dat
 allocation/initialisation
Message-ID: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_143205_226323_8DB91C92 
X-CRM114-Status: UNSURE (   6.38  )
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

This series cleans up the plat_dat allocation and initialisation,
moving common themes into the allocator.

This results in a nice saving:

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  | 43 +---------------
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   | 22 +-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 34 ++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   | 39 +-------------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 60 ++++------------------
 7 files changed, 53 insertions(+), 148 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

