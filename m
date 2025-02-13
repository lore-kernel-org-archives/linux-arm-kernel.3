Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03A7C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMGQ+l2v+keaPXcLQ731dvu5wVPTSTMLAoED48MTqxY=; b=f1hhnIEBnk+K/hROMS4yQgnSIa
	Ry61eH4WZLN5+TBj0QgT0z5vclIqFlQJTdc8hj+jaFqTGuKYNNDhN5d21w/BCfAtjijxfLeIR3/OD
	u8kfIEyyDJKjgY4eQ7rV3l0ocMejr0rQz2VprceQY2JYr5shXUjV49s73qTHN4jPMPVxP+qvv+CTJ
	zSTKOa4/69ZvFxrOEacDiG4eSCcD/XFWls6LyV4S1OssnURuXNmcT8xaPGwC82BsccAyTkNdmL6KW
	tbMa3kPigJgi28S56bwbKy8v0sqdWwgdz0KYKkIQPac7p8aJud2A/U0ob0D9MefQHTRz/jgJeO5M0
	rKcJj2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibZZ-0000000Bdpc-18Wo;
	Thu, 13 Feb 2025 15:56:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaLK-0000000BNFA-2dCb
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Feb 2025 14:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gMGQ+l2v+keaPXcLQ731dvu5wVPTSTMLAoED48MTqxY=; b=ITt0cn7FWfwOqbKvMRo0iCn5MY
	RiBwLzIaPypid6C0sNmhxBbrgMujAj4lR/PVRvu4nOtU7EEj5QyE/i75yQijYMh4FVRbg5hElyiiF
	0ZsAgu8i2DyQLI3lLVq4IJ75jTbeIzU/alL+C8pL3k8lbHq1rNwOnFgEb9EEJNIGAVEVNEo0Id/HA
	rN5dCfaidOe5RysKnHla8nVnUFXD/LGGKunwAQq7zFMBLUXPAexNfhzk//XzRNwQ6DeLe6LC9EK4f
	3/rE212NE7o1ftRA7xxhdqfET4UmeF0Vs4P6s7jhBS799jd6QZ4NAlAY2xwaZZcBoMvu6MJAJdMs1
	9gLcI70Q==;
