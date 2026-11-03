Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C0E606D838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qorbxQhZ;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YRtHXdjp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q3MLGlASNURJinrGMbeueE2BwD1HdPJmSDG1uQeT7x8=; b=qorbxQhZWfblhlecCZwvNDgY2u
	NNdRtEFVqhgakliIf7QM24OSQ3ZrIf9fZSNaQ691vLaLD6Hip+XAEG7doK7vX8nWfZyr3gvl0h+M7
	yWtbAWZo12GCIZ+0OAg7sEX5UIwq+j9FUeGTh698jqieilj8sCzyaymrzt/l3O7S0Z4Ea5K80Axdf
	uKED8Q4XwX0wXVrZOmRWTa9m7mahXLaGaGiO6hop4C0JB1fa9TIzzkCKsGT9QzMUPvHdbhyBjP7EB
	CjCm01zICf5rp7z+DziY8rQieo4Prnn5HBNJOB2QTyJrATQ7iPhZOoOwrWcyH+7GxSfm+TEdv7GlP
	awsf5eXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD0l-00000002GiS-3qdk;
	Tue, 03 Nov 2026 11:49:07 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD0j-00000002Gfg-0xiw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:49:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJBAhPEdsrxUgEvb1bXobVJgc5DNiL+uaqSlw7xwXvfBjlgMTjPRf8YIRcB27uIHRLnJcVVtiE3sWJoA7xOP7ovi240km4fbEVZL3O9AFlrIow7rFpVD5EvmCTz/6rn0LuBBXnzxv0Xvs709PKw4AjIqj6MJ6oVaCWlXyDxnH6tcy5i+9haYaUYb3HyqM/wKo/3FWeaFCP2X9H7I4XxIefOLZk5hIbHlsGH8TrXEbsdbbzAn75IElNWk8LFcSoSAQXDYc37ic5Hl60uU3LKGDETWjw54s1da9pYEDzSN2vdD7ZQ0Bx8rHwouXgiuIQwQrjQCt9ECz0J3CChNxuIOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3MLGlASNURJinrGMbeueE2BwD1HdPJmSDG1uQeT7x8=;
 b=iiz52hHVHVZ8sO8Tps7ZeaQVDfDw4sBdYOZ3ekakKHJe8HwWz1njQolL0CrNu2Cc1wg0CEt6ZQYQ79HP7nZXJC+rdE1sZ+1oS1DkMKTlhb7HjIAL3R5zLsVExXI9enpDhcprqMb2XyECqs35dfkM0nxaJAyfU1gUJozVHj0QtrCPjHtCwkzI2iS2iVsUbqXVk4wIPhhYbi2mgEKjigw3OZsb7QombZL2hCqukn+sn7S8C6ls4kh4iIN+0pqd67dTrPf3njJOqRfBjAhQGg0vbmG+fJP2Ot3k1tQsWHp76FV1KEXq4FXebBph6cElfbo5UbdyrWzL/r+Pxubj9EX8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3MLGlASNURJinrGMbeueE2BwD1HdPJmSDG1uQeT7x8=;
 b=YRtHXdjp7BwBil7Q50ZAqiO6kVpgp1OgQ56+1m5bmTfgpkrE7s0aNZSd2UI62rW/ifJ7DMAFsF0Iec2+SsgeSfkopYUb77BT6rupkbB3hGapo8WkJ1ZwVXNhO9XTtSHZmGFl0Us0Y8x07sxHorImGxyWp6p5s07v5qpW6+MXwh2FEK3S7JbnYPySH2U+Ph/nphU0bqBPsLoFCfFNnOiMfRNy64qBKg1v0Jlzv2ptmJymb98i2V6VtvgEXbDcp/Zf+i4iHybbDb5E5TE4z6BOE6ZQZw8yHwLY2H3/3N8FeNwWfd2cb4bqVjVxQa4ouHls417b7pmw20+NdjxexsV18Q==
