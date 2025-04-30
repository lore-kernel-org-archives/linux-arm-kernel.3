Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065D4C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQKujtkdZylL6trpnmxecIheT4dPO86t6oMqcG3RmN8=; b=DrCBohRv/tkrBOgIAMkwfmNfYf
	vtebypozm9MsBQaQz6VII9lE3c5lb/MKNNcXiHnzMd019NIx7BKwKydtFVGN8mzbEGOTNF6PYEx+D
	H9FBxqN0oF7PByurhbHcGkPvYF1GAy8XJzWf6y8UC334KriJUnPiIBP6Hjyr28NAppe8BE+53dYLl
	3NnmP7vQGoJPP2fT/gt8HqSgKZEq5ALTGas1pHPXWfnb+FuDZmbB2E35dQUWcMI5BGW5his9Vyx1v
	4ncavDcAnv7aLncP83CPJlRNhmYomK0m7lLe7LObwmE0hQPvQ2NFCLwnDtprfOOtEsGjSY9THSgY5
	yXqK9tug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2sb-0000000CAPn-3XGL;
	Wed, 30 Apr 2025 08:33:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2Lg-0000000C4Vk-09PX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 07:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gQKujtkdZylL6trpnmxecIheT4dPO86t6oMqcG3RmN8=; b=VN9FBYdSQxQ7FlSpLewU2iMzBj
	jJPNS2iBRXE7UMeZvSVv3xUP8W+AT+drSWh/eEOFMYG99HslDXSF6IEzOEqeioJy16ctm/zUfMsaX
	0QYi9MYuqvOb1NecNZ1exrKGnABCwDuBD6fTvlENa+VIu4xqgRAxPmaxLLksS2GKLLG9X0C1tN0AT
	FCDV6gtEQ5ovGNdiUCm9w9NhNYn4sREVSjTvekWJLoCudRPfej7o1XE+sT8LibsdGqoCBfADzFSSP
	7Yr7oJHyqvg4bMJKqHt7OxAKOqpMGkHwDxFP1dAyu8EL+kv92/2q475SMXddLJAcAx9iUjYujmeen
	ZDsaDNzw==;
Received: from mail-bn8nam12on20618.outbound.protection.outlook.com ([2a01:111:f403:2418::618] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA2Lc-0000000DjAR-1pfU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:59:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPxI9y2+PN+PWcdUmj/WrZNZDiSCYycci3ool92mEmwlTlnz9/EcwGP7bPcLtXANJqshtwQj/hH42Pu54VKz//qI8XO9P11VsnpvQ3bcBopk14BEE3FLNAdIYIH7cLZ4UFFCsILRI7wVmyygbe9SUbqblCGYnlo2S4jLXscpLFvSIQ0D8E5a7ud4YuqeXtmdETeDFZBRK+i6VhSb+TsZAxjTQtk54ad9KRbUklv3eqM5zzUSmiobLB+GPbIVPDE9R7nPNmmZCjJrnLVr8l3wXmaXo6M1WtJ7cV9R6wi2jDPEVApovtJT726wQuW0DgLvils2/GEpCGpurdWjlwVzoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQKujtkdZylL6trpnmxecIheT4dPO86t6oMqcG3RmN8=;
 b=VyA4A+KDHXeT7nojcrysprndF5g8gK/+THNA06KZ6dgVJwnthpZxGzSZHiFRURKTz9ozzx3FFZum7mc4/9fQAEbGPXw46WYLbEkG0+yti66foz1ElU7ACdL8SB+G8vqSTFvdvi0ONaYoLe+AuqUSz7mnDiXolIsDmbmp7CLowygkZybnL3PftCFgH2Wit864Oa6Zt5DbqsQfwDLQC76l9+6t/bVZfyaNs2QARlQfmzSyb5TnN+RYyqq54PDsfUlmPHznXhDEqyAfV0cnwf3ENvJtV+vSgAE87D+Q9HAlGsj/QHFqVRnTmO5hh5YEJtMaSAV4vhCZCOsyKJSC6uriQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQKujtkdZylL6trpnmxecIheT4dPO86t6oMqcG3RmN8=;
 b=b9M5/d/QNMvUI2EU2HCC+22WX8Zv07BwRpovXhh9jDgsaYm1EPzF0oca67E9+5+Wy1FvcVkAFaDgR4DZRISk+TdtKgmS2QQLchQbq+BjguncA46+7I5x/vWP+/khdCr0jc+sNm7Jh0ffRZGDY3toJU1tjFdhnPJKHgFZSfnjtiBpjTtborRONBJu50nnGZLQ8WnVRPuvhkEv6+S21emkAeX7QBxiceBgDV0zwNpsmx3IX2RkPp5JhB0QCcqJEfwwXWt2mRMI4A19V2gY+t10YMP31AM1WX6sLQ8Dz07qUmrBQqkoC8R4/dOYz6z/EpiP1gTtv9wMyd7PUjoN9IpC+Q==
Received: from PH3PEPF000040AC.namprd05.prod.outlook.com (2603:10b6:518:1::5b)
 by PH7PR12MB9102.namprd12.prod.outlook.com (2603:10b6:510:2f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 07:59:07 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2a01:111:f403:c801::5) by PH3PEPF000040AC.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Wed,
 30 Apr 2025 07:59:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 07:59:06 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 30 Apr
 2025 00:58:51 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 00:58:50 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Wed, 30 Apr 2025 00:58:49 -0700
Date: Wed, 30 Apr 2025 00:58:47 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Alexey Kardashevskiy <aik@amd.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, <kevin.tian@intel.com>,
	<will@kernel.org>, <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<eric.auger@redhat.com>, <jean-philippe@linaro.org>, <mdf@kernel.org>,
	<mshavit@google.com>, <shameerali.kolothum.thodi@huawei.com>,
	<smostafa@google.com>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v2 06/19] iommufd/viommu: Add
 IOMMU_VIOMMU_SET/UNSET_VDEV_ID ioctl
