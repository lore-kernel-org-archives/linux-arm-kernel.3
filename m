Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF2810F3DE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 13:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rFLCYdDTvsSc8eyn9nD3Tqfl6DUP1pTYa4FCzNUr3pk=; b=aTUhKAVhQ5VdZBSI3eqfGJYxHK
	uXiqMuJEomeP4uRLKajU/Gfl30L9GOKtbVR6xZDJtUC/SdlYpCgzfB1PdOjCaydHJQU4IqTar8IQr
	e/183kd+ycqP6WaMolx4u04N393SAdLd4R01ERcF4RV5n+62ON9hzHtRurbHMtXOEjpC3FnfhJ+Ef
	fg2coa+cusm63CWIham5tbGLKokSE5k3AP3WZevrN4d50YeIHMZHARLPaMTbuzkOPw2zX9bjIaXsI
	MXAC+9wxDwHjvRwZXJ8gpwQcWKLglWJDrn+3oYsTCHEk0cLi7v6qhCj88iyXLtZq/f9AaF4PMs1Wg
	l4bjdgVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6TxS-00000008zBe-0M0h;
	Sat, 28 Mar 2026 13:44:10 +0000
Received: from out203-205-221-191.mail.qq.com ([203.205.221.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6TxP-00000008zAt-3MvQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 13:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774705444; bh=rFLCYdDTvsSc8eyn9nD3Tqfl6DUP1pTYa4FCzNUr3pk=;
	h=From:To:Cc:Subject:Date;
	b=KOMCcVlLrSMQeaHojSqK/zeAnVGbtcJlrLcB+MIJE7r4kLuWoYA3Uio9bd7lLw1PD
	 ZSRpJapMBdfvWl6d+RLqyAbqbF63QTA/+ZfB4wZpguMkkBiiHJlBlyHVH9cFCsDS7C
	 i4M3Lv0WVleKTatcpwmGoxHUA4ZAi5bRPmh7xbgI=
Received: from mail.red54.com ([103.253.24.18])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id AEC8E62D; Sat, 28 Mar 2026 21:43:44 +0800
X-QQ-mid: xmsmtpt1774705424t775usdsw
Message-ID: <tencent_833D2AD6577F21CF38ED1C3FE8814EB4B308@qq.com>
X-QQ-XMAILINFO: NC4p7XQIBeahgv7/OMCpr9OjGJVJ35WpFVBu5hY3UbIKjaD8n0VNPx0ORi4DKu
	 xxvo2ulNpGH1tHptD/O0r4fn/N3oU+DBXq5Wvrksv8aJhedYI73PyPknhlyBoV4dkxU2r83r7NgI
	 NzwrZaQUBAv0z+0eZHNJpA1h98SMzsHksMuIhCNX+247Vu03Y6WYaaWg4KT4LQMkYan6BDNpOWPQ
	 3Q1EFiAJ8/xgssRkADtBVYhWiFJgMWDI5UcX08lZdUV7J0fltBxXlgX1O1FfSE3yu4vutBdiz8in
	 0/2assn8KjpWDrDI8szZiOrrhqXTV6Onvo4Ed/hJKWbAJjkiunnyj+XianaHH5GpuJjtKwRG21qa
	 fvKrrpFp/tuz993awFMvuSycJMs08dv5P0bqhAuC9oqCMSSECytdbpIAguHoY33CM7/p96qL+fdA
	 QSySXUGJETn+osENjS6n6i4rFd49XETgr/fDDmXES9/ZeS5wEHThWysFZVr1R0vXu1nLo4eS5zqV
	 uhSdn+8+EU17y4F9m1TsRe6I16vlRL3ZEbBmdaFT51n/myvF/rZU1tiP4FdGNCqyIAFSrMZYxhcb
	 5toweIp9YUzq5vL1aTc9KDVR/kAg+2as78wu9tq78FcBdbvTD3jvLT/wYPooz7bgjNPmEYzXbxPG
	 KsD5BfY5fcUZvgoiW7TS2zuFHkdCiVAFkLjevFe8hcj5UzBEOx6K9vAZ6Pf9JHOpKWaAqZUc+vUZ
	 aB7bWPbtnxcBGwWG0pNIv4p169Iy3LzBtwEsdPVk7Q6UUU/V4hM3ma7nzkB5+G5ziifQFteY8gCf
	 DNfmWwccx5xbt9L7epqJN2vRpADeHUGoAByEKcZoMIq5FotygvnsmQ0HWDrtHcOca+oX6D8x1zzE
	 jc1JhA9nzlIeGj+ErnSbK8NRYtOAWPZ3e6eJFlD02uyAbZPjb3Z2HLTIkrG54v4bvN5C+MOx9kWK
	 DMAVGvbGKMW37w+w3ZcKjYZ7mwrFOLrjm5R3uC3dWn2d0EawK+UXZJXC36iw9Z7yboR7YuPC5xP8
	 T0yvBw0DByvqqwUxMLpi2J03/iQR3kiDjE5fjiPxaLXLcAj2/q
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
To: linux-rockchip@lists.infradead.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: stmmac: dwmac-rk: Fix typo in comment
Date: Sat, 28 Mar 2026 13:43:31 +0000
X-OQ-MSGID: <20260328134331.26627-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_064408_138386_D91D48D6 
X-CRM114-Status: GOOD (  10.89  )
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

Correct the typo "rk3520" to "rk3528" in comment.

Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index b0441a368cb1..8d7042e68926 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -214,7 +214,7 @@ static int rk_configure_io_clksel(struct rk_priv_data *bsp_priv)
 	cru = !io;
 
 	/* The io_clksel configuration can be either:
-	 *  0=CRU, 1=IO (rk3506, rk3520, rk3576) or
+	 *  0=CRU, 1=IO (rk3506, rk3528, rk3576) or
 	 *  0=IO, 1=CRU (rk3588)
 	 * where CRU means the transmit clock comes from the CRU and IO
 	 * means the transmit clock comes from IO.
-- 
2.43.0


