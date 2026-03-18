Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E143610706E8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=62uZesHnzbAbAtLcT/bSrR0QzJua3FkYA9FtKwnOB0U=; b=hDThstFEOZCxWKbcOkmDoVwdgf
	aKZAaf9gpj9SB+PAeFO2LgSsBKkIY1xjUGqe1pxv9TJZwACQC4h83DSgqnRvYQz3SlTOS8P5LXdBX
	Cx0HsURr4xwCZXx+1QmzHhcoYIpDMR4kwVDUxIZd5YSh0agvs+MhnLA6FUddud22uxhkSL2Hxlu5s
	L/+WwW0hyJkgznGwNn4LYA/rZlruPwh/Ys2vrKGjYadpyqJZlIHoJdTMaB0GNYXeOqgvNwtXpcbVV
	K7J/k3Od/pDCEZ9CPHl6Xma7pCdMR6SLBHycUw4J3iMeXI+YO4xEWZhRnrRJcn6Lon8hCSWmm7PT1
	WqxdxFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oBe-00000008DAE-0CCR;
	Wed, 18 Mar 2026 10:31:38 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oBV-00000008D8N-4BJN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:31:31 +0000
X-UUID: 9b4440e222b511f1a21c59e7364eecb8-20260318
X-CTIC-Tags: HR_CTE_8B, HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE
	HR_FROM_DIGIT_LEN, HR_FROM_NAME, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:fd545c0e-4cd2-4fdc-85ec-820af47da04c,IP:10,
	URL:0,TC:0,Content:-25,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,A
	CTION:release,TS:-20
X-CID-INFO: VERSION:1.3.11,REQID:fd545c0e-4cd2-4fdc-85ec-820af47da04c,IP:10,UR
	L:0,TC:0,Content:-25,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-20
X-CID-META: VersionHash:89c9d04,CLOUDID:dddad63e66ba2cb0806f7727fdb4e491,BulkI
	D:260318183122F62IULKU,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|850
	|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9b4440e222b511f1a21c59e7364eecb8-20260318
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(183.242.174.22)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 135981028; Wed, 18 Mar 2026 18:31:21 +0800
From: Li Jun <lijun01@kylinos.cn>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lijun01@kylinos.cn
Subject: [PATCH] arm: mach: fix missing NULL checks and memory leaks in DT property setup
Date: Wed, 18 Mar 2026 18:31:18 +0800
Message-Id: <20260318103118.2731397-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_033130_376328_89706933 
X-CRM114-Status: UNSURE (   9.44  )
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

Add proper NULL pointer checks after memory allocation calls (kzalloc
and kstrdup) in ARM machine-specific device tree property manipulation
code. Previously, allocation failures would result in NULL pointer
dereferences when accessing the properties, or memory leaks when partial
allocations succeeded.

Changes:
- board-v7.c: Check kzalloc/kstrdup returns, free resources on failure
- coherency.c: Check kzalloc/kstrdup returns, free property on failure
- versatile.c: Check kstrdup returns, free property on failure.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 arch/arm/mach-mvebu/board-v7.c      | 10 ++++++++++
 arch/arm/mach-mvebu/coherency.c     |  6 ++++++
 arch/arm/mach-versatile/versatile.c |  8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/arm/mach-mvebu/board-v7.c b/arch/arm/mach-mvebu/board-v7.c
index 04ad651d13a0..b56ac48b1759 100644
--- a/arch/arm/mach-mvebu/board-v7.c
+++ b/arch/arm/mach-mvebu/board-v7.c
@@ -128,11 +128,21 @@ static void __init i2c_quirk(void)
 		struct property *new_compat;
 
 		new_compat = kzalloc(sizeof(*new_compat), GFP_KERNEL);
+		if (!new_compat)
+			return;
 
 		new_compat->name = kstrdup("compatible", GFP_KERNEL);
+		if (!new_compat->name) {
+			kfree(new_compat);
+			return;
+		}
 		new_compat->length = sizeof("marvell,mv78230-a0-i2c");
 		new_compat->value = kstrdup("marvell,mv78230-a0-i2c",
 						GFP_KERNEL);
+		if (!new_compat->value) {
+			kfree(new_compat);
+			return;
+		}
 
 		of_update_property(np, new_compat);
 	}
diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
index a6b621ff0b87..f9411e16ddbb 100644
--- a/arch/arm/mach-mvebu/coherency.c
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -191,7 +191,13 @@ static void __init armada_375_380_coherency_init(struct device_node *np)
 		struct property *p;
 
 		p = kzalloc(sizeof(*p), GFP_KERNEL);
+		if (!p)
+			return;
 		p->name = kstrdup("arm,io-coherent", GFP_KERNEL);
+		if (!p->name) {
+			kfree(p);
+			return;
+		}
 		of_add_property(cache_dn, p);
 	}
 }
diff --git a/arch/arm/mach-versatile/versatile.c b/arch/arm/mach-versatile/versatile.c
index f0c80d4663ca..ee9238a88b8d 100644
--- a/arch/arm/mach-versatile/versatile.c
+++ b/arch/arm/mach-versatile/versatile.c
@@ -147,7 +147,15 @@ static void __init versatile_dt_pci_init(void)
 		goto out_put_node;
 
 	newprop->name = kstrdup("status", GFP_KERNEL);
+	if (!newprop->name) {
+		kfree(newprop);
+		goto out_put_node;
+	}
 	newprop->value = kstrdup("disabled", GFP_KERNEL);
+	if (!newprop->value) {
+		kfree(newprop);
+		goto out_put_node;
+	}
 	newprop->length = sizeof("disabled");
 	of_update_property(np, newprop);
 
-- 
2.25.1


