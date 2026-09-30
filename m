Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EAECA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvxWkr8B3B7aTjXsEmBMRJrfhKBaoGJTEqo7wMEu2YY=; b=NCLNzEoKNRB54muMd6hpkCjT4N
	+nkUX5svTPy7XQQBZLw5FsqN8V9hSJ0Nlet9KNZfhEj7Uw1q232Tm1YJhcScBxYVe1t5WEsEt9+Z3
	N/3FcOW/cwWFwGa72NQddkwihYlI+bhFLl7/ZSOyXzdm72J3ts5DbFaThBAagPbwLh95QpUcDtThE
	B/cUs0GIfed2pLCiJao9LYFrEqi5DlxJ7bB8XXBV0yX/ce5Bbg/mLrqIwlcEYtKj5yO69RuGm/CJa
	teCpp2CkdFBxn5ZJMPh72D2mQTmb7AHAVSTVKFOrSpicIYtOZwaWc10/J+2203maqO7QXs5Wlf49J
	upZGk7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrC4-00000005fA3-0u8m;
	Wed, 30 Sep 2026 10:05:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrBO-00000005ejA-3sAd;
	Wed, 30 Sep 2026 10:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cvxWkr8B3B7aTjXsEmBMRJrfhKBaoGJTEqo7wMEu2YY=; b=en/zXBXrCrAIBQVGSSx937i57j
	4xaKUSTgAQXBRdMM3REq9pqt5/Vb3b+uYf8rUUSBQhYE305rzjZteJr3yuieQ8BSGpFw4jLtHPNIi
	yE+iZrtKtJHj8TyMVPieE5WuQiOkCq3+GNCy2IsBwdGw5/il8oFu6pw4lEHeGnnWXBNj0PdlCoY5x
	42kWJUkMCcxMIZXDOerdgy7+70LUWGuRyBfVhpIXs0fDu4JIiUWspd1oAug6z/n3B2gCjsYy0JPls
	CcwvrBPvnZm/c/0B76TLxKaDXxHRO0we3BEt68AkOnlWqSah7Vsrbvs08hY5zPEBKSLHBtGQdM9M0
	kZjnUCUQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBrBK-00000003cNb-3Fd2;
	Wed, 30 Sep 2026 10:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790762687;
	bh=dTzeao4Dd5OND0GFZlXDfRJt+V35QYWZ01gw5rsf1aI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NycWLSNSQWt2gBDHw4Xxt5Dl8WX3/OLH+gU5+QPxIlg5uPuFlEx4ak7KtC8/tj34x
	 yIggQ4G1olUVAjEc3uFK/sGoyLROKWF2TS5E+mr+d6EW895Z8k5ei+Mr71k/g8uydX
	 DpmMb63QnIh6wCMT9XZlulxBADhB1R5IaJUtRax792ZX9BothtbfRBuqZcb+Ol1u3p
	 5MbVjYYnCQt+20bEQbT1dtSJ3vHVmvWP3Ko9Bz33i8L24sD6T2oVFtK6iW48lUcHpC
	 gIbyRLPIpDn09sLLGnZFF/a0RtIqoBEQ5ZPxVMFuNmN1fzbpXFcmn5kJSav+ESlW/s
	 IMDz1jQILrC3Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6172D17E0D7E;
	Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F83348002F; Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 30 Sep 2026 12:04:31 +0200
Subject: [PATCH v16 2/7] phy: rockchip: usbdp: Disable USB3 port during
 normal power-on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-2-bc144f80afc4@collabora.com>
References: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
In-Reply-To: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dTzeao4Dd5OND0GFZlXDfRJt+V35QYWZ01gw5rsf1aI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq83r62Ywt25O8C7r5dkleorIchz5/SfqtiN
 ly/K7ZYGK89VIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvN6+AAoJENju1/PI
 O/qalSgP/0DEpnv4T8CQb4/ODMflyZilWGGtRXqBMGAbu6WeyieqnW6/soqBWG6i7MrYS76/DK8
 lIhu5zmw8YhJuq9lani6Kk+gqeGlACp3pKbeG91Jgj0S9982wZdm+2ceUoiPX+hG5oF5LEzJRna
 Wydcfp10z155iDYTfWAySRMLtzrvPVCiLRztuFJrAeJ3DvOEVSc4xlv9MU3E3f5xQesnGiKF6ud
 +zK7d75LkbeCX8BuMSYB6DSAO9eBWKSeTBCHKizy6+XKUA9OcW5GZjMWw6XgbSFoQtByD02pvF5
 Ku4PXBwndtKJmGmh0t4feNcO+vEt9pp+JfKDHNFKVdTz5d661mPdRZux025+uznyvbWeiU7LAP1
 vCUbIH3XZnxqqUjqLaJvSq7iNwBFB/zxKWsWblDPqpYCdkLsnDUpFQ2x9n2HdtNB79tk1pyscPF
 725KUQILV7DXW2Y9hLTXE8Yeqd2ir30g21AgdhDwIZAlUoiLcNAXSmD9+E9xu07SeZlw2sM/H5R
 E04cKj4vAPjBBgdwfBUwYNDSqmsfUdtnL9aU2jgwxw38UQ/ZgsXcW6E06NSE818xcQM9RpPh9U8
 HvhfdmP1fpLu1EFJudY2RZtY1I/kwnfCfa7yR93ZRZ6yQ/H6dJoeKGm6WMv+AAGmdKuD/70ct02
 hLdOY5G+yJDUjK3LEf002LA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_110459_560809_1D85415E 
X-CRM114-Status: GOOD (  14.08  )
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

In the reset path, the USB3 port is disabled. This re-routes the clock
going from the PHY to the USB3 controller. This adds the same to the
normal power-on path, so that it behaves exactly the same (except that
the clocks routed to the PHY stay enabled in the reset path).

This hasn't been done so far, as it requires the recently introduced
PHY reset infrastructure to avoid the PHY PLL not locking during
startup.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 5e457f28269d..0f39982c70b1 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1006,6 +1006,9 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	if (udphy->status == UDPHY_MODE_NONE) {
 		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
 
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
 		if (ret) {
 			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);

-- 
2.53.0


