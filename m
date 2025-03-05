Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0B3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNQZvq/N80o7gjxW4EGVo37dW9Kr/ywHTnCVwxM2mbE=; b=Gz01UgIZO2eGODb8bVrziVjOFu
	V9oKNfL2JF4s/dIXksvjvwUHJocOk3blcVClOD8UprhmlnXdX4FjlTIcuo+DzPcj3nkHK2jVL0JiC
	pc2RR3BvxlfOGsrruZ7xxa6dyOVz2qlCcOB1TBfTvZ/z3T75dcY0EeCSUE8PpTecM8ROSRTOiGkLT
	OEhj16E5HUd4KZW/bhqPk7ezfc+N+rLx3jRocYuYtDDYeQcffjsIzeF8gb1upTRjskkL1hWREuOkf
	ADh4vwdvz+4lU8JnVPoiqQCvt69yJsCWAviqFl1KNYHq4QcCGdXl0FTVgvLqeY2RNGayd/s+LMjuU
	VrMm2q0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tps7A-00000008kM1-1N0E;
	Wed, 05 Mar 2025 17:01:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tps4C-00000008k23-27k2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 16:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QNQZvq/N80o7gjxW4EGVo37dW9Kr/ywHTnCVwxM2mbE=; b=iUwdmPWo1n7sITxE5Lfs/r5HvX
	DvbQ1V5w4oIxDCoBHHXtIrDkIO3YxPuYfUXaDFLs/zbOxnI7PdjFbwv6X4zjaxaBiBsyvhBMGZWdG
	9EtL8eyXtGgQCkax7W9g739Bn9MLdm/5PVj6TXRh57RBG1QqiiG4qdlefWcdspLMFg96X++dmSQc3
	sjE6s5XSvgYvQYNjAN8s5mvND2UyCYAnLAP6MdViRFGRApoWCFospn3vcQwZRENqcC/OJLEqf5yZL
	IBmlEKubNwz3ESyVf5mIwRcypDJSLl+KdUzEDvFN8zV+SDsAcCe2klCiXOdG56pzeDEeswyPvvJlc
	lkNFnI8Q==;
