Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6E4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5fuNIBReuoMPO+s5xcuTEEEkepURytlmljp0eUz+LWw=; b=beLDMPA0fEly1ByQUeU7ZAeoyM
	y/2vKhVmCnzfmD7W/d0E1XRw02+uFkYhOoqewD+fTaznepV/3jg/A6ctglCUAV+l717meqSc8OLUR
	La6quaxaviyvf9sCLzzRAohof+kcgfXw1Z5cyMIa34wFkcpqFbhhcA5FjcRqWl84SFEpZ+NEhwEpp
	/qyKfbcXclVm1ln5uqty+bjVXGWpZJDFdmyryV0cq7xYKWteLt12RasJp3QJWK4c8F5XlJVl5FH7v
	KQjzW3rbrYUM6wzKBaKpMiYdbXkMryVt2alI7PcaoUu8/72YGuzqlrTFbmAYAaVefTWViLjDh0lkF
	0UDfanFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffxf-00000003TZl-2gDO;
	Wed, 05 Feb 2025 14:01:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfff7-00000003QMd-45z2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 13:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=5fuNIBReuoMPO+s5xcuTEEEkepURytlmljp0eUz+LWw=; b=FUpJana68PPHJh1KIcAmi0EcMp
	UBimczI32kekvdwNnwgxUquyi0C8EUnYFeom8P8gFF7xnlAaZr14lNlo9IOvDM3lEO0gzaqorTCnM
	7XlLk+5x3W9elbm0eq7T5bFz4bysLnYt5cdbTtZpZvFuo4Zggu0a4M4RAQx+ZHiIWFgQaYI7R7HVT
	HwX4SNM4o170yjfflaIKWr2l0fVu7W4dgyuN3dhS55fSUkrXj6udo+ahWGIPA8fe6TsC2lA361w6u
	rwDnAo40GOqoG94x7ykABOJBZk1eC0exHPxthcKF1Ee1zFesZB6LQwYE4+UdlR+MQv3sDszfeWDNa
	rZd4w4Hw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfff4-0000000GeOq-3dAk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5fuNIBReuoMPO+s5xcuTEEEkepURytlmljp0eUz+LWw=; b=BcC7hO1ut/o8BAobW9jA3FXphM
	hkF91rElKoHlQfc4Er+M3jlXeBSRKItP9Mbiz5pRmR31Gr+tsCvGvhUoZ4gdPTTMwNQhcGqTrL/En
	qqT0PGtIZckO1mY8v8ZG5sGU2r4G9DSyvVnVVKq/bGeiq1YuAwACzxWemresep9yIJMdNW8RMtYlz
	ivEPOTl1xHN+OTNdHbl3kR3lip9N1bNxHIvBKGvmApldfUDspbTl1I//zBrar3RFUjtAyc9VMBF+z
	1HJ7HsPRmMcZbXIqdPevrEadkyjKQBHciI/v7PMI9d9XBXsS4EH1xs1nXSoPpxyOVGGrsarkQyzaF
	BPUlE4WQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33644)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tffcz-00079d-2o;
	Wed, 05 Feb 2025 13:39:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tffcw-0002SH-2i;
	Wed, 05 Feb 2025 13:39:38 +0000
Date: Wed, 5 Feb 2025 13:39:38 +0000
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
Subject: [PATCH net-next 0/14] net: stmmac: yet more EEE updates
Message-ID: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_134151_042545_B54F3ABD 
X-CRM114-Status: UNSURE (   8.97  )
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

Continuing on with the STMMAC EEE cleanups from last cycle, this series
further cleans up the EEE code, and fixes a problem with the existing
implementation - disabling EEE doesn't immediately disable LPI
signalling until the next packet is transmitted. It likely also fixes
a potential race condition when trying to disable LPI vs the software
timer.

 drivers/net/ethernet/stmicro/stmmac/common.h       |  14 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  13 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  30 ++---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  12 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  96 +++++++--------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |   9 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  49 ++++----
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  21 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 133 ++++++++-------------
 9 files changed, 153 insertions(+), 224 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

