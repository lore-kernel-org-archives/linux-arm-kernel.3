Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD93ED2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4kKJyyNGMP+zZQgr44uk/UpbP1kT96tBOF82npRgiOE=; b=aaITcucA7MD+T5
	sozQDmr57ANdjdwXRQNIIH/2a/ysfiTK41iGoyXA+oMTva6KNGE0+EhU31tlSMZn++anCfq4bJNNM
	HrZVYLjegtXzvPJ9BO7+4fiATCetHLa4o6zMEjFy8CqMFKoIAg9VeGU71n5ZbooiY5FqfhXXNA/V4
	duu56hlJGfLX9NkYVCG9xoO9LDEpl2X9UJokCScWv6elny0jgvCNjEnO3YZ4jxDpuG+jUjAYFHbGS
	TwHtEc+bvPfNNpPvpYnFfeCA/JQBxul3XNv1zm3+8Y0Qid38v5KUEdf31WpDa7wW0KcJGQ+qU1bJO
	0w1UF+mc1UJEdHezujIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAeg-00000003o0X-0HqV;
	Tue, 20 Jan 2026 12:16:18 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAeb-00000003nzx-2U34
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768911371; bh=4kKJyyNGMP+zZQgr44uk/UpbP1kT96tBOF82npRgiOE=;
	h=From:Date:Subject:To:Cc;
	b=B57N/Nn+EJ/1uAiSNZyfDxvZqh+FcQzvDA2l5ic9s8j1KDjbgFrxQYfHdYr1HpA5+
	 m8kGN8kfvQ5iBSgdsT/zyMBdYIGZki1Rdoyt25I8hY23CLTQt5K6WSJIuD7FHmBoZU
	 VLv7egvWJDkEhO0ENmZeL2G1oDonzCs/r02g5ye8=
Received: from junjungu-PC.localdomain ([223.166.246.160])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id 3B790A03; Tue, 20 Jan 2026 20:14:55 +0800
X-QQ-mid: xmsmtpt1768911295tl1p7gjwg
Message-ID: <tencent_845B889AF1A932F1347EE0C09F350E491009@qq.com>
X-QQ-XMAILINFO: MokxBf7CFy2KAZPKfaaGhz/6Xh0dnUhP3Nyksr8QXxFWkw7mWbmbeeWX1DjU5n
	 6u6m3cH3zf+WM3wDSkRpo0MO5m4ERgUG5z9YbS+8o6cH19oMV+e2KmS6kPhQvktv5lcBV4jAQyoO
	 ZzH8ABOn4Bcn0gB376orX84cmJnv4XsxmChNiOoMMwnG2g887Y4pbhtK0vOiudmwBpN/cS+jMCEB
	 b6bkMiEc1gnbODfTv3FQXRE/KmhQksqXAzeZqDys7rJlvR1kBU13buYfYmZTNpvu3UGFqsTG7SFq
	 MB3NR2qoC91LvZ+yPfvgIe1fycnqNySfRDRtodHAFZ3R2a3TAlHCKWmNKQYobndILPVxst5aFAeh
	 TZZ0a4gIyO5JRQ/iOd8e8J5j9oLdCf4jXtqEu0Gp2zwOx5QcSUnT9ovoWafwoEIG86MiXKjkKyFN
	 SV7o6jmQuQPVFrZSm8rdCyr6t8t9FvQ+3gwOKZLbMwwjATOnDmhdPwkO+hBJXn8veB2F5B3C//lX
	 TZ6JerwxoymRK7WwPnz7EUNLq8zxDsqc/evo/D6vK/GRcOEtZerr3UsnUkXUuH40DQKk8KqQ5SKZ
	 ch4YMDtIvXLxORa8P0wf3xI1UrnFEL6Px58N7wY9u0vgsKMeOP5s3bHkQdDFTp5cZ6iTmOr0a/tU
	 RB0W8xIA9EOEXqcRmKPlkixK32eXBbPRH4y3Ymtlt0591RYIhAFKVClkaCIoDrOsgv3OmjgdiSlf
	 Z8L5j803aGJ7FJCEDdSegrvI99YFkWt7drjJJyPkiV3qHCtPhsZV2XIPbyAyGLw6siRAlwl6YE0U
	 GfXTKGyVjW9Xhulbc4Mp9YQsziNXq5QGWDgpKxS7pOvvIB3vvQawXKWfY3z1tpSUiQGHQ0MUzmn+
	 K58+uAx4E7snUI53bwwJYys1csHZLuwZbktAHyfTJ7PVzLb5aBeAOEQovXOjv4uJKhZEfj72j7I2
	 aq3sY/pFaHwub5PIn1S6gsJhV0NM7Ni5Ooh2SsO0TGuK7ZN/ejO3rPM+mz7a28NdXP3Zv1zKASuc
	 hgu1S8qszFqTST4dQvjMqNxvX/VFMuKYsEyHanMwSDNFo/D3+t5S/0ifE+7qBG7b6bNIsPCzq8pE
	 j1mQY2OwLQmH869PbNMVbUyDDLz0bhf3DhPgGZJ0V6wQRbFpE41c7AVrDSTXi04lchoNbTToSIaj
	 QlgU/ZKzCA2+yCAozAE+zN24nI
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Felix Gu <gu_0233@qq.com>
Date: Tue, 20 Jan 2026 20:14:55 +0800
Subject: [PATCH] firmware: arm_scpi: Fix device_node reference leak in
 scpi_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260120-arm_scpi_of_node-v1-1-0e4273d026a8@qq.com>
