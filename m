Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8214606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dQmY83Tz;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Kv+QQ8DM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZYsJK9DZp6FZSpfbfNmBNvtUH4DYpATPXfy0vHCOP0=; b=dQmY83TzErXS/9Xozne+oQKfiX
	X1i/jXxdK81Hmh1mwUCM3DqNYlIiH/5oGQWA0qDa7n1mH+IBxmafT4q6d7peuDw7Y2v4ICW2Ec5Mk
	U/va9ylhmS+Pu+VOQ1xAkz4a5w19cBhr/6i/u07+BDP9TE9Yp7lNpT3R1NnZ3Pw8UxvnTNfhxsk5F
	v7AFAQi5nnUIkD51+HjxMOFrFobqCNQ7QYtsMHcrTB7gNArHtou2fOVEhh4KBlhQ0jxU/Sk5kw0s3
	QicmXTOlKD3mvkLavBLsp3dkRKjADv3WVkzDyG55pKBL91SGj+mVPKq1/EyY1V3pqDaJWHDvpB6d9
	t/u5vY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDBv-0000000AHzS-12G5;
	Tue, 20 Oct 2026 16:59:59 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDBt-0000000AHyK-0MMV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:59:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvZuD1dImgrMUMDlBJDi2cRi5NkDxsmViDT2hm0S3EDlg3OMulT2eyA3VLn+t0y/zC1l03xUVvPp4Tp9RnfMKfMMB1x5Uf0oEtbQuUwwnt1tAvuQyWiPWYx0MszTInHmPAGPamV6xaXkFOPuv+fQBIJnLlwaLvl/g15dfzAeBEC/5G2L4Vni/ff+oYKSyC7vxEZQPOVeXNI4pwxZzAHdlhKxbQzbXJW0mvfqTbGjhyWsGQblisP0n1/vCO11XDXKlBkI7dKErgEdus0cqZ7D2SpFVuc7NcXl7jgjZUSjK5k98IMM6PGy9OHyzVl8hrSVNs1uFoz1w2zDWVQt/kgvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZYsJK9DZp6FZSpfbfNmBNvtUH4DYpATPXfy0vHCOP0=;
 b=iXuC3jdLkw9YJGNNynhAi2oHXAU4nqg4ljRX/l4A5OMvUIw+DpvaI3WruFTIT/TG/WWjjfOztLGyJfAqkRYZ0WuwvdvKAXfPdt88Xr/G8+RKXqVJCGtMW79REJkfYgxWikqdPrADD8PKn+ratu/+XHRazbh4CI+t+XaHITmJs6pAYdkURZAaVf9mD3zbFOgH63YbsOMJv8KexjJf0iGUxB+B0U0hSc29UlxxjQJ4VPDxPE2yHl14PFn/P2HkGC6Bie6kf1/OUyPOfQjtf2Bvkxi3e6n7c7MehqTkXyTZzxgv+ZqdGRMx8TbPxFCGJgng4bO8RHojtmMqtcVKn/b0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZYsJK9DZp6FZSpfbfNmBNvtUH4DYpATPXfy0vHCOP0=;
 b=Kv+QQ8DMmw+1AA4s6/45thICu5kMKlYlZoC1XEQ67c/nuH/Y9Kb+Fqiyf9qZK9ubyT09sfHrtdThwaxHBvRp1+/Irx3V4w15bFc/8b3t5EJe/uEVIG+E2bod3P8Xasf0iaTp8WaTyxzZr50Sg89FFjZ1PFW/IRL/9gaVJn7gU2Ltjb6UQY7OYNgEB2j6dbJ2Jq8aQ5jlCc4Ofss8BrXHHbFIgDEJXnx8KztBuE3BieJ7VIMal0+ybh8pjqLG8I6a/2gApAmP0r4/UNJvSxooHGW5PJvi/4cWJn+1rz9Qct0gtJNFa7SeqrKbvLSIrv2mOPx7+rV1lps4CAdS4nK+gg==
