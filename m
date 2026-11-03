Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EFC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qChHmpmd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lm1QxztJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Xny6TxdisJDz1rgCYagKSUk768TV4NYM8IYebe0cybY=; b=qChHmpmdNPcgt4mSkVtwEdp2Jv
	iBmq8WhP1rwGXpmd0FbsfDYzcXKRfiC6MMhA7sDeEDqD7+1pK/u+muv9cwlTUrjkZ2Uszsg8VN33L
	mIcZBMAGhHUsElrmTOC4ddyuntrmfv0Vke0vbC+eKCURo8SOsrRVtYESVb5YjnVjP9gCi3hqCZRZI
	Iv01lr6vfFdivz403R4RtT+Kwvc8CjSYaZLakfKbdNpI2FZXzt2NVldP+cn0GBZN6+hPyrjLnQB79
	Yjth/4RFlxTKYHxN4vAccz2ac25Hr36Vgx505yOSEXP2o8gDzAEIk6Voyxu8nad84fetXCex/JbFS
	yIcEALoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKxg-00000003bpK-3ntg;
	Tue, 03 Nov 2026 20:18:28 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKxd-00000003bow-2KpX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 20:18:27 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-917aca1aee5so597546d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 12:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737103; x=1794341903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xny6TxdisJDz1rgCYagKSUk768TV4NYM8IYebe0cybY=;
        b=lm1QxztJ8WgZvtZFyQcqDyab4QcrXeRHrzaCW2onjNcBEnJXz5d2OYiwNngKy2d8mD
         hr9FfhS2uilTCmG8nBFwjR1yuHfQyl9eU+o32F+DSQ+5G6Xr5LX9UCzBsIYfargVhNp3
         kAGhh7OBOTW54Y8fLO2GFyK+LUT0yBYW2abnJjwQnLDdsU28O6evgvUf9KvCJwq8WUK3
         3E1uAW8TDiq9VdN5eimZ35ZvUwggoW7XQ6cfsSE/ulq8i9f0curRG0GAX3fO6BwyXgpn
         kX6MgT9AzDUHdXHnsqkamadosmexWDFAShevHVwA54PZKfqWQeb84bYqJ0kSupZWhxkh
         7thA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737103; x=1794341903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xny6TxdisJDz1rgCYagKSUk768TV4NYM8IYebe0cybY=;
        b=aHJzlnP1pJ3eDXZnvUq7DGntKzCgD7PhgH90KOeBLuK5kOMMj73h8soaG+DbXuov3a
         Gq7G+GFVTzlpa7vWjv5127OlVGeiccR7G5IouhwwwWMAu8bbKy7cQGaJ7Io5ahttHvfu
         YF/ITiOZA9bq71lEXvs7zdc7sLb5O4FJdsPJAQuoU9wcmHXCjAE4wMBkur17P1WZPMXA
         bMg5tDmVvVGfpMP+NJaikK7C3Q3w+EJvbj4px9rIFTP4uxTKzGfTcEi+awtyLgs9DZmA
         RWC+c+6s9Mv1hzT0F8OzczD7uTbmkrwmjEtl1z1VsMaEx+iLg66MdwY2KPAeXMPMtOcb
         JzdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQQ5ZJWnBKWmx+Bn7MzP2ot7fWU4ADDsloncxGHd6jazcn0hIywpBrx8TlsMi+vCOVW/DnI0E58XkMMFvswDar@lists.infradead.org
X-Gm-Message-State: APuU4Z+dj4K4bb1wF8AgQ8A6SULChZOxbwCM8OlVrydMPGWXZf/X8hcl
	pmqAbaU2cKXbgqoNVzYVsprbu+YaW4c493IJQPXriElWPFktXQixvggD