Received: from PH0PR07CA0022.namprd07.prod.outlook.com (2603:10b6:510:5::27)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 11:48:53 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:510:5:cafe::8a) by PH0PR07CA0022.outlook.office365.com
 (2603:10b6:510:5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 11:48:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 11:48:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 03:48:37 -0800
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 03:48:35 -0800
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: Jacky Huang <jackyhuang@nvidia.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add NVIDIA MGX Vera C2 BMC
Date: Tue, 3 Nov 2026 20:47:52 +0900
Message-ID: <7a3f142b8142b7c067182799d30b33b026e74221.1793705210.git.jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793705210.git.jackyhuang@nvidia.com>
References: <cover.1793705210.git.jackyhuang@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: bbefca3c-d0cc-41db-72a5-08df39a06ea4
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700016|23010399003|18002099003|22082099003|56012099006|261102123227099003|10067099003|261009223027099003|261021121427099003|11063799006|261026121527099003;
X-Microsoft-Antispam-Message-Info: mu7YEoK49OHKrnLTJ/yW7u7+nrC4RCuQSZBjnkfXX/KeFrOJFMBoHvttAQDoFkiGaHMzaFB6o0tftJPVy+mJ9K5TF/nGXwlq/2TZO3L3Cn3mAkUk7uYB8NFyExJ4ZKKhPNu0oby4eNNv8Jpc4/jM318ekHl/TxAc76kfAmt5cqhK/59gn037mDpwUXeYNGdcS7+hmKWThu35HdlKmnBzpy9skINT3L0TAQMhVvL/fW4PpI7GWATE7O/R6TP8/E8TFiYE/eNQpxaIzBOe3uAPcCnhQSyOEyyjy9gdQo1Y7sAqVREpU14cteSvsM8dG4tpa9dCK0ph7ybfj9kkd/PydO3KsPK2aT5/3dV+Is6OeTQtnaW0roDSwvgF3d1/kD7H2ILfqPFyoh98Ej88VeTST4Y2o7exagygmq1s85uHTjPRIqsMu3jzq6gcvxPPqOd+9rBwvlIosY/3Vv9UtyNXgDyraZEI2cwIYr3j9/xd/sRKD6pv7jW+iH2ITw64C8nYBqL9OefV6krNbJgglSjaQTZb6vVdgkXVC89JpFcgU+tRVI+jpSh4rm+528n6Y7ccxsh1EwC23oyxnVQTXVuG9Pg5Pao8x0SQ95ME/PJmbfYUgpmOgf4NTpOsHVVRRmLOvgE+JYy9Owi8ikIEgrtjoJcRKhD99aoQGyY6IX8Cf6F4RK+f558LySJPtpmo6DVvs57aAi1z63JohbvsXEzqCg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(261102123227099003)(10067099003)(261009223027099003)(261021121427099003)(11063799006)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3b+bbEAfZZYkeppPBWVUMmDJuAb8U1meHPJoJ8rqaim0eXA/xFh69hoN32soVskgP3Ho0u4D2WiiZcfwTOcpXJGBlIw0zW5unvwEq9Usu9lKYtauyrbSyxCDOZ7icMT+foKTmRg/1/xN4D7q4urLpWZdzYA9TXLuk8WR3ohbn8nm94wW04YeNhwEVDPg7yaXtWbTzpD17SnPmSRETOKsHLcMGKSX+6BuHZHOKuRGvSDRxVE5kK9qPpsqvCaOehjr5JxB+/Q3N0VDMNJgO8W5r3KUDagqNKdd+ehk0D85iTz0efRCEDKVdQQl6PTmD/V8fhNFY/Uu/vd1w1J+iXluk1q9JlLdY9oO3/DvsOqZ/xD8k/rZSJRQSpXoYUReYEpNJa9/6n+yh4Nw6GmW8rgV9acjSZgI3vBnUFevAOtyhP4/etTOedAvBZOnNiWDBa8d
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 11:48:52.2453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbefca3c-d0cc-41db-72a5-08df39a06ea4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_034905_277287_CC8FE2C2 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

Add the board compatible for the NVIDIA MGX Vera C2 BMC, which is
based on the ASPEED AST2600 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
Changes in v2:
- Add Krzysztof Kozlowski's Acked-by.

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868e..92127d7c4 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -115,6 +115,7 @@ properties:
               - jabil,rbp-bmc
               - nvidia,gb200nvl-bmc
               - nvidia,msx4-bmc
+              - nvidia,vr-c2-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.43.0


