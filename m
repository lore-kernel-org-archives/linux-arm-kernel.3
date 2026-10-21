Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64642606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 22:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UEORqg2t;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sNlS3990
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBu4ItKJRdLhP8EHHQKo4CfxK9EKZa1Hm3KHTYQMOGg=; b=UEORqg2txIXYmEy13nkKOdu3tO
	0G5ZWnaUJWj39UxYXzON8xR3PEJWRwV+26Q94PG+COjt/4gSJ2jrbc84forDZd0dvgwBy7Dle/XRE
	dwCoWMBjtBJwFeLEh3fjATx9RSRyA8e3Wlw+hxlTUvw9fbDYlau1I1F/54ckM4d4tBGyk/qi/1VI9
	eppgwWa7F5Lg7dSfILONYw3bcRhHsZ/iVNBvu0Jt3+yhV7Ea/5wFg5EMkFCFnJj53wfUCya6kFoka
	AhQTkFSht4XDN1hPUyAnjxPgTZi5TlMyUAMBENcovp+dKjo15vhnvQGFbSMy4jHmXzYiC81+YFUCm
	Fwa1a44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJf4X-0000000CzmP-2ODc;
	Wed, 21 Oct 2026 22:46:13 +0000
Received: from mail-westus2azon11010049.outbound.protection.outlook.com ([52.101.46.49] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJf4V-0000000Czla-0HdD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 22:46:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzXWBJ+oc19R3uoWQp+LPeRVayKDXNOCtpVzRpxnAjnii36Akk83VRCbEeRqWAT4cv625zDERIeg8kKwrVQjGSJIMBETzetJFwsfxYkjcWOjfvx4O+hUOxUY49qTdyZnypm85v1fcFyZDkmQu97u8swNw80PsahWY3XIqN4fz8LeEk02ILgfp7Y/3UlU2tEGa4SJiCjPbD6sZFH3Fdd0M54i5NsOYvvjs8oRq+nUsd0q0lE7zw51jDTPHeGSLSLhnJS2rW31vkgkf8aFctUBnKaQBs1RznvkPKAM8ZmsfDTufsty6E0THVVBMTEMhw01GOBi9jSmo5wN69B41yLG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBu4ItKJRdLhP8EHHQKo4CfxK9EKZa1Hm3KHTYQMOGg=;
 b=gh838yObf4PvZq9amrHuBwrE21FfpuG41BWk3jUVpZl1KX644sXrCU1FT0w3B1zAHeO7HBmjJyB9z3qsmfJEQBCSUdAgIGl7/MxKsApbOfdwL+ct8/CL7hCQrVI8NHyLj7GnLHexc7pWlWahBvMH6APAiGuEyf1zOJUX0HWZ6KTMi3duazzQn27npA71A4YwH5Br8z6yq87v1xn3N1y56xKZpFCIW8c8bubGLNveAX2KUDrbxVSvaY0eS3WWqQ3BMIO5jPAfAyW/McCp1ydyMCjux5eFyB3+oj94p9fdRnDExH7H0HJ/CFCjrqeqBwlsvOBhygRbt3YUPbwfWHPPNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBu4ItKJRdLhP8EHHQKo4CfxK9EKZa1Hm3KHTYQMOGg=;
 b=sNlS3990YFdLL5tTOdvS4Kfowq8XXIm6eSNG/c/8HOY/UT6gYpm5VvD+ekRwoLYqZXw4trE1sWMiEXhVoUcSnT9fAtGPaCYM72j+yzf56hrvR1jM0pEg055uNIaA47Tb9oy8l2dE+3mz5LiOzillk2nkabZQ1Myzm91aPWm65jMlS+DcgrfNHJwQIc38Sa2SuJSYgDOW91CyzVdzHzCTQTDvRdNrnd08bh0L1jzUJpVTjQXstqIOrS8QAJLJPKLRvWO3dMLfoZqPW+uBPfuqmhIlmP8I1tuN2d4UijNXExgX8ygCIGF1n6x4EcTUpotxA5/wwy1JZNDPbPe7vbYBYw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5) by BN7PPF39B20C1D8.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 22:46:04 +0000
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522]) by LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 22:46:04 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	conor@kernel.org,
	jic23@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	andre.przywara@arm.com,
	aneesh.kumar@kernel.org,
	Souvik.Chakravarty@arm.com,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	bence.csokas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [PATCH v5 1/2] arm64: smccc: add cache clean/invalidate IDs and return codes
