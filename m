Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDA2C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 02:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CU34VfRBGlFPG6xpPnVoxqZtiK8MLBnDhQFkRH1yJgQ=; b=TpQOttLlp1yP9Onje5Tzt+bSTV
	JUqeUppOnNMj4Pr/rSB8cQhOfHt8rS4qsX2DLAd4bvhEP5hX8haMOP6LBRLdQFaezoFYA5VEa3x4Z
	Zvi0stQVPcW1zmdEZAAIB/q26ojmNeNjjudJxrP5ucIAiNlOwEOjKxXgs3dbL1iHtSv2zsNorIQLh
	ODqT5gtrApR1uGX7Iohr8Ysa4yCjra6bJZUEpK8rqTvGYUu2FgfpJdFXi6euOhTNN15C/4AlvAztN
	A2Fdx4+EzWU+v1J/HjlhkhpPr1vA9tCqoutPXCGHp2KLVPPVBWCRQ2ePa9QBwy82TXOrjqjgAzhFi
	+g7uZteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9xp-000000077Cj-0wyu;
	Tue, 18 Aug 2026 02:54:09 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9xl-000000077B7-4312
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 02:54:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CU34VfRBGlFPG6xpPnVoxqZtiK8MLBnDhQFkRH1yJgQ=;
	b=x/ehyKsBnfHsPIgDHao7JuTumCE6PmOm7tqvq3HjDH3frmAvGUWA/nhr4qsoopp6YtWE2yCaI
	ItEYfcRKg7jJ5uyiklLZtw7KHMOIzRLJwhXsZ3t8jkVrCRY+Zlu4b1t0FMjPGIr00kGJy8r8wqn
	THLYghC54P9Bfd1TfixqfD0=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hPDXN4P07z1prKd;
	Tue, 18 Aug 2026 10:43:16 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 29C7B20104;
	Tue, 18 Aug 2026 10:53:59 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 10:53:58 +0800
From: Pengjie Zhang <zhangpengjie2@huawei.com>
To: <xuwei5@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>
Subject: [PATCH] Documentation: ABI: kunpeng_hccs: update the Contact
Date: Tue, 18 Aug 2026 10:53:58 +0800
Message-ID: <20260818025358.1408963-1-zhangpengjie2@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_195406_367465_06940042 
X-CRM114-Status: UNSURE (   9.78  )
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

Update the Contact for the kunpeng_hccs sysfs interfaces.

Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
---
 .../ABI/testing/sysfs-devices-platform-kunpeng_hccs    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs b/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
index d1b3a95a5518..70853468f0f7 100644
--- a/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
+++ b/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
@@ -3,7 +3,7 @@ What:		/sys/devices/platform/HISI04Bx:00/chipX/linked_full_lane
 What:		/sys/devices/platform/HISI04Bx:00/chipX/crc_err_cnt
 Date:		November 2023
 KernelVersion:	6.6
-Contact:	Huisong Li <lihuisong@huawei.com>
+Contact:	Pengjie Zhang <zhangpengjie2@huawei.com>
 Description:
 		The /sys/devices/platform/HISI04Bx:00/chipX/ directory
 		contains read-only attributes exposing some summarization
@@ -26,7 +26,7 @@ What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/linked_full_lane
 What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/crc_err_cnt
 Date:		November 2023
 KernelVersion:	6.6
-Contact:	Huisong Li <lihuisong@huawei.com>
+Contact:	Pengjie Zhang <zhangpengjie2@huawei.com>
 Description:
 		The /sys/devices/platform/HISI04Bx:00/chipX/dieY/ directory
 		contains read-only attributes exposing some summarization
@@ -54,7 +54,7 @@ What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/lane_mask
 What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/crc_err_cnt
 Date:		November 2023
 KernelVersion:	6.6
-Contact:	Huisong Li <lihuisong@huawei.com>
+Contact:	Pengjie Zhang <zhangpengjie2@huawei.com>
 Description:
 		The /sys/devices/platform/HISI04Bx/chipX/dieX/hccsN/ directory
 		contains read-only attributes exposing information about
@@ -83,7 +83,7 @@ Description:
 What:		/sys/devices/platform/HISI04Bx:00/used_types
 Date:		August 2024
 KernelVersion:	6.12
-Contact:	Huisong Li <lihuisong@huawei.com>
+Contact:	Pengjie Zhang <zhangpengjie2@huawei.com>
 Description:
 		This interface is used to show all HCCS types used on the
 		platform, like, HCCS-v1, HCCS-v2 and so on.
@@ -93,7 +93,7 @@ What:		/sys/devices/platform/HISI04Bx:00/dec_lane_of_type
 What:		/sys/devices/platform/HISI04Bx:00/inc_lane_of_type
 Date:		August 2024
 KernelVersion:	6.12
-Contact:	Huisong Li <lihuisong@huawei.com>
+Contact:	Pengjie Zhang <zhangpengjie2@huawei.com>
 Description:
 		These interfaces under /sys/devices/platform/HISI04Bx/ are
 		used to support the low power consumption feature of some
-- 
2.33.0


