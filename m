Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F3AD72372
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HGTu1UsPlPIErs8Z7fnvSD78uj937ParHNi+Yi69Wv8=; b=5Aagpq9dc4vom65zF9pl+azkBy
	7YYtZZVKFkqASuJOAiJxjmCm192rsQ4f6kLvRHeahkE+FG9nH5xRE6ZoqCnR5bXaV6bLi3WFE7VVy
	Rmys/AH7BMc+Pf365E4oQrHE16fwZRAWeHezhI8iVA6jSgvvJ7V2Ujd8k8YtJ+o1cn3bT+h73qizS
	Dcjt/iQfzqKA2C5vnkQTZnuiu99/AQcYuFU7j0LVmkz4rJxuRbwSedaPDu39SVDFl4UdWWvGk7jTw
	igWuOkfSWBADS3pDGczER0qAkrGYGBIThJmpOAg/KR31KbCPzXirdH6Uqdux04cL94ka0l/J0V8jr
	PfS7bVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEtH-00000008lPq-31nR;
	Fri, 23 Jan 2026 10:59:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEtE-00000008lPS-1cZl;
	Fri, 23 Jan 2026 10:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HGTu1UsPlPIErs8Z7fnvSD78uj937ParHNi+Yi69Wv8=; b=mkWV+AHDtqAWmpVbQfJqKiXWwI
	bTlXlrR/YoLB2ch5YDVN+9gOv4xiySBsxyFGpy67xEB4+9hR+uy7aNI/pIUHuRm7y6J+xsZQnz4v7
	YaJZjVjcm/Mx3LRrRT94Qr+5WE8s/G0km5TW9wDWMS1sY5w812+h/RJeAxki4KKtMll50a8F+GR2b
	OOVV1pInqBMZRcllIUsNuS0bbHR33SO76yWIbNsa1zAaSVcdeeUZp3X77TZ6m1vWOfHPmHKDQHJHX
	6bL5sFp42qjt5pXWojeslkEYwu+idWCOxwpcNeYLmlsB8A3jc4DCZSHT2TxoPvPHHGtCdDzAIZe4o
	40TKfBOw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43854)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vjEt7-000000001m7-0KfG;
	Fri, 23 Jan 2026 10:59:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vjEt3-0000000021l-1Uvd;
	Fri, 23 Jan 2026 10:59:33 +0000
Date: Fri, 23 Jan 2026 10:59:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 00/21] net: stmmac: rk: simplify per-SoC
 configuration
Message-ID: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_025944_428880_1ED14CAA 
X-CRM114-Status: GOOD (  10.58  )
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

[Please note: due to google's spam filtering, I can no longer send
patch series to @gmail.com addresses, and thus, to save being spammed
with failed deliveries, I'm dropping such addresses from my patch
series. Stop giving google so much power, use other email services.]

dwmac-rk has an excessive variability between each individual SoCs
which makes this file extremely large.

This series reworks the per-SoC handling, moving the majority of it
out of code and into data in a way that greatly reduces the lines of
code necessary for each SoC, moving the code into the higher level
functions in this file.

In order to do this, we need a version of FIELD_PREP_WM16() that works
with non-constant masks, so we introduce rk_encode_wm16().

We change the definitions to reveal the fact that in all of this
variability, there is a lot of commonality in terms of the values of
the bitfields, even though these bitfields appear to be randomly
placed within registers.

Both of these allow us to progressively move to a situation where
the SoC independent code can, in the mojority of cases, program these
RGMII clocks, RMII clocks and RMII speed without calling any SoC
specific code.

Further cleanup may be possible with the (actually incorrect) handling
of RGMII delays, but this is not addressed in this already large
series.

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 1220 ++++++++++--------------
 1 file changed, 491 insertions(+), 729 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

