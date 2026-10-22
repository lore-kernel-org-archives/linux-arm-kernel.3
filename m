Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F0B60A2606
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jsn2KTJs;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NriW1sgv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8ujaezyWkHzxV35PoBptYnf+3taU2SKIS2FlkIdyjWY=; b=jsn2KTJsJrOWSTABBGGqc5dCD0
	cGl/tDq384jW1UBqv475tEh1mUlVT6pZpXPd3kZrvetJxqvRMhMV8Fz8DZ8xcqw8Xds3BiMhFpkAx
	POJBAHUJUI5+gBoqrF0LQOXWznVhhNNz5m07DWjYZfQXybLyX4G3eklVjcLUFbHs0/27uINckm0HS
	mgYVMmnJD5l5HCeKMk1wHBsEB2GdQjpaLH5YVAeKx2OlsF9gO4Ty0KNh0+FbzUiFPYWW0vhzxLm5x
	zMXy9/KlBqCYtk5SRn0cbqPC5SZb3Qxs8xTfrMwJZPzbU2G+dZY6pC29b3aNNnR2ySpNUDMIowKGA
	bm/BgxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzCy-0000000Ev0D-3ePL;
	Thu, 22 Oct 2026 20:16:16 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzCw-0000000EuzG-1HHz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMJ68g153nTZDN2gISu24riA2zNlUcG+XOypHH2/W7aV0BI1pOTYF5AORW4Z5ItAp5beHRDwjj26lEPA3hvQREHaBr5HvcOTicwIVLaU7q3uNvVooUq8j0eW0TlhpB5GJFlA7FJFK9UpZjypbfwpWUX3JEQkGqccPVkkEdfDDXV4Adm2dvgor5ckIDL1BxnM65FVrFaBwk4Jvkr00MPDVVRFSu5YIKrO+kPw8koJviuLjhaQDYXpT0ZGxb4+XxdvZMkcMAjDyShzBEYwQSxslLarOMGgxGIEW58257woHhb4QuFXO3zT1TOFCkMnhf00583jkE9QlcS00hTgFG0L8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ujaezyWkHzxV35PoBptYnf+3taU2SKIS2FlkIdyjWY=;
 b=VOakqaOd2QPEgXVAioShXGFACk0RL2e+YeOwOCw4x5uN4j0+0vdaTeOFVK47wMPTIv9mWX7dM7wB15Fua8X9XYtCATxZfyAABemnBnv8OEoTDl+e5c4YcHqkkMJY4+FR8atTKI/QbxWwvEctjmD8cbfiGQMqEcqa+yEzU3CCRJH3dq01gdIBGIGW/83QFtkIA+5HD/bBmxXI2cKqpcq/82V55U+fK5kpidI4WbfxxBWlY7vohMBHlKh93DinPdDB+csniP9l6llbQ48H4/pLQ4t8Xu66M7aUbbMbsT1As7ndNNjKznzZBh8bYI4pJbHhz4e/XLgEHkr48ie+gcXaHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ujaezyWkHzxV35PoBptYnf+3taU2SKIS2FlkIdyjWY=;
 b=NriW1sgvWCPxmMkWYJB/c19WXkVzPfxB/fRLHZvMyJk3UeBc2yH5KZ+p/UBpx/NsLfq59btZ/TgsPptbhIEvmD1sOtwd5CdzUPkh13FPfKRIDoeCI2+w/X2K60O6NSykzBhS6e8e+XRlqSAwb7APBfRJaYXS2I5bC+Uzwyr1E+cygxdOZ7tMR0BD2Z0TMq7UL//7Wu8soBKQw7KoqkbBRDRIegFwS9Ln/pJs/JC9JjLlfyevkeqvCDWL7ra4GSVtXSCdwCUnWDIQn11KNOpBo/vbRrmaqlEZ/skvDLqaOysYa29sHZiTOiBVA1UEMbixzvd/sr9lFZPdlkfhhakgLg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB12151.eurprd04.prod.outlook.com (2603:10a6:10:640::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:16:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:16:10 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH subset 0/5] ARM: dts: imx6ull-tarragon-common: Fix several issues
