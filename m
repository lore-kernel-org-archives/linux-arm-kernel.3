Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B405C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iQlxE0rMcsR4uZRrJe1+Wk0B7WGJtyv2ttijAHHJEA=; b=EMZtGZjohaXtN2Z8ccRa9M/fTr
	7BVt9ttNuagmOgktUh7tPbJj8xfjcCIttG8igHLYnguP6q7/a1gSxLncy3iwKocZBf8phFQI0jmta
	eon7vPjJqm9cBYTQ6ojmXaol/wMYy3kX+oMdPidocb9mnXZUFa2nSWk89tE39Sf+z63DcK+ToFcyV
	rhuIVyJH4xbvsjbUHOE2PPrw6PbFTJZO5WoP1ujLgLBO+bnArTPk20ZVKCu6ubPrzmwGPo0HdybTg
	6MV8mEA+eXATBcjx7FU3p/cf5OhBn5BvPrOeSbNKc9Nh8S0nUor55j7YcnliPoeGmZb4mMJFxUeId
	FSHp9Ozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDL8-000000054fw-44CK;
	Mon, 16 Jun 2025 17:09:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAc9-00000004ffi-15fk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 14:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2iQlxE0rMcsR4uZRrJe1+Wk0B7WGJtyv2ttijAHHJEA=; b=RyTNGI5TT0s3zUr800IkuIa5CI
	Fz/cprDwhFOOZ6l4NwygVr06+/B5pAD3R3u6IjRgUQURgreAy3ZQa62CzkNEsArj2hVPoLTrSVBFK
	wjVWPto781fOvrf9zKBPLzHQqQOcz3lDUxHW3xnF1dOB8ysRogOms93wN9hGm2DHzh5DU7LmUnTKf
	dxgxdYa16GQV5IYGJMlEanQhsIb984Uyv0BxYV7YzRRl1fR5CR4+XAk1jcYWm82PboRXfqEmxXrMG
	+TmB9OwoKzrXiLxARNU0CDwhuhdlMIoxwHui3EFP/CYOTPwFGQGm+GuPZKFTR+q8F0x9aHbsz2Xf1
	fNJX4Ovg==;
