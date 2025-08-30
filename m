Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12F3CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kM5xYGGf5Pa2dA6SYPxcECHy9sKic510waIx8ZhytcU=; b=QPim5WjWSY9x7j/wH0V1EHzCQS
	KI0K2v3aEGEmSr6SOZe+ni3Yd2g/q4EfB0k2cULly2JARzBXa0BymZA5jDNXLLbQsZq5qoGLNRHB4
	6hCYvEEtrkw2Nff+VLBaMXS/JTvsh1NUjORiBPhGuQsn5RkFViBpOOxjYTfdgibk1cEmDmOPHFTTq
	oh8lVEeoav5+rTQRk8dlL3Q/1rayYyooMRjoOxc2/FkLE0+xmbDyAKclrUaXOMxGQcHDD10R5hcgM
	6Hr62Je/H4jG0vOX72Gj/TDB2tM+yHoR/9Ia+4l7Ofl5D0AhtZoNqzGz2kH39q4Eo7K0s9wQAGyQL
	s+3bozfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usGQL-00000007ZOE-33E6;
	Sat, 30 Aug 2025 07:54:57 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usGLg-00000007ZC8-1UPc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 07:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1756540202;
	bh=kM5xYGGf5Pa2dA6SYPxcECHy9sKic510waIx8ZhytcU=;
	h=From:To:Cc:Subject:Date;
	b=XL6PxliegviTxD9zPDsPRctVm8fBjraNZRcpw3JVYsbURvuGBkO0q2QlHaN9txo7L
	 01pd1u64/R+YJ5J3CLGur6MhB0ja9ZSHWfMwmBpDy16VZsrReGeTFyU9xOoM8oNfM3
	 Tq9eZfkhrty7T/2A6ga/Nb6r5HEQuPoWA+s3dHi4=
Received: from localhost.localdomain ([112.94.77.11])
	by newxmesmtplogicsvrszb42-0.qq.com (NewEsmtp) with SMTP
	id C70B98FB; Sat, 30 Aug 2025 15:49:48 +0800
X-QQ-mid: xmsmtpt1756540188t9ie460uc
Message-ID: <tencent_1489A82090ADCB83FAFDAD60B4D46B2BAA05@qq.com>
X-QQ-XMAILINFO: MQAOa38Yz/8/T535LjUGyzhuaNsShLahvBeDB55XX87jKvJonpqQ99SIyahz1y
	 2oDbE6N9IvXb8B2fz3VYoEUqV3UEyZpgcLeOCkYTfO5dXO0OoagPTsAbYlp/xqs4ThWv2pZClvq+
	 fosaMVPSvhUiQX0MCLYCXRXwWn64aI4lbVgjJdpwMtlhQArq//sU2XJoyReM5c9CvlfhZhIyjJB8
	 cu4KG61Wv+akMnEo2LlA8Q7ffx1L04ElAWVnrMeBFCQmr1mR/wzRqB6toRzm84Y9LWMHbICyOXwj
	 4b8Not8FEzbbvf7uZHwu++1CzsHrps+/Apq+aGLzX380H1TxEyLis+dR/P2Oy8whL7lHHYlKlZKJ
	 1FJ4a0pHAuGuD/X0Eb4x7eHGN7Btzp6G85959Fk3Q/HKtXJunujUrclZzUmzQiNuAWVeMscQUMqj
	 sRJT/3VsiqbYbl/hK2ikFLbMGwWHKXfvA9DT+EKCQkToip56+YeD0iXJfgNCkFf4do2o3cfsatZH
	 a86kQwlrOLdrhYo6Xwe9NFjE+WVqKYX2bHv38ws7ywhzCiwJv9XWc+3PoiZ8lnhKT+PyuJt2CSKH
	 4J6jJRhew2SiUD8QaEfuTwV/zcW2L7chl9W010B0DYBYdelqsuZkqvOBRDb2FEvBwaB/nR/Jh9eM
	 Kq3LvwyFVDR72O06W489UFHIb/wrvdNkC6H85o+ORcopAcZ90TipRtFhx2GCl5ARyfpr7R95uTs9
	 tdZrFlYTjB29IVUiNho6xFgOQup8HtwTO1P8BjQWJkQ76zSiMHgOSwVel4hy4qPuo036A1cZyXNb
	 Jr+aGc3McDJrPdQ906N57Q7hzkekYKi0hgxXbmfSYhI9cC3uFxTwPKNq9BNslZIdNmvHR9fmqV5a
	 8x1Vd3+N5TfKYiAW6b6cBbgVR9g4TbBatMEg77mtiWqEFUkd6qre/x74ZSJQJvMk+/fFp07ILszP
	 SEy8nn066nUIRbEOKYvyiqAy4rhTxe81d5cDomXrIydf/Fjx628iplntoF0fC3H74gF55Ugr4fPd
	 m9QyJ07gQteIdtpRhGCcufCQM1vZra6HCgQDzvwQ2REMHxZSjPrZDfC7tBqs/KaG+KHiMr8SJlgv
	 Rl3ce837Pa6p7Oo2HqbV7tbcBMug==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Conley Lee <conleylee@foxmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	wens@csie.org,
	mripard@kernel.org
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conley Lee <conleylee@foxmail.com>
Subject: [PATCH 1/2] net: ethernet: sun4i-emac: free dma desc
Date: Sat, 30 Aug 2025 15:49:46 +0800
X-OQ-MSGID: <20250830074946.2665792-1-conleylee@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_005008_699652_1BF3DB04 
X-CRM114-Status: UNSURE (   8.98  )
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

In the current implementation of the sun4i-emac driver,when using DMA to receive data packets,
the descriptor for the current DMA request is not released in the rx_done_callback.
This patch fixes this bug.

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