Message-ID: <aBHYN39FcH+NG5Ab@Asurada-Nvidia>
References: <cover.1724776335.git.nicolinc@nvidia.com>
 <6348cc7a72ce9f2ac0e9caf9737e70177a01eb74.1724776335.git.nicolinc@nvidia.com>
 <35701c5e-030a-4f52-b6f6-ed18368fb2cd@amd.com>
 <20241004114147.GF1365916@nvidia.com>
 <95ab62fa-bb1c-4e4a-a210-b0bdba0d4ad2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <95ab62fa-bb1c-4e4a-a210-b0bdba0d4ad2@amd.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|PH7PR12MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: 8563886d-54c0-46d2-30ff-08dd87bce1d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o/E8uGl4ZNFothA62QZTkeoxQ6YqIwHHQhkYvfLN+qTWIXjW8i1Iwf6tjN9C?=
 =?us-ascii?Q?179Ni7rP+X237J3fLF9CnV/7VxYncpw3FvX2mguNAHrzUaCqeBH5zT6At/XD?=
 =?us-ascii?Q?tFfCWY/AJ8mYaSIgRp1070c7/8Gs5U5+E/rxTY3YLjfi3EQR53IKyp27qiGY?=
 =?us-ascii?Q?KyfJ4fFM2jwjElapFmtHD0zh37QZaCzHj622Ywt3YKZhbfHx/DOiALl7Ni/q?=
 =?us-ascii?Q?nV7G785dh6x/rmrLK/mbxM5exYOjl/YQjZnBbwXqGsujbvuBQaV6xFz4r70q?=
 =?us-ascii?Q?8eoU87TfcqwHt+xcNvQWyiz6HEtIZ4ysSOuGnFNLEDXC+sD4Y8plGGtRjfNa?=
 =?us-ascii?Q?/6NlI2BdYoPAGLPI6RVimz/AukMpEUVrWBnPJfPo+tFFA6vjvuKAbe68ybPb?=
 =?us-ascii?Q?12EDwIvLIQ38HjeEeC71eU4KKKj6hWN/OM3qQWYoQ+VSvWp6lBDvmfkE1ggx?=
 =?us-ascii?Q?FYj858txHyDuikxeR99aSZXC83wM6hGv189Z0y0AQVLD1Yxm9bRVmAfHrhC2?=
 =?us-ascii?Q?QgOk2hjoNgG0btzIllF4M/5fzJyCGL8zN0uavL9wiUYMBNL8/+I0xrxxoI9e?=
 =?us-ascii?Q?/Kcr3+LLOs9PbeXlqX6OTjiZWn6S61ZJoaNDvfGS0ahjHbSvQsAwk4Jqqit8?=
 =?us-ascii?Q?Gt7ttPXucx3xjGBJ4Z53FB4ZA3PeaL84OlC5fJrCyC58W93qBkjXOk4cD268?=
 =?us-ascii?Q?DhGNCc+lfgZogqbu5uBNYLG7dxB2TDAEM9LJcDr2REmrg6zg56P/GTdvgfE7?=
 =?us-ascii?Q?5W0UrJHlrLzamvxr8RO5L7mJLuUI+koChaFl9vpACDfENdSCcVsUTGCO6Av6?=
 =?us-ascii?Q?wMQN6ZxItSSauIVZW4Hv7btXYKC8hdV42WqixvI25dqVWzBkoMfS/IXTMHUA?=
 =?us-ascii?Q?GIVkxs/kxvVsLGX8JsS7aPGWbQXXdDlvlQO7rfQeLY2VcU+kR7hoESmBYS/r?=
 =?us-ascii?Q?SsTLkGq85NUcV2f6FxQuOpjAxduFS7w+sFT1DLJAk2F2csdiYg/q96BOZWxP?=
 =?us-ascii?Q?G0PCGMlYTehpBELFq3EWNkXC1YWaaRkx/PrswL/deBxC2BM/atTHRGOopE8i?=
 =?us-ascii?Q?PFirJ4cf26/hKfmdwTRONWVDJErQuI6xn5p65HcttA+Ld5NeIts66AHf/cia?=
 =?us-ascii?Q?K6R6uqYztV95iCbKNPoAJxn8XSA+PF2kdOXTxNnlE1m0wxYxyepjGcV7hDSI?=
 =?us-ascii?Q?x+uk7jd0s2xRXQb9znzvfMZfxM+eg671Qv+57C9d4MVXr+FHLtxWMy9PL/s6?=
 =?us-ascii?Q?RUzkhbt7H6TrBudALrojI96VmSJeg1yM5tE9VWIQSBwUwWnlpJ5Bya3b5H6v?=
 =?us-ascii?Q?+BVObBrrlxbcDY8ZaZ4LS6Ccs9K/U9mUuWrnHcemvhkXEFwbFH8f3BewmNLD?=
 =?us-ascii?Q?uiEdpd9CXeeSuOO97TDzgvRXCo8C3Nmj1FUhevs5v6SgaQ84RjDjJwz7nQ9G?=
 =?us-ascii?Q?0+ZDA/UhdiO+24Gff99msH8A9z7tQ2anLjNhoLCfAjaCJiHrqfmWmRegtDpl?=
 =?us-ascii?Q?4/8nc2EynwKNwW/kF/AuK1nb04GvcyLumabh?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 07:59:06.7762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8563886d-54c0-46d2-30ff-08dd87bce1d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_085916_674709_DAAF6348 
