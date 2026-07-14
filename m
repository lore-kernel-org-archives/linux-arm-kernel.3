Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1666C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qN3UtjiHub9hKVr5go+F7XIV4S06tDyaoFiXy8s5Z6Q=; b=miNVqD1yX3TvADZ1WUXwQPGAc+
	2JOf41uIUzJI1nkUz+BANgGPEFKKdohEtW7E2UkPByadUjHUKjDYB70gCHbq26K6slWDtTyjuMCva
	mBcUyWXcpzDQLjKyvSo2OH/B4L8Z3XCMyh8Zz5iUa1rfhfrJb5xaeaMzyajhDUvVnRnpZ4q3BAqfs
	H06jE9iIsLE07rIZFN7X7QPngpaQ03a5sY4Rj8G16kdAn9W3QXmD+or/EKTl6l0sd4H77XqnOHPt1
	RYvqPZGynyz0B6tilbwgBf82Gn1Sbb+8KfBvoHtgFTnJCk7AvwU4gpyenMFo+JH0+LOnWgEklr6iO
	tIdw1ljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcz2-0000000C8BL-3P4m;
	Tue, 14 Jul 2026 13:15:36 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcyz-0000000C89F-3Bv8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:15:35 +0000
X-UUID: 1132e2a47f8611f1aa26b74ffac11d73-20260714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:42fa116b-70af-4adb-91a2-7b7314f9627d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:6eb1200554fbf767736d64c5c340f4fc,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1132e2a47f8611f1aa26b74ffac11d73-20260714
X-User: pengcan@kylinos.cn
Received: from lenovo [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <pengcan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 439562558; Tue, 14 Jul 2026 21:15:21 +0800
From: Can Peng <pengcan@kylinos.cn>
To: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com
Cc: quic_jiegan@quicinc.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Can Peng <pengcan@kylinos.cn>
Subject: [PATCH] coresight: ctcu: publish OF module alias
Date: Tue, 14 Jul 2026 21:15:10 +0800
Message-ID: <20260714131510.153784-1-pengcan@kylinos.cn>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_061534_120354_5A46794D 
X-CRM114-Status: UNSURE (   8.27  )
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

The Coresight TMC Control Unit driver has an OF match table wired to
.of_match_table, but the table is not exported for module alias generation.

Add the MODULE_DEVICE_TABLE(of, ...) entry so modpost can generate OF
module alias information for OF based module autoloading when
CORESIGHT_CTCU is built as a module.

Fixes: f78d206f3d73 ("Coresight: Add Coresight TMC Control Unit driver")
Signed-off-by: Can Peng <pengcan@kylinos.cn>
---
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..a7caa5b00b6d 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -295,6 +295,7 @@ static const struct of_device_id ctcu_match[] = {
 	{.compatible = "qcom,sa8775p-ctcu", .data = &sa8775p_cfgs},
 	{}
 };
+MODULE_DEVICE_TABLE(of, ctcu_match);
 
 static struct platform_driver ctcu_driver = {
 	.probe          = ctcu_platform_probe,
-- 
2.53.0


