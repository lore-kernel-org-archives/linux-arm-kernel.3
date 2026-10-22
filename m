Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A46606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 19:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bpQ1+3W+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=g9knZ+nw;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=q4KQlN8X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nwpjFnv6b1l2qrkWcMkqr20+ehW8Sd02i5TNHUjwcvA=; b=bpQ1+3W+yTQJjbkOf4vHIcXwyw
	+4e1GfdHtTphetpsWPBbi/HhkRrIMHKlPtn7NkvfpFFWUc5Rdk6xvs0caJ9Hr2+Z+jLzQ4R4ASa47
	bQkNvoRFxFsD0NaROBYiqmU1lTnHxwlD4NsC1I9C/iTvQMS49tAlbrUWdCQPpYBXEkDFaen04jUsS
	E+F3XZ0p3ZKF6wLbtBbRw4quSrziWVD1QfyqS1ygKWIEg7vM83ukUF/Mnbsn97HTRD8yex1wFhkoV
	qx7l0BpLiJx+WFqtiM00xK62TsymAJEw6zK8asTkjIh0XU65tc1/DW9x8eFFXFdVeWomwVzjdFrdY
	xqlDWR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyiO-0000000Er6D-073Q;
	Thu, 22 Oct 2026 19:44:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyiL-0000000Er63-3qd5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 19:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nwpjFnv6b1l2qrkWcMkqr20+ehW8Sd02i5TNHUjwcvA=; b=g9knZ+nwO1mTNo3I0Mj0QO+d6l
	0WWZwMRow67R79EKH6PmTZby+wDkgiforojK7RfCwg5vS0Fvcbt7FdJnbsj1PK0fitFPPaM3W+Dlr
	wR8Bri+pef2ALp9Xl99UEM3ftemsUbtDFvlva4uAMvUgYRM4AUGntWzgQKLPC0aRztawPfu66K9A0
	rBmLXsLgWCKGZmX4gM15yidapnKz8iKUTOMVYt2WIkHYrYBLFdEkwiRQcqpV8IJYUttr5pBn6m+Vv
	9AyKD8hONz9C+G9ZiI6R62aG6BkdkEPeDaDYYaOLO9W7iJPy3PmBC88Qk7eQ5++bntGt/s41BZWcL
	dfgjVu8A==;
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyiI-00000007sBF-2QQp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 19:44:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWrHzjHwbwXxGQUMG+iBBegWpNzI0mq5VLeMRiYGvC1jQHRf7tPsVuF9pTvjk8ehFaUoVq/hzYinF3nXRfItwIj1qzsFJBBXz1B3ah7Z0saa2ARYRHIa+BzAT8NicWBZzuduWDe7oL+QrEQb/zA0eeWJwsAOPBr9gbQctSMKnAXswd8rzWzksSau75x/Hjb/8sDXn0zqfvga3FhFEV7eqHk7uUjmjPUh8PvDvCxbMXukyj7zo6PUGT0qmVGChPg3UPQ5TjHg6l1jKSIPYboGbUtDg9zN1GSNRTePSSM+dukLFlhhvJLtbn4FftnKwbaWX0sz6Zkjv9lpXaAUxCrSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwpjFnv6b1l2qrkWcMkqr20+ehW8Sd02i5TNHUjwcvA=;
 b=Zh5yc9b6ORDz3TvUkOdMqhiVmwPEbD86a7pOY4m00KqgCpp30FKRyeNmSQIaaCMvvUT3kiE/H0Z98GAdrOoOc6FtLasYYtPuNmTSADEURcdsN6UEqVPBq/kB+V5bDARe5duc73a0bL1HTItq5qRVOosDkdo4z+nBO5J9kJqC2kXe5UECOLmhEo8G5cYygjlvCjUZ23jLVPCrVaLcu9JaC+NNw45S2krLXq9t2tbIfyNyZgApiLQsc26Jqee2+Eu8v6OrlQMsYIyQ7ga7HQBkHnhPirwvfJ2j2mfe0Uf/O2IBpWsY5kq4Ge9QGFpK4cIDVdf8V6FoA4huRNpgfYMPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwpjFnv6b1l2qrkWcMkqr20+ehW8Sd02i5TNHUjwcvA=;
 b=q4KQlN8XVnuSl3xpUUYryLaxHpPq6OYWtS48FyHsCGfh5TKZ9ntl0pHVtGhxOTclyLewRrEViqVF6iPJNnGF8SAGesLGFnyA035sl7eu4iceHDiVGZfqA7Q3S/R5AZgpLSJYIDKyBD1n6YirZWThRFOdGbXsXTEeJQOuW6AgFSuEAulYqwbZKjoTt9kMRXiVrz8Rsu44Q2DpNw902rYTubl2BlSWy0PaIz1EY0cU3RJ5e+Nu25dFx2f5ei4NJbaq3hH01FdirkgXCG0vK3IJTJHR7BliAQZfzZlvIiApPPAYquF4N83W5I3K/T0gruCt339i5tToeBVhd2R0GrLo4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMDPR04MB11651.eurprd04.prod.outlook.com (2603:10a6:20b:71c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Thu, 22 Oct
 2026 19:44:29 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:44:29 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] ARM: dts: imx: enable SPI on Apalis iMX6 and Colibri iMX7
