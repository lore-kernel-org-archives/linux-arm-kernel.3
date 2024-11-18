Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3664D4921F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bo2I2ESRILj0OhfqmXY+0n+Gsl8OPjyRH9ZU4sJ6oz4=; b=Z16oZyfqC2vjaG3MopNnjV5A+j
	Yr/b2HBudJpOFyvM6rt7/p+qkiqIit8o48COuKL2zH83B6iP0bSX7Bzhp/ZFEA4Pb3IFm8nBXxXt0
	4LisOvaYaOSeO1TMwWv2FjSqt7H9O/nw8ysYkRg1q7eOi17lTToPUcXbzl2iCVZifbwPUVWvXClsO
	StMBBjLTZYBz1N3ay2fxeOGDTsesdVh9LQ2ylHALB//4eAikfnHjHnGWqOXT+OHNoY4XVyuykrjWe
	9Yk4Mh4omdEuOS7/q2JbyVtnyH4eSDV1ycVgpS6RibjcEdIQnBbwqqlRkPs3du/wTWwXY64QrEajP
	dL1PsVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1es-00000009XhN-47RA;
	Mon, 18 Nov 2024 13:19:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1PD-00000009TqL-1uUH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Nov 2024 13:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Bo2I2ESRILj0OhfqmXY+0n+Gsl8OPjyRH9ZU4sJ6oz4=; b=aiMFWz5UuiCMgQgfrU0sEUL/6P
	IDOLNELTMw+Syv1/OqigGX2vr1UNTRjPJwj1WoQ/89RBg3t5yd/gwzuGIlLUrbVIP7XTAeu0YUNV+
	G1hj6dJfaDX7uWk3U5n0b6+5pdoNFpglT9J5CBiGcvVuHL6aL7gUy4czqoV1NIlO25hwD0EILNZPX
	doxmAormWNClmu6K2BssrOpB3ojra+MuRKBhhn2mRY0Yw13GRFBVpGYktlItrVKhCPSEvd5C4K8d9
	cQZD3dsocmLc5WkG+mnxbxubaGKyX6Lxx2/489kk+vSSSIfhfIirSsyFG1sX72jP0B74VYcQV0pjZ
	WWUHNcKQ==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1P7-00000000Dq9-0C5M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:03:02 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICK2Aq027968;
	Mon, 18 Nov 2024 13:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=B
	o2I2ESRILj0OhfqmXY+0n+Gsl8OPjyRH9ZU4sJ6oz4=; b=OZFkp+kfOQxXDgAhN
	HZIOkJDXoWcnpcIhPOOoCxKEED292Uk8inMLkybmBOyTPKrnwekjL1ZOZtaIquiY
	fnQZfXxBPUK4GMvEOrsbt9ns7IKq7sEgb4JgwIvqSqiLP3Fb0aOaNmQuL5W6axh5
	Ufbq1dRor35SmEvzYjsWYARdP10JGbZwDvAaYoutF41qrhPjTzEloESbvyUg1qxA
	18ihrtUdOgzc12ThWI2P4g6zKIFbztC9qvOjIolZZI3AaqkbZ5Im8sxSnbRDQ4ky
	VNk+UoCW5aAeUAn+QhK9h4FcRmtH6nsMTcY5JmBQBpadVWm9ek+NmTUUdp4Pb5Rt
	/FUOA==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmj6-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Nov 2024 13:02:46 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:45 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:02:13 +0000
Subject: [PATCH v2 21/21] arm64: dts: ti: k3-j721s2: Add GPU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-21-3fd45d9fb0cf@imgtec.com>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=Ntq50dzXPF1u84iPH0ii+gq7ncmvQWESeBQmF/KzVcI=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz2btX9to+2i67x3vJyCXPg61z4sFS810jhWrNvyT
 DL0zvJFHaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCRKgWG/1mFuvzdj1vKHF+n
 vdV5/WNm6U+RvVe8pOP7uNMjP/s69DMyXGWKcpa/1ubv5zVDa7tOqtizHWu3rFRrlxCIe+mVUXS
 GAQA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: y9THFNVnkJv49gUP9ineJIyRJ3fKU6fj
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3af6 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=rLJv8WYccUdZFC7c5UsA:9 a=QEXdDO2ut3YA:10 a=S-JV1fTmrHgA:10 a=j2-svP0xy3wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: y9THFNVnkJv49gUP9ineJIyRJ3fKU6fj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_130257_384693_1462B7A6 
X-CRM114-Status: GOOD (  10.86  )
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

The J721S2 binding is based on the TI downstream binding in 54b0f2a00d92
("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1] but with updated
compatible strings.

The clock[2] and power[3] indices were verified from docs, but the
source of the interrupt index remains elusive.

References for indices: clocks[1], interrupts[2], power[3].

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
[2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
[3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.html

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- Use normal reg syntax for 64-bit values
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-21-4ed30e865892@imgtec.com
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 9ed6949b40e9dfafdaf6861944b0b128b053a44f..9adc2c704ba4b38d1a0e7c9ded035fe79630451d 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -2047,4 +2047,16 @@ watchdog8: watchdog@23f0000 {
 		/* reserved for MAIN_R5F1_1 */
 		status = "reserved";
 	};
+
+	gpu: gpu@4e20000000 {
+		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x4e 0x20000000 0x00 0x80000>;
+		clocks = <&k3_clks 130 1>;
+		clock-names = "core";
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+		dma-coherent;
+	};
 };

-- 
2.47.0