X-Gm-Gg: AYBFou0ZUzFiKrsW8iVVYcZL8WaEP9GU7puoBV2kNAQ0Nev6StgkNSlyB/jR/Hu3rCP
	CZyChw4gckceYq5G+uM2XmOeWzTy2bP7sWEsF3NqUv7GSHUPL08wfR4Greq3HnEfPTFZjiIC7I9
	pmvyOU7JxQQXyrlbOSswpEj366Lxe882EMBMIAu/kMW22knBLPCfmw9hJUiCyKlZAOrZQGd6g20
	u7trrVmkwqwSdWdeGXpIyoGjw68bG61zWO/h2Vp1us1KjN4z7NI6hER6RHu8+/9/9I7FGlv0lRF
	JHcnu7g/QiKPdpVg9jtUMhCWKFLw7dgxFhGkErf0gjf1OEYQwqweO+hQF/q97lmdaHZkBeSDo8h
	0BvS6LjxLfv9cRrgAXVJ7gCk8/ijNxiZsXls+WQ4HrnSpxncZmZDc8tCW864fFMrU4dVXnY7Ki2
	/MmgdzWX9dinihfrQz7D2UwlXsVZniPi/bkuIhsWLPFEyrJAse6vaZqIn2/0AE6QJcALT3YTWad
	pFeZkPuj+xmYyxcRXsWgBRFijVQjMs79dOWN7wi5GjndtUgjZ7rGBvMoDfOow/Na3obcWO8h1Ca
	qQxGhVu4Qs5ye8Ec6aRG9R0nGnzxI8y0RNpL5GWq2d0yYcqGA5ss
X-Received: by 2002:a05:6214:5910:b0:91c:6cd1:8058 with SMTP id 6a1803df08f44-91ca4aea703mr226950896d6.13.1793737103352;
        Tue, 03 Nov 2026 12:18:23 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7c79b50asm1854636d6.31.2026.11.03.12.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:18:22 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2] irqchip/gic-v3-its: Drop ITS node reference on its_of_probe() errors
Date: Tue,  3 Nov 2026 15:18:10 -0500
Message-ID: <20261103201817.1259660-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_121825_656143_EF8C8F4F 
X-CRM114-Status: GOOD (  13.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

its_of_probe() walks the ITS nodes with of_find_matching_node(), which
drops the reference on the previous node and returns the next one with
its reference count raised. The loops are balanced when they run to the
end, but the three error returns (a failed its_reset_one(), a failed
its_node_init() and a failed its_probe_one()) leave with the current
node still referenced.

Declare the iterator in each loop with __free(device_node), so that the
reference is dropped whichever way the loop is left.

Fixes: c733ebb7cb67 ("irqchip/gic-v3-its: Reset each ITS's BASERn register before probe")
Fixes: 9585a495ac93 ("irqchip/gic-v3-its: Split allocation from initialisation of its_node")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
v2:
- Use __free(device_node) on the loop iterators instead of adding
  of_node_put() to each error return (Marc).
- Rebased on v7.4-rc1.

v1: https://lore.kernel.org/r/20260923165447.619477-1-oss.patchbox@gmail.com

Compile-tested only (arm64 defconfig, W=1).

 drivers/irqchip/irq-gic-v3-its.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 282e4bafb084..7c5df91a317c 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5572,7 +5572,6 @@ static void its_node_destroy(struct its_node *its)
 
 static int __init its_of_probe(struct device_node *node)
 {
-	struct device_node *np;
 	struct resource res;
 	int err;
 
@@ -5582,7 +5581,8 @@ static int __init its_of_probe(struct device_node *node)
 	 * reset, don't even try to go any further, as this could
 	 * result in something even worse.
 	 */
-	for (np = of_find_matching_node(node, its_device_id); np;
+	for (struct device_node *np __free(device_node) =
+	     of_find_matching_node(node, its_device_id); np;
 	     np = of_find_matching_node(np, its_device_id)) {
 		if (!of_device_is_available(np) ||
 		    !of_property_read_bool(np, "msi-controller") ||
@@ -5594,7 +5594,8 @@ static int __init its_of_probe(struct device_node *node)
 			return err;
 	}
 
-	for (np = of_find_matching_node(node, its_device_id); np;
+	for (struct device_node *np __free(device_node) =
+	     of_find_matching_node(node, its_device_id); np;
 	     np = of_find_matching_node(np, its_device_id)) {
 		struct its_node *its;
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


