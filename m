Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C47CEDA68F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m7ytA09r9MSTJPCkDhQCSLuflvhto0YiYFFHJD9HlzE=; b=SnuQ/sIlOM0McuquXgkYV2wdl7
	q0T/i3I1kujBxzYmw+1d7sQ6cXYhSpP6+jrTImMtj3gSb/JBaUShVtqZsU7IuYshYhRaktxX8Riip
	pEh6Aq0lLg+KNdrfCyAcwUmbah7YmQZoBFLyvisdGsSOpItuKCH9xFMORM2uaz0NhJ0hD1NckDIY5
	LlnXrtAE2fi8dajPtFHBaexiXLmMcqod4KsgOHYISdPO5SmPBYv6wkMRbeEIY/Vtr0MWr3cDH4K46
	ACLutbi/EOaJDZGXnRDi+Y2AqePK7Sll3J5zUmITsN0GHoGJDRxaAMiR3EaccjP2hwjqAcXquUEZX
	56gUoLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxS3k-0000000FTLh-1gxG;
	Tue, 03 Mar 2026 15:53:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxS3g-0000000FTL7-3psO;
	Tue, 03 Mar 2026 15:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=m7ytA09r9MSTJPCkDhQCSLuflvhto0YiYFFHJD9HlzE=; b=bUR1CERmx8ojd37QL+5QoXEcmP
	+YJf6jtXgh/Su3FEbG0rUTDrNGFZ49y4o5nbiEVdteFKfYTbZsfE5jm9gxYoNwiXgl82S974v5nHz
	F/JqEJY9Iqs65RIaKUMUTXs1T4gT1Wrks66SKEPNOwmY3N6n32WMLS7d+tLhR+xmJjJkWxv6glNLZ
	TzEGE94sufcM6MnyGi5P5CMU6pqxofJxJ0/mOhTKgJ4umkHiZ815PY9RWFFvz6cm+2TEH3Rg6WjXi
	14Kbyw5k8Bh+AQU6nrWcsZ4avY2oiAVp0B7lcqMjb0DX/nMo7Za1U/Pm4uBQoN24c8vCliBqS9Spn
	29ty9Y0Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48450)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vxS3W-000000005JB-1QEp;
	Tue, 03 Mar 2026 15:53:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vxS3S-0000000073S-31Ko;
	Tue, 03 Mar 2026 15:53:02 +0000
Date: Tue, 3 Mar 2026 15:53:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 0/7] net: stmmac: qcom-ethqos: further serdes
 reorganisation
Message-ID: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_075316_961314_883741AA 
X-CRM114-Status: GOOD (  10.30  )
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

This is part 2 of the qcom-ethqos series, part 1 and patch 2 of part 2
has now been merged.

This part of the series focuses on the generic PHY driver, but these
changes have dependencies on the ethernet driver, hence why
it will need to go via net-next. Furthermore, subsequent changes
depend on these patches.

The underlying ideas here are:

- get rid of the driver using phy_set_speed() with SPEED_1000 and
  SPEED_2500 which makes no sense for an ethernet SerDes due to the
  PCS 8B10B data encoding, which inflates the data rate at the SerDes
  compared to the MAC. This is replaced with phy_set_mode_ext().
- allow phy_power_on() / phy_set_mode*() to be called in any order.

Mohd has tested this series, although not in the resulting merge order.

Changes since resend2:
- Drop patch 2 as that is now applied
- Add Vinod's Acks, which were eventually sent in response to the first
  posting of this series.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 +++------
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 73 ++++++++++------------
 2 files changed, 41 insertions(+), 63 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

