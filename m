Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F309BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX9kPUP8/yZb2YGv61Znrbu5egff02qnf5J0x3nDwdQ=; b=eKN5b4Jf3wSi5I0gW1GGSGKsGk
	FAm4jOaCqNECF/uvYYHvfKglYTlMBo6ZftzGoea8sEBm893LNRGCBUpQP9bHLSienRGMyUZKyRHHn
	u7BSgWsLc1UMmfZXWZl6vSXY7X5izXDytHzGBhYP/bXyHle/nzUPTgEBuQGI7sUXbiKryNw0tZ16v
	ngld1cl9cEVbwE5d4gXASkWHDX+F083QWe9cOXM+S8K/DFCii258GE3tozS5t1nssa46n0xh27JOc
	S66aqZUxXF5xoGtEDW71mEw34pnTZmsEPqjcbw2q5HgM2zVnhICkcJWcCIYwwtDPBPL0o3msbaqFV
	qcnbzdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNE5o-0000000G6uK-0qD9;
	Thu, 05 Jun 2025 17:09:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNE1g-0000000G6JZ-0dQs
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Jun 2025 17:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UX9kPUP8/yZb2YGv61Znrbu5egff02qnf5J0x3nDwdQ=; b=k+mJoGef0o40AcvDKsT4yDpnx/
	p7N/wKB4A08fNmCbOWlN+QReguZmGmBTYNXacFXqxd0m9oljG9nOtVxGXN5KgN9LLOzCQVdvkB6tf
	+OMVHYSoKSiU47BF+C7Pw6lqT0BWOPm7FLXzTHgz2kNT/B7HWzPFBDPQ5gchFSvBZtH7j+7i1aBGX
	VxqzFp9wL2SQHrI2CN1Ns9CddqA9kmnrDtMb4YCa+q4rd1rXDMmVM4HoqM+1QZFD1uHBPDZujzN15
	iwuyNldov4YGxZlndDb66kx6P0YTh6SW5xkUg6GAJRQSQPYLJwZ3BT30KG7d+khQGSEkp1PNWQm9p
	gPNnpAFQ==;
