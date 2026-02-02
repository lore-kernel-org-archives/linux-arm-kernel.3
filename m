Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A21CE7314A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qE//TZYliqp6X02AKuMaRivUK7A25u9E1VF9BpM0TMk=; b=4Kw2mX4EVIaXtBY1127ulW/X3u
	VIklVQUARlBADaiHpaCeX3P+QdwGNxezCc7GUmODmYC7g8LxMPeGs5DKPhQBGY7MWeHNYkvIbNRXW
	ordpbuw3l5TGkEYqaPnNqWvaUKRvk/vHNM0yYmGpWTMmVxQ9syW6+9PaXPiLgZHO74+IuZGcwn8TO
	R1jdQaW4vVVOsW7uLvxlOVdtVtd6ZWSsUuPZxhf4mteMdBz8X71mk3PU2vSU4XzjUDkrVJw5Nag7A
	OGv151xViK9rKnLIgC62T31I/0+fnrLVYR6v0y9Ki3oTBrt94Nb7qBQPfgi9dMkzSBIpZPiNzv+l+
	zT/p/m2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqmd-00000004liD-2GxF;
	Mon, 02 Feb 2026 10:03:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqma-00000004lhf-0405;
	Mon, 02 Feb 2026 10:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qE//TZYliqp6X02AKuMaRivUK7A25u9E1VF9BpM0TMk=; b=eA1Cmf3U+AlNGD3kezQEHFQU7H
	Zt3u9f/cbJvdhlAFql5AhdZoiLL75RWbOH/2eSY5hh+N2CrPD7egUkBjs1ovtny44Es4CfvjhTq60
	zNn1H5xTzlhL3SJaCzP5aTcX0y/9ndInm/RN+ZpAewZ151oKc70BwsBua6XRg5eP9lvGcwEPpQ+Tx
	fW9Szrs4qEeRA69pIz2fl9vEQtCfy7FVXCq2I4wdtZaIB9N+rc33iFT4yxek+V5r+37A/hzYbVcVS
	6efIrTGycDva1NtLWyrmLlCFPiwes2xv2Y4maLdAFraBLEzwidd/MS3Hsp49V/4sOGMP0dP2zlbQ/
	6E24bRZA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60412)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vmqmL-000000003lt-0zDK;
	Mon, 02 Feb 2026 10:03:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vmqmG-000000003Ij-3gQt;
	Mon, 02 Feb 2026 10:03:28 +0000
Date: Mon, 2 Feb 2026 10:03:28 +0000
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
Subject: [PATCH net-next v2 00/10] net: stmmac: rk: cleanups v3: mode and
 speed for most
Message-ID: <aYB2cKRu3DQh6yXK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_020348_324267_554D7680 
X-CRM114-Status: UNSURE (   6.82  )
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

Third installment in the rk cleanups, this converts the interface mode
and speed configuration for most RK SoCs.

--
v2: disable clocks on regmap_write() failure

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 846 ++++++++++---------------
 1 file changed, 345 insertions(+), 501 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