Received: from mail-bn7nam10on20612.outbound.protection.outlook.com ([2a01:111:f403:2009::612] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAc7-00000003byj-0Hz9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 14:15:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ak3i0NRVKB+wPxMxAFt38x8WHoZfchX1vgkGmrmmSqYu8MrfTvXZotPhhmR1JS1LnOU45xHnzM+DPnqd3rdNzvmNAm8mnlQDh7PIdDkLvWsxfOQw8/FMI/J5BtMjHiBe4XUgbYzn6RQWMANqL7YAf1iUqnkEGTFzvrj7bpyB+ujiey76ehfz+0VLpHHPaeeoiqmaT464hmRpgh4qThpBGcNOzVgrTIwknVky9oCvgEt+Z62YTMSUtHIifgARVah0oJFMNYaoZScm9EptqvMMHIhpY49hG21ZWrK8F/srapdXZkDGTXbtJmca6ou+SGDoTu1K9MVAA9AHCA8X/x/bpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iQlxE0rMcsR4uZRrJe1+Wk0B7WGJtyv2ttijAHHJEA=;
 b=P864DYIPFAqjEumZxj2QIlWKr2qYpn5VV1XdmkDMRYSOop4rmdis78pNj7Zwv58YSTewJkx+3NTD04v6eu9lqvRzuNGj8lpuCFE84FLAowZ+DUDMMrqbTCBpsBIR/e9FfjdjO4bHkB5/gpn/gRsriivS2xuKKVOROuWzM9tXOdFd31gJh/q+RtzTP0EMIbU8ofmey9kvJMXwr3J9eIcOuGqmNGNAlSEPpMtrw8dk4methoWsdFlKIG3VOlgXLUCTD5DbM+QO9PzzEKxQbOuhYBA+jmFJUxwA0CV4Xk5aCzyK9I6a9SgnEWNjYFIdo+X5+iea+4UW1f2+XhubwLj6+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iQlxE0rMcsR4uZRrJe1+Wk0B7WGJtyv2ttijAHHJEA=;
 b=USgOdyDmVAUsLxaaVwNBNOGqHLAH4EkSBuyidJSAuM/Hzjr6tKjR295Or5R3QuuU8pkeFHG1SotCta/jIA/DYIroHnQ5t0VScUxVhdm9dywUIGCDrE1dF9ItBwFPd8F1Q0xb+gB7dGYdCRZXFPPjO2cGdjUrXcUKdEvd6fFqSHW+kBuLHtKbC1Nb0w9B/XZe1ZIX3OCLnIrQN1TUCtntds31wR0yf9ngNJN+GdWdPL/VsM6JaOkqb6X0wwclD8ZrSYxq1LEiqccpxOMltOtfdjIUm2yEJQlnLTUtGKqcF4Hpc9Fs4eLyRqhyFzOqkFFUIKl67LXDpHLYbV2PSkN9Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS0PR12MB7605.namprd12.prod.outlook.com (2603:10b6:8:13d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 14:14:59 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8835.023; Mon, 16 Jun 2025
 14:14:59 +0000
Date: Mon, 16 Jun 2025 11:14:57 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 17/25] iommufd: Allow an input data_type via
 iommu_hw_info
Message-ID: <20250616141457.GH1174925@nvidia.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <8e1d8432fb7e11f0ed514bc96690ece1f5e47fdd.1749884998.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e1d8432fb7e11f0ed514bc96690ece1f5e47fdd.1749884998.git.nicolinc@nvidia.com>
X-ClientProxiedBy: YT4PR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::14) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS0PR12MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 995fda1c-87cf-4ffc-6afd-08ddace02d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fIqYJxP9CUd2n3eHeiY1KO2hi/wamOk4Frk5frmSKAV31078V4A57QQzblDV?=
 =?us-ascii?Q?LzqcmIVG4capp5bmi1g687XHNHet2tBV14Y2u93W4Y9ZNb4F/uxJ9Rt8mutK?=
 =?us-ascii?Q?/JQfmTg0UrfVTcqj+nZcXVHkPYmqMCzwPphc/9zPZ9U3OEM3HdL3QtlhT+Wu?=
 =?us-ascii?Q?HfKHSVodsaemHmCiilnimrMHojX7Mtgo4W1Nww5+dOrJtTBWGhgOvx/PnZMw?=
 =?us-ascii?Q?mFJo62DbcSkUUACUzP9b2uTvFRLu7uN1PremAKrq2bLkKrGga9zGhHRmWeJ1?=
 =?us-ascii?Q?XAnFK6aKDfBhy/ly9hdwHMsMMwF5bBJpDfLNX1isXo+1ZnYYtXyCLoNdXBcY?=
 =?us-ascii?Q?OWmlE+SwqDtFrj6gMPZpyex/nU9iFwEo0JbXjBCHFFXRTqgGY96l5uc44Tnz?=
 =?us-ascii?Q?YJ/KcYJxUw7xrXX3j9GCfKx3sI824nWOCFbyDBjpG0NQUGH914DSHctIG+B/?=
 =?us-ascii?Q?LOkhs/wLQwDwUvm3X5QVub9gDHGkY65RaVUoTan9ExdRvImoqwnNrZoshMYI?=
 =?us-ascii?Q?2zlteVaPYP8TitPpnsIvhHsUPAJ/skHweK+h2qMYKySCaXFdqBwCTAQ/Vk/b?=
 =?us-ascii?Q?L+mNb7CVRf/WPTk/78UAe//rCmaacYmUDGQWmADiKYVU7tIRrjjTAvYkfhU6?=
 =?us-ascii?Q?KTaY3hoE675H/qRDtr+fFhJk6YeFDMx/XI5p5eAZE5k4pESrfy9W5aQ55ty+?=
 =?us-ascii?Q?vRaPHZwPp+eQ+j0nm2fy5jCdeIydSD6w9ochqm9eRl0kzLQCo7yW7zjCmIql?=
 =?us-ascii?Q?0H0B5E0UPpIxO7DtYQjlleMNsnwudW9JEYfUGZ9pa0JGBmXNbZbfyPk5criM?=
 =?us-ascii?Q?tCJQ8Axmthv0uQ1Y0ykpD3kYKeqOzEKGkIBrOEJwgFZJKGORctNzqSNx3BDc?=
 =?us-ascii?Q?9G84VmyQCUxpI29T0IApOIkuCfHZCQbs9w1anz8OfwTenB6I0fb2hTZJ6dV6?=
 =?us-ascii?Q?E5ZVo1tHhZ6ZNnq7UJ6x989T1UlUSZgJf17XUgvFzLnzfCgn19xZP/ElBGgz?=
 =?us-ascii?Q?TA+IBedwQJ/P9/oubGyEwz4i5SYc27bj7OgriKK2xxLrbhNBj/rTgHwIt13W?=
 =?us-ascii?Q?y0hy+bccaxeKfI+Yjj9SnOPQgGK6Qddr4UZFS+p07/IctkYe4Z7RmhM1/CRw?=
 =?us-ascii?Q?+Uiz6nENMt6A1KdpojiWl37XmOvehSVlhwkWZHW4EOSC3Bj7NpJATMXvTCp5?=
 =?us-ascii?Q?m0qURKsALNbKmWjJGwug278yKuryKh4J47ZqMVGp3cjoZ8ROqnmm8P9CzPzr?=
 =?us-ascii?Q?J/3w/9KQjjwIrxD84nEAhlWK+I2VW2HSHqwcnNDlOfV/zLyB8CFqiCktHxjU?=
 =?us-ascii?Q?nNI6vd2hhwilIHeaVKCcm0Qevax2bbhwfSsV9mt6y2ux2iT1BSCfG5GUUxWC?=
 =?us-ascii?Q?DpgZ5eWoDSTGMPNrT89lWEyfQBzZl9Sal9rrvv0xdjK8LKMMl+SxfqeN2FzH?=
 =?us-ascii?Q?+D27wesNHbk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XG0PU1QjCyotUADgDsx+wip/24EZGURGKQFhSciho0zdlyMUvxrV/nc86wcY?=
 =?us-ascii?Q?tkEN3VsEWOdjLu8B0NeXPYrJNIOLn2qTJNw2UvoYZijb0C0MCbZBu0cGxIi3?=
 =?us-ascii?Q?eI3ZJrzrCQEK1LS5P18ZRpDiR663JM1OYGeYgI2Era+A38Le+WnfHAxugvWt?=
 =?us-ascii?Q?vNe593wLnHh6zKLUNiqRf2VlO+K8KFa5l3XXx2ynN2KU35JGVd2m00dt+Rh6?=
 =?us-ascii?Q?rUcsJJ7uAQC7SbBjInOKZHZCe5176QQlR+RCpakXrxgJcXoQ6ydKO9ffXRC/?=
 =?us-ascii?Q?uiEH4zzXLQCLd8pH0djc7b5hCqSAo8CcR4kSVyXNdm+IHLLCDRnLbdYDoTDk?=
 =?us-ascii?Q?X9gN2nBYsJ6BUBcXMG7fcSzxLvCpwqZjwZQOtLDM82I2KoiYYSxXURYT9G1E?=
 =?us-ascii?Q?zloZa1KWsmyP/lXnGwUaIlzhyzCTGkF7GJgkdGTxX37EBuRiTDbzqUVa0Fup?=
 =?us-ascii?Q?a6g7/bnTKhezhtgGM2S4KAbZkfajP6w+FQ1qj9IxWblgG3XcBUZ75sjSJHA8?=
 =?us-ascii?Q?wYVSRUB4mPeuZaU1dC7JhsZCk24jTJH2kZh7RPjWHvcZPiqYLohmMBUgX3La?=
 =?us-ascii?Q?zaeDjY+9i+kSVY3lNTgYYn40pwYKL8pAGvQXDPDmTaAlbEnUqpWbqOznxahs?=
 =?us-ascii?Q?NXAZDfsRNOH+6Ob2O9LBNXR6d0UPEKfmdf3a2RW9aWZeS1FwivuILmSgecog?=
 =?us-ascii?Q?+JwQrLOGoQDpgqShQcXPsIPiR7LpDCh2l0Qm1L3bxbHrVgv3e1qSbitgw2Yy?=
 =?us-ascii?Q?S33knIr98qfqJcQtyMjHYyR8NF49kcmT4ajVpmibndgHa2r6cNwplw7g3UWR?=
 =?us-ascii?Q?uGJo8nPbwDB103V7oMSe5FpfW7hc3J85yctIVdRfWdkAQKkhLzftCDywyxka?=
 =?us-ascii?Q?C1stsXgA/wxiFPUVVzbGmCZ9LKoo9D7EiKBx6Sb6u96YzsJ+6ltp8CcOKhkT?=
 =?us-ascii?Q?oQ+pMoLpx0m9dUfd2TJPbNpfag3w52NVPnXByULrP6tk6/ZBlvnJtahACPEC?=
 =?us-ascii?Q?//FjJIvYw6BqHMhxKuhHywmaPMu3stWJxuSqNf46kwLZw2KvPMvmiBNU9ToU?=
 =?us-ascii?Q?CB1UHyfIeUzkjw+Me/3lXAXXLh/gB42kyS7LFbE0+feuDOC/CnNls404PB94?=
 =?us-ascii?Q?ct+B3CK6NwaAt5ZIHlPk0yFFjCnRmhQRzQpmwO2LUuRmo3Aj4ZC5rFq1F6qs?=
 =?us-ascii?Q?w8fndE8SIWtWsJj/+GNK45ppq6qfnNkc52p7m9Ya6zje2lsHGUx9j3BLbPXY?=
 =?us-ascii?Q?PLQ8f+p82EO3RWoJQAZ3joM3KI9CybT2YmQaQT0JGrTOJbQhhvt4T9nqoP8g?=
 =?us-ascii?Q?wm2aUrE3e4DYv/25ddvL/50pzdFo9baa1TaAMiPx4gCpBzPsUSpYO5/2EQ1b?=
 =?us-ascii?Q?hRe0aRyYfJi+36NfSQ2iwFII+kOULCl9A/uIH5rPjzy9/QA7cEtjz1v0kRWq?=
 =?us-ascii?Q?4tCcJ7YHJF11sm5EXTPb2yrLRuYHHzUGiFiroIhoJIjm15QxXx92f+IvgnrC?=
 =?us-ascii?Q?4pZtmVK600r201B9IO6nzOu42BDoN2+BoX8W5a/9Mf0Ca4Hxc0+9Zq6brGtg?=
 =?us-ascii?Q?7iKGWNlkfuGJgDfAa0Seqr7rrwlCUpsPDnxpIecl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995fda1c-87cf-4ffc-6afd-08ddace02d52
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:14:59.3495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BliI63KFJesZQXQ2V0BzaUs55QT+uNPOZJQQ0uEt1kwlFE/9zRBJl9f4Q1ILR8A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7605
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_151507_227826_99076486 
X-CRM114-Status: GOOD (  14.19  )
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

On Sat, Jun 14, 2025 at 12:14:42AM -0700, Nicolin Chen wrote:
> The iommu_hw_info can output via the out_data_type field the vendor data
> type from a driver, but this only allows driver to report one data type.
> 
> Now, with SMMUv3 having a Tegra241 CMDQV implementation, it has two sets
> of types and data structs to report.
> 
> One way to support that is to use the same type field bidirectionally.
> 
> Reuse the same field by adding an "in_data_type", allowing user space to
> request for a specific type and to get the corresponding data.
> 
> For backward compatibility, since the ioctl handler has never checked an
> input value, add an IOMMU_HW_INFO_FLAG_INPUT_TYPE to switch between the
> old output-only field and the new bidirectional field.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/uapi/linux/iommufd.h   | 20 +++++++++++++++++++-
>  drivers/iommu/iommufd/device.c |  9 ++++++---
>  2 files changed, 25 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

