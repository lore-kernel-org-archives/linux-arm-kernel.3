Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B657F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O/I8b6rQ;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=afoolPA2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xx0dqxkmR3d+WNM225WMIPxE36eYGDVjZAkM1zsnSFM=; b=O/I8b6rQI/9l6Ak1XLJklXpn49
	NLHr/WZMcbMX5HfOpcENgVEN/+yZvao7DuHy+ayCMqN4EwhBYM2+fWVf1sEB0dF/asF0iLBmYCItW
	YKSIXkAJBjrOpKbvpAFFYwGNWuu0cLsAx2QnfWwx0CFpq1OC49bGNOsBsQtPPyUmchpFQtm0iqXRX
	YXTGaF7bEfHEe+aKPi6/FiVpVTnibzp+TUVeSM7l5A+gVD8RXsiuOxk4sEtNZI4JKncR8letPyoFx
	H9NBE+S8l/ULCFs6uc61jh2Shf1AWZKPjmmNyYlLQMxzsAh7VB29OCA3hk2XyAvK5C9OnzuMnpop9
	MASD38yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVIz-0000000Bn7y-41s3;
	Wed, 21 Oct 2026 12:20:29 +0000
Received: from mail-westcentralusazon11010016.outbound.protection.outlook.com ([40.93.198.16] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVIv-0000000Bn7K-2jdg;
	Wed, 21 Oct 2026 12:20:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLBJOy1uxIOsn6VF7dRLbDP+VbPCLsGFlk8Gf4olPVgPbR27tg3Ge4T92jhsHONNbFCY8vz6MTsB5J4Tkqhgbx/DqRHc1VTuMxelHgC2XSHtRH1BfvfqOKiBq3HSWsZ4jLWA69rRppCAqZoJHZE6PvzGQ7NVnWKyKKHnNeXk0kqbZbFI+t32lCGxLc37NhIruOhDV0pnHx5n3cNiiY0aufXa0SJhIXOdu7I0DwZq/iokB9orItF3llm9/C9qJUWA0HXBfYxt97lLdMFZY/xJGT5qlYw6ceyGW4NpUxFRJSH4knZM2NYNsYW2uqcAfiaEOIt+b0RZLICJ1kBcs0PY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xx0dqxkmR3d+WNM225WMIPxE36eYGDVjZAkM1zsnSFM=;
 b=EvW3K0KMyme6tZ1WPIpep+uKstXFCOL1o8giZ38uEF4XvT5QNaiTR7FUHLLaAJX6QgS58OimJZy7cpjB24VBwuERNKIMGHTGWxBhn/jgcgc+962uzDoWAkS4Pnu6MWTc63IkiyduQC2bCVz/nR65y25NKD3PmKm/o9N0QmPjzy/Wbje6AfpMPZuXCQ13u1nIBkmmbh2wTNJC5fIyAlvQT43GkwV3GfmWAKYH13C5K2X9GlXTMmCmSppZTC3bNJBCzhN7iian7do556jcvFNodOs4jt1e2srlNkebbtwMnpSwfupBwTFwcCcsdh86CYyvE7TDEqeN6zgzP7WL1dfrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xx0dqxkmR3d+WNM225WMIPxE36eYGDVjZAkM1zsnSFM=;
 b=afoolPA2jmkwduGAlPJRT9uPUOZhiv7n/CxmbdEWfslBCohxZKD4yHf0y0V+p77wqy0At0eyy8GHf49CI8rkAFxyMtYCFJO6P7q3IMlMliZRGi6tlHknS0oqMr2w7PsAxEQ1QrW6UQvfO1Rg0hxTzc8zIKLcRPYlr6DbKkdBLtzc0v0ZnnpybiqnhKUk3ggMtxZ4plKTo7nW8p0nmWrG0zOOCP2X3+JI5RO5GzR5rTZ8trGfAP3mxG07WvVD3crPMEQn3TAZ4Piq+//pHdonqSYt6pNjBkwVHueZkHodgVeq40Efhcjp8MZZ8v4YRjyBP2CwNF8NBgD2Ss0nlwr3ig==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by MW4PR12MB6875.namprd12.prod.outlook.com
 (2603:10b6:303:209::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 12:20:19 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 12:20:18 +0000
Date: Wed, 21 Oct 2026 09:20:16 -0300
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
Subject: Re: [PATCH v2 12/15] arm64: drtm: Update the linker script for
 EFI_STUB_DRTM
Message-ID: <20261021122016.GK3008132@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <12-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <atfwCcRfC6rWFywH@e129823.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atfwCcRfC6rWFywH@e129823.arm.com>
X-ClientProxiedBy: MN2PR20CA0065.namprd20.prod.outlook.com
 (2603:10b6:208:235::34) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|MW4PR12MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 361466de-fb67-476f-4ce2-08df2f6dab18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: j1QFWT7eyuy3DgOQdSIwQO753jsY+zgeEAEajIQyxE6OkoB1bkro/90GiEkR2bCQrimfdjuAkOrIZ/wlf5wi61w04icEf7xtFVQo+p3qhSSLfcsSmW3g2V33etMbKi/U8I0zIVNSvz+HStPvYc2DQASFska3JSvmy7HUMik6o/Y8mcuxWPrdnB0vAvYOQQalthDDng7zZHTTeBCCfQZneqEl1v3SpM4ARQ7aMSMr8skjjtmKLFGojOnv96u8uTxXfzh6zAviursGfe+FPCY7lDHLOWUAUPPfH4yJ2u76jb/OYPAYJheXJrLZ9BpSxTrHrqJ4FKCjAanLn6rpM08wDY86GPnQBEFlbcJ0s60GsMMyIp7nJWO73wDna/N0MVQpoIhev9Sg4FhZRksKlV0TQyf9/FYbzXpChS7WJDr6iBCsT+3IvTkHyxgt1QZEwaTuiWVtgG9mwB5UmKeLuGdxDzymW7rZxtPZ5v9qILkJwtUYYCo4dEX9YNHOlw2NNZHFcQRMsnVi1RhLMFyWugG54sSSuLm/zCBf+gdMiXxGhT0thETfavABZWfngSFjeEmOcUJUXuVcPPF8VzjUnI1L+V1jyTlzpGsMVJVP3nukMHB4IwI2MXsbATLrb9JNOEQIm0oV+YGf6PbEJFhGeMI66qQb91s1PZ8HDgpBP8T15cQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gJxyTXFhY3f74NmkMNMLIJcIvIOD6X8z6NJiNqzu1ZiRh9YKV1or35PB/wih?=
 =?us-ascii?Q?g/69Z6eSgUnv6t/6IU58idXko3vwqclk+RnxTkpXtqzDD+XW2RBe9cfYMlwr?=
 =?us-ascii?Q?lvzhX6HcHi3Y06FnBUWozCePsJhETNNXnlB1hb4ob1E8edwzEnackF3TnymJ?=
 =?us-ascii?Q?Pmieo/PNqq/KAMswbHWdjD5cuOuQr/GGPeYMqOkjDWjAkl1xanObgLTLpVBW?=
 =?us-ascii?Q?lqkBXQsoNBMzF4lvJpd/Bu6Se67fY5CECuvkjRoCbE+elWD02/DTH+Hfefw/?=
 =?us-ascii?Q?v1VKs/Ag6VnmcVocPNQE0JcFwKH3DbAY+hpvee7GegLnSxChtMMLdEB0S74d?=
 =?us-ascii?Q?gUWYHJZYqSRM1fpbCyUS7J6sU4SdN4XzfH8u2GaA8ag6UVqH3fMT9UpA3NwP?=
 =?us-ascii?Q?OrXgJgUL6WPA+TSALEwr+lLAZIbppSm+xKyKGEr0VWf5Bnaf+EalV0ycphbn?=
 =?us-ascii?Q?Du8vebybLaILljVuarWrw4upxyBPiP98FYXHQFMc84Xv9iUk1UzwvAqI1XdD?=
 =?us-ascii?Q?xlBS933uBg2sj5riz9DsgS2gUsVtQ3/hqXR+Eao0aL0mudOGXM53vRYlNil1?=
 =?us-ascii?Q?fuE3ZMnidSfaChT5ayLu41uk56/kkDs3xMEh1B5H3QI4cztxYC8aG2Sl7dxE?=
 =?us-ascii?Q?PEVTCIb6ibz2ONtwpcfOO+R8WRuKPPjiPeRjtDemEjp/HdvTUyv8zNPAFknG?=
 =?us-ascii?Q?0hjqO/h0ntoAI1zQl18bgBcW/DQOyLeIPOjG3K2tMbxT+/C9tmuH6D4QFBGu?=
 =?us-ascii?Q?fLDoQ7fzd1Zmf4PKW9hniIDY5WyPgKJtVGEsGWyo23uvUYIVy+3TlHpDvQOm?=
 =?us-ascii?Q?N9JvCK3hkETq5wTs8SKIpbzI5lV2Y8TCLH1WCpmRhZPh5Lm9MryLAX5ok2AY?=
 =?us-ascii?Q?u/OpTyPGAw0DSkkSwkDbrAKShy+BGycht0m1VZWprqi0SFcbTqmpFpZDJkEU?=
 =?us-ascii?Q?3gTfNK9ymzusmhdYjnN+0neFH2Q20KTuxDUmw7Wo8IC5KnCK29t0CEJ7ywW9?=
 =?us-ascii?Q?FPlOsRuzrMwihaU3Kq0o+R6k7iN7hypS/reNPalIdDakSfYVP/3hWizpQc99?=
 =?us-ascii?Q?LH1UR6h6lDaumPFvHoHoR85LBNfzYCtjBkH+o/uVM7vnQfPAvBKi0wTN6dcW?=
 =?us-ascii?Q?x6D2WvyIc77lpq3cokkwgBbUtWx2emr9VqYtlqYkGUN08VLma8sPRDJCd8dZ?=
 =?us-ascii?Q?HSVK6a22Tr1oX6RiFVPZVukPokdIw7YD6H6xTYQgV4AuzgzgIQs2B4bW2eXM?=
 =?us-ascii?Q?EmD9LuvbqiTdw2RcjMau5Js+aUbudbG6q4Imuq4p8ooNTAkmrhXCMRdf20Fy?=
 =?us-ascii?Q?EDn00ESng8R5DSaI9PvasQ+DRMYagNytnx1byhfK0IhwANI5Abyj5XR3v7gT?=
 =?us-ascii?Q?17uf43MWnzKXizbu/denU3jdYuirKP9vL+mghVPk8HIhf5yZLMZkUudcYE+R?=
 =?us-ascii?Q?6dimMOiEbcPAbix07V7RBJVK2XNuw5RnU/PBFA3dlpNSiFw0jIOzKSnKj8+H?=
 =?us-ascii?Q?+/wPqBds4E3rIcMQOLvY3wyNwQ+9aecNvzDc7UIdnTOxlWJiOwjVCna6KDFl?=
 =?us-ascii?Q?A20qXmd4Z0LlgH/RKNzLExh2phLA3vUNNo5LT2y00hyW4zne3s5jumx1lD3z?=
 =?us-ascii?Q?GcyYAh2zb4ZV04L4sa8NXx/UbkhX90GkVnHjoYg++IzeCnGpQf8B07idlimJ?=
 =?us-ascii?Q?kSoS2k3BTTCKBmxOaqAKTtcA9Z/XAPIvuNL9U+c6hjxNUfxw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361466de-fb67-476f-4ce2-08df2f6dab18
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 12:20:17.9271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8xCbfMEOr05JRcJOGsNypaMIEgs7DQnwc7qc/mfu+tEw7/xQZGk3w6BKR85Pppj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6875
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_052026_792682_16142C75 
X-CRM114-Status: GOOD (  12.00  )
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

On Tue, Oct 20, 2026 at 11:49:45PM +0100, Yeoreum Yun wrote:
> >  #define ARM64_IMAGE_MAGIC	"ARM\x64"
> >  
> > +#ifdef CONFIG_ARM64_DRTM
> > +#define EFI_IMAGE_INFO_SIZE	40
> 
> Small nit. I know according to #13, This should be 40 with drtm_entry
> and arm64_drtm_handoff. but in this patch, should EFI_IMAGE_INFO_SIZE
> be 24 and be change to 40 at #13?

Yep, I fixed up the hunks so this flows right, CONFIG_ARM64_DRTM can't
be selected at this point in the series so there is no way to tell it
was wrong..

Thanks,
Jason

