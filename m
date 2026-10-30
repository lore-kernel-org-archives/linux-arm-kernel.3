Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4703C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qcj16ZZD;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e3VqcMDn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WxEqCkpE9IoXjxnRkg8FNFZwj6CToS2mn328dpJwi7E=; b=qcj16ZZDGRipUfQ+tOwInB98nN
	A62kF8dv5n2u9T1oZj/gsNufYxr3JYjjVtXBSZWLkV6BDa4MT7qPvTPWmQOwzDRC4su2UhEqN5Wio
	sinh0UxBVE+etKKFwDtTJ/5r3csDJweT+FKYsqo9EE2dJoz15T7VEKEl3yH1/qLlsY/2PqHg0MuQa
	xJ9aIxq6GVZjL3MfRbeG9SA2eS74lAdbfmbntHwxSCby/4WSZ5dPNvrjix+okGL1UEAhkQUrL8tWN
	R1LveKdhjJfT8jKIt/xcLWO2IFI4YeXFiA4jlNp1941og93Z3Ok7mJMDFNUsjeJxL+/+iwaxW4Me7
	Riv/zEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoNc-0000000BzFx-05tP;
	Fri, 30 Oct 2026 15:18:56 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoNZ-0000000BzDg-1EqR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:18:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRww9f39B7NXeEbtik1eQ0ihHF183AOd40gJdYGn4lNz9Dk9APILYp5eiUHeag5dCgYzyyo10/m5RWRYgd/4cPmcuwytIgn7kSZbIz8TmMAldjqs1c+MqicxNUqJVOJQkey/0tt1jq44WqVr/S93/4s7dCKqJ8YluJ/UazsTQZIs456vIgZXSQOutPK1wwUBs/TQMA38Oj8vuJhkIBZHiPYYv27oeJxTfWDek9QB4C0fe7qRCWjesmFPobqr2dhNXj1HJ8FYmTUyHWOU0gUswGygAvdf9aav8bVmznU3SXGwURpmMtzYb+LIyDQRmSgjGqgydnU7FejJkm2qf9Sq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxEqCkpE9IoXjxnRkg8FNFZwj6CToS2mn328dpJwi7E=;
 b=DLgjb2ixvwTUvy9WDEu/sUot62yeNLBGx7taeEBUFDwtJwwx/3RCdBcEKO06KIOgJAu6KGFKJ+jlRkpL0/GtY46rB+gvrUjl7h+WMQ9D3vCDefivfFJW3FkppqYSeffyl2fSQBOiP/rvPJ+0z+qX8Gde/1IkveYdcfyCIUjyWCMHhj8Y7KCaLtdXOls7LDT+GEsUn1dJE93S2HNglueiUvkSCrtv5thMzWgV+yb85b8Wo/Iu0metItDIIqS530x03oB42GAEgocbEuu5gxSW/pz+kjS0YNvRb8tpJIkZ6THaw3Gzm3M1sIfFzzQrI1+/ubLW1voCWa4b5VcPLcDZeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxEqCkpE9IoXjxnRkg8FNFZwj6CToS2mn328dpJwi7E=;
 b=e3VqcMDndqXGiOU3Surx7TEdtif9LYaRxYV83CyePXRbZIFynGkAIDsljKnQcVp7hBwXm3LbThCvQPp3STOlvCFQnTw2ggR3M8a0rn4uFQ8lIdgPaMzqAVfuhCDD/EwIOPsKxpWFVVkFAlU2t9S5gndW1G5ypxGaZwQhr05GT4ifr3cJFsxcvJpmziRVjgFyf8Tr1fGkLzC3uwQNcHeloSrTHg2aXzDZcz4JdpoBMoiDkp8nJ/5N+XyS0IIQL3YXIjFMSLXgiuW0znAxN8K3OxWLketyVCepBsh/AcbhWFb9mpMemMDQ2oyKWVW+kaZ67Qd+GS7bzIlhWqbnMcOgfQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SJ1PR12MB6099.namprd12.prod.outlook.com
 (2603:10b6:a03:45e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 15:18:41 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 15:18:41 +0000
Date: Fri, 30 Oct 2026 12:18:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v7 10/16] iommufd: Add the vdevice TSM request ioctl
Message-ID: <20261030151839.GI3734323@nvidia.com>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-11-aneesh.kumar@kernel.org>
 <179321444123.2412245.6955528563980811144.b4-review@b4>
 <yq5a1p98c0f5.fsf@kernel.org>
 <20261029130117.GH3040767@nvidia.com>
 <CO1PR11MB48352ED3E4DEB3A8B4F089AB8C6D2@CO1PR11MB4835.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB48352ED3E4DEB3A8B4F089AB8C6D2@CO1PR11MB4835.namprd11.prod.outlook.com>
