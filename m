Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288B0C55180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 09:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bgahogIcNWSgjNNHpObkMr58Hhr7nMd1nKoIviohIkw=; b=JCE3NYhkKOtrD7lgQlob6u9sGt
	OamogFXQ+TbEyuClxKdxAjOuZGju5vA6gctbw9tsLX65HgUg03Sxg+4fu8Ctaq3+RA6ZzGYDoRkLT
	Tbmhm4zMAeA8N6DHebQE7gmaPx80/6N61WHz5AQFQBF2bnRac+MpfSGIGOtI4s0HGM8o0w+vLx946
	q8YEEwtzV4nQqy6wPpy93YTpV31sgf9JFt3Yaico69x4xRJShbIKt5nS3dWLUpv74tcU1mWJfyY9W
	QQzWgILeGYlNVrwAcVYuc3XIWgoY+CKxiulRDBnAkPDdwfXBXWKcJFwPJ9IPiBs1De9Jogy+tsa6J
	tYotELfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNEL-0000000DhsY-3t0W;
	Fri, 20 Feb 2026 09:55:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNEK-0000000Dhqq-1GF5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 09:55:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7929D60054;
	Fri, 20 Feb 2026 09:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E202FC116C6;
	Fri, 20 Feb 2026 09:55:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
Date: Fri, 20 Feb 2026 10:55:15 +0100
Message-ID: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Fix misspellings of "multi" and "currently".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/protocols.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 4c75970326e655de..f51245aca2594c75 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -189,13 +189,13 @@ struct scmi_protocol_handle {
 
 /**
  * struct scmi_iterator_state  - Iterator current state descriptor
- * @desc_index: Starting index for the current mulit-part request.
+ * @desc_index: Starting index for the current multi-part request.
  * @num_returned: Number of returned items in the last multi-part reply.
  * @num_remaining: Number of remaining items in the multi-part message.
  * @max_resources: Maximum acceptable number of items, configured by the caller
  *		   depending on the underlying resources that it is querying.
  * @loop_idx: The iterator loop index in the current multi-part reply.
- * @rx_len: Size in bytes of the currenly processed message; it can be used by
+ * @rx_len: Size in bytes of the currently processed message; it can be used by
  *	    the user of the iterator to verify a reply size.
  * @priv: Optional pointer to some additional state-related private data setup
  *	  by the caller during the iterations.
-- 
2.43.0


