Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99A8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sjixhviy;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hv8BcknV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h4SPeF3XTiM31B1zYroX9U/rQmkVAUVORfo85C3IF98=; b=sjixhviy5SHY9aLR5QQI7tMf2x
	Vj1GqalLyeBKkTljDYgKL3Qi5Jy83tIiE7xCMrcGAOnoioZrkQT7Ldy+ftdpZKUp9SvZJ1iUymlo5
	LlMPHmeAIGDzCI1GvTD/EyCg1BNXspSAnq87uM3xdPC3Ia3GCKqEkvjOAnsUxRZfsCifzJLNlXOsZ
	6+Si5nDGZW0yeIlzwVeKlnlwKl26op+jSHYxOvgIWKHMWEaNeQLbzPWt2ujiGXLjZNsmzeR0/+ZL8
	60r3fGdA/tOqIwjmaNsBXcC2lwVhlhpqrLE2GZ4QQxGD8opuoTI8zFPdqU/z2tTVDjoIHV/Vvu32b
	Uj5iWBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xML4I-00000008fWP-0At6;
	Thu, 29 Oct 2026 08:01:02 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xML4D-00000008fVR-45hY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 08:01:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQ8JeLJ3wAIFH+z7htOsdczlBIZbVEtBlbD3Odcle028FU5ricscjO02iTglvvPnR64sNbhA3m8oEIYJMKEKr3Efl7WoNu6q2yd0gkTu5VQXbxXViaJRD5A/WEX83cL8DnpqnFN2nXWlCLwWv774oU6EjcTJHD3e/MVHFLedDnXqn6odgPJ996p28ubLC87L4ZORgooediANuhQ8ug+fK30/eAkKnpDw3dKtcLpek0bnFjyvp9zWyJT5Qv7hlqWB1NtawvJDnH0NpuzO+nVvGeUMQ0OWe+QPzXnk+rtT9IyrC9cygTUiSvPT1VvMfOfyS1qh/R/VRmsF3bwOJoQo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4SPeF3XTiM31B1zYroX9U/rQmkVAUVORfo85C3IF98=;
 b=FmN4k9C9x94yBwOFwvIzVsmo8cxIGp9wXDof45Aiu631Zz3CNdnyIY/DZfx+oRSBW6avlytFd5PfFIV+9VAWSODqMhA7DKjW0eWdA7J5yxVMVPJpRorrg9TCucauVcewDmlMFZZcfmVLufXIfoFBKG6YDYYzrFvPoaSltK7AdITo6zOMzZnqY7ZqGKF+BsIL64GX95Lcc9MTtkVn7YCbfiqaRLnYRg5nYRhFMIuwTtuFNvL9XzO3sa8gnhvo76SWoaoKawUuEiGg3XPAI4jlutXCF+T1GSpHOvFCkFPyWxqPl6mnq9lR9LYbqJlGabJfACCbyKnBlzc1YFikxjIhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4SPeF3XTiM31B1zYroX9U/rQmkVAUVORfo85C3IF98=;
 b=hv8BcknV20sWdNImNZoXj4ple1UtPx8zzBwKVV8xOw8tifvoQa7cdLO+Jc3yIZBKvcFP+W4YHSmGpfkoQemMwIOFDZTW08C1soR7KrVXqKJlzaFLKB/5xAUWk5VRWU6SBFaqavDSsEgnM+x0SCADCLEnNUc4+xLtgkxpvJfDft7NpTZBc9IH+7frxFSojxVB6ejVVboFLquwwImvgM72kwktaph1t9/eYT0UVVnAyAAGnE32z1Ke73fvJaol5WcwI0f0q+GB9uV55o/Su3VYqUUpO3/2gVjFJyvHE8hd1ai37rXK8/KV8fzEpd56TDUsJuCpfA100UNn5sze/2Hwfg==
