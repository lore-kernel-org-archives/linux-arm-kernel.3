Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D72C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wFrtowCccFzvcX8ht4iQxcPq13CaOxhU4whNIXr1DpQ=; b=IrYaD+/i2aLYzlMcQ+TQanzMEq
	VMCQQPDuzdlpq9BWtdjr0yg39SNzYnw4S4fpeQSiNikmihV0HtcEaN+4n3+nj/ZS9MtLTL1j9En7H
	HMPymz7Fe4ft5BILbVtOwGW/THBD2MNKP9odM1KaaK4Kqnz2rWduxXk2QL/k+OV0BiBnW60UKkBiJ
	wbJKI69wor7emGN6DeG35CtAOHAzgqBt0rYqfelUnCLoZgJB/TuGVa2fulFAGlD6CP0vwhWRa2v6p
	A9/PIB0etG2mNd5rk4L7ApSj72Eo7CR2HB4W3qnja6Fa8aFEDN06ghApVNqEfbye6Y5nIAUzLUNz3
	qSTdWnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfzLu-00000008PQt-3iMq;
	Sat, 04 Jul 2026 12:20:10 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfzLr-00000008PQY-3jze
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 12:20:09 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAC3vcR1+khqFg3WFg--.11298S2;
	Sat, 04 Jul 2026 20:20:05 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: s32g: add missing MODULE_DEVICE_TABLE()
Date: Sat,  4 Jul 2026 20:20:03 +0800
Message-ID: <20260704122003.70108-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC3vcR1+khqFg3WFg--.11298S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr45uw1rurW7Aw4DuryrtFb_yoWDZFXEkF
	ykZrs7W3WkurWkKws3trZ3Ar1Ika4vgrykJr95K3sa9ay7Aw4xJaykCanxtw1DGrWxtF98
	Ar1kWFy8GrW2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4U
	JwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnIWIevJa73UjIFyTuYvjfUw5l8UU
	UUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_052008_311364_F924402D 
X-CRM114-Status: UNSURE (   7.89  )
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
 drivers/rtc/rtc-s32g.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
index 3a0818e972eb..86716192d10f 100644
--- a/drivers/rtc/rtc-s32g.c
+++ b/drivers/rtc/rtc-s32g.c
@@ -366,6 +366,7 @@ static const struct of_device_id rtc_dt_ids[] = {
 	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data },
 	{ /* sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, rtc_dt_ids);
 
 static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
 			 s32g_rtc_suspend, s32g_rtc_resume);


