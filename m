Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15301606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k6eDPZ1D;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=viznrg0U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AuIpWgG+TApJGja8j7LqM+NR2HRHOOOz1K+n6Dzlt7I=; b=k6eDPZ1DBO4uMDFAqE2Es8P77K
	2IZ2S0N3SN3ZslrlX4YYqo0fNpndQYy2UQvau9Ui2gAlzyTWj4RD10xgA/3Hq94cL4es7ItJ1NeR5
	QfcZIRJkoRh/1D9Zy9qz4tbVo1zOGmkUEvo5aB9vY3NslY3EGnvX1wV7e3+Rfog/7iOqx6buOEOaX
	XVV5tnYUfMijuC4XHSnyDEOFG6Le/jGWCRGSoPhJCG5Q+FvqTItgeNceFd4V1kLG64GjpL/tES826
	Oee5PMsKiBmGI6viTfOd6Myk91FcPoRPmTtiq7Tx5AqV+6uAu+PBkoD3qTYcgQ8ES2EKmye8xlyp0
	oDUk/44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzmU-0000000ExbX-1K3N;
	Thu, 22 Oct 2026 20:52:58 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzmS-0000000ExaZ-06Xr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:52:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMsWr25bPLTwih65TdtObRe0reLEdceSHC6/M4oPWaN20xC336hCqWgkgFMeuBK0nbfffd1C0SRCp5PwTNcRbYme1Ql1wy9K5ZVSkNi1TLsou0ms1RrBO13UjUAYmyXqz2agjquwMf8LDVMVdnuxXMnJhAK0V4HSrdE0ZWseZlfywomvW1WyxQh4Y204VZUmqnEX2WRJt1/ewmU2eCeO3D88+N6gQwqiA4XOADKRepR/8PfuUXTXxrmDPw/qeZmCDF3pVJWO+bX44trjjldbFTSXzNfMF95jqSxc9+mCDKtZ+mWGZpYgsPtBKPC0YTiL6L2TJGuEzT7KB6GL3mad1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuIpWgG+TApJGja8j7LqM+NR2HRHOOOz1K+n6Dzlt7I=;
 b=ndnUocLTc4zFWLTsovKsvFowOkQl6hh8HEH+HhFbdaufPq3PFDMg8t2wDnq8zQWYRaPA5tTzkEkMpba82pazH/2Wvlrol1ptkiyaMJIJa8oCPv2J+xv75hfZT3zQe5PfcVMdltuH6KB3ofj7GvhXeLXgtZgTZuI99nTWdF8U5dxrto2Lw3vbh7wVIf1WK8Kz0UREpASLMklSayTmCWmWVwgd/6F5rYwJmSFKPfz2RRNtTedRy3r5A65s31COvlIaP949bvYc0NP+R+XZRXFaVLe95wkI9AaE/H6PudLGKKjyd4pdTZ36bl9Iij8T2kTrMIRHFYJ6UeWC2Z3NzCGTbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuIpWgG+TApJGja8j7LqM+NR2HRHOOOz1K+n6Dzlt7I=;
 b=viznrg0UttmajGlEAbNjnP1V+OphKaj7YNvkfAsuvYwVeT3TPD43H7b6an80p3e3mFEQuSZE4FFSM0Hu+96yzh+TuvUy+SjAbxG9Qsu1mv2or/O1M4+41AjpJkcauDaOB820IKhiYi4AEl/Wk5l0kVgTEiz+a92Os5VWR65BJQVV2DGeXyXw+F5MlZfW8Km3cT+EPSrZ265Z4Fh0qEicoqWc9glfdn7gD/1M8KOkx5Alitm27PzXDOO9ZqjUB+ZLs8X9cfdqWz4cbf0Hiuv4g+dr1ElulBfICB6zq21DvcWrJOd1YaD25s3iqNmHtQp/KOneQ0DmoqIhFzYkUEPO5w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8209.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:52:50 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:52:50 +0000
