Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020BCD35690
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgx/OZovnYaqJbXU8yLMLwe/etamtsRy8FltMyp7ndQ=; b=kVgR440tqGQlgprZdr+Ow73t6G
	EJv8zxzPIG5/8uatVETXFhXHBy/EaVp9Veg0yYQgSXipjcB5AXz6tXXQCYttXwQaMDzMkirAfTOOj
	VHpM2Eq28GUYj+ceDVo/Hh6Z0iiF3Yl1PEhlImxwipyb/X5b8K29flci8RqOyKjZtdxvGV3F9B1d8
	dADKLHSQelqQTWMI5DXOegx3UVm7CAVu8y9lcmlQTE5TQjiMKtGSP3WHsJ9RQmaz2QdLtPOmUmhkf
	Tlev/nZA5typOGuBtIxXHT0zW0lvsDJLt41lg14NbJO7/HxpUZwiZOGpgq7BhPsiP15IxVeAde8ED
	14SE6UQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1yS-0000000Fl9r-3WRp;
	Wed, 28 Jan 2026 09:36:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1yR-0000000Fl8y-0IBD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 09:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qgx/OZovnYaqJbXU8yLMLwe/etamtsRy8FltMyp7ndQ=; b=lWYWid/qQteMTYJD3tPkBHOtl0
	FkoM79UVlDFNiEf4pmJdD5DWM5J70IUZHNPU1FDDrOVy0gbTsEeQQJUn4bL/Eq6BiWU2rATP95aQA
	8MEAea5+oOzxak34at3fIofiYTmpoxsEPfH/Lx/wl3l/aqJwBqGVqmyXb+CZYfNSL4pdt+HXGMwA1
	ofw+jOLIkntIN/dEs0WDJ8x3/3KCuaeruuzfN8nCsebThOgXPo8WE6uf+Ueof9206AW8iOu+XReF2
	sccGbgpGSrmxqYlrpB0f6uD/9ufS+Jgd+a+1ZAlH/KH1qMNPpNfcTn0iGujn/4rlx187sgMjKjQe+
	YwWzbE5Q==;
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1yN-00000008EzH-0xYU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:36:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1IpCa30cKnAgBnOB5Q93WFLso/JXLPxUs30hBDnjxcM6g2F+soCoGEoLXFfmjfV5nYNf26OtCX4hvqUImEqQZ9Qp2F5a/I1W9Cva2D4ZIm+gof5sKKyVPa+77Vm8PNif9jwyMRmjXnxhjY2keVZIfu7bDyb52hagZv3eqcERqk0jUEeMwKWBYYNwWjJjRzvAts5RbA7KmB0hudkUCrTgJEJO9EKciN+g0Mf6dee/+W10UVvjKsvFIqKHZaRJV8xnR8WwW5MID4a0Y/SfTktn1KmAN8Fv3aeOmZxTan8+jyxQzSKRpztVvc/vQRRnfH3n8ZfNv+/GHQWtdInPLCuAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgx/OZovnYaqJbXU8yLMLwe/etamtsRy8FltMyp7ndQ=;
 b=ne5xJLpWu/jrbYIx4eGLbYOlTSr/wjya9UlhpKuUA6gwb0fyHvv7PH62PDgvJ4L7N+m+BHfV5LLPqRk0l0Xl5q6XzzL4YC6w0sSTFfIJy1q21OQiLRQjIBod3yIGnKKvzc8+8Z1AZzALPqskkzzydGtStA+7W05sRLhc8dRn69BQbSQnxDtrqBddIIR0JwLWpz1ru/zOuYMh27Bw9BJt0jAJdDZmLp5zJjKU3ioILy6RLSC+cUvkhZYo9oNkx+YKt2xHsk+YvRXzkVAJt0ZWvVBcAnmn4TcozNcsNXiuaa6Y9d++iHLfqDMXoZPdVuwFMjlH/dUgICHatoBBLeNrDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0020.apcprd02.prod.outlook.com (2603:1096:4:195::7) by
 KL1PR06MB6428.apcprd06.prod.outlook.com (2603:1096:820:f6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Wed, 28 Jan 2026 09:36:14 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::cd) by SI2PR02CA0020.outlook.office365.com
 (2603:1096:4:195::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 09:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 09:36:12 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 269BB4350715;
	Wed, 28 Jan 2026 17:36:12 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v4 3/3] arm64: dts: cix: add support for cix sky1 resets
