Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DB2C9831F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bzmn01FBwHc5LSvPz5UCyvmqxfgaoz2By0qNflOpk8I=; b=W8rBIMtVrhXXMnJ6LR6pPOT/vy
	oZDUauUqv6nsTfCbaPHzFdXdU6x/6vqJb9jP1kls0sUa8qGsTfcV97fyzvFDzeR58a670eZXPHM19
	XNZ3YtyA6MNMX+c4Tt7OhVPowwhqpLZaDTfW/Xl9X5chcOudJZj+o88TQFXsjV++S6XdN6piTIJJS
	F/tiIBP48ZaNinUGBDXls4eicPfGFEyEcCCR3cxyZDz3J+IsN1q5KttmPY/RbJQDC9yBG+YsOfvxu
	BdLKiM8Dj8fQ4pV+CXHBSsR7fDwg9YoVOsxwmf6qVH8U47Q3Xsm3uMg7cD5DZYDgqgqRp7CWQegXn
	SvIqfXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9juN-0000000BBCp-2wUK;
	Thu, 24 Sep 2026 13:54:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jtR-0000000B9hq-1i6t;
	Thu, 24 Sep 2026 13:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Bzmn01FBwHc5LSvPz5UCyvmqxfgaoz2By0qNflOpk8I=; b=FRmyh/630uzZqQwfWqm11c9b/W
	VEZ1OUQIIa4S924oMbNnKA9z95uLuV1pQh04K6vD33D+XeNSdAAQz2A6d/8VuwsCsdXKzklU2cfiw
	sKZunR3Vh8ch1Rpp/5IIR3hJWLCJuZn7iXe1U7fKu11BCF+HHpZlh/eqSxSwVR7TqYOJacD/mMG0x
	OFbrwHs8aGnO7RWOFxMSjHe3MsVc0bC7OstwF+AsnTU0MHE/aZ7u/WBDif48KjqHBYFCUAl4Q7E4V
	7KdixUe9vqhgC/RHvplrAIQmqVAjgpSPaUGmcxApLQCMtFpktvOmf/4cQ/U0Ss8ycbUWQxvBihz79
	44Da7+Bw==;
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9jtO-0000000G2w9-2Q2H;
	Thu, 24 Sep 2026 13:53:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6FaEW8oH1OspZ2rnUITrw7T/LijJ+W3WLA1OrlfuTZnSriasdgKef2ddj6nf+JDrS02KWcWDaY98yW+HtqaPAyykNHrYYGYdRP9+8bYsspzHxRXumnW1eVlb34GOA2Sho5F/t3FDEXku9ydwxV0u3mzok7l31tSsfjaDAki3jC2Unm0as2OBz6fRCBsGmPQHNTw6tSChT544yNYQABMxkM8aN+8h3qur/1IU+cL234BjTduRSPnYQTPTxoV9c2ufcB7XD+oLX7Xj5qroRNOON5fXFH8Vfhr3M61UzF/zcIs8KFyai9uvWxJAYsgqv77yHJJ7Tj+VOQXB7PLF8z8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bzmn01FBwHc5LSvPz5UCyvmqxfgaoz2By0qNflOpk8I=;
 b=JOMM/N+mW+yA+nHI0BbF6j8A2Pb3V6Tcv/g86+W+hcxfIaHWqRANqgB5OSbD80SM6pH2HHmjYSKcrUMUvgK9SV4pOyXSeHzSiv2EsDL/DrLgzjWiOXFSCUymxFVTGz3dKgVQh30ccE1nV4PDRvGaM/xGQwa4x3axT1y67uwwXXuv23QDzuvCWP8g2aZDZcPCEZf21N3z0VYunY//C3E16M808mvrGGKI7sBPcWinSr2FbASe9cB3PyD0btrP0vBJExDLTQdPK9cxZs6x+pDszifiHkCZD7qkvwZx2Stytr5M5emedqFlqpyRfaeRqNWg5NbfnJ5VfvIW5lfaUEDGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bzmn01FBwHc5LSvPz5UCyvmqxfgaoz2By0qNflOpk8I=;
 b=Ty32NvX95KnhHbLV8uoCI/IUW5RnIQgZsdw8f/IgpWw7Ju/UvMwRNIaN0eNgFKgUegtADRj/1QsdIyZljBl+LSJb92FLEPkvuIcgdZwWZOqr7lJe5gn9f9d+FvRD8AZ57rVobsdF0JF+difD6BqwyMbaVLVd+4IBQ2lsI5FsN+Ne/+UvSeE0z+jkzRr5Ewjy0xVb6Nbvttv+HYhqnWPv3Jll+nCQOZBoV+kvzviXYqi3Itd6IfBpmimVJene19KSdRV/0vNZZ0xVeemzNVbI/4g3Rkfo9Th39luQRbTx5Mv1Sm7AXG8yr2gTcq9U82hRTZI912f1mJ8QxWhGF81EpQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by PH7PR12MB7186.namprd12.prod.outlook.com
 (2603:10b6:510:202::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 13:53:35 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 13:53:35 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Sterba <dsterba@suse.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Glass <sjg@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nick Terrell <terrelln@fb.com>,
	Will Deacon <will@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-integrity@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	patches@lists.linux.dev,
	Ross Philipson <ross.philipson@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH 11/16] efi/libstub: Put the stub's writable data in unique sections for DRTM
