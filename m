Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7713DD29C57
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UadT6BhKBE9PfSWwX1bsAVVcFS1D5/WhobtDx5hQJ70=; b=pAVOW1zMTg+1sySeqsi2s7j6/y
	JpT4SVCbrc5FyMXr6QHvsq14UcrzmYcYn2zhsD7sj+7DIx/uge/3ysDBNK/4WPFF21YCqQ1E8I+B6
	HN7KHQ3NV9fbBMu2AMeZtBkcs0x7lh89y0n0FxnLsZyN39FnMzVJZGbqGw+OTdPWuCU+cuVy5tOok
	lSHPOGEImg1IgtDHTJyJIayebqFnCo86x9EisLCod6lPYLmDqviTbn7JyJ1pB2PufY2mv+L2UwN/h
	9dBoYo7zUIOxm7pW+xep0qLjYR+VLikt4vS0qDQxl1N3rHozFGC4z13cxyBVuhcciH+M3CMB8ZSZE
	pRBOSk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhthr-00000002glF-3ql6;
	Mon, 19 Jan 2026 18:10:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhthq-00000002gl9-45dA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 18:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UadT6BhKBE9PfSWwX1bsAVVcFS1D5/WhobtDx5hQJ70=; b=lmex+5qv6TrB0LePjYthdQc+KL
	FJdNDiHIbSav8UqRAprmFRodN/pMQpPSjYMck+4REHjIsaF+Vl0kMGTiCDwr20mqqN9Fv169HSkY/
	nuJ4aqiBrPFdpcAdkqjuGTjuLkW6zO6pGK7i6NMZjb03Ngox2/U/MbbRofvxApAUqPRBqINry8zWF
	sfBFR5Ucr5cjGl24uUFQ6+xfrWhF1t/8VSGYFxb/3bW29nR0W5CKYO5dz0jKpqEdiN8OtemUf1gkO
	sk40SzTrdp8HPERpHuJBbl3OGfpLov1eyHjf06Nf1TC5ZsTvoUrJMLgveKyInImJbtO7sf/MjxTAa
	TK1R/8Qg==;
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhthn-0000000CkdD-2dFc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 18:10:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGpiujbzBN5JNB/jKBq5dh4DnkfMZWpFhvXAnYCZy/pAhLEBaKCfv45qeIa+VrXulQO10POB9BQWy31N7RRe4Opa9qJ2Q4wNq0c27LnPbySKBvlrm3hIF90skWpg4DCgRAYutimkUEjGi0cutJJybJhiHKR4LuL/EEZ2mPUFV8eZz17v0S2xfpwFiv5bRoiNkpHB0PYNVXjjLTcZdzjclpZee88kbiU74aI1+Z10RFaThfZ9L4RmNIpczEbo5xopRYSrTNIx+L94haYJugHU2DBKO7CxUoYFPxInfHAiD+RWX1NXP9AvlHTN2DrFqcZ+P0AD2OwTzeHK2/wN5pNYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UadT6BhKBE9PfSWwX1bsAVVcFS1D5/WhobtDx5hQJ70=;
 b=bRFM3chYGqd78LlIthPCNcyyDxE1QoJ597QfBMDXCPwixY+f4cSV/eyjRmdEC7GRqOfdDJVgRN1V0BmTQqpUtj9GUw0J6T4GN9CqqNQXwwPXvUuGC/XWCJ70iZlmqr22obp3BLrpeX8UU0jUpBe+ZOZBC6vwdvHI0zSelg6iHt46uOX+VwwYX+bzKJHhD5ANuBZ4Zm1oChttzUT4VDL6eX6yNFctYXOimY0uRekTx573SFxdpKg17exvO3inrk3/qW/VO8VeNty8/30J1IPXeiTI1irSre1r0WKtwxQEKPwFc3MrD84BAbRV8Frpf94t+lHlH3ZH2+rblO1GQQcw9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UadT6BhKBE9PfSWwX1bsAVVcFS1D5/WhobtDx5hQJ70=;
 b=Zq3ZvABUswEKPlXNB9oRZ7rL+JDhrPHW+aFYaeri7tb/UdrD50wmKYV7bQaV1rZObBMjnlJJmCpcmP0dhBSXpJzXNSMpe1zWFlH71ITKAB1vj8ooprzXFg0ybDZGPH+GmIjV7GmVrRQieMC0VfRQYewQ8Xv9J8HpPhv1Ua2OBiGi1f2ElacGlJfqtLjqfJ9CgAHlDNGAS7ZlAepLBdIldVbOVzLLKqfl2sJrK7C4ghRdcRNUvAvcKKLDT3EUQFLduwrHFMGFcwpHAZw1JxQacB3Dw73bxaNncXPmHMvbNE/I822OUryLZo1TmSjJI76YwbuPgOvxedh9fPRjUiY2kA==
