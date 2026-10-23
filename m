Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F41606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fqlvYMP0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mMCGsIdI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h3Psh2Ln79XIDklh26NgvODE+n0LcA6EzIdhkNIDRFg=; b=fqlvYMP01KZaE6krKi2x5EMWnm
	H8JboX2kdEpb0EqdwXuixPPBJYcaNqdK8X0H3K4BOqgO7Hbhh6TgXcRUNFbYJR4ZBuni8l8UOV9Nz
	ElwIy7WwELaTg6KEc3RExcuXKfr131dgD86rWhlF8esDDf3AcW65cZC8ibIzkKKfbc3BfEUObWKDA
	J3ijI3XKNC42ehI0ipq8n/6ZnNLMrwS7L94DNzevdwPsAuxX69KETA0SbOVSMJ2VzvSSiUo6/pW8P
	ZtUq4ZR6HyOo5wd4g/zLvhiH8nX3tz80+ghoWUkgo4QPH/y066W7/h/a9oRKT0oogVjznkqG0I/cz
	Xbl65LkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBcZ-0000000G37C-1uct;
	Fri, 23 Oct 2026 09:31:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBcE-0000000G2lw-0ihH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 09:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h3Psh2Ln79XIDklh26NgvODE+n0LcA6EzIdhkNIDRFg=; b=mMCGsIdIcPr1AVuO5jk70dImBw
	pn9xsZpRIXUdVwbg76oGlSSfNDkYcIccIde1MYf02sjU8pjDuakI5ai+qggp613qlxziGt4Uhx7pW
	tyRHUgkAndjg5phsEUCbbKQ6xS3DdCamd/v+FEd+KIglg0mSWQ6GozBOpR8C0D3tsYcStByrcnQbH
	tqnes6Rcmg6jmiVi/RA5nYc7cwt1JakLX4Utaz1634Zqio8stzW+vHtskJL+SMXyfRTJu7a+V8ygB
	V4zu+kCO9EwtSnsCQoT+pXwLjeePMtPq4iLeAL8DEuFV+oFebNulxLj4Z2H8ws5Z4ax3VUL6qIIvH
	SayQSdrw==;
