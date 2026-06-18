Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E51DCD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 01:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ep/0QboeZTA2qFrZG68DmKFL3e//nN1SHTGwM4LQr1c=; b=FbY6m6enTl+bWfCY3VIJlcCXfw
	RLLV2Wm9HVYUjyMkQrbJTNBhV23qJZ6lufUCFqfa01IqTlMwYnT4ncpMV/qSVGvD3+KYPKdKrmPK9
	ngC8HyyTycq6CnghcPNdVoxg+AGDQji6uM2+hZNlVDfmYI8JB97BGwgXPdfpTVp4ljBT/rwEX4M5C
	j3KDjh6HEzz6Xp6JCJKgIliNKNSLNWwudLAVyn9C9K4jD+9XKJdzjMvSPUErTXDYPIWRzFRDXoBqn
	SnGBN3i60kdq8XT/DxTvf3IzV3P0VpTIC/mOqmLsGWPfw1ywvNO+AbS1OvTT5qyoVaVauzBNrCcm3
	kC/eDkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1Ll-00000000TVE-1XLg;
	Thu, 18 Jun 2026 01:15:21 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1Ld-00000000TSM-22Mc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 01:15:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4ggjSG3jZ8zYQtth
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:14:38 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id E939740590
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:15:09 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP3 (Coremail) with SMTP id _Ch0CgC3XQmXRjNq00isCA--.10914S6;
	Thu, 18 Jun 2026 09:15:09 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH v2 4/4] irqchip/gic-v3-its: some minor improvement in comments
Date: Thu, 18 Jun 2026 09:14:59 +0800
Message-Id: <20260618011459.58347-5-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260618011459.58347-1-shikemeng@huaweicloud.com>
References: <20260618011459.58347-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgC3XQmXRjNq00isCA--.10914S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Gw45Wr13Ww13Cr4rJr43Wrg_yoW8JF1kpF
	W5Ga42krn3CFWj9r1Dua109Fy5tan2kFZrKrZrG34Fqa4DK3sYgrWUtryagFn3Gr13Jr4Y
	9FWS9r48Z3yjyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAV
	WUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUvYLPUUUUU
	=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_181513_711223_A0F8F6FC 
X-CRM114-Status: GOOD (  13.33  )
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

1. "If it some" -> "If some"
2. "by table by reading" -> by reading"
3. "reading bit at offset '62'" -> "reading GITS_BASER_INDIRECT"

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 449e2cfd0c99..5bc8bba733dd 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -163,7 +163,7 @@ struct event_lpi_map {
 
 /*
  * The ITS view of a device - belongs to an ITS, owns an interrupt
- * translation table, and a list of interrupts.  If it some of its
+ * translation table, and a list of interrupts.  If some of its
  * LPIs are injected into a guest (GICv4), the event_map.vm field
  * indicates which one.
  */
@@ -2504,7 +2504,7 @@ static bool its_parse_indirect_baser(struct its_node *its,
 	if ((esz << ids) > (psz * 2)) {
 		/*
 		 * Find out whether hw supports a single or two-level table by
-		 * table by reading bit at offset '62' after writing '1' to it.
+		 * reading GITS_BASER_INDIRECT after writing '1' to it.
 		 */
 		its_write_baser(its, baser, val | GITS_BASER_INDIRECT);
 		indirect = !!(baser->val & GITS_BASER_INDIRECT);
-- 
2.33.0


