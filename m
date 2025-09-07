Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1ACCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzMRSNquciMXGu8CwgqTnQ8mVrWWx/y+NRlacn/1wyk=; b=fNNO4sKURPTEX98u/qzANG3wyD
	W6//C5H5qYtrsPCUmCti3Q9clDPT6zlGM66NwW2IvkWku4H0aDURvdOqSXRVpolrIcbk/FVs+1gpa
	Ur5IyMnzlUvzrSeulSoj3Bsf77F0TS9xYSrC6IAeQpwIbzZQZ6SEAmvbGr3qZcJg4bxNEBLBzy248
	ptZB615Wc7zC++aKn4QH6R2NZEA78i77R+YQGoSV6vNgsfZO83o20V3Whbaa7XcP/iaitiNf95u2+
	+oAFA5ASn9lyuGNEX0b+lN85G8rVRw88Ol1YL37wkbGSD9ukgLD5w5BAWSFrG/ww5UwUC4VWmgvZl
	UzGZSaRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvDe4-0000000ArXg-0U8y;
	Sun, 07 Sep 2025 11:33:20 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvDam-0000000Aqaj-07f3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 11:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1757244576;
	bh=vzMRSNquciMXGu8CwgqTnQ8mVrWWx/y+NRlacn/1wyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gpX0Kz92uA1Mx0JBMdS/8NHzjh58U/0VC8ty7W8TWk4kS12/2lYDWTo3sZBRPoFik
	 hhP8x9cwOeJsQMb8jRHv2NBB1E0R0QVZpcFTobId3sZNqKPXHx4Ghr66IjOok6+Dgm
	 yA02bdcJic00SOz/NzqOfN03nG+ugQj5zP0s2XHY=
Received: from localhost.localdomain ([112.94.75.165])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7600DAF8; Sun, 07 Sep 2025 19:29:32 +0800
X-QQ-mid: xmsmtpt1757244572tiwo0mr9c
Message-ID: <tencent_D434891410B0717BB0BDCB1434969E6EB50A@qq.com>
X-QQ-XMAILINFO: M/NR0wiIuy70eRbmROUPgRD86B27m0zZS/8QeMF6JS3ThHIw8thwK6p/sqceBs
	 av9KAoRa2Ct7uRJVzAWFPI90ILgEDmvNQFENGJSZJ6U8cH7JcdjG8Tw+em2tMVimWrrY1cUiDfh/
	 qGRaWja5RRxYOSiMJccrTZDceLExojZpKNksm+flljSZmLdtu3fvXunwQ8Y82XB6RlFQu9b/gifS
	 CbRpRg1woMJ7n0JL2WUVhKGwRVn5VOm9FOIV9ZsDXqc0srbqMl5o51d8hQheGkzRkXF5JxrO9uIN
	 1gN6JgYWPZjkSMqlrt4DqTbb5SFjBtoM0XghRwwaLnhR/0desDuqqVDsLFaYm61RVL9m2FOx4N24
	 7hZ4lRSn5yGCAMSgG290RHmRzO9L5a4oEYSP4zuFvZjLgwh0c6Ot+0LoW5mSavxlgs9iUln3akex
	 /aTTX1Sl6buy9HIbE3HVD9rqSF83ZI1fb/DhbT21BgQXUxnuDOUKyJoDYqgFakh/HTG3ZLiSOVab
	 tj1n6f8uAAe1f5QAaTdi+DgpETiXDmdW5vZxTXGB5d2tkjhWaD1qkXA7e1caer76+h3iIgOzbpBp
	 JCT8Z7VG3a3gtgj7MWDmi6Dt90DpqQj0y5421NLDVhh5hsDNDfnLp/qPXZx8+c5SO7/T8OP/OW0O
	 Q7FUZtYfZ1UUZpm9R/Xo7aIT5JqOE5toCa7v6OVTHK2VL3ZnseppQSbtIvpYgtWiP+33diVqEF5C
	 PIVKrr307Fo5UBP1CxBUSy/Qcbma3JzutaC1mpcpq1ovWZxR4FL2XvR3Pl8q5o0u2gwG5c3Co8Su
	 9x7tcDvss9sdBeHQucrrzCYCGOJ1uOeMm16sJVJe3dIbXsQ6jVcfiRrJ4z4c73xDlt7JgekAlVBr
	 PtJZ1jZW+8PY9nCbbfvteiqnXD7Gf+SN3qzh0jBMCTd4ebm+t8CG6SvKTU1UhIWMQJBpxLgOOZVs
	 nvTL8+tvm/wRBk73kdGH4TKBzp9NzgfqUA7dXSF1HJVWK4E0opxgUk8GErQxRpXR6s/Z/DLwCNxm
	 g/JnTJuxupUW4ISqu6
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Conley Lee <conleylee@foxmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	wens@csie.org,
	mripard@kernel.org,
	vkoul@kernel.org
Cc: netdev@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conley Lee <conleylee@foxmail.com>
Subject: [PATCH] net: ethernet: sun4i-emac: free dma descriptor
Date: Sun,  7 Sep 2025 19:29:30 +0800
X-OQ-MSGID: <20250907112930.712212-1-conleylee@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250904072446.5563130d@kernel.org>
References: <20250904072446.5563130d@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_042956_375744_773942C1 
X-CRM114-Status: UNSURE (   9.08  )
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