Received: from SJ0PR12MB8614.namprd12.prod.outlook.com (2603:10b6:a03:47d::17)
 by DM4PR12MB6232.namprd12.prod.outlook.com (2603:10b6:8:a5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.20; Thu, 29 Oct 2026 07:58:56 +0000
Received: from SJ0PR12MB8614.namprd12.prod.outlook.com
 ([fe80::fe0a:6e6a:fe60:a43b]) by SJ0PR12MB8614.namprd12.prod.outlook.com
 ([fe80::fe0a:6e6a:fe60:a43b%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 07:58:56 +0000
From: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "joro@8bytes.org"
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, "rafael@kernel.org"
	<rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Gavin Shan <gshan@redhat.com>, Vikram Sethi
	<vsethi@nvidia.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, Mostafa Saleh <smostafa@google.com>,
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
Subject: RE: [PATCH v1 8/8] iommu/arm-smmu-v3: Probe a guest-level Realm VSMMU
 via RSI commands
Thread-Topic: [PATCH v1 8/8] iommu/arm-smmu-v3: Probe a guest-level Realm
 VSMMU via RSI commands
Thread-Index: AQHdQNVOuiO7B+HXKkGq3lGx7D+HHLcTYs/QgAAqUQCAAOQrkA==
Date: Thu, 29 Oct 2026 07:58:56 +0000
Message-ID: <SJ0PR12MB8614BAF8E35987533269CAD9AB6E2@SJ0PR12MB8614.namprd12.prod.outlook.com>
References: <cover.1789010941.git.nicolinc@nvidia.com>
 <df25452641dc126eb334a1bfbe5eee16cc8a8953.1789010941.git.nicolinc@nvidia.com>
 <SJ0PR12MB861403B542B8D63B2AACE18EAB6F2@SJ0PR12MB8614.namprd12.prod.outlook.com>
 <auI6OGDh723S+6Dh@nvidia.com>
In-Reply-To: <auI6OGDh723S+6Dh@nvidia.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB8614:EE_|DM4PR12MB6232:EE_
x-ms-office365-filtering-correlation-id: b43e837b-e7f0-485f-b26c-08df35927b61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|22082099003|18002099003|261028144727099003|261026140227099003|3023799007|10067099003|38070700021|11063799006|261022075727099003|56012099006|261026121527099003|261022105027099003|261021135927099003|261021121427099003|261009223027099003|4143699003;
x-microsoft-antispam-message-info: 25qy3dXPqc/GrolmKIUa0MDLk/hoTH/3WbNW8ITVSrnRusNSlOqntjdRA1miI1oBfaLJIDT9eG7u74l0DiUdbXbyjQb2qAJvmID1I44WQU62rWmpCR2ZnoWcXBgCD5USVyItH4y6Q06Np+WzTX+6HQM+jxsRrLrprPvULu909DXh+ZIoaZ0iznBpEYGrjuPup0BYnppFqclHdJ5b+kt7y7Vy54jdURg5e7HwSTi0XSTvVbTqg3M3ZoJF5in0Fjr/z0GJxfLmXo/0yuoPF+EUbPbXjdcmU00fBeKVJFIyNya8/HAD1nLeZo63aS3wjNDe5Um8on4LNh23viIURsM9iH0/4gFp4N0cDPYv/OY7o4Yzb+WO1jQ+BUj324BNthV1o+X7C4sWqaHPeNPBwHCTAeFR4rAhItLeI63xa/4YQBOWHd7P0iim1CiCWiOkhQUBgC6qBCwgPpx79EkcfhLIsxYZZ8R/nuKj3agqN/allRjXvGPILY5xDy7uMdOmpzd9tam/hzQhs8IxzTBRw2iLyFb1e1xIB0tFUmtMFHUHg0V7zmbrP6/mEAgXQKXD0PnbxFf1Z8kHx8hPWONnJVxwlrE3331DlWLpt77suZZNNIdI+h2qTdfXmCD4pQaecOEt/T7IvfSS7IKlhvuF1iBFZN/TE8XfucJFvAuYxjAsQfPaAScCKpzTmeFRGbxGF0SoTultssxTFZFqBmwXxO74ix1Sbz1gHA4sTy9+ENMUgqs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB8614.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(261028144727099003)(261026140227099003)(3023799007)(10067099003)(38070700021)(11063799006)(261022075727099003)(56012099006)(261026121527099003)(261022105027099003)(261021135927099003)(261021121427099003)(261009223027099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4FnAMSpNII5rpZ+cRzti5RqAhYqSqjNjzL7OniXJ68AvhSlWvRAzg/wpQwGh?=
 =?us-ascii?Q?J66CtJ8Aj361F5TA9U6EJJidlxHz8haypAut0Ghrj7BAJ0RjgX2CxVqPvitD?=
 =?us-ascii?Q?yUDJHhPXNpa3cDHNfbxKvNrdML15Znmk3UdWrUh39Qttp+Ed+bKNOTGC/NYn?=
 =?us-ascii?Q?Cr45w/8MDX6AFWM2wttKBygzrvOMQZWKoYieBHOqzoyleQeWtNcRq/6E0QDv?=
 =?us-ascii?Q?N86Wc/A+oUwVBt3v4JnTUjpXxaxIT/2bD812Y+Hkzet+JIrqTXY6DZR//mHl?=
 =?us-ascii?Q?X6fRpV4gSmGnqIq4dYRVetlxQlcrXCFGrvXNsujsrIUmkCl/uwfOn2WvOAKh?=
 =?us-ascii?Q?3vGAJ86N3yf4tqcPNi+i80Vio+WSGKS+8UF9QXhFEdkFGFJJaEzUJ31CjrCY?=
 =?us-ascii?Q?6rTnVKeFWBeuMtHdygP6UxP6ID/rHs/AH+Bb5CjaxC9qW5CwUyxl1gOiLRUT?=
 =?us-ascii?Q?WWRRcyzfBrr6g2mj2y/KMiZSzzwqRfAm/9ZDZWhepQOLaATHp3lSqFwiKZex?=
 =?us-ascii?Q?Sc2F1WQk3IYVOdt8aWuRJ22GYHv0ZTi5Swe3D/IXD07MxwDDLA5eOImFlrZs?=
 =?us-ascii?Q?kqh4yUYbXxzyx5x5xf1F+Rhgv29kXzWKRjIVKGFc2vq7hAFLYVGi6gNCvz7j?=
 =?us-ascii?Q?QaOj/QJcorD9yWPUFKCl8WScMKmAh7glhWHw3QqNoJ+LkqaaLgssq8mKhkn0?=
 =?us-ascii?Q?29PGaODTsbWmipJbSE1mEHu2BLL1oeoIXOAc4J7rp57zF80H1qFFMoiyJHOW?=
 =?us-ascii?Q?1cfa6b7ML3ZwzrqGrVT6MVIWwBTGymDTaShNf6m3boqat5w+7yCerQHzu4Re?=
 =?us-ascii?Q?8nxgfDNlzfLxskoGTSHO/bCgeghvYSLMjCRqb4b4eOWb5Ney1gBm4ajPajAm?=
 =?us-ascii?Q?HzqP8NBGXMcBGubrTTgoVk6DhCZT8V/uM1a//J8o8BoLoCDurmcKLfrjvv0g?=
 =?us-ascii?Q?c3WLOv02im7l+ChhJpAT5bNs6yVbzlZlGIqfV1tW5Bdlpco7V6gdCg+qiZHy?=
 =?us-ascii?Q?qjWezbgF7Co+tIwWj2MgBHRWGgoBXyAYDHUd9hCbw2J0L6eVs6itLUW+YkIf?=
 =?us-ascii?Q?rAHTbdiZPDdqL2AGnoeQA2SNiAaTqrzvVDnQ+zv7TwCMF7C0kRmA/nALIhRf?=
 =?us-ascii?Q?cwRvdNH5T7ulTo5594+cALq+ILWqbvUOjT40gxHL46o7FuDAKjZzIPbjkbLx?=
 =?us-ascii?Q?DAqO9TbCAVvO7N1Ulpot8NLCpUEkguN2ncDJh9JHQE4L24zVyxBVM48UDMUZ?=
 =?us-ascii?Q?kkG9xe0NMoJPd75Ulh//V45IwE5puaL11unFz1QjyhNw5AFBBFLSM3BllGt+?=
 =?us-ascii?Q?Fk95gSmKWBroaZEuOYSBEo90s1mUP3RLI60F4L6hOKfVy0pR+B+A8Uv9E0g2?=
 =?us-ascii?Q?gOUFIOvA3BGyUpDNVVl1oZ2XUBCFBF0JMIDAvq7jMhFoBgpDXc3Th32XAGis?=
 =?us-ascii?Q?F8Un60J1heLFmahvZlvP27CrHkXxVeyHwf1JAcONJ8yFh/UL8qYD1KzfGbq+?=
 =?us-ascii?Q?htMoQNrbr6DZKqLVAahIUQVvfSWK7H8fVslzYC1WuDhiZuv9Jm/kEquw3aP3?=
 =?us-ascii?Q?lmn7+bPaDzfhwfoJ2MJCiOfK7WOc1Ct9G6OEQJPBC1ecLtXSOSBCa9rw9wcx?=
 =?us-ascii?Q?34vcarBOkBXA5hepVls3N2K0V9J5qSDxPP8maqK7Wg62Rk4jXYerxu4iVEBN?=
 =?us-ascii?Q?DIYer75y6e/xf0kCZD0yDAp2MRgwd4RBgCz2dzZYyiB0Igy1Hi2wM+nN3NsU?=
 =?us-ascii?Q?umLO1avYPA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB8614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43e837b-e7f0-485f-b26c-08df35927b61
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 07:58:56.1053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nhu8uiTdv+8JH26pGSHGFIBq1jn3AhSCus6NEirc2LoHPp1wRsDzEmgHNWE6RGQDPhaANCdvCu5xCByWXOxjlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6232
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_010058_050133_06AB3929 
X-CRM114-Status: GOOD (  18.55  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: 28 October 2026 18:09
> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>; Catalin Marinas
> <catalin.marinas@arm.com>; Will Deacon <will@kernel.org>;
> joro@8bytes.org; Robin Murphy <robin.murphy@arm.com>;
> rafael@kernel.org; Danilo Krummrich <dakr@kernel.org>; Marek Szyprowski
> <m.szyprowski@samsung.com>; aneesh.kumar@kernel.org; Mark Rutland
> <mark.rutland@arm.com>; Greg Kroah-Hartman
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
> Mhetre <amhetre@nvidia.com>; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; iommu@lists.linux.dev; driver-core@lists.linux.de=
v;
> Sonang Patel <sonangp@nvidia.com>; Ankit Agrawal <ankita@nvidia.com>
> Subject: Re: [PATCH v1 8/8] iommu/arm-smmu-v3: Probe a guest-level Realm
> VSMMU via RSI commands
>=20
> On Wed, Oct 28, 2026 at 08:41:13AM -0700, Shameer Kolothum Thodi
> wrote:
> > > @@ -5542,6 +5591,12 @@ static int arm_smmu_device_probe(struct
> > > platform_device *pdev)
> > >  	}
> > >  	ioaddr =3D res->start;
> > >
> > > +	if (is_realm_world()) {
> > > +		ret =3D arm_smmu_probe_realm_vsmmu(smmu, res);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> >
> > If probe fails after activation succeeds above, wouldn't a module
> > reload hit RSI_ERROR_DEVICE since the VSMMU is still ACTIVE?
> >
> > B5.4.1.2:
> >
> >  pre:  vsmmu.state =3D=3D VSMMU_ACTIVE
> >  post: result =3D=3D RSI_ERROR_DEVICE
> >
> > How is recovery handled?
>=20
> There is no way to undo an activation. But what's the practical
> use case for the SMMU driver to do a module reload?

I was thinking of an allocation failure, then onlining more memory
and retrying probe. Not sure how realistic that is in practice.

Any idea why guest side deactivation isn't allowed? I couldn't find
the rationale in the spec. Perhaps it needs additional synchronization.

Thanks,
Shameer

