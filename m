Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBB9CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZmG84oZz+oUtpoy4LFdm29q5PhfFAV3V3PE7tXIA/o=; b=c2DZDuyVIf5Yoed8pdTBbO6gmc
	quZUcHBJUXJXY3ybBIt1GW9N/PVnePyINmG4wPkjwNRH7SGblvLskdgRz+ROzmQgr6JmG38JtYrb3
	g+Vq/QmY7+txFN4iqMLs2giNJWshmFFk2yFiTOtC6nApDdt/fRYd9BTL74ImdOcd+/+4azwXxu46x
	PxS9Wifn1N04TfAdaFT96KxHfyH2T9pgBOGN54bcKSo7n5kNwTQTVdGyEuSjpiVpS8DX3nEHa0/yT
	bdi5bkutjrUo4XUaFWgj3gtt8Ms78hPyJcCGOZrvOJd/6V3X37SmUaUvHcYT8cBITIS10QZ2Qrhyo
	XL0lZhAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJT3-000000046OL-2Fej;
	Wed, 13 May 2026 23:58:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJSt-000000046G5-1Xne
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 23:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7ZmG84oZz+oUtpoy4LFdm29q5PhfFAV3V3PE7tXIA/o=; b=nDu/OD3hCyJGzEc3BHoFXDWeNk
	X8tRAM3dqz4DV1jMY+DyJEb/31hJ1YsHqtOQEw+9y20YGzISCSwyjs/mcFe9HpJcAc4lx6UaiuvzM
	VVggbnbjfO6hr/VCAytI+PCb4TphvzMl3lDNyjf2UzKTwHAQHI51Ckb+zVEtjl3UOdva0REALZa9V
	qRuL4VNiNOEx8yDsRXaR5ZoWJHk3iTm3xD7tWmCZsQ3pl5k6mBzvxTn28HSypiXKUHK4cwBajdxVJ
	QEnpFjMNFVHNMljnzA48Q2Pd95icLSE4J1jTGL8I83V5FIloF1BRAvpo9IJFbuIsYyOpqMIbVcKVK
	3XBbS0Rw==;
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJSp-00000001mzn-48ji
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:58:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3zTdGTJnSmDz3D7CtR7KXOoVqXcXfHdNV+gAL0HzvzuY60yuCA62jfiUdxTwNwpHIaiBHNF/iLdIAeG3u6NHE6H1EC+sfeDqRpMa/crRSXyCzVUmCISspUjbAuUgtmHZ8rBTWWhko72h1JI97btY5JDUJvsscWJa+Pm1QCLD7tizSjjELKX+1T8VlKAup4S6oDcWxJYZ4xAXr/pUFa45dGwfe4rAMNlyWjiTvAaStbUqCAseAfZg6gqMDRI4jgQqIRbaXvZxLKvB2dc1pgQH9g6xITfruLwqRL6TLyFY9FDSXcQtkvwX0IFfM054dfxFbFhiQ52Bo12u/2SCJfAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZmG84oZz+oUtpoy4LFdm29q5PhfFAV3V3PE7tXIA/o=;
 b=LXnzdjwlQrr7NV5zfQ/Qi+T4g9e3T+bZ2wLaqsCKsmtclpjoe7eUATXRpihw1rCpyjiiE0l8nGeiKZd8+J9TCg5XltNxdk7xw2Gg5A3OPJl2QQVUWTtnp9vyCSu9ZPuUcHQ9G0mwskmeCttJBZRV2JBoJfNY07oxJ9+/BKZDCV8vWBb9VHj6Hv7Kr2R2xjw6n+1fYiLYQxeJhfN8InJVJtkXqjqai0DGFU+I88bJFCyWDlWF/1DYvKbUib99uoj5HckhOsABDtEreYwnsa3vQ92WnRsFgV4K3mURXsGhAiIHvAAq9yRQ1nl5HGq7Of8rAlFqZBbph9NUmphNe03vsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZmG84oZz+oUtpoy4LFdm29q5PhfFAV3V3PE7tXIA/o=;
 b=ffqK92NaG/FoX6XTNzdVw0wGp5oY2oeKHrMSHwMm8r7k09IfQlk+lVw08bEYi6+SJduIw3/1JqN4Urpd6/qb6IGJULI2UvJvwxfRxtCBzm4z/UNEqe9uNcoqlQMuNb4dQDuJ3ybaD/A1QTBXosr1kwIFrfWdHCvq740RDMwJ2+xwPL7JY/chdzHFd9NWZE0p68ezoiXNFRNiutj/PvqjVroGHUoHXXxOXHAH4yfusKfxmIK62xgxsYK3gpHfw6Rmk+HfJCK/aq5HYqqpC9Pw2f570ksP9tMDrtHZIUSzM0AtSeRAYPAvbCzF/P+UiEQ8Td3dqEOtor8a2K/qhHLmMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB5653.namprd12.prod.outlook.com (2603:10b6:510:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:57:55 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 23:57:55 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Will Deacon <will@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 8/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_SYNC
Date: Wed, 13 May 2026 20:57:47 -0300
Message-ID: <8-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
In-Reply-To: <0-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0264.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::25) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: d72ada4e-bcb1-49fc-40ad-08deb14b718b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|3023799003|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: fZPrmzb9+EHT/lq8SbPVBrSQHXcoP/eYpYue90rpfsy14nRHhsiCDm1GEOyutoalUiGJrl/O3nR7HY0BVGGUdFzzcb9/SFLpY1LHvJRca87cDoD5jPTMxT5IEl1VFwTs1GIPUQNOBeDpn9s4A3fCXxONPvYzeiMIiw1dyk4nS15fvuFAw7u16WMylkRo1e+PM4dwUMSP4Ts4iT3jGPyApHFQDOGit2osQAd3Zj5tLGEOLvRVL6MzFagM6CkSGojNUIVOZTC2QvxCN8hEAcBMdLIJyn/s3P0elLLQ+LXqa4IuytZQUtdc0gRfRk/D+GBRvfgqvp9u3rEPdQcMftzZ00x1/fXr92DRLceBEp1kW5oKxeDot1aPN6NlGX39w0u1ndbeY9EXS6nT3Xxz1GcvUCMdkTDXxcyAc0voZLZGF86Zltq9EZEY+BuuMQAZzPZPJ2g3iEekf7iAiXgTHQZ7Lmcl1eaxO4tAdXaNSILJipMGjMetN7fA0bYk+3H/pLzoEVDUv5Vq1YjEeewcfhhVGCOvFkhD0/C0udOlSvq9OP0vkJfo4rtKsVDutroRoYwg2JYtybZynkUSK0iVzejA1ps++MKu16zB/68XB4Fue6wgcapaEyfKySAEXM4PShiP7nwExX10MAp5tKWpucjRJtqErCoay3mDNyI+uUK9rMCL34lu1wPqvfhNFCYJDUgu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(3023799003)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kYthhBADcLGP0y8fYinFw4xfqCEtepSKeoZ8jqU2QyTDZWbrxWuE/C8d227E?=
 =?us-ascii?Q?Tq+4gXjEAAQUB4PDv56MdOY5YCOyVG6jo4PGe4I0RHUZzaXPZ97uv4PEQGdg?=
 =?us-ascii?Q?zjcfYA/EiH1mQ8MNLoZExOJQHL7Jl6Y/B9EwxIiYLMB946BU3iF4rlfp+4Jt?=
 =?us-ascii?Q?vJ2zYaugGBLUXJ/JYvCdnwg92ZZOFxnORpqdb/m3e2VQx18SmVl2Xn2BRSvS?=
 =?us-ascii?Q?vv7rLVjHZxMbR+E+fsY2eUFUE5ScfiVhLditZM2V4PothIZDs7gGUx4UpM3X?=
 =?us-ascii?Q?aBPWQ4Zlmo+MnfWFOXJAt1zHLuz4ENFXK83K2bP8ChSU17GbfOD7/5bs6SMp?=
 =?us-ascii?Q?DOZUXNlaOavUbj6tK1vSriovCFVM8TBwTrLg4qar+HCIFG8WPp61rlaSCqGf?=
 =?us-ascii?Q?mC6dqQHNsxcwVUs2h6txEFoqyNqQcRdvyGx6mPFyZUl7tO/7go49fed6inVi?=
 =?us-ascii?Q?tteH5L7M3EzEgAtJPYL6CqA7vvqSVcNo5o+JO38OIBX/EURB6Zj2Dzn+SHBu?=
 =?us-ascii?Q?gY3ErnRCTWFsipP4Ow1iJ4wy0MEmP3cRQSjKoluPvnqQc7cmi9KPdE50PMdK?=
 =?us-ascii?Q?pAZ80YmxI7Q9KVce3MR6SoiUp2hDYgq6s+A23mxSiM8HPv3IPsWDSiOcnfqW?=
 =?us-ascii?Q?2RHivp74rK+awafaLDGildnadTg/qS4HU5hALbRTcfv9CFDr2iOH72IyAuSt?=
 =?us-ascii?Q?+QcZ2ScWJPQNiJTmgkhZ+sIaMPUVxWhzH1RoDtpeHndagbvQ+dmmnXDkW4nW?=
 =?us-ascii?Q?L2c3lL3gdEuSouJjWQpqgzaRCXu03bxdk8KUehRlx7MNp3alb8UNU0hl0XRS?=
 =?us-ascii?Q?2EFyvl9KwkVDxlrZhBH2XaVACgpHZeoGHiPjj2paEpZFP3WAgbVBldX2dQnp?=
 =?us-ascii?Q?ZYY1eHT+AxQpaUnJha+hpnw2kCZOT2EmyIB0PX4N2jDTXTsXjkpQUoS66osu?=
 =?us-ascii?Q?0QkfNXlU97QIcd03zeq1ujGbfsvDjJt46bur+XStwHnj00Djs8yQi541zrgH?=
 =?us-ascii?Q?S3WmYk16SGCiCg9mkgqxXvqkiVWX4ov38lxR4aBWk9SruBy6TZ4QJS0ZWwbf?=
 =?us-ascii?Q?UBJV2nS9Md5IziRZWKY0+U7WfyMET9/8Pn2U/pjQFw7/E1voXA1q6k0Q3CXF?=
 =?us-ascii?Q?uoCCtXeGhzUL/zRh2YHFLXnhR3mFgsLfaSNxbaK9bQRDYaJKpGNgtCBjBVrM?=
 =?us-ascii?Q?5LnU2dcYjdDyXYVz87ZHbaDrvkiYdm8rM+iYNebQsSEyLKVt7Jz4+Kpuikej?=
 =?us-ascii?Q?2fCZioNE/5iB6yXgMlW9mxu3PAxtXxNUpOYpyLTIzd5gFCKfPbVncKY+PwZd?=
 =?us-ascii?Q?CbbJMVHxviHuFRE/+e36ab21Jt2l4BTZi+G3RQWpOKaEFCnxxLAVxnbiqcwC?=
 =?us-ascii?Q?8CA3HN/5lFw4zUUFB1vOD8kqrQ/XE80+UopDeDL5jFDGoQhQBmtrEnJCO/ko?=
 =?us-ascii?Q?RiQuQ6yqCN5/7vTr7501YRnB6BJh2aGHDCeSSz4huXfixiC/N1TbMk+pfojj?=
 =?us-ascii?Q?2h+SGf2kY3rjBO4YPSgCOQIv3a0aKU0GHae3Wsyhue8bKrjwuX8Cx/k8LsaF?=
 =?us-ascii?Q?QpgaaJ2Fd3wvHP2uTsNEOMsI/DSVDXoQdeGOuxiGeq30D3pBnL6+pJGR2qGK?=
 =?us-ascii?Q?AnbozH8AzVtttbFMFRl6GgQ7o/++wxh74jP42D+quOP+1pGAZIB8hRdLX7AT?=
 =?us-ascii?Q?yj2ZINnxvPidthleVLn4va5V1O0OA/c9YjPvqFWqIo5NMBex?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72ada4e-bcb1-49fc-40ad-08deb14b718b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:57:52.7719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51gF7n+QSHkOfVcP7z251kvY+nJ/ffL60RcGFko98b9uvUZmj5fvcS+/1tPAPfpq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5653
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_005808_443303_AD37F548 
X-CRM114-Status: GOOD (  14.96  )
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

