Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1142C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CYbTQ2OjNT5HQZlq54gRg5Ekmk2v67BRStp4jn6gpZU=; b=ilP2Tl1QsBLvW8Wg40qKzYfENn
	6qjwiNwC+Tf3oGp65ytd/nSdO432Tu/YoXGKUCUjF+Cfyd6yWUmMFr6HoeHBJ8oXlJWJ9U4Nmx1pH
	o7XmG17rKVGyDBARpK135y/whVc2++zpui9h/pA/hT71PpchY2GTOjToeAlswxoRtNai5Nxk7F7tG
	zPF9jcapui7dtpmVlP9LlRPkKaVJHHa0nTfGAttji4UrWjpqbkj6e8Hx0xSjzHQ10Q9lbS5eRiY6M
	Cp+/ZJ3d9QSDUd0n3tMbJu7kPfS7BpO+AF8Fkj+z5KlT5Hvi4w5cR2fAL/B4hRzw+aGnJ420uCObh
	6H65YDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3baT-0000000FzSV-1rVd;
	Sat, 12 Apr 2025 14:12:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bYd-0000000FzB1-0eVM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 14:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CYbTQ2OjNT5HQZlq54gRg5Ekmk2v67BRStp4jn6gpZU=; b=1y1+5saT66vFlxhIPYmjDaHQuZ
	dI5B8IDr5xlLlM/VX7I9KL5h+x3Qnk85E6Bne6SRKCSDFbLg6wXr/qAXMdgUsail8kqEmwukZY0Lb
	zao3rtGUJOkMPhfe3o0DfuGcb9jRbO5dD1onIZkzrtuKiPzlCfjD6yeeLjah/eWCcQjrnJ3GbcbTQ
	Zq5keSSLE1cHrJqsEBfhI6SgUUTuQSmBWfrmDJvCOd58lY2+0bxoDseUPH12JotQleYghX246k2dz
	Z0vyoKPem3QPsSsiaYlxP88NEyjfOuwgk0hCs9g0EAr+Xl05dKvUyi4mbJo3R0/GGrnFbcArST+Mx
	9tAmNiQA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46152)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u3bYT-0004Zy-13;
	Sat, 12 Apr 2025 15:09:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u3bYN-0005iw-23;
	Sat, 12 Apr 2025 15:09:51 +0100
Date: Sat, 12 Apr 2025 15:09:51 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 0/4] net: stmmac: qcom-ethqos: simplifications
Message-ID: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_071007_191893_F42680FE 
X-CRM114-Status: UNSURE (   7.17  )
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

Remove unnecessary code from the qcom-ethqos glue driver.

Start by consistently using -> serdes_speed to set the speed of the
serdes PHY rather than sometimes using ->serdes_speed and sometimes
using ->speed.

This then allows the removal of ->speed in the second patch.

There is no need to set the maximum speed just because we're using
2500BASE-X - phylink already knows that 2500BASE-X can't support
faster speeds.

This then makes qcom_ethqos_speed_mode_2500() redundant as it's
setting the interface mode to the value that was determined in the
switch statement that already determined that the interface mode
had this value.

Not tested on hardware.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 43 ++++++++--------------
 1 file changed, 15 insertions(+), 28 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

