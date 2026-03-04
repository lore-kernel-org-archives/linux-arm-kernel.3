Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D39EB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R3yEO4bBe5WxEVH7suRiLaNUM3m0kjyEmV+fOL4Vhyo=; b=moLbKrKV2IovV4U+wXMB9bhNK/
	KPJLgvYe9RRfsW25frfRz9kFISK01RA08teA6VlJXcd3eKlRpZcDLyzLdyvc0YOG1HF+lQ6TKaITP
	sE20odCBbNPmwTCc85NKZPQj7MxJq3rZ7r6wISTryoaxPDl8tE7HFMsbjsT9nZwsayynI9ObbBK2j
	mfbZhvlTg+ZNyT9haqcu/C9GY4y/RD1KYvOXMGHXoAsLIhyu5XywP3Q+JBIHt/6NSe0NUoTu1uk1j
	W8jRVcUnqizp3tQDhTeNVuTf9o2QJnItI8BKhfYYeslu3HXazKNWKXBaRymv83GZcRAajKmn5pExH
	864I0KPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhtb-0000000Gm8g-1XlL;
	Wed, 04 Mar 2026 08:47:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhta-0000000Gm8Z-17Ag
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 08:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=R3yEO4bBe5WxEVH7suRiLaNUM3m0kjyEmV+fOL4Vhyo=; b=I+ZRQq71hVOWKITQO+/STfI3jp
	dx3ay2Wn0c699M/Q/ZalNxBisiDEIihum/lL00C1wjgMrXfjY3LTSr79/ghcYpnrnDyTfOqrurZmt
	gZg9axhYedLxhaTK3MjWQwegR/G479gISM/0RJ29A8WtRxaB/90B9O9Uk0QcG9ZSb0XifpbfpMiHW
	N8OmLa3bonfye+x44wdV6k4dq2jjNMzgZQR6Y4C/+Y7BzLd98YAc0erCxqhM19QPdO+Or0eoBj4xn
	ZiNppsT3GRzqmCRaboamkXwefuKZyaU21z+p0Wq1FXZpnd19up58Jnx34VVyyriblubFiBOORvJi4
	YOlez9Dg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhtX-00000004A9z-15Xd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R3yEO4bBe5WxEVH7suRiLaNUM3m0kjyEmV+fOL4Vhyo=; b=RQL7HIlcO587or0eFJTfqe3qxN
	QB4xHV4oKbgXumQ3KWKvGNAlQQIHCjoiKr1kzKqN40dQoemka3vzfaCMKXLIhHiV26xEfIw9OYMZA
	97syH3PRdGQgFqdmORM9NYSAv3XxZLUmgahw07UO9IhBeM88wesm7Jj7rvHS5o/25TNUZgP5GjzXB
	GUruRtRiwES8/z4UZ+mtVS/PhOoFTDzhpWav1na63WCNZC0PJdjBrk5HLMean2+40K3Rtwk7TujVo
	juNKdMYisrY83m+58imHgtUy3gDALyQzt5kRxFae3QId3CGe1nMneKSXKcd3T2A7BvvxyLDc7r50A
	KS2EKrfg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56142)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vxhtL-0000000068d-3e9B;
	Wed, 04 Mar 2026 08:47:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vxhtI-000000007lz-1Biy;
	Wed, 04 Mar 2026 08:47:36 +0000
Date: Wed, 4 Mar 2026 08:47:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next v2 0/7] net: stmmac: improve PCS support
Message-ID: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_084751_384743_25ADA8C9 
X-CRM114-Status: GOOD (  15.96  )
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

Resending this as the original RFC now conflicts with net-next.

This series is the next of the three part series sorting out the PCS
support in stmmac, building on part 2, which was posted yesterday:

	net: stmmac: qcom-ethqos: further serdes reorganisation

Similar patches have been posted previously. This series does away with
the common SerDes PHY support, instead using a flag to indicate whether
2500Mbps mode is supported (STMMAC_FLAG_SERDES_SUPPORTS_2500M.) At this
time, I have no plans to resurect the common SerDes PHY support - the
generic PHY layer implementations are just too random to consider that,
and I certainly do not want the extra work of fixing that.

I've also changed the last patch which prints warnings when qcom-ethqos
changes the PCS state - this will now indicate in a readable form
whether the ANE or SGMRAL bits have changed state, rather than having
to refer back to the definitions in the code or the databook.

I am hoping that - subject to this working for qcom-ethqos - we can
drop this last patch in the final submission, along with the
dwmac_ctrl_ane() and ethqos_pcs_set_inband() functions and associated
definitions. This will also mean that stmmac will finally be driving
the PCS correctly from a phylink point of view.

 drivers/net/ethernet/stmicro/stmmac/common.h       |   4 -
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  12 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  11 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  10 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   8 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 160 +++++++++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  29 +++-
 include/linux/stmmac.h                             |   1 +
 10 files changed, 200 insertions(+), 46 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

