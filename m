Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADA9CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzd4Y932ys/rq1Lye5ykuPXV31VL1tYr/K62MmB90ro=; b=OmJVpMvQyMAGEdmDvXY7x5tLTT
	p5FrEc7ADzt19b3uS240OdEotwH0znf2kKY/LYmuIlUK/4ox4mOWtjkNTxP9iEksbTo8fd0WQ1hj+
	KveEHW73QlpFffRqdW6rO+VrzCYR/aAfQjRBg1i6/9U5LGUcaJXqwJTQ85sxo8vfuEaxKHxr1qS6Y
	EZ9FnUCjwMvakZ2T9sUTlpFdlnz5VQ1NBXa7lrDjF0jV+qmPsz8jJeQnYMuJNYjwmsGGJAMttDfKg
	6E5JHHHYtveUM/ISfZ1+sT5Flv1MzmSJ8bPY9NQ994Cn0PRhS3TVSzpaFAdpCUUReBQkSMm48yWIq
	9w2MlHPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0qH-00000007kTU-1r79;
	Mon, 18 Aug 2025 14:28:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0gY-00000007imR-0LNl;
	Mon, 18 Aug 2025 14:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bzd4Y932ys/rq1Lye5ykuPXV31VL1tYr/K62MmB90ro=; b=JJOuJJHXl+07j5l7wSZj8E8uLL
	/w7LEnV7waVtMm1Mb2/AMjdp/bFfZvrzBksqA9dRgqpnaXo1lE3E92Qs4FhJ7E+fNY+kXrP+Zc9Jv
	dZLR256ITcJm8MhOdc6Ls8SLHCqPv8DFX6Xikedwmig4TJSA9hfxU22AHBaM8X1siMYBlZFSUG5xf
	b8/Ao4PEloaqEyXj9xy28JIokE1ubYQMZa+Mw50+lBerou4iAw7IDZCuMVRL3K4FokPfiVd4ABwzz
	3wOWUe30VMfw63q0HYkUwxamFe+XMrK6glCmbC1mU+KvIskeoXXlsXEtv/7fXvBcmxZQGVpRXlIru
	dlfjLxYA==;
