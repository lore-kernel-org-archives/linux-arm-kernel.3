Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35A8CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlKDrFNubYB4kFCo8X/HkqNmgpGVrtcQsxIy8gGI7kc=; b=k20/2bOPhMmasdxl574pWUlk2p
	MfgWdHVWI5mM5zrb9WwoYNEisc7wfVOPYNnTN1JIxME040dQu/JOObuvL11ZCOr9TMVR6V2xzTlwT
	8U+GWKCxgJPB/x/NTWPFmSkh2WaDGU1UPL1XwTrsYGGtKH2RHcpwAmoxm15oK8FEqe/lI/DNrIO27
	u0kKYL+W4gWIeHfGcNBohqar5M9dNJG8OOOH9vFlfHzD7haxbjZZ1vyEkRjiZc1VLMcDmj+m4WqdS
	9OyjXELg54LwsjwBJz3e4uXWq6P1ar5iiho8ueJ9haVkPukaMfxcwloTCDZ32aVUif6BwVST/xlCw
	42uAMfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuuA-0000000Eewq-2BTa;
	Mon, 20 Oct 2025 18:46:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuu8-0000000Eevh-0Zyi;
	Mon, 20 Oct 2025 18:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QlKDrFNubYB4kFCo8X/HkqNmgpGVrtcQsxIy8gGI7kc=; b=q7CAONDOzhcr839g7I3nX6RIXg
	mxRZx0kH1+IJvJxd7xUc8WZMcCiLVwesiUDjo6p1OsQT9TpZyU5gOtd9vS634jzyW4hK8WCZ9Mtuj
	fj39yM+Y/g9ivcOkD5djGRA1OEdQf2y+WMQSivLl2FSUzkiqyy/o/eseh4FkbdK4Ec0z+A+rOPIMT
	QFsXT1EvY166ZcY4GI9sOkBMicD78lfxJjV8gvyc8n5F1NBmJvPbE1Nrk0LZVpcmV+aUw4UwPcv7P
	e6FMEA1zCUQsblARZExlvwQ3O38LnQn8d/pxZtT7n2a6HxRDnqn9Pp2l3xpSYBLe+3+6gISqY+9J4
	qADJbsTw==;
Received: from mail-westus3azon11012004.outbound.protection.outlook.com ([40.107.209.4] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAu2O-000000006il-3bty;
	Mon, 20 Oct 2025 17:51:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sX/Q9Ne89Py9vBl/xIKkxiSBsDSdkFhbRz440C896WGEA3M6MJniz/3/05iYhIBxU37PosRwP3UCYMHau4+ObrVz78hk2DNq59qB2P20RfkS8QkzUQw8cLrt4BC38rKUV5W15MNYwfML5y465H+84xCmmPijQjQEz3DtXvRzeSOIhSEyZuHuEQJGBxijS1eICKY2B8RpsbPr+I3CgMEYvt7NzbouJA/Ft6ngHJq9U7dsDEPU5EnnozrB+FGCwjJqDk+8WBlr3yZdtj+Q2KtsNAa4VNucwpvAwooS1R5qeaeZMEEOPbzRVQj3eU/s4RScV/6QUtlhVYmISUJ34PuPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlKDrFNubYB4kFCo8X/HkqNmgpGVrtcQsxIy8gGI7kc=;
 b=jSfBtUrsTCvX9G5C4IGu8ZAI6WUvy2ba8kkMZxArgtFgU7gBkNenHKveQ2RGZaoMJQmuYFALAlKsT/4Bx7NdZaYmJV97pxidSOK3w/6sxLzT2MH1nr13cDt1pbJ5dBngO5pYUaPHKImuxeiGutjWFEFx1TQyeY/7yDbCZZtSEY84ihQFC33S/klL8hBop/oqepH8HVlo91zKY33K3FAjb1qJ4PKOMOL93I3R2e36OkEds+feSpZlBFXUKh8wQzqViRHjkxJipJeJ0uiynfUTGnSDksHt36UABmuSAmVzMoLSURUX1hho8LliLQ9bsQTERVoZByYE9YiCvsuhf0BJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlKDrFNubYB4kFCo8X/HkqNmgpGVrtcQsxIy8gGI7kc=;
 b=hi9Z3HTDmMfcSvww6gei7uln9R/6tKyOSMLR/gBPpvCyFfpf6mtDFLT78tTNZvtVPdl06iVCEmO8QrignbjL1HEDo6XNIwtQ+1wGM2wUAqZqFmAux6EdIuZHGEqlNhfl8/tPNvO2+FSLrLjaYDFrF9ggFaqYXW1qIZbSi6NeIElztVDzcmvw3z/v66YQr5kZzpqpbz7wi0yAjDOyXaM76hhNhn9TJd2iAJWebG3D5kGrdF3VYsLAK0mD4V0jo314EGYcsMsR7PqsWE12eKSU3qZSg6nUwZJPcGrV0jukj/p0hfy+ffvRvwYqfB1geY2Cz3kP8WfLFs3bU1eZ38wrJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Mon, 20 Oct
 2025 18:46:37 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:46:37 +0000
Date: Mon, 20 Oct 2025 15:46:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, kevin.tian@intel.com, suravee.suthikulpanit@amd.com,
	will@kernel.org, robin.murphy@arm.com, sven@kernel.org,
	j@jannau.net, robin.clark@oss.qualcomm.com,
	m.szyprowski@samsung.com, krzk@kernel.org, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, yong.wu@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	tjeznach@rivosinc.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, heiko@sntech.de, schnelle@linux.ibm.com,
	mjrosato@linux.ibm.com, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	jean-philippe@linaro.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v1 3/6] iommu/exynos-iommu: Set release_domain to
 exynos_identity_domain
