Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBB7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+gTqjr9DCh74fm5MrIN8IfG63yVQfUMTpEsACnoz9g=; b=cGLFIFXvTKwK+qatuVpGRoGTjq
	+BRin3dxb/r6jzjetYcVsa82ojgDo6AuLpeZEpMIH5S612fdDS3OskcECd45ZH2m23YonpzAbNxre
	TfOEi3NAmwIGk4hTGBpSKgJN/o4VlxjZAQPHwxBSsWv9fFz1Vmg8cCicU4+7eT+UwzQLM+VXHhdtt
	ZtetypfwZh6Yrdho9O6v4Aieo7hWXV11l2XI/LCH0YN5A1zpsmANfgXAAo7sDQ2EieyzEaYe3lhaE
	tLrTUu6ls2wcfZvBGAT7Pw3xSnwHlkrtFvULTyKjud/mw0LLk7MWKQ1b6xiYRE6bVQwKG5ItxI6uI
	QIA4SPsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJB-000000024eS-02gp;
	Mon, 07 Apr 2025 21:47:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rhG-00000001j86-2545
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 18:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=g+gTqjr9DCh74fm5MrIN8IfG63yVQfUMTpEsACnoz9g=; b=S+9/lpDdDRdEMm/HJ3B2WEMXYp
	3lTvAD1I5rsAmIiHjA8BHyJZYG2cxGITCkq/swCt+TlFSBth6dXpuQ2GFzFuu0FiXa9zvGbLWEsjQ
	wYHfAHeyCis5IrXimU2kYPf5KTfkwKLx8YJNNNjWpfTPt22A+kKzeGv/lPrf8IwAg7iM3BIRTFi0x
	b9T53bUVP3As9nGJxfDvDShJpiKumxTXkTCP5d9hMuOHrJTOTNvnFdlnuJ9pP7ekRWGWAbYaVeKj1
	KJOeLl7nOZs//b/0WCJMlBz0PAJdti54O4gTDIijyfQKrsgaVV0F5OGqUI9IL5+ZSwGksXlXxWq9I
	/Aco7FvA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rhD-000000086ja-3RvQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g+gTqjr9DCh74fm5MrIN8IfG63yVQfUMTpEsACnoz9g=; b=aSGIamiJukybih316LqvTsGTCU
	VJrvt/A8Zi349runxTQ69QaQi0QPBl4R2XSxcE7aIP+xD5O1s5Rwajkxo+EHErgJM5Iy63s2KUKmM
	9bDd2+WP3srjq7mU2Lmxi9a57c6tQropXqxKy76NXPvRL4GWDKng97FpnMbZ7fhDeaAJq1se6+7AJ
	xLIYV42W3RV4xvEaXvdVpUyrEa8vs4MRHegTVntemDmTkXCAlwFRivqysD9KDJ7VYU6FL0Bkj8GzR
	WE0lGLkhEiq80lGjbyDZWRpTr+viXLhmvkbpZGECYwfVcH7+IpUBBjLMVT0C4ZCm9Rm/k+Ssudqnc
	F8zRG/Cw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43020 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u1rh9-0006AU-1k;
	Mon, 07 Apr 2025 19:59:43 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u1rgd-0013h1-Fz; Mon, 07 Apr 2025 19:59:11 +0100
In-Reply-To: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next 5/5] net: stmmac: remove GMAC_1US_TIC_COUNTER
 definition
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u1rgd-0013h1-Fz@rmk-PC.armlinux.org.uk>
Date: Mon, 07 Apr 2025 19:59:11 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_195947_939250_49E35C76 
X-CRM114-Status: UNSURE (   8.77  )
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

GMAC_1US_TIC_COUNTER is now no longer used, so remove the definition.
This was duplicated by GMAC4_MAC_ONEUS_TIC_COUNTER further down in the
same file.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 42fe29a4e300..5f387ec27c8c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -31,7 +31,6 @@
 #define GMAC_RXQ_CTRL3			0x000000ac
 #define GMAC_INT_STATUS			0x000000b0
 #define GMAC_INT_EN			0x000000b4
-#define GMAC_1US_TIC_COUNTER		0x000000dc
 #define GMAC_PCS_BASE			0x000000e0
 #define GMAC_PHYIF_CONTROL_STATUS	0x000000f8
 #define GMAC_PMT			0x000000c0
-- 
2.30.2


