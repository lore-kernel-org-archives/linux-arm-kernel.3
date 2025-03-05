Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB91DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 05:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IoJs7RDnb/wkfBdAtGLjJf0Mf2v1f0oMTrVyyqNadg=; b=Y+Vvb4tbmvhCwbvOh+4wes3tHC
	/mni4PG6Mca2Krr98EYY1ZmT8JTU6qlcFlbOsehpLfedSXKBA9PE/PiLWdK7BChFVbnPfpeDVzQRZ
	zsesoFxAMaqFjKpA+PEm3Tyjs9mSTmT8i9QkLoRXOx6SFTH8w7vbysiO9rjNYjcGRDTSkriBKZ8Yt
	rHpw8+Dl+SowZI/Q6H5QefEy/PZuBWz8pcgqlQ8jPoT444QcWGYbwKe+AU9D5/1dTnd68ibuOtYbU
	0XX8jFW8fefe8qy7Kcl74scvKp/+j5R8tW7aD6GTAmb1qR+SZtTk4KqNWX+sNErfXE1XCYRdMNCYu
	fgnkbr1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tphdi-000000073i6-0avt;
	Wed, 05 Mar 2025 05:49:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tphT1-000000072cY-0OYo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 05:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7IoJs7RDnb/wkfBdAtGLjJf0Mf2v1f0oMTrVyyqNadg=; b=bunLFg9wbqMGcgpub+7kPnRkTS
	7qcyRHy29KvllUF0w7xhJcu4aiDzjwkhlpztXfNF4C9MBmMV6ioZUC4EiKfGRbd7y9FYKPAKrjRma
	XOZGTqKaJVX7sB3+t62BafPGIEOSWDLBIbEOix9GuDREBoHYzXMjIcBW3HfTdnZZ1FTPW1SgfjEtu
	v8OXgu8Q6G/RZAX4FClBtGBNdmSpChTtqz4cmhaloLVrp8Q5KStRjoNiFVw3zvR4QmQAYFHiyo46g
	gQmVmpthM3lrSeePmD7+4eqfdbrPMFFWkMJF0pzcPs3E66IgBMn31hGfQ9GQvztqYGOmJ4mT6IgAP
	+8L2Tprw==;
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tphSx-00000000N75-3VCN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 05:38:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7zhuGDFkHFuJFPSG2ZLAgW2RZuizpBGTF+cvmpCk6mkqAZ8DoDMNK7qx4HUNrT9ronAq0pRkL8dbqXMmwymQxBjlBIek+Ytka779hiuaHPsDJXMDFWfL4WcyPCE/XuVD1IthZE0RDMNixH5oTd/7GVj2uAxngxsspTsPhZHSOEscLYp8Dw+oDGSCgJEfjNPpnrDVpZw6g7/x2JCVtLRf8r4bySs1AJmVBwFCC3XwHY6CxtlnYUS0myv3BTZjz2ALQCdGvcSK8y5kUSRNUepqPKdX3XuNmuQDi/HqRdgzXZO8uWkXIi6aPzs/qpB5aDVWCfFjyu5FRyzpAmzDkB0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IoJs7RDnb/wkfBdAtGLjJf0Mf2v1f0oMTrVyyqNadg=;
 b=jvWFCmhhuO0n+ZEKrR14E1dEx1LI/tD8nwURW4589vVwOlT7Dxa3vmfAYdvOk9Fp52Oem4eQjwfIaDoeedoIeIsxPbNJ8W70f3cx3ggg8/IOWGACQL1b407Mko7gKsA2WrMbcikggJPFwmeIdmMjvJSXtrQDkxVVCQSS/vjUPR0BdurRKVLUIBZ8n6HV+XK0zfvOrqiDoRvgezGB0lX1Dnfwy4kuJn+FpNXp5SDbzdbPM6os9TJ3vHzppLYRK31moDCLfvAQBBDlfG+OBzrydIP4UnT92Y7hS5uOjAmlL9fJNI52r4KbvVrWEs+Uhn9Gix8Bh9v+XIkm45zi7Jmhqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0008.apcprd02.prod.outlook.com (2603:1096:3:17::20) by
 SEYPR06MB5671.apcprd06.prod.outlook.com (2603:1096:101:bd::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.26; Wed, 5 Mar 2025 05:38:26 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:3:17:cafe::40) by SG2PR02CA0008.outlook.office365.com
 (2603:1096:3:17::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 05:38:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 05:38:24 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 96EF941604F3;
	Wed,  5 Mar 2025 13:38:23 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v4 1/6] dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
