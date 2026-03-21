Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94D5109446E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 11:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oOotOs/ctlIraeRmjW/9DsRhuEEOxJU6EA0pVyPeSiY=; b=bBbKMaekxbyx9nYKme+Z9+bBGb
	42bYFkqv14OfMUVksSGSdncDPGtZqw/m+pdWQHJHUfAniu05I3kER44KzqanzbK21R78WLoPtigpF
	arj/mDP4jAxk8TSwnmjUCdYI2j6Cwjtjcwd2u9EwjrLuM8dxtpEkKqOBbgCsDGE9p3ZjzuJF5JAzC
	WcYDVHDBVhJ3FlYQN0w0vPEO9DTAhwMqsDX1vc5MpcOaHwMRiorHQRHYJJh3Dzalvh/dyIIdoswB0
	JnKa4hSzv/xB+YDJY7shi6fcKa3aJ/AUIvQpD7c2zA4IaPKlpPuIxDU7JjOhLtfIAqSYhm5b92459
	FR8qH8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3u4c-0000000ENhc-0WFa;
	Sat, 21 Mar 2026 11:00:54 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3u4V-0000000ENdm-1by3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 11:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774090792;
	bh=oOotOs/ctlIraeRmjW/9DsRhuEEOxJU6EA0pVyPeSiY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=CAGvFGT/Zq2UVK/hw1uDrDuhYd1y9RsMqTXg5s1j0KEg3RKBBG/57oUeW3XIZI2Y0
	 q3YlkPE+SFuURYsWhmSH9POl0HqduiQSA1S6QX35/beA7CZfx6sxBcbQO53LKmuwYa
	 dElwGqK7yhMDk8MZZ1j5URQQbF1nnuSnstEUiNkM=
X-QQ-mid: zesmtpsz5t1774090788t795305cb
X-QQ-Originating-IP: Xmmk9C+dJ5H3lxuXwZB/lw75AEOGTDP2jMQu+s+hbMM=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Mar 2026 18:59:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16498299433407112095
EX-QQ-RecipientCnt: 12
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	kexinsun@smail.nju.edu.cn,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: [PATCH] spi: pxa2xx: update outdated reference to pump_transfers()
Date: Sat, 21 Mar 2026 18:59:45 +0800
Message-Id: <20260321105945.8224-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: NhVJZi/nXXk/yRjx5B8AAaBaG8FIvfYi+lXTyhFNz+DKWPW8jhUS7Cy4
	XHyB1cBwRoiBQLPTo4i6TuvwGj/Bv2MHemo/5fWwbbDwVoKzHATC8s7HNcipHIQ6/ugKakY
	kYJHV+suRjTJmKCh5O02AFvSiaDHp+3g3xLLagr/uRFAkFbNPRqvlVL2ivOVWX8j/0hLabO
	v0zF9M7ahoAUXkmV+ZRptyT9tAX2PzCj8k4xOXwkBGXDHe3GRMiS00kaoU/6oNca6P9fTz0
	MXLUJn4VCVwcUIAAELdBmD73RYXc8Cw/10LhbiIhBhuYv5f9ZUiGnTQ+O1hioglCwDzGIk7
	zSYg0Zr2cd28/Ddul6S/Qw7HMTnuEUrSiQVC12ebYQl+KL3gnd/mVe9VULVczT/iHX1CzW7
	XqqoR3sLY9HMUA2CRymPUUe0EvgOH28J77GUST/rWWZi33Ao/K2/Vzkbf2gHVxGsNZrZkZE
	xL7J1Bxh6JqG3lcSthDdbmSajFNHpihEXhkvRfGnlFKiIZc+b/2Obc1mYgYpcf+izLpeZBg
	yJj5vlW1mNeYy0l8g4x5FBmmVONMCyQXj6pM4pGvYabdMeipOlRiK507xF6+RkVQaS4oseC
	BgYE2X2t524cq+P1940gGCIdpmGImZjeLq/MQ8fHFo4ZUVmlUy4g3PgDOEGCjaPzEjY38Hl
	xW7nSKX7yLO7Y31kv2aobyoeG6la00TmVn0UpTVcFLiTwQoeJ7YZOX/8PE3JD6yUUtD7n4U
	ixAtFor6a6Q3xVHZCh/6rPMOAlBfBRYMQl9huF1bgLQAAqev1sNthnKDYaYf7oEvWACJxMK
	X/DiCrd+TMNQF7ySgp23sBJg5VQLdGyX+GWlN+AZd4nnCRS39KwY/PCC2QWsgs9ltycO5xn
	Bekogp/oxc7o+/Y8nqztsHVeELMWl6SJXo12hl4K8fWKuR8TR3zfP0Sgi6W8wVulgmF462L
	+RfAb26bFQ6hTa4938ObAdhM9SeIFr2eyAdKDi5w9mxAYiY1oC0mgJZaW9lnOhfYSk0TAbG
	GvCMBZY4VfLXk3CjcC6BHUFEVqiCUJGIS2eBxV7n3mV94Y5Qw12idrIQDtbjYvcaxbmeuNm
	+8+kcR3ju9q
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_040047_908585_6F4022BE 
X-CRM114-Status: GOOD (  10.09  )
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

The function pump_transfers() was split into
pxa2xx_spi_transfer_one(), pxa2xx_spi_handle_err() and
pxa2xx_spi_set_cs() in commit d5898e19c0d7 ("spi: pxa2xx: Use
core message processing loop").  The comment in
pxa2xx_spi_dma_transfer_complete() still warns about concurrent
calls to pump_transfers(), but the actual operation protected by
dma_running is now spi_finalize_current_transfer().  Update the
reference.

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
 drivers/spi/spi-pxa2xx-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx-dma.c b/drivers/spi/spi-pxa2xx-dma.c
index 08cb6e96ac94..c94d1d192e74 100644
--- a/drivers/spi/spi-pxa2xx-dma.c
+++ b/drivers/spi/spi-pxa2xx-dma.c
@@ -29,9 +29,9 @@ static void pxa2xx_spi_dma_transfer_complete(struct driver_data *drv_data,
 
 	/*
 	 * It is possible that one CPU is handling ROR interrupt and other
-	 * just gets DMA completion. Calling pump_transfers() twice for the
-	 * same transfer leads to problems thus we prevent concurrent calls
-	 * by using dma_running.
+	 * just gets DMA completion. Calling spi_finalize_current_transfer()
+	 * twice for the same transfer leads to problems thus we prevent
+	 * concurrent calls by using dma_running.
 	 */
 	if (atomic_dec_and_test(&drv_data->dma_running)) {
 		/*
-- 
2.25.1


