Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE81CA5FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmCmwPH3xPf4FZ3N1D/f0/4AyLX+ZxjK4tdIaInm6AU=; b=BasKAhjCUEJhnWvPIzrVVa97ns
	7r+iLwHlKiiGDGQ+2PqCANq6ZuL6+Qe9tu0APwMcX5C7VcqjBjPIqHb10A3Kzv+G8KZZfmSls87Jm
	pQ1nA0AHnZM9QUqNL8rA0Lc5bLEM/e7ANTFh5Ii8xsMokbMW4acQ1vYz3Mjt7CioigelJdh/Tpaec
	F+LqrHQlVETx562TuX02KQf52nxGbEbyk3XrfB1le7/pFRtytpJKonssXdgF1wNBrRFMTEq+mljCz
	hie70xJ/5IvGNYSTsKdugXLtaJwVKQaRUGmKLSye9OAOjwnlpAhfsu1D1NBVk5qtnPq1GKbeLESDv
	0J4Pgjuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoVy-00000005F46-1fvQ;
	Wed, 30 Sep 2026 07:14:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoVw-00000005F3p-3bnz;
	Wed, 30 Sep 2026 07:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hmCmwPH3xPf4FZ3N1D/f0/4AyLX+ZxjK4tdIaInm6AU=; b=gENKD9d3wLrRkLRqC+7bjYxNLZ
	2kCSKvNZX2pe8TgTG2k92HEkiqC4cwmFnpsL04QGiCdA8FsHm10Kh3gpVZPREpQel+PBmPqK4hbam
	VJxCfinv8BtQW9V/ERIdCLxvE4PnYRdy6EMQ1PKqh9pYOo5C8SPwgGbo9TlliDidmb/aOzx01T4f2
	sYCU9KQJU17dwDBcG7KsAAXZ81KN7fji/r2b1gs1jH8jwyBAugEauJ9lgKtFwHRj2pPEP/txGUqMQ
	80vm8vDTrlRwImK9PKwBcMLhlKrJzix0qtyaR5R40gwB+PxQGa/v9C9DCspmQY2JoXnFyUZX1kdlb
	H4OVWsVg==;
