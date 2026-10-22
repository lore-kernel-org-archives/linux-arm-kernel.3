Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37176606CC41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KSI0vIh3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rAGd8Ade;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hF9TVGhW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hFyjH5udDsCFMVA9B2u0GU1pNv6rtr2KfKuliDBI+1w=; b=KSI0vIh30xOxWhfGVm4qGTToLJ
	TFzmJrIkGRCNegFODXCK2+3cfVkXeF8zr8Qt7YaInz/DSRjjKPVaL6ex0bZQ93ZjZhHyf1puCL2JY
	aSuEDkkvSpYMlyPq4FnTuTmFIh1cdjxK+HQLh9QpISxnaFK/SGij/IoQK98l2+vE0pDZ0DsBgcyNd
	Q0BVwvXQvBL+efAl3Et0k4JgHwKo9FCNCjyEmN0uxBGUJT2VxKoJ89A1ly6dXh3OeHtJgF7H6FC4V
	RZlhLusxbCrvXpR4Um/rBXvw/qJUwIEgNSKwtBMxVfP7CyEccr5PuY+r+JPbOMoqI46qfZFSFwm2H
	zUrShVGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuXr-0000000EOR4-2PSW;
	Thu, 22 Oct 2026 15:17:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuXq-0000000EOQl-3O5z
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 15:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hFyjH5udDsCFMVA9B2u0GU1pNv6rtr2KfKuliDBI+1w=; b=rAGd8Ade+kD2uGjKCKaJ7xOthv
	dcT1aPQdAJLXyYH40R013PiBz7qInKFMJ2ZCwdzBbtoDjgI7nUrAyjjPsnwLsEhxfI6A2QbAhVEzY
	Wt3H4v82udYn23Kkn6oq56j6kMcQCUrv4YJ2O59h5pMn9PYo549m3+ISVapB8mQMZYn6UU0Y2xHYz
	IPzAEdHF+N8pfGHkK0wkp/x8KDsFfWgkFK65AFO9ar1Nho2XOUniz71NqxK8rSOD9sfoP5UL0zLn9
	o7hsX2lXD+X44GCQ2qZnnkLmN4+9vTy3Q2hoyuN8w798F9pP/45UykqRq2ynDCINeGEpgdIiX0iAb
	AFYUAWEg==;
