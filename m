Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66608E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlPaeUrsOIyQQhR6hI8R+Y6ORE0XrLvw+HhE2MQLWIs=; b=gdT/AmHk66ziehhwCLQQ/VZ3w7
	0SnXeaA4C4z8MUsJzOuJOmurOV3IrrOctywsaFp8530xfsfwJYV8yowXfzNILaYbqJAHHQQNfk4IZ
	ErjYLUalC0n3jTYY2u/krCcVhFjiFBgSGkKmKVr0HTaLLJhkde4I2XOY/vob7XyE4p87Z7fGkquJe
	dVBqLLbCnbEfRltdlXzJ7bwtsdGs71p3AgGx8K36g+/AjDOML8pG75wczRmaMW30iSGtCmXDD99An
	cGp9hv41HSzB/acoiz/xm8r6REZyV/vIXZVZh6taQgz6cw4mJQkey27oN4uOl+xHCM29UWOidU4Dz
	VIc9A/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJvh-0000000Gb1u-3gd9;
	Fri, 10 Jan 2025 18:40:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJuU-0000000GauZ-1oCp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 18:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AlPaeUrsOIyQQhR6hI8R+Y6ORE0XrLvw+HhE2MQLWIs=; b=m8satM65cEO7hrQ9JYb7kScrKU
	Dv363NjTcHfFFTEPvd/o7ecpKqylyOo5KoIQj52/6berQ5zWQZ0Rzv7cH5sxTAYn4xSzaEzxkgmLE
	ujowoCxmuTyh9J2XoRps6eaHp8TGtxHb8HrLM3utF0GJSHXML2VKxyzYKCAzmzkuD9CyNXhI0ieMx
	9YIKJv1hwprgYdsINuBY1SySSJ4FbA8zLehRDzScUAoVmtVixB1SS0PnZq+SyDeAjvMydqCtkCMHx
	oe0gZLwM3krNpyH9uprqSUM9l4lwF3bRcOes7POapmran3xHZ+nsdtkiErIkucfgdZ2cvxxW25EN2
	p1l7wGqg==;