Date: Thu, 22 Oct 2026 15:44:21 -0400
Message-ID: <179269819274.1261785.1048583515170191615.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155401.2584935-1-francesco@dolcini.it>
References: <20261001155401.2584935-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0085.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMDPR04MB11651:EE_
X-MS-Office365-Filtering-Correlation-Id: 031aa6eb-9a4e-4e39-3e3b-08df3074e344
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|11063799006|56012099006|10067099003|261009223027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: f5Dkpji8kH7A7qSWAvZz/0QZj+fJ/xqJtxqd0672AoNGi4R4MPQmL8WOM7tZ4WhWzq3JjLrBxOI21YGYPZGeGlqMZ6Sh28nXl+FmVQdG9kmmKpBBQvwol7rJ4iS6pVGo7QQ9wb7M+T0PXYL3LMap/8cFsQfqeW2Gka9qflQImpVsh7/0hF875CUlz5Zl18W3XUt8KaF9CJoQtrrt9PgD0VLNzVB0f3kp7j1NxGXSkhIdAY4CxDTrQ5ylgLxLHct9th32bvegxdpFhy4lEwlGLAzYMm2pxz3p/FfE6prQQrQ0lKB0H79IwETy9cmY5a3qIyLlLWV2VxLxi8qVbwfU4Vci27tWH7xpFqIJ76fliu8+Pqf6b5f2SODlqb3HukBc/CXRRmaV2iNtKXzyO5kGn6EOd8MX6POABGoh1gzFM8GffabdFqpJvtgxuieXYc4tVpdW6rcWesV0gNE6DFYYGKtyxxiLZlJrySTmTa+/oXXjezHTxn0ZxLX8CWKKfgqNe4dFeGlwWYTkSW28fOhLmA84cgkNlx1eTos3z5A5lbyBl9K+oh/gixWtreM52rH6G5HL4jh6dgriPrX0nv1BpGv0I69UzTgHm+xhxMMYf/Y3pKbdof/uAvJW4S9X22hUJJJxm3VaQ4ozrsiMm9WXwqYXFCFHweeTSJs/vP5twbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzQvbU1IbHN2UTh5azVPbkcvOGYzY0dIa0ZXdjhYdnVjVVNTREFxZTRvTUsy?=
 =?utf-8?B?L1luQUwrVmNFb0tKQzZzZVZDYkJtd0M0THdlMGFxTHJJRmNOblpGWmdJSGlL?=
 =?utf-8?B?MEJYVG5iQ0pCNllUcTVOMHRHdTF2Smx1VjE1aVExNk9JRm9aSjU1T0k3Ti9G?=
 =?utf-8?B?Y0p4S2lFLzVUUHFkNkcxZ09aQ1pQUGdZekZRMDh2RW1pUkNBQlNDY3cwZnhC?=
 =?utf-8?B?WkFRelpXTGY2dmZQRU5jNmhZbFFqRS9NT0JYeXdNay9Vc2daYk4yZTJncUQw?=
 =?utf-8?B?U1NlWDE5Z2x4eTJkejhUdDllMHAxYlp1cUtKeitQNENhUWs5MkpBS3c2c3Nq?=
 =?utf-8?B?UXBtRmJwV1VhQlNzRTFXemQ4dU9FZitDVDJQOVltRFlaTi9JWXZZaWQ1dk9z?=
 =?utf-8?B?K01lRUtOeklTdjNSQ1RHeEg5NFd1czZXVjFMSjh1TEVIdWNzTW1ocjQ2USta?=
 =?utf-8?B?WHNPaE1kR2xvdXJvZTlLRWYwOFNROU9uU1dpaThuQjNsSUs0K0lQL1dxRXRi?=
 =?utf-8?B?aTFJelR0U0RreE5WZkpsT0R0blJvbDdhRTVReENKZ3BEK3k5VmdPbmVKYWZR?=
 =?utf-8?B?d0NkMzlUYktOdkNkRUNMcStFSzI1VUhIdVAxbm50aGtkTVF2SU5hZFBBbWE1?=
 =?utf-8?B?RVpYcnJMRE9OY1F2aUdJY01KVWg3TDZueVlEd3JRYnpmN0g1b2cvYUI4WjZw?=
 =?utf-8?B?NjluV0ptZ2x3c2ZuaVdXcUN3SWFpbFFENVYrb1N6aW9FK3pNQVlWM2ZMMGhz?=
 =?utf-8?B?VGMrMC9BUExRaklsY0I4eXl4eWM1RUgzVXBEVVZLTjBaNTcyc0hsWmtZUDBC?=
 =?utf-8?B?Tkovb09GR3lwbW02OUJNRW5EUy9jTDBuS3krU055QTlPNUUrZHBKVHNuYm0x?=
 =?utf-8?B?NE5McERBMzhadWJEZFFXTW1YQitWWVVodUs0M3d4NmNQMXZnY2Q3TjB0bmVU?=
 =?utf-8?B?bW4rbllPWks4ZHNxOW44TlAycXBEa3dUeDJrbURUT3Bsd0NsY3JKelMyQ3VH?=
 =?utf-8?B?cldZRUdaa2EwQStZT2Z6anJMcEpaUkpGVDdyMFBPdGxoU21kOStXdUFGQk5Z?=
 =?utf-8?B?ZmF4QTR0eFYvMXhrOHdLUTlQb1NKc3V1eW5MSnIvVUxjNWlLNUdZdzB4dWx2?=
 =?utf-8?B?a2dHMVNrSGVabVdVZW9MYnZuZW5FYzhldjUrQllMOTdHQzIwMTBRMWZ4SGtw?=
 =?utf-8?B?TUVMWHpQRWpSa3dUT1pxQ2RrZ21Ca1piVDhWZ0tCT3BBKzdOMHlieXJ6MHR3?=
 =?utf-8?B?NFdxbkZiZHo1bVg4RzMxMCtlbXNaT29QT2VtVWdIT3AzU3V5UnU0Yzhwb1JT?=
 =?utf-8?B?UjFEVXRpL1RldWRuTlhWQ256OWNJZFhHWXV0d2R2NkNQUndTaStodmtuYmhL?=
 =?utf-8?B?VmtOYmpvVURlbFRtRzQ3YXdRL1k2RTFiLy9kODlRbENyUHpWNE9WNy85elJ1?=
 =?utf-8?B?anBXY2hTWThCUkZNL0NIYzZQNkhmb1luY09TTTdvMWFrTGFBdzFTNVZ2MkZT?=
 =?utf-8?B?NkJYTkxPWTJzK2p4d0EzVnZLUFpIUTBBajFmWUFjUThrdzhSMUVIYlA5aEEv?=
 =?utf-8?B?ZmNaWmg2dkl5ZlhrR0lURGlWNCtYeEVDN3RlMjB2TXNtb2tPNzhINU9EWUt3?=
 =?utf-8?B?dDBSMjdxZENtb3M1djRnQzg3dlA1OGFrcFhuK1hYS2ZYRjYwZ3QxV1lLZnhm?=
 =?utf-8?B?b1J1bGpzQnJrZnpkNkg2NWc4a2U2ZGxOaXIwYTBIUmZtQVZPSlBHenNueElo?=
 =?utf-8?B?VFZTdzA0S0RMM3pCYkdkYjVzUjJWSEUvUThxZmorUFlVMnM3K3M5SEwrSzhz?=
 =?utf-8?B?NDlocDJydytPSVRWSElUNVIwb2J6MjVzTEIxeEtQa0V0K21uZHNmbVQ4N1Ns?=
 =?utf-8?B?ckpuQkFsdHFrbTJNU1JCclNSZE4wR0Nvb1lqdi9LTnhiSUVRbVZYRFV6dFRI?=
 =?utf-8?B?Z003cmN5MzBtelZvY2pZd0d1Ukg1Q0JOSWF3SUZpc08xTHgrME1wVm0xZHFT?=
 =?utf-8?B?a1VkUTlPYThMWkhOZlFqVkJkN09SYnlqWUJ3ek9KWTl1QUsvSjJZb2NESzdO?=
 =?utf-8?B?b3BXWDRTSFZrcXZHK0Y0UFZKZUxJeTBtdVl4VjVtNDBtdk81SC9vTnVBYlBt?=
 =?utf-8?B?Yk5MQnlvMmhoWm01azZTTzlXTFhaZk1vZUZsdWVpaS9TSXRJNkxiNUdzQXJu?=
 =?utf-8?B?aHFSTGwydkdnMExuYkhNakptcDFlMG5nc0xyazR0MWZEaHJVTW9rNlMwNUZW?=
 =?utf-8?B?OGhKWFppNVVIQnJVYVhtcVl3QnBJaHBkSEpyVmJTTHNmcVdtdkdYazMxWUls?=
 =?utf-8?B?UVhsNXZNYm80MkFNVFFoYm9EMGt0c015WVdXUGYzTTBZTHRLZDlMSUphYWNq?=
 =?utf-8?Q?7N+o1BPnSjjmpE22R8E4yYL1cA+k2hKAT+h91?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031aa6eb-9a4e-4e39-3e3b-08df3074e344
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:44:29.7960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dXfsk3vw/HQuOPVT0NoU/sEHcTz5f2+hktc7AgFlP8uyD0CBYH9GSFr8ptCkDbMW8GKXADYP3rGMjnOCAFYTLVgH6aPWoO7bE1CrlTO8BMgI/G70++45h85vB0hbdya
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_204435_041865_38A8979D 
X-CRM114-Status: GOOD (  12.72  )
X-Spam-Score: 1.9 (+)
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


On Thu, 01 Oct 2026 17:53:57 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> The SPI controllers of the Apalis iMX6 and Colibri iMX6ULL modules are
> disabled in the module device tree and no carrier board enabled them.
>
> A device can be instantiated from user space through the spi_master
> new_device sysfs interface, so enable the controllers on the carrier
> boards where the signals reach a user accessible connector.
> The Colibri iMX6 and iMX7 carrier boards and the Apalis iMX8 ones
> already do this.
>
> [...]

Applied to imx/dt-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/2] ARM: dts: imx6q-apalis: enable SPI1 and SPI2
      commit: 119f908dae670028f5198e3b662489297393851e
[2/2] ARM: dts: imx6ull-colibri-iris: enable SPI
      commit: 180afbab4babacbc4d9f6100722170470a0ff9ee

Best regards,
--
Frank Li <Frank.Li@nxp.com>