Received: from CH0PR03CA0412.namprd03.prod.outlook.com (2603:10b6:610:11b::24)
 by DM4PR12MB7767.namprd12.prod.outlook.com (2603:10b6:8:100::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 16:59:39 +0000
Received: from IA0PEPF00000039.namprd03.prod.outlook.com
 (2603:10b6:610:11b:cafe::88) by CH0PR03CA0412.outlook.office365.com
 (2603:10b6:610:11b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 16:59:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 IA0PEPF00000039.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 16:59:38 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 20 Oct
 2026 09:59:14 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 09:59:13 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Tue, 20 Oct 2026 09:59:12 -0700
Date: Tue, 20 Oct 2026 09:59:10 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <praan@google.com>, <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 05/11] iommu/arm-smmu-v3: Disable the EVTQ and the
 PRIQ in a kdump kernel
Message-ID: <ated3gfYqw3QC0+G@nvidia.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <fdebf9f372ebabd7a44581a2068d6fcbff058783.1791226953.git.nicolinc@nvidia.com>
 <atdPBqd1-xLNZ1hs@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <atdPBqd1-xLNZ1hs@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000039:EE_|DM4PR12MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f7e9aa-af69-4744-7067-08df2ecb8710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: OeRR4KSRtlpvu9DstKF5L//G3nTduch9YMbh+Db6Ks4FJMu2Nf2ddPz2FZEnA308PrXQY4jHGRSihp9M2F/HeA+jfBCvdNcGj2Nh6qCjnEFe1qJYrrlrHU+yMdiwJnc1o6bAWcE+j9YB43PofGNwHvpCQctIrnmcFa2Eo+1Jg8rTSxmWUw8CZAwQ25MRP9SWd6D8hR+VZbd6FYZ+xoRPni8ghSGIGk/P2vq45mQYlfJm7VcKZwa+76dCq2A+ALXxDvRBCCfraTMbHtUwXkXJDDiGZ63WlNqJn1vR+S0kk1F5dxnYyDwRTRjzaA2/FwtWUVFCjltOlwK3myySbEHYMXeYIkQpUUDb9si8M+pNvzkTzMFrQ4nzCpNz7gfmsIzKFi0yWMKCfRTho1nNU37uwMFxzW5H3iWuc9ddPTh/JxtsZfjsOcs2yqtD/9wWYwY8PjgwDv4Ib2Y27VbOVNM/GFf+4BkOZzG6dTubIUXyy/Nram6/Mhnfrz7eyUcdtK8gSyt8UpeLgHC58VlxW2f1X73nh4Zn0p+JcXMwwK8TMBqkzU6rs3CWZNS63Ml0EAcd2UaNNYTIMw4qQwgUW103O7eO+d0AVfFrghIX32Z2Esdpr9KgHrnplWTeNWs/bKqfyJ/7RFWfZCMhjlXw9LyfZMCBkUTxZByDgnPcYS7nxHq7xgZTAJ0v4sHN6ILHawjV2fyvQpmJLxjBKR61dChU7A==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Oek2teeSg3SXmRLKDoy/zeUufTnhzeFWU+nPzu/8s1XSiuk1PruEsflknj/1Vxn2uh0W1B8/L7mSqp5Jf9TF4t0xgFtgYkLXWxPRiYGN/sCIWHACWo3kkFHHstfJGIqDg/nf2gC82NIfQVpRZFzJt1rpiONl9Ron1m/Lk9MLz9IEWo6HPFo2aXgAN3sQ2tCo68dXwjxLaP5FP85pFl5X9X+glisCdm9iBCBqJ4vB9fytgmds6uTb0244oLQdqtGqWjDGUCwJDRkZq0iC3eUK3alfjbUfmttGkZ3hYtT8MslqGpXyli0/nl9GEoI2ocyHo2TQZmRZQ60uxcgkvA4Ix59W0yIqOiJX8IkD3zUQvSSXKs6zBImj1MhBuRrJTuCtM1cjnNT6u+4faHkhU7+qJnD434eTypCnu57j+whHaZD2jOROPvnu9V7utpoYzpBK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 16:59:38.7346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f7e9aa-af69-4744-7067-08df2ecb8710
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000039.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_095957_126485_0742C47F 
X-CRM114-Status: GOOD (  14.67  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 11:22:46AM +0000, Mostafa Saleh wrote:
> On Mon, Oct 05, 2026 at 12:30:48PM -0700, Nicolin Chen wrote:
> > @@ -5576,6 +5573,15 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
> >  	if (arm_smmu_sva_supported(smmu))
> >  		smmu->features |= ARM_SMMU_FEAT_SVA;
> >  
> > +	/*
> > +	 * A kdump kernel wants neither queue: the crashed kernel's CDs and page
> > +	 * tables might be corrupted, spamming events, and page requests cannot
> > +	 * be served. A disabled queue discards new records without raising any
> > +	 * global error.
> > +	 */
> 
> I find this a bit confusing. If the CD or page table of the crashed kernel are
> corrupted how is it safe to adopt them later in this series?

The adoption code runs some sanity test against STE and CD. But we
have no guarantee that every bit in CD and PTEs is sane.

The point here is that, if one bit in CD or PTEs is ever corrupted,
at least we don't spam the system with events.

Nicolin