Received: from mail-bn8nam11on20625.outbound.protection.outlook.com ([2a01:111:f403:2414::625] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0gV-0000000HPVw-0IZh;
	Mon, 18 Aug 2025 14:18:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4yBWWx0fNBL0CRuBMYaYuxYuWLjjD2uV+B+wTAdE8t4YskzNeibhs5uZjjYU4SAZDx9wXv7IMjI0pEe2igeoYUS69OOx4DLoQDY0XS2Uk3lmsXSX8gYFqAmPOrDrEFF5nVhJQ7Gq143clpmtw/JS3snDyidvMf2QJjmcD+No80nu4mTuLk2S9/51XXPGoZUjaKunL79bCiIpJXqmHrWhuitycOVtmoEcltXDAEeAnADzBjJy4OpF2CoPzdWJ57skqshxtegTG03G9zMez27vXYacNIZpeK7KH8XFsMhYr64TVTmHJIbUvhPsWZ5MGXmVSWgtU2NyiPp5LJFHQTVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzd4Y932ys/rq1Lye5ykuPXV31VL1tYr/K62MmB90ro=;
 b=s/DKoyCDq+BMn9C7ozurjkl65Q/MAFDFLq8bTZk5f2Gf/mvZY3Zsp6u3Ji0Tq8Aa4z9bd+cctlyzPz/Ha5ODsIhItfvJylDnPuc3rz4WfDUqFP+2jvhyrFTDRsvktaK+Eqcmg0BrntPh8bnSFm1I6DStoqcc1azKsCbWXLkcydTkDBVwo8EfnGzpitUPQ7V8jpSjUveU1QQ6HhYv8n8DrNuJ3Bbtoek/BYa806ywFuNfYY6DGqSvHE2MYal7lS2Z6oLijPGaoanDDq+AD9Pz+PAA1TgFej72BIy7LywnXmIlIsrgnZ6xQKibOThrfFy7hILXoEdswyaQIbdgqB8Ufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzd4Y932ys/rq1Lye5ykuPXV31VL1tYr/K62MmB90ro=;
 b=H5noVzdTpeksDx1OgQRKPi4GwNTX8+TdYKpzBnG1/iK6yu9/zQOVlz8q5+E3+V2/N+PvthXX+fB2sSu1HfwHx/UBYGlS+Sb0cXSd9BKzP5hv04lGsK+CC2yh0eFZqYXeN9p3FYqPAGl8NWmmelBOFgDHcZaWSTy4GFRCgDbLMENrcW4PokDJBIl590sESX6ujYokJGSqA8xVo86I57qzHxUvznBjfFaxdZhOOzRc1zfbOXiz1RnO/KdqxHGUHLKy317F9i5ClvkDgbV97MYQOViAzizQuRj3NjXsg5AYWE9PJwXs6Chli9X69qmG30JBltFcDlQE6EqNgUaWGmD1bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ2PR12MB8832.namprd12.prod.outlook.com (2603:10b6:a03:4d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Mon, 18 Aug
 2025 14:17:54 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 14:17:54 +0000
Date: Mon, 18 Aug 2025 11:17:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"will@kernel.org" <will@kernel.org>,
	"robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
	"yong.wu@mediatek.com" <yong.wu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"vdumpa@nvidia.com" <vdumpa@nvidia.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>,
	"Liu, Yi L" <yi.l.liu@intel.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>,
	"Jaroszynski, Piotr" <pjaroszynski@nvidia.com>,
	"Sethi, Vikram" <vsethi@nvidia.com>,
	"helgaas@kernel.org" <helgaas@kernel.org>,
	"etzhao1900@gmail.com" <etzhao1900@gmail.com>
Subject: Re: [PATCH v3 1/5] iommu: Lock group->mutex in iommu_deferred_attach
Message-ID: <20250818141751.GN802098@nvidia.com>
References: <cover.1754952762.git.nicolinc@nvidia.com>
 <44783ca52e17a9ca0ce7acfe8daae3edc3d7b45b.1754952762.git.nicolinc@nvidia.com>
 <BN9PR11MB5276F543286807E05FB465F58C34A@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276F543286807E05FB465F58C34A@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: SN6PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:805:de::17) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ2PR12MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c22fbe-1ea5-4523-6413-08ddde62057b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WNVPTHA9lOiOTWvNoLMvmg6PeV5anA7qq3t7KmvI3TYJMWCVhyGG2L9oWvP+?=
 =?us-ascii?Q?rJJzvfCRQHtVoyhpI7y76qpVVomAy1dvb6PO3rVSjMuPK2/JpSYURiFtMwD7?=
 =?us-ascii?Q?ufc77T4RkQdlsvnll0OyxM2+vL28MQ8ti2Rg+AHsZVuA51Iz3B7CfMozo9DW?=
 =?us-ascii?Q?JVaY343PDTzOY2w3y6KxPg/H8+Oo+9kFqy6sW0fjuvAzDcn3G7Xp5+zjISf6?=
 =?us-ascii?Q?vlsZ6JBSG814efavJu+YN/HsiN+v+rIXT/4JI27/zUwDyrI+QqlbTJ4j0MKe?=
 =?us-ascii?Q?adazJg2YYHKh8YAbARAHs90qKEG1Jd90Ae4Y9b7nuPUe3jSbt4FLh+yBAGWx?=
 =?us-ascii?Q?mJwb/OtMBjmRQ8sqiaaU6/heMP1D8pKWGeSaPczDZgRP/9PIZ2jCoRqf1KZx?=
 =?us-ascii?Q?JPgXYx+OCfJTJw1HoWFdkkLsf+NykwN0nw/RIDDD8Ouv+K81s8NYGmDe5ZSG?=
 =?us-ascii?Q?61SXQSFAjAu5KF3kNOxWxJlUBdxj/3/r/NMJiHbJ8WftPPVA1IVU3jQ6ukBM?=
 =?us-ascii?Q?lcXbXKCOWCHeFaaeobXmSRWWr+HYRMiNRFUCDC1g3cxHo1Hpoeowp+S87z0H?=
 =?us-ascii?Q?KyojkcVbAsL9yqj3EB7szMfRcVDQVP0WSGwPBg1BC6ZfLWxPYw00jkv9q2/b?=
 =?us-ascii?Q?v6zxKI2ZJYcuNZlVZJjUoHcHnBidca/BQZnphCQyfmJ3WnTALI1ndVio/ZS6?=
 =?us-ascii?Q?y1jrOxJLEPBE7BmCI8twQe+rhkf0WKJIn27ZD8J8NpO1uVH088o8TIRaOsCW?=
 =?us-ascii?Q?wQS2hGRjmQoAyTfRsjPgLpK1mohxU++HUVuTb2aN7hj25QaFNf1CwMx1HC90?=
 =?us-ascii?Q?8NT8ELaUm1jFX/KvrifHzn6bv3HwUfWc96SAvwB2iO0zo1Ei5GYlcao5Mxtn?=
 =?us-ascii?Q?W8B6odTPgnh04c8+c/3RIhj8Cy3fkHui91516wyeI7hmttBfsu1TTHmMIGL1?=
 =?us-ascii?Q?CLRmkBWM5eRolHOR5nnHWUJ77dPsD4k+8hlRb03kxVw2pAttAs/xHu93OypS?=
 =?us-ascii?Q?OJLHepS2rBNmharUKQUpyc2UNhboO2OTGr9Xw3nk2cP0YaU6WtB3pv2qLY5g?=
 =?us-ascii?Q?KoLwIYnDOmOLwYtKPE7ZUm5N9T8hZsQq3ZgZx0rBhO4OC08xLVNhaQXYW6AZ?=
 =?us-ascii?Q?AobivY4r5Ejvk4jgHPxiMvfHcmLJPc+m3QlSnFlmvV4Og4w28/Y6fZayUAHa?=
 =?us-ascii?Q?5jRrZkrOFbfiPoiCeA5yZmUJDsSKycQafniuIPVuU+BP/rRMP8roI2lnnvLm?=
 =?us-ascii?Q?11DMaZXuSj70ryQ7hxNNgw9xu5T5m4rC3GWUjVHO8NXkNkqG6/ZYRDY6TMjn?=
 =?us-ascii?Q?ONT3qYw8vt6ZtKcfcfE0ZAjob2iq74U+DxsJ8yq0HAfS8DpTWs3aaWOpHxei?=
 =?us-ascii?Q?A/aLNpxRIQEOMPw0NFoYXRvdphQC8xTb6i7ObML58/5U+jXU1RWNUBe0kWdU?=
 =?us-ascii?Q?5/vh1dPCM/M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7nRaFKqyJ1AxM/hcmvI2CWjbR39D8YrLsrjHdMzHe97ygodaJTHEDM3DeSL4?=
 =?us-ascii?Q?eTDW7ZtZDs0H/AYlarTPcP6kJMJRmpvMXRAK5hyYfUbiUWYXhHrsl+u0hdcx?=
 =?us-ascii?Q?IfoIbKB6ckm8jOBFf07tosotisIdgkGMS1U1RD92ikgWlj5TH/8vKuJwTt5e?=
 =?us-ascii?Q?pFMXgkRzOpfs/44Pzr2N3yFlzpo+fPyg6pM+WsMX787KA0FfE+ybFloS3Tde?=
 =?us-ascii?Q?ZRBin/RYeKAC0xO9QHXJelZjhTerxQfHDmFY3nhSqhnoGSAeDXUdlemKwhiM?=
 =?us-ascii?Q?S9pJmyN3Te9Hh8yNHkyJkftNRhKimYtdXeFUVn15OePGDwXo7/6N51VB6MmP?=
 =?us-ascii?Q?epzeOcq2FWDtrZxUG8W4i323+g3bx/L8vpvty78JCvwB+2LmlrhmHUk1Mkbt?=
 =?us-ascii?Q?XB7WQx047UeIGxJ+oNWa3t87o9weUs+UyKY6Z2JUcFjwy6Wv4tWQrmbutisz?=
 =?us-ascii?Q?tg/MZ1e+UQQW+kNthlDODyOdvgBLSJIprPz5sU9dc1hom+QKq6GJO/ujvfx/?=
 =?us-ascii?Q?kD4gUhByDqrlYmabZV+qOa4SvKsSpbfX+IZT9yUJ6EqYretiuxk0lrJpO6LK?=
 =?us-ascii?Q?d2g5W9E4TL3vBb/79kxO1zVQxpbdI5ELhpfI+9HMQNnkSo2xOJGMsaxeqWQB?=
 =?us-ascii?Q?58cX+vydMj2ARUaIefOlY4o+tbuyRX3mgzoyijLbS/OgUxdoXCRd7eSFOtB/?=
 =?us-ascii?Q?d5bTOkVonse1Y3h2W0Zg2Drt0oeK4iSrG8Z+zWNSJMK6UcLmeKsAv09glLXd?=
 =?us-ascii?Q?8vIZtQzt8w8IxSQAaT+Ad3RnSN8h3gzEX0NfgtiUgceF/YfYFSdlefSVvFgV?=
 =?us-ascii?Q?szDldG33V7jZ8xLy9ddJKQr7yU8nn2+NsmzIk8/OVcds/ryV4ohO36fKoZvz?=
 =?us-ascii?Q?aeKtKsBqnBzK2dQju19O/FjdAdN9vYwJ7WuVGCKuXUjd1hh0KwIRcl9OuvC0?=
 =?us-ascii?Q?M9S+Jor+7pxVubgfB3ba3mrE9GQSzvgV8w7ZdH7QWpqm3o7bE1JKggoyXlCH?=
 =?us-ascii?Q?wYbqCe1gfv5S2YAW9LBKNaABLnMpceaUB0CWGPOVuiX4p+AHM4Yhi7xsqf9V?=
 =?us-ascii?Q?OWef8gJaZZbY7ZA9sgsF0/Sp82vZn2LhxqXWLpPXo2I0IHwizIG+q0rkgqx2?=
 =?us-ascii?Q?hiUizrbjfK2CmZmSnCADJctrW9OMxQs/W20S75A+T+l5mOW7XRZbc8+WpURO?=
 =?us-ascii?Q?AMNDIM+0WPHCaa1e7/mg2FL4tbJB51NoFMAxrWEBsGhvIy9qgn67t4DYVOrC?=
 =?us-ascii?Q?XZ/m8/wtW+XrRPcE8RYY6sxWR+5sDlQWiaScogXzp1wBTtsAaXjDYt4JfqcX?=
 =?us-ascii?Q?SyW64B/od8DWoCxuRyrCuZV3C/1mqPqjYvXKTcrxj0jphEAOQwgitrWgxdri?=
 =?us-ascii?Q?CS3ZkcVepZad8n3AEwLdqT0xizil9zj7SUdP3l7mUAfpS6q4yFLjjRYISJwe?=
 =?us-ascii?Q?/tRnrNi4KVPCAx0f/fzwxiIJORu5xiRz3fCR70UqKztgN1zSvWk4t20tXqNl?=
 =?us-ascii?Q?hQX1T3oXSIizAb3TfAYQ1g712T4ISbOUzODHEn9a52oNFxkduki10c6T9zWv?=
 =?us-ascii?Q?8ji5NSpdpkitlJ4V9EAN2RKHhnbwCEuQ7vZmytd7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c22fbe-1ea5-4523-6413-08ddde62057b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 14:17:53.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZG/dwyIC+4KKlmOJmQIzyUCc6TN0S83NZPd3854cq+LhtFLLKm/ThwcjUnJVTOsj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8832
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_151803_235878_5AA613FA 
X-CRM114-Status: GOOD (  11.80  )
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

On Fri, Aug 15, 2025 at 08:24:57AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Tuesday, August 12, 2025 6:59 AM
> > 
> > The iommu_deferred_attach() is a runtime asynchronous function called by
> > iommu-dma function, which could race against other attach functions if it
> > accesses something in the dev->iommu_group.
> 
> Is there a real racing scenario being observed or more theoretical?

I think the commit message should explain the actual reason this is
being done, which AFAICT because the new lockdeps added in following
patches will fail on this path otherwise.

Jason