Received: from mail-eastusazon11011000.outbound.protection.outlook.com ([52.101.52.0] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuXe-00000007O69-2fWl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 15:17:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOp3SIDueNLjVHkBypOpiR9k67DC0RfeSH2UwgKspSrxMg6kSYD2EILIE0aadsBPG8qreO/cU4cqzwThYQuXtcO+39JZxEas8P6Zfs455CRSNRVzD53XlUPqJ1uk1H6QmlZ7C3l1a/L7YrA/UwRsNCaMnNVaZ6oAJ6gjZ4EzwJQnSqXRZfiSbXSpHQgdUmrzQSYhcrpVNgmLplczKKpS9gXFSECN4QbaXjPJ+1kFPQ1dydA4dvVLs4maoRerW42YJ43fBGekSokOg0oBzh3WdoNxDOGm0PiI7SItQYmsRMx1rVwXvZfophGZZNQA3MIOPVWqobPzTG8p0klwW04c/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFyjH5udDsCFMVA9B2u0GU1pNv6rtr2KfKuliDBI+1w=;
 b=M+ZB/TJ5zdPzG+3nUoOthbL8d5kpCcJVDdhzy/oLK7V3lX+t683DSG+zS93MwfWqBGZWvDbFcaib5y3GkTDiThFrxOPE75b+wsUUhvvtub8mQyWGsduVXPYF7KwPn91ndy3yJ6GKNzJpH9Y4q5jokfcEDfYVPOZePJ0RifdEytSFW5nDoXN1kYJwMfR+/RRfJnbp/V4nNVCvltj8atXsMsgqLJVFnmJeONCp/ZMvjYm9ed25CSkcs0qTKqZhPvA6lrKyJBMCAM+ddWiZIwO0e0ujCmI5mum2s3lmRhvJdXPH8b1ILNNZ2oFcJWX8E6Tll/QgPYp13QKfFezJfLQA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFyjH5udDsCFMVA9B2u0GU1pNv6rtr2KfKuliDBI+1w=;
 b=hF9TVGhWJuzKSoDxq0+R2XZViVtxOBzCMUjN5yUDKutv1SuY+kAbmynoOT7vQ35g34fHnsqrjDdbe27xPmxBxhRAmeeIOy8VPrcBRqnMPDxnR0eiGUEapLKOxfIhbXw5xRoB9E+3QDxfT5p89SBQ2tfuWRIGKXokFAOUzxFuDtbdBozx0DCXu8gU1aqbRwj12R8FH9BJpWgqKpqRLCprK7aR72G9EiFSIacUXr8M6faUMV3lPm1gkCLLZ1ss/pdMj8v9PWvva2spricIcjjQUW+wVD9E3kFqOw+wLZIkPUTJC+2om38qRQPEssJ/kkHJ3xk+Cdh+wbEZe8lLOqlmrA==
Received: from CY5PR19CA0132.namprd19.prod.outlook.com (2603:10b6:930:64::29)
 by CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 15:16:54 +0000
Received: from CY8PEPF00000054.namprd05.prod.outlook.com
 (2603:10b6:930:64:cafe::b) by CY5PR19CA0132.outlook.office365.com
 (2603:10b6:930:64::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Thu,
 22 Oct 2026 15:16:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY8PEPF00000054.mail.protection.outlook.com (10.167.247.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 15:16:53 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 22 Oct
 2026 08:16:34 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 22 Oct 2026 08:16:34 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Thu, 22 Oct 2026 08:16:33 -0700
Date: Thu, 22 Oct 2026 08:16:31 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: John Garry <john.garry@arm.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <praan@google.com>, <kevin.tian@intel.com>,
	<smostafa@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, <jamien@nvidia.com>,
	<kas@kernel.org>, Cristian Prundeanu <cpru@amazon.com>, Breno Leitao
	<leitao@kernel.org>
Subject: Re: [PATCH v11 06/11] iommu/arm-smmu-v3: Add
 ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
Message-ID: <atooz/RMwQk7DA8w@nvidia.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <ee4257b62324aa75d7140f1f4a49aa0f78586fff.1791226953.git.nicolinc@nvidia.com>
 <9f500b81-792f-47b9-a8a9-1415ff11b699@arm.com>
 <atj7XTdjC0CIVDQY@nvidia.com>
 <ab304d36-c655-4a3b-b1ab-e4b7292bfd24@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ab304d36-c655-4a3b-b1ab-e4b7292bfd24@arm.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000054:EE_|CYYPR12MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c048e6-f1b0-4ba3-1ef6-08df304f80fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|1800799024|376014|82310400026|261009223027099003|10067099003|56012099006|261021121427099003|6133799003|261021135927099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: W02mNymj5Et1qgAaObTBkyl4PvmwqTDzY3GoRg/dZjqekZkw/tB6xh+IUA595pmZgkCd3F5xz0QI5gTd7mdJ6RHKzn93gdarut7SntlQIhLNgXTKYn6y9HRRmfMIcgQM2vqmPLu4VXtfXuLPHNnRN2PKo7Gi6uIm/qtN4cpnQb7dYUNewAriVxGZsEjaDMezxwTayFtgfyqWO/nNmUS/897OZLoS/H0EYCSX5f0SYeXcjs/o7IBCchmGlJKNhgEeu7wvZ/HZGoiwvyW20WH3hlngU54SuLCrPhFsCnOQlHLgnKoGUs2sEL0MqLjnYdzsH4Gj8jUpEtmTtkaYZ/XjPwpS87ru4A9hjlVL5GrgVfvwXxHcmNBG2FmJkCHFbWwqYXm1X9ltoDSxGNf54oz9NRwQfnS9J3Idziew5YiSYwMVp6LaV96yXgPz+UcwmvMDrgdNFofEc0XfRFb7Rg8Wbl7fXUU/ZeSxVyAsdGt5a7o4nFjgYv15RX8N6U0Mvl38/CWo3bH2XAKS3xfRXhxiF+G7oUJaxe5x+TANeQfe1vzesi/DIxjJ5qTcpcnh6ccLFevvdMePe3mAREemLiA+UMvublsEorFrhpy4XG6AL7ygpXrbIJg9V3Fxp/OiCCyktPXynlJlnMTw6KvRd8EpfCHgkQBm0WEtZPc+/9k3LBLaA0J+k04gApmY8GXte/Sk3csDkmQwOWlqFWog338EVg==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(1800799024)(376014)(82310400026)(261009223027099003)(10067099003)(56012099006)(261021121427099003)(6133799003)(261021135927099003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 16+wD5SuW9fxKk3U9FvJ3N8dg5/rQHEkJq+pYvWiz7DA2SpQ0jLXHXcorNFpFkXAPWPi3EXMErnjEcZDehYRxUzmrJjYOI6R98k0bG8PhSnXI97oRsxJRNhCdFJYmgcn4Vyn+qjOm8+RTIUWJ4D53y1f9WAItajJv91/xT+ebz4G9J2Wc/QH+5WC+E4fhosi/OrHDf48zzR+ejW9lCOkoSPcTkUAAMuaggeppzY9mv4y75aWMOMEAfhb2Vloyv4EF/j+gfUWeInjFmsFd/iacWftVb1IvcAio5IDxd1QMyy6wmDcWHi1B/lyoe+m2MiZ4g6p5XkbZCl/vLg/BLprHcHfdviPL1damIwodpjSfJtlheNJhxD91BMOJgYJ6YLWIqseuW+g3I2UV/kn0vPy+q+pbEzSryCDb3NFh3W9SBGXuXVOExL0Tkv7Kz2BFnzW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 15:16:53.2668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c048e6-f1b0-4ba3-1ef6-08df304f80fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY8PEPF00000054.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_161720_600043_3341D3C3 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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
> BTW, on another point, nobody checks the specific error code returned value
> from arm_smmu_kdump_adopt_strtab(), so you can consider making it return a
> bool.

No.

Following Documentation/process/coding-style.rst,

16) Function return values and names

	If the name of a function is an action or an imperative command,
	the function should return an error-code integer.  If the name
	is a predicate, the function should return a "succeeded" boolean.

Thanks
Nicolin

