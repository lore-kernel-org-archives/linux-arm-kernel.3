Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DDE606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 05:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ecSGVMVC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BfxSK9blQZHHcX8JpzN1uv9dxENZnOuG0i8qSjURnPQ=; b=ecSGVMVCszdI+IITMgfmdW0z2e
	sC4ft19tLOOTusOuwU5PLQbyNWKulFdCiQF8iu9rS7+Nd/OHmnE0JdaDmR663JHyd2B5y7t004PC2
	OLPL2B0Qxbilqj1xzHqDnV7/5O8xpn8wPvtyWdxqkXnbhedsnDqgfuFt4cE2nfRm7rGmJ5fVq5KnT
	tmzv8wmDfzwd0VNrayKn+R3Oe/IQajdQV4m7mCR6J8djB0YNfl4HelC9yr+p5F4I9VpP6qcPqcJbx
	EnukXvX7AQ/xBMNwLSH+jC48aD0nQ+Hvo/Jeg9vPRL8O/V/9CFCab1b0q7FBWC8E43WnHIkp6cJFs
	uCbAa/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIdn-00000008OXZ-3Ez0;
	Thu, 29 Oct 2026 05:25:31 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIdk-00000008OXC-1p4T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 05:25:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1IL78kbtMjUQtUdluRpXXS54FmMJlgERlqCGWAv4E9T8aoIyiD5pUf75VWWMI5PX1JWiqZRMBCEXsvMk+qCAoYFo9IOftGzC2hUrTYwVbKaohGbj8KHBXh8om9yghS9/Xqje83r7FkZ6sI7ADuVOZrj67Ykw95B+HkJv3NbCEQaIgzSaXxXnhEYQS2XQmQCnzG6Ho0wSrwUOkb5xnF8n531yTwTvFKTCfkPIIejbUXfj8Q+0bTIdFj4m2y6wEWDcBKqdzM+fej47Iy4xEG1wr+4LtFC3YIW/CAstRjfvC9ZAEdfZzZUX4V7qJUtGN43ZaFcLjx42wr6W4Pp3tXCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfxSK9blQZHHcX8JpzN1uv9dxENZnOuG0i8qSjURnPQ=;
 b=mxn0psF2puZG2OYIBKujUrds90LC1d0iMZo/zkBwSLlN6SsAzX7KQSiJwH5sIkbTQykoYIq7jr7NHSgNBuvjcIA4p1HpIssgyuTv0pEy8n3Gzk5o8Xuhnp/kdcDBohtu9sNpGy3jPZfKOFxwBgnwXcGTPPiF2KocyREBj9TqhuKR9miXk4a26XTbdwcm0QUo1zyTUdmpqJPb0F72Kmv/dvJ5kJBoOT6QliCm1HW/zRNrOdGTdZh+dHOd9yNO+KaRLPtjo3tAfWbblycLcS+q6tIN+mwrQ9ajPF4jIn+6hk+sIGHNQHagHX60qZvn17ezLp/hlHM6wMeLDlc6HXHCvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP301CA0039.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:380::16)
 by SE3PR06MB9066.apcprd06.prod.outlook.com (2603:1096:101:327::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 05:25:20 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:400:380:cafe::49) by TYCP301CA0039.outlook.office365.com
 (2603:1096:400:380::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Thu, 29
 Oct 2026 05:25:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 05:25:19 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id ED5B54102B49;
	Thu, 29 Oct 2026 13:25:17 +0800 (CST)
Date: Thu, 29 Oct 2026 13:25:16 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v1 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS
 DMA IRQ controller
Message-ID: <auLYvMvU9HaqcbcX@ubuntu>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
 <20261023093045.3248630-2-Jelly.Jia@cixtech.com>
 <20261026-able-complex-skunk-d7db4c@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-able-complex-skunk-d7db4c@quoll>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|SE3PR06MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6a8021-831f-442f-7e46-08df357d0634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|18002099003|22082099003|56012099006|4143699003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: HJ975+SZps8yYUJBSlcT5dM0FYIyMxzpMtl8iLijzz3ehr6mfLg2VRJ3e7dbLZWR80Ne4vlQxr/4nGtaHiNFTfEHru1+LpTtBUC1YhYe6lMsSqqIlr3wEMFV/XuprnncbULrJTZjydN60L06MjESFQmNl6VvWOdbBUv2cZbk+YJYF3lPsJQnaPmIzRp63qbZXmRKcRuxpGPAPhF1zy/cu636XTavDZyAOIH6NEGLjYag1nauxf3BBmm85DyeRznr/S29lJdu37RdAFRj90oOlJ+kDN9IjBOZ9AsLB70rU06buIdk/y6e49esD+y5K5Q59QGDJOLELHTxIt/0/2NBctKxnNGICRQ9m2/MtjLUhGpSab4yXr+dMZ+i5L9TDT5vTYTmhOdF0OOu4Gpxmw280P/3EHSIfMmllK/mXF0US6B6aOPO2AYZ64pgRW/2OskmKSycFTVqdd8ItzSvxe7iKNjbqIRmIxQU63nF/z2UcpKyIKCLSXTflfoSv3BAOGgaaAnmHuOzuJAQa6009qrOlz1wH1xsOAjlGMem6uzFvdn/CyO14wnFv4YcyT5aWm1Xefd9LurZayrbdcgnlCT3UTm1iFCqL9N3p4qvCbq7J3fJ2qINt93LsIZE8cq9mt/1bDgJKfi8uwRn7ez61u0oWsvK0LE7a6rhGG9h7E9S808Bl+4iJ8645RqbrAxzsDQEtSmKc1i0WnMJ0ApkT+GkjA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(261021121427099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6K1f8tdGhgCX3Aotky/5GrC6Ydn5UutZWUEN6jKVH+eAMdHhnTAykBHwl5WkM3thhfNPFiCM3uW8c/fMWSQSv6U4Sou9mNAbuah7ykgF2X1uvxX++O9is3MGEsh1fM44g4Y5ABPkr95QnrhD3e0Gn1G4IpGFRnRSRgNtcvxuHLjJuwI/gTix6MJ82K0dGNJ/VfAx3WhPCTWKum1PWnixqWe2gIYmljAwq9yAiBs1N2WyL86dd2tJkKjeFiR6L3DTeT21iCvT1P6Kr4ym6K1KSb9tfsfvoBN0O8QELOwiojnLRMHHtScd84Kps3W0ECF1QFzSfjv0pJiWo//T7rSoo5P4/+oM2JWfW2mHzk15pCxaqIZE8HSmD6OCEo87emZMqBXKPlV7Wt1ixHwl1YNcprJ7XIDdwQUG6CkysMnR1cx8CRR2ogDkSlJH3wu2Q0NJ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 05:25:19.5487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6a8021-831f-442f-7e46-08df357d0634
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB9066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_222528_988332_2DC9BEAF 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

On Mon, Oct 26, 2026 at 09:12:09AM +0100, Krzysztof Kozlowski wrote:
> > +    gic: interrupt-controller {
> > +        #address-cells = <2>;
> > +        #interrupt-cells = <4>;
> > +        interrupt-controller;
> > +    };
>
> Drop node, not relevant.

Agreed. I'll remove the GIC node and the corresponding interrupt-parent
reference from the example in v2.

Thanks for reviewing.

Best regards,
Jelly

