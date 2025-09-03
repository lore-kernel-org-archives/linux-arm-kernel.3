Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF9CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzMRSNquciMXGu8CwgqTnQ8mVrWWx/y+NRlacn/1wyk=; b=YnFIV8NcmJzx0BtfbWh677KAe8
	eVN2ZTNKH9FVMMo4POzxIPmUoVgErUamkJyKHvUyEx5LdlNpLW3hY04/PqA2pxutMf1vNDVQ8swW4
	pDHYdf12mq34ujudp9anJLEeGijqcCiAzlmUBOUn6ZYTFy41kZJyI3fMYzyWDTPHk221khoEM7WHJ
	WMcusAidCiAkthEB9J7Q9ZV5tuRNMAapahX4Fos1NGfHAbf5ERSuNQ55JcNFbKcNFc+1hs/eScwTa
	/Nu8Wq8sXqQ3MHD+rF6nk1prC1XBuSSAFf9W87U2pNhf7VL15HOMB6WwqCHddZzSoZEO+c4s9T3yU
	Poa5BUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utj71-00000005hRG-1NIi;
	Wed, 03 Sep 2025 08:45:03 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiFx-00000005GJ3-1ZQi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1756885803;
	bh=vzMRSNquciMXGu8CwgqTnQ8mVrWWx/y+NRlacn/1wyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IvdEhXPnHOfdbp46h0p/UVIqfsfclApQ7FEIFaBryzmNb0EiUh2lRb5eoiOnQUgj2
	 USQ4tzHRwvdAa0XObwYzBm8c4Wkh2W72NJrD8sToL+30G6cduFuyiJk7yEx7Jy8996
	 HauBcVLYtafCjMAI4pB2uvZVgBtqV1ZnKDU9fDEM=
Received: from localhost.localdomain ([112.94.77.11])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id C69804DE; Wed, 03 Sep 2025 15:49:41 +0800
X-QQ-mid: xmsmtpt1756885781te2ww6i6a
Message-ID: <tencent_160BBED8A83CECDE110A344B51B6229B1209@qq.com>
X-QQ-XMAILINFO: Me8mHstNM5a8lCEGyOeB2iBqRUF6Z995iNftjEIEjBpIpA7H6UrG9igKltqiLB
	 5KsZ1fVl/e/qd9lH7WdqD5sXyGsz33vT2UUvASLtNG6QxRid/fIOH3qUPtvSdWsBJFPtmz3+M7GW
	 +OAJ6TkmZYzFm+06/X/pkJkddww9Z6h6+AxKcLWeFwTps8rTc2XGsNSwygXsTvgds1YAPK+Fb0AS
	 wSTZRR0SONaRiquWhZYzm42Lsjd5D+pEWfKXAUjZZAh2wJTUPrMeopryyA2Jk23GQJf4FuS5qQhG
	 N5XqqTETAiUxIdB6UNM/4CoRT2J7TiCm3HTAe9eDi9IASQ0iCJhTLhiuNV8xQXq/B1Vgjr5mJ1Bl
	 WO8xOwxaG1REERwQL+MkGvIfWkVnODaW2PIIOGdTZB7SBoWTpiFG7mj6mK6gtrU1dSapHN9qioW9
	 jzBko3SvT9Aq9rS2XYTMHLph/Rgkf79EHoJ/gCMzGyX1UXv6lAfc03MiifFhoCLcSH26oundLz98
	 akeZwIavqxNPA4GdNaGHgnlcPAaehCPv7nch3vbFinTdPv8wbVry+LOu0E7iRCK6toRwkEOujTtS
	 BmecV3hc3GooxSZ60Hal13fC9O+4W4r1CsQtlV+XsHKvOPh/OX/JuraUVPx/EAgNFnmP/HZ4FGOd
	 fivj73l4+Zx/fmGF9DgZyOfFGWUUfWkLdtTJ+a3NF4WZAekzjyWuHDMwp+nHwp6gA/tt7vh1Bb3H
	 ek0oCU5yHi+TBkDw9eKP093DR/pv74JMuMFU5J88bLTMkFTwcVKINSK1GYji3NTgPPFiuDXEVL7o
	 bH5g/85LhJKEPXUjIdAV1oABrOdljeinUsC8fLEum1wSr97/dPMo7Anp11ldCWzm/1WxkGfm/Lhx
	 G9JU1EdVb6T6CeS1o8+f1oxwe55YjgMMO2TWV3JPTjG67vZvcLNIUB5FR9E/XGe8iFqbPQ0MFqY2
	 5OlYx1jAM+OiooeYsEpYccSgSiEx1SH4Qb24G92WGMqQTLu5VTyDbwm5yisIRqh6gMSi9JgR+zGC
	 /ayAMkJ5O7OINCZdBK+8izZw2ZXgT3NHX88eREeQFfLxOSJYhnucoh59FnaBuxXGfucAYyxAhamI
	 mFcZwOYV1mCsRAKBBAhhkEHi0VDRkEOeehabMw
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Conley Lee <conleylee@foxmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	wens@csie.org,
	mripard@kernel.org
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conley Lee <conleylee@foxmail.com>
Subject: [PATCH] net: ethernet: sun4i-emac: free dma descriptor
Date: Wed,  3 Sep 2025 15:49:39 +0800
X-OQ-MSGID: <20250903074939.503937-1-conleylee@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250902155731.05a198d7@kernel.org>
References: <20250902155731.05a198d7@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_005013_943599_462F0E11 
X-CRM114-Status: UNSURE (   9.51  )
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

In the current implementation of the sun4i-emac driver, when using DMA to
receive data packets, the descriptor for the current DMA request is not
released in the rx_done_callback.

Fix this by properly releasing the descriptor.

Fixes: 47869e82c8b8 ("sun4i-emac.c: add dma support")
Signed-off-by: Conley Lee <conleylee@foxmail.com>
---
 drivers/net/ethernet/allwinner/sun4i-emac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index 2f516b950..2f990d0a5 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -237,6 +237,7 @@ emac_alloc_dma_req(struct emac_board_info *db,
 
 static void emac_free_dma_req(struct emac_dma_req *req)
 {
+	dmaengine_desc_free(req->desc);
 	kfree(req);
 }
 
-- 
2.25.1


