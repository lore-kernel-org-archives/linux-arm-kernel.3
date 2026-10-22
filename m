Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A929D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sW3pGPfS;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P91xfxx7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sIyTcflmlFp3PMW5lR+vqpIb03mEy9Kl5Kfj1jkQ5t4=; b=sW3pGPfSTFVb+LoZGrl39Hnq/G
	/9SClCki91tILIntg+ppa5odSZFWF66ELaelDgUd4pYOS0Dt7n7LnNr5w9xDwgCok2JjAXBCxV16Q
	dlV4L+JEAMT8ms0ej+Q8dUSPYpcY/AxOeF6up3qkgHsTE6uwfR+T1Lddqq6YTxf0dMqcWwedb0WyA
	UDLZmTqa9o9KW4T7hToaw5gIWAQ/9F1Z8DxotzCMytutfEfdhOJHKPJofgiPlcxVWSwdRzdW5WuRr
	8+yuvL1FRmJVmCVfV2urO3FC8mm/mx399jdsuOczReQ+T3IkCHrgkiTkRmkx38yb5LEkiGAdyBM9g
	CHdM4Tcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrp2-0000000E48S-2LPu;
	Thu, 22 Oct 2026 12:23:04 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrp0-0000000E483-0fu6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:23:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQ1Z8yv3dTq+Yg1aaj5zGFYQLWgT28o3iGOd+3hvJvCfFHD1aU49ftq6eTQ3WOonledbAJs0CSBc7Xh5awIb1CUIDjP+o5yPNDLTxKWvhNBHZ7wnsVCcAtHjQoadaSgml35+9GcJ+BfmP4hzdfDi6hOErz0k0C73gCMlfCTGHCXbzRzxf/aVqQMKO4nfRQXiKfzxvV+arLaaHIfg3BcK8ZYZNxtIN2XOp1vWc6LftJvXd71otKg4I0XL3SnMwtn8Cil9hJoWNNKYh2JJZOeCgmg42RiOqF0UO7pMudNjp0yUYzPfLGaYNsNA1UdqKp2trCQv/64ByjwiB5SWGN8liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIyTcflmlFp3PMW5lR+vqpIb03mEy9Kl5Kfj1jkQ5t4=;
 b=APdYX1GwNVVhVYyXIscQyu7szeUB6MpgR5KycD7oTlRGdYj7lbKf21O6CLNhklv2A5FTFWLTmc9EojRJG4MHk6nHOp9tkOpJury3J4dhPj+Mx0Z+waCS7wJp9v4B+Va1RTK54oALbownlV/7ey7OoCxtGBf5bReDF0yGgSMPCh1/YUwqNsNHlqbj91WU90VrzEECdBa/sdhkqixUd6pBqC1TvvKZsyn/+VknpuVjdptgEhZODuCa/B1lLxcff71Izo2lbMHSdxuehSMt42aOCt5IflWWz414s7cXDt2iZcp74weZc0PjJP84Vr5sgE1PEL3uh3M4cj/eKvfgWUinHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIyTcflmlFp3PMW5lR+vqpIb03mEy9Kl5Kfj1jkQ5t4=;
 b=P91xfxx7Lq0Xj7b6CjJsKkVsMLyP6JtQuv4/jLhE83pwtsXV1fRqKBzAIGefeyhmb5aBL1T8Cjy7tuvpnKacFETeMv9dFACOpre0biuecVp/7wRcmzKFIgEeQcG8CcLREhhgb8SK1vigA8+ZNMXtkyzQA6VCD2bb2dVPf1HeyvrbrJKrFeh4jVhDBuZ5cSwOoRQ8IFcPFIh3I+SnX6LSKPm0GiiZjtkSlZImbXK2ehV2U+GXj1NURx2W995gmFfGo4Efow02kSjKrfCzc93IdNLGVx9NFhTnxUY7F3MfWbacyFmhfCWAiz294pTOeuq6JBlNMfShjN2SUcfnYPg6AA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SN7PR12MB6814.namprd12.prod.outlook.com
 (2603:10b6:806:266::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 12:22:55 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 12:22:54 +0000
Date: Thu, 22 Oct 2026 09:22:54 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: John Garry <john.garry@arm.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
	kevin.tian@intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
	Cristian Prundeanu <cpru@amazon.com>,
	Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 06/11] iommu/arm-smmu-v3: Add
 ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
