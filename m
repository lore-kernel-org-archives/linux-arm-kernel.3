Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE94606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ouKo0hDC;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sRwotwrK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dmAUyDLo9MuOz/o1hQ14aOoaMIhcGC7qQ4Ki4u5hwsc=; b=ouKo0hDCIV9ibj6F9MhRdiz8El
	6XEvEDg9VyEh5O7wd/2d6zvY2S9by6LwEJL4PiIwAbR3BAxN9SZNe/a8k7YOyDGeUoAtXAXD/tAM/
	DiS+KDiAh9YqzS5pdlF8504e8U2tAwB64SFaSZSZ4V2H7w74jOFBZva5AGSVDZ2IcFzSysLci/e7j
	+puGy3xiLRnPo4JmpbO78SlGu5ropAzLflZq6k3OtKhAkDbpYPpz4cwj3gNvP7F4Ukl+7u/6fTDh7
	s3ir6DDgaQZ7W5xdtNBAvoznXVewKmlRAjIe7Db28JPCss0owmwbZCqZbG16UA1T7L5c80Ftc9K3A
	kJ3f44iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5HK-00000007J1E-2v9T;
	Wed, 28 Oct 2026 15:09:26 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5HJ-00000007J0N-0NY7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:09:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiAdZYwPQx7WPZ6xosmV8NFf1QC4LEjSg25mk5zqVkrYp/jnk8pRwv3rX1+2H3eYG5c5WzkRqhWA9COQ2K7e8er6h/n5vBqnJT7O2cPPurnhq3ySCOYAIV6MXjY8I2D5lzSCOGR8aEZI0JYrVvCqDzfGPi81GqAX+75tshjiLVqcPi/YvFr3e+7ZEGT58LZvuTiYIjyC8Iq6hTxDQLGdB/GdcOYjFVUnvMlzQ4/Ar+kOxS+ZtCMQjl87zykQNZp8+scmSUDxEBt+SYKrvXkFymyoO/6GS5WkI2cDkJwabvboxPR1UxsLgVsoZ/JAJfgI+RWmFGn+FihPQ4pOHoU4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmAUyDLo9MuOz/o1hQ14aOoaMIhcGC7qQ4Ki4u5hwsc=;
 b=hOJWxJ+SOTu+c86ZEg+QFgWfyDaI9uQPIObAToTeQq9aQufmVHZp8ttHe75nC92cza7tVnXs8ygKHRLf8OTKJWOznIrB3mf9b+uwknUeWUm48s72jrcP+gFcVOrr4Oor7tV5c1L18aBD+RqhNvJFB8DSSQ37rjEeOa2q06p4PMeCr+JcT0wQZruiMqVolNdeeZ9+mYqNjD/Z7n+jhpLA/M1Ex/YL9vyuFiqjDiwho05R0Jz+fN8Lyw8fOtVlIw5vV8H+beCQWbYzH/vQDqkPiTIQDH9FRyoUOWbacg/ePvsrwoS19WMv/CAbydOXcbFAiFVbdXp882i0uVo9AHsrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmAUyDLo9MuOz/o1hQ14aOoaMIhcGC7qQ4Ki4u5hwsc=;
 b=sRwotwrKMu9EJZKV4Wh2+sekxOeS90Q9y46Nokr3WWGiuWm/ObU6Y+VaOjMxKobjaGWVD5GM3vyLWkh+BMwrl4ZCcCVxR6OzKMoGzkYiJwszJ2ntTlgBIYMhLPj82Pnp2LwpDIDxU1y1FX4N4x1FCQ1AfjxfAxzaAHbw1sZWCLCVWW82wkZo+CJp9X2I6qPDekIBUCeqLXSgsqsPsj8EfIkZhvlLencdCb2+/ZypyTZhcpEWJc7IOwTOdLrgxaJKzwXYd+Mhq+pWXze8Dh4bZHu64/S5QRQskA0qexoEPFuEG8GnqZPwNgUgsZ/ZZkxrvIpN383KleFZGbAiHSTaiQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by IA1PR12MB6281.namprd12.prod.outlook.com
 (2603:10b6:208:3e7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 15:09:12 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 15:09:10 +0000
Date: Wed, 28 Oct 2026 12:09:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, "joro@8bytes.org" <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Gavin Shan <gshan@redhat.com>, Vikram Sethi <vsethi@nvidia.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Mostafa Saleh <smostafa@google.com>,
	"rppt@kernel.org" <rppt@kernel.org>, Thomas Huth <thuth@redhat.com>,
	Marc Zyngier <maz@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	"kas@kernel.org" <kas@kernel.org>,
	Kohei Enju <enju.kohei@fujitsu.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Ard Biesheuvel <ardb@kernel.org>, James Morse <james.morse@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Omar Sandoval <osandov@fb.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Sam Edwards <cfsworks@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Pranjal Shrivastava <praan@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	Sonang Patel <sonangp@nvidia.com>,
	Ankit Agrawal <ankita@nvidia.com>
Subject: Re: [PATCH v1 7/8] iommu: Park TDISP T=0 devices in the blocking
 domain
Message-ID: <20261028150909.GC3040767@nvidia.com>
References: <cover.1789010941.git.nicolinc@nvidia.com>
 <0d57c59aa3cae891e9d3e07e939e13918a4e99a0.1789010941.git.nicolinc@nvidia.com>
 <SJ0PR12MB8614232EFC74C584CB44AD28AB6F2@SJ0PR12MB8614.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR12MB8614232EFC74C584CB44AD28AB6F2@SJ0PR12MB8614.namprd12.prod.outlook.com>
X-ClientProxiedBy: BN9PR03CA0568.namprd03.prod.outlook.com
 (2603:10b6:408:138::33) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|IA1PR12MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: c648582b-e918-4250-9d4a-08df35056b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|23010399003|22082099003|18002099003|261026140227099003|10067099003|5023799004|4143699003|261021121427099003|11063799006|261022075727099003|261022105027099003|261026121527099003|56012099006;
X-Microsoft-Antispam-Message-Info: Suh+fr1LVWn1aZXdK7JBOCRbPWOsakt8mJuocroMLtwjR6cuwwS2fneSNa9EcijwvBIEbrsd/0AdnqQtgNpeFCukzmd4NInUCvmwsU9TsiJJoewa6K6ppTD5HHc6g/0+1M1/pIey30wEdxmtA7CCTu9XeTP4eO5TDX/WJplQ2BRhx7don3MTBbyVOWJtMH7B50iOZZSCew3TrY1dROYlEMzUfPPZBxWjyHUT+WcUHlcWbVNso/tJ/2Lq7bOgyyF/Z6EZYbtdC5vq7HB6tZT5GGAAyvxHfvdld73mx0Z2ldVnVUBWA+Y4F2M4orTmLBgvB5DuZfNif1NVsN52AK8cLeIo8Z/9PDBsZnYIONU+qTBt1Icb6AXTi2vpRDgGV2IrGaKZ/aDFr+phQtl8dp4MiMF8A05pExuGsKLIM6NzALneJBOfF0pjNzkEveXMej2FoPjONQzp7BqSQWCzPuxpzghMAaEruwBMVktwdZH7a9gKYdCUNCV94kvNKY/gxZPdUz6RWJDrAw3wG9ccep49VgP2Q7yGIohOmjPm+YAL6sldE2JSOCw1KctdRdcr7TCKOVC72uxf99Xn5+MmuVcn0DHWfKORZnW70LTCwx0SGv08tYEgZ0bn3hV6jAkEGjTbOyqKOqKrI5KdnrwE8F4XFB1GfOjmeTfLKnqiNaVrMH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(23010399003)(22082099003)(18002099003)(261026140227099003)(10067099003)(5023799004)(4143699003)(261021121427099003)(11063799006)(261022075727099003)(261022105027099003)(261026121527099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x/Rzkz34XrNeZle3qfwGUS1t/nkJwdLhDTfIib6WHufwWzAnxgdVOjxosQjU?=
 =?us-ascii?Q?tJhTrzdo/1EpR6hVK7Akikoa+J1vEUrJMDID0ttmUlSBEUrqO3hF+ZR5Ct9y?=
 =?us-ascii?Q?COGVAqoTB4cF0YnQGM/2eDDnNZoM1t0QiMutAWgAkC5L5alusJbZ6eneyEaw?=
 =?us-ascii?Q?EIDHgG33PrjxWlQ78OR+ytBUQGfST4ODB0ng7rnydqxhHSGvuhXLwReNe8M2?=
 =?us-ascii?Q?ODz0eJQ7QbpfH8uNe8Uvh4py4aDQdzn7PpM5BADTimXVI5oHCPdBoIsYDJLd?=
 =?us-ascii?Q?mSy7hzVprjSlW1bLYgsNEV0L59aJCbypHH42Ok3dNxlZ+ujDhqATHwqlRN3f?=
 =?us-ascii?Q?Ed+aQneNXrq+cxRt774ZXVc67pz5wjtIUr92COqax2scyCn1A1nAFxiyuEEJ?=
 =?us-ascii?Q?+2/AIUUdxANxOS87tQjt+hNH3ayS0+oMbRMqUno09HGP1PyVP2E/mxP0J2aG?=
 =?us-ascii?Q?20Z3cKHaYiZYTHJ8UbY92/rSQgoyaR5CW878XWMVIV8ac34MG5qaQn38byMN?=
 =?us-ascii?Q?0axOM/p752jkKYI2a0QwCzKPCYowt+od7KTJj4kJUui7GbmJ50WVkVSwUZp7?=
 =?us-ascii?Q?EwfyehDJUEAT97Eo50txH+6+/aa+Nu5JgMi/Ur+e4h6jxP4kUlxEKpACj6js?=
 =?us-ascii?Q?x+/gEe30eaFXMkg0J1/RsgDT/ZjOMUFDHUWhlplk9rhk2bmMmMjZLt/RJO4q?=
 =?us-ascii?Q?DQQuRKrqli+6N+jCG206ti1GOsmpBWQT0yNv6VyYIXHV0BLiNJMqM1RUSfdk?=
 =?us-ascii?Q?oVzekUKVpTMRMtSC7ODXcpRasQ7DCvBzjGiBWnQTZdgjAB1Z5b5cpUNK7Dzn?=
 =?us-ascii?Q?3XRm6vYZLzNzMBZKfM5u74jsY/g/ho0OTPo+iuYqFbuDPh4rH40UHh4iaEiE?=
 =?us-ascii?Q?VMBbwsd1JXnTCJOF70EKhFLh+CaACDIcifozdm4ubAOAadxIpo8B4+XdtJVu?=
 =?us-ascii?Q?049+Cptm1hM5RiB0aaRjWBQ6rsE4o9f4NEjL0weYdPxvowY/LbY77+nC9g9W?=
 =?us-ascii?Q?NQbw6SUfWZw05CGgsfkouu3bgfFR7L7VNThy37RmqL7zMcf0dDOMtBF9TsD7?=
 =?us-ascii?Q?YAYczOQv5cvdClI8vNZpJ7VDmW63mooLJ+s0TYeYwj2Z33sh0cZkXCCTm7i8?=
 =?us-ascii?Q?vTWG4E/xGsdaurmbncNBSDAHLmVAQufpLLak7AnTqw3t3qPfMfQGq6ECGmSV?=
 =?us-ascii?Q?W6HnyYp3wowGxMPmqufIXZ5khNqom0EY2pgZKnPurjIeZQcF6Fj7DwYG/gWG?=
 =?us-ascii?Q?gIlotvr6Revd9OOpbd7XDNeFwjXt7LQbM/YsWWwpPqBD/JCmUGPkJdNnZmsd?=
 =?us-ascii?Q?QgtCkPGD0KbacEoOWorCKe7rfjAG8jQC7oh/nxEAaM8X1y1dm/pUGLIKBTVm?=
 =?us-ascii?Q?1H7UJ42bsyWCNBdyCkUNTnjVKBLOB1PjvwKnorl4y/WTx+v+40liF21qg89Q?=
 =?us-ascii?Q?1YnBicNy3d3iziQovcYoC0uhRbIzexn2x9LkAwDviK5iw4k+Ll73bIpoQ9Lo?=
 =?us-ascii?Q?jqG2sg7suSufJm6L27SRmrrBuqSdFmF25K1TWoMMT9fNdUUWiA0gS/5WcHWo?=
 =?us-ascii?Q?i4s0qsfyp27PoWrEJjJy9S75VA3LLat+G0GbK4ivN1pB5MYzEPUsePDLVJRB?=
 =?us-ascii?Q?GKLN9QjzIJ8Fv/ONZjgSjJ0+flH/4vcXo72hF+XNQqMd2NIjh8h/ixXHf97/?=
 =?us-ascii?Q?RSveae3LIGLnx5MfLKVwVjWZPTiv3qJz7Zh4kzGreNuAPXE3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c648582b-e918-4250-9d4a-08df35056b93
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:09:10.6886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7smtrWT72F2cT4fBvyIumPCmZi+rI5AHNeVe+BfbBlfNCFb8OB7Kt+9r25EZx9o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_080925_136473_4FA4D922 
X-CRM114-Status: GOOD (  12.71  )
X-Spam-Score: -2.1 (--)
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

On Wed, Oct 28, 2026 at 02:19:17PM +0000, Shameer Kolothum Thodi wrote:
> > +	/*
> > +	 * When in T=0 mode the T=1 vIOMMU must always be set to
> > BLOCKED to
> > +	 * release control of ATS.
> > +	 */
> > +	if (iommu_using_t0_stream(first)) {
> > +		if (!ops->blocked_domain)
> > +			return ERR_PTR(-EINVAL);
> > +		return ops->blocked_domain;
> 
> How is MSI allocation handled for T=0 devices? The ITS calls
> iommu_dma_prepare_msi(), which appears to return -EOPNOTSUPP
> for the blocked domain. Is that intentional?

For a TDISP capable devince MSI is always issued using T=0, meaning it
does not go through the SMMU. It should be wired to defeat
iommu_dma_prepare_msi() and use an identity IOVA as though there is no
iommu present..

AFAIK this is true for all devices all arches today.

Jason

