Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8117E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 22:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvT1XISWemI7eWoTeyROmYKlBgLHtamPdwfYh7kIPQI=; b=4BYIRV1jL7cokDyxq6Z/X7i4bk
	h91AGPBuVqDUyPjMXZnNUHD00hWMqzFESlX3HS0vmHnxYzmOLf2IsKYXaARaLrcXLNjVywEa4YIlO
	36qRn1E2HD7d9jfPAVf2vF4qMz8QE4gP+VpnESOWFGFds4mPXNvsoEaQ/J/iyR7ebLFAbkeEombYl
	JItZCgebkovJfuwFDFEo7vT37YkVsJ0ee2jqJdN09tyOEg6mE94oP1ePoW0VDkbuOtxKsP9CfQjF6
	H6pT9GRu06hyxPGBSDhgUqM2pJ13WMjTCJ59BHBcJ+QgiG9PDJdorCbsf18g9w/pQnTaYenmW+ghe
	uMM2lVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXp87-00000009u7Y-34Fw;
	Tue, 14 Jan 2025 22:11:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXozZ-00000009sdX-0ZVO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 22:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kvT1XISWemI7eWoTeyROmYKlBgLHtamPdwfYh7kIPQI=; b=kxNry5tHB32/o9YAG7HzyNWaS1
	NfAYtF/Q7WYnMPBSZIOvEhCUxq0Oj6qEe8UnTLCPz/xm+zqLnMkJwL5Jjn/0ujy/T5F7aquio3CA5
	HIsp6OHzUxA5cZDQeuEFTwxy2ch/WVTBbLCUbVkcZju5H7lIARmV3mcbw67QnbAu6nDJm6C/6FG2u
	bj/QKy2LRhezWipvyVLA637ma7BM5Oz2v87BgMKWx/FB6RSHgMJIDB2nY4i3QBFHGKLrTH6B8TMEk
	0NMvRjqh1u1TDbQT1VY0wP1jC8GMgO/Ex5AWXK6SIvdoTdRiF7JqNVQzofxl0T21/QdYTCvCVu9yz
	S8ETSIhw==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXozT-0000000AfAk-0Nlu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:02:30 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EClxMW029143;
	Tue, 14 Jan 2025 22:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=kvT1XISWemI7eWoTe
	yROmYKlBgLHtamPdwfYh7kIPQI=; b=VcKAV7mng3f4FRKBTOaeKmdJ6y2pqVEdo
	hW1Ef8EelcvAxpMD6blqPG+v4W0xpHb7v2wodtq0mzMYax+auAPshl9HAD3LV0mx
	jqMfQ/Kv7v3ap7yOQVeaylrxnDOqSY8c7CY+x7/VsU4ukA0WZBvIOpEm5CQgqGbk
	UfcTNjSdwHhqd6a+pa9hSHSl+fNNxD++1koo78zEtVDRcYUIOqVqn8W/ctfLzHe5
	m2qw5MiKegoF0YwmCTjK9US3f9exGe2YEeYGIe7naL4a8uQwKwIMhg7mDhlgXcej
	JI9U1ICj+PaPChmenKi1yqEvGY70Dbsh8NqsrPzrcbuydIL7CKCgw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445cnb4y8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 22:01:53 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50ELvFHm013472;
	Tue, 14 Jan 2025 22:01:53 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445cnb4y8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 22:01:53 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50ELHmIw002734;
	Tue, 14 Jan 2025 22:01:52 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443by5dj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 22:01:52 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50EM1pQJ13238874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 22:01:51 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 353365805D;
	Tue, 14 Jan 2025 22:01:51 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6A5D5805F;
	Tue, 14 Jan 2025 22:01:50 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jan 2025 22:01:50 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: minyard@acm.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com,
        openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
        joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, eajames@linux.ibm.com,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v5 05/10] ARM: dts: aspeed: system1: Add GPIO line name
Date: Tue, 14 Jan 2025 16:01:39 -0600
Message-ID: <20250114220147.757075-6-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114220147.757075-1-ninad@linux.ibm.com>
References: <20250114220147.757075-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i06E3VT6US5i_cBUUY4GI9y965_73AMM
X-Proofpoint-GUID: pkP5LmZoVsdNYoo5vwWMTKY97bEVmui0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_07,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=720 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_220228_219522_18D69F6A 
X-CRM114-Status: GOOD (  13.16  )
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

Add following GPIO line name so that userspace can control them
    - Flash write override
    - pch-reset

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 0d16987cfc80..973169679c8d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -370,7 +370,7 @@ &gpio0 {
 	/*K0-K7*/	"","","","","","","","",
 	/*L0-L7*/	"","","","","","","","bmc-ready",
 	/*M0-M7*/	"","","","","","","","",
-	/*N0-N7*/	"fpga-debug-enable","","","","","","","",
+	/*N0-N7*/	"pch-reset","","","","","flash-write-override","","",
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","","","","bmc-hb",
 	/*Q0-Q7*/	"","","","","","","pch-ready","",
-- 
2.43.0


