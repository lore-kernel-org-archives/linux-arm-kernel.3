Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9779CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 03:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENBQDbQCiFYsYIEJ773x0VymZaNEJfBwCBQrWtSwkgw=; b=NWlhyXJdGxxuU60V2FshrQmv5l
	Hf4S+AbCFHww4lpdwxicfwYhERO3eiNYcuNeqhiZLuVY+5qVkg8XyBE+qII0Pdz1FKn3TZtzuaBEG
	7fO5s/TlsFmUvkrHYNoq5Cw4C8NHeq+yBSt6CV4xakkzHszz7N+TYUbYXH+m1/BQ7910F2BwK/eRS
	vhxzF7rSKKfgYI3iQTMuDxS0c83LcX8BBI6NdeYB6Mofhzcv3Q/RxpG3agmBJu+6ekLjEFAOgmpej
	UaYdc+oi6yCA18M/roY4A/qDiyKRoI5OuO4Bf6t3R2i81ThSoLHXQd9hLb0TsU/yFBXodNSyE+HXw
	XRkL006g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYy1E-0000000DWAT-3QdN;
	Mon, 15 Jun 2026 03:29:48 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYy1B-0000000DW7a-2xhr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 03:29:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gdwb10VLVzYQtwC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:29:17 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 833214058C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:29:43 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with SMTP id cCh0CgAnKj+PcS9qOnxeBw--.30354S7;
	Mon, 15 Jun 2026 11:29:43 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH 5/6] irqchip/gic-v3-its: fix typo in comments
Date: Mon, 15 Jun 2026 11:29:09 +0800
Message-Id: <20260615032910.54735-6-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260615032910.54735-1-shikemeng@huaweicloud.com>
References: <20260615032910.54735-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgAnKj+PcS9qOnxeBw--.30354S7
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4xurWkAr43Kw4DKF4UArb_yoWktwc_ur
	10vFn7GayxuryfJw1Skrs3Zryqkan7uF1kW3W0qFZ0vr10q3y3Cr1DXF95AayrJFy7Gr93
	CFZ3Wr1SgrnrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb6AFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
	IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
	F7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r
	1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbMqcUUUUUU=
	=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_202945_937745_33923BB3 
X-CRM114-Status: GOOD (  13.36  )
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

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index becd8dd51720..fc32a1709f76 100644
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
@@ -2501,7 +2501,7 @@ static bool its_parse_indirect_baser(struct its_node *its,
 	if ((esz << ids) > (psz * 2)) {
 		/*
 		 * Find out whether hw supports a single or two-level table by
-		 * table by reading bit at offset '62' after writing '1' to it.
+		 * reading bit at offset '62' after writing '1' to it.
 		 */
 		its_write_baser(its, baser, val | GITS_BASER_INDIRECT);
 		indirect = !!(baser->val & GITS_BASER_INDIRECT);
-- 
2.36.1


