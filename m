Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70487CDB47A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 02:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQnqD75kBJnahVKlM/6rigGCn7nU8AXfVUYkFe+azzo=; b=eCG4eIw84gjYVS3d1JfX20K1nW
	pjC984/Ku2EAjsXXbZ9kKQWVECTYKxgg52y+ihetRcZ/P0IpvJsZE0aCksuutGUeu246L1M6XESNQ
	oaAk0luKOOQCN9wNVKcC17IIT08f3BwzU1L+PnOGg/m24D2qZpKNf01CDXoUeNE5poX42UklykaRk
	W2NYZ1albpwm7jIjoYCVTsi0cjVG+lKsc3tq1rmedh+6Y0y5aWeKH8J+FWFHb9oeH3K5Wk6msSpCd
	YgJ1vtnVzgSyHy1j2xd5PAi84L86cRy44fWWez0w1h6cVsnhGp/Y8KlSkoGFQWCt2hc6dFAaNTO01
	MqNQDtQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqSU-00000005Zh4-35PQ;
	Tue, 23 Jun 2026 02:01:50 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqSR-00000005Zes-2F3O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 02:01:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gkpFS2CxhzYQtx4
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 10:01:00 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 4F28F40590
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 10:01:40 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with SMTP id cCh0CgCHiD0A6TlqxaQZCw--.5730S7;
	Tue, 23 Jun 2026 10:01:40 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH v3 5/6] irqchip/gic-v3-its: some minor improvement in comments
Date: Tue, 23 Jun 2026 10:01:34 +0800
Message-Id: <20260623020135.3584-6-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260623020135.3584-1-shikemeng@huaweicloud.com>
References: <20260623020135.3584-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgCHiD0A6TlqxaQZCw--.5730S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Gw45Wr13Ww13CrW7Jr1UZFb_yoW8JF1kpF
	WUG342krn3uFWj9r1Dua109Fy5tan2kFZrKrZrG34Fqas8K3sYgrWUtryagFn3Gr13Jr4Y
	vFZa9rW8u3yjyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUvYLPUUUUU
	=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_190147_760847_D080ADDC 
X-CRM114-Status: GOOD (  13.41  )
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
index 244509701070..120f6f29e978 100644
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
2.36.1


