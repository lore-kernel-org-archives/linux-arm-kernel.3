Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D53C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnSNxIgYPsgpg0tKKR24BYQMKAZxqPPimhE/YL6OUow=; b=oykLu9niN2SmEvM0c82I7HXj28
	kLSg0kklxyXNTG0FhetC5zL5JiDhKgG5TgM5SLPenAipu/Ymw1oxVtUeOEd2+4B3yVhyeXJegWYdL
	NEPAejFtUwHsb1ThUrcMxU8j2aTfSu1dNN5ZnVTgOPrXXq88c/nNY59XOxcWs2MWrk4+OQjrYVWP1
	aN2SAgxciWYulWa+FUnuPRhpWwEO5lt8ZXd+VUL9sw6Na6aCxRq2Dmwnz+025za7IThjkfxw0f1DB
	Z7rMi2fl+zeW9sjB/9VeC0s6B4oH9hnhmceWPMnI5+n9XGagRkjpeDaynPTWlTb34NvJD/tcPJqTw
	x937dp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfONb-00000001Kho-1ij2;
	Tue, 04 Feb 2025 19:14:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNu6-00000001GVl-1RDC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Feb 2025 18:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MnSNxIgYPsgpg0tKKR24BYQMKAZxqPPimhE/YL6OUow=; b=mah/L5u35sTWffow1uosUkILr0
	OZSGeLp7UvxLm6MqfegnWC3MJbK/E7L0NHoDJ1H0oQkSD2O0GruNKsnVWjyfjnubCv6pCrMKvIgiE
	BSsLFf/nDH4OXVpTYtwvY2pgd7VCM4211zdpYJbZ0iUQ4iHF+K5GuX3TuRDo2Tm3bNXGgC+2cs6Ck
	CnF017CyYw7PwOCMTX/tub16rxT6BY3S+kMR5FeTdkW2w1zxB5/bTJhyAfcBzCqbCX76KqzrvrfpS
	BHq3F1BSVTNzpvPXM8q4pL17ZlKtVA7NFthmRlMnTasq8lAgA/UupDWonHyL8bSutQtOAlGEGZv3g
	p1bdPeuw==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNu1-0000000GNeo-2ygt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:44:09 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514GEnmK023279;
	Tue, 4 Feb 2025 18:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=MnSNxIgYPsgpg0tKK
	R24BYQMKAZxqPPimhE/YL6OUow=; b=TXFC+iF5hevfdUKEdAbKUvbOlQHP40lQE
	lVyGRKSy4z9KHNLOcc1hNcBGQ6/1Lg2EHlvY30GjegOZn8DDxiOaFKk5gXFb1Wch
	xTbCLh8DCEln3UTwnUCfebDB5DvoTNr/tDc6FAz6tg4YvCIsS1f25b648aYnM/2e
	T0nEksJ7UjGZjI3OBDcJX0KFX94rZMVAWbigDHAUudq2x/nCB/Cidx2I364Hf7Az
	tIMTpGvHZ3dAu/Ue5TPxtQD7PCoekIo49aFqX6rY6A7rRcWhCLLMhUGN5bzqO6I/
	pBes+WjYHyZS1Jid/gq0/2dCIaxKtfWPyxUfyNcXsZzRq/fyRj2QQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44kn62h6ga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:44 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 514FsYEI007136;
	Tue, 4 Feb 2025 18:43:43 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxayn23e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:43 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 514IhgqR26477170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 18:43:42 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1530F5805D;
	Tue,  4 Feb 2025 18:43:42 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21FD458059;
	Tue,  4 Feb 2025 18:43:41 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 18:43:41 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: brgl@bgdev.pl, linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
        andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
        eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, andrew@lunn.ch
Subject: [PATCH v8 1/9] dt-bindings: ipmi: Add binding for IPMB device
Date: Tue,  4 Feb 2025 12:43:27 -0600
Message-ID: <20250204184337.3896834-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204184337.3896834-1-ninad@linux.ibm.com>
References: <20250204184337.3896834-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tTZGu_SeBLJ82uhjc1b188stlqVOBG19
X-Proofpoint-ORIG-GUID: tTZGu_SeBLJ82uhjc1b188stlqVOBG19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_184406_345856_3170A407 
X-CRM114-Status: GOOD (  19.32  )
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

Add device tree binding document for the IPMB device interface.
This device is already in use in both driver and .dts files.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 .../devicetree/bindings/ipmi/ipmb-dev.yaml    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml

diff --git a/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
new file mode 100644
index 000000000000..8b0d71901195
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ipmi/ipmb-dev.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The Intelligent Platform Management Bus(IPMB) Device
+
+description: |
+  The IPMB is an I2C bus which provides interconnection between a Baseboard
+  Management Controller(BMC) and chassis electronics. The BMC sends IPMI
+  requests to intelligent controllers like Satellite Management Controller(MC)
+  devices via IPMB and the device sends responses back to the BMC.
+  This device uses an I2C slave device to send and receive IPMB messages,
+  either on a BMC or other MC. A miscellaneous device provices a user space
+  program to communicate with the kernel and the backend device. Some IPMB
+  devices only support the I2C protocol and not the SMB protocol.
+
+  IPMB communications protocol Specification V1.0
+  https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmp-spec-v1.0.pdf
+
+maintainers:
+  - Ninad Palsule <ninad@linux.ibm.com>
+
+properties:
+  compatible:
+    enum:
+      - ipmb-dev
+
+  reg:
+    maxItems: 1
+
+  i2c-protocol:
+    description:
+      Use I2C block transfer instead of SMBUS block transfer.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/i2c/i2c.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ipmb-dev@10 {
+            compatible = "ipmb-dev";
+            reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+            i2c-protocol;
+        };
+    };
-- 
2.43.0


