Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA8CC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIPIvOVYTOJcAW060kODWMokRyE5/qbQAW/Y5BLlzmY=; b=HSng/zQ2sC8Iddd1JXND/a2YFu
	v3BCqv0cVT58atVU9MSrFNSui3AH4ixnca5ZSSx4nEVirAqAWNWvO1FKL7cUyyy0Qb8Z7iYP/m0I7
	ZivNnLb1uYtJG1hlGKMazYUyQ3Z+muQeMJGgi+hFGINYS1pbnoZlBUWaexc5BSQFhpwlOA1IbzleE
	yVpRI3vsXk4WWvNHff28Q2ZpKKuGAYct+/t8WQcfcTOsfBl0gfoROHphUjUYglANfTnf0ozWX2Fnp
	7wFa+p7DiSGXtUks28an8WQzPUULh1Eyj3vQyYj0S6/lXONFzwtug30F4c3wBRDrprc/rCUKETQwa
	5yAQ9B/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWBJ-00000006FGI-2plP;
	Fri, 21 Feb 2025 16:47:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlW8L-00000006EUA-10gZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Feb 2025 16:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SIPIvOVYTOJcAW060kODWMokRyE5/qbQAW/Y5BLlzmY=; b=qng9S7y9ysVUgj0UHEtlxpOcec
	aD7qqB5h24XGl6DVoeIh1GNyjW4xE7W43GVinnxO2O2+/F9RC70r1cNnZaA0xPjmc3qGq0hNos4SI
	PHZ1L8tWSLvun7/0g6yIUB/2UiCWbhcCed87Y7DLijrNES4WyTWo0PHPhOOCRGwz1iJ/qIYnxakPS
	OojpsDnr8s+Dgnxy6pXcNgcagwOxVjFF43brbvPdYI1lkIPLmMZ1mtANXh9w+P7oJUIgiDiW1myDs
	uG/8sMAOyg+pTvY82GWt+YOFggfyjDEMnkmFDQJWvUCzmE+81fVuIZCF3HbtCTH5AOvmwSQ1p3tMI
	Qfn9K6EQ==;
