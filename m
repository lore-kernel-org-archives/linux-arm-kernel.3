Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7ABC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbUuesV7B/Hl/l+uRNAZvT3az2VOWPemnWYXP7QjbFY=; b=aLAZ41UU/UBamd57MStdXnj9nv
	WFBTPLkS9E7HcadKnTzbuFhStzQo3rdRk/ZApJs3DEp4UzKAAk1GRw+fArN01lwIuu8rjYvnSxKaZ
	JXvsb82MTS7vct1emeZ/0GebPbURbX12GV4GRAf4YziaHWf8GMBv5Dm4284vqTqHhG+BJrU7sbzp0
	dDEHDHR8x2qok4o10GYf71tcQlspeieqO/NeT2H21vBYK+yy3b2l2x6gIZUqUkjMvY+Rf4LMU/TOa
	RLDZDmSecg8uQkpXQQUtNLj8dnmib2/aN5J6+40G0nm6noslBOztFVA+tx5+zVRko60Qd/FdMr7cC
	H/HRrDcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOMI-00000001KYo-3Mzi;
	Tue, 04 Feb 2025 19:13:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNu6-00000001GVn-1pQW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Feb 2025 18:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MbUuesV7B/Hl/l+uRNAZvT3az2VOWPemnWYXP7QjbFY=; b=WQg07RfnPqnxNCwoUo567KA09I
	CsB6mHwK11vJWsqvRgvxbFVzNhcV4R9GuRK7Ldzzy7X6CAS/CLOd51TXWjdYfs+oKnhM5DISJXGyK
	W3YkVWLhMvcgT+4BS0AHoTVaRakAoyxTwZJaRKq0o/SQuNxb4uz89iJz0ltuWhcxqx79qFxGRoEij
	Rs+/ApeeLG/ajUkCkfoZZB7t1iv/PML4Gm6EM0wqqwjY29FxIsmoGysuVL5YiRiV+G4IWl5oblC9q
	V5Zftg5w9E/nUhT4ylstyVfwbBEux7FD1ag3CaOAjKYpS82sbvHTzCRTTO5xUq15j2HoE+CUh4n4/
	STPFZKuA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNu3-0000000GNen-1E8K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:44:09 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514GF2N1023992;
	Tue, 4 Feb 2025 18:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=MbUuesV7B/Hl/l+uR
	NAZvT3az2VOWPemnWYXP7QjbFY=; b=T0ASFqi2vmq+5EKbyZXOLNNjD7/Rc2EO7
	LSJDcJ842dy0z+Jfuv1bqiPbfyN6GcuLy/5cwI/oQVuodGrmQXQvq/jjYtVCVhT9
	jMJln6O7x3FCItK5P/PpI1OaBqZepAPTppyoKR47eL3dnkveC8fC4qOS6mbu1Wm1
	WhimzaIqyheen4k1BJPlYEHPrP9+FoHimApYRjbbAhkoNeQNkk1rz86JcrF2H16+
	DO19hQKB1vfm87joQAZq+rA/IjeYDqiR7CEgomYzjbxNmRo0d/KIo35+6Sdz8qA4
	D6bAjjVueuxiBmCu3DnzTg+/F883EWg0LFwPPH66z1G9ow8spaRIA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44kn62h6gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:46 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 514HcvDZ021477;
	Tue, 4 Feb 2025 18:43:45 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44j0n1cm0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:45 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 514Ihi3U28377654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 18:43:44 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 320C358058;
	Tue,  4 Feb 2025 18:43:44 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 322D158059;
	Tue,  4 Feb 2025 18:43:43 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 18:43:43 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: brgl@bgdev.pl, linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
        andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
        eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, andrew@lunn.ch
Subject: [PATCH v8 3/9] ARM: dts: aspeed: system1: Add IPMB device
Date: Tue,  4 Feb 2025 12:43:29 -0600
Message-ID: <20250204184337.3896834-4-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204184337.3896834-1-ninad@linux.ibm.com>
References: <20250204184337.3896834-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zX__D1y23W2WH65VpvXGv7-CqEu1kyjP
X-Proofpoint-ORIG-GUID: zX__D1y23W2WH65VpvXGv7-CqEu1kyjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=741 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_184407_803898_48CF2F7D 
X-CRM114-Status: GOOD (  11.12  )
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

Add IPMB device sitting behind PCH module

Reviewed-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 360b9ce3c850..53d0abece02c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -763,6 +763,15 @@ i2c3mux0chn7: i2c@7 {
 
 &i2c4 {
 	status = "okay";
+	multi-master;
+	bus-frequency = <1000000>;
+
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+
+		i2c-protocol;
+	};
 };
 
 &i2c5 {
-- 
2.43.0


