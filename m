Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FBCCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qzpp8wSwYUgP9C3Q7z5OhTyRVCbxhzGffU2XwkPMaNw=; b=UqUL5byBwhXdj5Trk2bWibKdbF
	6V0pJdTDYSrVnv2rWYtPMkFUQeMoO8niM2hTFPvEO/pR9TIu55TVejdO2lvsjXYyOGujXDyCZM0p2
	Zskc+29E4Fupu2qGg4XXKycqji+QBQ2xMvxehdi6V31f+hSjqoaOg2IzH0NvziKr43nnWjBD5k29c
	elua0XKK5JoQJYsq9O7DgKCWc55APXypf0PQumj3Yi9MNP5M942jBBB78BoFM1IHRTyRvLTudsUcV
	ztE00hrzfrttpvv7zQOD+qKFHx0sk6IsbMDImv8lMXm/IHzqTXR7/zgorblMnAT7j+tiNYZ02pCZ0
	psT8vkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHp9-0000000Gs7l-44aa;
	Fri, 07 Nov 2025 08:27:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHp7-0000000Gs73-1g1Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qzpp8wSwYUgP9C3Q7z5OhTyRVCbxhzGffU2XwkPMaNw=; b=RxoLq0aGB2xpS1m8fA9PhMa5Sv
	HTTuaxXneVdb7GFdYuCmAZ9r4/2shFfT8jTzWlPQn+zDregrwGvChDawtORrxNc5prea+SbrbqPxf
	ZHlLoUNGIWv6Jfq7iTwjsvsaiMkM51T0OZRhfjQPHatsNBvU0NgF18gM0zM3x1/H1ZEp2IAQW5mXf
	eRQ0gg2fFJNdb1QNHw/EKKLByUYSCChK3UAqG0ecWHvt6ymhEAIqoz02s/yTC+GjHBWm67sL7yaTO
	buT3pgV+jgNOwTT+BTVjtotE2q5h2S6wc2g46Z0hd9AAvipITgCuQk3wTtJNhzVw/b9Fvo/BNViEY
	D3y8SW6Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36028)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vHHox-0000000068F-2Pqg;
	Fri, 07 Nov 2025 08:27:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vHHou-000000007RV-21ho;
	Fri, 07 Nov 2025 08:27:44 +0000
Date: Fri, 7 Nov 2025 08:27:44 +0000
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
Subject: [PATCH net-next v3 00/11] net: stmmac: ingenic: convert to
 set_phy_intf_sel()
Message-ID: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_002757_730800_A0B151CF 
X-CRM114-Status: UNSURE (   7.11  )
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

Convert ingenic to use the new ->set_phy_intf_sel() method that was
recently introduced in net-next.

This is the largest of the conversions, as there is scope for cleanups
along with the conversion.

v2: fix build warnings in patch 9 by rearranging the code
v3: fix smatch warning in patch 11, added Maxime's r-b.

 .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    | 165 ++++++---------------
 1 file changed, 45 insertions(+), 120 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

