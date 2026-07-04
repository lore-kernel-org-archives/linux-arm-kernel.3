Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C5CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 12:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vrJZ91s2/LsbGDr3Ls1c+Gt8vSq5DG7f89oaeYDJFzY=; b=nB0O/thOh6F7Q2RYTOg4JQ2aZc
	BzvW1ILiIzhCS+/+NByQz1JtIr40WtRtEajQC4zjYj+LU/mwIgarURm7dy4dOzDCKMNOK3juaCbLS
	yfuXG5+p1Zkk8NUU5TNMFk4wQGyyGWvCgA5GiRqVhqdu0VF/fvDOidKh6l1+WLlV3XAlZ7JfBNdyC
	bQRQWvjfcyE9G/hLJCeSqTcphme1+oV4OGcZiYMtoXsEbIpTyukHxYMpdcKjAwsJobXaT4O3uzuUf
	kOLp+lDJNcHbS+cluiOQ6zaJdH9gp9XouSNOq4ehmi5Q6ZLoRqaOAwpldHGmzkWJpt83pD3wAyBHt
	odpcnAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfzUz-00000008QgK-3KYg;
	Sat, 04 Jul 2026 12:29:33 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfzUx-00000008Qfs-0Avv;
	Sat, 04 Jul 2026 12:29:32 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAC3r7ao_Ehq5SLWFg--.11584S2;
	Sat, 04 Jul 2026 20:29:28 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] regulator: mt6316: add missing MODULE_DEVICE_TABLE()
Date: Sat,  4 Jul 2026 20:29:26 +0800
Message-ID: <20260704122926.21586-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC3r7ao_Ehq5SLWFg--.11584S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr45uw1rurW7Aw4DuryrtFb_yoWkCwc_Cr
	yrX3Z7Wrs7urZ7KFyIqFsIyryFywn2gFZ7XryxKFWFv3W7ZF17Ca9rWrZIvw4UJr48JFnr
	ZwnxWF4fCr4a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWx
	JVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VU1
	1SoJUUUUU==
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_052931_451795_82789B0D 
X-CRM114-Status: UNSURE (   8.88  )
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

The driver has an OF match table wired to .of_match_table, but does
not export the table with MODULE_DEVICE_TABLE().

Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
information is generated for OF based module autoloading.

This is a source-level fix.  It does not claim dynamic hardware
reproduction; the evidence is the driver-owned match table, its use by
the platform driver, and the missing module alias publication.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/regulator/mt6316-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/mt6316-regulator.c b/drivers/regulator/mt6316-regulator.c
index 952852bbe923..b170506eec57 100644
--- a/drivers/regulator/mt6316-regulator.c
+++ b/drivers/regulator/mt6316-regulator.c
@@ -329,6 +329,7 @@ static const struct of_device_id mt6316_regulator_match[] = {
 	{ .compatible = "mediatek,mt6316d-regulator", .data = (void *)MT6316_TYPE_4PHASE },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, mt6316_regulator_match);
 
 static struct spmi_driver mt6316_regulator_driver = {
 	.driver = {