Message-ID: <20251020184634.GC316284@nvidia.com>
References: <cover.1760312540.git.nicolinc@nvidia.com>
 <56175bec385d24af9eb2a38632e1d6ce889025e3.1760312540.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56175bec385d24af9eb2a38632e1d6ce889025e3.1760312540.git.nicolinc@nvidia.com>
X-ClientProxiedBy: PH7PR17CA0071.namprd17.prod.outlook.com
 (2603:10b6:510:325::28) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: b8bea0bc-b61a-42f5-f73e-08de1008ff56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eH+aA5ZdAVIzLAUfwKClL9Z2cbLxgoRDXo8MM5xy2Z+rRh2LwS22yYSh4AGr?=
 =?us-ascii?Q?w5u8mizRboC5pb4mXXyporkPKNqe/nRxEKUlacOmt6kF2XZ2ougNsmdwPZvF?=
 =?us-ascii?Q?WkROpBX1GkqgcBKU1zO60P2dypKZWpUUpYMYWJCJDxdgAVKWUUknzxYxEEoM?=
 =?us-ascii?Q?Odsh8LskZKygySJa2LrIYp/IZZ/1S8jfeMKQpOq3dcJfrYyC7R5aN2KMK78z?=
 =?us-ascii?Q?xLg2muBbpSy+FdYG6TyQomyaJau/qJHQR3j/5ZnT6r3pvD1TzbWlFUtoFtF0?=
 =?us-ascii?Q?ig+5e6rOwpdOspKuRVun97WMAXfEc+rBQAsw5CDjWjNUuIdWSOUWaR3cVJia?=
 =?us-ascii?Q?fUWKNFzdSn0C6oyfbO82By33aiQCI7UEDZuYvtXSJKM9lnoIm07QULEm6ph2?=
 =?us-ascii?Q?mOSlzM1afb2WGUXelsKCTjvZFcOxvf+j2KoPjldoyQjR0G1LHRum0on6uUss?=
 =?us-ascii?Q?yqPErHN5HQCeIlZfCz5+j2ILKpoPwJM5CXPkTFAhFREzYgy/2RApRTFtswwp?=
 =?us-ascii?Q?WV9eT1BMJgpkl9EX/Q6YHKOYRPlcjTYQemoGDTkmmcuQeZ5Wy1TcnfH3WWPn?=
 =?us-ascii?Q?rDvZmcYAjIiJplDTCcbjrU80uQKqKxXRl1vKNzrcJr0Bdt2QogG78le3DXUV?=
 =?us-ascii?Q?I8XQWTGCJFb4HaIHy2ULk2OG71jZGcyQsfH2aiOjwQdqMVXRiUaFH4mMQAkQ?=
 =?us-ascii?Q?g/zh5r6RrUCM6f1dyM8TNKhSvVhzw2zpMLsKMzTdB8r0pFVwUxihvW3QUTym?=
 =?us-ascii?Q?HnbVT60ijvYxr1B3ytD7/RjHXi7QkyXVuxXdLv82SKipRU+w4ON2NL3f5RbG?=
 =?us-ascii?Q?wVMEnZHD2zdJLIxfdvMlJC+eS2aOVEghWLWfn5B+jPsChxLBLJZLigLCqKUj?=
 =?us-ascii?Q?FOPSYdLpXrD0M0PLsVwFP5xyTc0HaAhAS6KlAvbmy739pSwSkQRGibProazq?=
 =?us-ascii?Q?h9YRXq1ZRE+L7t/936GzkfplN4ULKOaKHk3sOCWI1AEp67VFNNEsP/eQcd0C?=
 =?us-ascii?Q?7oZXou/3NXCo9f9NlZk3GkrP+0ygqY5+kN/ds0RlGxc6AlGH83w3vRTiI6al?=
 =?us-ascii?Q?PCgonOWUKuo15ZhxTiCmh8VmtuHo5XbR4x1j0Aufuiz0N3F7cFo3hksis7Sq?=
 =?us-ascii?Q?hIGXLzoehtwyKPPIFtpJoQT1X+iSf+lXJaygk/NMyTOiqGuHcIJNecKfk/Bh?=
 =?us-ascii?Q?7wN3vIiMus2N7HrOeKy/+2ncjABvKHavgVylPqsFtGumhKzyY6ewMBbLH8o1?=
 =?us-ascii?Q?Ygiy6L/A7w3jOO3oTTzlwlyaPoc2pIq2EItU2HkuA6mBhmRFCZF9QkB9Z8kF?=
 =?us-ascii?Q?a4J0R9r1CcQgODbLVVWZAY62qpGuzsc0/JYka/vrUYNvxbXrQexmsVNUhuXS?=
 =?us-ascii?Q?Zm5iNVabSw5B4CkEbs2lVVL63Iufi/gPhlgFv/6BJclk7KVezFVpBXnBKZD5?=
 =?us-ascii?Q?wmMLHcQ65JdBIzu4SV4l6wb4DpNFvBmS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yIcwjp4PNLiFksovyw3NXB9v1GW2rmYzjT0aYOzdlYPyW8VmptRVEaEqvTVn?=
 =?us-ascii?Q?Dz5rxN2mlIF80QTKPhyDtQqT+nxso1PQK7UDl8LxbrONB/KA4c2reDY2+WyQ?=
 =?us-ascii?Q?NrjgxlWpTLO7sEi0SSXxamwF5kxUjaJ3c61WkcP/mZ5cls86sICjwMxGqO/G?=
 =?us-ascii?Q?Khnb0+e0FJNG/EzD48yy6sbJt8JrthmW1LrS7ywk0mCN/LQ95mF48ZovtWcm?=
 =?us-ascii?Q?uduOdmGM5VRdPBbQyw6zXYDzsfH7csJjFW15BWof8pVpYAkFU1FXd4CTwFpF?=
 =?us-ascii?Q?gzKG3htQNYfeoj3eYkxVLrE9PfNHNvfVZAcz7IGGWTRUDVgwyeblqO1xWTW/?=
 =?us-ascii?Q?anGdI8VDyIocLVxwbzspgAUGCNOdfldjI1KSx9tn088RrhmIg+twLwflQpsG?=
 =?us-ascii?Q?OtnWZOShfdozIntsOCanChqhauXseo7wv1shh9nNhkz6T/g6TKGGxcGltwgq?=
 =?us-ascii?Q?xvsmpj161fN7m3Mo9iZ1PmVezgA4MrVpIIxA7JsSsBAL+qlvB1uIvGt0sZcy?=
 =?us-ascii?Q?HcCDAhlci4PGhdqhqnX4tj1oFiJLONjPa9+tIVK7oAH4HTRqjks8xsoyLmXK?=
 =?us-ascii?Q?zMvNKGbtjGyDQtKY2SFfCnujamZ6HnmL7VwWk6KoCSzEsjZJlSRwibH/Rwcw?=
 =?us-ascii?Q?Kz9ykq7mmNc0Vrtr5WeVYMdIcCjz5HgJGID5jCa/qOzVkZcgkLGiIrH9lArj?=
 =?us-ascii?Q?/kgEGLvJ5LgtMPPW3khfpzXi5yjWosZDb1tLOTcUdeoSfgLmOV7hWQpCah/Z?=
 =?us-ascii?Q?Qynd2E+5L08FVOl7/OitAmeCPzSveYgJhM/gnIQDYQ0Hq0gHXBrQjuzyVPUi?=
 =?us-ascii?Q?aKOupGgdjcj+6qcyK3n/KfwTit7E19xIigiBLI9jDo664Yh32m501lDnrSQB?=
 =?us-ascii?Q?P9CaBqxyIUcgTw6jUprTtdI3O/y2c6f3e1OD9LnC33bwVXtfU+lB3+dCc3mh?=
 =?us-ascii?Q?j+LDI0YOxa/UrntDgpJkS5UYkeHrqrzstum1ACIScvrgrrjWBR6R70q894OQ?=
 =?us-ascii?Q?gq7IQ+DdviQPU5J+PU4PwzDdEpdAIRkSwmU8mNQhtwKV0AcbgXzBMu+l3Pr0?=
 =?us-ascii?Q?/C1cf5nzofyVqDD1QcMT9kbVfraNihGZ9zXvglFrO3tLPDHWNhaa+CMewPgb?=
 =?us-ascii?Q?iAWfKe/DRNhUt0Gzz5b+rqHvo0kFTdPi5dd3UccL69Fm20cJfqRaiDaYfzCj?=
 =?us-ascii?Q?eEXnE6/UWs2dZzHBKFUGKMA2RF/JHxsRdRe46pLlbdAsMsaf4zG56aRu3HKQ?=
 =?us-ascii?Q?Xd0mJ/jabcptKWJRAgnE47NJnAOAB4WcPevCTDfIVt5h0ItBsLfzL787qMXu?=
 =?us-ascii?Q?qGJN377OircZ+z6FQZ6j3OFV6OO3c5rhGowkpGWVWgQhdSuItVY5V86KxRuE?=
 =?us-ascii?Q?/amx8FqmvyDFngikWH1Z3NYB3L9dx8Mlce8vOimNKhLrPwl4srr3BBxVVe6q?=
 =?us-ascii?Q?u4UhBly3ZDCy+z7ok9qt04g1rVDtp5V9VrzRixWn2o+hyfGKfsvUo4bDh3Bf?=
 =?us-ascii?Q?/ljIyWwlSBZPzpxlBeLUAfEga09GstRhdbFDKTLealUWGKDVfz1wfmBcA/CK?=
 =?us-ascii?Q?PcKP+9CVTCytGI7kHpw236QQiYtYEa/vZgSwfuvX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bea0bc-b61a-42f5-f73e-08de1008ff56
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:46:37.7179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yg3H/22OZAtarxrmw1t+Tsv52ff6DL+DGyG6ObliVvG+RwgL/6gzIgt+FnRnfLD5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_185117_056368_ACAB9C72 
X-CRM114-Status: GOOD (  10.60  )
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

On Sun, Oct 12, 2025 at 04:57:39PM -0700, Nicolin Chen wrote:
> Following a coming core change to pass in the old domain pointer into the
> attach_dev op and its callbacks, exynos_iommu_identity_attach() will need
> this new argument too, which the release_device op doesn't provide.
> 
> Instead, the core provides a release_domain to attach to the device prior
> to invoking the release_device callback. Thus, simply use that.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/exynos-iommu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

