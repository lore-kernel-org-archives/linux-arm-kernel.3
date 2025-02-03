Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593B9C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMbi0p6QzsDqbBe7Zuf2uC7AQIslfGBnquGb7Q0ssVQ=; b=1bbpj0PuiRfjKjW34Q1U4ZWQ7v
	tloSft9uaJtq43+Ll3Waf7I9ymWQRq8u/EM1FthDK11QuxgjXwXznZzL+kKKJL4rMGndE/2vYXNb1
	5Eq8ZjTtUA2ppIdNr+2QKTW6HBJx6WgzxlCL8q7lmc/0CtFzbOISddlU9MsdiT3NWgtnvxYkKUH+t
	zw3V9NdPwcOtM21WIlk5ZNOGZhb2XrL7qPGuPnebZHRa18Q0SxB/iJxsoFv5kHSZHmh7w5Uff86br
	sc9YOtvOzRFwZMJbH4J9EmKXFZcwVcSuNfC14/8Yp6tZzN5iCFvsnwqU03HGMLZsWwOjmaxhR0fz/
	p5FRD0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1texmC-0000000FkmP-1GQe;
	Mon, 03 Feb 2025 14:50:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texh2-0000000FjeS-00Ly
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 14:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QMbi0p6QzsDqbBe7Zuf2uC7AQIslfGBnquGb7Q0ssVQ=; b=cdOGEnhW6zF2QukMUT5BGNGyR+
	08AxyA1Yz4wkAxDMArRXv/Gnhrumwnz6bQiJgb7UVXFJIB6ENhX7S3U0g0jrwqWVhHIKdvI0cIb9z
	jLxCuu327iRUHYDyYrjRFShVG+GOVVRZlCcpVic1pN434CjunxCxJ5HOgffvPjiaAsbbnfUCYDuNP
	iugMgduyJGvwJjDIlG20SKIxswpxwcdhadwSu+9KW6825Geqy9+GaE/mGxcAyq4hk8vCZIXYaXeh5
	c3NY9TwiZArYnFOK03bV1bcNV/oztgMNPDVeNpTPRQ8JnqsTxacRu3PmOAxfRX7dW6zExqULOY6++
	1D+I9o9w==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texgy-0000000G6Fs-1djq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 14:44:54 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513Cn9Ht028850;
	Mon, 3 Feb 2025 14:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=QMbi0p6QzsDqbBe7Z
	uf2uC7AQIslfGBnquGb7Q0ssVQ=; b=Ij8cHDMlVvGKdzZg/f2CNYe9335dQgUbD
	2AyYXJBaNGN/qDpwDWlSNk+LYjAF7moex8hm1PP6pHw1iHbBHuQbAF1JyFB9FOhG
	n7T4U3mJzVYFbcptCwdOMxaAb4wReQoJz38aMCaB933Tid5CYwofGS7+jQIpg41d
	oVRHh0mN4TxVdhVVH0XZRwm3Xfe2eTwbelvjYWarFNr2SediL4vLTTyQh8/tajEK
	EJo6Yxmk34P/s9tMb9WVqY7LkNMCXqHsTY38jC8z2o7OGD0Ae/4bR8y7vm5sUMAm
	sbNdo6gVJs5AW/HoCCHAEb5nHW9OM702fPYwe4ZpTxFM4u5n+TouQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44jayyd20b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 14:44:34 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 513Eevex025869;
	Mon, 3 Feb 2025 14:44:33 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44jayyd208-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 14:44:33 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 513Echff016315;
	Mon, 3 Feb 2025 14:44:32 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44hwxs709m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 14:44:32 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 513EiVqK24314604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 14:44:31 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 915AD58059;
	Mon,  3 Feb 2025 14:44:31 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9189558053;
	Mon,  3 Feb 2025 14:44:30 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Feb 2025 14:44:30 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: brgl@bgdev.pl, linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, openipmi-developer@lists.sourceforge.net,
        netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, eajames@linux.ibm.com,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v7 5/9] ARM: dts: aspeed: system1: Reduce sgpio speed
Date: Mon,  3 Feb 2025 08:44:15 -0600
Message-ID: <20250203144422.269948-6-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203144422.269948-1-ninad@linux.ibm.com>
References: <20250203144422.269948-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: g0jUcbiAnKLkpnywPyS-x7Lk9t418cQl
X-Proofpoint-ORIG-GUID: KC7nZD8i79-H2m7o0qi-m981TkoK3efa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=497 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_144452_913762_53F6EFCC 
X-CRM114-Status: GOOD (  14.27  )
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

Reduce sgpio speed to improve stability with the current PCB layout.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 973169679c8d..ca55a4fb6dff 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -401,7 +401,7 @@ &emmc {
 &sgpiom0 {
 	status = "okay";
 	ngpios = <128>;
-	bus-frequency = <1000000>;
+	bus-frequency = <500000>;
 };
 
 &ibt {
-- 
2.43.0