Date: Thu, 24 Sep 2026 10:53:14 -0300
Message-ID: <11-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
In-Reply-To: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0055.namprd17.prod.outlook.com
 (2603:10b6:510:325::16) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|PH7PR12MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: 4819219d-5019-481e-f0f5-08df1a433397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|921020|10067099003|56012099006|11063799006|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: XPT2RB6vdw+bWcmw35WOHux2w15DwdkmcAEmk+68Cd6eLHXhACRCZmR48UFogEFLomvKtO9rsDbyPnfezFvmELipV17lHC0q7puTdoVIanuss1FMmERowWQIYTt7ToXY3W05Y2IbSXaOsNWhwE4RqBDcpHg29sp4kEnCOMWPp4RlznLk+JkbxYKd/DxGEKGgLQDdkoQAyvg4fOQ39qIkcpkGJK3m7Da7/Gjh86bqpr4QwJ2ImpTwGd+0nEL95w4oN2/qNAnJG20/e8rFAlQYBviJMleFMtqrnHtn6w5EmUoce4G66SjBwZai+RFp99Sy+g86hOCsq9nCgftWfwgktCufDeYXXVhuik0TSu0aLC+aTNxDH0XfiNDKXsxBfbI3a2QWggY8jrxVHbgZ84s9u5CPLbXGVSU0W4cHN2MgooD9+zompuQllNQVGjNzNIQQyxHqnd6JujO7odwEHSzBUeTjYK//BdeMOnYms1Db0mylDr1f+cB58ABsiQoR6asWJUawT4oU4QEOWUkjKazpEWyDY61UpRr7TLWOjYGSsQUNm++HcddMgjLvfoO1c1FQWmaGUYG3DvVFP6VcT+H5XqNOAcTk78u2nGGG96lqOfdUmUkaJzHGIl2VtGojliOx5J4BM9r2kb1F5gk/fk/4t8xbLtJPdOmnb24C7QlHw/7/tzeKHAoq9MwxxKY1252OLYKBYOo8CbStfn1+XjDCTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(921020)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k81ayijDyUa4gE+NEsoiWdqe0IsDPZC5JnWQd0Koq49KUf5p+Rog1Brp+YLv?=
 =?us-ascii?Q?bdWcdxupgWHhwcsRh/wSYFgpdAjKKzfMnRYG/Np2EOnzMUZAuabQR5XJL23l?=
 =?us-ascii?Q?LZWjxwzcHmt1/yu4+K+KtFQf5PxPiSZRB9sD7D/mN6QSThlgx4zXE4wPI0Lq?=
 =?us-ascii?Q?Zg5XCJeyOs8iIBnFuxsmYr4SvRijkQb50V8LOYHpnYRifaNPPsWkzsZzXsmZ?=
 =?us-ascii?Q?rpji2kT037u6oXufVphjibUxRwuwscTiieeum7+BMD+2pE0T2oTv1BZfdSFy?=
 =?us-ascii?Q?azb/+pRjcPgsiq5Hb9iePGSHwP3Dc+0PayxlX7SV5L1Iv84XNTVDQyrmUc4o?=
 =?us-ascii?Q?jf8HVh1fM6EFR5Pjgs0JnMjC9M4mGwprUXfdQvsVFnM/IigMgMnOamz3kuSC?=
 =?us-ascii?Q?FJvEWccfU6fDTLCTpA/QjkNocAMTQV4dZoisOIKfxX3PTW0WDFbRUbZTkNZS?=
 =?us-ascii?Q?ltOEAnd5nY7uNmDqSQ+TzzlIfM/+jvxfbF3p+UJGjnH9tJAJur6INBX66q4+?=
 =?us-ascii?Q?eAY497CtW6BmGuFLI8V2cLlKeEFOQptkiU4HAnsALc9mt2OP5d6j/EJ005PG?=
 =?us-ascii?Q?dC+BCPSavIaSIhzZ8pqPPLYTOFulS51R8G/LRIy03CAlzU0LoPPYDoY5Mmq6?=
 =?us-ascii?Q?yJzouqoMdLS+VlwR5y9fVR+6jEGueDfe+735Tdp/X6dYa6XBe1ofDM1SfKaI?=
 =?us-ascii?Q?UYls1ULVCMnuk0ynZzcAgMiTnKZyT4ljF5FYNIfgkUKGCpT4uYIgTI/ake+j?=
 =?us-ascii?Q?U9yYtijoLSbHuLyBHemTRqgjhlHCrWJ36UzF+/nI+8xGeTPS1+jsUOZGa2fb?=
 =?us-ascii?Q?XPEcA9ahynXrJW8yNRPlnSWnXe4TkAyHx+fPEKiU6QHTG/6ZnYCyZXLuxm8E?=
 =?us-ascii?Q?6j15RMaGfoipxE4ANenhwBluqZLT9YKx7NwOZjOJW1B/M197XN+N7aMZQiEu?=
 =?us-ascii?Q?/CrOMf9WmsGl71/K/qFjEly8lgaIhmYSUD7pT3/8dh4MRz+JkR40lZUSqOAT?=
 =?us-ascii?Q?wnwXC8j1sin79xg//8tsok7+qiotOZhVzAfVwzwqQ+9oCovqVMfu4CTff0OV?=
 =?us-ascii?Q?F2yKH66vH53DnU6qOuwOEfSRfrxV+T2DCmA87XOth73OTc0BDXs1sHTrPTA6?=
 =?us-ascii?Q?PKHkJi8ehTVCxGAQdbuHalU0eAj9hUXylHJKyluSkkk+qS4k52c4XAUSeCpI?=
 =?us-ascii?Q?aAw/yzayA/cTeWHcnjxv9Uj57nAjbOspeuj7fEJZjPKfDVAi5q6Qc4s177bz?=
 =?us-ascii?Q?XUvahn9uJ6ecl2NXBkXacl80apOuFo5+gEZUfKI5/zjyh8pSBRd8CWkzTCyh?=
 =?us-ascii?Q?4aAfVEFdreoiqI6rK+KRxtT693R5P0pzPuF80oiOjnTc/owtcJy3pwTjzGa+?=
 =?us-ascii?Q?VmiqaRCZwmokDgpcvS/VUQLwFxJLXD5rqdw/WAbIAb76W0O4nWRh526Bj0mg?=
 =?us-ascii?Q?8M0K7re68z8nZMKVMAq4ty4cwNziPGLun0eQCk2QHUQfwKnxmbkt7l4nfbBd?=
 =?us-ascii?Q?+Yv3DLSsAopSddudpafbNBzb8YUu5SryU3XQ2rWrI6joo67DwY08KNSAXa1J?=
 =?us-ascii?Q?F3eVLtOdO9NqlwfC1CbGrdgOavTATQ7H+zHJQ7BWaryzZGK4xP7wkMdr/mr+?=
 =?us-ascii?Q?2TsDvDr+UugOfmyy81mVDVWwb5wTYV0VMBUB7zz5x2ttOuPpHQgn8Cr5QvZ/?=
 =?us-ascii?Q?zvP5ZeSXapVK4FtnJYHAyZ3McnzWtZEWwgeGn3AKVEccXMAM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4819219d-5019-481e-f0f5-08df1a433397
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 13:53:24.1508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kuKTRCuTK2UwmScr0wgYj9oYuKC0M1jU6BK7G08TCflYSrQtMKrPehQPcYt+vUt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_145342_696779_3D9ECAA2 
X-CRM114-Status: GOOD (  11.44  )
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

