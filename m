Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715CC606AA2B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ABw+OLAU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BXfwCsHJ;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YwD4K8Cx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mlEJRa9yCCtbgCdEyyAj5GVB0H/rCjW99b0NrWU2/vM=; b=ABw+OLAUTdO91djNRfo+UMk1x0
	csvIeU/p+s15iqWardB4ORaJs7exin9oEoeG6nK7ugybAC/evhqeWQ1/nKC/nK1KayX9AQKWx7Ipi
	VdZ28nwFcApwUE5uP4jP6CxtpRwcAELU47IQTPJn6A/VpR+eZjokKXd+iISmvwVxQTZfTIcXTu1s2
	yFGWWg+SvNL5fLO+3p2AqP7KPDfPM83unqR/4x1N6O/p6u8kU4Xtn++VN6jDNNWMomCjeqX9vJpLF
	ps2FJ8Tlo6NW8PCPyklZhAlTsUcMdBEEfPc4T6sbFDYvOzSogZZcU6l8tu65MemMShOuw0PAL8cCZ
	FF95kXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr34-0000000GT0I-1heE;
	Mon, 02 Nov 2026 12:22:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr33-0000000GSyg-18Qg
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 12:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mlEJRa9yCCtbgCdEyyAj5GVB0H/rCjW99b0NrWU2/vM=; b=BXfwCsHJePthYJX6xhsM0gaObN
	cCqck5RVZsu9puOpQ4b/A0YsL1L9oEFD35mPBLOvsbDrhmjiTrosKOKRwJws2Wm8fMOiSLAVoK7Oc
	feM+0/RQsU7dFeq6j23xPWw8+GGUpnVORwYca+Z5RNZopVlytkGyTkpD6513knhgebcIe+FT2y+Ha
	vrMWshrmt7I5xw1HvqoZbM4hcKLwg7lyihe/a7TyQxB+4GmQZZc9hQ83+VnnI68ZKGuk+h/BSM0R+
	W0e9KNqPFSX9Rgi961OyIb75zPB7EyP/aioy7JDYXZ2iCf7NVgYm3YK5HwU22o9LHXAqWWZwl70n5
	LjZHR9aQ==;
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2w-00000002Uhm-0sDl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:21:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpyfxaE6knbt0dafSiGc/xQae79r3d2KeXzWXtmql+URLxR88spG/kWeleq8GsfWgqpMjFDZ2Mcs3PJ+Qq7Ft1cqZHqWRSQ13xN/bXZs7o/ql7/grhfI5xCslSrT1rHWCG/TOE9Hy7uBQJoljFaFchsSrefxT4HZBarxkOTB0eSpntMqMgsDSnHBsgmSb4oJBBHBMHaOYg5quW2w78evV2T7Azc112qc+Om37fzezk4I8LswLugaX1004YvMCwMa8fx89/M3fo1/tU1Y0L2ckuvIzpDaQlKeKNuQtp/mIUt0j6OjE88Sk4daLgMh5M1tAsi/VQdCHTnRS+oOtD3Z7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlEJRa9yCCtbgCdEyyAj5GVB0H/rCjW99b0NrWU2/vM=;
 b=BJGYq4ecdkH/zn6DxdUTjZnyxWDv+Jr9hmTnmSmSjiuDtM+yMliEbaZoZFehkO1FB+oIfB0vUXPNTCcZBSi5EsBN4NDAFPJLdmJ83bIEpN1qlxyNpqmZVfI36RHD/esYCk6D/mPbzWmemQSRQ92gqH42Xz9mF2FqAn8DcMSc3HWmIUjRja7HpyVC0TA1E03W8rqDTAxAqWNr6wmW+jFpIhIprzgBuLkBYYGvTqBjhEwRoJoLKMI5zM7MzU5q21W3kQPCWyEaam7YQKfoCYLegSaPP+MYyWxNBcxUy82aGS6/UvHsQCUKtMOL+nsYaqacmcWsgGhxTHWxjLxux8KD+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlEJRa9yCCtbgCdEyyAj5GVB0H/rCjW99b0NrWU2/vM=;
 b=YwD4K8CxYTklLeadGXIS005oTub5AqJJG0glT8yq/FtK8MaIg4FHtoBzEl8yQhY3kPFCgqtDNgC+BgUWA0BR2wmaBXCDUy9zLHy8d/gWvkh4LN1aclr80/n1sTgM7SFtsB6LpDSC2HJi04JTt7RMvy5qY9OI/fcfJ9yYuRqHdgM=