Date: Wed, 21 Oct 2026 22:45:56 +0000
Message-ID: <20261021224557.1827361-2-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021224557.1827361-1-smadhavan@nvidia.com>
References: <20261021224557.1827361-1-smadhavan@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::22) To LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB727857:EE_|BN7PPF39B20C1D8:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f459f13-5b01-4e21-fa0e-08df2fc51658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|261021121427099003|56012099006|261009223027099003|11063799006|18002099003|261021123027099003|6133799003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: Rh9Rf2RGYjOsWhLuZR0LSf01yPY3FqgKm3oaIYvB/jultlXBva2y2ZnOFpZf1nFz7qbcQHe8AL5PlgD7DaAGAa0Q5111hncsxP87rAPzjGTGeO5iFACnXPb/vT2eRavqAB6Hgu4GBrntdEsLP6TbnvEqvnwRmEBFogoRZtuv/Dz28Kpf+beuURE2c2NdZ+AXVjLH/DoZhsiK0w9kDfn6/XiFtc5m/YfXkK06v+Buc/OlAbggQCk9m2jp0NWkAYdrSXoZdLhE8pkyKyEZs/5ow93OPZNAn1/+D2V8SyBV84zGsuw3X0sI3M2D3H6cUna/33pfhcDSQiJVQb5l5OQuYkpos/knwaOPd0MOcsg8kBvIHsOocOzuBp/C2rC0r0K4hCMI5xaSZaV719/+uqcwM0LinaBz5WLfZ61R5k5FqQKqNHEDsea6AA+IUeaRHF3fkj6PVvlgIE3A0S/JMqbEFdCtku15QoBRSNaJWDycb0FwuhJFYVzL2iotsaAPBB2DKL9xrO+t4zfvyJXoSvBY/Lzq/8kfD8olnTqp0r/WRbozIFtvLho7uudXlhfEQhN3ngSY7hHnxqLvYQ4kK9aME9QJAq0sjSTvURYdjEgcALEqFFwKAEqOWbKwCq95reZdij9bRgDu+U6402iO48aPJhtAcbQJgudKiEiLI1AzmhE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB727857.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(261021121427099003)(56012099006)(261009223027099003)(11063799006)(18002099003)(261021123027099003)(6133799003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmtmQWlBdVhtZUpxcDhGYmZhQW41U0tnaDl6bm1vb2Y3d3VvMkVtc1JXOGNp?=
 =?utf-8?B?ZDNpZzNGdGVZQnF0K1FsWmRkYkxoYlpEYmk3ZzdPNXc3UUhxbmRHejNFb1ha?=
 =?utf-8?B?WGJ1OWNJMDMySDR6VFpvWi9mbFZ4OG9Cam1CbmJ1Z2V1aGcwdnUvcUxoMkxB?=
 =?utf-8?B?MVpWVzltMlNjMGJ1dTJRM2pNV083NGROUys4SklhWjJKcE9LM2NMdmhlajdY?=
 =?utf-8?B?UW81V2lGc3ZqT2hkTTI1aGd1VVZpcnY0a0NuNEpDOXc2WVF2T01qdE82KzFx?=
 =?utf-8?B?cUpjQlFoTW1rWSt5ZVRDUXdrL0w2V2VBcGRFS0VXWmFyYkVvZ055TUJYU2xP?=
 =?utf-8?B?UUZzSWQrczZ0WEs2ZGV3ZVc0am5JNXgweDUvVC9COUxubDVTOThTdFE4N1Rn?=
 =?utf-8?B?NFV0NTNhWWNCNlJXdHNUUjA0eS9NMFlyWXdOTFNmbmhVem0zQ2crWjhxcGda?=
 =?utf-8?B?RU1NZ3MrdTFDRmRGd2Y1MXRORnIzMURodE5LTU5HMHh2bUNudTIvTEhuNUcy?=
 =?utf-8?B?YXJkTC9RRURzSnBGb2xBNGpYUUU4N1FTcmtkMS9OZ1RMdTNhbVdWcCtBNTNG?=
 =?utf-8?B?RFVyOXVOSmUyaWJyb1RSMHd6MWtVa3JVWmZnTnBKbVM1VDE2R2t2WDh3Ujl0?=
 =?utf-8?B?eU5NcnVoeVA2Z0tZUGpKT04vOGRzajV5dklxZE5kV1JISmxoQXpmNjIxWXJu?=
 =?utf-8?B?ZkZiV2dvZ1l5OURydW45cVpnMVBTNmpaM2xzWEVsWjN0anYyK1NxK0hxNlRx?=
 =?utf-8?B?V1NoSjNBem1wUGtLYnRSNUVpOTd3UExyVE91SWJ6SW1ab1ZZdk9rSXB3bU9h?=
 =?utf-8?B?YUtObmE5ZlRNcEFtWGJUU1JVdlJ6c3Y4aFRCRUZYNDJQdjVrOTFWQVlNaUsr?=
 =?utf-8?B?STFrSUlVVTZ0SmtlTUFSRnZrMFc0b0pWYS9MZytQU2hMM3V2dTFrVHdocDh0?=
 =?utf-8?B?VVo3WVFUZnFEajRtK201eVloMWltclZOdnlRMHFoQWIraUVKS3VYWWtMUVRK?=
 =?utf-8?B?U0ppWFlTQW5PR1hNVEhHMDJNaGtCSk02bjUwVUI2emt3TjdSOTB2Z0NCWVpm?=
 =?utf-8?B?Tkk0bW1wTHk5L1dMNk5BV1NGemlmWGhxSE8wbmU1ZHJITmsvUjA1QnB4MXE0?=
 =?utf-8?B?MFl3UUE1TDRnTTJzR1FnRHo0ZWNCeFBwYkdsVHBTNENKNEVCa1dJQ3NPU1FG?=
 =?utf-8?B?RmlTSDZ6dkRHR3N0dnc4dEZZSnVFUUxKcDZjR3cyS3lORUtFcVJxQnIwakZQ?=
 =?utf-8?B?bHljei8yakxyYXRzb2p0c1g0WnBkNld1a283R1RrMWk4V1M1eHJOMEREZmo2?=
 =?utf-8?B?dERqZ2tGSGdveHNGZ3BQT2ttNlphNCtITlhMTFJ4bHBsVTVzbWVxMlFXYTNV?=
 =?utf-8?B?VmhsYjU2NExkZHJac3VLYVNZaTRTNitzdWdtU1lleC9vbHZkUC9KKzJERUx1?=
 =?utf-8?B?TWhyV25rNDBWVXJlV2tlQW8xNHNjY3prNXd0cUFsVmlwTFFTNWcwVktaYWJJ?=
 =?utf-8?B?eWtSUUl0eWtmclowYlBYY29zNUQyeWd5ZGdqS1puOWFkRGVDaHZFdUovY2tD?=
 =?utf-8?B?em9CNWlLenBSdlFaTUNPTGl2b1RHSUQwMGxXbFVXcHFiT0VBUGNwVjlpRC9z?=
 =?utf-8?B?YXBmR3ByUFNzNTd0MzV2ZE1nTFc1bnVtSEU0SnZWY1orZ0x0ZnEyYmVUaFVF?=
 =?utf-8?B?NjJjVFdsclRmcTBrRDk4Q0pRQUhWODlHYUJ6R2hmbE1hZFFGVUlMRW9Mb0ZC?=
 =?utf-8?B?Q3BkaXg1K3hIVkdseXVCVHFIc1lvNU9wdlpNNHhFRTdzMTd5b2ZTb2lkcWVo?=
 =?utf-8?B?VGVXckhXWFJyc3JCOUNtS0ZOemdySTFtMmhydmE3dkZacGc1RGdZWEVGUmxU?=
 =?utf-8?B?cU1Pc0tvamRZdFpYQzk4VENaZ1lwaGdMa0piZDBDdVQ0dmc1N0prR1g5Wld1?=
 =?utf-8?B?WFZhY3RtV0U2S1kzUGgzZ3J6b3RBenYzdkJLQ0xjUlA3blA2ZmJDaW9kNTZV?=
 =?utf-8?B?MXhJNC9qeU13OHZyUHJha3VYb01FVEZjakFTMHJtOVN0bnQ2ei8yaE5Gck5T?=
 =?utf-8?B?bHNpZW9TTWxEd3FJcXhMYlp1ZDVoUFBzcUt3bHRGTklla0Z1QnFMMUovSHVo?=
 =?utf-8?B?bFMwYjFzcDhodUk0d0NvZmtVQThzYklvMUlnZytrNjdvWmRDTXZ2dmw4WUVT?=
 =?utf-8?B?eUpwMFpHSFFtS0lScTM4VXRMT2N6eVd6WllqbkI4YmhrL3UyZjVKam52QUlt?=
 =?utf-8?B?VkxTWERvbW9aYXhyNlF2WUtiWm4wOEh4TkJqUFp5M1lQMGs1c0YrQkU5ZFVE?=
 =?utf-8?B?azNVRS9GQXJ6T3NiSUtDM3Z4OGJKTWxTM1Q2dUZVblBnT1Y5Wm12UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f459f13-5b01-4e21-fa0e-08df2fc51658
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB727857.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 22:46:04.0442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxASGnwWzMmSJxaES/i7PKsalFfJXYRVwx7OPGCGPjwJGP2VszTrRaFB/sODo4c1UblbtjHDdzEAKyeGI9QqbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF39B20C1D8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_154611_121195_06091566 
X-CRM114-Status: GOOD (  10.40  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Define SMCCC Arch function IDs for CLEAN_INV_MEMREGION and its ATTRIBUTES
call, and add RATE_LIMITED/BUSY return codes from DEN0028 for callers that
need transient error handling.

Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Reviewed-by: Bence Csókás <bence.csokas@arm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 include/linux/arm-smccc.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2e..2e205320d88a 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -116,6 +116,22 @@
 			   ARM_SMCCC_SMC_32,				\
 			   ARM_SMCCC_OWNER_CPU, 0x10)
 
+/*
+ * DEN0028 v1.7 defines these cache maintenance functions as SMC64
+ * because they carry 64-bit memory range arguments.
+ */
+#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION				\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_ARCH,			\
+			   0x5)
+
+#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_ARCH,			\
+			   0x6)
+
 #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
 			   ARM_SMCCC_SMC_32,				\
@@ -305,13 +321,14 @@
 			   0x53)
 
 /*
- * Return codes defined in ARM DEN 0070A
- * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
+ * Return codes defined by Arm SMCCC (DEN0028 v1.7).
  */
 #define SMCCC_RET_SUCCESS			0
 #define SMCCC_RET_NOT_SUPPORTED			-1
 #define SMCCC_RET_NOT_REQUIRED			-2
 #define SMCCC_RET_INVALID_PARAMETER		-3
+#define SMCCC_RET_RATE_LIMITED			-4
+#define SMCCC_RET_BUSY				-5
 
 #ifndef __ASSEMBLY__
 
-- 
2.43.0


