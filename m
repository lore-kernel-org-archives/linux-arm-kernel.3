Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37133C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAu4/HgDFwYKCuJy0DbrcEfjWWZCGQSrhyOiOkE1P2U=; b=lyTsENWctLgYXQzQDW3q470asS
	nq2gcSfHUpLYbNo8PrIj7PtKZIMLzYV+Ab0GgJGn0OnhfMb4RtmSS4H4ObjYo8lMCnMEWsPF8Zaet
	OCS0cbSk4BRBOAPwe1v/CrEGcfoWv3YiDMYsqS7MwBOYpSG5bUdP3phJX3YouACO3udHmxdSjVi+/
	6QYbAmxGMVhtOUorC/J3s559xuVQaSSLfrd8BNLilWfJQwqhblczdljfHEN5+iNB8UzvCfhorBVfQ
	PHV8kLjJox3niF2Ucu32lHlJUwb9Al6RU3Eb1tAzyTPb6i1UiyJOFdgFuZR6/mT4xlPq5s3RXM8m+
	hqdhCuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjd9M-0000000CAhh-49kl;
	Tue, 14 Jul 2026 13:26:16 +0000
Received: from out203-205-221-149.mail.qq.com ([203.205.221.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjd9J-0000000CAgN-24S7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784035566; bh=aAu4/HgDFwYKCuJy0DbrcEfjWWZCGQSrhyOiOkE1P2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ybu7UOwG0ECZguxzaUJLdCitFrVaXH3plDxp8GahfXVY7Cvm4Gp/YV/lun9MuhH9w
	 0FNdgRoihxLoFJv6PI5zBDWdd/akNEyp5Cvjji99NyGzjBwus65xo+Grkcvm2POa5z
	 zL7Rlb/8H02VsHJVggWCnHRENnartGsrTiVCuh9g=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 683A6032; Tue, 14 Jul 2026 21:26:03 +0800
X-QQ-mid: xmsmtpt1784035563ta33l4h8r
Message-ID: <tencent_4839362F248901E45E50D9AEF6823DFA4007@qq.com>
X-QQ-XMAILINFO: MmXTV/GPeIxT3cmTG7NxYxAJWaDmtqNDgbe/zxgRXEqLMh7QsP1dKYEaH+liHP
	 U5LHB1uKWw1Y19ErzdgDsiVInjfcvdleVzcddnE9ZnxLTFLfp68Y/WKS4nNTEK797+I2YMh7E40M
	 daqYBiucrrwqN+2vYiHjoP+ikLv380TWhGxjaBwKdDi1M/4gSMSJUM4fb2KAdQJdXGR7mUy9CK0Q
	 akX0iidAUXQu19hhG8tPhj/RVr9ZL7qCnVDTrCD7BZQvlauz90oev63zzzOGKt170giB/hFIVb0T
	 LZpqlgqY1i9qJchQVCmaLgKt71QALfHXHSVn8bLpux+mCoTKwiqoPjX5nET32qO7Ibl0LixQIpVw
	 2cwHpGIVfX8upeMhp22+1n794c13Dg1Yecnw5HLoWMzoBVF9jSCLII1XcdDsMX20Ne5pCTZbYUxk
	 YzQE9/uCutFhGV8C+k5NiH9hTwLelMGeogUcP1i+PIwQdsHI0gdWfdmfDI4hsBfhfQ5LmmhvLAeM
	 pDjskIpB2yfwwpzlYS0lwyPUng5kpv0dLKSZUwncZvcFeTeTmaXRC/wbTVV/p723Nv8QwSyPAdng
	 gF08iKNsHmDOMmliZTV7nda/6QAjIjFiqx25PqNMxusTQj9V3AE0UlRqAyOwr1NsD2pwAFHDZbuX
	 /yo0ZCEx4aXLoKMD1npH5k8iCY5kLPzyukxMjMRiMINtxsdhNpKcW/v/nim6RVGUFKLbCv7c/dH6
	 FVa15WkcSdWSgPcwu4v8s2RIoRWT4fEUmQ1fg3EoG/9WiHN+RQt3fKnf3R8a4pZmeeFTrgHWoKPS
	 JbPkMrPotdyfoaZnks8MfBVNUJRZEfhLel0OrM9JUoxQw+ChNt8huV8iHGHKMWiWBUtDIUnbSOwV
	 +6HrIEMb7BBxBJlh9V3tNg77rwQFKPNzgZLESmlTGc2cjZ9/zTfRPuY8GjCpjuTED8Y9SWW2sA2b
	 ViqxCWkxHAn4z8TbFkw8u0+fvFrertWDvs0klHB0PDy0tNheKhIn570DOjrj2NhhaQHUNh+GnH9G
	 BwpgcVAHAb1NPCV25Bqk8GOC7SL1U=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Haofeng Li <920484857@qq.com>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/16] irqchip/bcm7038-l1: clean up init failure paths
Date: Tue, 14 Jul 2026 21:24:41 +0800
X-OQ-MSGID: <20260714132453.3302672-3-920484857@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714132453.3302672-1-920484857@qq.com>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <20260714132453.3302672-1-920484857@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_062613_857971_D9D6C195 
X-CRM114-Status: GOOD (  15.59  )
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

From: Haofeng Li <lihaofeng@kylinos.cn>

bcm7038_l1_init_one() stores the allocated CPU object in
intc->cpus[idx] before mapping its registers and parent interrupt.
Failures after that allocation leak the CPU object and possibly its
MMIO mapping.

A later IRQ domain allocation failure also frees intc while leaving
parent mappings and chained handlers installed for CPUs initialized
successfully. Those handlers retain intc as their data and can access
freed memory.

Free the current CPU object on local failures. Remember every parent
IRQ so the common error path can disable wake when it was enabled,
remove the chained handler, dispose the mapping, unmap the registers,
and free the CPU object before freeing intc.

Fixes: 5f7f0317ed28 ("IRQCHIP: Add new driver for BCM7038-style level 1 interrupt controllers")

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-bcm7038-l1.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 54a8557ef557..b42c4f4df6bf 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -49,6 +49,8 @@ struct bcm7038_l1_chip {
 
 struct bcm7038_l1_cpu {
 	void __iomem		*map_base;
+	unsigned int		parent_irq;
+	bool			wake_enabled;
 	u32			mask_cache[];
 };
 
@@ -247,8 +249,11 @@ static int bcm7038_l1_init_one(struct device_node *dn, unsigned int idx,
 		return -ENOMEM;
 
 	cpu->map_base = ioremap(res.start, sz);
-	if (!cpu->map_base)
+	if (!cpu->map_base) {
+		kfree(cpu);
+		intc->cpus[idx] = NULL;
 		return -ENOMEM;
+	}
 
 	for (i = 0; i < n_words; i++) {
 		l1_writel(~intc->irq_fwd_mask[i],
@@ -261,12 +266,17 @@ static int bcm7038_l1_init_one(struct device_node *dn, unsigned int idx,
 	parent_irq = irq_of_parse_and_map(dn, idx);
 	if (!parent_irq) {
 		pr_err("failed to map parent interrupt %d\n", parent_irq);
+		iounmap(cpu->map_base);
+		kfree(cpu);
+		intc->cpus[idx] = NULL;
 		return -EINVAL;
 	}
 
-	if (of_property_read_bool(dn, "brcm,irq-can-wake"))
-		enable_irq_wake(parent_irq);
+	if (of_property_read_bool(dn, "brcm,irq-can-wake") &&
+	    !enable_irq_wake(parent_irq))
+		cpu->wake_enabled = true;
 
+	cpu->parent_irq = parent_irq;
 	irq_set_chained_handler_and_data(parent_irq, bcm7038_l1_irq_handle,
 					 intc);
 
@@ -408,7 +418,7 @@ static int bcm7038_l1_probe(struct platform_device *pdev, struct device_node *pa
 			if (idx)
 				break;
 			pr_err("failed to remap intc L1 registers\n");
-			goto out_free;
+			goto out_unmap;
 		}
 	}
 
@@ -440,6 +450,12 @@ static int bcm7038_l1_probe(struct platform_device *pdev, struct device_node *pa
 		struct bcm7038_l1_cpu *cpu = intc->cpus[idx];
 
 		if (cpu) {
+			if (cpu->parent_irq) {
+				if (cpu->wake_enabled)
+					disable_irq_wake(cpu->parent_irq);
+				irq_set_chained_handler_and_data(cpu->parent_irq, NULL, NULL);
+				irq_dispose_mapping(cpu->parent_irq);
+			}
 			if (cpu->map_base)
 				iounmap(cpu->map_base);
 			kfree(cpu);
-- 
2.25.1