Received: from mail-co1nam11on20626.outbound.protection.outlook.com ([2a01:111:f403:2416::626] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tps49-00000000e7a-1pD6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 16:57:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brm+A0lcenHoGR07mXb0TQa8JGMKMiwkHpVFY/bUmL4HAI/lQ7+jHZ5dqAoOZf+Xh6/7zjluSb/71KLjVVAlm+ArecSQbMxyvBJi1fehlLIUUBW1P/irBIM+yRYJIAa/r+pB7ap5M/Eu3Nk82sAPqRsPmuX1FL0wu53fhgSYhOdiiih5JW4vUcHKFWZyk+y71sxYCjPE9imlVklcy5SHcIA0RCfUORGoZoeCn/RrAebQSJgU0ssHGb+pO6Zfh9WeWGIJdYhyA0tYo3lTC9GGNWPahoJiLXzdYu4oFyTCoeThmRDMNnrggUrLHOOC17P5d0TxELd+XMuLkr4hyONJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNQZvq/N80o7gjxW4EGVo37dW9Kr/ywHTnCVwxM2mbE=;
 b=mYlOCv+ELydF7x3PzxcBw0zrhJ5ewt8qP/203UAlv35v/TQ1x4oteK5y6769uks3CkZhHARF+BtElnA76fMruvVSirqIxoLAx05NtKhkaRyNd764UoUpD0pcNBkWHwVPS+YLVgpEFsD5PsjYtW0yqZP7o5TAgJdYtqX8RUoNVtmtSVQF/f1CMGi0KYCIBIWHJ3sLsdHjsSjcjS3IiouWSgX7od3D8NDaSUS+etwelOhY11vHQ5xbx9gFlzd7GXqaqys+UlQhkA1sHSdpux8QxxS4O0G7UNVs9P0oE8OB6lIRUSp8ld8HofsC8a0QNhFxCbGp1WqbzRefaKQi2mI20A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNQZvq/N80o7gjxW4EGVo37dW9Kr/ywHTnCVwxM2mbE=;
 b=mQL2idcEtRNivPg6GDhG+G+Uxph/7WCu9ISqtTx2EsaPLkSNcEgsi8GzQrP/bc8RLUlz9BuTlltdHbHOxhAem3xv5pipHwSLUxGVgy7d0O1eXAnj5dCc7xlGCHkbxr1bfM3IUJLfWnzE7fJKYauUX/n3YkMzRJlQvDf4TlF6yzWqmyMgHdnEGsCea4p4J1LIWJ2VqI/Th3J2k6A6ZkudKgBKInPxnvUFG+DdRc8116CHR9ZHlAuKNFEQXd5FfJOYfhrbrugGAAkLIDCh4EVxocGMKImes1At9wrdiVvMvgM0/Vffd0URtZ9LM0RcaD2swa2pM0UzSn1RUoc3DKjrDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SN7PR12MB7979.namprd12.prod.outlook.com (2603:10b6:806:32a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 16:57:44 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 16:57:44 +0000
Date: Wed, 5 Mar 2025 12:57:43 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/4] iommu/arm-smmu-v3-iommufd: Allow a shared
 s2_parent to allocate vSMMU
Message-ID: <20250305165743.GA133783@nvidia.com>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <564eda8dee4bbf4c6e1d1dd9ed6bd40cc1a2df26.1741150594.git.nicolinc@nvidia.com>
 <1b51a7f7bfc0419b8941cf7ee0601b70@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b51a7f7bfc0419b8941cf7ee0601b70@huawei.com>
X-ClientProxiedBy: YQZPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::23) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SN7PR12MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: dec68738-8fd2-4169-9868-08dd5c06d955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Oh+lEfHMYF95fbhTHGAj7KA/GRA+SXqwlOedRTWRkgKL+Kxp18Dcxzzls1HF?=
 =?us-ascii?Q?Ua2IV0oKwyTMWKL6ThxfW+cas6O12stP6wYnx8YTRtz0rfYQprNO9MgM9s9i?=
 =?us-ascii?Q?VCL8Jy8F/9tY/A08crUTGTdGkq6cVORObLV1WNhwaZtB14GNEtaREv7gCtNR?=
 =?us-ascii?Q?seiXkP/9qGnVIKEkvJg936m55HInvFH4t7p7XlpjBn3+or3sG2v3rt1H2E3f?=
 =?us-ascii?Q?JrismfWrblEQYD0cjS8SEVl1JTafvw7+MGNApRmxcmnL9ivOnVH0m3DmjRDB?=
 =?us-ascii?Q?X/P2DT6UGIkqST7dGyrU1yYoVGOEFp7/AjWaxjBofEvju1zW+PiPh4bfywyN?=
 =?us-ascii?Q?I6xDwa+cP5bXMZHXv9QoeUCzQ5ThqCt/qp9EF3/ffOoL1ouMfJs3t6r07Pc7?=
 =?us-ascii?Q?AmKsO//tvREGtJNK2+eOYf6nEki683waMgmKaD7fSDJFTvfvOqxA6ybggo5q?=
 =?us-ascii?Q?XH0pnYg1qsh3IIMaUXy/vU2djSSCTjQEnCoV/rQ9LmscWn/qLev5TkcKYSFY?=
 =?us-ascii?Q?vJWWzvAF//yE7L5nmjfFPp+da9WgE/hIKXYdmcyQB6bxfONJ+/wN93tXMa4D?=
 =?us-ascii?Q?zlTkAbv+z2eXRwR7NNkiffEYrmuwV6pBfKM1WhhROfzEyW83r31S+0+thucm?=
 =?us-ascii?Q?MMDd15KzjHhnwbJ0zHkyg/04m2LAC+/ilL0P7dRuKtwkFTeITfVvd4azbsvI?=
 =?us-ascii?Q?dggl0E7vf6splpncaQVPF02zMUkSSX2RnYKrW9cxd13Y+H2pbUhCLvnyC2zy?=
 =?us-ascii?Q?nwJMaGJhPa9OWUjEwop97Ue9xnLavUZ7k2gRjvTooXTeG1rWmdeNK5j2X2+p?=
 =?us-ascii?Q?s5AepcZ2zJb2vnI23flKb3yfTmsmyOErhGTIl3ZLaGoDYvZHhO3j2idtcHuU?=
 =?us-ascii?Q?Gae4x+Ih0wFriiMxQxDdHi124Gf0l0hnB02AM3w55XgJNyrI20T6gUU4W2E9?=
 =?us-ascii?Q?cRICAYf37uDzIWWV84RqLERrhgIq9mS4z4P/KUz5HoImF4bbnx4mDtkbXBBq?=
 =?us-ascii?Q?yZArJXA0hu4DOnEEoKUGxTEOE6gLxRe8XO4PFQ5hZjYGyK8EXfsJxZWMORcW?=
 =?us-ascii?Q?4fgTmxToudjYcNsBrYxPBcz44a94c5q/omP7LcRh57C9r8RrBtb5LzjueSDL?=
 =?us-ascii?Q?094V6VHREcqi8Mp98k0N5+JlDNLhj+ToXZ66uH8NxJSjP8LFl7rvEf0BMT/+?=
 =?us-ascii?Q?Ny8jdBdd5thdjXdVbB99dTyvbEOCfMGIlwwKbscHlRkA6Qz3tcatrbfCpWAL?=
 =?us-ascii?Q?CieEl3nZoGAOM3GaA0TZpEaCf3SdiAVBJZ0eVFb8kHstYoxPpPuBZ7vek1wn?=
 =?us-ascii?Q?0c9aJZl4m3VUQUPUyfI0AanI4hVTeDVq+YQMNAG6f9bbGB1BqHgzQqEjjtzv?=
 =?us-ascii?Q?ToNGfld1OM+6J9lQY/gVzE5f1NJb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3FO5XKMx0UHFbQx5a5Jb99I1PVgejM1jbJfTLNq3FzK/KYW2y4bqzfTa32Su?=
 =?us-ascii?Q?KnHD9Cd4Rcv4iz9hSarDP8dI62kmpxbcg5/Isf2LrLxk+0cFG/3kxrSNjQ0N?=
 =?us-ascii?Q?aesQ6SRKx6Rjza82T3JCXbZbyDG6JEtSIXdwnzK02kUfJUBwBGtnI/CHM+O0?=
 =?us-ascii?Q?b3RC9slfZ6C77tDfYDAAZLkZULSGzrNg9qCG46suQygj/OcsedDNhoZR8p3B?=
 =?us-ascii?Q?vbNY0yzDS6yMJdDqXOnNUf7rkfMn9WKDU8kzJSD68svLF5ZOW2Vb4rTS2C75?=
 =?us-ascii?Q?6ciOuoF4si1Br/aWU7IL1v796RGZbRq4E8r4tKBLAoGwhBBLU+20dRBJ+JWX?=
 =?us-ascii?Q?xi0XqW5yagA9DDPLpxBW7tLBFXIvtMmZr5heNVU8cQo5ziKUeli84eDXOXI+?=
 =?us-ascii?Q?BuWshNQUWWgTmxp8mGZcmiYfnzV9W5oiLcw6F9XhqX5FjpX1J+AaCrPFHNuR?=
 =?us-ascii?Q?SU1O5D9rWHBxgTLWC4LRvFvUWyhZOyNqgXumvRx4tdWdmpwd+n86d6fhWjwZ?=
 =?us-ascii?Q?x46q5KW3xocXsgrIecg9GHX66RD6dFtTkC1U7BZSoVIcfBpW1SLs0k1+x/Fh?=
 =?us-ascii?Q?hbzw9+UhLVLHSWOcFl+iSpZuKbdEyI78GbJyd6/Ib/48k6VGSn2LHoUq5bu8?=
 =?us-ascii?Q?mu0LE0DZNFtHROC8OeKGZl014idkp700BdeTj2mcTDYBea/M4phH5YwDsSIi?=
 =?us-ascii?Q?+byXZKQm81p+yvz0aVeMMzIYwjoYLla3EUJ8fWmKCoTBTPT9vj5VPyiWmMu8?=
 =?us-ascii?Q?/P6x5cJ+9PZSJgk+w4LZAf7jMWmwgzlJACmvhRec7TzHtRsR6boi6xrTcgJJ?=
 =?us-ascii?Q?HgPDBRdqr2kVhR/+DlvV+GhljA9e1dRE7sYnHGUZSuDMD4q0s5iDKPhNLg3q?=
 =?us-ascii?Q?eX7gMaVimabKuztQmWpN0c6TxYKDX/jKOgLlnWrRBEUy4YVvAK/F4MsIDjLO?=
 =?us-ascii?Q?ttpzDUxqmRIYxnfzll0mJnbB+dXqUj7bMuSVuqvrgEOMFRGKtZ25bAxtFvJe?=
 =?us-ascii?Q?c/C8SUl8qQdv+pWnb3mUCHCEtcm/gl8lVwONCWm/LckQB2F+6DDa/yx1vzCk?=
 =?us-ascii?Q?IVoLic0Rd21XTc/XnZJ7j3NSjHNlBlMY26rfnYvawHjXx6/W1fum1AbbtYSg?=
 =?us-ascii?Q?CC6g7aZsKwqFII8PGZv1uQpIBBAXJb0muhfK3j4nu48btEningN/wcbbvBo9?=
 =?us-ascii?Q?7FoibN2ehcGjF7zOQ33d01ODDcHOIjhVg2a1d0rZadzNxIuUwri3xlOC2s4G?=
 =?us-ascii?Q?KpNSiVLt3jWTUT8cVylrSQYr7kOBpWapf0liKfK2yrCq9NRcrRAkuCMIJiVd?=
 =?us-ascii?Q?3QyX+dDI4PtLiHbljIh5zIcgi5QBA9EKGmXk5J12GWMW2iajoKqrc62NjsDz?=
 =?us-ascii?Q?W4PAmZYiRU+CCadubguS4uUMY3VWmkEkIVZ10BOUFKpfv+U/FcLqZnILdo1H?=
 =?us-ascii?Q?3DfPzy1i/HJVyiMgDVj5B0j3deCaHk3O+m82Vi2vJveHj6Xk0zRMIaCv0JiN?=
 =?us-ascii?Q?NSmI2lfgkCmfAQygMYLuYQiPHrJKYnJjQKnEO3qK0E9lGRgom6mQH7wHO2Uw?=
 =?us-ascii?Q?Vx/2cxd1UAkTmIYZYFWaiSck55xLc9ssXMh2bCJR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec68738-8fd2-4169-9868-08dd5c06d955
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 16:57:44.4311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UbadS3tabyUntmjCplDO0w5It0GYyBDp+3DBFNTQlnJiG6vRDVQpSK0GZZUrq2i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7979
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_165753_787826_94F2F2EB 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

On Wed, Mar 05, 2025 at 09:01:40AM +0000, Shameerali Kolothum Thodi wrote:

> >  	if (!(smmu->features & ARM_SMMU_FEAT_NESTING))
> >  		return ERR_PTR(-EOPNOTSUPP);
> > 
> > -	if (s2_parent->smmu != master->smmu)
> > -		return ERR_PTR(-EINVAL);
> > -
> 
> Not sure we can just relax this like this. What if the two physical SMMUs are different in
> functionality/features? Do we need some kind of sanity check here?

Yes, a function to check if a domain's iopgtbl config is compatible
with the instance is required.

Jason