Date: Wed,  5 Mar 2025 13:38:18 +0800
Message-Id: <20250305053823.2048217-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305053823.2048217-1-peter.chen@cixtech.com>
References: <20250305053823.2048217-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SEYPR06MB5671:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fa836a06-58d4-4f0a-dd9b-08dd5ba7f2cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?42LTxO6M0zvMsDJHzHHJdCZ7RmgsjdIng7U93Ru8PllisGBzOIdGhWU5QzaE?=
 =?us-ascii?Q?QDHQkwjHL6yvH1qYAgWNMgMVizjc4Cbl3Mzk/3rLYvblYuMRGxqziofFaK09?=
 =?us-ascii?Q?kZt2fZrd5DvgJ9bROtmL7FBrH0nP2A9WAFbaFyfwSBLOlfTBjBHJashZkReY?=
 =?us-ascii?Q?fmc5C0AUpRD1+CfVheliXOnd1HK/X5h92O7Cr7jYVZTa71YK15vnIGumfrW0?=
 =?us-ascii?Q?NJr9eW9L+xFWcNlvmyJDdVogJhTWYDdHXHEF9yPYP/h3dRnAovghtPNvDjK/?=
 =?us-ascii?Q?Arpul5vwkCfS+jXFZ1uZelRhwqD7cvxFkOMVmOl9x6YeXvPE5GynRqfRP98H?=
 =?us-ascii?Q?geDwm+7hVQWq/g/zA4h8OJYICrVa+JLpni2x/Z9f21PEyHjv8ofI63x2jvsG?=
 =?us-ascii?Q?OfR5T89Kz5Fl6TsJ12sk+xt0CZ7cVWnb9azRoWBB2ER/GmyqFolMWOr6ozzz?=
 =?us-ascii?Q?Y/kObSCpK4KszzzSvrppGQOl71A3PVSRqeOUOvhv6ur9ZeJx8JbsQwnN6htu?=
 =?us-ascii?Q?dy2rw7veoriuQBGt3iLKbOCBPlTHD+75hgeHb5Z4jo2JpMBOxAKC5Cl6vbzL?=
 =?us-ascii?Q?m9wkSrp2TUhOcwqYZVrgW3JN4dbKaqHhnQHfURoajNPFSDrjYAo3FG6qy67W?=
 =?us-ascii?Q?g5UnaY1odLJGFmoHQrzYomMA/V2M8Mh1y/ngADSz7kc5rwNgt56lxzfYQzbv?=
 =?us-ascii?Q?zcE/1N1wPXAOJIeXV4zp0itGQqGo+ntoEF9arcXOSinoVdpq7bKgKjk4A1Ig?=
 =?us-ascii?Q?5qtkAUdk7oS8BDJ5ZpM5OGbnhdNNrftdl3t+SlMiVZNrsDJvOng1Lq2uhv+K?=
 =?us-ascii?Q?O6zb1BFufhcb2gtuS/1tOlzo9Sg4kyEIOJdRSeW2qESX7GSzJcfRZnxFYoHx?=
 =?us-ascii?Q?NEZMdoQwWOnG5ZSHRXdVk3FAWjHaT2Alppo8G3eXy0rrAFQsxF7MmqcO991q?=
 =?us-ascii?Q?V0GkYa4FachZpE1boAbkloJPv6Xb9+P9hQng9MqM55IixWZT23CODXDZ/Mt4?=
 =?us-ascii?Q?lfZwooKlloADb01sy/ZL0mHy3/afy5XXpTCmygNByzNgK+59XcOfbXqlw4Vz?=
 =?us-ascii?Q?nQXp9XOfCBslqL05GrYH9c+cWQ7mWTZwWd6P2b4811mfzL8UgPXNXqC/2Ryu?=
 =?us-ascii?Q?788nSgchDlYDQZ6uN0PoDL7tWCzo1JdlHjQHYcHRhDDWhZV+QxCtH7WDDtz5?=
 =?us-ascii?Q?k1XRmSs4ei7PNKYC9hHO4eaPPGUob7H31zDIQDz6Q+Y9xS0R9pkFaXuvngTy?=
 =?us-ascii?Q?7+L0MHnvdtLFlEdTtrFxd2Kbeu8GvJkDw6ECx7aF92AcI3HxLNl6vuy3nCAY?=
 =?us-ascii?Q?DZpcZCHqm7GOauCjlhD4xaUMp8S9FX0oyBuhUwysnrbFS0L8Q4YCcaibNHNA?=
 =?us-ascii?Q?z6QUDM/jRcBwFGYLV2ZuWZklRJvvwgZq20BFJOwV5RlQeBGve9qfP52mikDz?=
 =?us-ascii?Q?hYBkS5S40rU=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 05:38:24.5716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa836a06-58d4-4f0a-dd9b-08dd5ba7f2cb
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_053847_988682_4A5035F3 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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

CIX Technology Group Co., Ltd. is a high performance Arm SoC design
company. Link: https://www.cixtech.com/.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1..5e76223e4570 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -302,6 +302,8 @@ patternProperties:
     description: Cirrus Logic, Inc.
   "^cisco,.*":
     description: Cisco Systems, Inc.
+  "^cix,.*":
+    description: CIX Technology Group Co., Ltd.
   "^clockwork,.*":
     description: Clockwork Tech LLC
   "^cloos,.*":
-- 
2.25.1


