Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EE7606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 23:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ULrZsrUx;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q0LUPMzG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8z2dg1KQTQ4M2NnyDLBkZr/PxB1IhVAqbjO0kPEIVww=; b=ULrZsrUxOagTDIdgaGunAyn7ph
	p0sawMQQMRvyGLS2N72CAOekj1/FpTJwdrW2tlYPd81JG3+cYbdUMLLyzB4SYTVDReb00RUA/8eXH
	k6fk9HSqtARv8++lycR7GHfnHw6om+/VJiVk8awfhweqZeGQGrLqVlC8hUjud5QsZvcADCQZhWl1W
	W43/gHDlZ7bdZJKux4ySuQI71vJb6hANJLbDdw4lsVBNUpRHyBGAEMDdApSYtI9ZZpiBDSQAyHKX9
	yFhd28X+uomvr5/jcByBv0eDbz374BXL7Tv1v8lGw2OVG/KLn666qm0eJoan1ClHHIV8HQ5lkFVqM
	mYZIJ7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJJM0-0000000AoXC-2WPY;
	Tue, 20 Oct 2026 23:34:48 +0000
Received: from mail-westus2azon11012031.outbound.protection.outlook.com ([52.101.48.31] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJJLw-0000000AoWZ-3CL7;
	Tue, 20 Oct 2026 23:34:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noVjqAiKgn2CTm2WoBtx8cuNS0O+XsrOmrxvVCX6uJyh9lQ/pZIO+wpYnp3wbFC86ymhkNhnDmwgzSJ922iLJ9r2ZCMb4wSAPrDCpTjjOan7l9PSP8fXLFZZmQt5kutJW0t05jXN7MPQeXIUI7w9JI81tc7KtfzEPlW6JVPT+arKRRgk3t5TZjBX/nabpi9iZSjcD81lwlnCqllDjhyAhQsk4ioqfAVHsY9lwp20XjS7vWqmkng2BZypzV/7fls6lg/wXyEnMaOEURaFplQP3xUMFRVLPXINHtednRTToFmZ98r3lDdoilruYM4bJ8HStkv/GWiZj4En7AuZIy6WdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8z2dg1KQTQ4M2NnyDLBkZr/PxB1IhVAqbjO0kPEIVww=;
 b=npB10RpLCqYLKKo326sKtf6jLuaCeLKtbEpNK9ZjhNloaCRZf372vKHPN6NVL6rwGSMJLNIQC6nB9aQ0sYx4BO+VovHGopTDRU1um3c37ea1LATperuIe5h3d31UkiKgDFlPqmtKwSWXQv3m7Qo3YNPY9vlDaBfoUWPUjtCbt0kUA74MMauqB1OwZERA2KRJO5zYhDMP5tu7hwHvfIvZXrLhpamsNzuq1V89dRSrBZLGSlHa3E/TgI3FiSzfdHG5sxwPqJjmQ4nwWgKR7aUa37wna9n0BytDe3OGgO6VLDF9/+UUULk0Vh/KDvMlQn8Xqq9Et3Cl/cLhJZA/VSJa8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8z2dg1KQTQ4M2NnyDLBkZr/PxB1IhVAqbjO0kPEIVww=;
 b=q0LUPMzG/nbWR+LktExCP3k7Lf34hT/aSvlCo1E+wjbFRECKVul/8QBSYBf67+eTzy9ZPGLa2AVMppPN9iec5cpnDzGgoB+qMyFj/4ogfsZwfkxFXHmBfcoFObO/ZyfrSh3c/Budo0k6vK8IJtTnRyOnidbayo7qV40B/sA3GYAq2tHdOnBgx8bLLTReS0slbas2rKoKimkmK5Xpu2wTicxS+6MeluQiI1ZcX4VYA6LUtD90BagvJmm0nfocyHvDKe+E13uK14bFW5D6hAxAOa44//FwkYv9+uUWPaK9zhpc2AVvTkGT2TEDDpB2c2MQOhCQNoIUm/XliTTIKB19vw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by LVUPR12MB999186.namprd12.prod.outlook.com
 (2603:10b6:408:3a3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 23:34:36 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 23:34:36 +0000
Date: Tue, 20 Oct 2026 20:34:35 -0300
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
Message-ID: <20261020233435.GJ3008132@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <15-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <atf4ONRM3xbs877y@e129823.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atf4ONRM3xbs877y@e129823.arm.com>
X-ClientProxiedBy: YT3PR01CA0123.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::23) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LVUPR12MB999186:EE_
X-MS-Office365-Filtering-Correlation-Id: bd1a0665-569d-4ab7-5ba4-08df2f02b3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 48/InMsphFGlmve+b1DhS4K/Q2rxmkXWSIcgEce/k0iP3OXU3YlkzXU2uz4CDS6zlxhuNLM9HJ3uvidxypJ+AUI3BC8MUltigwwBG4MCHBoDEchFoMDIkx1tTEnAnUoZ4vxH+H9FJuzZNyCnhJJu3kvao7+RFbUP/eomCNvA/Kgz57qzKdlz/cp7Qnz/tKP+MQWkR9qhcuk+3kjXbtVUKNz4Mvn82xHva95XkVJxdBmbuurMfhy0S7JVsCo6AFnbXOkgvg+mM22xL9KDRK07xK0gx5BN6onTuOjNM9X9RSlHPizJaDSYeWXVB/ckfJ6bOc2IenHDBFZn2NUJMsBqHipRDWQvfEm+7N8POzPgMQ8VnljSR7WlNlmhog9EZVrk4oU8eCIDem+hvcrX1O0dAaPZFQKbpZnjNzh195TC1bRTJou4jF3PyO66TxJn+bTuLIUU4E6+Cgn8NcJ+MKNQDpK1zgWbJE76MD/QTsGtg6+NOA4LVZPXr7o3ZwJLKoWf+t3anubuHwFn/SkA105Rl4daWTlAeRXOGQYTG89mEWE/8VfMqx8TXw75ZKNvHtJe5HbTBL6wNirowbTcV5xV4SToKTYb7gTj1XE+LywlITYG2I3SfwsfMgY48IJejC20+py2XgR7sCKCmT5DFRGsldoJkuSLAH1GkaGI65M0gBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IQrrDUtL3Ue0vDzTA3P57ph/uaHjPI2QqrbvubJUPBuUbtkbPakye2jE7xBL?=
 =?us-ascii?Q?F5aG7W/hkzeFvX+zEyLm+WlZYeE0HJg4Wslcj+LAyKH9AYV7Aukr1StI6W5X?=
 =?us-ascii?Q?xYmE56EvGuBGewt/mX7DmJAbvK4Vzb4LXlmbDtJ5lp5IDcalIJvoHmn1XvQl?=
 =?us-ascii?Q?JH0X0WUXviodqXuH36XUiEycy7FcTzqDkWkk22CJnU50VosehsYKXNVZ0kJ/?=
 =?us-ascii?Q?mecJO1z6JPdS91L7MLWvbzaLcQ1VKpp3JDk2iATSEx5UdOk17V4XBu5OL4bB?=
 =?us-ascii?Q?vRSumeXe0Sr9NmiojaQq0E97cGVEcH3JQQIQBWcZypJF/SLvWSVzWxRZZLfV?=
 =?us-ascii?Q?Cf/lzj44TLzNDNtUnnX/tRjpGaBvD45cjEbT09nvvFPJ58jZCe0f3N+mB/gB?=
 =?us-ascii?Q?6dBzfmSF+LExazQ8+M1fPQ7Oo3BHXzWKTlCstQK8WHU7HnOkDLWT4SJjfH6o?=
 =?us-ascii?Q?U7PtFxWxfnFB7i8yjqZyMJRXy/igN32srFrqcN1yJtb4CykvXl2SX5v4X2FZ?=
 =?us-ascii?Q?7lWyG+b1c7zcuyDdzRT1UFksyZvIE8STacsC+q33/7alNCj5Kd3/LHhQNozr?=
 =?us-ascii?Q?m/3S2ooES+M13UVujEW1aLtn6Pi3uP0F1zFkSXo17c7ZHe/4gQYMlbnaz9O7?=
 =?us-ascii?Q?at6+XdwCK/Sy4v8tmOnX5CiGJ+9YZvdRpXCnLDsC9NUGSzKSNTg9w9E3QuWr?=
 =?us-ascii?Q?+drq9YEWW9E7fcqxBoOkRg2vCkS3YkXjO1rJMoiF6vYFyvyQFTLRD8KuQzqa?=
 =?us-ascii?Q?r2mtM5lhnixdbSNSIiqg1OK7rqeyVHsz5MsK5NMUz/PhCL8uicIEsMdnuBK5?=
 =?us-ascii?Q?RdjKgFU3rqUrbqPHUZRhWd0bEXMNhYC3IvG4DMQg9zeIpfIsrAKCInOffgRY?=
 =?us-ascii?Q?rCO0/oS/NhBtNAI49En1artXCwURo54t0jkIUtMBg17eVGVfJ4JAML3ncADo?=
 =?us-ascii?Q?dguKddoVKz6foLWm5+WRu9lkKK6r6Nr9uUcdvCxe3l43S8beObsIa5bmcZeh?=
 =?us-ascii?Q?lj/7fRmVx/tB7I6+O1ufS5VOmAmZSrB/Wk0qpV9Viu8CEaY/CxKPUbXt2FiQ?=
 =?us-ascii?Q?8r7bdPJdvwsxs0jfqorqbGgOb+/ZRaSRLYE4Iw3qeRyTrRbOdKNurgjyxYk3?=
 =?us-ascii?Q?iYxrHcbKcDH+Gsvpsp+HAo4U0eYDzoojtMLzeHDIGoqIFh6yILEssqGJ8DyJ?=
 =?us-ascii?Q?9Pyr+Xm/nKPBUlyNZkgtpmZxR/QCRHNlluwajs8uMep2/xyK00of3SP0Yf0p?=
 =?us-ascii?Q?wkMAzAwj7HJ5Tx3ffFPT/RGQyxFr2A3FlHIYTsj2aTH7elyGXyADAz7roudk?=
 =?us-ascii?Q?2QzklPvJ7/vCaHoIHILzfVsxwuxy3yT2pqs5BXWwukfQwH1cF+n3zfaewiK9?=
 =?us-ascii?Q?GF6nbeIRCy/FNrnUHLvNHv/LFe8xsIfS0zAgTP5ETtt8+rj+EpTjWOMIOto2?=
 =?us-ascii?Q?6fczeiNVIhzdaEPxfgMvo9UCav3qLg7zsM3n8gizZMpqVT46/YsPbxvYnUEq?=
 =?us-ascii?Q?MbLEPYgrelQtUKY3XUErberwd9rkmVjjM/FA5iIn2SpgwsHCvj3MZVNEq0ij?=
 =?us-ascii?Q?qPSEOY0PNk1rWzV7cjZfNwFu+tT4gvgGTMvDlW5PsbMj5hXNo6YtqtP/mxUJ?=
 =?us-ascii?Q?7Elc5d6K5Fcuh73syyQQ+WyWb1lRxjMhZx7esx10N0Sx3nZ9Jd4LRFWsGwcP?=
 =?us-ascii?Q?JHxMCBa4wPQnLjhl4bm1Jt/CuEcST1HLUGoXHDexi9klwmsX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1a0665-569d-4ab7-5ba4-08df2f02b3e1
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 23:34:36.4923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D0hmr18fQZ2jt7bFaTam2ApRILgae7WkPF1thbCzKp6nwQoE2I4urOWLNMlMMWBD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_163444_987537_2FF0107B 
X-CRM114-Status: GOOD (  16.92  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 12:24:40AM +0100, Yeoreum Yun wrote:
> One small question...
> 
> [..snipped..]
> 
> > +void efi_drtm_launch(void)
> > +{
> > +	if (efi_drtm_policy == EFI_DRTM_OFF)
> > +		return;
> > +
> > +	/*
> > +	 * No cache maintenance is required before the launch. v1.4B R42130 in
> > +	 * Table 22 "DCE preamble requirements" requires the DRTM_PARAMETERS to
> > +	 * be accessible as Normal Write-Back Cacheable, Inner Shareable memory,
> > +	 * so the DCE reads them coherently with the writes made above.  R45220
> > +	 * in Table 30 "DCE requirements for the DLME" then has the DCE clean
> > +	 * and invalidate the whole DLME region to the Point of Coherency before
> > +	 * it measures the DLME image, which covers both the Image itself and
> > +	 * the handoff struct placed in the DLME region. Thus once we jump into
> > +	 * the kernel with MMU and caches off the CPU will see everything the
> > +	 * stub wrote.
> > +	 */
> > +	arm_drtm_dynamic_launch(drtm_cfg.params_addr);
> 
> After launching, How to get eventlogs for measurement of DLEM if
> tpm_read_log_efi() is used? Doesn't it need to concatenate those
> event logs from DRTM eventlog in returned DLEM data?

My plan is a future series will return them as a discrete log bundle
through attestation subsystem. All of the logs will be available
consistently that way, CCGL, the EFI and ACPI ones..

And it will be logically linked to the ROT the DRTM uses in some
future ROT agile DRTM flow. So we can tell the difference between a
TPM bare metal launch into PCRs and something like a realm launch into
REMs.

Thanks,
Jason