Received: from BL0PR1501CA0014.namprd15.prod.outlook.com
 (2603:10b6:207:17::27) by DS0PR12MB8442.namprd12.prod.outlook.com
 (2603:10b6:8:125::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 18:10:14 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:207:17:cafe::1e) by BL0PR1501CA0014.outlook.office365.com
 (2603:10b6:207:17::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 18:10:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 18:10:14 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 10:09:50 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 19 Jan 2026 10:09:50 -0800
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 19 Jan 2026 10:09:49 -0800
Date: Mon, 19 Jan 2026 10:09:47 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <bhelgaas@google.com>,
	<joro@8bytes.org>, <praan@google.com>, <baolu.lu@linux.intel.com>,
	<kevin.tian@intel.com>, <miko.lenczewski@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH RFCv1 2/3] PCI: Allow ATS to be always on for non-CXL
 NVIDIA GPUs
Message-ID: <aW5za171oqq+7dBF@nvidia.com>
References: <cover.1768624180.git.nicolinc@nvidia.com>
 <61388f3f7d660994fa03e77bd37aa84b6c5fa3b8.1768624181.git.nicolinc@nvidia.com>
 <20260119180026.GN1134360@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260119180026.GN1134360@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: d7948963-74a2-4394-2752-08de5785fe66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+zNcD6/Lmcm6G4kknwps7R4Tj8h/me+Vzunbq7fXsJrPCy56IXQTQUla2Sa8?=
 =?us-ascii?Q?expibiB4apjUV7Et0grCNTgH7IeGICr1iilLiCmhPjvd3dXEnmY07k/Q6NMo?=
 =?us-ascii?Q?VtmJvsyQN6qFKysEvgLm7Eap7fN2EsnVPZhqSkZTcWY0YFV9I3iXdFrtrmzK?=
 =?us-ascii?Q?ydvoAGzMFqGk4Eo1VZiyrdqMtPWjJqnt2MWPCC6jgnDDUA3em5+q1IKRhrc2?=
 =?us-ascii?Q?65M/YkTUl0Ngmn8VJ/2P0MZ3PjtgAkRMGQMlaiYAcKc/rvrqfZ+ZIKnDUPwG?=
 =?us-ascii?Q?A16/mY+IG0e+F0DzhQRc1H2yPenU32sr6NOJ4uoPQAlo+Gk5nEolUOXCICw6?=
 =?us-ascii?Q?G/guFHkE0d0ijr6L3EoFcPLvDwG0bysrjuRZ3otHLQO4gk4BQXn5ROECOV2P?=
 =?us-ascii?Q?liNsM1DeZAe4B2y3/9wypB+tZbCniBatPixnRzYb4xlFQrNnaDxxJkMKshnx?=
 =?us-ascii?Q?mDo95Uru6lY3XrVIh7zJhGZLs9VyibeIf0/biYvDmUkN52EYEp4+dlyPC+4A?=
 =?us-ascii?Q?y8yYaYDCsxjgiRqGGkCZ0yoE7qx9tjRF+4dqyY0LuKAwqH5o/p0MRmeEPqL6?=
 =?us-ascii?Q?m6ED1MsjRJbexk+oH3Bo5Q+WlxPXhAXDpQ2gA3wGB62U3RtqpdBalI4upuKO?=
 =?us-ascii?Q?d/RXSPV9ILzReJrnv1eMJxnw+dveChGMs8UuYscI1L+kf8CNgqnt7DtyKb0T?=
 =?us-ascii?Q?a14NsV2Lti0zcKEwJgjkZCGXgYBdu5e3ZScAAsXhgh05eVsR2Aw5SSVllRV8?=
 =?us-ascii?Q?lnE0f2OXt2lfOCKpErbXk9zQXgsf99Eam0H+cx03tTtVy9ULPpm6GMl2sdHU?=
 =?us-ascii?Q?v9a0nRpu0oDA9d7nvGQSJ8N3qN+7xOoqcGpYKjFSOCiFjBcn6AeBkqvyABWA?=
 =?us-ascii?Q?n5XCVDL4seazmEpAghOAtuYnwIxzm43WBZhHTiZcC6N/JwH/dWaYYJ3KHT57?=
 =?us-ascii?Q?X7NZ5HUL7I/Fyoa/Z1SAJXPVz7Fw4KBXgKnSM0z/7NHFkydGs0lWssTOcguT?=
 =?us-ascii?Q?FcljuCJNhBJvAMZhccuTKesTBiibPA9qtVb0zf45R7/+OMubePEyyx4g8UH6?=
 =?us-ascii?Q?/DSgAk5KPQ4+JEkWhLofncMbKwyceijwiKekhju5rG38s0wjI096pLfeAU0s?=
 =?us-ascii?Q?JD1u9Uta2rZB/Kvd/DR82XyvWLJG49i1bjvVG+GFu8bN334cER131SFgbBR8?=
 =?us-ascii?Q?qf1AGTJBSVO0egibVdGHU8VoHEELBb3iKxF72gAi2hCY5EGcUkusxKdC13ic?=
 =?us-ascii?Q?pXZWPYAohkldrSP1/cGVhAXOHfV+4cqd3939ipABNvCLG9/mWdP6KwKgf0ke?=
 =?us-ascii?Q?a9u2I2mLZXeod5KoV24WM33p5qozWuToxy7XbN+Fxv4N2hTebTi8ci5O5NvK?=
 =?us-ascii?Q?j65hD37tqgZRSGVEYCO2lqJlLgMSnjhEd2zoatqsNy+uUyZDulsm/aqOo+bS?=
 =?us-ascii?Q?b7Jb4uVkx3p3bljSTs7Gwhsc1IDF22sZP07SMd0wS46NgyRc5NLq1q9skWid?=
 =?us-ascii?Q?8JRv4pQWqCoN4efdUqMmLPFpApRpTePIxUJCQTGoChldM2nJ65SwXjaxH4sd?=
 =?us-ascii?Q?nn2EylZI0i9VuqjDUplJy0kOr02cRYsd/K66I3kRJj1f+a3KDpO7noA5vibs?=
 =?us-ascii?Q?i0/sztHOhqeKcVuTwM5Zi385JkMOPhnhLAcxeO0kMFkIbATygau0FzM+PYlF?=
 =?us-ascii?Q?GV09DQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 18:10:14.1820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7948963-74a2-4394-2752-08de5785fe66
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_181024_176054_49D87277 
X-CRM114-Status: GOOD (  14.16  )
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

On Mon, Jan 19, 2026 at 02:00:26PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 16, 2026 at 08:56:41PM -0800, Nicolin Chen wrote:
> > Some non-CXL NVIDIA GPU devices support non-PASID ATS function when their
> > RIDs are IOMMU bypassed. This is slightly different than the default ATS
> > policy which would only enable ATS on demand: when a non-zero PASID line
> > is enabled in SVA use cases.
> 
> Not support, require non-PASID ATS.
> 
> I've been describing these devices as pre-CXL, in that they have many
> CXL like properties, including what motivated the prior patch, but do
> not implement the CXL config space.
> 
> > +/* Some non-CXL devices support ATS on RID when it is IOMMU-bypassed */
> 
> Require not support

I will fix these.

Thanks!
Nicolin