Currently the EFI stub's .bss and .data are both placed in .init.data,
which allows them to be discarded after boot, but places them within the
region of memory we need to measure as part of a DRTM launch.

If the EFI stub modifies the measured data before the measurement, then we
can no longer get a predictable measurement.

Give them unique section names; the arch's linker script has to put
these sections outside the measured range.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/firmware/efi/libstub/Makefile  | 10 ++++++++++
 drivers/firmware/efi/libstub/zboot.lds |  4 ++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 77a2b2d74f3f62..3f1921e6c334d1 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -142,6 +142,16 @@ STUBCOPY_FLAGS-$(CONFIG_ARM64)	+= --prefix-alloc-sections=.init \
 				   --prefix-symbols=__efistub_
 STUBCOPY_RELOC-$(CONFIG_ARM64)	:= R_AARCH64_ABS
 
+# Give writable stub state a dedicated section namespace.  objcopy applies
+# section renames before section prefixes, irrespective of their command line
+# ordering, so these become .init.efidata and .init.efibss.
+#
+# The names must stay outside the .init.data.* namespace.  INIT_DATA collects
+# *(.init.data .init.data.*) into a measured kernel output section that the
+# arm64 linker script emits first.
+STUBCOPY_FLAGS-$(CONFIG_EFI_STUB_DRTM) += --rename-section .data=.efidata \
+					   --rename-section .bss=.efibss,load,alloc
+
 # For RISC-V, we don't need anything special other than arm64. Keep all the
 # symbols in .init section and make sure that no absolute symbols references
 # exist.
diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
index c7c2f4dd144301..5320a05498758d 100644
--- a/drivers/firmware/efi/libstub/zboot.lds
+++ b/drivers/firmware/efi/libstub/zboot.lds
@@ -38,13 +38,13 @@ SECTIONS
 
 	.data : ALIGN(4096) {
 		_data = .;
-		*(.data* .init.data*)
+		*(.data* .init.data* .init.efidata*)
 		_edata = ALIGN(512);
 		. = _edata;
 	}
 
 	.bss : {
-		*(.bss* .init.bss*)
+		*(.bss* .init.bss* .init.efibss*)
 		_end = ALIGN(512);
 		. = _end;
 	}
-- 
2.43.0


