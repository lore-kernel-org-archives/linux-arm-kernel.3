Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0DDCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuv1is53BAz60PbjKMm5symKbxvv81WCacTJbFJUDyo=; b=EkbQJ9ebX5prF0NxdhrTiOpEKj
	FtXZF0dnagTZ1NWViAaGCdsO+cI1iChCSmZJqzAZ29PMthAnlQFDgNSmLbFBs+RMokAt3yfOY9H1c
	WSxU8jPo3c08rK60JXhpE4wOodWWiSBljoWtJOMttKExa5xg9/niJt3VKBPpeESHGpB7QMMY2SSPS
	cm5Ko94jdsszgoqlpsWnJKx5oGhvV95heh2PcflxLy0GYw7cO1h0OpnPNks4cfCKLdGmxDRHE+9N3
	BGxCagX643JlrPPsBp7PdtVfWeK9JxfMNMxeM7XX/bvSF9EMLuD4SPik/S3pbDfuGgZVS3QrM1Pgr
	yw1FSBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERau-000000046Kg-1qdW;
	Thu, 30 Oct 2025 12:17:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERas-000000046KB-0YiP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vuv1is53BAz60PbjKMm5symKbxvv81WCacTJbFJUDyo=; b=k48QOpUwrL1gnGYVyWCCPy5di3
	OfjNwahayNTD9Qjxdp8t0BmohEcGgeA0EyIutv2alMoQ4r0mr+X1E0qF6V0rrub7u3yvOVBNLghQa
	R7saTwU7H6zHqJrF4/uh3E40i+JFwDn0VsGBRkAiN8GbcASMVfdlbb8iEuN5wjyPmkhrmhzCyNTLn
	XmIpM+9Et00fSnSsv3gSbjKSVazcKSFyKtXKXX8KhEgvohafb7GE6ZBnRLcYhadeOHUWG4XZtbyNM
	yQcArPDqV0Igo+WR2YnF3GJSQLPfGBLHOwqZN4VMu/Ce2wFI+68pOJAq9qBM8nrNbtPNBXEnIIgxY
	hJ6NUXlg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59084)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vERak-000000005fN-0h0J;
	Thu, 30 Oct 2025 12:17:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vERag-000000008S2-1qDT;
	Thu, 30 Oct 2025 12:17:18 +0000
Date: Thu, 30 Oct 2025 12:17:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
Message-ID: <aQNXTscqFcucETEW@shell.armlinux.org.uk>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
 <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_051730_241880_2FBCB738 
X-CRM114-Status: UNSURE (   6.24  )
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

Konrad, Ayaan,

Can you shed any light on the manipulation of the RGMII_IO_MACRO_CONFIG
and RGMII_IO_MACRO_CONFIG2 registers in ethqos_configure_sgmii()?

Specifically:
- why would RGMII_CONFIG2_RGMII_CLK_SEL_CFG be set for 2.5G and 1G
  speeds, but never be cleared for any other speed?

- why is RGMII_CONFIG_SGMII_CLK_DVDR set to SGMII_10M_RX_CLK_DVDR
  for 10M, but never set to any other value for other speeds?

To me, this code looks very suspicious.

If you have time, please test with a connection capable of 1000BASE-T,
100BASE-TX and 10BASE-T, modifying the advertisement to make it
negotiate each of these, and checking that packet transfer is still
possible.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

