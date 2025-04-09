Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12AFC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SA9itoop5/iE+EV485U+CxtHTM5vwihGMgl1JfL4Y4I=; b=0iXPZgjJfQ2Hqmyn/EjmBGoGVN
	0aQy2JKOBRT21es/oBb6i2Ub/OEMHAmwE7AV6/WeqlAQxJ5W2I6gQ+oMMtPeUEAJlyaRGnW/u0SNg
	654C4lI7ccSR+QWknozR+8xaLL4OTj1dJDx/OBHGqqu53qbdUJbhCbcDLtxe6QzIgVw1R+Gbf7y/g
	8NrQ8O57/s9udHxcSZKIECfQ8iE2knVJChNBo2AYiIQDwLG7/jUhRNQEq46dcgrXNoX6sppk3VSKd
	qAOtCbLZVQ/fC7iAi1HbeqxtQcfTC6cD8hnHFOqShQqrdt0MhWfocsxMYKKxXfMd+q2LXnO+sBloz
	rIUqO8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QUq-00000006WqY-1fGE;
	Wed, 09 Apr 2025 08:09:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QHN-00000006U1Y-1Ykv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 07:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SA9itoop5/iE+EV485U+CxtHTM5vwihGMgl1JfL4Y4I=; b=P1JDy7Rk3VtfoV87GrOfn1dMGQ
	5Fg6mfT2AiCpxry/D/z1aSrcZqje31h1/30kNqiH/9HbejMnltbmk5f1KWv6QWyhISLdEXh9SV6Qt
	htQh5eFnmpxJzDgdXC5LfYPuRfr+HgvOZhaa6i3znXLe6jVbPiKArVSwcA5N0n+3OZnmgcEs9a3Jf
	RIlUb/cWusokx3LzLJJQWa30lX/WXyVEoXACO9X8WNzkyHayh50DrLQrPDrQtdJFYEuKWn7QzplR0
	dKREbAlNar+u07ntgYK2yngeTcA9wSNuZEIqpMAzQhnnShHfBMLlMEI2fCmAD+kYWIDGcdrhHvEGp
	+t8cOvpQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48580)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u2QHB-0000Bi-2z;
	Wed, 09 Apr 2025 08:55:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u2QH7-0002OH-12;
	Wed, 09 Apr 2025 08:55:09 +0100
Date: Wed, 9 Apr 2025 08:55:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: stmmac_pltfr_find_clk()
Message-ID: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_005525_406764_24BA3016 
X-CRM114-Status: UNSURE (   8.30  )
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

The GBETH glue driver that is being proposed duplicates the clock
finding from the bulk clock data in the stmmac platform data structure.
iLet's provide a generic implementation that glue drivers can use, and
convert dwc-qos-eth to use it.

 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 18 ++------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h   |  3 +++
 3 files changed, 18 insertions(+), 14 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

