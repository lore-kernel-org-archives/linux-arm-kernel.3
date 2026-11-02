Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B36A60A5BD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JAOGNfu9;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EzeunGqW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7jY6yOIoDb2s40FcwgAUYkH4icXO6Xbv/NyPwxlalWc=; b=JAOGNfu9SfhptoypuJmAPopp/2
	6TSgJTlQqxzGay/RTojKe8jJz8INaJ+Y3DHz9ssiRha0xhR6BcodS27JvsN/jTMrZHnDXKDc7Kvwy
	ZdmDLYdfzZyd4jVaAEPqIBCev7cAfUUv04Ke0lluBQk4sqnVj/ZFl1wY4o14mMBor3dkSiQNpWVUN
	qMP5zVDJLLRRTfTizPu0IxjAPmUh3aivchQEPW7BaAqgvQe1H4DTr/qeZGI26J6yENuDCv3tswY/4
	gu6b+5K/7tU38dnFgpWhx1Mbcriuj2E/6m/e4MY6/ek0JsSj6tXZNwvkauFcvszXqgQb8rxwu830l
	l9i84tSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2i-0000000GSUs-2uGb;
	Mon, 02 Nov 2026 12:21:40 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2f-0000000GSRz-1KlA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:21:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L46w++12JV8S1hE/cMtrbccBxDFCuLEszbTR99NXkHSqnUP0JIvdeULvADthUoFVzuhypVNriT5M+up6eePe1KwTGn34H4YQ5YkaT73HedYu5u5lVhalRUTH0IoO31leMjaQjiEcQnoRfmxG6xB+E/e6LvrjKfcazfT6nNpDwDYK9NchAmVnYKdRQjMUbdkTdf8VLa/NpeGHqEGp8UWX7uWNXKkaqjnQrtVuAzlN+nURPHzD5HMzd6EFBc11ef+71IUt9amEkHsinkypiDSSESO+CC2brXR57/+k5psJKYXecL/V4jJ3SuOq2nwrTfs/X7/RMNa4N+wM7urA+d8MwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jY6yOIoDb2s40FcwgAUYkH4icXO6Xbv/NyPwxlalWc=;
 b=ZNO7a6ojC3bIMVBERtC72GEwqR5SP+3yQ4REWFHE/RczwrBjm4jDebKgJP0+cpv4iYlk4TP94D2cdQHrKG7pAFoCmWM5UnWgg7euwbU64xu1+yfhCwT1sOHMBjJlbxcAoqjZHQ0rIX6WaXh0TNji5K5L92Imz8Nwlbqic+50lrLX3XMSV8J/w3gVhRzvTBfUHXPIrssv9L0ZkzRNUfyDAcIRf31RqHvCgOqKiTC9a9LKKXQ6DqJXTltq9fiVK5EtHVefOO+EpU9mPBfdal20sojI6DqZgzKEOzq2gNxkd6ly5R8VZTQSk29Fg2FkffhmbciJabE+yXRvduqJ4NqCYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jY6yOIoDb2s40FcwgAUYkH4icXO6Xbv/NyPwxlalWc=;
 b=EzeunGqWdUHtfRN4ibAhlnmYMLwnwzehU9atgTFYtRoF6RXywFnySQ96DuB68iTF+ANADJ7j79v15Jb1ZGQhJZKnUi32go5plqDiMIsGGWs98SoPeV2R9SRaheOHYdkE5eRarOBLRzU4DqJnHZ/Sbno2jc54/Ag/YMCt7t29ads=