Received: from mail-dm6nam10on2062d.outbound.protection.outlook.com ([2a01:111:f403:2413::62d] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNE1d-00000001BW4-1h2N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 17:05:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKBvmfMSNNTQ8YS3AATzI82+KRY5T9/ncefc3IazdWzoVp6k3nw38cPcYQHog4v1UCUg1YJx0kFMaLn6v66yA0Uh2dsLR9g5mo5h/W+DKgAphPbxLtNydkeaVcPrnCpD2qdz3+du8nMT1hxCrVH/2EmOFH5VDrWi8ZfIHBSRhRFj7LmDCiaNfYEkxDfRlIgoPWpogkVLFhpi/KsJKBnhzshwjLWKPEV1kO2Mf+8Wu2e8W1jkynrubRNNjcFimpsxEeGVkmZX8tbDavPZ/bnz3Zls5CuQNZ5G9+tNT8q4ne31+9npWXhwVf1dU/9ciyOFpbIWbeKYv/t46pgMRz+AGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UX9kPUP8/yZb2YGv61Znrbu5egff02qnf5J0x3nDwdQ=;
 b=HDgGGk/bZn+Uv0HN1wvuGbarGlJHNRW8oSYk0c0lvSF/GO4ComxDqztXdEjyhMFEGrNOeq1rQDjHg9JdxB6cocILMG8xnJ23om11j0qJMCio8b6CNPXtYSqQFQjQ+4ueonADSsfyvydA79+vGnw5VJQiYUuJfnbsDl6BKp81Cc0AQtG2D/fEQrk254ZiNIo9hckN+qGVu0AiAwfxmscfxWhWojiAdOLeu2KxpyaxlpfKlsJOC3fthp9rM0R+J4Hfpt3i9VbUn+WlsH13yJalz9LJreo8jdjF9hAO51FDWlfnNGg9JCpGy5C2FYangayIE/aykVv22/EirOWtBxQGWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UX9kPUP8/yZb2YGv61Znrbu5egff02qnf5J0x3nDwdQ=;
 b=lbLiXaFOg0HhHrXxOdEtVVGzxadJjVLo1kKybjn4agGYUPTa5dsOO0cccm9KmUJZAmmDBWJQUPzsCkk0TH84gOC73vVfhxhLVQyxbEez05z2qVpKdOBvFYOwiMGhWmPj1p+UaShwQY8pNFpWF2mc89IHKSOSknDEpchVpDiR32Xt4hy0AVvw9O3ME1GC7yloSIjuSIsZq4H5w2pTvr0R+Na9Ix8fA7mTlbAUNos2GqZLIzzlC4V1xpG92E6nfBfL95HgQCU7+nIz/u95NTNcst9GHXQ0QWjfUidTHsxIK/7cOyOCOExnhbezXK5++0A3qI4HW2nipUrCLY165Fa+PA==
Received: from BN9PR03CA0691.namprd03.prod.outlook.com (2603:10b6:408:ef::6)
 by DM6PR12MB4451.namprd12.prod.outlook.com (2603:10b6:5:2ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Thu, 5 Jun
 2025 17:04:57 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::63) by BN9PR03CA0691.outlook.office365.com
 (2603:10b6:408:ef::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 5 Jun 2025 17:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 17:04:57 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 5 Jun 2025
 10:04:39 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 5 Jun
 2025 10:04:38 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Thu, 5 Jun 2025 10:04:36 -0700
Date: Thu, 5 Jun 2025 10:04:35 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <will@kernel.org>,
	<bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 10/29] iommufd: Abstract iopt_pin_pages and
 iopt_unpin_pages helpers
Message-ID: <aEHOI522eucrOZyI@Asurada-Nvidia>
References: <cover.1747537752.git.nicolinc@nvidia.com>
 <49f7143c1b513049fd8158278a11d9f8b6c837d3.1747537752.git.nicolinc@nvidia.com>
 <20250528171754.GY61950@nvidia.com>
 <aEEY28ZXH+NqiE+T@Asurada-Nvidia>
 <20250605151648.GD19710@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250605151648.GD19710@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|DM6PR12MB4451:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4238b6-a9a1-4952-8136-08dda453197b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?plp2PCo+dNST6/wPQi56NMcqr/eWDv2kDmU2L7b15KFFIO5rsRKDJEJ25KMl?=
 =?us-ascii?Q?hit9VorG1ZDAfsmVwXt8iwyOiZc2uU+/C5ugXbLuGiC4TUjsWv67ubehwEpX?=
 =?us-ascii?Q?RUc1r53NNGk1kRcq00U2asSXZehc9CfUnUURF3qUXCYEex3XrjRH24mWQNmg?=
 =?us-ascii?Q?wpnhTkun/ujHQsSX2nC/mJodkOF0HgVIk18Zh/ivtl4d4vbDBn5cCxPPRkLJ?=
 =?us-ascii?Q?l0OH6bRkQVk52D19gIIFV5KyCVaevt1irrPfpbow5coCpVtKrxNov75P0bO3?=
 =?us-ascii?Q?YhEECuRSEU2ttiRZ6hEO/pc90FdZhbDanwx/YAnUXlpUDkDL4ad0nnMEz3pR?=
 =?us-ascii?Q?rsGOGgm8W9CjBSV30A4nETNwbBUKEgTKhCwtHEOA+/qtMxwspPu0OGxk8WqU?=
 =?us-ascii?Q?jble9k2QwgW5Z0vu1YwtrJLgGn67Mi0OGWV87Fie+JxYDQRuWvMEtbw4ditu?=
 =?us-ascii?Q?Npu7U8H5TTtZr6mVTMKjeyV5js7wocX83+ebCbPipwo2akc0Jyf+Tk+gnV6O?=
 =?us-ascii?Q?ilNKduo+r8OslfshIQ5IaiB3euCswNnyDOcrNsb+sM8gQx4nuKUehJu6gdtR?=
 =?us-ascii?Q?yhXOPovP1GpevBTQiSPggtwaggEyhSp4iZKxyv0bxpbxbLUKhx3AXje+nmSE?=
 =?us-ascii?Q?CdbXq6qzVIsRPx8lPY0mG29cjab6tIgj9zx6utZ0kezv3dINDgt4E1ItYpnh?=
 =?us-ascii?Q?lV56ky3hdnUHuI9cK/FwN6nYV4Q0WKRap2s2BSDrSfHHEvruTO3A04+mmYUv?=
 =?us-ascii?Q?bgBq9RlgclIH2rV/TE2LlK2njOGXOvKj20bUkIEv9ISrfuVK/+gvncX2pHUm?=
 =?us-ascii?Q?J+bJfF8lgAa4RYvu/Qo2sEQNO7G09rlIg9uwKmED37LJFL8L8fS8YV6aEosP?=
 =?us-ascii?Q?0agI8cyKZcSeBzTt8hyv7IlXIAbUxSYrLhFBL3+NM4fCDJXs4t0V2LDZMzUq?=
 =?us-ascii?Q?mWqW3RxR2xI6HTPDsBBJj917wl1CaF3JMmKNpRBDxGLo0wbPsfLbAya7uy0p?=
 =?us-ascii?Q?Hfd1PvBE2tFT5HB+Pu7OpQ21gOrIaiZY4yqN2L7UeuH0c31KOBXap9/ChEwO?=
 =?us-ascii?Q?fIrExcEU4XzHWdqJPNhi0MrGl63iixraxpslvywLsNsjJQJ2Lj1hKZm9NRta?=
 =?us-ascii?Q?J3jNkOdAQVc2kDcNUxRBXikTTr+70GjkEio8a/+NXRGExzgmzuhxL5c0g1Qv?=
 =?us-ascii?Q?w1PYjFFc/g2h7GRLdYrzolW2zPevwTsoYWVqrebTqBZhT5Bw4sx00IhdoGQx?=
 =?us-ascii?Q?21e1dFm5a+3eRuXg2SwkAhmFi9vHvuw6kV2RpHi3vk5juRI/0o37WVbC8sqG?=
 =?us-ascii?Q?ErQj20fSBgiEc5h9aGU9Qg5/sGlOxm1rDVvg+UYwUSUT8K5WGbjfwBj0TW6l?=
 =?us-ascii?Q?nA/ODZ5eZYlltJpO0SbgAew/s2SkoHfK+VBmHAY5evhXYWyBMGdTF6T3AJp1?=
 =?us-ascii?Q?5gSxLSzDjsCSEJYgE3mGdBYpJjtOSx9On31fLLl0Wv689gSndH7q6qwDPwtd?=
 =?us-ascii?Q?VlPVhbwHaIgb1ON4SRgZWwSWv3oaJZ/ahHfo?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 17:04:57.1196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4238b6-a9a1-4952-8136-08dda453197b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4451
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_180509_539614_002678D6 
X-CRM114-Status: GOOD (  12.79  )
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

On Thu, Jun 05, 2025 at 12:16:48PM -0300, Jason Gunthorpe wrote:
> On Wed, Jun 04, 2025 at 09:11:07PM -0700, Nicolin Chen wrote:
> 
> > I found the entire ictx would be locked by iommufd_access_create(),
> > then the release fop couldn't even get invoked to destroy objects.
> 
> Yes, that makes sense..
> 
> It looks to me like you can safely leave ictx as NULL instead of
> adding a flag? That would be nicer than leaving a unrefcounted
> pointer floating around..

Hmm, there are a few iommufd_get_object calls using access->ictx
in iommufd_access_attach() and iommufd_access_destroy().

We could have a set of internal access APIs to leave access->ictx
as NULL, as an internal caller has an ictx to pass in. It's going
to be a larger change though..

Thanks
Nicolin