Received: from mail-co1nam11on2061c.outbound.protection.outlook.com ([2a01:111:f403:2416::61c] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaLH-000000011Jy-1krD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 14:37:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/6Jw8rSGNkxZyV0KAkam1+ZazkdndOdrBieStI47OqlHPxRsJRjNoyMugLIYegKdHxvQ5try15X6eM1sHQO8nQixF4rNEZsBOlNTUJJPqGPTenzrkRKn65ZlEDb6G3EKS0qH4vJkv7440b/zNqLU3ShTiB0Y61UUeF8+IU7lIdTgaDPzuYLATJgM873fhB7VUvpwH07ZFPNjMJUFenIPyOYZnYIdJdvOcHWMfgRgfnwO4c3KQm0reuhEHNQUnpZDGLOHQTaskxpoQ3kZ6sRWVgT6T+ZduiRD2yvLDSxZFNIzAaCRmTERq0bi0Wkrg595HDavcdfoSbd4Az13L/ZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMGQ+l2v+keaPXcLQ731dvu5wVPTSTMLAoED48MTqxY=;
 b=EkOTURSGhiuga9C6q3H3BoT2yOW4EF71NOnwPHpnZRWfgySbiIA9R20nv7ZBG/v4GJumMd5xrZranU492bjdcDVV8ZiyG04MBhXmjOxMdu4IgLQSk2wFCKb9ohsouhknfMik6addHzmbnbPXSm3EHblq/rCWFAY0h4nwW2H+o/i006Km77O7q1xHriujW9YXVcLR8/7hajtUYUuFFn8yIaksdy6azs/WDRMzW1v+ZP67xrNJ0gQm8e+0SfgV/jjIlsFRviluXza/HFhYazIHHfUe3jryF991VmnmJebyQOM5Fhw2E4nNccTGlT+M9H43KjcZCDS5Zhv/F5kAdxR6PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMGQ+l2v+keaPXcLQ731dvu5wVPTSTMLAoED48MTqxY=;
 b=JVDbSw2Qx2S5ZJQG7viQrWd2LZg4yZbdQNbSgeoNMWLUQROxajoPvlG+r6DRSnwDYRU+/S9uKOJjA7Zom7ecSW7mZtffgb+BcfHEjJEhWWp03kB6gyJbHQ0FnnLJDri0JLMeLpa9g8KWIO04nXfc9JiH0uL+zYirzRu7hfWDX7jmkKVFz2viq08H5vUSeGUZH1o7XWbujnPOccbB1iNigXIY3Q/xq+aep4anfX1GHdoQoQrkkHzidXWHZkfKQpYL/jPufsGC14OaXYp6cxOGTPrQJxXIkKXV66PZk5gbdN/UYE6U4BlNjHG3kWfjChCuwjPyJfIhBtZGmruPQEojaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY8PR12MB7657.namprd12.prod.outlook.com (2603:10b6:930:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 14:37:19 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 14:37:19 +0000
Date: Thu, 13 Feb 2025 10:37:17 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	maz@kernel.org, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, shuah@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	baolu.lu@linux.intel.com, yi.l.liu@intel.com, yury.norov@gmail.com,
	jacob.pan@linux.microsoft.com, patches@lists.linux.dev
Subject: Re: [PATCH v1 02/13] genirq/msi: Rename iommu_dma_compose_msi_msg()
 to msi_msg_set_addr()
Message-ID: <20250213143717.GA3754072@nvidia.com>
References: <cover.1739005085.git.nicolinc@nvidia.com>
 <0cfaefcc104e29aeb031f316537249d8d53ef7fa.1739005085.git.nicolinc@nvidia.com>
 <87v7tejb7q.ffs@tglx>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7tejb7q.ffs@tglx>
X-ClientProxiedBy: BN0PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:408:141::33) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY8PR12MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: b90171e1-ec99-4910-f15e-08dd4c3beb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OCsrLadiYS70MeC7QWziBI3BQuukZtSFb6xC1Lk6McJ0i31gMikaHCfNnMPJ?=
 =?us-ascii?Q?iNvXE318bZWdxhfilM4IbShQvUrhFeyrM2TBPW8pvbP5SQMWtJPKCYkU2q+Q?=
 =?us-ascii?Q?933cGqVsG8sHNiUjo1PnZrRiAfzD4msEkEIKNASHb20KmDTgC86X1ootpRQg?=
 =?us-ascii?Q?zFBpTi0MCTpsHSosJuqcYjidwGs7IeyxSFVU40ASSnhZ1qgbvYzn5KKkVbwi?=
 =?us-ascii?Q?VkmF2IT7m+oNvgScOsQPTPH/ZkbVi0qDpfH2GUMdFHAsnGAzPiEQUJ0KAkNE?=
 =?us-ascii?Q?1IEkxL9J2a6ICWNMTcWmJtCWq51AZa0/fZAk82r/y6I9lpWuzLfPIXqfpo9Y?=
 =?us-ascii?Q?NTJ9XULd8eRFJv1MzxRhL4uLoE+eNjEt+TcYkboDS3BkYJVZw1Pk3kBpb8/D?=
 =?us-ascii?Q?OW9/PGwANsRV6tr3NFUhXeVpvxF/2yH/d7xT/KGGv/Bepf2Bkao/ZxJxXg8G?=
 =?us-ascii?Q?MvRffX10Lq7RYSadnHFiJ0ttGDLGJ4fBCZdrrEorPE4DaYX7VeU1Pt+T+5nW?=
 =?us-ascii?Q?hKo/VZWO22oTT1rFbe1CSGBQXoCMr+7vPc4NbCv67fRx+IfXBiWlq+vmZ+Gi?=
 =?us-ascii?Q?U2mFsZBix71YT4JCQEHmrDPoVA6w4CylIXe5sgj2GULCkiFcVRsAVndEH8ry?=
 =?us-ascii?Q?O2iAGkp8/Iy/rcYoyXVe++sWLrmUi/OOu5dSLBidkrWTHR8fFDHD2w4W2JIm?=
 =?us-ascii?Q?JOHaSLjQOE/x3OLV3V3g/irMmWESFmGSpBfa0wMZV5SLOC4jAJkWCPfW8Vtx?=
 =?us-ascii?Q?CSOWtK2OudlRwCdML7tba6fCgibwmV7ecd10oeYR8v26WAKwU+tw3Q+7BB3G?=
 =?us-ascii?Q?ZN2eKH2vEj4olZQTiK9hSKo+w69IimEze8vpQ5Lwvn7+r8XMsZMfThSv+xSu?=
 =?us-ascii?Q?TApFeqOeX1LdFEhnRMTxTaz1AfQD3iadtCksNMm8gQXNnOPCx/pBlC1cc6GF?=
 =?us-ascii?Q?2HVL3BehfF24MQ3hTKghDYH0PkOuEpDxsPq2cvZrPd1d6K5vV2YWTCMIMKHw?=
 =?us-ascii?Q?jGafwYc6I8yKaVXeZ/+V3Gq+olmiKd7odrLu08fX20d/J1DSulC0IrYAFT/g?=
 =?us-ascii?Q?nY3lZcHkNCaQ0P+OjUteGDv8u2K68SUcYuoxuU7DGkkq27KdTmqrMjyO6B8L?=
 =?us-ascii?Q?1dZloJUDjTv3nl9l3ektYq2RZIRzYFwmOSXI8Pgu9XcqxhqQO3MtTfQIkmGl?=
 =?us-ascii?Q?y3Xm6H/c4Tyeb/kXNr6hrjvm4NoddahuesWpAYECu3FYI91NFcHCQq9/JAL1?=
 =?us-ascii?Q?UHlc5gaAS5rEUGywuzUmX53tGuPpVrU0zfrN/DGWRy6f6Mu79lUbd5/Ifktb?=
 =?us-ascii?Q?xCDVyiNBth4ZuNNAv74v8Z5Kn0aPqOUZKcFhzol0XBMORq2FLeMMiUG7VaoP?=
 =?us-ascii?Q?v1trOuxhCSjeWFeYDskntb47O9x7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CbTa4EM9D4LG1E1cY0aJ7JYrWOraDjZ0Ar0Rycz6QDfjNFE7cXlY8yNkARJD?=
 =?us-ascii?Q?E4d4dSNc55DoKBs7+lPd3XK6yQAxvyQ0wALBEGZKLI8SSZhjJsYSR9kQuLXQ?=
 =?us-ascii?Q?NAy7LZp06ctM5pHQFhX+Rw/6o1kyXsVGUsCGHxCD5lnmsSnXE235Uekl+z81?=
 =?us-ascii?Q?6zatGfuYQbWajOw13Qo76SLz40SzHguF+zE9QqisMYqaTHYgZ9JmtiDYhux+?=
 =?us-ascii?Q?VqYpZ8E4vAOa5HCIos31OJVhyQuycTb9LLh6Ig/ICINCkhW81OjMDlz3isbz?=
 =?us-ascii?Q?Yypg4sNveF+7iu/jl6mgK3B8r7Ivoa65JsELnbhupfozjZJS45tsBwJcqtEV?=
 =?us-ascii?Q?rbCkCUZJLYI3Usx/3ZB5orCE7IzkTP0ZIW7oD43nW2cQP+L5JaOhr1mFSzft?=
 =?us-ascii?Q?ub8hlPotcs5EvgqXEnki/rXsN7nBu43F7GX3sNNnsAusWDrddZw1/2FFYJr/?=
 =?us-ascii?Q?jJOm24OwpTU9bTF/KUphTiapBhhLilwrDkrvlgd05fwI+UZHMtgfhu8W1HHL?=
 =?us-ascii?Q?HH9pdmPz7MvpmdWERAkfBIPdMntUaNFu2TlJSihGQ4yTLVwVpiYHkJyEn/v8?=
 =?us-ascii?Q?Z4WfsS4NReVGR6MNTB2h2zBHw3GbLFA+IVmskaIQrbYjdtW5yIQcmw/4RMFH?=
 =?us-ascii?Q?Zj7oT5YgnLYF5lnMe6k1Ub6C6g14Lk1p9WTh8O7MaNkW98U/2Zb3e/kpm5GQ?=
 =?us-ascii?Q?k5t9X+nWGhxsEUHBX7HBKPCi+AOoeodS6wkl1HqQVmaXV/3w5cXDgxYQFw3o?=
 =?us-ascii?Q?L1kCy1VPTE4VCIx3Kd/WEgujnvY9DhWunlhwbEDyByD8LWVffEB9A/+cJrKK?=
 =?us-ascii?Q?K3opqXxL8z31BuuvEHtLQ6xj8t/Inv6DS8NGebqAYqm0grdATCBjJVXHXeHb?=
 =?us-ascii?Q?2Pbbn+Rc6mC7rVNpj0CBdZxPSimktoOq4I2Dbpv/VYs2lUcwCLu4JeegcEF9?=
 =?us-ascii?Q?LvlfCf70h1TSgu0c2qMXzuiHjZqm91S9wiujxe3ctw9t+pppGql63dbiWfFZ?=
 =?us-ascii?Q?JYRixz9z9nXeUEjtyBh1feCwZgCXIV5T21fY+RXGRVLVWUPVTXmM4uWxfohB?=
 =?us-ascii?Q?TBb4XmgfgWH7MLjE8GvOQRltB26JhptzcvdQNPbpo2oKp1ztd2ejuSbtnbRM?=
 =?us-ascii?Q?DLL1BOJF1jDQ/sgAGgXNAgb0iDQOEl9/kcSbvXtyQZ1PJCzp2/UPMJesmhn3?=
 =?us-ascii?Q?QISYcGIgBPzbeE8FqpM3H8LNhc1+Cc84GkE59BPm7rbfBQdlL8Qf/UKluReX?=
 =?us-ascii?Q?DIoxYVw/mp9pxbdVuXn3fbvbZJPw614mvsPCwnZB/qjlMcI7LhuGdJhplKTT?=
 =?us-ascii?Q?AY5QxJlLpuUtCoio+7yZQLuIJ7X6spxigGRPbczpEjcz4te7+Yu8reWtTCze?=
 =?us-ascii?Q?P2LORQs8Yfu4eFVSWe+I5OL1Voud+R2F7OOZ89SXTusQr7q96k3LBLQ654oy?=
 =?us-ascii?Q?6ln5hA5i8fY13gY0n8uzQwF+gnPbcbIvY69MtLoiBn8SRmAObjuyHKcVsyBQ?=
 =?us-ascii?Q?+R6QvfCxU4ciuXPcSOmivset/R4cUIDQYI6aWK7m1qLdfp5GOWb/iez688hO?=
 =?us-ascii?Q?xionF5ZfFK6Qx7HWRCjzXjgbO0CQvp6Cd7PYuDd1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90171e1-ec99-4910-f15e-08dd4c3beb43
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 14:37:19.1717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3A0b7oC5JqSPwmgguOxClLLpuPvKPt+xdpR0TTjEVPhstk5TCFpOIRt0lFsiCqqb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7657
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_143727_578148_5C0E046D 
X-CRM114-Status: GOOD (  15.96  )
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

On Thu, Feb 13, 2025 at 01:11:37PM +0100, Thomas Gleixner wrote:
> On Sat, Feb 08 2025 at 01:02, Nicolin Chen wrote:
> 
> > From: Jason Gunthorpe <jgg@nvidia.com>
> >
> > The new function is used to take in a u64 MSI address and store it in the

Assuming Nicolin moves the hunk as I suggested for patch 1 lets say:

genirq/msi: Refactor iommu_dma_compose_msi_msg()

The two step process to translate the MSI address involves two
functions, iommu_dma_prepare_msi() and iommu_dma_compose_msi_msg().

Previously iommu_dma_compose_msi_msg() needed to be in the iommu layer
as it had to dereference the opaque cookie pointer. The previous patch
changed the cookie pointer into an integer so there is no longer any
need for the iommu layer to be involved.

Further, the call sites of iommu_dma_compose_msi_msg() all follow the
same pattern of setting the MSI message address_hi/lo to
non-translated and then immediately calling
iommu_dma_compose_msi_msg().

Refactor iommu_dma_compose_msi_msg() into msi_msg_set_addr() which
directly accepts the u64 version of the address and simplifies all the
callers.

Move the implementation to linux/msi.h since it has nothing to do with
iommu.

Aside from refactoring, this logically prepares for the next patch
which allows multiple implementation options for
iommu_dma_prepare_msi(). It does not make sense to have the
iommu_dma_compose_msi_msg() in dma-iommu.c when it no longer provides
the only iommu_dma_prepare_msi() implementation.

Ok?

> > -static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc,
> > -					     struct msi_msg *msg)
> > +static inline void msi_msg_set_addr(struct msi_desc *desc, struct msi_msg *msg,
> > +				    u64 msi_addr)
> 
> No line break required. You have 100 characters available.

Sure, I make alot of patches for places that only accept 80 :\ It is
hard to keep track of everyones preferences. Thank you for having
patience, it will get fixed - I think following a 100 char limit will
resolve all of these notes.

Thanks,
Jason