From: Frank.Li@oss.nxp.com
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: imx27-eukrea: Remove invalid spi-cpol
Date: Thu, 22 Oct 2026 16:52:41 -0400
Message-ID: <179270232925.1335998.16519184494934165592.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204817.463567-1-festevam@gmail.com>
References: <20261016204817.463567-1-festevam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:510:5::32) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 20eb3094-4060-4c2e-a909-08df307e6f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|56012099006|261009221727099003|11063799006|261009221227099003|261009220027099003|261009223327099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aNAcFbpSchcGzPGwHKHJe9Up6blBawCfiAh60jC5zxdv/L1obRBEmXf57tNTBWG4blzLvO1DB41OfdNru/yKI+1MlMe2moYmhwQtpDQte/J1KSUZXUI0Ri55DXFCEVm86C7TR1KrhMI13foQw5z2h+CdKslKIFtFNGff4kO8nmutLj1eL1ytnHgDapNj2IMoqih0I74z1cfYHn3dpcDNofaGfQ55fH28gEf/1UfY0oA7QmarI0mLwaa5vKqb8lQT6rqKpvCEoe90WYjLWy/YMRYVxgtaXsWr5tK5idlRsAcL5EZKEJkG9Bqk9FnpL7lk6wTMJNq4UAUCCRDIw/pTQ743BpyIms5B5afpsAonKgqDnrX3gWoSHYo3v4OjAXy/yPB5InlwSUe1dfE9R9iVUjo3j05mZ3W8xrlubBD12uw8Jo6uwYSSEvVPPhOWgIc86Wmp0ykbxa7OBWTB9+hs8/FgEQG/roS2f5OtFrka0sswyHgKU8/pYgEuRr4QywWNnklEZFMvT0V+pvrtP0ihRKrbxfSaekkA29c67yEl2KF5gYEP8qlXqnmoOGKU3S8MGutQ0ahEIg+RkzXlZ6GwqBmqow1egfHdTUE3abCEn5ANALqzwMAWRcjpy7bdK18CiGnKZjL3hJYgQ8AcVQeAr9Z/rvLdl4G3ZSoNc1vI64Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(56012099006)(261009221727099003)(11063799006)(261009221227099003)(261009220027099003)(261009223327099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjlwOVdqa2tVQjRhcEJYVzlySG5nS0luREVPTjU3Tmx6SCtVenFZRWJra0Nw?=
 =?utf-8?B?ajg0U3h3M1MxRHkxSG1yWHNZbmljN0xTY1hGWldQU29XME1EaU9vKzY5eGRD?=
 =?utf-8?B?Y2I4YUdKWTRlNVpRcEtDcjRXNHdFNUJvQk9qVTNSZ0Roeko3M0pHTkd0YUl0?=
 =?utf-8?B?UjJWUFJ4dmVmc2NnbVRNZXpOR3N0eXdhTVR2cG9zUGlmNGxDUzhIUjltS0NV?=
 =?utf-8?B?UFN4eXZwVWVxUHQ5Y1Vmc3p1WllRY1p2a0RZdjVpQUNFZllRdWdheGMyQXlr?=
 =?utf-8?B?TTJxVStkdDZ5L1pRb1dZc2tXQzMybE1GZVBjTHFwMWFNYWhudkMrNk1lQWN3?=
 =?utf-8?B?d1Y2YXdwZVBSVDZ4N1BwS2I1ckNFQlc1bXFkRmlsWXQxODgyOU9PekhPOE1D?=
 =?utf-8?B?SVl6SXBZb3BDdGNubDFZQ2tZWjJhbnBvRE84alZTaXFXR2RzOWRVN3o0Vk1K?=
 =?utf-8?B?aVBXTTI1d3J3K1F5RWgvSGtVTW9XWDBEc2VCa2hieE45NmhPa29OUVNDYjEr?=
 =?utf-8?B?aTlPei9KdWs5ajBUL1hVNU93NHhvekcrWGVodDFPMmVsazZCT2tKNkROSzBr?=
 =?utf-8?B?ZlNPWFJlaGp5Rnlad1J5elpFaGJBNUlRbHlBWnFGaDc0ZDF6b2hTYk1oSVkw?=
 =?utf-8?B?MWJ4bVQ4M096Q1dnaHJEa0FCdHBLZ1NBZzEwRVhaMXZTbzJMR1MwN201WjJQ?=
 =?utf-8?B?SkFGWHdVejlwZVNwMXNQN1BqUHJ3ZTEzNzA0cVgwR3lTclNKbktZV0ZYcjRw?=
 =?utf-8?B?SE9Tb1B1WDZwL2owQTlBenhrb01PS3M2ZVdFRHUvMXArTU1INm9sWHM0YnJJ?=
 =?utf-8?B?SXF3RVZsQWIzOTJFVFZkMmhSVTRETUYwaGpNalNoNitneEVCaFE4R2FvbGpM?=
 =?utf-8?B?ZEF1SU5EMHRaSUltT241WkduV0huWjY2NDZyNE1QV3M2YTIrOGp4Q2NES3hK?=
 =?utf-8?B?ejNlNTJpWlMrNEdjNG9rSnc1Ty9ZZFdHQ1NCbXlXYzRFMUZEZk41R2hOSEN6?=
 =?utf-8?B?dDB1NXNEbUx2L1ZMRWdnRFNqMjEvZDdYbDJOSi8rRndDN0Z3VTBzVzNCQVhC?=
 =?utf-8?B?ZGV1b3pRTENYVVdXNkpYN3hacHAxdDlvZ3psMlgwenJWRFM1MEY1dTRrYVc5?=
 =?utf-8?B?eWoxclFVRy8vNnFYUDZtMUpGSDNad2lLVU9WVzg4VmErWFNEMERpSTNhNFA3?=
 =?utf-8?B?b01FdU40MWVIVHRxSDJEa3FIZDEzVUREVGlVZGREUTJHRmdDRWgzd2dOZFdI?=
 =?utf-8?B?RTRNVGRkVDlDdEVzMWk0MGVkSWQ1a2NIcUNPV1MvVzNpS0ZyUExPbnZWckdR?=
 =?utf-8?B?L3pwR2o5ZUhQaWtPTXRXQ1pNdlBtYnlvSEI3eVNSc1NySWY4ZGRsWkh2Y2Vx?=
 =?utf-8?B?Zm4yN0dmR1dxZHZYSGdZdGlxd3N6M3pyRjkxci9EekRHNXo2S2ZtNW1pTWxo?=
 =?utf-8?B?NnljeXV3RWVBc0RZay9FRDgyeXBUOElNeFBEYnArQzF3NkZlSWx4SlVnWkhC?=
 =?utf-8?B?Z0FMbXhWR2pvVW9SOURwanJYWEFqMjZsbzRGSkJBYit2K0lVZUtmaXdybm9C?=
 =?utf-8?B?UFA1QUJJQnkwbVI4bmNLOHBqSlNzU0xuQWRwUmVqNWN6b1JnS1NPMVRXVktU?=
 =?utf-8?B?b0lzMGs0VWFJUXdXdC8xUTRLZTQvc3o3RmpHK0J2dHpXTUFJMWM1a2djMUVI?=
 =?utf-8?B?dU9qeW93aVdzNmNIYnppQVhyc3lrK3dvTS9Cd0NPVitlS2hpWVdFNUl2elFv?=
 =?utf-8?B?WDAzVFUvWkRadDc5WmdoTU80a2llbDUrWnNuQ1VibW1pM3RaampXYnF6cTBQ?=
 =?utf-8?B?RDczS1ZpM1BoUGZWZWYzaFJMbDJ3TlVTcXpVOFQ5a2tCeGI3Tjd0K2JjWDJW?=
 =?utf-8?B?NTdOeWhpVmxUeG1DTnNoNWRtT2cxTjF1cmdqSzE4Wm4ydkcxOWxzVXdiUlF3?=
 =?utf-8?B?S1V5QWdCNnRtWXJhRUZhMjgySHQ5cE5UbkdLeG1SQk4zdVFUK3dLSGJXMGli?=
 =?utf-8?B?U3hDVlFrUEJ0dGpNblVycWNiZE9wMjVKaG1TdWdPVnJyc2dsREhxWnVRRko5?=
 =?utf-8?B?ZEVrVGlPNUFkUGxNQ0J2UlYvVFlUVzVFaVREcVo1dW1kVkZSTy9EWEw0QWE2?=
 =?utf-8?B?RithaEU5ZFNVb3FHdjdybVRkUU5YZm1zV0N4bjhyL0pFZk5kR3g4MEhMMDY5?=
 =?utf-8?B?bUcxRll2SDd2aTNUNGtSRXBTVlg3QnlJTHZ1OWNZcGFWTUdrQ2wwVnBJd2hz?=
 =?utf-8?B?dXZqMCtCMndIbGQzSC9taEZNOWVzVDBXR3Q1RG1XY1BBc0VQUk9vTjZxd0E5?=
 =?utf-8?B?eXVoL0U0TzVEWGxmOVY2NnhwdFF6TG9xd2c5dVZEZnBYNzRIRXhEcWRRVE82?=
 =?utf-8?Q?lPww/8up2w/+tcFFachXXWavwJK0RWL8HnQkY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20eb3094-4060-4c2e-a909-08df307e6f6e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:52:50.4108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsNmM6MsiUYMcJMXMW7pJl7Y1R94ZB1AKvmWqy4FEzQPVg6jbUjS8Od6XulieahXaOWNGoYatXm0mDdJ/xTnXk8H5/hBL+u2JzzIq+i0MkCQb0ErrHQmUnKBE4nWPYgM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_135256_066238_892C8624 
X-CRM114-Status: GOOD (  10.28  )
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


On Fri, 16 Oct 2026 17:48:17 -0300, Fabio Estevam wrote:
> The ADS7846 timing diagrams show DCLK low when inactive, and its pin
> descriptions specify that DIN is latched on the rising edge of DCLK
> while DOUT is shifted on the falling edge. This corresponds to SPI mode
> 0, with CPOL=0 and CPHA=0.
>
> The spi-cpol property without spi-cpha instead selects SPI mode 2,
> which uses the opposite clock edges and does not match the ADS7846
> serial interface. Remove the invalid property.
>
> [...]

Applied to imx/dt-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/1] ARM: dts: imx27-eukrea: Remove invalid spi-cpol
      commit: d8c85b09c98585528c6647a5e8e52d053adddcef

Best regards,
--
Frank Li <Frank.Li@nxp.com>

