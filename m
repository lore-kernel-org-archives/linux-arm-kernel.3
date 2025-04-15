Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10371C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k5sn0c6EnK9MQwe7/DFbVJ/3yq40vsmcM6FfsWqie5M=; b=whximszsIEgxy7K7fd869ohgTH
	0uX4aNzFZVl7ONMO5slLOOJI0OZJveZB/fzY+jkewRtZufS0bKY2QnhwJh+MqKzx8xG/Ksv+HFZSw
	E9V+6CnOtiWfppp7GSt5ltNsg7hEKCBhDF1RbXwAI5cRAnkOt2QLGbm2XqdErSgMfOnfDidk4hiu0
	TTCFXtk3T044YTuVv20q0wa+Xb4rzw/P5goS3f5h05uoJDee+6kEjDnLgLTJ9fG3ritkxHK3+Hfm1
	CDGlhi9hj3213SNK8SZpg3V4RucvPXzApqp88ED6VYFVAndZlpjmH+OJ4yfTkdPdkPw3QFQXb8U7a
	u1V+rVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jeo-00000006Ug9-0eJn;
	Tue, 15 Apr 2025 17:01:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jN1-00000006RsJ-3ZMD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k5sn0c6EnK9MQwe7/DFbVJ/3yq40vsmcM6FfsWqie5M=; b=m2W1M6XJOPCYLAtdn5g6aK359J
	RlC0Ip1UHsog4S2oa/AZA0jnCbVWilrDXYZDfYbLvfNabQM9rBnvY6DtnH8/mElHn42/yxo0eyQVI
	IO/QpL/cYgBaPZPF9xZq6piwT1CM34R2Pim9+5WogOPDC+VeiM7GSFQx7mirZMk7+PXhj+LRkv/W3
	Dr4GeQt40Kefw4YhUZyrayEBbhuv7Lg+enVZykW+zV1/8EeA7mX5qQdKsIVLap/i4qmdhUukX+OgJ
	hsq3QslBcvX22lapOZ2jdVMCsmpzbErIHBO5b5pk60BOOoxgqWGrPjfoFnbEtaBydBQTAp6WTXmz4
	AYPr3gpA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56610)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u4jMv-0008Vb-2y;
	Tue, 15 Apr 2025 17:42:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u4jMt-0000X2-0r;
	Tue, 15 Apr 2025 17:42:39 +0100
Date: Tue, 15 Apr 2025 17:42:39 +0100
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
Subject: [PATCH net-next 0/3] net: stmmac: sti cleanups
Message-ID: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_094247_892756_9854C4FE 
X-CRM114-Status: UNSURE (   7.67  )
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

Clean up the STI platform glue code.

- IS_PHY_IF_MODE_RGMII() is just a duplicate for
  phy_interface_mode_is_rgmii(), so use the generic version that we
  already have.

- add init/exit functions that call clk_prepare_enable(),
  sti_dwmac_set_mode() and clk_disable_unprepare() as appropriate,
  converting to devm_stmmac_pltfr_probe().

- the custom suspend/resume ops do basically what the generic ones
  do with init/exit functions populated, but also add runtime and
  noirq ops. Update STI to use the generic ops.

 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 88 ++++++++-----------------
 1 file changed, 29 insertions(+), 59 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