Received: from PH7PR17CA0041.namprd17.prod.outlook.com (2603:10b6:510:323::24)
 by PH7PR12MB9102.namprd12.prod.outlook.com (2603:10b6:510:2f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Mon, 2 Nov
 2026 12:21:42 +0000
Received: from BY1PEPF00026966.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::8e) by PH7PR17CA0041.outlook.office365.com
 (2603:10b6:510:323::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 12:21:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026966.mail.protection.outlook.com (10.167.244.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 12:21:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 06:21:41 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 06:21:40 -0600
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 2 Nov 2026 06:21:37 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH 5/6] arm64: versal-net: Add SysMon and thermal zone
Date: Mon, 2 Nov 2026 17:51:11 +0530
Message-ID: <20261102122112.1723130-6-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026966:EE_|PH7PR12MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: 11389056-a5fd-46d3-0904-08df38dbda34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|36860700016|82310400026|56012099006|11063799006|261009223027099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dtnPitFW8LoVaxDr8HkTrBFGjkI+WduXKM3FW36jRaU2oAsPPatC7gZJLm4j54CkASdOwQItDWuaWMc00pqq9+epAm6jhuYrwe4InqJXaeiDHc/lqDZuBLWuju5JEEGO7Rn/drKzAwPwb3/XpZA1PoAWwHB2eMivOEx8vYrJBcroQTkdGjKALz1Pa3fo4i6SfOFl+kKjgy420hjM+0lqNWbpSYHe/y9VdnYjtJKgZoxtW2aik+QIbqR2Ip26U3O2Ugj0rKxOoOshxDhrQGGAuUS6vdqDRAVxxy8lQ2lZ2qU7H7n5sspJwaEqEZZ7HKsc666vnpnb8JdloUnaFW8DxbnYz00zJkOwSLFv6EPmJxIReXUDrgrka6Py6nAZuXutn9W2irCpvVJLBUdAmuuSty92LzkP1W45ntS6+EM9o0juO7pMbYWbartUe+8wpuR7aNQz4r8B27xkM5lPFxncxlXfvArPWiem0iIq3LGjiCeQVdYVcG5eGeNQyWH4V2ivrIIqstVh2QzB2PQ9UOao4xCqDgyD111bQ5BQdKEe7gbAr0fwHFXm5stX1S/6zFVRrzgobbEkGkw7rvmb+O+cekUMVLm1j21Df6V9cO8d41XEgZdJgdnsVirymgnf3Ojvx0541mx8dEyxZ9Jr5qd51azlOWZSdwyY+qoxqs4MCU7OexYsk2aeOGd+6GF0GhYHYrvw/7MiGLFUcLHIzMfwRw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ewFiOR2VCSJRBd+Xz9GEbV+Ta7rTC60ItlOf9AugGqRgEVtNFHoDt6N4WUSSuXG5aMLRpnB+eDgHJ/tS/fIcxYoeg6Zp7iFF7why/PchZsBmL4tHz/JKjN3ZBUeKuUTFdXYsXrI1mtNtKwqgZZJHZzbj7Ghz0C6KPE2ebPJOnQMjvtAmPDzBZ0EMXGJCn16apHZDE/oTnT0vrUBo5YFHulkN2LT84M+qMAKGhFYNT9EmUlMcDuap7F58Pqrnxq0Fuc9Q/HpVGiz+e+ukleahVBrIJ0ESPcJu9zZHLDG37APGWNsjstZNyEF1ALip/DOvkT05Xo++TTpA2fMyAgGvwXdeb2UOl0uBbV3xIGdlTkrfkje4sw/JujkLjyAIYz+owfmsrZ/EXZS+QRl8aPcvj+HWimyWjJIpe5kTTsaKnfRWGzHkX9+feuf6aG2HciQM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:21:41.9039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11389056-a5fd-46d3-0904-08df38dbda34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF00026966.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_122154_448801_5F03B807 
X-CRM114-Status: GOOD (  13.31  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the System Monitor (SysMon) block in the PMC, which provides
on-chip voltage and temperature monitoring, and use its device
temperature channel as the sensor for a thermal zone.

SysMon channel 0 is the current maximum temperature across all active
satellites.

The thermal zone has a critical trip at 125C. Passive trips and cooling
maps, voltage channels and per-satellite temperature channels depend on
the design and are left to board files.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 arch/arm64/boot/dts/xilinx/versal-net.dtsi | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
index 21bb917bcba1..394181c9a751 100644
--- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
+++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
@@ -735,6 +735,28 @@ versal_fpga: versal-fpga {
 		compatible = "xlnx,versal-fpga";
 	};
 
+	sysmon_temp: thermal-sensor {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&sysmon0 0>;
+		io-channel-names = "sensor-channel";
+	};
+
+	thermal-zones {
+		versal_thermal: versal-thermal {
+			polling-delay = <1000>; /* milliseconds */
+			thermal-sensors = <&sysmon_temp>;
+
+			trips {
+				ot_crit: ot-crit {
+					temperature = <125000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	amba: axi {
 		compatible = "simple-bus";
 		bootph-all;
@@ -1033,6 +1055,13 @@ spi1: spi@f1970000 {
 			clock-names = "ref_clk", "pclk";
 		};
 
+		sysmon0: sysmon@f1270000 {
+			compatible = "xlnx,versal-sysmon";
+			reg = <0 0xf1270000 0 0x4000>;
+			interrupts = <0 202 4>;
+			#io-channel-cells = <1>;
+		};
+
 		ttc0: timer@f1dc0000 {
 			compatible = "cdns,ttc";
 			status = "disabled";
-- 
2.34.1