Received: from mail-dm6nam11on20610.outbound.protection.outlook.com ([2a01:111:f403:2415::610] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJuP-00000009s9r-2jfj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 18:39:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKPgamyRaej9JQnOZFe3CBvJh1jRIxJuY3+Of9ZA/WlsGHwWqjFX9vOTbR7Y1C7U+gdidv+TAG9Lnx8XtnvKmlegB1hcA4danHi8mFOZDXSc6tbTYjkj+JdUGnbKtAvVosbCuoxO4WZ5gncyrvQEj0VcqjO4/iv5NxCnhFh2uVhgxVw4PDBA2+fxyv2tp0AK8DVu3ddTxb8d+G11Ns7mJiCYxxs+3rmNdmEYcH6XM1DfdPqHcYERo8SJhQwZeP6xLy8Rnc3mb3wl8+wz5FZ+yRu6s6bTm7N8fGXHKnCEHaba7Da+Igr5CMKrVO32S0bFh+aUABX9TlP2TOO1Jfj9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlPaeUrsOIyQQhR6hI8R+Y6ORE0XrLvw+HhE2MQLWIs=;
 b=hvF5Yh3WsVUNu5sEOg7O2QGQU5Y3vwH2qmTLENgkAvhFUTGJqXIRxs+fRcHUWrUZS0f+GgcIV+eYPI4ITWxH8b4l9YI4wbiHMmwm6yP5SQIN7G0mgN05fzH4IjoMzUOZIWKl5jLNvr6Xiefeu/s7kBYXLYA1e+78QBrla7TTvyZ5SUy6MPfWsvDRUbhKtoPvHgko/fUabMX5bpLDvNKhCW+7Ef4/htz5CKDXjJ1VQ5u6yQVBgEK/nVjzr7LVcLpV1zkyqyk56yC1BFG4H5VrjPmha/OQndcSDYWt/ZrhGy90RGEPbdI/8Tr4RJdpaIFWWKluPkC0a6ij05pGqjVkug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlPaeUrsOIyQQhR6hI8R+Y6ORE0XrLvw+HhE2MQLWIs=;
 b=EMjUZ4X1LSroXXVG+7fh+ASTkTlA4ZFd8mnEiK39kph+cDygPSDh826xRSEA4OmZ9yAtKwQ4rXUgeg0O8vQwteL2D/53ySv+YtmhhfWMT3oV3jQNgoGwht4DQk6HJQKWksp6Cm6S5QyzFudxNX6htxxrY66fMO+E8LH+n/etiSxKjcZBnKQid6ImCnlx0HyGYne4vmRTkqtYlN+ZgF7qbxi/fQOO+4nCmggpLGgX4QH1jhutpjXjFrH9qliX2wW9Gdm6C1D0mOjpvFBeB/l3tXbhCmokwfv5h6G1Kkll44UxmEHwzRzn3fgmgr0yGJ0+8cR+QidaTp7YHNDUeirrhQ==
Received: from MW4P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::11)
 by DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 18:38:50 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::74) by MW4P220CA0006.outlook.office365.com
 (2603:10b6:303:115::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Fri,
 10 Jan 2025 18:38:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 18:38:49 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 10:38:46 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 10:38:46 -0800
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Fri, 10 Jan 2025 10:38:44 -0800
Date: Fri, 10 Jan 2025 10:38:42 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <will@kernel.org>,
	<joro@8bytes.org>, <suravee.suthikulpanit@amd.com>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: Re: [PATCH v5 08/14] iommufd/viommu: Add iommufd_viommu_report_event
 helper
Message-ID: <Z4FpMs4qx3NdwrnZ@Asurada-Nvidia>
References: <cover.1736237481.git.nicolinc@nvidia.com>
 <b9b4f3df990934cb80b2f5e1e49e555e50c1c857.1736237481.git.nicolinc@nvidia.com>
 <20250110174132.GH396083@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250110174132.GH396083@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: b9bf17dd-3fd4-4f96-f598-08dd31a60671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PTg0QetQcSysdb80Wq+OtRA1Y2qYAccNRMMf6kzqXTvHTgZr9N8jcUGFxxSH?=
 =?us-ascii?Q?DW6NbaGzpwDVBXNFSKuWFQX7NG8aNvgCernyHtxyaQ55iT7UXNpMeBsd7QfA?=
 =?us-ascii?Q?vSxXLZx9EYL+tcHahtvmAlQCEarrFHTBERla5tqv/Ayi8pcQqrROK3X2bCmr?=
 =?us-ascii?Q?cfITHsSAxiAk+QZH8zGw4hBSL6AMcejRIQVFSnVpw7O4CX/pyKEDlZrTPjEt?=
 =?us-ascii?Q?hikfsMF3JYmwHVu9qyAZK3Z6K7PYLp4g602X/ArJ1ty2yYNZdKpkJ92rYU3X?=
 =?us-ascii?Q?4KiVEerLfmnpIQO/gbE0JoXMFYcvobfyEn2CCJhynRL1WQcsy844Pjbd0+Fh?=
 =?us-ascii?Q?99pr2WKbMyUSbMzKRa7Ur4zSwjlk6KAQhgtm7CP2mJeFMdQzspcWcDgj4Zpa?=
 =?us-ascii?Q?1v8A19t8R1796XG8LkYpEA1ATqZXe21EHR+CXAoTo1bI2FZL0RXIwJlJ0A+1?=
 =?us-ascii?Q?YeJPJ8Bc3iFUx6eKiVcyWZVo2zUcRcGQpOq70PzhSUA5GiPB9C/iwIb287E3?=
 =?us-ascii?Q?5t4ZEueqJmh8fniC5CbmJ9VPe7BxkJxDS5szu0iTCGrZLv0rmkNqwrX0c2eQ?=
 =?us-ascii?Q?X5bExICjnHZ3mVeif6Oz/pwvuzSfcUH1GcQ+2F7O69ovWsz8m0gCjU6bzq5P?=
 =?us-ascii?Q?VBlwElev+dV3rVABQXN52ogGBy4NU9VFI5hjcg6kjAJTmUrjIfdiKGeX8cuS?=
 =?us-ascii?Q?/vBlVBHtXasEa8xMVIGYKM+J0D+HKr9+LhY6cj+miZnXDPeq8ZzcSvA4hoZ0?=
 =?us-ascii?Q?7ra7qmMldsNybLly+X/1tGpAlA6xAzkkWgXrXLjCa3yINMZ3YGHsPYCRqirN?=
 =?us-ascii?Q?DNAAYgpfBUb+px+3d7+FNdJignNKC1hQ/evJtqycPnPLeJ20iqlnHQIRFSFK?=
 =?us-ascii?Q?GihF+G7OeoC62vwOs236j7VfI409Zv2DHKCQShKoeKj2SiWfiuRs0C1eeKxD?=
 =?us-ascii?Q?ie4KrGzRJ/mgVOcuN9JImrZtreLz1hVUVG+uSqunUlS2UGuGi++aoJ70pu2N?=
 =?us-ascii?Q?ziyoBypUpQNAwmijKtXYrqUkU/Ny1qMzrNyEDxUp3vHelxWcojbqr8INe5/y?=
 =?us-ascii?Q?fAIWQ7Dza4paZmmQ9htAgVnq1WnhI8fnVrZYSthEnEZIkGxvpG5lZ1yBJGmS?=
 =?us-ascii?Q?HkWp/+6UaBcXDchRZkkiysTLlt4JnjmPkdjYVh5DyQAESZupQslDDunNDCDu?=
 =?us-ascii?Q?l2PFCfTocDXx84jJoBOlFymn6tm0grbjEITtIE8lBTqvCsUVefhPmjTeQZYG?=
 =?us-ascii?Q?RYHcVqsbj6CnWkQPWEwTbRNl4OFt2wD7ntE6qU3+tRR4JiY27DqBNKMpjCnF?=
 =?us-ascii?Q?/ZLpE+YcwVcEpCHVp2ZVt4YysPF8hQfBfLIelYNDLYQGzhXaapNA8nJpIZXI?=
 =?us-ascii?Q?iL0vsAkbgAXlRWZFbwWraNVmq/I4lwxCIllYFkOQpAXSw9fDKt6Byvhptzex?=
 =?us-ascii?Q?/+xqgDxAVkCmr49yV/3tTwrxAONxenArruOmfQxg01O80KFD11Pc2w8xSnGf?=
 =?us-ascii?Q?joI4VMSVl8Ny9UE=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 18:38:49.8629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9bf17dd-3fd4-4f96-f598-08dd31a60671
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_183902_029980_0A5A4586 
X-CRM114-Status: GOOD (  25.55  )
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

On Fri, Jan 10, 2025 at 01:41:32PM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 07, 2025 at 09:10:11AM -0800, Nicolin Chen wrote:
> > +/*
> > + * Typically called in driver's threaded IRQ handler.
> > + * The @type and @event_data must be defined in include/uapi/linux/iommufd.h
> > + */
> > +int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
> > +				enum iommu_veventq_type type, void *event_data,
> > +				size_t data_len)
> > +{
> > +	struct iommufd_veventq *veventq;
> > +	struct iommufd_vevent *vevent;
> > +	int rc = 0;
> > +
> > +	if (!viommu)
> > +		return -ENODEV;
> > +	if (WARN_ON_ONCE(!viommu->ops || !viommu->ops->supports_veventq ||
> > +			 !viommu->ops->supports_veventq(type)))
> > +		return -EOPNOTSUPP;
> > +	if (WARN_ON_ONCE(!data_len || !event_data))
> > +		return -EINVAL;
> > +
> > +	down_read(&viommu->veventqs_rwsem);
> > +
> > +	veventq = iommufd_viommu_find_veventq(viommu, type);
> > +	if (!veventq) {
> > +		rc = -EOPNOTSUPP;
> > +		goto out_unlock_veventqs;
> > +	}
> > +
> > +	vevent = kmalloc(struct_size(vevent, event_data, data_len), GFP_KERNEL);
> > +	if (!vevent) {
> > +		rc = -ENOMEM;
> > +		goto out_unlock_veventqs;
> > +	}
> > +	memcpy(vevent->event_data, event_data, data_len);
> 
> The page fault path is self limited because end point devices are only
> able to issue a certain number of PRI's before they have to stop.
> 
> But the async events generated by something like the SMMU are not self
> limiting and we can have a huge barrage of them. I think you need to
> add some kind of limiting here otherwise we will OOM the kernel and
> crash, eg if the VM spams protection errors.

Ack. I think we can just use an atomic counter in the producer
and consumer functions.

> The virtual event queue should behave the same as if the physical
> event queue overflows, and that logic should be in the smmu driver -
> this should return some Exxx to indicate the queue is filled.

Hmm, the driver only screams...

static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
{
[...]
		/*
		 * Not much we can do on overflow, so scream and pretend we're
		 * trying harder.
		 */
		if (queue_sync_prod_in(q) == -EOVERFLOW)
			dev_err(smmu->dev, "EVTQ overflow detected -- events lost\n");

> I supposed we will need a way to indicate lost events to userspace on
> top of this?

Perhaps another u32 flag in the arm_smmuv3_vevent struct to report
an overflow. That said, what userspace/VMM will need to do with it?

> Presumably userspace should specify the max queue size.

Yes. Similarly, vCMDQ has a vcmdq_log2size in the driver structure
for that. For veventq, this piece is core managed, so we will need
a veventq_size or so in the common iommufd_veventq_alloc structure.

Thanks!
Nicolin