Message-ID: <20261022122254.GB3008132@nvidia.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <ee4257b62324aa75d7140f1f4a49aa0f78586fff.1791226953.git.nicolinc@nvidia.com>
 <9f500b81-792f-47b9-a8a9-1415ff11b699@arm.com>
 <atj7XTdjC0CIVDQY@nvidia.com>
 <ab304d36-c655-4a3b-b1ab-e4b7292bfd24@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab304d36-c655-4a3b-b1ab-e4b7292bfd24@arm.com>
X-ClientProxiedBy: YT3PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::16) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SN7PR12MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1f0ca5-3ac9-42cb-e673-08df3037330a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: toX9ua5lZ/jAoU3+41LhUWfm1Nb1y36WYrMk8925BJyl5/So9kvP/15TjlDMMl/DEP72m5vnH4apgVDNNKXmDXVvjQFfXBpY6pAuEEc0G29bn37rmWRZKBdKKX3AIq9GNJYlI+VZTctdntRtOikJZcAEO4j5eC5TUhjMJ5uAp8w8UR9I2jARv2EitySRHXAdvkvAB69gBFP71BGBgFKJaW8flKHBQy1qfvbBj6sgX/rtNJuD6NnicCPOGNYPZuB94AUb2ZaAx9Tsxox0dar8c8YxgaUhL2Ebq4ZujxgFdsdLD0+ew5scYWICA7k3FbEDCFCZ0RTF9C+donOY/qqDKMFmFMAx2FIbBrGUSjDfEFwR8/lfov9e+mhnlMXwwGCp4h1nSs2sCuVAQpFkL8e+/gTkqcJVGg0rKc6mSFs/m7/a5IeAi3wqVNZjnrnkIwg969hCaIOLfzmsvrmawVojOu/OFkxuiQZmYJZGtp09AsYr6gFGCjqC7S2SnlsE7uFIa6nSxOz+WLRbAglrY/z0ozrgc1ESWacoY2b6Il88LK26mZPO6NhKTtPrl3MwqGkuabx3xRHQx96ScXgnhWwwRh4hsyUFRAw6oIHdqvVw/mDUN+V7CUKwe5NTChdcxilK9zU42Pu9+jv/DeLwIOFE4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JIpln6ILUYBKc7f/YqLbcXBAXxWcCRJVaD/qWfWNMVaXoe5gTnel0ctRaXou?=
 =?us-ascii?Q?a/tRHdLFkr74BdWpDNS5imw74Y0zsVgz6NB+OW3pKDQ3BLyTFgvLECnJrFJO?=
 =?us-ascii?Q?RCINqRd0iDcodgT7kXC2IoQSCERYT5ld1VSPl0rfdMCDuTEvnQJS2kWwAeBC?=
 =?us-ascii?Q?e+KHHgV/OjE7fccDC6cfHcd1gjUeMT4ltDW67CjoEaIwjR2DbAeLI/MWHXXv?=
 =?us-ascii?Q?GdWLFkAIsTxg+GrSGcSTeX2VifF3vCO3irljqdHIRTzsgkwm0IA/8f52SmIE?=
 =?us-ascii?Q?YAKr0etxrUG7K+Glaj9WaaN+K6i/gh8s1PaJ5BXdcFzneuyYmlVBR3gnAkdP?=
 =?us-ascii?Q?58tMYAjvZ5GJrPhUWzkjGuv27OLX+zkGu80TgTk6ZUygYpk3tRr0y3OP8dnc?=
 =?us-ascii?Q?pdTavJFWKzGcJMie9QADLJjXvtHI6BFMBlyQ/fw1x9Wof346AL1VjsLgGalz?=
 =?us-ascii?Q?3clWO3j/cv4ku1BRw9bQAZoE0McEeKmZ7wrkLFpOEhvFzv2dTMujOpzoLAt9?=
 =?us-ascii?Q?I8Ul2pbzJ9T0Mx+CQVULQfMRroutHolpz/sCqvg6liO6gSbwjZSLL+P02vXk?=
 =?us-ascii?Q?RGf8+8No8y+snEJoSsagn/CiH52vC+rpjZ58raGzdF8hIfEYOzmctVH5Ib2L?=
 =?us-ascii?Q?jZ9M/H4c8vHZAavQgV5JD/CW2b8WxLzkp6vcnKqgfATYvLCb4fPxu+RHf0Z0?=
 =?us-ascii?Q?m9rbBOf2XyKG14iPh2aC5RHNfX92xz75yw9yT/4gf6AWdAQkp0gsoxh/aQ9T?=
 =?us-ascii?Q?6BrJZmjqvl7CkxJSq/9xIgX8oUo9YRCpof52h4FLpfIbto0VuYHzZsdhV17b?=
 =?us-ascii?Q?pq/n7UpnNxXAe0WjpJmDH7z2QXjAFKEaj7newm6lv4gmviaXYWld0n2VpJ3V?=
 =?us-ascii?Q?G8+7XYlNN22hUohMVreU5PwZD9j3YkPQJ6KFSXltTz2+8YatLMnZPKgPlUOd?=
 =?us-ascii?Q?YwR3jpgChke1bn89Ch2WYs7Xdf5w7RA5J+j1utthpkg46tKn0WFmKV4TU3Ws?=
 =?us-ascii?Q?pX5eC/f5J/wWQJarY69oZxzvasn79WdvcCy+Q2i1yFfzQ8TWcvVQYu4MaCQm?=
 =?us-ascii?Q?3l8gKAEW3IeqsE6mRMJL0iTsoqbxr3JCGR0MXGKVrbMfHTIEbvCGD13K8HYN?=
 =?us-ascii?Q?iMIei+nKUu1Ofb/Ry48W/lEhDehgkpAbAc400iOqYS6e5znCIaS5vF7/xPVk?=
 =?us-ascii?Q?x+xnQMMrOqj2X5rpzSy+oBMWl+u0c3vspMlTDtTdxOIeoYWERl5B1tqGRV8u?=
 =?us-ascii?Q?Yfe9jql8C/0u7riM1OfKV7hRoiNq8n7qR7YwwcjCJdYUFLZZ/yTFEKU+b0Fz?=
 =?us-ascii?Q?UU9FjiniiGu2+59omLfMJZZtrPlNd5oniVbPqOA0hRTriYYxOEt1h4HngWov?=
 =?us-ascii?Q?X4nwuI/qzyHX51b+IW53G8FdmLWJwFIywxBQaKIJiwSJqPF75DpBnQ4U/goF?=
 =?us-ascii?Q?kpczs7eTwdBBvPWLdUek6LccuG0YweFDvviVEG5peD6TskXP2zJ4TXQpX1hx?=
 =?us-ascii?Q?5HNLiqQxdX3WTOF+TlcRN9xuG0H59oGjSM15nW/8Lck8xLl/96efbx/71KKS?=
 =?us-ascii?Q?8aegPbAtFeySTM9oRVLIt16xtMR5pK8TFa1kTGO5VkfnCk9mVyYNZbfhsEq7?=
 =?us-ascii?Q?rO1Xp2tm9H64nbVUA+Kv4uFVrGzJABEOJ0RTgD2SecDgu3+fR2sksgVKRYdT?=
 =?us-ascii?Q?JSEsTeZF+MW3yLAX5lLZTHaOmGh5PvzZ+AXc/oMNDV++eOvX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1f0ca5-3ac9-42cb-e673-08df3037330a
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 12:22:54.8269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5N3mVaVFq3sLEbgc/kZeRIjeixZngKfv6EUCr/mgHa59kcSrLm288R69h1e5nxg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6814
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_052302_205131_12994A64 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 09:41:18AM +0100, John Garry wrote:

> No, that's the point. Currently you first try the adopt mechanism; if a
> problem is found there, you fall back to the normal full reset. My idea is
> that if a problem is found with the adopt mechanism, you just re-probe with
> the normal full reset method, so that you don't need to undo some adopt work
> during the probe.

It is hard to convay information across a re-prode to tell the
second probe to act differently.

Jason