Received: from mail-japaneastazon11023088.outbound.protection.outlook.com ([52.101.127.88] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBoVs-00000003SLA-25wH;
	Wed, 30 Sep 2026 07:14:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTIePpr1i1nW3TbNmu/glFr6rUMs6O8MKn6c7Hl0xRekdzYLECVzcqEPT8R4QlKhG09LUGMNTk5ZJE22i1XuFzXsc9kZGsck2vrWXVXLk9JSspMnNQ9pnTCTba+wMRkG3Boe6wX9SoT/u/Fz7zC/OhZtw6aTRblvjnl77AgmJqysmsaU6iJt0mFSH2rNYwPqHKlnbzP6TrYkx6sNH6Jsz2bXX5hK0yQ64v0AumYworTZ329MJxDsCD71/4ZtmfUfG20QDhxyWxiFIyycpD+8x2MDgCMJt1ucyhPGGGo3SJlNhpbktp8HYvQvM1Xzg/eDOdkEViYAWJc3c2U/p5VqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmCmwPH3xPf4FZ3N1D/f0/4AyLX+ZxjK4tdIaInm6AU=;
 b=b515CiKasyP4V6817LgO0W71rLsQlMtqg6oVIIbB7HsKoAIpWzB/jlrzlTs0V6y2J78TuAtKM55PMIyCLLsAmQh/gCzzDndGgkGYITo51iGxLKLUJuc4KnOF8bJcvwAjC8m0g+zJfKdNbCRtZ2bxEIRqvTYx+jDbue0Kl36bSU8yg7I8ym1VmiXPU/ff9iTvmqBPzsYfV0Qr0ZrRX/kb9Ap8x3UhZoNj6IKSinp3IBf9CnrDBdEScb6nVaPtTz1a91PLn1ZAbfTcS4IjZqC8hX9HWfH6IPi71kSLsS47QqTdMk87QWgkhbNldRDS21acpsmyLbn9cwI4qSSgtfd5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmCmwPH3xPf4FZ3N1D/f0/4AyLX+ZxjK4tdIaInm6AU=;
 b=up77NOuKgoEUXCschBWUiVVCcUbZlFlSxsEz+pxaJbEDr1liKZqEe0BhgTCHYVb9J8N65FfZcXXa2ymNJXW1C5IF0yL4W9ivXv/0jUrL5uU5l9Qvwuhidn9BoL7hZJD4wtqVfAyNDjDZeR66WUdEEjFRnqWOurihBA//DCR8Bgo9z5brAlbST/7AKMsDTp1W2URd2BvrXXoBiBFEc1zx7A0cQc4d6qVKrQ8R34kHfVrOzMRMc77hFmjErGmG0Qppi8XZmy8kwkd1bngTNPjJPVewk8rkniIzv5JR1hLocCBqF0aOOpCTKMToYnqXwyjjdeo39I6umo9I9R8RTsG9JQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SE2PPF7BA6A63F0.apcprd03.prod.outlook.com (2603:1096:108:1::49d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 30 Sep
 2026 07:13:43 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 07:13:43 +0000
Message-ID: <1bf03811-40f8-4c85-bf45-e48c5545c3e1@amlogic.com>
Date: Wed, 30 Sep 2026 15:13:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: pwm: amlogic: Add core clock for S4
 like
To: Conor Dooley <conor@kernel.org>, linux-kernel-dev@aliel.fr
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr>
 <20260927-add-t7-sys-pwm-clk-v3-1-18d66abea4d1@aliel.fr>
 <20260928-cardiac-relax-cdccdecdd4c2@spud>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20260928-cardiac-relax-cdccdecdd4c2@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::15) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SE2PPF7BA6A63F0:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf2d5bd-ff39-4874-339d-08df1ec25c0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|11063799006|6133799003|18002099003|56012099006|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: aqJLC3Aj/W3XuBrdfnBtrD0j9uwQtclB1V6XDLEu0MYbJtoo/R6FFEv3sO8dTjKm2baUmSoioXJakPVXuhJy188SoCSVBtAYqwddZU7JvHJfj9UwDTXTG1yrf/St0zvZAh0yAlrrnPqdgP/CEXwpwrb7TKnnHQbWvjcmjCklKHh3ZNca0H04T+PTysrlHpYYNSFFQsVlJll9b7UrV8bodJEwtcVs2Cp1ZcGI19EgYwSN6wC2ssR1FxainrYhoH+VYzpOMqcPfRPuKtd1+UHzkTVd22Q5v3scMaOma5LSa3mMarOWGInFec+pjGIlUnAfmv3i+K0QrI3bhdit/0nzoWDyDYGLpi3NiTWITS3wct2Ix9Es20pRd8XRFFu0f6ZpQdX6/iymrhpM+X7r6AkggJCpR1A8jW7op1qt/TYHfx6vFnuB33SnlxLxonmKCvzR7WtAYV+ozQxAr0v3PKJ3k26OmUQFrdVevbAxAwHUx3aY9e3pkjQWswlmTo8nOlv4MpLvDxM88VT7Q54xBNzUcsLzokMq37itJlmPbKM046Hqa4LLmY7mOY1+uhjmX5vuDntdACcrbqPvUxBC9UxyGFF45VJjG687ngZGElE0s+o0U3z3ThMoTPagMmMM0abK3ttjsNU0WUEJO27JfGFJNsrUMdgCxyaLVxpfNiHzZAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(6133799003)(18002099003)(56012099006)(22082099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUFjN3QvZVBYU3dtT09ZbG1OR08zMTJyM3ordkFNUER4dmlHM3VaREozUklE?=
 =?utf-8?B?Q2QzViswdkp6eUFDZFhvaU5ORUkyTXhCaXlncytYdkNWR3dmc2JTZUdwLzBa?=
 =?utf-8?B?dVR2WER2RCtVUWVXNGhtZU0zY09CdzBxdXpYR0lFNUpFUzRJdXZmMU8wb1Ar?=
 =?utf-8?B?a09qZmRrNEFnaXdnZWRCeDVRQzRzWXVpeHVQbnREaSsxeXJlUHFSN3ZoVGZU?=
 =?utf-8?B?OUR2dG41bTZtb0VKVlV4c2hWSktEbHcvYUVhTCtOekN0TmJFY3ZLalRYaE1l?=
 =?utf-8?B?ZHhtVjVJWThaMzJsOEtZOExhU0V1TkphQ1NFQkRmUDVzSDJ1cVFVSHJTVVJr?=
 =?utf-8?B?MVQzVWI5RFFyNzdKcy9ESWIvV0k3THNSTG1Qc2E1NWg4UDNNcWhmRk9FbFRK?=
 =?utf-8?B?VEFNVlYrTjRNMzlvZGVSNmd0eEpKSFBFN0o1THJSVHV4TFh5ajZSUVFObFcv?=
 =?utf-8?B?ZjNEcGhRYUpCWXZycm1rNGhmd2NLRlYra2dpVmwvb3ZVWTVwbHpDVkxlaTVq?=
 =?utf-8?B?cExxdlc2MHN6eHFnelZRMEp4Q05ieHpDWHk2MWJCajRjaVF2Z2lTdm50Ryth?=
 =?utf-8?B?YllBM3BiSVVwQVRCYWpKcXZNaWFRWWgybnpqV08xNjRmNHNYSW1FZU9yUzR5?=
 =?utf-8?B?dmZqU05vWDBvN3BKK1ZVRmJNeWVUa0V1QnA4V3c3ZG1lMU56aFlUT1pncEpZ?=
 =?utf-8?B?US9EaTRja3ltbWtGNlF1K0hvRmlMM2NjNVAvVXRuNGZGb254WmNGNks5ZjJx?=
 =?utf-8?B?Q2J0Ulc2NXliY2g5TG16K0VLcVZPUlkwYm01WHd4djZrV0ZMamtHQTZoVjVi?=
 =?utf-8?B?d1RFQkhxSUNsMHBNbGIwaWJwbjZheU5RVHRWSEVJVlNqcmpTbUlrcWtjWVJ4?=
 =?utf-8?B?UmdIazRTcmhKUm9OSHd5S2YzdHhYaUgybXhWSlV6Zi93SVRoM0pvejVWTGMv?=
 =?utf-8?B?WSttVCtHREl5cXdiZjh5S0xHVk5OUDd4N3htQkZtQmVZclpqejcxbUVpNThz?=
 =?utf-8?B?clN2NElDMjM0dGJXTm44WklRNm8rZVJwVXI0Q2MyakdzdzR0WC81dUdwQzl5?=
 =?utf-8?B?VTdWOHh6SUlaenNUdU4rY0o4TUpONTRxbFZ1bEVuOE1iTm5KVDY0ZDFHYnhN?=
 =?utf-8?B?RXpBSGxxWldaK2MwZzl1V3A2NUJaMitDNWRlTUl5M2ZxYkhBc0xIcFQ1Y3Mr?=
 =?utf-8?B?clFwbzh4L1ZUeXhTMzBOOEkzbHlEM2FCbHNzMUtwVGdJU2tUNmNJMUY5YXBm?=
 =?utf-8?B?U1h4Si9SY1orRUZPSWdBczZKRVFqSWVqUW13Z0JWZjRCZTFqN1RkT1puVXVr?=
 =?utf-8?B?Sk9VbWMvdUN5UWdGM1cwOXpWcWZOckdXaGJrWVRUcEU1U1llOU52UVNHQXRS?=
 =?utf-8?B?K2lqNnl5VU5nTGc0YzVoNEhZTlRaOW5FNEhsOUdnYkxoeWhMUHBodlRIS2Uy?=
 =?utf-8?B?UWcvYTR1RWcrRXgwKy9JN0Y3YWhhbmhRM3ZNczc3UlFjZnFkcXVvazdySUVi?=
 =?utf-8?B?a25GRmdqUHdQTExrcEx4UzZhMHNQNGlaaC9MNXdRVEd3YkJjOXpkaVU3USsw?=
 =?utf-8?B?WC9mbXlqM0wrdmJSSjU3RWxPbVY2QmkwNlRRcXlzRmx6ZXh4eGxqS29HNHpS?=
 =?utf-8?B?T0MyVzQwNy8ydzFtRCtQcDc0RmNvakpwdkFlYnNRODlTejhTUng2NXd0ZzQv?=
 =?utf-8?B?a0tKYm5OTzBiUXpNUmpxbGQxK2FxQ0xMUHFOd3E1a2labkt5SW93TTdLUitY?=
 =?utf-8?B?TFVsQWJvakJKUTVyUlIvQldva3g4ZTgvV2YrOS9Yd295b1Y4OU9Rbm5hSUJx?=
 =?utf-8?B?RWNvbTYyZlZrQ1dxdSsreTNzYjlaWHpMVVd6akZzakdIN0orRURUcWt2dGIr?=
 =?utf-8?B?VmpyRXJpTHdjb1F1UDJuTk9NZE1yYlljUXpmS2s3NkFJcngxMjZEMEhlR3VZ?=
 =?utf-8?B?VGxFRjV3OEhmRlJoWlhuRmgyK3BFbndtbEhZTzh0OG9BUkFSbHpMRVAzWkFG?=
 =?utf-8?B?K0lNcmd0bXNxRldHSkd5eW5EWGVMU21ac2FnRGNXZ3ByMUNPcGdGeVo3MHk2?=
 =?utf-8?B?eFArMEpFaW9PRTdveVkrK2xxWWhIY1ZkQ1RScG54ZEtoWFlhYWM5d0hNSHls?=
 =?utf-8?B?Ni96bE5vMlpJWmdPT3FhR3QxOGdSd0QwemMyMTZiTzdMR0hPbnI0K3djNURj?=
 =?utf-8?B?aFhIc1ZzQ2k4U0t2T3I3Z1JlSlRUdTR4ZFJNL01DNXZwaWtERlJwWlBvM2Ux?=
 =?utf-8?B?bGJsY2hRQ2JoYWNRK2VSYkR3QUdWcVI1NHdpU2EyRnk1YlFIdWZwRCtsWlJz?=
 =?utf-8?B?UTFlQkg4MzMwVVFhd3p2WS9iK3R1V0dQYTl5d0VTVFNZUnBnR3VMQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf2d5bd-ff39-4874-339d-08df1ec25c0c
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:13:42.9728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtazefxCjmetxpa/UNrRZsq1Sj85UWLBzRDI06JVVXg9B/0nxrjiF2oZd5M/I0p0Y7G4LeEZS/lGFIcl3lBTug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF7BA6A63F0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_081401_270348_E1DA74B5 
X-CRM114-Status: GOOD (  21.98  )
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

Hi Ronald, Cc Conor,

On 9/29/2026 12:46 AM, Conor Dooley wrote:
> On Sun, Sep 27, 2026 at 04:28:15PM +0200, Ronald Claveau via B4 Relay wrote:
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> The T7, A1, C3, and S4 PWM controllers have a system clock in
>> addition to the two input clocks of channels A and B.
>>
>> The channel clocks are acquired by index in the pwm driver,
>> where the core clock is fetched by name, with optional get
>> which is silent when not provided.
>>
>> Require clock-names and minimum 3 items for S4, and devices
>> which fallback to S4, where the PWM devices do not work
>> without all 3 clocks.
>>
>> Add an example showing T7 usage with its fallback to
>> amlogic,meson-s4-pwm.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   .../devicetree/bindings/pwm/pwm-amlogic.yaml        | 21 ++++++++++++++++++---
>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> index c337d85da40f1..e9cd5f1fdf264 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> @@ -62,7 +62,7 @@ properties:
>>   
>>     clock-names:
>>       minItems: 1
>> -    maxItems: 2
>> +    maxItems: 3
>>   
>>     power-domains:
>>       maxItems: 1
>> @@ -143,9 +143,15 @@ allOf:
>>             items:
>>               - description: input clock of PWM channel A
>>               - description: input clock of PWM channel B
>> -        clock-names: false
>> +            - description: gate clock for the PWM controller

This is the APB bus clock gate for the PWM controller. If this clock is 
disabled, the CPU can no longer access the PWM controller's registers.

This clock serves the same purpose as the "bus" clock in the thermal 
sensor patch you submitted previously [1].

By the way, in the Amlogic clock driver, many sys_clk/clk81 clocks are 
used to provide the clock for the APB bus of individual controllers. 
Some of them also provide the functional clock for the controller, such 
as I2C.

Therefore, would it be reasonable to keep the description here 
consistent with the description in the thermal dt-binding mentioned above?

[1] 
https://lore.kernel.org/all/20260923-fix-t7-thermal-clock-v2-1-bff7a09eb487@aliel.fr/

>> +        clock-names:
>> +          items:
>> +            - const: channel-a
>> +            - const: channel-b
>> +            - const: core

Similarly, would it be more appropriate to name this clock "bus" as well?

>>         required:
>>           - clocks
>> +        - clock-names
>>   
>>     - if:
>>         properties:
>> @@ -179,6 +185,15 @@ examples:
>>       pwm@1000 {
>>         compatible = "amlogic,meson-s4-pwm";
>>         reg = <0x1000 0x10>;
>> -      clocks = <&pwm_src_a>, <&pwm_src_b>;
>> +      clocks = <&pwm_src_a>, <&pwm_src_b>, <&pwm_src_core>;
>> +      clock-names = "channel-a", "channel-b", "core";
>> +      #pwm-cells = <3>;
>> +    };
>> +  - |
>> +    pwm@60000 {
> 
> If you respin, drop the second example please, since it doesn't actually
> do anything different anymore.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
> 
>> +      compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
>> +      reg = <0x60000 0x24>;
>> +      clocks = <&channel_a>, <&channel_b>, <&core>;
>> +      clock-names = "channel-a", "channel-b", "core";
>>         #pwm-cells = <3>;
>>       };
>>
>> -- 
>> 2.49.0
>>
>>

-- 
Best regards,
Chuan


