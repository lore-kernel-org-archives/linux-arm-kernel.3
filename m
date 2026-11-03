Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C958606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FBpxIdP6;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rLQlUCJO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NxRFJnP0vCfVm5KhlOIIHh2uAAiRiqctWk96g7tOrUs=; b=FBpxIdP617QVqb3tVRE2xf3CvH
	aYK7/czGDeX2K3cWgeR3/ObOGG1PFAcXo2+AZlYb60/RTVbQr2VQyo1pihO62S8BSVv2/RHNvdYhE
	bnBqSjPBuaMSWpbqSq5xTyxFKN8w/DX1P56gN3t+1S3ySs2rtmdBSue26eE6wHaw9JG0H1L8lo5CT
	bJmZcVCWc0TlTTdxjlRPFabI+A5yY96ROc7JIj4eiBDmZmxeMYo+mKIDzvcfikqDsu0i3QxymzM3u
	mdZgi48ZcOJspmWzuwzvGK/Lx+R+fSm8hSWw7hMzkZdLAdEYgM8e4vAquCcAEXhSeqL55MueBa36x
	9h5YREXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGxQ-0000000334E-1jFD;
	Tue, 03 Nov 2026 16:01:56 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGxN-0000000333D-2fHa;
	Tue, 03 Nov 2026 16:01:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mR75k6cpFMLwvaYJm4aInbg9uPFkjAp8TRqL9tl/o0lAaOyIQRVSTB8ypKKJtvLCr9h/GuQsdjD3CGfWWrJvN4rkgiTfmFzeqgJtmlnJVsTWGzNy8PAdtpfv9IGIwwJ3EsxugiK5+vodySPIKp4RWx4N7X/yCTgZ2ZmKyPpz1vmyudCC9DrZnk9qPWb+zc4F1obevCFSDVEDZ78KkkkXLiAZbj1JgJxkCMbCmR8bwRDwCm6oQT4eoQOXFtZG8/+aPrhn5D+TojucC72MosFFpbXW/MD/UtSNGD0Qrp90TlP28AH1MP4juBDm+Ac+eFSq3zbDEfM4EipK+gR+OP4utg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxRFJnP0vCfVm5KhlOIIHh2uAAiRiqctWk96g7tOrUs=;
 b=Ho/5yjF9c668r32HEkRnmt77MBlpNkz8/3l5ohIx/9JtNYvTEEH0gRgG8fv0xMfmlL+8l/Z2YO1iz1NXfVcW8uQLy621eot8bEBMTtLjtG1R1Ui79aNKoYxpXkSIllzt4N6MtHk9lxb0fteNEtEPJ3jXImxhnY0/qVPIWgfulXd+kxHJw94cfYIBFVd9DWrb3QUiPJFP6FC7OMDoCbHNOqf41nmRjkSHBiRoRVHQqOARBVRxG/0he/XT620d1/WhA0hcQu40okGaxqC9vnYO3boC9QxekpDO0PFdZzvse/lcXiVxLcSPLKJQ0auNCFNi3P+e4RnJpIvWeOb6uHcSUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxRFJnP0vCfVm5KhlOIIHh2uAAiRiqctWk96g7tOrUs=;
 b=rLQlUCJOTjylveRzkwMb1EAto8v2Hqi+zRG1dr+X3BZ1gjpwh3mZfkVcFCagBIbu/Jnd6v+4rygpHNX+X70uRdINv3roH36eqMLFasbR5q/whzC60h8uIf7Q2G41KxpgWOlgid3HJ3QDSiWMRfEQ4KMxO28mWGzZR9p5BsazGmDlWhTyo+qqco7iG3WamnHqWefcI2q20Ugp7Fxl/jG+8GvBbFAJcGz8aBK1SB2rYYwKAkkUSefm7pRckT5fX9dlGztjjNFuB28Kw4JRzawQB1Hmrgr17FAc/BzFuy18DlZCA4jeXBQ34jAo4eoy36pG5P/mAkThVzSfadPOvZlvZg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by IA0PR12MB8375.namprd12.prod.outlook.com
 (2603:10b6:208:3dd::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 16:01:41 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 16:01:41 +0000
Date: Tue, 3 Nov 2026 12:01:38 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
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
Subject: Re: [PATCH v2 04/15] efi/libstub: Add a general way to get symbols
 from the vmlinux into zboot
Message-ID: <20261103160138.GA3165945@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <4-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
X-ClientProxiedBy: YT4PR01CA0318.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::9) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|IA0PR12MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b409bb8-c304-4df2-37e4-08df39c3bf0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|10067099003|22082099003|261102123227099003|18002099003|261021135927099003|56012099006|11063799006|4143699003|261021121427099003|261022075727099003|261022115727099003;
X-Microsoft-Antispam-Message-Info: WTbVxq4H8WiM2LXuASztVVzLIU7xAC78p6y17VXQi/75pxtZSIkBgauQBRQc/YJvQasEpwDgQBHSQU3PDsMogQO/E8mhtB3xLlm9ZodMMyIJWjA82Vh9pAnQ86uV0cLZCq87SYZhQ6hy3d/FdLn+6zo3XYEdU+ntlbDOD81n/aHeinGBxeeq9jwOe+GSNbWSUUUhnrPFeteACCQfjza7ryeE0QYWq9HLZFcGyHWtu7Ol1Ho/YzFjFVGqvZHpr2FSiZ6D3zc0ExyMLwuAZaJ6QAJ/PYPQebzr8xXCze3X68aZe9OSRXPdb9CPwj5SP+4Z6f+owCs/GHVEjXAZQn1kSvKQROQo5JRROq1KQQFDjMLdOX/scNd8TmZHgfluk1a74u/gNKcdrEuv2AxArehKrjk1EKchKJ7i1U/wUS5iDGRcQPV5zQjAmUSnEwDrpgfFMKfIDyGg6BmA3THaT3LxgDuAbUGRGcwSNaO2dRDEUAOvxNk3u4Ui/Akvz4HXH13ggA2F36GfgoQLwPsbZWiobnfTJnHNdozPThE+5qcSmEP4X05YyocxNRY4GO7qbTMtZ0WZApCmigURFsTvyHsuTLCqIHHFcApJ9rKubHy3AfD6TRoT8FIj/XWG+qxZ9Jch6CH3QDj/Lm2o4xhxCqihvi9m81XP5SmxyMj5LwCScaM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(261102123227099003)(18002099003)(261021135927099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(261022075727099003)(261022115727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v77AKHZwBL46MFGmwAsRPMZWrqHkaiynTP4GPl0EMrln8qTi0owllx80PUgQ?=
 =?us-ascii?Q?IBHswilCMYAexjNwjc41nfcENVKm6dDvKBTkul5maWucZEMNx8YSLUG09Zf2?=
 =?us-ascii?Q?NbW0BWkRJoHT0UeXj35JrXqRbJaVW1YaJ8a63mY7EN12ti4TdPq+tjv4Ixio?=
 =?us-ascii?Q?z9HZNaANHHp2nKxKdjYnN+rhgHap+Z/ho31JxicMPg337WtHNiav33HbJB7K?=
 =?us-ascii?Q?Z4Kg+XivAhDL17UDejyLQM8C0CyTpG58z25nQezVy3FVPlyNMsSyyT2VOwMz?=
 =?us-ascii?Q?PEKYh9wrtOZdSXoqqHr8oTtg2Doqc466PfQZkE4Pagw2BFvwdcffpepz2zj4?=
 =?us-ascii?Q?QOfEQPbUW+n9HSKCzSPHQpY/6ut1ZMaRAg37aavwKaFaiYZjK1hKoPdv/UOS?=
 =?us-ascii?Q?kQ88gbCyJbtNXtlauVEed8vz8PBI1QETKYoT42KrebkhWac4dVDKL9P1l65E?=
 =?us-ascii?Q?d7TxwqJbOu3vq/f+FnRHqdbti/AnU0r2uSwRp8wtSiYx17Fzl2pLIvdyDgEn?=
 =?us-ascii?Q?AFRwy+eX7zlXqv9/SZyPpOP8cTwhHYkKVpkElJ75D4ZoWEnfqJXH4wnUotOK?=
 =?us-ascii?Q?J4ljmKnbOd+vXJHDpRpUkht0rS26NksoPbXGgmgk7/FbdHzo7Mt5Eadg5Fp8?=
 =?us-ascii?Q?bc19h1FJEWS7FC+OLUMJVrABmALIAW5LwXXZjCeelUpQYcTgNeIQjc1tIKbu?=
 =?us-ascii?Q?epbfR+5koQvyxUfQgBNgnsPZaZrnxEC1ObXGkPhyubbkXa9qlr6EOKsyKPAJ?=
 =?us-ascii?Q?SsYiB27xA1EKpTwruaymoks0ww3jfVfDV1+0+wQEJHAe3IN6LpsA3cDa/1uz?=
 =?us-ascii?Q?QQRcrFOyLVbqDhYVdWU7GeidJLaZ2fw9XTP5EsHTMzCFebYMSKuAMsD25pFY?=
 =?us-ascii?Q?72y354zQHs9a8LVJJL56QOBYIBDtvYH5+PSjf/ISO+U/SZWyyoESaW+FoHuE?=
 =?us-ascii?Q?5YY8ZepAoIda3JdUFL1sjq/nrw6tt+8RccF8TYNFCFqwB5AUCeqjY2lo3b/f?=
 =?us-ascii?Q?/2a+ZCq4s6AVAj9v66LbGKFrDJzLUfWEuuLqmsZYVZrqW1DFKllhuTZvp98F?=
 =?us-ascii?Q?D+hSr3rp+H7EnaIfzshKWoqVz389XA22tCBEEkwxDi845uAKUPIQ4s0vOPms?=
 =?us-ascii?Q?U0USQRqyuTS50jvoDSSmGXD1O5olThDH+hIPiuSCg7l3yaODI4bv3DIEHLzX?=
 =?us-ascii?Q?0WhVNwMOg2DbThDEjKqrbRGQ7MM7iQ8iaP68AchCVfs1i4+RMeF9Ea0SXJ4P?=
 =?us-ascii?Q?8dJrEwAIjrdITqV7I07dknGiLWosQCL+r5sKhoF4BQ+QCJCwsrOwH15Quz1A?=
 =?us-ascii?Q?+PIxcXnPVzfaLpfal1n8GwV3GPZC1XT/kBvNFWYST+M0N9uojs0fv4XLW+v7?=
 =?us-ascii?Q?tf0jzYCJU8mSDIZdmD/uKMa5BYimrN95MQd3Enl6UzdrPLTxxL7qtY2eN9ZZ?=
 =?us-ascii?Q?4t6yzPiA2QIwn1KahqbmVonBnffdaMhiudE6P1/SJxCJUkbQFa1oDCeJDJ8D?=
 =?us-ascii?Q?uTIQ7kLTID42fcK4HdVI4vaKAqaT3zMznfRK8x/+iVz+gTq54RrMreYwTovk?=
 =?us-ascii?Q?O9H39FjTI3FAS/J0Z+YrG4g1BU31SNdAafqB948T2axCK/xwA4UCMQNJ9fHF?=
 =?us-ascii?Q?9n6G2UGNN8NlJme1Mbe9WeSwGC15nPtFjxO+dT4r00BnvHk8ZfA8DypP/0wE?=
 =?us-ascii?Q?KcdkXi2zRjN14esufG9ykUsuJF3xoYNm8D4KGicjnv3Ic+Rd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b409bb8-c304-4df2-37e4-08df39c3bf0f
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 16:01:40.7413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iV7et6HbGRij22+uJGcgmJwUxXSV51jcnTkKHZgS6HdJG9Ct0nWTx5a/f13IbkI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8375
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_080153_683202_FDF76679 
X-CRM114-Status: GOOD (  16.65  )
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

On Fri, Oct 02, 2026 at 08:31:41PM -0300, Jason Gunthorpe wrote:
> Currently the zboot stub has no access to symbols in the vmlinux. In
> contrast x86 has a voffsets.h header that allows the stub to know whatever
> symbols it wants for the decompressed image. ARM DRTM needs another 4
> symbol locations to work, and it also wants to compile the DRTM libstub
> code once and have it work in both zboot and embedded.
> 
> The current solution in arm is "code_size" from commit 45dd403da851
> ("efi/zboot: arm64: Inject kernel code size symbol into the zboot
> payload"). This is neat, but it makes the zboot and embedded cases
> work differently.
> 
> The x86 voffsets.h approach is also nice, but it can only work in zboot
> since it relies on 'nm vmlinux' to extract the locations. That's a
> circular dependency for the embedded stub.

Ard,

Did you have any further thoughts on this patch? Did the sketch you
showed me at LPC turn into anything?

It is rc1 and another month has gone by so I'd like to repost this
with all the feedback

Thanks,
Jason

