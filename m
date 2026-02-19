Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45930E9A049
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 12:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2PVBOZh4PRKEfp1MaeD8QpNjxQo13/L8ldu7oIy0TbM=; b=S2naUQy1vvOzmInR+c9Sp3A+xt
	L7fKpN+GjYZxf1l8I14xw19AD0l58fRiaQ32jl6iGD5UIugL7Om0+fQiLCVQYEAPSk+vHtzgN66Cx
	Cf2ELpmk+NCPnnxaEHWq8BY89Ehld/4/8wnpIaSIFc+LgPXvVCong/kQij5MYVv4dP2czdfKOyxxb
	Kzn97ph3frdDni58cEpWKvpnvTp8BA9VuhisYUC9SVVLtk0jqEgykPZdBczCCTHfNJTBX78NXe3jO
	dGUwRjn3L+QhFRv2loyoz1LAVNbSXK635TuhYyUooLEUMEBCklsIqdTW7LdKdMnEqaPZwP7oy1iLq
	AUTkTxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3TE-0000000BLrw-2Xhl;
	Thu, 19 Feb 2026 12:49:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3TB-0000000BLrZ-2XcW;
	Thu, 19 Feb 2026 12:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2PVBOZh4PRKEfp1MaeD8QpNjxQo13/L8ldu7oIy0TbM=; b=C7PmKvwHJR3Aotsb29CXX7RR3m
	w3TtOmvBKOHMtcNCCD7TogYuwHLhI523NQ3ZjIOFdlNQxqDZKCwcv/CHfZ5g3XM4pKMFFPll5qzVF
	FcYu+FvU3qHcFEnhJw57Lb//CQzZWKp847iho9F/xWhm+VYGyok1b4Ec2BUPO+RcfTjSpRN8S3wh0
	m3aRxhirUf/yYczHtNcuO8rg/Vb/PYhebUC1goVwD/tr81mEjWUvwgh2p5WU0BSbLuEnAN3jSBRs9
	nutlH5NZoRUtw7KmhkWXCfrdVvZWydKvlHdmBpvsDeLa1LD9qC+eEe0OInisqoiTGlqo1omTlCenT
	YmCOW70w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35432)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vt3Sz-000000000qm-2FbZ;
	Thu, 19 Feb 2026 12:49:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vt3Su-000000003Ke-3gcg;
	Thu, 19 Feb 2026 12:49:08 +0000
Date: Thu, 19 Feb 2026 12:49:08 +0000
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
Subject: [PATCH RFC net-next+previous 0/9] net: stmmac: qcom-ethqos: further
 updates
Message-ID: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_044925_669901_2003F6E2 
X-CRM114-Status: GOOD (  10.06  )
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

This is part 2 of the qcom-ethqos series, building on the previous
series which can be found at
https://lore.kernel.org/r/aY0aJppQWUC52OUq@shell.armlinux.org.uk

This part of the series focuses on the generic PHY driver, but these
changes have dependencies on the ethernet driver, hence why
it will need to go via net-next. Furthermore, subsequent changes
depend on these patches.

The underlying ideas here are:

- get rid of the driver using phy_set_speed() with SPEED_1000 and
  SPEED_2500 which makes no sense for an ethernet SerDes due to the
  PCS 8B10B data encoding, which inflates the data rate at the SerDes
  compared to the MAC.
- allow phy_power_on() / phy_set_mode*() to be called in any order.

I've included the set_clk_tx_rate() patch as that was tested, which
would make applying this series awkward to apply without it.

Mohd, please could you test this series - I'm hoping it will pass with
flying colours as there should be no change to the order in which we
program the hardware. Thanks.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 52 +++++++-----------
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 62 +++++++++++++++++-----
 2 files changed, 68 insertions(+), 46 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

