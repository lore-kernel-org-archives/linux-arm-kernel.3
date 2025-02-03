Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DDDC02194
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2Jh7wxBPDIMXjM/IX68myxQ1J5TffG1POfQiRFYLQc=; b=WySSJbrWT8pHBukncAKfB2LDsX
	11TrSlx+hu9zDQibJbTNyO3Gwx3WnqUVgatC22wJfGxtq+WdQ4QqzBMlEzxpT3n7f4LbHNnYWlvqS
	JyCwpgmX9ZyKnIB2gu1MZgNxkEPXFL9qWIy0HZYt28x4NBaMWQWC87D1MAtMxAuZNmYAaM8mJwlxA
	tCBlSMEW+DN2hu3g0Z5cKv6hip5rHdPJOYc+qKgVApSL+XU3oT0RfFFL+u6WotQ2IuLzwHDNAo0Sg
	50hUXKkelRFpKGHUxUu27uUCeK3TT6+aubhRyBzNwVtqNh+xK/8DYPdMV2hl8FJ6OV61b4XYMv7c4
	54YVEHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1texsi-0000000FmAQ-2rxI;
	Mon, 03 Feb 2025 14:57:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texh3-0000000Fjhe-28n6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 14:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=M2Jh7wxBPDIMXjM/IX68myxQ1J5TffG1POfQiRFYLQc=; b=p6bahLsDDKhGNARZebl2W7TLF1
	U4vsrztWvij0/q4DWJAX26yzHd0eXwqG/NBwfmhOTyHqm6Zz41Wkso0ZiZK7rAsWvuiGAwobah00j
	GgHihTOUTTQ5kuVm9fZj08f/CrcSUoJ3jTI9f7mClY9S6mCHqH6P7HPOq+psMnnmHcw8rAibLXVNY
	ZIYjZeZAYE3ymnITGPRJohhpdIE2yp/3hMhJcJOdo2wsGFK+P4uzwsZEuiXC3qRSpbGZBQBXZirpG
	X3Fm/2bei8XWzC3eWcfW5rPvmvKwilHGyuvAR7NFT1gZo0YswY2HHoyOcySTnbCwPyuz3vt/OXhqI
	zwH5ruLg==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texgz-0000000G6Fr-2ZmB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 14:44:56 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BTiui005121;
	Mon, 3 Feb 2025 14:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=M2Jh7wxBPDIMXjM/I
	X68myxQ1J5TffG1POfQiRFYLQc=; b=cVwjvfZNoAhV6J5q1ZqcqgbmiiIEP2AbJ
	/uX9iZ0Q91zdoQhUeXxfflXJpZrt+cyaJfVCdZrckhIYijIFN9TBFDDVqqR5a6+N
	MI+TLxQrxq7zOF/POw1xNoFdlWF8AH8sLQhvr5RDjEV6nCalHXhut0ovM12cCs1Z
	Jup2+FzX3nsWikLG8oceuokLFI1ivM6vAu9EeezwG2P5zyR5y2+r1mYDr3yi0LKP
	3GcBqAoHlEtBsBE58eJ//WJY7p3yCTuWNGiLM0lqHNaN24GXDiR0SPh6Xw7ocUlo
	kDXPmhPMIAdOCw7kOP5H7J/7akdIwn4eW87icF6Dwok5Ezr6qTUGQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44jbht4kmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 14:44:30 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 513ER4oN014109;
	Mon, 3 Feb 2025 14:44:30 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44jbht4kmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 14:44:30 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 513BKB9U007133;
	Mon, 3 Feb 2025 14:44:29 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxayewn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 14:44:29 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 513EiS8i32375478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 14:44:28 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CFEB58043;
	Mon,  3 Feb 2025 14:44:28 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BB4558059;
	Mon,  3 Feb 2025 14:44:27 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Feb 2025 14:44:27 +0000 (GMT)
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
Subject: [PATCH v7 2/9] dt-bindings: gpio: ast2400-gpio: Add hogs parsing
Date: Mon,  3 Feb 2025 08:44:12 -0600
Message-ID: <20250203144422.269948-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203144422.269948-1-ninad@linux.ibm.com>
References: <20250203144422.269948-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: B5T2TYz3z5qXcMOMhRJn2OKoCV8aJwHj
X-Proofpoint-GUID: VAqdRPferty-yjJ2VS_wGn6j9OmBQkrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_144453_949618_13C9B40E 
X-CRM114-Status: GOOD (  11.43  )
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

Allow parsing GPIO controller children nodes with GPIO hogs.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 .../devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
index b9afd07a9d24..b16273e69dfe 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
@@ -46,6 +46,12 @@ properties:
     minimum: 12
     maximum: 232
 
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
 required:
   - compatible
   - reg
-- 
2.43.0