Change the flow so the caller controls the CS field and remove the
weird u64p_replace_bits() thing to override it.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Tested-by: Pranjal Shrivastava <praan@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 42 ++++++++-------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 16 ++++++--
 2 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 0cdf0752ff6d62..8147b9cdcc6b99 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -308,16 +308,6 @@ static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
 	case CMDQ_OP_TLBI_EL2_ASID:
 		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
 		break;
-	case CMDQ_OP_CMD_SYNC:
-		if (ent->sync.msiaddr) {
-			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
-			cmd[1] |= ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
-		} else {
-			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
-		}
-		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
-		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
-		break;
 	default:
 		return -ENOENT;
 	}
@@ -350,23 +340,24 @@ static void arm_smmu_cmdq_build_sync_cmd(struct arm_smmu_cmd *cmd,
 					 struct arm_smmu_cmdq *cmdq, u32 prod)
 {
 	struct arm_smmu_queue *q = &cmdq->q;
-	struct arm_smmu_cmdq_ent ent = {
-		.opcode = CMDQ_OP_CMD_SYNC,
-	};
+	u64 msiaddr = 0;
+	unsigned int cs;
 
 	/*
 	 * Beware that Hi16xx adds an extra 32 bits of goodness to its MSI
 	 * payload, so the write will zero the entire command on that platform.
 	 */
-	if (smmu->options & ARM_SMMU_OPT_MSIPOLL) {
-		ent.sync.msiaddr = q->base_dma + Q_IDX(&q->llq, prod) *
-				   q->ent_dwords * 8;
+	if (arm_smmu_cmdq_needs_busy_polling(smmu, cmdq)) {
+		cs = CMDQ_SYNC_0_CS_NONE;
+	} else if (smmu->options & ARM_SMMU_OPT_MSIPOLL) {
+		cs = CMDQ_SYNC_0_CS_IRQ;
+		msiaddr = q->base_dma + Q_IDX(&q->llq, prod) *
+			  q->ent_dwords * 8;
+	} else {
+		cs = CMDQ_SYNC_0_CS_SEV;
 	}
 
-	arm_smmu_cmdq_build_cmd(cmd, &ent);
-	if (arm_smmu_cmdq_needs_busy_polling(smmu, cmdq))
-		u64p_replace_bits(&cmd->data[0], CMDQ_SYNC_0_CS_NONE,
-				  CMDQ_SYNC_0_CS);
+	*cmd = arm_smmu_make_cmd_sync(cs, msiaddr);
 }
 
 void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
@@ -383,9 +374,6 @@ void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
 	struct arm_smmu_cmd cmd;
 	u32 cons = readl_relaxed(q->cons_reg);
 	u32 idx = FIELD_GET(CMDQ_CONS_ERR, cons);
-	struct arm_smmu_cmdq_ent cmd_sync = {
-		.opcode = CMDQ_OP_CMD_SYNC,
-	};
 
 	dev_err(smmu->dev, "CMDQ error (cons 0x%08x): %s\n", cons,
 		idx < ARRAY_SIZE(cerror_str) ?  cerror_str[idx] : "Unknown");
@@ -419,10 +407,10 @@ void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
 		dev_err(smmu->dev, "\t0x%016llx\n", (unsigned long long)cmd.data[i]);
 
 	/* Convert the erroneous command into a CMD_SYNC */
-	arm_smmu_cmdq_build_cmd(&cmd, &cmd_sync);
-	if (arm_smmu_cmdq_needs_busy_polling(smmu, cmdq))
-		u64p_replace_bits(&cmd.data[0], CMDQ_SYNC_0_CS_NONE,
-				  CMDQ_SYNC_0_CS);
+	cmd = arm_smmu_make_cmd_sync(
+		arm_smmu_cmdq_needs_busy_polling(smmu, cmdq) ?
+			CMDQ_SYNC_0_CS_NONE : CMDQ_SYNC_0_CS_SEV,
+		0);
 
 	queue_write(Q_ENT(q, cons), cmd.data, q->ent_dwords);
 }
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 194f73cabef5c9..538380de7d48a0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -571,6 +571,18 @@ static inline struct arm_smmu_cmd arm_smmu_make_cmd_atc_inv_all(u32 sid,
 	return arm_smmu_make_cmd_atc_inv(sid, ssid, 0, ATC_INV_SIZE_ALL);
 }
 
+static inline struct arm_smmu_cmd arm_smmu_make_cmd_sync(unsigned int cs,
+							 u64 msiaddr)
+{
+	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_CMD_SYNC);
+
+	cmd.data[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, cs) |
+		       FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH) |
+		       FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
+	cmd.data[1] |= msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
+	return cmd;
+}
+
 /* Event queue */
 #define EVTQ_ENT_SZ_SHIFT		5
 #define EVTQ_ENT_DWORDS			((1 << EVTQ_ENT_SZ_SHIFT) >> 3)
@@ -648,10 +660,6 @@ struct arm_smmu_cmdq_ent {
 			u8			tg;
 			u64			addr;
 		} tlbi;
-
-		struct {
-			u64			msiaddr;
-		} sync;
 	};
 };
 
-- 
2.43.0