Date: Thu, 22 Oct 2026 16:16:02 -0400
Message-ID: <179270007894.1295526.11469671726717636347.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004140123.46461-1-wahrenst@gmx.net>
References: <20261004140123.46461-1-wahrenst@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR01CA0002.prod.exchangelabs.com (2603:10b6:5:296::7) To
 MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB12151:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c0d4a9-d46f-448a-07d7-08df30794fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|1800799024|366016|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: P5Jt7Ikow6CBIxQYw2iOsulIkzNmSwuDD50Xjlw0T3yIpgbf8ez/OqiR6ssANprxOU3LensfwTjICmVoCWZChi779/SO3e9E8ir4Vi7sTzlTiaRytDUTkU1xoh3xLMefnrW+6eotEnuRGSY3g0Zz9Cj3fI2dKK2jLMx65bb1ugP3NaZHcMJ/yjAKn9+Stw8a61WcSIOLw6hpFCk0aH742o1f+ZhVHN734pU0zCWVzrKM95+QPknsTHN/va/noi8ilIu0hStCcmA8dYDQBCF3bPs42nnlpnLc++HBKxYNS1L7NsR0HRw9TRFQRuWEyr4UIc/V1HRWgMwpvwz/FXfLGZLJ5LzbnPlxYMXk9qse+34WjbhFodgVaJOKutdAuoLqummYKSEm73JKrGA1g42DusylRrX7Z6kJaUDFdcPqU0Pc9Vhkp46gzYWQYl2aj0pvY5w9UOnaQpu3cT9rCcnCofvszPEET9bzIIOSD9WbB491BuSUZCfLJYN5nl26UYQRB32uKXhVEpGbszkJLiETd0Dn+XdbAGTkki9ImB4PYTAiDt8PdigIPDAPleCWygffQFW66fTkreDxGrI/+1y38xeDPDZM/Jcc/DVBHQF3DXwb0+acA4BUs5FS+td7CIb8yD5Kk3V5R+JK+MPKb4u5CRlSCzn7eisQbTa6rQA45Fo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(1800799024)(366016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE80V0hFdm9XVVhCMkpsNUVrSmJGejYrVGd5dmlKNDV2N3dBcFBoZ1pMbnZx?=
 =?utf-8?B?dzcwQ0ZDc0o2ZTdySDYwTUVJcXhpQkNNU2liVmxNREhkb2tZcjRFcWd1V1By?=
 =?utf-8?B?NEVXVDZCd2Nzb2F3YnZXYUVDb1FWSGFuVFZXUmxqbE12RWZrYzZXa2xGMzRC?=
 =?utf-8?B?R1VialJRenBaMjU5NEx5eVV4K3I5T0ViSDFVNXUwWnQ1M1ZMcmVnbG1rQVlH?=
 =?utf-8?B?akltZDVNc1JxbGVBUDlCY3dadUJPdUJPdXpiYVkyTlJ5aDYxNmxsbkhYL0lr?=
 =?utf-8?B?ZUQzS0FrK2NMV3E0V1N3SUdrVE9mVjFjYmM4R3BWanpFSTNubTZqSGVxQkIw?=
 =?utf-8?B?andLbUJRL0x3MlpaVTRYdks3WGs5bkNlS0wyeEpCYzBDd29CbWlsZjl6YVdC?=
 =?utf-8?B?cGZ5TXFzb1JIQTZHOXQvVEhGd0laY21HNVNlNzFBbmhPSTFvbUJmOXJKU2dl?=
 =?utf-8?B?bkFTdGV6VDdtNWJxQUUxWXUzdmRZeXlHRGFPNEwybkpwbWYxUllrNGVHSXpi?=
 =?utf-8?B?WFh0ZnUvY0dpM2wxZVlxVktmWDBCcEl6UTRpU0FIVFdqSFdybk0xVFN0RTJJ?=
 =?utf-8?B?RExSbi9nazNiKzBKV1RqQVRZVE9CVVNIMEx0NnhML29QSEh5djduVWRqSm96?=
 =?utf-8?B?aXA3eXNCQk1yUTBlWjhheEhTRHhIUTFQSlltNVNVcG0rTzFBYXdRUHp5OFhK?=
 =?utf-8?B?Smp5ZlcvNDh3WmMxNFdBODk4b04ySDhrSk1qTGpDVE1JczVReU1Qd0hIcVBJ?=
 =?utf-8?B?byt6bU5sSFFZVkpmZnBBK3R6OXBpSHRNd2NMdjNONUJ1SG5HbnlPeGxaYkxW?=
 =?utf-8?B?UUlxcHRJMjVhYW5TSVRPY09UM3FjR2NFMjlVdFhBMDRMd1FQejk3M2RKNUZ1?=
 =?utf-8?B?VnRQVlY1aHN1K29Ic0NVNzVrQUVqa3lYTU13bjRnQXlib1NiQ2dpYWdhcWJU?=
 =?utf-8?B?dkFzd29pVGlSbk9HNEU3ZjlmSHlGM1VKUHk4V0wvVWFCZm5NNWg5L1JSMU9w?=
 =?utf-8?B?T3hzUG1WVUViaGQ0VjhMNitGR0tVSmk2WkdldFpxWGtYT295Q0tIcStQb3d5?=
 =?utf-8?B?WUwrdHZTb1RuODJyRDRpNDQvTDl5bzNIdFNISm1HQU40NERPeS9SanMzR3Jl?=
 =?utf-8?B?RWVUT2dTWmF5QkkzN1VuTWtUY1ZhaDRXcDUzMUFqb21ySkhycHVCMUJVSVNi?=
 =?utf-8?B?dURZdmNaazkvZ3d2YTVOSFdYOUZTMEg1ZHlwU0FGUVJ5L0FQL2xnQTlENnlF?=
 =?utf-8?B?ZFJhRld4K3oyck9ydURYeXRER0pFTzR5T3B3dWlHb0RsS1hKeTk5WmFDSUlO?=
 =?utf-8?B?ZFhrN3FXd3FUMWg5eHJYZ1htdUR1ZDk5ZHk5OThBQXFJY0pQcTl4VkpwcVJW?=
 =?utf-8?B?VTArN3RIWnluUnMxWkpXdG9kRW9ROC8wNkVzNmV4R3lSQkE3bkVkOXJGQ2k2?=
 =?utf-8?B?cUphQU5hQ0tnaGVFTTRkQnRZcFJIekFiUWtBVHYxaTFONUova2V1eXVPU0Z0?=
 =?utf-8?B?TFk2R1c5eUh1NnNRNFRISHdaNFFjdmR3eWYwTWdqRXJUM1BWKzlzTWVlZmpu?=
 =?utf-8?B?ZDdWZ080dFNKOTBYRGFIOUIxOGtabFFDQXp2NXFtc2dZSTBLbmJwREtwMVVU?=
 =?utf-8?B?WDRyaEpYUGxkTWpobmRnMkRwU0lYeUdFaXVJbG1kY0g2NzRKVmVENDlSY1lo?=
 =?utf-8?B?bWRETnVLTHVFWDZxK0JqMzBsTnZaUVp4b0I5bDdaaEdlb0VkT0c3ZlpsOElM?=
 =?utf-8?B?R25qbjE1OWhFTjBqeHM3Y0VyenIvU2FKclk3dnEzbjJKKzFSbWhHaThQaVhL?=
 =?utf-8?B?dk8zTGtuZzRtaFJSbUV6dXp3anQ1WldhNExITGtGSk5Pc3dqSFZLWDdkQkc1?=
 =?utf-8?B?Si9LMWd1NlhBMkMxaUM4ZThQditldDN5V25XZHNzcUo1bEU4NjhCT3NkaGJ5?=
 =?utf-8?B?VDNhMGxGeTJvbGFIL3ZlZXJYL0piQlptQVBVQW9YMnlhOHJ2d3g5UTJ6b0ZE?=
 =?utf-8?B?dC9WZC9tNkJmTHVjTkUzNVVwTHM1N3prZ2svS1VWVXpIOFgyek5WOWJLQXhT?=
 =?utf-8?B?TmlyYjR2SGF0Y1JNMVF1RUV6cWphNk9wMTdYRzV3UlJaSWR5R3RiSm5VYzlY?=
 =?utf-8?B?S3F1TnV3Rnp3YVh3Ymszb2h0VFJva0NHcDV3WTlGd2Mrc0xPY1VYSW05dG5Y?=
 =?utf-8?B?RXlIcFl4d0l1Mk1GRmZUa1FyZUpJMHRodldveWUvYVZJakFUeDNVV0lHc0RT?=
 =?utf-8?B?VDFBNFdsUHhSdXA1NUhYK0ljUFF6blA4V3kvN0ZURjAxS0VsaWFUeWVrV25h?=
 =?utf-8?B?ZEp3TDNEM0EzWUlESlkyTFdyYTVNUXdsNTBQSk9TNnc1U3BpSlEvYzZ1SnM5?=
 =?utf-8?Q?HFepWYBi7DVHSyucs+E9Dgq3ZZUJ6QLT9pStU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c0d4a9-d46f-448a-07d7-08df30794fe9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:16:10.1549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDhYfMePTIW0M5QQuUOXdHC1LcldcmzwKmGU9x47QxcSKnNb1EqaNvWhXZs6Sw/XW48by5Dz3Serkq2Ic8hr3Tm+QTQXsFsIMREaoeMbC+XImfHeMz8NqTQiIueytfsv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_131614_487680_6F5038D8 
X-CRM114-Status: UNSURE (   7.97  )
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


On Sun, 04 Oct 2026 16:01:18 +0200, Stefan Wahren wrote:
> This series addresses Ethernet and PMIC related issues on the Tarragon
> platform.
>
> Stefan Wahren (5):
>   ARM: dts: imx6ull-tarragon-common: Fix Ethernet regression
>   ARM: dts: imx6ull-tarragon-common: Fix Ethernet PHY issues
>   ARM: dts: imx6ull-tarragon-common: Disable unused LDOs
>   ARM: dts: imx6ull-tarragon-common: Fix i.MX6ULL DVFS
>   ARM: dts: imx6ull-tarragon-common: Fix vmmc supply
>
> [...]

Applied to imx/dt64-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/5] ARM: dts: imx6ull-tarragon-common: Fix Ethernet regression
      (no commit info)

I skip this one because I have a question.

Frank

[2/5] ARM: dts: imx6ull-tarragon-common: Fix Ethernet PHY issues
      commit: 1202a3664f912bef4f1d55bbd0aa4aeed4413ac0
[3/5] ARM: dts: imx6ull-tarragon-common: Disable unused LDOs
      commit: 92bdb22202206297bdcf782221cb42b569a69d2e
[4/5] ARM: dts: imx6ull-tarragon-common: Fix i.MX6ULL DVFS
      commit: 0c5a0753eb865e01b66a9a0a1775b14044f8b057
[5/5] ARM: dts: imx6ull-tarragon-common: Fix vmmc supply
      commit: 2b5c99f428ed9fdc3d63525fb5875447ae3f49cb

Best regards,
--
Frank Li <Frank.Li@nxp.com>