X-ClientProxiedBy: BN0PR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:408:142::24) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SJ1PR12MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f79ff5-9f7d-4408-7948-08df3699144a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|7416014|366016|10067099003|261026121527099003|261021135927099003|261022105027099003|4143699003|56012099006|11063799006|5023799004|261022115727099003|261021130227099003|261021123027099003|261021121427099003|261022075727099003|261022113327099003|18002099003|6133799003|22082099003|261026140227099003|261028144727099003|3023799007|261026130827099003;
X-Microsoft-Antispam-Message-Info: KgSqSYQazVr/M/98Ssi9lGE7odMYGMOTduZz491Ota0OlKzDSWGw/qco5DN8kZAdUOKqD+zHMp220nhnLUPXknF3sGqR7NnDiYvBzg5zyR5lNPoRo+eDMP0yoBlTa05ewDDrZSVRiKp1vDBrPyQRYD77Gk3VqwL3aF+nQBTj5mFZdSMm6BD5bWKWCrHpSCYRlk8Oh/oG8Au6oTnuYtflN4dOurghloHBd8YkYIjsNlBPkXqz06/sa2lmfUgvQ4SlwgadNLHCWupWAVedDUIZbuIcnmlYzcyo07VPcvb4MW4i+/oW3Djzzz7Kbv6TDe5xoVSk3rzyANvXEwMzqJ8oTVK9d2cvYnxNnL/qNH0QtzwDN6yRpWB2stRiGUZGpdwFZAj+/OmV0X4JcIdWRy2lWGxUQ4gdHqMjydzfDQIichntjEFHyMLks1dOc7IoWTX+cZO29naZFGn3GfTi+vxMDG072ZnpoESp0hbNLAVybnoPVKkUYPefFqBJuD0d8DiUfWG9mfISXpCkTLBi0drPlzPlA7HOgz5jgUbRN7RVmYXqLvY2qRgjDOFqMSezM6NW2//NqPPns45yVwQpL45jmPJ7EAxnLOWcHfvDHNj9yLWidRqYmF0Y2Lyt0ARlWSJPvS7gW45ekdCDx0a1NZ9SEbxzdX03F/gvM/HJJ4oT7YE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(7416014)(366016)(10067099003)(261026121527099003)(261021135927099003)(261022105027099003)(4143699003)(56012099006)(11063799006)(5023799004)(261022115727099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022113327099003)(18002099003)(6133799003)(22082099003)(261026140227099003)(261028144727099003)(3023799007)(261026130827099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HuunGCu+DLXbVieEG6bqkugsBOq4spvfWe4aszz2OhPaXMYvx1yFdLVIQ5d+?=
 =?us-ascii?Q?tU/5dllh7sDfl7vzTNl73SJ1M6YrlPO6jMamxHPOg6XBWf0c1pBhqtPMZXJN?=
 =?us-ascii?Q?pJH5je9yechIbTnsuL/UsCJbg7355Hm/sEJkB+9zppC05FFt5TT31xa7axxu?=
 =?us-ascii?Q?UTdaksk0li0+pk+zaomICkKmO5TSJuVyLregu+6ycd4Wznt1g7M41e6HamuK?=
 =?us-ascii?Q?z4t7noi/ncVLI4gE3DGtb7d0pfMpQGIFRLvsE1dRm37/UisAFrJGwqREaVym?=
 =?us-ascii?Q?eLE6YDOr+xs//YArUe5p3vU+FG49tPmWkH9QN+88BIo/OzywRZxHlx4GnlOI?=
 =?us-ascii?Q?Pp5Lr82aSLXdYljJez9QEyreTiSoC81gMBQwT4ybZXjM+KOdaTM5mZ/d+tmn?=
 =?us-ascii?Q?1dJifH8gjrlgzFd4Q7aafA0fLJkCxZERgxqtD72gMDVi5JpWfkFzagFttqnG?=
 =?us-ascii?Q?4o9/14CjN3dYLXsegpdy23OBjEfmR6QMTZVHKIr0uQNADI2OvSgVb6MOAGS0?=
 =?us-ascii?Q?pwhxFO/5UL9Z0mqtaib1guGs8cE7A7jlyulso9Qhbn5SomeXgUsjAjRji5vD?=
 =?us-ascii?Q?RQ0Ga38spituNt65FhCiTikRclkJMbuDJaca0eQ9Sn3IbA1Q+L8sAAqZIjDU?=
 =?us-ascii?Q?7gKlDZqFxWMJpEvq0QXbq69O2CYRSg1ZhTS/khrEkuivYCecUO5dLDYNkJBa?=
 =?us-ascii?Q?hHqe9me+rvf6LcSS2udj6zZgbShVQGGWRDWy7dkDjrIJEirXZlp6aH33Xr0F?=
 =?us-ascii?Q?zmM5o31ryj1he/d8zbIudVFbqGuLi/rynCeNP/09wV4/PyCImCeYVUu4EmhO?=
 =?us-ascii?Q?adUylm9YmJZoO+ybhbvFLDTDT9MmoHMfFSEFE9QcQ/Egp47Ohr/k/+Fp9tVB?=
 =?us-ascii?Q?vzdeN4xtQ4TEeHahnbd/NuD6QAMwR+8x+7kDxO5fusbZgJJg70ccqQ1BpdlE?=
 =?us-ascii?Q?pbV81z7rLD14Z0Mhlq7eXB4S23uDW61KNFVyOk3e66QvQuHw9c8ywH/Q78ut?=
 =?us-ascii?Q?AmDgUygo0gHVXjovGWj3yBK6Ps8FeDmTMU09kdSRMr5mwvCVGfPkRWMmw77P?=
 =?us-ascii?Q?POxEHfl7BfXxMjDryeJSKzRqC94+kej4cEzpv8+JFdp7lIdhahQVmLMwHsfE?=
 =?us-ascii?Q?eWlVbWDzCt5Hj9xTEOk9vrnBvZCivdg4A/7jKAXpk/L2piSGVJGsR5bF/3ja?=
 =?us-ascii?Q?3qOMJ29QUqp5O7jw3rX3hbyUlhHi3L/XdsAdLHZP7ocE8FyCM5VEZ41g1iUA?=
 =?us-ascii?Q?uIWdnjS5x9Ehbns56eLVt2UcKA/GbBEhjlyj9IsxwrHd1HYp43Qx6jp/urXx?=
 =?us-ascii?Q?O3akeJW11DkcNdPjupZhcAarduw2bR57Bu/W2SJAl4ijWfPgVOZXHCEQT6zS?=
 =?us-ascii?Q?4M+VH/IcTOAmViOjP3kvGmIMTUuiy+fn2s4kYVXexd3/7MjQahdomsHle+Vw?=
 =?us-ascii?Q?xSgkpw1vQXMH3d7ysWq3WV6Sew8lv4fAKkRFimwxskwVUH0fMKHhZPXDYSJ/?=
 =?us-ascii?Q?87FnxVo86sEYYFYCjTGsBxua+s3tTsrElwHPF3eFWLjkTSIhpZb8vW82BZiI?=
 =?us-ascii?Q?Bc/k+30OhqzsoE2fqKNRLqdRpeoYyzc/60cPDy071Kvlw8wkK80cCyWhW373?=
 =?us-ascii?Q?5Th0qsCg/aNF8FpLPLovkmz+UOqHoli52qD/bOIF4QNmMF1A0IZEPP0/7u6a?=
 =?us-ascii?Q?QoM2jZvOm9Ja0KUAYvop5C2bwlwvy5Beq31m2apcHGB4Wkqt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f79ff5-9f7d-4408-7948-08df3699144a
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:18:40.9179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Oupc8nYAmUlgdTfV+ovKcRTJqzG87EjUlhzrWooEOXHOFC8mbO+bmFADlsrKPoe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081853_358769_8040FA9F 
X-CRM114-Status: GOOD (  29.44  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 07:41:36AM +0000, Tian, Kevin wrote:

> Then if your suggestion of using the attestation subsystem here
> can work, those OBJECT related operations are generalized too.
> 
> In the end the set of vendor specific definition here might be small.

Yeah having now looked more closely at what CCA requires this is my
feeling. It looks like it needs nothing beyond what an attestation fd
would provide. Possibly TDI state if we don't roll that into the
attestation uapi.

> > > > My guesses with no information
> > > > 1) VALIDATE_MMIO why would the hypervisor ever need this? Guest
> > > >    validates MMIO through secure communication to the secure world.
> > > >
> > >
> > > With VFIO PCI BARs backed by guest_memfd, the VMM can validate that the
> > > IPA and PA values provided by the guest belong to the VFIO device.
> > 
> > Why? Who cares? It isn't a trusted validation, and there is a RSI that
> > duplicates this?
> 
> TDX doesn't require this. It's a guest call directly to the secure world.

