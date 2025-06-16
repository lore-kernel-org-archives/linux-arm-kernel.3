Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD51C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MsW6i/FVXdat8G6hcJe1bvSOuA1liknIMYSMFoRhj0o=; b=rshVfQVSPr0BFd//YsKL4oQgXz
	oQsIgsPQ/Npqe9YitW0ivDzJifexj9w2FzyLCHMm6XALZL+XAgj8Hf3ETLQdm85YAWjPF2Te/wdqH
	ANJvGKW4w6YxGQ5o7IY2R7KHAouSWX0Y0OB4K2OxSwkjEQ5NeIei/ZkKpMqcCdiAWDllirwAtePsG
	p/IeyXsMMBeOQ2fgvcoy7fjqA6FAnVejMK9HXTcVXst7/t3vJA6OLad/ySZqQwiRL5IM6qvciwXoG
	Df+YTvib40Yh/6D+Y6qnlURyYAd/EF5iLg2NEhBeKhIi6N98WdQ/5VU/Q+TPIx0MtlhAd/qe+u7Uc
	CW1HIYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7qL-00000004Aot-1lo7;
	Mon, 16 Jun 2025 11:17:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6tC-000000042zK-0jmz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MsW6i/FVXdat8G6hcJe1bvSOuA1liknIMYSMFoRhj0o=; b=CyKTfRYazV87NXZTvp12CDOLkr
	BnxmYOBb0dBlBzd+hrQk+iI68i1HLhjdTRi54AVEjk/JzOo2/JTT8lulv4O8qDCm01LV58FfY/5KZ
	g7X1HFmoq5ya4kMxpuDhJcj7bdlczCQLsfhCPhpT4QW6VdHojFcpgAsnJQdvbNQsMtSScq0HRV5Ri
	NbN2Y0iRDHjkU5867BKWF8y/oo4rzXyaDx9cfwPm0WFBydhnYdTPJroQWypeT12fJ5S4QICtPlOhz
	YoMd3QIZ+gIkkWz7Lf74Hcw+zfgov5mEJG3T7F9PIL1WmNlE+y1ii9q81yIgNtq/wzWqk2+BGs3TR
	VKg417fA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57732)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uR6t4-0003a9-0b;
	Mon, 16 Jun 2025 11:16:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uR6t1-0004k5-0S;
	Mon, 16 Jun 2025 11:16:19 +0100
Date: Mon, 16 Jun 2025 11:16:18 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/3] net: stmmac: rk: more cleanups
Message-ID: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_031630_213212_17E725AF 
X-CRM114-Status: UNSURE (   6.36  )
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

Another couple of cleanups removing pointless code.

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

