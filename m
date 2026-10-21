Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBF2606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AIZp0dXz;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qd+p8nHT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39CJtJL5DfY4hoi+5T/wlFC1iH8JKF5ceBG68FSqb/k=; b=AIZp0dXzrp+NDUdy0v/s2dfCjc
	Ltgx/JRATPD9y4qwXwSrv2bnOR7sV22TIfg04vhLq2mjyWe0dkdP+h4lgnMAvvDdySREPGnGnxybO
	mT4CL6Vx6s8BB6ykMaRVTTjLCVRn6bejwGzvQkwHJb1EoLeGmBxbgTwLKg2h+7YLQrE+5UgCdjLu2
	iGFFsRFM0Rb/EKPQIO0Ydv8D5C6o0CMGfN2CSVfo5o5dciW+lhp9hlQEJCSCjzz4lIjEmnySEjRwq
	a/dH7ua8UhTnhAEcibMhj01g6nwZETgs/x19+MGQU2PzTef1Dt6C3vVdllpl66UJS3m+3HLCS95vd
	QT6JP+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWyF-0000000C36Q-1sxX;
	Wed, 21 Oct 2026 14:07:11 +0000
Received: from mail-northcentralusazon11010003.outbound.protection.outlook.com ([52.101.193.3] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWyD-0000000C35l-0XxE;
	Wed, 21 Oct 2026 14:07:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iafvj9WSbw/h7QRYNFkcd+Tt7A0WWV7prquV7J5D1h3jyGw50Up2p/KwMe4f0h7eVHQOEH5oMz5Vp6GoU0WMdWjvRrgcid6qkNBrveHDuR6zPhpRAb7a35qSbBEmklQJKzgPwrd4R99bP1frJ/e1eVy9B4SSvKw6rhFTTCg5pPASS/gC1t2RQVtDi8Tk22LuU4xm35GTYUDPef6sbil/IyrQa+seG5Dg1WWcIZTRF5jx+7rTo9vWGJf1NAHjGXehHjbyiojDS/YbZgtWmx9a4LGNX4y7LX3kQ4Vz0229DMOgm8dDGYumwMwplf2whzQIohWDynd+EI0LUmA16Vs/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39CJtJL5DfY4hoi+5T/wlFC1iH8JKF5ceBG68FSqb/k=;
 b=rAyOTf+RmAb3hcpMvbfH4uoW0vTE7UfySO63xD4Iv2xLhlg54ipmIisd+/wxbzYi0bwhy96IfOag9ejSmBWPKBhQ8f3UagnKQ1Xq+PdDTQsg4cL+WZ7XO792WrUtl1DkJyDegSxI+aIk31Qy0dShnBNQySvGRxZJbovaPsDjXNl95+yji4OwoQviOtDLfoBx8aPJC7S6ijRMIdA/9AFMoc1he9tVCH6hT1ASzS4Ge9i4xuSGgJKENQQofRPUJ6cT7aGIUyZ6+WMV+rU1hFFbKl/tsgybaRv1rQfkC7yKBrdnumz+ROWCCBXOf0UK7ANx4BWlI4qLWnINlYvZCPB35w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39CJtJL5DfY4hoi+5T/wlFC1iH8JKF5ceBG68FSqb/k=;
 b=qd+p8nHTZJ5mckTouL/dcXKJ3NbP7HnMbrnglGRI7Yb66esNFh5hdAZqjAvmfWyiChkgHxg+kHdrEhjXY8tRFTuTCO1+u4lVpbZtIagAzTVzieGh5y2vx0/vy4uiuiJeWT63oyRcb3Pf3yHwO2n1LbDRbQ7pugZwEBB13YcaogCf3ee673ALW2g+sFQijZhO6LDqUe7q7NbZ1EkAOmeykiSDaIi1jziGUNeYrc4KrXf58kB7kHJZvus+rJZfbV902p+k5q8v3sFyVCwOtZ8+E+mdkInJ89vwIaEBokSSdnR9pZQ7IieYSoc7Oc4zoNMo4xZYpD2T7jidHzzETq/IFQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by DS0PR12MB9423.namprd12.prod.outlook.com
 (2603:10b6:8:192::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 14:06:53 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 14:06:53 +0000
Date: Wed, 21 Oct 2026 11:06:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, David Sterba <dsterba@suse.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Glass <sjg@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nick Terrell <terrelln@fb.com>, Will Deacon <will@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-integrity@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>, patches@lists.linux.dev,
	Piotr =?utf-8?B?S3LDs2w=?= <piotr.krol@3mdeb.com>,
	Ross Philipson <ross.philipson@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH v2 15/15] efi/arm64: Implement ARM64 DRTM in the stub
Message-ID: <20261021140649.GO3008132@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <15-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <athzBHFwyp0bFEu9@e129823.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <athzBHFwyp0bFEu9@e129823.arm.com>
X-ClientProxiedBy: BN9PR03CA0784.namprd03.prod.outlook.com
 (2603:10b6:408:13f::9) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|DS0PR12MB9423:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c806215-cc1c-4385-944e-08df2f7c8ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|22082099003|18002099003|10067099003|3023799007|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: nQdqlFq3wT9Rke74fGJ8+jEEMldgASC2kkokJnfhtrL+weCt71+WZbdkTMvcou3yodZvWa3nuTld5JPSd68NOCk8fmfmutZjXqEyHi2lcpU8fncLG5rK0o+RBZ4jF5ZvRUkpCsCQN8/DLIooKy8hWfVZhpNSyMEgElBJx0HKNAdO8hcxGKt1HW2SB+QQXNcDDjGv6PIghrQnRChZtUMzzIyjcLu8BtmIGuwK33Ur6726sSKimwXOScIgCs+uWG0Ne96q9OXVBnfppZ2lD+xvB+8SN6ZpAC9EqI86JEByIxTWxmR6AkBzZj/oBTV2o+Fp24kn3uwtgf3fNBRQInSPIHsiKH9/5YzeK+ioTba8PzvDNsKSoMZjgZ9FdGaJdJzZriVH6ux9P/jeLGYfE0kqb01T7fu7T85nolUv9EHVslUk/4/VCYfIfSbgwtYfLwTWJte4UWRFRkmrmMmImY5oBrpXeHwStCT8vjsJlc3cUXjDkwlQp6wlRCiql9xyCo3LkENaX2TAanGUtC3sHxakuyRkMQ+Dieauoh59dkncEHxorqoX3qDomEUNdPziB41QlnRwpn8op6aQqodyzHGkX7amgweiqMxPtRJTjTf0mwkdRt0nlKFIPaBJiQZPH6RG6qZZn6BhEE80MSOL5RYWVobIHH09SSdFhR6lP/zt6eI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(3023799007)(4143699003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S9b4dE682NgMTZDCFx2hxEWqFMWDSe1r6PjgcnDsLIN5i+SzEHSA08zRn7Q6?=
 =?us-ascii?Q?DSW1A2pW7NGVkFM+knxN/VxENJOA9LAy30X/05Am5mf7ooRne257rXIHog4G?=
 =?us-ascii?Q?mXOef2Nwr37KLMbaAlapXJeTf0e0VebO1MfYK6RnRVYsHmYIZhjDlmvsf8N3?=
 =?us-ascii?Q?IT6WXsjWPqqspWqz9UbXx0wJYf6vHHJTAN75da7Q5iHYsqJfPgFsxcsBsJFq?=
 =?us-ascii?Q?z/QQDsZ9ilhUzwJi9FA0vSxZXplgyXo4prbYLuoNBtWwXJz92f+fMcEqc8/p?=
 =?us-ascii?Q?bgYLKwEHgmd49NyIrz8nc4BR22RW/VP1PX2yWKr+sVuBiqztjDNiV1fcIqlh?=
 =?us-ascii?Q?QPT/obfSixhk5FfTMuLwBzzCSDOKACbPPsg97iJbWs+8CIZShaqIBK358NVX?=
 =?us-ascii?Q?OvPliJGihWr1HY2VO12OERC5IFtTXGffjrtVPrqr2Jaj+a1UDfSvaAVLcv+5?=
 =?us-ascii?Q?5Af6myg1Y7+fMmMKu/TnOj0JsiS8BpqI0OzsfYwzrJ2yoAyty4ypjB5JOgPn?=
 =?us-ascii?Q?Y03hj4KeuUsmgtJzA+Ty9C07Aoq6Iuw5XHRUPMuhf5WHGRRb6JyPPPXU4MIm?=
 =?us-ascii?Q?ejZcnxAdWrdDnhCrC14rK9ekyupXeCSXTnwUoTBzr4bNaIcLq2mAyCzm3HOr?=
 =?us-ascii?Q?RXObP35C6aIMsnUx+493YV/yNrBCmNlmiqezZ4Hr5BCaeQfZK+hTqbGfgK4F?=
 =?us-ascii?Q?LO/28mxQg6fsskKQ2owjyGFmazLqziu/rvSrjqOv1v1nCLTCo2TuKA/8OAgT?=
 =?us-ascii?Q?2c1ZgTxJdYgj9saPnTjpn4CkJ2/qQHzXIuK4RZQ787wJhH4ETRv4w2DQBxpS?=
 =?us-ascii?Q?aImsvo1yQDdsj/N/2yfP4W3uCkz7EXgLmPdB6F6H0/CCxQmAD7UDwFx0uUVd?=
 =?us-ascii?Q?bxWmbKowAJuM+t4ZmcozyW4d9mXf983t9T1lLlUl7XVzahhrhKoA1/YWjA/W?=
 =?us-ascii?Q?p+SHHxuUW5LWu1mbBTm+TdX7TOi9xvHr+BMmRsFNLazsFbk+/jpq7CN48xuB?=
 =?us-ascii?Q?ShK98f+yVG4k8SbvLjiUMDDR6Ab1ELKIVDo61m93jaOwlnV5Sx5oI1AGiMT3?=
 =?us-ascii?Q?eQSpNNOsAthnAdQq0K/gzCW95eeKYKSvTBqPEOV6nqnqWeo12yFV6iyJBlpd?=
 =?us-ascii?Q?UwExKB5M6ruNj9NKnpo/scZ0+xMMKuBLjX760ziPyMMhFePXzUJu2/lKsNLe?=
 =?us-ascii?Q?mhozuIGV6kUIAhKRFbZG7RSD5lYOFXpWwIJhFM3kxIBRfp8+ecV0LP1a6ixO?=
 =?us-ascii?Q?u+nDyOv/rcm5JeGn5ny8fsfADSywrr07A8pI1UtfmOrE4AAZMbkcqFIUZeHl?=
 =?us-ascii?Q?jHbVi2w0p64gQZEIp/WuayryhIiSjQQC1pC4SuB3oG0utv+XmmIyxWTIpKSY?=
 =?us-ascii?Q?FoOnKdhwUPQzyeArd6cB4l2IW0uCLCwM85qs4jgN64X0i70iJeQ6sk7s4woe?=
 =?us-ascii?Q?PK+nfzST5HCtbyunkbw8EybJQmQlStIr+LxCflAvMzrzf18e4udrnvmOPWUJ?=
 =?us-ascii?Q?x6myfAgPWQIkNbEaOxU1knuyz9CRcRwmAGnhll8MHG4NPju+aTbRlE36Ofca?=
 =?us-ascii?Q?pHddFoX72YchQZEBB84dPLW9Fr3DvBjjQy8YLZwCg9wh7sFSEBx6vBjXj0h/?=
 =?us-ascii?Q?71baJw8Sr5yrNONQAxRF7TzJjd3gL2Mn3m3AgliFZDecDSxj7JIhv2IWrtSS?=
 =?us-ascii?Q?mCL63uezjebYRT4VWfB6amd7IGGmTkf+P7XHfvrrrqaREmwN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c806215-cc1c-4385-944e-08df2f7c8ed9
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:06:53.0133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1sH71SE+XgGoRDuuTBD5awM1dJmp9+bRBzmSy2mtQtQgaqLfLfs3yIvUIeEGe48
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9423
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_070709_192369_660FBD17 
X-CRM114-Status: GOOD (  11.62  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:08:36AM +0100, Yeoreum Yun wrote:
> > +	image_size = le64_to_cpu(header->image_size);
> > +	measured_offset = info->drtm_measured_start;
> > +	measured_size = info->dlme_measured_size;
> > +	entry = info->drtm_entry;
> > +	dlme_start = image_base + image_size;
> > +	dlme_end = dlme_start + drtm_cfg.dlme_data_size;
> > +	dce_end = dlme_end + drtm_cfg.nw_dce_size;
> 
> Suppose user boot the kernel via decompressed Image which is the
> part of artifact of compressed image and use the drtm option (e.g.
> booting via UEFI shell with decompressed Image).

Yep, it works fine:

EFI stub: DRTM: interface version 1.4
EFI stub: DEBUG: DRTM: TPM algorithm 0xc, TPM hashing unavailable, PCR schemas 0x1
EFI stub: DEBUG: DRTM: minimum DLME data 73728 bytes, Normal-world DCE 0 bytes
EFI stub: Booting Linux Kernel...
EFI stub: Generating empty DTB
EFI stub: Exiting boot services...
EFI stub: DEBUG: DRTM: will launch, selected launch features 0x0

Notice there is no "Decompressing Linux Kernel"

> Since the drtm extra memory is allocated only in efi_zboot_entry(),
> I think the drtm extra memory wouldn't be allocated so it would corrupt
> memory while setting the laucn parameter or by DRTM...

Patch "efi/libstub: Have efi_kaslr_relocate_kernel() handle
extra_size" handles the Image case.

Thanks,
Jason

