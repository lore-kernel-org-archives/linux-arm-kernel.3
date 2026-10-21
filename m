Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B235B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aCcK8t3t;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aTwg6Qkx;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gnsNaopE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qinLJ3eRQ/tuBpSZ8HHkClQNWeKZVMQnhwuL8f2pSOs=; b=aCcK8t3tMHFfHZEwqHEqjTvJP1
	W96yGsqwDxxjbx9Ywk7HvRYoTbKVYmzQ/EeDIvBePY5lRC30m6cWUyhSzYuEwTmik8Tk//aRdEHUm
	59fIyL4UQOxni8z3+qnjvqcWYWYgjrDRTZ5jJU4jeI8d+0046x9x1AFjLCptO3rNtvp4yjL5JSImF
	VpPcBErRLtNfgfgFrKYHPjgu5xXqaFJcV34HPV0HMGoNYQkVh8NHpGcUHXgXNbdwoySvXz21aE3n1
	FPfdXPBMy0hgMft8LgSxzKb+nu6f52obHPEXa/q45HBksgVVqanUV/Yp2ReFJ9bToOPy/ZuBjKNCF
	NL8gV3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaVF-0000000CbD1-1Hqy;
	Wed, 21 Oct 2026 17:53:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaVD-0000000CbCe-1tp1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 17:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qinLJ3eRQ/tuBpSZ8HHkClQNWeKZVMQnhwuL8f2pSOs=; b=aTwg6QkxnnyPP+oDoVYdJAcFFz
	fq7qX9hqX/0q5vD+pYaDFZ4/S+RMM7uFQ+IAeXGiwOM3xO/boambORBkm7b9CtFspkKJSTEVA8SjG
	XdT6FEytEJP0nHza5ygqycIlLFMi/YYO10zEvXzSaKxPDaKRmY5ScUr7lqn4MlFnFsiVuD2ynSiPL
	96GoSpQuJVrQMpkegSDJWiUC4PrJGmc/m9IqH7KIb3hCFKMI/8i2ekV/3trN0r8HecCkBcaZD3rvb
	q5iBXS9trZO4xdH4DHYYJfqcN018+Rz5C+JglH8ybzHykR05bdEdFnPzSkBN2u4WDXQyMi8YkI3rP
	oaBctgCA==;
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJaVA-0000000668F-3WAC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 17:53:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAkvg3oKfFuHG5WHY6mjL9/xXNMucKD+goq/mSfzCPrabxLgaWAcDLVWZFEl25bRwpTyciTd7CVcogvbGkhohULYz+VwhcdP0TWaYOGXY3U+biYxKOXFh+FvbsMvSWh1Wu3lV3KbHgxbRk6/AvDVBVKDTOcRvBboK1DRnOcft6Jz9RCH8pdYschPOUe3BUru01d5UJ6pdbdXFw2im87790bmZMn6vJVSQLz6OI8Y6XwGmIJgpwD86QfTL3G5X1a1PjKEUhE9RxzNnUNytqMa/3w25AZSw6uLwqg/eqo9/7gv3jHtz744dZxjBh0gkwSi27jGqxkQ7d2fHVs8GfSSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qinLJ3eRQ/tuBpSZ8HHkClQNWeKZVMQnhwuL8f2pSOs=;
 b=tiQQlRiXYcdLcAWRkV8ZHWHH5tlBHnyCWr9aS44bvauIxEITmT7JyKtIklknBmOq7dCG664GDoiENkRBw0kwmMKC/dSEp+nEjmAEmHLxYC3+7gJyyE0pQ6Rc7zfOSRwk1EZXSE8kIG7Ufrhjx8o1x7aahEEwObUyoNWtfhptK6IOep4yxLx6nql/2MOPYJEQTiqjIubHZ67FHJ0fK5j/k1UoJuluMpreyKHmWasGli8eL5gQTC/CBNlBPapQNN+ncsF5NHJNzQhIz95Uif+Nf7xEPQZehYba3S/yvai5QqTWG8IOrsws2d4wx8cxMXBDSZjy8YgY4lEg/N+6AFcQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qinLJ3eRQ/tuBpSZ8HHkClQNWeKZVMQnhwuL8f2pSOs=;
 b=gnsNaopEEQFcl9eotPcIsiqES3LKfBUJtLjnKSJeJgOd2G2QrYEzvF0gvpZsoAR9kp6dpRLsGPcQTTeqJV0cuhGhIOF7Zg3mU0uuBWu0Uai2m9pAXQaTyFr4QAkKM8l6a5Z7MIXilCJ5efc2OmZLxrCA7qHhYD0iMJdTtHwhcp+L6MT262zT/pzkDtC5IUzaZdcbzWYXQxI1WM0H7s3x2S51KfKsq/daN8ieXbfDV/Mzb7GuwY70WRnUIHolAOifFYMpLf4DbqXJK8IW0b8iAPfH4AanWP3IQirSm4dnk6yDVhutZaxjiLNY5MZQ3NRvbqgaENxKCZnTaB3axhE4kQ==