X-B4-Tracking: v=1; b=H4sIAL5xb2kC/x3MQQqAIBBA0avErBPMRWZXiRAbx5pFGgoRSHdPW
 r7F/xUKZaYCc1ch082FU2wY+g7wcHEnwb4ZlFSjHJQULp+24MU2BRuTJ4HO6G2cvMZgoGVXpsD
 Pv1zW9/0AlW5F+GIAAAA=
X-Change-ID: 20260120-arm_scpi_of_node-ca97b68d7cf9
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <gu_0233@qq.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768911296; l=1613;
 i=gu_0233@qq.com; h=from:subject:message-id;
 bh=ZmBDPdflrwlSIeYk3/Ms4Wt4lAKU0iixasdKi/524SU=;
 b=iKlKg8ef//jKIjJiE6xYTajpj4O7LjcJYnGXxl1w86RqMJia3Lr6ck/fKPJhXkPiASR6OFmRV
 XxKfbG697eHC9hEr5igviaHJEgerLkKHyz/rWMvbIURlGwzdFwjvdhv
X-Developer-Key: i=gu_0233@qq.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_041613_937949_EDEB70BF 
X-CRM114-Status: GOOD (  12.63  )
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

In scpi_probe(), if of_match_node() fails and the function returns
early, the shmem reference is not released.
Use __free(device_node) scope-based cleanup to automatically release
the reference when the variable goes out of scope.

Fixes: ed7ecb883901 ("firmware: arm_scpi: Add compatibility checks for shmem node")
Signed-off-by: Felix Gu <gu_0233@qq.com>
---
 drivers/firmware/arm_scpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index 87c323de17b9..6bf999a6ccf5 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -18,6 +18,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/bitfield.h>
+#include <linux/clean.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
@@ -940,13 +941,13 @@ static int scpi_probe(struct platform_device *pdev)
 		int idx = scpi_drvinfo->num_chans;
 		struct scpi_chan *pchan = scpi_drvinfo->channels + idx;
 		struct mbox_client *cl = &pchan->cl;
-		struct device_node *shmem = of_parse_phandle(np, "shmem", idx);
+		struct device_node *shmem __free(device_node) =
+			of_parse_phandle(np, "shmem", idx);
 
 		if (!of_match_node(shmem_of_match, shmem))
 			return -ENXIO;
 
 		ret = of_address_to_resource(shmem, 0, &res);
-		of_node_put(shmem);
 		if (ret) {
 			dev_err(dev, "failed to get SCPI payload mem resource\n");
 			return ret;

---
base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
change-id: 20260120-arm_scpi_of_node-ca97b68d7cf9

Best regards,
-- 
Felix Gu <gu_0233@qq.com>