Received: from mail-japaneastazon11022115.outbound.protection.outlook.com ([52.101.126.115] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBcA-00000009FOW-2JaK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:31:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4/G51JrWYXveLLOw4MonyVAx1Jhv9fcRDgEmWBVnJ2gyiGWKlUWZuI6LvLIaRWJRDiP8Syl5NpMTPiNHigbNH38AoO5oQvyqCD5xOVWzK/1amyCAIOQVoPmS1Yo8RxzkGk2+sqTAxowLxbjPfXBguPDwKrBR40ecmKoUDozQyoKPVLjCbPGLjwkkkHmwIA2FEToMXTu+7UGJLVv4BQZM1glHDwb7SHL5E5mqb88WqtftZbbfcXDXnLZ3NSoMhjhhp6IxTXPKmi9fojTSTPRgXrhwJimUzCd8g7XISOTdmoAzWhds3z3shXcjqkD1QLD3YA0Bm4Y5WxWWKcLvhvwEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3Psh2Ln79XIDklh26NgvODE+n0LcA6EzIdhkNIDRFg=;
 b=CuT7/qhl7fSs6kH9i+vAprHHU97ZC90bGb6DFKwIpbaAhCpwNYHRQFCgXASwqg3QcenCJrJty611mil8U0tp70yV4jOeRjws8ArnPktIth6pRSbBGOPyoRaDKXkkmhRCoOzfTXkd1UQU1PFgnjRRh0m6g5dS1c8R5Gp1hW8JXaqJWzjucVeZvwB1RO6cLmBfAXXBbTbDCiS/Y9XFsYBGFmk3xJkIZSrlt8lmB5AqiJOrBwjQt+lLScVlOUHWaWMaVFM6A2PC3tEyp4De/Bzyqg8wSmFjPZ2VMoNFVqV5q674DozMe1DtNaDnQHlW/12fCJR8scG1/PqyuTde9ha3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGAP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::21) by
 TY8PR06MB9176.apcprd06.prod.outlook.com (2603:1096:405:3aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 09:30:48 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:b6:cafe::8d) by SGAP274CA0009.outlook.office365.com
 (2603:1096:4:b6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 09:30:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:47 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E73FF40920E2;
	Fri, 23 Oct 2026 17:30:46 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com
Subject: [PATCH v1 3/5] dt-bindings: dma: arm,dma-350: Document dma-channel-mask
Date: Fri, 23 Oct 2026 17:30:43 +0800
Message-ID: <20261023093045.3248630-4-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TY8PR06MB9176:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c24db466-c210-4e00-5d7b-08df30e8523a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|36860700016|7416014|376014|82310400026|56012099006|261009223027099003|18002099003|10067099003|22082099003|261021121427099003|6133799003;
X-Microsoft-Antispam-Message-Info: WriKSUVKDZ1GW3bCyYFGSPu1L6zA5reXEsASkpjUasKOcWLUxfRbYN+8FzW5FJCZxjYhQIyjT4CKvC6an3Dz0nSRrOZLjEF6KuFHNJJqdMeoc1JHIbFSQ02Ct94UXX5xJjVGNffxCxD855tW6ofnBLCN6yCB6mbT3QaZ44dhZBNTkRX1DmoqhliUH8Ie3YVHNbIxkbfWkU7an1SNt9QduDoTRyAs/ur5R/xNsAOjh9oZCJtcfXfR2DMIqDCxnDFuEkcPRvRQM3AfLTQS6hGLasiCXrAp9G5HAf1nIxed43nYcg17rWl7dfnleN4DDVBMCIRUV5ZUa1U7AkOwT0ccN/8lizdELlo+d6A0NHbzaR+nsGQVc62t6sXMBKEG2bLcaC6APm1ZQjMXpJZZ5L+GR+w9UosFEXLQ6mSIs/NE+qt8Kalq90Dcyxb99/K4H+9+B+7DyLNKddc/TI/jRzWrurjEAcu0kjSp/HJksPvVJ6cWQJjGr2CWkqCfgA711CQR24IbQI5fOtXZFX7bRO26dZZeHRX8BXCEC9GllwZD+5YmQnu8fqITsQvg5+p5ykCY1fty+cPKif0kBngMysb+NPifIHHr6yqUz96hoiU5WT6Bm6oshF6PNIbbX8S5yIMymzvZVFZYl1m2zGk3Ym7cWixxu43hVmQ9WglafgtKwAMe+8OVBU9AF1C4VObPBm/410YOUwh8h0r+IbgRycDXUg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(7416014)(376014)(82310400026)(56012099006)(261009223027099003)(18002099003)(10067099003)(22082099003)(261021121427099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hgLZkeYiECfVMmGm7RPMR6CujAf/NZDQXIHEArw8gYb7Et1Wlrgyk2xLtSopMELRMnmFxTYQbWnmUg+117FGqyJgnRHjUOPr8r3SWkthRlMTZPhzZgoVvEpaeqEHycRf/DY2zxq/14AwPykUwQ/ze+RYCIK/hVG9ZOUGA3uavsOQ3WkOjS29BmL82fWO74UYJfYeB7JXQs8kxxFc5HOj8dFCdFofCl9+tQEgxueUL2nvv+lV2d/ZGp/FoHIWXT53Ymrdxp+7/U3qyRl80Y9OsMZ24Cxr+dAWr2nu3t1cU5lVI2O+m1hpqlBEKkIsKpuDvS/oln+Z3ucMARTrbLmMKklJpuWIM0lzxY8+hjdUBdnxw4rsad4tgz7O1FhCkXxm8FuMYGOJxCChr7qfomZ2p9EZBFH5O9A+x1Vz2uJDRh03JUtQElBwTz2zYFZXr+54
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:47.8369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c24db466-c210-4e00-5d7b-08df30e8523a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY8PR06MB9176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_103106_781113_4E277608 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some DMA-350 integrations reserve channels for firmware or another
processor. Allow the standard dma-channel-mask property so firmware can
describe which channels Linux may use.

DMA-350 implements at most eight channels, so one 32-bit cell is enough;
limit the property to a single cell.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 43279878207c..98e7bb651210 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -43,6 +43,9 @@ properties:
     description:
       Optional reset line, where the integration exposes one.
 
+  dma-channel-mask:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.54.0


