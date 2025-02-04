Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA386C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftBo0P4wnz9NKDpBszzMvbwyZf8xb/pGYa+IgAkrrJs=; b=t6NpBpQeEQxkyHrISrzP8N7L9S
	2dvdnZO554pzL3qt5J7pfhoWfxwjlm4buZ1/g/MeqqRJCg9S/CblnuC7k9QmYL2w9xKHNHl3ev2h0
	wVM23YJ15FEc1Qribk61oJ1JBMgzjGXS74abxBKgMUSe7rYaIa/L/gxwA+f7TsXFB8ZLwu+bVMPPk
	JOcnkzwG1M+N/kgYaKfANCqzekFTnaSpAEcf/L32R7J1KMO/n9E7MRinYs2MLPXQ4t+ubN/Aky2S6
	8F6e6UTMXPVRVwEnloF2TA7Z9qqwSE6yKBYSuBulrw9orfvo47DoN7uoDVUjYFe49BTPKok8K2c25
	2k6jtt2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQVa-00000001bLV-3PMh;
	Tue, 04 Feb 2025 21:31:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNu6-00000001GVj-0OxU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Feb 2025 18:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ftBo0P4wnz9NKDpBszzMvbwyZf8xb/pGYa+IgAkrrJs=; b=akCzhstpx9pZNtR4htGXM2Fm18
	f25NJBbVcYjsbfM/7f8ygqgUGqx0HCT6glhaydBDZuhogRV/UHHvcj6e/FoWSj1rkjB6hMlM0ELbS
	AfK+0Kxjs3zT/mwrNVuACfIP0ZZo0EQD02shyL+FiE6iq+eoJiQUuh460Py9lUwPMuI2NjkOipgXT
	VO/fqxml54JP3DGVhOqPeNTc1K4MsdYUdVqJyqMc33ELIp6RO4NpIbxNnQelbaJuYNFRycTdze8OZ
	E3KeybNPhNwk0iQLfh6teQvfK4kdfYdN3UKRxwlM/f7t+pusgSEUeZd9SB36oIHLI1dq0APbVjHBX
	h54z7KMA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNu2-0000000GNer-2tOO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:44:08 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514GEnM9023258;
	Tue, 4 Feb 2025 18:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ftBo0P4wnz9NKDpBs
	zzMvbwyZf8xb/pGYa+IgAkrrJs=; b=qJTkV2g9H+VKzkgK1iC9PJRulI+qPF91K
	DZuMO82Ba4wpj3gjskbvQWb80NEf31+sqBOjMd7Z6nwYakaBnvJEAXEQZh010QUE
	qUOsP/TlvwvcnDAmDbyRt/CsJG6+ekazN6kZqtNsgGSpWObxpJKnOLSDnBUgX0b7
	qmCkYrjyC5Nfpjzha/GbeeLffu1XbwjDpPy9dSjPyd7o4a3s8TjIDkmEZ7QRfOhe
	clg2DbJPFvs8NN+ResCECzaRGuh7tM36AHWPf1XetHSh1pOQ6y9loukmm0yl/ABC
	WFs3Sb+qEntRRQ03EZJVBZ8AiEiK8+U1Q+ir3xHOYtj/zA7+fkJTg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44kn62h6gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:49 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 514G94ED024533;
	Tue, 4 Feb 2025 18:43:48 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxxn4y16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:48 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 514IhlM225690652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 18:43:47 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 489925805E;
	Tue,  4 Feb 2025 18:43:47 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FC0A5805B;
	Tue,  4 Feb 2025 18:43:46 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 18:43:46 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: brgl@bgdev.pl, linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
        andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
        eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, andrew@lunn.ch
Subject: [PATCH v8 6/9] ARM: dts: aspeed: system1: Update LED gpio name
Date: Tue,  4 Feb 2025 12:43:32 -0600
Message-ID: <20250204184337.3896834-7-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204184337.3896834-1-ninad@linux.ibm.com>
References: <20250204184337.3896834-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ok2NEFjTxTqDeVdTGWEB7G2t14OhTxAs
X-Proofpoint-ORIG-GUID: ok2NEFjTxTqDeVdTGWEB7G2t14OhTxAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=743 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_184407_219447_928C9E97 
X-CRM114-Status: GOOD (  10.74  )
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

Rename LEDs with meaningful names for easier identification.

Reviewed-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index e02ff50fb48e..56357dda4b0a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -116,63 +116,63 @@ vga_memory: region@bf000000 {
 	leds {
 		compatible = "gpio-leds";
 
-		led-0 {
+		led-bmc-ready {
 			gpios = <&gpio0 ASPEED_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
 		};
 
-		led-1 {
+		led-bmc-hb {
 			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_HIGH>;
 		};
 
-		led-2 {
+		led-rear-enc-fault0 {
 			gpios = <&gpio0 ASPEED_GPIO(S, 6) GPIO_ACTIVE_HIGH>;
 		};
 
-		led-3 {
+		led-rear-enc-id0 {
 			gpios = <&gpio0 ASPEED_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
 		};
 
-		led-4 {
+		led-fan0-fault {
 			gpios = <&pca3 5 GPIO_ACTIVE_LOW>;
 		};
 
-		led-5 {
+		led-fan1-fault {
 			gpios = <&pca3 6 GPIO_ACTIVE_LOW>;
 		};
 
-		led-6 {
+		led-fan2-fault {
 			gpios = <&pca3 7 GPIO_ACTIVE_LOW>;
 		};
 
-		led-7 {
+		led-fan3-fault {
 			gpios = <&pca3 8 GPIO_ACTIVE_LOW>;
 		};
 
-		led-8 {
+		led-fan4-fault {
 			gpios = <&pca3 9 GPIO_ACTIVE_LOW>;
 		};
 
-		led-9 {
+		led-fan5-fault {
 			gpios = <&pca3 10 GPIO_ACTIVE_LOW>;
 		};
 
-		led-a {
+		led-fan6-fault {
 			gpios = <&pca3 11 GPIO_ACTIVE_LOW>;
 		};
 
-		led-b {
+		led-nvmed0-fault {
 			gpios = <&pca4 4 GPIO_ACTIVE_HIGH>;
 		};
 
-		led-c {
+		led-nvmed1-fault {
 			gpios = <&pca4 5 GPIO_ACTIVE_HIGH>;
 		};
 
-		led-d {
+		led-nvmed2-fault {
 			gpios = <&pca4 6 GPIO_ACTIVE_HIGH>;
 		};
 
-		led-e {
+		led-nvmed3-fault {
 			gpios = <&pca4 7 GPIO_ACTIVE_HIGH>;
 		};
 	};
@@ -368,14 +368,14 @@ &gpio0 {
 	/*I0-I7*/	"","","","","","","","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
-	/*L0-L7*/	"","","","","","","","bmc-ready",
+	/*L0-L7*/	"","","","","","","","led-bmc-ready",
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"pch-reset","","","","","flash-write-override","","",
 	/*O0-O7*/	"","","","","","","","",
-	/*P0-P7*/	"","","","","","","","bmc-hb",
+	/*P0-P7*/	"","","","","","","","led-bmc-hb",
 	/*Q0-Q7*/	"","","","","","","pch-ready","",
 	/*R0-R7*/	"","","","","","","","",
-	/*S0-S7*/	"","","","","","","rear-enc-fault0","rear-enc-id0",
+	/*S0-S7*/	"","","","","","","led-rear-enc-fault0","led-rear-enc-id0",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
 	/*V0-V7*/	"","rtc-battery-voltage-read-enable","","power-chassis-control","","","","",
-- 
2.43.0


