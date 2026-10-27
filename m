Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E001606A908
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 20:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kU5CtAC2;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=siDufQwY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uzmsAAyvjp+RWx2LG6J+AgBRxYNT/iNO1qHEeoHWVOM=; b=kU5CtAC2D9dciVvF2ECatqxkqe
	XfbBkjzFr+pz2HPxA9URUom7s+vdhCs/aQpFueRZysehLLcbp1hNt3C9S21YEic2/QSPEKv+zgymm
	reDbnVqMkV8BCqCgX/Dk0KP9ZdI3X8vOkzEghOeKpUTJvFbon16Z9DB8N5ahGBigh4UEpARIqCLTO
	GceNt0iewuotp/105XS5XoWdMfWBJ4U7xC18uOpESmKRiUCyhnuiyDUhS6CYOGY7cddq4JaEjoIyh
	AtjCwupzFWKGyzCZ1vIuNyKX33oba2vFQfMDm550g2YJPwbk3q6BrmSG9ZUOJuKiiOXk50E/ixGEW
	t1RYuFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnn8-00000005jE4-1ZdX;
	Tue, 27 Oct 2026 20:29:06 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnn5-00000005jDZ-3eFM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 20:29:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyG4wkOdw7wQ2uTOvpzsERpozLhjD6/stjoh760LZUeql+E9R9ZCBpziC7zQr1SgOkoSbniXwbpeXMcJxyCKPzsVRqKDzpda9/VwOMuU6ES9/cuvNQh4SuzNAGuGBSx0/VXiTe0xqfW84/l+DZRhiRoEW2WIFRzZ1t0E4XkqbkSk/JC5TML0AkkddKzoP2ujVOoydqoBkKpMGxpml5oHYvF/9RACeiwiyItV+ICSzaew40dg56L9s9nA68RQL/HmzcmxC+Q1zNOF2NR/ZwdtMeEc5Ftqfmcmu5C6UpIaPPVKRo/8IBU9OajLWFDOmWzvrrcqT+jQJ1FBU/AB4MDIew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzmsAAyvjp+RWx2LG6J+AgBRxYNT/iNO1qHEeoHWVOM=;
 b=A+YaisuUw4+AXqkr4Olk9QsZD+KUSbTyXE+AJWrWKlBR0E7VN43Zp9uQ13DLWoyLDvEQ0GsdmqMFGKS+V8KZqqd+r8QbKkWQa2v1YqghwewV8MAulwa+e+sjre1Qu3FfFAIaJQWFnqLPUQ/avBcU9irFRv8isEfhojHsnfQAHI32CqEzLy+DzUc1t7wtI68uQrESZKxGT95pi9sWk02EybxN3u58HpQR9tvmPwJ+V4t2p7MnmWjAlS7/oaGPLurSCJc0np9WaY57LNd0ZYSo7Xae8WbYNF6KoP5oZ7rpgJRM+ddaHuc9bHnvMEB+0JGZiH4BL1nIMl8fJ1ohoa60MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzmsAAyvjp+RWx2LG6J+AgBRxYNT/iNO1qHEeoHWVOM=;
 b=siDufQwY7wpDzkv1FJVnBGcM2VIA9cFk+c/hdkXTjsXb8yK5+pZomZv0V9PWvmoJDai4OWRE2iRumPioqyQnlr6NkBUsUJ+hXTXaP/DCykqg3I0fwS8MMvrQUFDFxGjKOVKnkzv8G0rMpl6crKhuQYdISoiV3S2eaoPSAkRlLu6uYzv0NjPgKXe202TrOsBC2m3Qx7fW/fYJqZxRrCwP4WSiiY0MCuLVqTaPDlUwLl9cKdoQZ0qrK5LY58cALS4+7ZvxxQg1TKdHKXV3DTUuq36hvSjJAKI+QMbhFVktqNf/7fFdDHphuODE0m1qBWltWUtlPEebAXqgfTCittrZUw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8408.eurprd04.prod.outlook.com (2603:10a6:102:1c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 20:28:57 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 20:28:56 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag on i2c3 GPIOs
Date: Tue, 27 Oct 2026 16:28:49 -0400
Message-ID: <179313291415.290448.6549344165947797542.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015081149.5919-1-stefano.r@variscite.com>
References: <20261015081149.5919-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:510:23d::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: d0fa11dc-0aaa-4c40-906c-08df3468ecde
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|19092799006|23010399003|1800799024|261009223027099003|261022105027099003|10067099003|56012099006|22082099003|18002099003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info: 2ssVVirp2jM1XTMbb0+oM+ChQ8R4yUAlwXtu0AKm9x/fsoaA7G9vXZomtfNSr41yzjJrMISpYfs9/dV0t2HJhcgLNlsnhPgTQ/KTFtN8yRxoDb7TyAASJpsHuuNSKL3EHWkk4m/7okSMpP5n4OsgF2NWg6IEFw4Ol8mW6MVZo3y0M/aRy0v157r7n5Ko1GERXYKpRSaWEWpiDTerq+MZDlDcl/eiNQR87UMIi1GpBoo7MZAkCaqV2JJDEdAz7h2PLCqz0N64+JQqO0LastXR5+O/2UpC0P0Iwlrfh2AbfJ0OKymS5trsu76fg9f/yAl8n3A1tveAk5Be8ZjQ6+ynHg+cFi3ikHgq4Q7IgfIuI6hCX2unYpyo3czF0eQj1XA8K3O5wwnmWACsyL+nNrcOY0S9gzivUQyZmYgqgRTKJR8Vg7jVaY8BrrsQs8cTHgqoWASlXppDg1bACTUyixrad5Q/rsVAadMOozv9Un+UBHp3rNBPjnVqy95/7rCwAIgXKA0w/15N+Le4km1SP3dBAVsd9Stl8Tukm0avciEYYOGtzB2XH0p32aiuIg9hQuEGtJkHHFKAg73JeMV/uWDTjFz+oOz6tqAol54DfeddZhoLTbOZGk88NdlZtpLBbGpbAAC35OwGMM6vmM5U8zv2q/8unr+td4ZjvL92Ma4VAIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(23010399003)(1800799024)(261009223027099003)(261022105027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFdoME9Talg1T2FSbTFGZGt4SHVkcWYyM2lONjF0T3hmS2tmY3A1NzdKSjZG?=
 =?utf-8?B?NXc2V0pqc0haVmlkYzRnOWRob2paZEhNZDIvT3p4eVBSbFlDWVBwRklnb0pu?=
 =?utf-8?B?NEM3MkVnckw3YzhQYzRXc3F6S0ZRRFRBamZkckUvOCtveTdGNUdBVllJL3Y0?=
 =?utf-8?B?UUplUXFPeERodWVuQWZuNzZYSGRTeGxXVjZIeHNoUTB1Zm5mNFlQSVFicUt6?=
 =?utf-8?B?K2lNNEdzR09HeG02VGRFVHpLanQ5K1BGdDBkRDZhRVRTd3NqdCtrdWxSWnQ2?=
 =?utf-8?B?L0IvTVU4U1FHZHM0ZVFzc241NDM4ODEwWFdYcHNCSTFJYXhDMnNrMzJ1dzFV?=
 =?utf-8?B?aUxpMUVOSHNwZWZFM1RnSStGNEgxMjFDRGpsdmdKaVJwSC9od0RYU0lHYk5N?=
 =?utf-8?B?TnBnQmFzRWhaNjBTUTJsSmd0dVBROENkc0lEOVIrN054T3VIcjNMUlZUd0NW?=
 =?utf-8?B?b3ZacmJIdlNNeXlZOG5RcFBnV0xwdzVIT3ZVdC9LbVVNaHdxUW5VN2VLdGZS?=
 =?utf-8?B?K09paklvT3dRVzBBNzdJN25NNmQ0RGQ5RmFuNjl2czVWN280eHR0Rk9SdU1P?=
 =?utf-8?B?Tzg4OFR1MUFOK29NNUtKTnFTSXcxUWp6VmRFZHBqd1Q4RkZkcmd2Q0VzSmtC?=
 =?utf-8?B?TFRzLzdvZEg0NUpWejhnRW85YWdLRG0zWmVpTklMMDNnYzJsMVgzRlNVYXJ0?=
 =?utf-8?B?S3h3QzFGNEpqM296SEgrYVVBQjI3WVN6U3JENTRxUnlaY3ZsemlJZjJtS1RG?=
 =?utf-8?B?WnFZVjNLakRLMXZLcHdPRGliUlNEc0hIYUlHRFlBODFWL29NNHBVSWtEblBw?=
 =?utf-8?B?aURESE5nT1FzYmtkL09PSEZmNi8zS0VQWTFuaHpESXFnZDVVWjExcWJXM2dW?=
 =?utf-8?B?eFU3Sk9MenRsZ2UzMlZZeFpIVzJZRmZvRmRWcTBGRGUzTFIveHVBYjgvdGNv?=
 =?utf-8?B?NVpoWG85NGN0cUVxY0JRNVpLMmt5SHRWME4wQVZ0MVU2T2c1b3E2UzVQZDM5?=
 =?utf-8?B?ZGdMWkRtTS9NbFpZUUhtdXI5MURXMjZpOVlvSzFHcmc4TEtMNnd4cXBmVFMr?=
 =?utf-8?B?Q2FVTnhXTnlZRkkxMzJmU3RrdEVNOGZHTmsvQk5VRHo2VHhRL29uSXJiSmhR?=
 =?utf-8?B?UGdYK3pweXBxek8xTXJ4cXpYR3EvbWFMd1NWeWdBbzY2ZW5NYmNDMk5nTFZY?=
 =?utf-8?B?WUdXYjVubEdqRjFZTWhodFgvYnByT0IyenVlUGswMmwyMVNpeTFzTVI4WGFW?=
 =?utf-8?B?UGdqUnlwbExHOEhVaVRKd1pOMUd3bE55U1pDWTQ3dS95TEtrd1JDcHVoWkI2?=
 =?utf-8?B?SDRzeUI3eTJ5NXhJZUV1Zm8rbUFBKy9BZ1VFckt5Sm5CWmVMSSttbTlkV3N3?=
 =?utf-8?B?WUtlS0FVNGI5dmhPRFZOSC9NODNIUlUwLzFQek5kVUhFWHlwZ3VFa3hkRXZK?=
 =?utf-8?B?UHdrdzYzeFFWNm1sUTdUNzVCOXZ0TVppakxHUmhVSTE2Q1lpNE1sVExBMk9C?=
 =?utf-8?B?aTF3a1MrZy9MU1FTZlV4U3BxbFk3TGdUNjlqUjdJVUVNdk5GWUJkTXJ0WHJ4?=
 =?utf-8?B?VTliM2xaT0dwSjJNRzRuR2g1MlBEUzlKeVBFdnNqZi9OMVRIWGpqTTlsVXR4?=
 =?utf-8?B?Z2ZDOWNDNG8vNHdFOEZsUlNPTmxDMmtkcENrZ3pNNVFpNkRmM3ZhU3RLNGJI?=
 =?utf-8?B?R3ZVT04vZWVjcnhZeStCYTN6SFNXQ3o1YTVheDNZVDV6SjhRS0xvRlN6VnZi?=
 =?utf-8?B?MnZ5RXZRdXdGV09pR2pMK0ZhNm9udUFzelBvd3d5VFRGaFUybFpaTlJGV21n?=
 =?utf-8?B?YjBBamJlN1dyaGlRQkE0QmlNQkpHTjhDZHZhUXZEOU5TU1ZKZVUvbWdja1NY?=
 =?utf-8?B?SkVYWVdmbmNDb2pIQjczd2hjTE1wQ0drZUNhRWpPdm84K2MrN1BOUTdaZGRY?=
 =?utf-8?B?RzdUcjhHR3J2Y2xQdDhBTFdEY1RhYVUwTitOekNiVW9MN0tjQ2pxcmg4bkJw?=
 =?utf-8?B?blp5c0lHaWRwQWNRcmIzR1B6ZTRmNkxjTWU5ekVRc0xCWFh4SDJoMS9IN1Nv?=
 =?utf-8?B?WTJCWlVFSm9IUUVUVTdxTWFNZlF2b2p1VUM2TVdia2E3MVVtMlA3MFBzWGhi?=
 =?utf-8?B?azNGclo4RTdLUmpPT1ozbHpDYXFMME54b3ZvK01WcXVhRXNMbUsvYUlCNEsz?=
 =?utf-8?B?alp6UWRsUFdxY1IxdkdrRFlhL3lpK2s4YmVGeTBzVlJKTDlJbjV4UVo3dVJn?=
 =?utf-8?B?T1k2VWNZdVBKS1E0VU15VEluenQwVlRlZzY4UVpubEJRMnhGWm9mcUd2Vmp6?=
 =?utf-8?B?SmwrQlppSkhZMEhUbFlleEpVR3Z2RWNYTGZlYVdaM0VFUVhYSmNxekRuTEMy?=
 =?utf-8?Q?KkJx014WR9aviRSvp/3AmgNk631jixx8NbL48?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fa11dc-0aaa-4c40-906c-08df3468ecde
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 20:28:56.6248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxnx+LW7lwie5k0FcJPBqF0qhxqhvopnFdmoHVLw884FOy1FsPQZulkepMvv9HV6c1H5XIIMakCOu5kHSZWn+dppjidKn6QYZT2a5E/WShKGldn91Fuh09aS4kQLvqP4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8408
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_132903_934786_497665E4 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Thu, 15 Oct 2026 10:11:49 +0200, Stefano Radaelli wrote:
> scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
> following run-time warning is seen:
>
> gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file

Applied to imx/dt-intend, will see in linux-next after v7.4-rc1,
thanks!

[1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag on i2c3 GPIOs
      commit: c68b3adfc4bcc4bbb0e6c4b65263eeeee4c37b97

Best regards,
--
Frank Li <Frank.Li@nxp.com>