Received: from SJ0PR05CA0054.namprd05.prod.outlook.com (2603:10b6:a03:33f::29)
 by IA1PR12MB6090.namprd12.prod.outlook.com (2603:10b6:208:3ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 17:53:17 +0000
Received: from MW2PEPF00014677.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::5b) by SJ0PR05CA0054.outlook.office365.com
 (2603:10b6:a03:33f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Wed,
 21 Oct 2026 17:53:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MW2PEPF00014677.mail.protection.outlook.com (10.167.249.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 17:53:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 21 Oct
 2026 10:52:53 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 21 Oct
 2026 10:52:53 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Wed, 21 Oct 2026 10:52:52 -0700
Date: Wed, 21 Oct 2026 10:52:50 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: John Garry <john.garry@arm.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <praan@google.com>, <kevin.tian@intel.com>,
	<smostafa@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, <jamien@nvidia.com>,
	<kas@kernel.org>, Cristian Prundeanu <cpru@amazon.com>, Breno Leitao
	<leitao@kernel.org>
Subject: Re: [PATCH v11 09/11] iommu/arm-smmu-v3: Retain CR0_SMMUEN during
 kdump device reset
Message-ID: <atj75zKIeTzUOwRr@nvidia.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <e8f6f198da25cc6b00902cd61bda9e7228cb45ec.1791226953.git.nicolinc@nvidia.com>
 <4b627d0a-b802-4965-9079-44121436d4bc@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4b627d0a-b802-4965-9079-44121436d4bc@arm.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2PEPF00014677:EE_|IA1PR12MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: abaa77b6-66fd-4aab-75a3-08df2f9c2f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|82310400026|376014|1800799024|23010399003|6133799003|22082099003|18002099003|10067099003|11063799006|261021135927099003|4143699003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: Lj1syWANfIvaGWxNcKA48qcCH8YcgJwGEBPOCXLflHPckOgGnijQRhG1omLm9Z1UZU/DaVaxQEyzMFGkRMD3IJcelZ664IQpYw70RaE2fhGeGtgTL7pBzOYtEJXkR1KoR5sJoLK5WWhTZ9UaP85TgIrBKDClt1xykwNG1vFMg04xEcUyDekrRK1lBl49smsZ7Buig+Im5zRtueUFHgqTGnGUc2W5lgnslRjOS7wCodk25hDh4GsjsE4ukL1QcE1bV3RU9RyB30zlq6wfs0VME5VDAAJNKimsJX7HZ5vF7CI74rxPtVP496X3fJJk+mEDS1Apqt+0Vzx2n55/5QauAmUHgyXDC9dHAZVrBQjEyiudVNrrWyR8kv1OkWEUz+Gec9umT5lnmhDVCOwauY4CUquUT2WQ4edz15KMfe5cOEORajWTDPB636S6Fqcu1zS1ktX6PMdJs9zT5+TR55mFYzpwtOaOeF0zO1BHaV9YBmmGzZq3Cy4bwz++g+eRO9/VGUOzQQRPWLLA1gt1/G5/13fycr4s3ljOhG/+YKBi4dmyaVGuhwvxcEJ58hbYpXF4rNoBkErTncnr+2jgwax0L9bQ066qgivPMkShq16NNk+Jn4kQ95eLwHHbIJmvZYIl2mZxldlw0F0kGZjMEu6kwE65WTmtRsRruJYEnB0VE+NRSsHZknhnXGK4fNkWw0MMUYydNDPFxuq9KNVH5MdQtA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(82310400026)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(261021135927099003)(4143699003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bwmzr+Z5Yc7q3a4cWwxG1zataOBmSKs+esVW+c1wIPVERkhwPXkOKGhekffglA+SVNCg+6qsIjDJbQqg3516I7bf5Updi+EZ89mJHQ0UH7OVxJivK/D1Pm9wLAzhFwZlEienoeLngm1s+MVCpgnacxuMqUYqbbwN7HfLBdmj+B/8H+goOSPDpAH0o5JqR1rL3+HHBhlsk0ujQW4T9FYj9tWiP/5ds0Gq6kobV8vf0cH60Y3OAqCPnFn2slAoOErSLEb1FOKuRNI3ZNpZWWyLoZMql/7DdyQStTgCFWwWPyK/QiCK5xuSKJKBZQHW+eE27y7XSw0BoG0+1czMzCd0B5VRk53JwP1vPP0NsXPlrOuwkwiW9e7xA8r/LAWNGMzdgvO7H0JjU7++4opQP+2RQUZjh6BFJbIyGcr5y3tpaaBfkmgclXWC2nclygIhJqu6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 17:53:16.5677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abaa77b6-66fd-4aab-75a3-08df2f9c2f67
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2PEPF00014677.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_185324_920306_67847183 
X-CRM114-Status: GOOD (  18.09  )
X-Spam-Score: -0.5 (/)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 05:53:23PM +0100, John Garry wrote:
> On 10/5/26 20:30, Nicolin Chen wrote:
> > +	/*
> > +	 * In a kdump case (set when CR0_SMMUEN=1 and !GERROR_SFM_ERR), retain
> > +	 * all the live CR0 fields, e.g. CR0_SMMUEN to avoid aborting in-flight
> > +	 * DMA and CR0_ATSCHK to carry on the ATS-check policy, while clearing
> > +	 * only the queue enable bits for this kernel to take over the queues.
> > +	 *
> > +	 * According to spec, updating STRTAB_BASE/CR1/CR2 when CR0_SMMUEN=1 is
> > +	 * CONSTRAINED UNPREDICTABLE. So, skip those register updates and rely
> > +	 * on the adopted stream table from the crashed kernel.
> > +	 */
> > +	if (smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) {
> > +		dev_info(smmu->dev,
> > +			 "kdump: retaining SMMUEN for in-flight DMA\n");
> > +		enables = reg & ~(CR0_CMDQEN | CR0_EVTQEN | CR0_PRIQEN);
> > +		goto reset_queues;
> 
> nit: Is there some reason to separate the call to arm_smmu_write_reg_sync()
> under the ARM_SMMU_OPT_KDUMP_ADOPT check, below?

Hmm, I think it's left over the versions and they can be merged.

I'll do it in v12.

Thanks
Nicolin

