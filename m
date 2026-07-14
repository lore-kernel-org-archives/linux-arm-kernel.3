Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074D4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1fjK4XUXV7idhQareel5ij1EIIObRm/C3guqJsgiDhY=; b=DST/qtzb2vlo2ZImzAE5jVxN5n
	GHnO4Zmw1Zuy6wf/XWaFn6uGR5a7EvMUS7SJA849CjjykDXaDgfpxLDkuyfxInZitrJBCOzsQHeXJ
	m5oUT9ridUlSL2wtT4bFdEtVkVWk1mCuSJXHlg4wc+ZsVtY+o6rG/YiKyblBqMbg8dnotsDCZGW/K
	EQcMy5xaa0RKFeqjYD/9SYzwRjCPZNHtIor/JoD68k8AUaRvM2l8tl3gJBNfIJ1au5kYhfrGpd6dS
	iYZbIFXy3EFv9qT9+GDrjbYbnm7MvXkj7QH9PHg3GyzgzhvTns9racmVzLNgwEY0+tCo1NM4ueX5g
	t9UJOShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVij-0000000AwPM-2c4F;
	Tue, 14 Jul 2026 05:30:17 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVig-0000000AwOr-2Xaw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:30:17 +0000
Received: from localhost (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABXq85cyVVqTjcmGA--.60605S2;
	Tue, 14 Jul 2026 13:30:04 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: duje@dujemihanovic.xyz,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: bmasney@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] clk: mmp: pxa1908-apbc: Remove unneeded semicolon
Date: Tue, 14 Jul 2026 13:25:25 +0800
Message-Id: <20260714052525.3219644-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXq85cyVVqTjcmGA--.60605S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXw4DArWDXFy7Wrg_yoW3WFg_CF
	y0gr1xZ345A3ZxCFy5Jr4fZryYyrs5ZFs8u3WSkwsxA3yUur47WrWF9F47J347GrZ7KrW5
	C34kKryfCry29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbWv35
	UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_223015_022403_FF8975CA 
X-CRM114-Status: UNSURE (   9.21  )
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

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/clk/mmp/clk-pxa1908-apbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apbc.c b/drivers/clk/mmp/clk-pxa1908-apbc.c
index 438ece4f047d..16c1f13bca1f 100644
--- a/drivers/clk/mmp/clk-pxa1908-apbc.c
+++ b/drivers/clk/mmp/clk-pxa1908-apbc.c
@@ -114,7 +114,7 @@ static void pxa1908_clk_reset_init(struct device_node *np,
 		cells[i].bits = BIT(2);
 		cells[i].flags = 0;
 		cells[i].lock = apbc_gate_clks[i].lock;
-	};
+	}
 
 	mmp_clk_reset_register(np, cells, nr_cells);
 }
-- 
2.25.1