Received: from mail-dm6nam04on20615.outbound.protection.outlook.com ([2a01:111:f403:2409::615] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlW8I-00000002geR-07oA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 16:44:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjO+WDqu/3rKfO8Hm8bzOWe/0Tl5sGQj479UEKTy1g6h0sLM7D2e7xdBJ8em8NkFggEVTYrcAytoU+FB+Xcsr2C2MQwktKUi4slMnKxINCRl3GwxxLM6QKDSdPVT66J2P9VTf2u/t77/JHLJgbQQb+xkS3uWHU+cXekSip4wcgLTK+BaUymO7/okAX+kTP8+Atf5CCrfAxU3qpXfSQmVBpt1yypd59hYwz2KcTC9T+gI2GyxpG+2qR4GkEbFuEtU45RHPKFWnS1QzUoHq5d3J7nwOg/mJa/M8AZ8R1s3+AeHn/6aeyb5RPHek7LZhc+G2PIwE31y8wdx18nuPae2OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIPIvOVYTOJcAW060kODWMokRyE5/qbQAW/Y5BLlzmY=;
 b=pgPbjKZ9rz/MldrqS+TuHFccGKhJKklcvQvcfMutIhb4V/6/xUkFhR0FKJZwarZJUtXZm5adqg8bhJTCr7kLj36CBRrsyT3a4/q5c2waNJRHglIvFxi3kAMXCTIF976fXukPpRATxPksAO3vea0mFB/Ki50LlPzUHTb5Qc7p7h6K0Z5Of4NEOHIWoKAp86MISUno7mkX7L5ZoUtGWeOpk4J87KleMCuKq6MdK9OYso4lusB09UziVNyHuWPh+S7YKIxHxRBZqwCMYlRNBX2gDpaU8ZB/Mx01vqoLqoAHKtsE86NPw5VQDUU28g3MpE5u7U3J7lKA36VZ9dzSEbsDKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIPIvOVYTOJcAW060kODWMokRyE5/qbQAW/Y5BLlzmY=;
 b=c6+f+pCDGm9yOlNG1a6Md1kqX0pTJTKv7/YJBbR3N08o7BKcyo6H56iieW6m59fxyHYFG34KwDOHz7gwyhHnj2olLTUXgstkLwxhoZ6kxgO53oX2Y4qUmQ1D7rQItGIXjRZEVU89vP+IfhAhceTrdYIFE60nSRQZf3Z/8sFkxvftNKNKVWSOBgcI8VD08FAFE83AwsRyv4YKLCJpkDpzn9wW0cat0v5KQCPCtj6h2VZmFVDxzaVKG6oPdabo24UDpXZllhly7ByVJyKLsfeknrHcj/ye1lMw0cjeVuMnzjziT7ZCnSB5ZAVPFbjgtV+yjbIs4xT5ncEnm1IxgXqSdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB7733.namprd12.prod.outlook.com (2603:10b6:208:423::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 16:44:02 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 16:44:01 +0000
Date: Fri, 21 Feb 2025 12:44:00 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	tglx@linutronix.de, maz@kernel.org, joro@8bytes.org,
	will@kernel.org, shuah@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	baolu.lu@linux.intel.com, yi.l.liu@intel.com, yury.norov@gmail.com,
	jacob.pan@linux.microsoft.com, patches@lists.linux.dev
Subject: Re: [PATCH v2 3/7] iommu: Make iommu_dma_prepare_msi() into a
 generic operation
Message-ID: <20250221164400.GN50639@nvidia.com>
References: <cover.1740014950.git.nicolinc@nvidia.com>
 <4ca696150d2baee03af27c4ddefdb7b0b0280e7b.1740014950.git.nicolinc@nvidia.com>
 <5b9e15e1-8081-46ef-b9db-3872e98a6f35@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b9e15e1-8081-46ef-b9db-3872e98a6f35@arm.com>
X-ClientProxiedBy: BN9PR03CA0801.namprd03.prod.outlook.com
 (2603:10b6:408:13f::26) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 024d665e-8305-425c-2705-08dd5296f20d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/Z0txD5CcEFy+4L0g6vdYeY2LUcy5xMtQhwWz9wTkqC4CasCgqmBNvmjIdsH?=
 =?us-ascii?Q?Xy3pjwPBhPgu+HXWC0zw+O8JUVT3PzeYXWTq7K/3aqgmCJnrwJzO1lnvt1Qq?=
 =?us-ascii?Q?dR/HElKLM2epK/imWchwS/L5V51hziqw8/PwtYmYJ2YIvr+czsGMKLzkdi8D?=
 =?us-ascii?Q?cMyXaUwswVTUboVM1h9hY/CWZxy6k5hU5CU04jGO3YWLaouYgzHjceeC6ybn?=
 =?us-ascii?Q?5FiOsRzDdVVqzcvVqhldpXSrwD3PviCJe13hJTj+aBWOHkdwiT0qGCul5wKs?=
 =?us-ascii?Q?Y9sJPIiyXVpIxQuXw/QvS+aeP37b6k9wCYET7CEA2tssQ+Z44S4wK9cEc1+V?=
 =?us-ascii?Q?w4BUovygfl2VLZB1VPiCyZf1RFfGfDDQnsfbRy4Y04WFqUZz8jcKtrTlfipl?=
 =?us-ascii?Q?2GToeHR2EM/9e8wEKDa75Q0bKZcrw/8C7xtbtQEaefIAzLlnuWEkCn0y4lxM?=
 =?us-ascii?Q?fwRhrDtnmQ5LrYtG5/oi6Q5fjJYPYfUYjYHbHDz/bIFMk+ISXuFEpny5b/hh?=
 =?us-ascii?Q?btVXEjfHqGz6LZj+d4aSPHhtIU/IQjliBfHAVd09FISxmwYDU7cqyUnMTlIG?=
 =?us-ascii?Q?K2xZzRQugAs14txNGzh82TBJMSiYaCVHsiBoP+AMc5weK2Th1v/UzXVqaYUH?=
 =?us-ascii?Q?bDQBF2/bqKp7cAjqy4xZkx4UkhEdV7dCVg423lXC7FoU+QxBCHM1oww1USD3?=
 =?us-ascii?Q?gEdh6En6wuw3in2kIIXUnTroagCeczysKmnGOKxlFqza4TUCP+WyP1HXMTgg?=
 =?us-ascii?Q?uaqv8qp5vAdxEYItQOJsBPbPM65B6jQNReFxZo6dgZ3HDulSIaLP5AolSFZy?=
 =?us-ascii?Q?aD6GU6FcH2RHD2X13h6K97enz6+qdSdrtbcxA4tiJj943SI5QxwGx5Rji8rc?=
 =?us-ascii?Q?iJH6vH3qPbgkcs4sw+PlcJHNyU7huLzUCP9EoIF5FxVhAaXim5zEBLKdrJGE?=
 =?us-ascii?Q?wRHkQ8KpyCML35TIhQ3BVY9795LT/QWrzfsh/iGNq2KlBcF+9wvOQD7ZOx5I?=
 =?us-ascii?Q?Zoqwk+ComfZr/5Mf3Z0fCQihayG9cGoE+IRpPztSUZ5M84aqIHe582ieql0s?=
 =?us-ascii?Q?oK4zdM8ZDAmriXKoYCZNRtmJ9YCABj8/iHT7f2D26xo4xisQmwJGwjcH9QzH?=
 =?us-ascii?Q?1u118Iu56DgUkuYmAEHlUa6gdIxS2Kre4bF93Z/OHErRSy0TochbFM1Holy7?=
 =?us-ascii?Q?p+fk2prp70JiPOmZR7ilz+rGpBQzF4lY/LpxFab+/TTiuvw8rkFlcXViPetB?=
 =?us-ascii?Q?Rh5B/RXN8OJyKzDD5sf0+uHcKNKRTuS1QMfkdjMC6uBHFdTS9Aj8rXLDwgqy?=
 =?us-ascii?Q?qS6htWhOI1qQlYatm/wDUEK29e9tEIt9UaekkP9LKF/HpjJNu5shNWnhaj1M?=
 =?us-ascii?Q?XbG/+N0o3fL1Cfp1F/aVgD9aZ2kV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ul7mjgrAy/NrwAbkrCGWf0g2h3/GxIphX21M6nay9FGhEupQv7eYTdnArpr9?=
 =?us-ascii?Q?trqtoe2jHn6sE8dgXvICf8saL8TZTCDH11BCJGrK6ezmq1nvcZVSW9v4z+rd?=
 =?us-ascii?Q?aR6RGX7Q/Lk/QbpWfCrBNZ7v1a+2BKLMXZ1u/X9g5gc5hryzdGk5wv7N4Sd8?=
 =?us-ascii?Q?/cGCnaVVNRM2h+3DxEzmOWxhsA5gKw06ZAhOOOKo6zg5jI3zJx5rA5yNK9wB?=
 =?us-ascii?Q?YFLywggBk3vThbi/ZuL0X1RUaIdbwfIJiFA2lR+DGaTyiD1Qenf8wINgXpSs?=
 =?us-ascii?Q?25gwbOH03sT/vGWfDzd4I4FoAvNNwRh3M1Tga4rJDQef9Hix1OLp+Mr6pwXj?=
 =?us-ascii?Q?OhbpP67OwUwzmSZ7KbN4CCn77uGK5Q7XGwoSgxUww4NUy0bLyZAPLhwV65H6?=
 =?us-ascii?Q?/m0U3P2Zbjvk6/6FYJFN6NDQwgZZ9obOotmPd+zBCDt1j06EfPauxXJlaEvm?=
 =?us-ascii?Q?rZvzu76fMT1GHOb2EZrPBSx1CDRF3qf3RpULD0UdBiOcHJmYc/NQshzMmbUY?=
 =?us-ascii?Q?nj1L90zDR6bkgZ5ZllqwdeBA7OpNVVfCgDwY/UeW3WqvrsAhhGFzxINu2bQZ?=
 =?us-ascii?Q?Myo5PRDpLgKsyCgj/d7+rSLlku3br+4ODcFeEthZ8ruhZ8MeNiFJ5L8PA9do?=
 =?us-ascii?Q?hVpi6oG3y/26bT6D8TyPTLJKg8LVL1ntnAWTL6ZTP8J3FGXYHPfd4nrnQsDp?=
 =?us-ascii?Q?odi2wkBuLzujtqyGuZTcPH8y6D9ecxRbMYEetE0BPV4vQg1GF9NAz3OhADEG?=
 =?us-ascii?Q?5WCX7HiDt4NpHLffcCzYfEEYHgqw0Gg1GLtv7e/JHeslvjkyi+wGsABNZkY/?=
 =?us-ascii?Q?V7qSUNj5HhPH0U70ZmWPVyOWHGMkg6T/zDWZnHwU1WZKMJkRxOt069r1OiWd?=
 =?us-ascii?Q?aCdiFZ1xSREjdl5rLASJpq5IPb5ewy7fwHqlbaXej5WBTrGDuO1HbYRrrGCD?=
 =?us-ascii?Q?zwIntYrXYeW6vKEyESZmO+5kim1xHD+6WPhSsFPActDEsH3yFa3zJCvtREZZ?=
 =?us-ascii?Q?z7Qo0f2xq6FXZ17mJc1j/mjeiI8RGunKIwTn9UvqUGf6ZKc7Fp7TC108ZmHw?=
 =?us-ascii?Q?mDQhO7NlMmfs3fMLJTCahusSoIjDaHfP8SdKaWsCZ/3clmZAq/JLFQPbk/Ej?=
 =?us-ascii?Q?oAmuYKOVTvAtcIm0ZtBIrrvD9ajoBlDw1eeI8xdG84Sr7cvdmr+nATT9CW8l?=
 =?us-ascii?Q?pfj65jIn4BNNT9l2hQq3NydV7StEfQ4HUNYsp5+jpAXinJPdji/lGtOFgOey?=
 =?us-ascii?Q?7Aa1FKNFqSFgYKJlJ5PhjgHr8SnF5jIHfJDw8SWBjgZalK1M1KDinZTzmTAM?=
 =?us-ascii?Q?MLPGtM7kf8I/znMvRrg/YILzr65q+rZLaywv21YctM5JI80HDjIohR6o/2h6?=
 =?us-ascii?Q?RWFdaCMCov0EsSNOx7QibYjhfAS67w0xLHpR6PivsW3zbzW3oMcAxP5qBrrA?=
 =?us-ascii?Q?USY4cObtsjBD2hWCXBdVwoFBO5k63PzfmMjGBBf+FbwZfif7sJ6Y4G6mP3Sd?=
 =?us-ascii?Q?ag08FerRaVe3ZabM1QUeNHo53Oq/BC5kp5j3aQeKjTrpjA2L0VWNTymL8tas?=
 =?us-ascii?Q?c6I1irC9m5k+MrTI5O4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 024d665e-8305-425c-2705-08dd5296f20d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 16:44:01.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nbfnHluR5w1FD2f+ESlHQlpHj35niZp5prgpEyhyHsrVZvHfIS5CtV/Z6gjhOHA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_164410_307244_FEFCDFCF 
X-CRM114-Status: GOOD (  10.84  )
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

On Fri, Feb 21, 2025 at 03:39:45PM +0000, Robin Murphy wrote:
> Yuck. Realistically we are going to have no more than two different
> implementations of this; a fiddly callback interface seems overkill. All we
> should need in the domain is a simple indicator of *which* MSI translation
> scheme is in use (if it can't be squeezed into the domain type itself), then
> iommu_dma_prepare_msi() can simply dispatch between iommu-dma and IOMMUFD
> based on that, and then it's easy to solve all the other fragility issues
> too.

That would make module dependency problems, we have so far avoided
having the core kernel hard depend on iommufd.

Jason

