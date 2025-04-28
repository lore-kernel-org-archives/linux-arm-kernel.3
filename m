Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDEFC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 19:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tWACRV41wVnve2FZvUmFcDo6E/puNFtzF3f1VthyD8=; b=j327Ag62lQYnXhMAjHl4cP6quT
	xrAY2VOcCrgYdCI/AaBmNocyWNwdHGxuoUcGdO5QGvRMvjCAIE17AOwscSa2WLz5Ap08tUcEHSoKe
	08uRPYMIFcsiUBorirrhETtoLwzNmT8T139YdIxEqcpt5zhOs3i5fYckAd9M4ehpUqDhlYIekTmaf
	VLOzKu66aDD6dY/Y78WHVfDW808FaWg7fN+upaXx9XdjmC8d6aUZ4b4AtgV7wQE7BhGCIEo4TNizD
	RU4Khju7vL6uWP7Uymj8G/3TcXanqiva+g+bpYuyWmY9jyz3bDPXSmCAqKCcJ+Umrpg/FP4g/iTGg
	BK5HFHwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Tj0-00000007HnQ-0tvu;
	Mon, 28 Apr 2025 19:01:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Th0-00000007HQi-2rkX
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 18:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0tWACRV41wVnve2FZvUmFcDo6E/puNFtzF3f1VthyD8=; b=LTZ3kGoJzWFcYxxVQ2xU53Icgr
	sz+J99fpDRwMyljoVpFIgWEudpQSW7E1OLqjycJPBbfIHmT8DoR2gspwUfMgpF/DwXj7EFU/n3CBG
	Fgp6/Hyw8CAVMQd0w4h3tXwjIcgCNREB+z/3euNn9JH/Tu+/jxKGikKvD+129VTayCWXSANHGQ6CI
	kG0NYFXN7Qq/d+y6mQEmnHu5nykhFGBkUeHDTijGbbLqSt4X7QKVNobqP5rqUXpIcT/HO1YKbxhM4
	JCuynpE/dZQ1p3Wh/r7LJKlmmqVIcuIkJOI9eJwPYcJaGmQR535otzTnWYmsCAoN3KJg7gjgytgW+
	NJvfDu+Q==;
