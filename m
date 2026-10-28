Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DBC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kHjuNKdT;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L2D7UoUg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pnMrxMzHbxJHi4E2g4nZ1pMS6yuw/plyMK2k+O6VJV0=; b=kHjuNKdTQyoOUc44pwWlHtJ04h
	QDA0UjuvoLP6fHGA4Wr9Et7NEqGc8o5n3qCcieihqx/al4HypI1ZYqxQk6MlyN6wFpG+00QIyIeJd
	m4gbV49o9vP6qFyIv0N811ofGCkVGm533RdEm2L/7uH4Em+iHOMuo3r3kXEI0cLmnmfxBMeYTMMSb
	UTGlkyUpTopjozszZuqiLzBCHbL2/87/Rr0ibxSyFp25gwE4vc0kVhuLIKDB65jBAd6C75rgVfQkq
	rXjBOMbpsmmsQ+lbQLgN5kSvgrYU5byHrCbtwQ20KMedGuh9mXQxkub+GlQTOOrmm+dpRtysTxT6B
	Mr+0O9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0IG-00000006hxg-1aLy;
	Wed, 28 Oct 2026 09:50:04 +0000
Received: from mail-southcentralusazon11011061.outbound.protection.outlook.com ([40.93.194.61] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0IC-00000006hwA-1MkJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:50:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfgXkeNGptUxSCRTdAsWfk5hn1QqJVovQKBi7c2nLH/EkynzpiGOI/NlWRqpzIkZeWNODx1tF5kXibprmHHXS5hokwWORcQmjt7wIQFiSHHEoZR2QuqJppnpe/R3kKx1Kmo5M9XQKRUhgtbF0saHfztg2KUROJd1N3BaGxW5pXy7+1YBYP2lZICUKIt5GlRxNsdBp0BQX37oC4JxLc+w5l3JFtkI5BLYPKxLtaPzsvCVitAihONlAMrb4nUwQPfP4zBKVEqYCsqlxkMf9AtafB/kAvtCQBFPtkxpmrTxdmdwoEQsEaP5wN97+OjrwnBrZBJACMCB9HvoAEqsGoSEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnMrxMzHbxJHi4E2g4nZ1pMS6yuw/plyMK2k+O6VJV0=;
 b=dQayDwl5UM6n3UWQXLpbvIKd5FJ42qShdW3LBZTSoOWyBjxEREh+bzxym1wmFAIxgdEwToomqjkd33g1S3qsuy1P81fZbouAfORDTz4Ami4NZsIhJopR/mFtyZ3KqtNRErSvBYpHETAuOW0Utm+LQLTwheARGByd/LdW0xKdQ8967XdC2af4nB07xuujoX3jyGSBWR4kn8NYwtxuxkVIIwHPKPG18/1sOc+EZoivXwyo0S0mGVDf0WBt7iT7XHyI6Jm8doIPzXKnCqA2QCQiezAmCieJUS5jB3yHd4uwL64cLLD0wChBi791Zw5Cet+R+7qDNppBZjBAWXyRiyXYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnMrxMzHbxJHi4E2g4nZ1pMS6yuw/plyMK2k+O6VJV0=;
 b=L2D7UoUgP1IVp6xT60H4DRpVKz1YuAYyJAjyk6754EglPKqZrl6qqwvyhA/UT20+tSCUNKiSizC8SKGPx8XzyfwnMqmhy76tFTJKYh/6K0qHU9geF352XG7vZpWMyOz+CTSP7dAuac/k66CpK4UYtBwS1L/69na12MHAvth3CzfABCX3uYMw+5R1AqPk0Kbq6MWuU3RNQYNThmDGeFcr154ZYqkjMM2ZJkTGjPwNTEj0PAAzk1DCTxHi+pB9wZKQZJfr1TbyoXj3w1xlPYPuFaR8muOvZTsR+AT/b2q0RXR7znT6xfDrpltjHOlS6IIJpbzq2xcWxKQK6e/j+VrgAA==
Received: from SJ0PR12MB8614.namprd12.prod.outlook.com (2603:10b6:a03:47d::17)
 by SAWPR12MB999140.namprd12.prod.outlook.com (2603:10b6:806:4e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 09:49:54 +0000
Received: from SJ0PR12MB8614.namprd12.prod.outlook.com
 ([fe80::fe0a:6e6a:fe60:a43b]) by SJ0PR12MB8614.namprd12.prod.outlook.com
 ([fe80::fe0a:6e6a:fe60:a43b%5]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 09:49:53 +0000
From: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	"rafael@kernel.org" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Gavin Shan <gshan@redhat.com>, Vikram Sethi <vsethi@nvidia.com>, Anshuman
 Khandual <anshuman.khandual@arm.com>, Shanker Donthineni
	<sdonthineni@nvidia.com>, Mostafa Saleh <smostafa@google.com>,
	"rppt@kernel.org" <rppt@kernel.org>, Thomas Huth <thuth@redhat.com>, Marc
 Zyngier <maz@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	"kas@kernel.org" <kas@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Ard Biesheuvel <ardb@kernel.org>,
	James Morse <james.morse@arm.com>, Steven Price <steven.price@arm.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>, Omar Sandoval <osandov@fb.com>,
	Andrew Morton <akpm@linux-foundation.org>, Jinjie Ruan
	<ruanjinjie@huawei.com>, Sam Edwards <cfsworks@gmail.com>, Douglas Anderson
	<dianders@chromium.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Huacai Chen <chenhuacai@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Pranjal Shrivastava
	<praan@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>, Sonang Patel <sonangp@nvidia.com>, Ankit
 Agrawal <ankita@nvidia.com>
Subject: RE: [PATCH v1 2/8] firmware: arm_rmm: Add VSMMU commands and fields
Thread-Topic: [PATCH v1 2/8] firmware: arm_rmm: Add VSMMU commands and fields
Thread-Index: AQHdQNVBJHsoy5DyiEqk6ybDR0p9tLcTADyQ
Date: Wed, 28 Oct 2026 09:49:53 +0000
Message-ID: <SJ0PR12MB861491CC7A4C567D01F9B951AB6F2@SJ0PR12MB8614.namprd12.prod.outlook.com>
References: <cover.1789010941.git.nicolinc@nvidia.com>
 <0623345baaf550da1339e040b59f1fda902e3390.1789010941.git.nicolinc@nvidia.com>
In-Reply-To: <0623345baaf550da1339e040b59f1fda902e3390.1789010941.git.nicolinc@nvidia.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB8614:EE_|SAWPR12MB999140:EE_
x-ms-office365-filtering-correlation-id: 674c3e92-1671-48a8-54ae-08df34d8d0dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|38070700021|921020|261009223027099003|261026140227099003|4143699003|56012099006|5023799004|11063799006|261022075727099003|261021121427099003|261022113327099003|261022105027099003|261021135927099003|18002099003|261026121527099003|22082099003|6133799003|10067099003|3023799007;
x-microsoft-antispam-message-info: 0BCFKcPK3f1ncWA77h8GBIPP09UokEQsjoqZTweIthFgqZ0vB6WLj/U8hs92tMm2oj9/HwqKMa+GcvuLyeeKtuB3460llHDbq+YnSSkbIwgwr4fzxcfrA5xb3uqkoyIKBQIrMb8Iep1Hrd2Cc6+IhWn6MODrDUTenQGGUGwNUiEbjzLF5dvV0VAyIYGpTARfw+mz6Fm0qpjEHmuEQehORe41LtD7JjhfAUkXe528hiT2+mbQsj1aYHZW0J51ePmiWGrG3U7BU8fdoZ1kmY8HaAnyanomKUWyjztVuBhntFxSwQ3Y9xMapXB/ygt6Yjs2gb1jmhkRns6kF3HP7Ml0I+Nmyo5yKqZTjZB79iY21ElDc5bn7/apTa4RkEQeWxvPPAJRgxlOz+32fGunEBhPCdtn1VX7HsoP0I3xSzGVb/QLw5ZSsVAO0FL3DBU/H2LaDmnUIgEoDUMu/jqpl+2xqjJd9n6uOM38wDKTlARRgCjPgRv0/YG/xMX3MTqq//khBwIrxUYnwG/ycytJInHGGZC5LXDvnaLDCWATja/PXseZl8Bxdveuua7f3ddWikWlpHH0cQ4+Ur7NHUT92d7H9Di+w+KwyKdr2W4YTYluHU0KFGSacOzByC/l7DX/mYieYtNUHZ/CtIY7YWr+3z+yQfFyPRuR+iMuH4F8t5GR9PGUHGjh2S77MqtA0frTzkdcdMX5taFkp3vYncLJUkW7jT2FjM75zvur52fvs0zLxqzwN8UoXhFZQfSaDUopU8l3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB8614.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(38070700021)(921020)(261009223027099003)(261026140227099003)(4143699003)(56012099006)(5023799004)(11063799006)(261022075727099003)(261021121427099003)(261022113327099003)(261022105027099003)(261021135927099003)(18002099003)(261026121527099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1SiU/7kNBl7JFiHE3dv15QHKDmvr9QfUbgejabNaeIc2h//LyW1QmaAVsg7f?=
 =?us-ascii?Q?crq7Xz8XbCPHpvcwazVQ6LaVBqDtQ25NfOrfTMcS3qLNsBd2XYBRb7Zv9EC4?=
 =?us-ascii?Q?xY4z3BbxEOWy3xGO4RdGXaEXmMFT9muhzN1whgKNKWIjmKv7tbdi7+eZJK8b?=
 =?us-ascii?Q?lpUTvC7IH5g+UPKdZJ3MF8O01W/uUyNpF1afS0PBwJbnfPjXGZ7APu36ygC8?=
 =?us-ascii?Q?ELdhs+NLgyYEv6PhMNe9npTQ6x5N49iNGQ5Ch7SFhwc3U8xnzfHq2Z1cbqRV?=
 =?us-ascii?Q?d/jLp2DBl6T1S1DgpnwDXQKQmeeyeDID7DHHGP6BAMsqMt8kONVe56+IEWbs?=
 =?us-ascii?Q?RALUvD4Vs5SlvumBTKdvFEDJjWjvBZgoiHj3VKfNHI5+oueOHFOba1LjV+nd?=
 =?us-ascii?Q?TygpDLPOyQf72YvMqZd+gmWQfw6edvevGLAjPoprYvQMR2f1PKXdXFbuF88M?=
 =?us-ascii?Q?DLBKqa+X3v5xptoSiX456zOccVFmA92hhMvrza2dMH/gTJ7pdBWQgjGUTsgG?=
 =?us-ascii?Q?e+GBb3JyOkFmK01bjxMH9E+B7wkX1eTkAjAvqtvFzFTVIIZEN+2w8ZIGOqok?=
 =?us-ascii?Q?+1LF3+1hiTvY/Cp1ROhGAQuThggLOFIswNmsSgt+dkk9kruzCOjSQZHm13CM?=
 =?us-ascii?Q?75BFDNoo+b+6SNsGo3qpGGVCgKlwXSOsxpRDiTHPIwQaLZ5On2SDy7BzxyuU?=
 =?us-ascii?Q?1dpo8Hb5S/GE09Rk8J8MmB2K5KR5p+v5N+it0qcvKON/jlHfwSor1Ao2/424?=
 =?us-ascii?Q?rb6UXT5PMbZOIeffIQAfDtAKPzl/MlM+wInyCQ3E0HKtyo69+r1E7HeWNM+i?=
 =?us-ascii?Q?yWYB0ZiXNX3HTKTyjuFZA9OyuCfe8YUdN0aaYS1tBYkQFtwbQvlG+3efAniS?=
 =?us-ascii?Q?EASkArgnTRUfwgA4by7KsBLzyj5KG+wwL47KQAIzq252tAYPZxj/0SnPJFco?=
 =?us-ascii?Q?NeBYDXkBaD+fu476OwsZs+ho85l+PKs8HUnQWXlkfWvBp5tdJb9G0/Rmh3G+?=
 =?us-ascii?Q?0gl5F2h1mwg3lkZDjURobxP7NKmaMaiVjBzHUdKczDaXBtHkdn6aAHwnalin?=
 =?us-ascii?Q?6DEL/qfB2p63YwfmlCyhS1ROcS7lH/f2Bv1gRcf2UStS/W8/tZbWTrfZHtwQ?=
 =?us-ascii?Q?yvsR/HN4wvnSJhfnDNV5AvOuUL0M/6c6d4gyLDdA2ASafsi1bhEbB8QH1DMD?=
 =?us-ascii?Q?Jy2vfjjA5Mc0YN9lfV6JNYTe8ZWpH79Fs181++RM4Sb2GuBQPJtyUj8TTGbi?=
 =?us-ascii?Q?SHwxp5t2kKco3SdCKOykCLfiLFZ6aMzEIQH1mSBHbxTjHaROTGAbGMvXMee6?=
 =?us-ascii?Q?nTvDL383Ia/iiApRv87BPksJYsLqSXkLV2oFiX22XEsZiROqgRiCu+PzGNGA?=
 =?us-ascii?Q?noqjaSQIxoXJrheY2xG9TV6aqCr5oZ9Q5DV108CsBmRY4uZFPJozxaDUATXC?=
 =?us-ascii?Q?ZV15sFhqGbhd4u1MtLaOnF527BHGkJNsqEfwlfLHsO4lvn1wrb55rD1KU8rt?=
 =?us-ascii?Q?fpn3fMV/Yueb1GZyjWRwIf5sQfM5tL2Kg9RtSMZXnm6JoHw+LnR32jRZ0113?=
 =?us-ascii?Q?eztikRhZWgbedAi+5fwk2BE72wIV8fsgn+NyFM8OLoh/JoOiw3OFxJt8zNV1?=
 =?us-ascii?Q?YJls0r9cJ5zUxrG11LW23UBfetbd7JQvCbBDn3whCnAimi5S1+raLedPyjEN?=
 =?us-ascii?Q?pZMmjz0JWNp4zKfAfE6MeICOUpTZ/0GjOA9Dcts+E81HyvxkoJbY0TYFyeOq?=
 =?us-ascii?Q?AnjuEboodA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB8614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674c3e92-1671-48a8-54ae-08df34d8d0dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 09:49:53.1322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQdPodvEw9EtudqrTQpq9X1rprM1P3PklRH1d0/oBUpfk2h3ZIJTSPtPk0B5Yx/bMvCwhj8ibZww3bXUxMX02A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_025000_386432_44ECB328 
X-CRM114-Status: GOOD (  18.18  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: 10 September 2026 04:33
> To: Jason Gunthorpe <jgg@nvidia.com>; Catalin Marinas
> <catalin.marinas@arm.com>; Will Deacon <will@kernel.org>;
> joro@8bytes.org; Robin Murphy <robin.murphy@arm.com>;
> rafael@kernel.org; Danilo Krummrich <dakr@kernel.org>; Marek Szyprowski
> <m.szyprowski@samsung.com>; aneesh.kumar@kernel.org
> Cc: Mark Rutland <mark.rutland@arm.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Suzuki K Poulose
> <suzuki.poulose@arm.com>; Gavin Shan <gshan@redhat.com>; Vikram Sethi
> <vsethi@nvidia.com>; Anshuman Khandual
> <anshuman.khandual@arm.com>; Shanker Donthineni
> <sdonthineni@nvidia.com>; Mostafa Saleh <smostafa@google.com>;
> rppt@kernel.org; Thomas Huth <thuth@redhat.com>; Marc Zyngier
> <maz@kernel.org>; Ryan Roberts <ryan.roberts@arm.com>; kas@kernel.org;
> Kohei Enju <enju.kohei@fujitsu.com>; Shaopeng Tan
> <tan.shaopeng@jp.fujitsu.com>; Ard Biesheuvel <ardb@kernel.org>; James
> Morse <james.morse@arm.com>; Steven Price <steven.price@arm.com>;
> Sang-Heon Jeon <ekffu200098@gmail.com>; Omar Sandoval
> <osandov@fb.com>; Andrew Morton <akpm@linux-foundation.org>; Jinjie
> Ruan <ruanjinjie@huawei.com>; Sam Edwards <cfsworks@gmail.com>;
> Douglas Anderson <dianders@chromium.org>; Florian Fainelli
> <florian.fainelli@broadcom.com>; Chen-Yu Tsai <wenst@chromium.org>;
> Huacai Chen <chenhuacai@kernel.org>; Thomas Zimmermann
> <tzimmermann@suse.de>; Pranjal Shrivastava <praan@google.com>; Ashish
> Mhetre <amhetre@nvidia.com>; Shameer Kolothum Thodi
> <skolothumtho@nvidia.com>; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; iommu@lists.linux.dev; driver-core@lists.linux.de=
v;
> Sonang Patel <sonangp@nvidia.com>; Ankit Agrawal <ankita@nvidia.com>
> Subject: [PATCH v1 2/8] firmware: arm_rmm: Add VSMMU commands and
> fields
>=20
> DEN0137 2.0-bet3 adds the RSI_VSMMU_GET_INFO command and replaces
> the old
> RSI_VSMMU_ACTIVATE command with RSI_ARCH_DEV_ACTIVATE.
>=20
> Add the command IDs, return codes, SMMUv3 device type, and helpers for
> both
> commands.
>=20
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/arm-rsi-cmds.h  | 22 ++++++++++++++++++++++
>  include/linux/arm-smccc-rsi.h | 20 ++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>=20
> diff --git a/include/linux/arm-rsi-cmds.h b/include/linux/arm-rsi-cmds.h
> index 13478e14c4296..548ab0bcac722 100644
> --- a/include/linux/arm-rsi-cmds.h
> +++ b/include/linux/arm-rsi-cmds.h
> @@ -237,4 +237,26 @@ static inline unsigned long
> rsi_attestation_token_continue(phys_addr_t granule,
>  	return res.a0;
>  }
>=20
> +static inline unsigned long rsi_vsmmu_get_info(phys_addr_t addr,
> +					       phys_addr_t *top)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(SMC_RSI_VSMMU_GET_INFO, addr, &res);
> +	if (res.a0 =3D=3D RSI_SUCCESS && top)
> +		*top =3D res.a1;
> +
> +	return res.a0;
> +}
> +
> +static inline unsigned long rsi_arch_dev_activate(phys_addr_t base,
> +						  unsigned long dev_type)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(SMC_RSI_ARCH_DEV_ACTIVATE, base,
> dev_type, &res);

These calls leave unused input registers unspecified, whereas
DEN0137 bet3 B1.2 marks them SBZ. Could we explicitly zero them?

"On calling an RMI or RSI command, any of X1- X16 which are not
 specified as input values in the command definition SBZ"

Thanks,
Shameer