Received: from BN9PR03CA0652.namprd03.prod.outlook.com (2603:10b6:408:13b::27)
 by MW5PR12MB5621.namprd12.prod.outlook.com (2603:10b6:303:193::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:21:29 +0000
Received: from BN3PEPF00022BC6.namprd05.prod.outlook.com
 (2603:10b6:408:13b:cafe::35) by BN9PR03CA0652.outlook.office365.com
 (2603:10b6:408:13b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 12:21:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BC6.mail.protection.outlook.com (10.167.248.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 12:21:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 06:21:28 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 06:21:28 -0600
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 2 Nov 2026 06:21:24 -0600
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
Subject: [PATCH 2/6] iio: adc: versal-sysmon: validate temperature hysteresis
Date: Mon, 2 Nov 2026 17:51:08 +0530
Message-ID: <20261102122112.1723130-3-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC6:EE_|MW5PR12MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b77ce0b-02bf-459c-95ac-08df38dbd27c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|36860700016|82310400026|11063799006|56012099006|261009223027099003|261009221227099003|261021123027099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HQpisMmT7tzRYz97NygPy84aItJtj6FefAoPUNlwRb6ZChZtaATlbl1SRnjPNCdMGNZzBWu+pPYAEsSy7uCy+TrEDILfm+IrsrMDt4kyCmk0892mLbOJ2pvhR4oCRiSafFRhUDxYikOAUGDsB6unSSBTBZsQg5htYVdOct6jCFohM0as/Y4X8bwKSsy+hnI3XNwRnvNgsK3E7fX/5LtUErFCgofDuCLP/csI7fQko0IStgoxfgb7RlmYZuSn0Mjtqpdn8a5+gCGzFrTBw7f2rO50PVZ6Clvi8FeifDucaKhBAaZv/H3r28+5zJVEo2+1VyCx39uc4DmbgcpdHqSuLg+QIgOfj+K9U+pcR8twhV+NGURrWHE2KAvOuUfvHvKHmgh1btENvfi7JbIgC60RJAtmjQSHviDo/JrrDclbOYrfGEOTs0skb081dPZro4okRQDx6xxOPUOaxWwz3uqMltAwVgOf+Iu6llxiRu/kO9yClEURChWfYY0VFRyYUtvjyRnDfU3dybWAR4iV0vx3X2fXs7NqJVHF08KCK3rBF0tC3l3NYtNJkCHxJfHtXFeK0u4cgS2p+2Hibjl+tltb9Kf6Z2V1ocLCrrNaMl1TjdKmjeuH+ua6cE81nRx+guZmBA9fCaRwLesqmo4UOftbNCCIRaKzn7Vl3C9l7Y6v1zRNMSr1EHDN1KWcGPwdRAHgnLWe4aBEqDCoXbWJVZMRiQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261009221227099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jlsUxtvmGetFUXbRWhmzQnBGsCWiCc2Doa40ckW3YCaP3tSIAMhXjePAkGVx2DZkJBY/7sNoYbU1p2ddK1M12UIOL4pvqiJMP7E00N+XuiBjhIGUqIM324/isAaBjylIxz17FRbAQPPYOpeABJF+3ChFER9rk1gQzKchpIyhMu9S6bLh+azlYopiqsJuDBUdco9aEv00Ih31spXb5qpcuIH7BRaG5jEuWpnQ7QHCd9FfH1ecIb+MYLXD/afsosL3QRuy/Ocl495Xck+sJIYvWYlXVValeMgwZipp8cN9ZD7mIND5XHJnwfqwlBhkA2x1yHjN8dwqY5ud6jAoqYeEqTkkyeGiYjsokdr9b/KcSgWKc6A7CBKWJXIz7p0VP53FquRUhCV1UM0HK4V7WDH10WjX1ya4dN0p98PbaDSy2R5JiRzd0b0tnU6tgi8GvfAE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:21:28.9834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b77ce0b-02bf-459c-95ac-08df38dbd27c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BC6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_042137_365606_E54C4CE7 
X-CRM114-Status: GOOD (  15.20  )
X-Spam-Score: -2.1 (--)
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

The hysteresis written through sysfs is only checked for being negative.
A large value makes upper_mc - hysteresis in sysmon_update_temp_lower()
overflow before it is clamped. Reject values above the full Q8.7 span of
511992 millicelsius, and name the Q8.7 temperature limits so that the
span and the existing range checks share one definition.

The cached hysteresis is seeded at probe from the threshold registers
without checking that the lower threshold is not above the upper one.
Treat that case as zero hysteresis, as negative values are rejected on
the write path.

Fixes: c7f7eb10638f ("iio: adc: versal-sysmon: add threshold event support")
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/iio/adc/versal-sysmon-core.c | 10 +++++-----
 drivers/iio/adc/versal-sysmon.h      |  4 ++++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versal-sysmon-core.c
index 6b9a58e19831..6595d07038c1 100644
--- a/drivers/iio/adc/versal-sysmon-core.c
+++ b/drivers/iio/adc/versal-sysmon-core.c
@@ -352,7 +352,8 @@ static int sysmon_update_temp_lower(struct sysmon *sysmon)
 		return ret;
 
 	sysmon_q8p7_to_millicelsius(upper_reg, &upper_mc);
-	lower_mc = clamp(upper_mc - sysmon->temp_hysteresis, -256000, 255992);
+	lower_mc = clamp(upper_mc - sysmon->temp_hysteresis,
+			 SYSMON_TEMP_MIN_MC, SYSMON_TEMP_MAX_MC);
 	sysmon_millicelsius_to_q8p7(&raw_val, lower_mc);
 
 	return regmap_write(sysmon->regmap, SYSMON_TEMP_TH_LOW, raw_val);
@@ -429,8 +430,7 @@ static int sysmon_write_event_value(struct iio_dev *indio_dev,
 	case IIO_TEMP:
 		switch (info) {
 		case IIO_EV_INFO_VALUE:
-			/* Q8.7 signed range: -256000 to +255992 mC */
-			if (val < -256000 || val > 255992)
+			if (val < SYSMON_TEMP_MIN_MC || val > SYSMON_TEMP_MAX_MC)
 				return -EINVAL;
 
 			sysmon_millicelsius_to_q8p7(&raw_val, val);
@@ -443,7 +443,7 @@ static int sysmon_write_event_value(struct iio_dev *indio_dev,
 			return sysmon_update_temp_lower(sysmon);
 
 		case IIO_EV_INFO_HYSTERESIS:
-			if (val < 0)
+			if (val < 0 || val > SYSMON_TEMP_MAX_MC - SYSMON_TEMP_MIN_MC)
 				return -EINVAL;
 
 			sysmon->temp_hysteresis = val;
@@ -838,7 +838,7 @@ static int sysmon_init_hysteresis(struct sysmon *sysmon, int *hysteresis)
 
 	sysmon_q8p7_to_millicelsius(upper_reg, &upper_mc);
 	sysmon_q8p7_to_millicelsius(lower_reg, &lower_mc);
-	*hysteresis = upper_mc - lower_mc;
+	*hysteresis = max(upper_mc - lower_mc, 0);
 
 	return 0;
 }
diff --git a/drivers/iio/adc/versal-sysmon.h b/drivers/iio/adc/versal-sysmon.h
index 701ef9b56263..a1ac3289719c 100644
--- a/drivers/iio/adc/versal-sysmon.h
+++ b/drivers/iio/adc/versal-sysmon.h
@@ -75,6 +75,10 @@ struct regmap;
 #define SYSMON_FRACTIONAL_SHIFT		7U
 #define SYSMON_SUPPLY_MANTISSA_BITS	16
 
+/* Q8.7 signed temperature range in millicelsius */
+#define SYSMON_TEMP_MIN_MC		-256000
+#define SYSMON_TEMP_MAX_MC		255992
+
 /* Bits per alarm register */
 #define SYSMON_ALARM_BITS_PER_REG	32
 
-- 
2.34.1