Received: from mail-co1nam11on20627.outbound.protection.outlook.com ([2a01:111:f403:2416::627] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Tgx-0000000CzAd-00f9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 18:59:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4+C35GFg2a2VngNKS8duTOUoi6JP7KDh8Nm1VX0j6Wv0OKJk1cMIaiee20YZI25nnQTzBlrpjRfaHv/Qd2M6bZ7Ip17TRv3HzXaH+o1gOf6SzUl7nYdjZbOTLdIvvWssPxk2/ZMShXt1gjWn4X01fwtCb8ajGTwJNa6STT552H57l6T+5+G2yDAlwYAbBi/HvqMg9rDJje1Pvsg5shv4v6QFqDmfCsesfkhiGmEem5yaWGZWJbyUF4KysH5vFuYa/vQXhK7Li0YOHB3EeLbZfIgPskVyT4jbLONpKwvpm2i0HTXwXjU0zeMEhCdN+AoLw3dvWTX6j3aBjXi7Nwv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tWACRV41wVnve2FZvUmFcDo6E/puNFtzF3f1VthyD8=;
 b=wPVxPDUppiPzc+5UfVK04HfLKyOdjhox+1IQq8uavHK3HSLnPqysbBMdW5CE9AjQoO/gWkVZzjlF466QugXaR0Tgj6Sowuf3hNdSSUwMrp6NZCJAhXFLXRHHyNiTESiglIdMc7lnhso/0WUOjgBhScGY4SPdQfX/hpx7pgMPBoHQ0QVssOTmukzIE9yNkrz7gaMqOKKU6Nst97P0Xuy9I8H4pErKaouuttltv6Muw1Yx8mBOYVRTfjS6czDskwac+5emfkV9Uu3HYWXhiIICrqN65l0AwrWgoBQTHnmFAht19/V1HLjqyqiWnhy+KAWrrfYPnhMbllYMrTIAImZ+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tWACRV41wVnve2FZvUmFcDo6E/puNFtzF3f1VthyD8=;
 b=gOdIjK2DZ016MFCNfGefR+wXehFhnqrsvTN7xj+ynY7hCOZrNk/U+HzoSV/6ZWGSxG2CU+K7gVV/wcFyzcm4VEVOppGRdpezed9fKXCio7V7/uIAkUVnsFQwzDs1kmicfwciJYQ8D5SdfpKnfTekt36wNiN8gKmNpKSIh2DPJ4NCAc4bmllV+8z28RQMWK2fJP7RZOXDHjkjX5IPrmK3t+WTlwsiFPp4SQbCkIf1TFw2LxbzO3IcE4N6ZVPlUunEKJxdqg8LecWdImrBMmvfAm2AFJCu0DWM2GIrKu2tc302bqKioCdFG/U9igmHxF5KbXZT9AElbrpemQOuJoBPeA==
Received: from SJ2PR07CA0012.namprd07.prod.outlook.com (2603:10b6:a03:505::13)
 by PH0PR12MB7863.namprd12.prod.outlook.com (2603:10b6:510:28b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 18:58:51 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::75) by SJ2PR07CA0012.outlook.office365.com
 (2603:10b6:a03:505::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Mon,
 28 Apr 2025 18:58:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 18:58:50 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 11:58:32 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Apr
 2025 11:58:32 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 28 Apr 2025 11:58:29 -0700
Date: Mon, 28 Apr 2025 11:58:27 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
CC: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>, <bagasdotme@gmail.com>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <thierry.reding@gmail.com>, <vdumpa@nvidia.com>,
	<jonathanh@nvidia.com>, <shuah@kernel.org>, <jsnitsel@redhat.com>,
	<nathan@kernel.org>, <peterz@infradead.org>, <yi.l.liu@intel.com>,
	<mshavit@google.com>, <praan@google.com>, <zhangzekun11@huawei.com>,
	<iommu@lists.linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<patches@lists.linux.dev>, <mochs@nvidia.com>, <alok.a.tiwari@oracle.com>,
	<vasant.hegde@amd.com>
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aA/P02wgX27/EjBS@Asurada-Nvidia>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <dcfd9bfc-44db-4fd8-a49c-0c96c68f6b88@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dcfd9bfc-44db-4fd8-a49c-0c96c68f6b88@linux.intel.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|PH0PR12MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: eb0883be-9871-4256-9fab-08dd8686b691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uVGanoWR5SHipaoNY2YVkpbjnP7em7L+mNEJMZv5gUI3UGv7/+FCZ+uUizs1?=
 =?us-ascii?Q?xPKA9oITd+mlYfHfWwGiHrBoiMwmLdFNYiDbjdO28bfDB66m9H4bJJTke1gH?=
 =?us-ascii?Q?OOQnXKo0jBuvdOLr2FBwuzn6Kkks5Ehpyk+uQLANVj5srlOykvIOQrHftBD2?=
 =?us-ascii?Q?KZ4+Y+bvgxlqxWjmevvXaaBfuHd/AoRk5YvSKnACpX5MLZaZXAmrWaEfpbWB?=
 =?us-ascii?Q?W0nORFAwVCr6mtygdQ+7GCQg1Egjl0e32jm4KCl8gV5G6WSosMZmMW8rKzqo?=
 =?us-ascii?Q?r0fYOO6J06rRv1aM3UOhUmpKWoIObtFmEUdP5ObEu6/Qu3vpDhDzDCPjHBvV?=
 =?us-ascii?Q?M17A9b1o35/2hDkIRkOaHyaMVfH9rToY7BdgOZK9yng/Ut8696JiY2X5P+DU?=
 =?us-ascii?Q?+aVgSXAKvZZ+shbl/1Mb3YGtwY+HhyToFM7R7cTQmTFsu6ki5/R9M1ztV1gY?=
 =?us-ascii?Q?h2AWr4d7sLkXmfEXqshStUiC4Zv8feHrGhij3kVybA6keZYBrvJsjlrAUcrN?=
 =?us-ascii?Q?JPjZwD9bzvedzTnC/DIw1Aw6dMwhYBVt+6wzBV1yk7/P9bn3gHZAuh0kxkR5?=
 =?us-ascii?Q?pSRfaocVpbpqEl9LUrnvZN/NDNk+qZ/YKhBo7iAx900Y7e82p8Bju3aBt4Zq?=
 =?us-ascii?Q?AxmH5IdiRsWlsZ+7mJT9Woj49cq4mYdJCJwjs2VARMTgk8CUPKn+zde1o2Aa?=
 =?us-ascii?Q?/e+gaZTryySispcbRHaFRSDnd1lMtRhlNZYIxc1pyWWq++RHbBw7h0/xMx+m?=
 =?us-ascii?Q?hyDyE8Koxoiknz3AaI3c8xo8PGiXhrSriqxAw0gVLSjj0gI1m8+Hmve6dtLf?=
 =?us-ascii?Q?GxRIVZ08Q9skwbkqNmGHTSnryePMV3hM2AiDDI3+GaB0uTFfWSIMs361I3Fs?=
 =?us-ascii?Q?pK7n6mA58NOWAyFmRVzq28b9fBOivfEMGDqapFbWWCzLVsivR0Bb8qTLZ3Ri?=
 =?us-ascii?Q?o2DLJpMBSDSOe826d8hwDrvfjb2v04CvL1a+c7HZpNXPD5QpKYH491RgF3s6?=
 =?us-ascii?Q?aAstI2k9Qn0CBMm3Cu2o/yOcIxsoWlDFjty6SaggeiWV1ovUkfG8VG1FnCJK?=
 =?us-ascii?Q?qZ9vmEttSZoMveAGPkTCfvicXoDZ/qHmv+Ua7h81xxXuvK265tjosVkeFyC/?=
 =?us-ascii?Q?pO/8dg1O9uEIRnKXy539XOlMaoPaEYxxroxXPHk2g81iPzxl6gSopww+88/Q?=
 =?us-ascii?Q?/L9/WRn3Ii+KGJKrE2eE4HVPq3PwF0ClfQ/VlGW6EqR8STHB2Qg2MTmpMXnO?=
 =?us-ascii?Q?gbj0vHds6n+fwjbxkMsovk5JKcA8fv1SNfALqB+Ltvik3bkZsf5pyvxtMpAn?=
 =?us-ascii?Q?CyPmhXQ1XLPATahm6RQ2SQbWlDsiso5Nf0blVAC0aeVMfSwwiEOcC5iyjjou?=
 =?us-ascii?Q?TsOKhmXJnj+YWy3QaeK8N2cElWj4G2MhqwA97Rxz70lDyxmk6VGPZCimORkX?=
 =?us-ascii?Q?ivptJDQpfwIAQMJ911563HcvOmYD7xhriEitP3zMA/S7zJmkWlkRsUw3G8H3?=
 =?us-ascii?Q?IwU0CoznDGVG4fKm7Ft4l5266cm7Wud7cMMY?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:58:50.2234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0883be-9871-4256-9fab-08dd8686b691
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_195859_120853_820F602F 
X-CRM114-Status: GOOD (  11.43  )
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

On Mon, Apr 28, 2025 at 09:32:04AM +0800, Baolu Lu wrote:
> On 4/26/25 13:58, Nicolin Chen wrote:
> > +int iommufd_vcmdq_alloc_ioctl(struct iommufd_ucmd *ucmd)
> > +{
> > +	struct iommu_vcmdq_alloc *cmd = ucmd->cmd;
> > +	struct iommufd_viommu *viommu;
> > +	struct iommufd_vcmdq *vcmdq;
> > +	struct page **pages;
> > +	int max_npages, i;
> > +	dma_addr_t end;
> > +	int rc;
> > +
> > +	if (cmd->flags || cmd->type == IOMMU_VCMDQ_TYPE_DEFAULT)
> 
> I don't follow the check of 'cmd->type == IOMMU_VCMDQ_TYPE_DEFAULT'
> here. My understanding is that it states that "other values of type are
> not supported". If so, shouldn't it be,
> 
> 	if (cmd->flags || cmd->type != IOMMU_VCMDQ_TYPE_DEFAULT)
> 
> ?

No. Only other (new) types will be supported. We have this:
"* @IOMMU_VCMDQ_TYPE_DEFAULT: Reserved for future use"
which means driver should define a new type.

We have the same DEFAULT type in vIOMMU/vEVENTQ allocators by
the way.

Thanks
Nicolin