X-CRM114-Status: GOOD (  18.92  )
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

On Wed, Apr 30, 2025 at 05:54:53PM +1000, Alexey Kardashevskiy wrote:
> On 4/10/24 21:41, Jason Gunthorpe wrote:
> > On Fri, Oct 04, 2024 at 02:32:28PM +1000, Alexey Kardashevskiy wrote:
> > 
> > > > +	__u32 __reserved;
> > > > +	__aligned_u64 vdev_id;
> 
> I believe this ended up being "virt_id"...

Yes.

> > > 
> > > What is the nature of this id?
> > 
> > It should be the vIOMMU's HW representation for the virtual device.
> > 
> > On ARM it is the stream id, the index into the Stream Table
> > 
> > On AMD it would be the "DeviceID" the index in the Device Table
> 
> 
> ... and I just hit a problem with it - this is basically guest BDFn
> and it works as long as I'm hotplugging the TEE-IO VF into an SNP VM
> but does not when I pass through via the QEMU cmdline - bus numbers
> are not assigned yet. So I have to postpone the vdevice allocation
> till run time, did I miss something here? Thanks,

I have a similar case with QEMU ARM64's VM: so vDEVICE on ARM is
allocated at runtime as well because the BDF number isn't ready
at the boot time.

Nicolin