Yeah, if we need to know the actual current memory shared/private
layout after a TDISP state change that should be a first class API,
possibly in VFIO.

VFIO already has this information because it needs it to do the
guestmemfd/etc invalidations that Intel requires.

> > And then the seq numbers check that this went through OK?
> 
> which seq numbers in your mind?

CCA uses seq numbers to help secure the RHI. It looks broadly like the
guest counts the number of times it does operations and then the RHI
relays those operations through the hypervisor. Guest detects
tampering by checking the sequences are right through its own secure
channel, along with hashes of things..

Like it counts the number of lock/unlock commands. VMM issues a rouge
unlock guest can detect it.

> > I think the bigger issue was it had to use the VDEV flavour not the
> > PDEV flavor of RMM commands, and it isn't obvious how we switch from
> > PDEV to VDEV mode on the hypervisor..
> 
> Can you elaborate this part in a general way? Want to better understand it
> in the TDX context...

At least in CCA there are two sets of APIs into RMM for doing SPDM
stuff.

One is for the physical device and one is for the virtual device/TDI.

You have to use the right one for the right use case, the VMM has to
relay into to the virtual device API, while a non-VM bare metal host
has to use the physical to do attestation.

The full best attestation flow for a system would be something like:

 1) Bare metal OS does DRTM and gets into Linux
 2) Linux leaves drivers unbound and DMA disabled into the
    initrd/rootfs
 3) Every PCI device has a TSM connected. SPDM established. Link IDE
    setup. PCI device SPDM evidence/measurements collected and logged.
 4) VFIO driver is attached
 ** Now we can attest the hypervisor is secure, untampered, and has
    the correct inventory of PCIe devices.
 5) VMM starts a TVM
 6) TVM does DRTM and gets into Linux
 7) Repeat #2
 8) Repeat #3, except we are doing lock/run instead of Link
    IDE. Measurements are still logged (eg to a RTMR)
 9) Real guest driver is bound and starts running
 ** Now we can attest the guest is secure, untamperd, and has the
    correct inventory of PCIe devices

So on the hypervisor side we have two logical attestation FDs, one is
manipulating the bare metal PCI device intending to bind a bare metal
driver.

The other is the relay for the VMM to implement the guest API to
control SPDM, intending to operate the PCIe device as a TDI in TDISP
mode.

My suggestion recently was to reduce all of this to a single operation
'get attestation fd' inside the iommufd vdevice which returns an FD
configured to do the TDI phase for the VMM to use. It presents the
same uniform SPDM API we have everywhere. The VMM would have to form
that into the VMM Side of whatever arch specific protocol is carrying
it to the guest to proxy it into the guest's Attestation subsystem.

Some of if that will work depends on how the security protocol works,
like the seq numbers for CCA. That has to map perfectly onto the
attestation uAPI so that the VMM is causing only the actions to happen
that it is required to do..

Jason