Date: Wed, 28 Jan 2026 17:36:11 +0800
Message-ID: <20260128093611.1932770-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260128093611.1932770-1-gary.yang@cixtech.com>
References: <20260128093611.1932770-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|KL1PR06MB6428:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e622345c-7274-49cb-eb3c-08de5e50ad28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bBe0tCbngmeuB59O2SmhzhuJ/coTqjU9eT+2yZo9u7BdaL3YBvsNX4sWSIKg?=
 =?us-ascii?Q?EE8v0kOXtmXkU7zavnduksCuSq/o6NibCP+bBwU2AdaswTWJshg0ViGAOVt8?=
 =?us-ascii?Q?9uni38GFvta+QU3D1BVju1XEcINnBbnU2eSik0PnAvfC5pEezQ13jI+LHiuQ?=
 =?us-ascii?Q?PvdSvc73X4RW2OsvX3axY9auUT/A++eVyzyzNfL8kNT9Gu3jz9yVJIrQpUEC?=
 =?us-ascii?Q?JOejPGzypjXRW/EJFMKb3Vz2QSJCk4MOScEXN9X2gSuTj9BDMwixFWUN1rdE?=
 =?us-ascii?Q?WvF2tNCjls4cz1r6Dh5mcm8IKGhHRLoJtYfh5+EMgKTomEJR7+jDJ0j0sUcg?=
 =?us-ascii?Q?neLxxSOIl5Q/txMzZpyS3EMxSX0YDikDk9c8tyxschFP9L95CFg8azm0E+dG?=
 =?us-ascii?Q?e8f/McduXxQBwppWvllvtW9hMtUBFiwISUiw4kSvlii/nhSmUBiTlKk6CaB/?=
 =?us-ascii?Q?e5dV5rwz5VYLSbWf735JA1Cm5VvMvrnaVW/fG08eSjjzuuiGzAS5PfqHP5Oh?=
 =?us-ascii?Q?WiH65OK+VTJBqtNYeM0kJhXUHlQa6jg0oQVVrHG/7fY8vG1HXTwNCqeTN0bU?=
 =?us-ascii?Q?zFjRUzAlp5Ej4VKe1HFW3LM9EjABDg7Q6fnfTbp3ckwak30vJ68R58J9m2BT?=
 =?us-ascii?Q?V3TvFvUEwpTCxLxCMjWAWxpoHuTSYzIe9AD5xbKaSnd0y5ggt7ZgZvIhnERe?=
 =?us-ascii?Q?3bXyQsHdIWkAns0/2CtDU2cbxph3HyuKyqvX/yadWp+oNnUAJLDWPTcnEJ7v?=
 =?us-ascii?Q?WZGUB/8QBxTaCcGFDr+xvtzJ/SwWlhzv+YfooCRsX/4xKrvBuwpxOUxG+J5e?=
 =?us-ascii?Q?6+rRBO8rkUIw9141yGMKNy2x+9to5vDqM9DNL0OOj2EvxRetWDvsavKfuqKY?=
 =?us-ascii?Q?SQkvNhGbvDtFoKgqH8024mmX357g6LWDK4EqU8v0+itFNW0dpH0inLdkoRvU?=
 =?us-ascii?Q?hi8uRd2zu9pZ7qliUse6ZtypI39d5ho+8/Nrnm+gGyEHnVe10LC1MuJQpBaS?=
 =?us-ascii?Q?6kFXk6GpRwf9lYjgcbwpEQDBvsNoTkwN2qvmGDADy0d6eW9T3QtGrnwgzuxd?=
 =?us-ascii?Q?w5KrTp8UgY4chfQYMMXgwTi3aE//ZdlgaRxkmpQ9CKoHnOOMZXbW/9sCkljC?=
 =?us-ascii?Q?1HAhvNwKDMVg6l+SGBerKEzJPWJt/FgqQwb/tQq2Ln2tW0J//s8b/DctQ/7D?=
 =?us-ascii?Q?WinEWAGhYAWAsrk4aQFJ7h1axaNhcW+wBE353UnI/XNA3vMhUSvNO2FcQLzN?=
 =?us-ascii?Q?lt7fbUc/KCFhetxheafYDuosjMThyMKIMJwIk6LwafPPMvXm/XONANfPFafl?=
 =?us-ascii?Q?d69PfI9rJaqzw7U/07RSzwQiQ+7SK4tjEuCNiIK/vd4lSZBLZhMNBFYJot/f?=
 =?us-ascii?Q?qYBJg7QbDwKS89iXTASQkImfx2J2CTBXVzDTGYX9WMlpDAOAxB5tLv6Dbftt?=
 =?us-ascii?Q?CJfWmz0n4lNJDS8MVVAarL4OKvwGuDKOlb/J1yAt83DK1cC0PiayjG0ex6yt?=
 =?us-ascii?Q?jXqHrCpaPMSwBGAjZWNhcunzdSvkUwdci9eIIIpj4AIB6zNQ9jVVZU9HYg7U?=
 =?us-ascii?Q?oayuGyguHcsYYE1J+5TNUAVOr4/ZXsPGe3R9KC/HYsLXyyhrxTKgz9Pn4bNe?=
 =?us-ascii?Q?BQAWjnXXWAgP3C5RHAMel8PY0Ld4mKq9sO/rcyyKiF9L3efhQucIwMFMUbUP?=
 =?us-ascii?Q?VvnWNQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 09:36:12.6861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e622345c-7274-49cb-eb3c-08de5e50ad28
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_093627_523768_ED138EB2 
X-CRM114-Status: GOOD (  10.63  )
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

There are two reset conctrollers on Cix Sky1 Soc.
One is located in S0 domain, and the other is located
in S0 and S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
Link: https://lore.kernel.org/r/20251124063235.952136-4-gary.yang@cixtech.com
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 64b76905cbff..45c008bf580a 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -348,6 +348,17 @@ i3c1: i3c@4100000 {
 			status = "disabled";
 		};
 
+		syscon: syscon@4160000 {
+			compatible = "cix,sky1-system-controller", "syscon",
+				   "simple-mfd";
+			reg = <0x0 0x4160000 0x0 0x100>;
+
+			src_fch: reset-controller {
+				compatible = "cix,sky1-rst-fch";
+				#reset-cells = <1>;
+			};
+		};
+
 		iomuxc: pinctrl@4170000 {
 			compatible = "cix,sky1-pinctrl";
 			reg = <0x0 0x04170000 0x0 0x1000>;
@@ -568,6 +579,17 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		s5_syscon: s5-syscon@16000000 {
+			compatible = "cix,sky1-s5-system-controller", "syscon",
+				   "simple-mfd";
+			reg = <0x0 0x16000000 0x0 0x1000>;
+
+			src: reset-controller {
+				compatible = "cix,sky1-rst";
+				#reset-cells = <1>;
+			};
+		};
+
 		iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-pinctrl-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
-- 
2.49.0


