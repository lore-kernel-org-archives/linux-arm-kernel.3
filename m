Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C7BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 02:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OsiSJNue3oSvSGz0h3bwvka4ctCLzqyQZGT/HRvfxyA=; b=hI6D2GbS+c614gclpqz2FXtRav
	/LCDBVGeIRq8InWM4owk4keKPQR8+gwaDR6GyBZKzMFDBZ6cCDInDSQD/xe4VWWn+8pAVVK9tgtxV
	9oNd1UCcnPaRKIAgBYRpO5QGykpV9Pc3PK4lOjk2A3syAgDLxtGUYxzATPf6VMC3BF0KYvFXeNPgZ
	mEy+CPmrrp3VxdU9E7/vbMCs8ERIhRYNT8f65DTW5DWPbHpHNnvlu3u40JR5kEGdSp3TFaTRx6/0q
	V9tFvKq3hiWfNZBDU7OeMTs8NHVF7qwcy0KOWd1XSfhXaAWV1zxQYF267L4ckysL90lKwOTsXgPqf
	1AUUT/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1troxp-00000004OAU-1f1g;
	Tue, 11 Mar 2025 02:03:25 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trowB-00000004O63-0PU0;
	Tue, 11 Mar 2025 02:01:45 +0000
X-UUID: be897c0cfe1c11ef8fc81fed177594bd-20250311
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b234bcf9-0f89-4181-b8d5-1bc9f5fb93f6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:a8dc348c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: be897c0cfe1c11ef8fc81fed177594bd-20250311
Received: from sdmg12.sdbg.compal.com [(10.113.168.10)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1712746592; Tue, 11 Mar 2025 10:01:28 +0800
X-UUID: bc3be75afe1c11efbcb1dfe44e3503e0-20250311
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:246652a8-7a90-4582-bff6-994eaa539fa6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:31502cc6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bc3be75afe1c11efbcb1dfe44e3503e0-20250311
Received: from sdbmbx12.tpe.compalcomm.com [(10.113.2.136)] by sdmg12.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES256-SHA 256/256)
	with ESMTP id 1019961586; Tue, 11 Mar 2025 10:01:24 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX12.tpe.compalcomm.com (10.113.2.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.1544.4;
 Tue, 11 Mar 2025 10:01:22 +0800
Received: from SDRDMR01.tpe.compalcomm.com (10.113.8.1) by
 SDBMBX13.tpe.compalcomm.com (10.113.2.137) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Tue, 11 Mar 2025 10:01:22 +0800
Received: from localhost ([10.113.71.162]) by SDRDMR01.tpe.compalcomm.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Tue, 11 Mar 2025 10:01:21 +0800
From: <jackbb_wu@compal.com>
To: <wojackbb@gmail.com>
CC: <chandrashekar.devegowda@intel.com>, <chiranjeevi.rapolu@linux.intel.com>,
	<haijun.liu@mediatek.com>, <m.chetan.kumar@linux.intel.com>,
	<ricardo.martinez@linux.intel.com>, <loic.poulain@linaro.org>,
	<ryazanov.s.a@gmail.com>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<angelogioacchino.delregno@collabora.com>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>
Subject: [net-next,v2] [PATCH net-next v2] net: wwan: t7xx: Change PM_AUTOSUSPEND_MS to 5000
Date: Tue, 11 Mar 2025 10:01:21 +0800
Message-ID: <20250311020121.914989-1-jackbb_wu@compal.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 11 Mar 2025 02:01:22.0038 (UTC) FILETIME=[7CA9D160:01DB9229]
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3092-9.0.1002-29042.003
X-TM-AS-Result: No-10--5.873200-8.000000
X-TMASE-MatchedRID: R1u6Jncx2x0JKL4K+gLNjDyjd/AizytBfb+ZO7kHlEiOEENgsUAuYpgU
	Ly4zAbFBMK5ZXGKLcVrVeptTRKjYpZvw2UxRSIa0xi///JpaHQPBOVz0Jwcxl6vCrG0TnfVU2d8
	mtRIRsUPsq6KOq5NL8IAy6p60ZV62yA7duzCw6dLdB/CxWTRRu25FeHtsUoHuxnqcz6ZslWWYXb
	VuTsbEpPAYx3Wn6HPKbO3Jmz4NWXgchXTZ3Wukbw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.873200-8.000000
X-TMASE-Version: SMEX-14.0.0.3092-9.0.1002-29042.003
X-TM-SNTS-SMTP: 4FC1307264E67CF18416129E6FBC8CE200E9B5FBF5FF40DBA15C46DDA9D0AB7F2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_190143_431607_214BBBEC 
X-CRM114-Status: UNSURE (   8.52  )
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

From: Jack Wu <wojackbb@gmail.com>

Because optimizing the power consumption of t7XX,
change auto suspend time to 5000.

The Tests uses a script to loop through the power_state
of t7XX.
(for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)

* If Auto suspend is 20 seconds,
  test script show power_state have 0~5% of the time was in D3 state
  when host don't have data packet transmission.

* Changed auto suspend time to 5 seconds,
  test script show power_state have 50%~80% of the time was in D3 state
  when host don't have data packet transmission.

We tested Fibocom FM350 and our products using the t7xx and they all
benefited from this.

Signed-off-by: Jack Wu <wojackbb@gmail.com>
---
V2:
 * supplementary commit information
---
---
 drivers/net/wwan/t7xx/t7xx_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_=
pci.c
index e556e5bd49ab..dcadd615a025 100644
--- a/drivers/net/wwan/t7xx/t7xx_pci.c
+++ b/drivers/net/wwan/t7xx/t7xx_pci.c
@@ -48,7 +48,7 @@
 #define T7XX_INIT_TIMEOUT              20
 #define PM_SLEEP_DIS_TIMEOUT_MS                20
 #define PM_ACK_TIMEOUT_MS              1500
-#define PM_AUTOSUSPEND_MS              20000
+#define PM_AUTOSUSPEND_MS              5000
 #define PM_RESOURCE_POLL_TIMEOUT_US    10000
 #define PM_RESOURCE_POLL_STEP_US       100

--
2.34.1



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This message may contain information which is private, privileged or confid=
ential of Compal Electronics, Inc. If you are not the intended recipient of=
 this message, please notify the sender and destroy/delete the message. Any=
 review, retransmission, dissemination or other use of, or taking of any ac=
tion in reliance upon this information, by persons or entities other than t=
he intended recipient is prohibited.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

