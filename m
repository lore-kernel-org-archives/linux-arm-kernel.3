Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9422606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 02:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ftj1VyCw;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=kykpSDpR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gasrN6WNBcs44N75x4p65P8w5HBjiN3y7kHHJlhCO6k=; b=Ftj1VyCwTmyf8koE0cd5qoOFne
	iACn7C28XwDbI2R1YlAq03JKFF4D0TX4ezPh62B76UJX3QxtVy91Fo141GMPdVi1Qc/RBwwVg5I5Q
	mbkHGRcplI9i6GF0Kp1hNgCdJdXoMX8Dqb0mxrO+A8qxpINmToIK0LUw6qxVbTXS7joXwsM7A5rz4
	VHq4yzp/RL7ttJEj/PG/us8QcdqxcJ9X8iSZRaOFXlRFZyXHG9+OS/7vMGwVa0T4+ExCr+fYRsjI2
	RDrY78IewsrLG6fUq0nblqiyVrDaS0spDxoJ3n72yNRUMObiUJ1IpVUnM2gjOpIHJGB9wV4CWsyeV
	e0Goyl6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOR2n-00000004Cin-1cuB;
	Wed, 04 Nov 2026 02:48:09 +0000
Received: from mail-japanwestazon11022095.outbound.protection.outlook.com ([40.107.75.95] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOR2j-00000004CiD-48KY;
	Wed, 04 Nov 2026 02:48:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWOpU6hMZpQ3s3bZ8AFcvfp5YfrV4jLFauXDuA27fv8B8Vg/6hqkDGp4msrXtzl5mK7yaJtJFMLE1sjeHLQjEIfobtUmBvfZ4aXrEhOgQCGtcwlZ7MoVNl000IPFFTFL+FhTb/+4eZaSjDnaCZIAAb53FFvGzK6VIdtJ26vat6EPobDSIL825aI7neXCC/sjFcJhVQQSllIFSCZbyUuVyh6qLJgHU4id2T9XT2utaBG/UNtCv5zKAmVbINMgBZBQLex5/zqCVshtnLqVNEKaDlLJZXMKy+Fg7gGUh7WwveQ9z5F6AzyxB1U/+FgKgbfWrtTNqFCA4r1DmlS8rVHvvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gasrN6WNBcs44N75x4p65P8w5HBjiN3y7kHHJlhCO6k=;
 b=WfarCExvPmT9GvES3ssG4TLnrYWy4p87VfmDVkWuZ/OG9gmyvP1wqvmLS3MWjxMR9tPXZVDL/7oujI1Is5pi/Y6C8+CNlhhxOPhOmvBzRdchWzmKpYIOjO6/SEm0+UfV9aWv7u2vjvsY7GewahhY2F4rViTqlSBe5Ss5LTReCE2c5+wKvFiMgVpNRtDGNMRWwfIkVShFZXRFUYwhzk6pu2UEOOqyCnccsILzDvoEcw91/hqmG0SRx6KUAsCj1nHwRh4g02zo4vdxgeUgdWy8j33hSy/WwqcD/85MHpNIuGd3VVm5R4Dm01+baqtkd/XOC/xN0AGzIZWkPUgn3lGkiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gasrN6WNBcs44N75x4p65P8w5HBjiN3y7kHHJlhCO6k=;
 b=kykpSDpR2r7TTYnSD0ztW6U9vuj6wk+ptBahH5KhCue+mn+NDWDZtj1hqrKCqW+7/bJTGnUwYE5JAyDELk7pwB+MU0mpc8IX8cyLfN2Qr6ku4ZdZYJleGrEcf/69uyv+nIcYQFWjy8rXclh+rR7oCKhxlIt2OeMDVog0i6nGxtH1XOtY5JdooMPOqPlgT6+8pDJ3IYte1Bkt1sKItR4h+jjjaEe1cBKryq+Or9zSGnMvvz0r8s28NtO4Ndfl6bDxBTSEUcC2G+ebQM1Mhc6DyCiCUMbhQIdx7vgnZk4W1O1ljnykYw50dhm/WWIWW0IxvYv3Qf0A7dqI3Do7+jSgbA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
 by SI4PR03MB9817.apcprd03.prod.outlook.com (2603:1096:4:29a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 02:47:58 +0000
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40]) by TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40%3]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 02:47:58 +0000
Message-ID: <0ea26873-e34a-42d7-929a-3c003c9896fb@amlogic.com>
Date: Wed, 4 Nov 2026 10:47:54 +0800
User-Agent: Mozilla Thunderbird
From: Junyi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: i3c: silvaco,i3c-master: Add Amlogic
 A9 support
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com,
 Kelvin.Zhang@amlogic.com
References: <20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com>
 <20261102-a9_i3c-v2-2-0c474bfccffa@amlogic.com>
 <aukFP7holuhVE7Vl@lizhi-Precision-Tower-5810>
Content-Language: en-GB
In-Reply-To: <aukFP7holuhVE7Vl@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JH0PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:990:4::14) To TYZPR03MB5743.apcprd03.prod.outlook.com
 (2603:1096:400:74::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5743:EE_|SI4PR03MB9817:EE_
X-MS-Office365-Filtering-Correlation-Id: c4620b3c-49b9-4023-624f-08df3a1e08f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|261102123227099003|10067099003|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|4143699003|11063799006|261028144727099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: Stpw3EDz1PxRyZ3ZmWyCpTCZd5CZeFZRgl6SXJn4QroId/g8MiLaQ7QttQpw55BdQQ3xJRmpLdUeP0QuL6Z4wRZhPV+/k3tHc/LD2muNgw/OFhelahcH6ve1bCl9a+6LOTauzR/+9cLmc5Q4xLMyeam48mfvvmuKXiiPtRc5FT6e4wBdfSagVk2fCw0vuka7GhZI9UFLrFg0wleYCLltGGq/ojtijHc9t48y3ZKBSDbFcRpuYcUCxyftLiJULi0XMmpsUtBc1YMsJ+GVGVX10f1Wg5JeQudMDDuq1XnqsgP17Doz676E6pvaILbcatPz+vDEdIs19Ipty0vASPd6Y8FLwzbT8U2ijkxwpKDc0HfLiq+NPwhqJrlcPaJ85O/QtDAOEtOHY8s8yLYZeR68eYVa1rd7n+w9EIJ7acmTGX9zs6ibTDu4NjzdpgtmyLtGZc+5uIN3EJtwZkUvl47nIc+f6/zD3zMTDQLnjDNFemnZAcUrc8F5oKVX1UOiSiIhUwc0DpGerVbeJzjSC2xg4Idw+MNaJfOLxWsF4+NZSyXoccYwBQeiOQnfqJSqRYe9L4csHScqHrRreUuvAGD17D7oj86eV+uSB76YyhCrm6idehkSU8g6eCAHMtpCeQFQehpzOzFt99GJYiWkHXHUHaj8ToK/F7Tmc8RjH1tDOWM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5743.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(261102123227099003)(10067099003)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(4143699003)(11063799006)(261028144727099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um9PMC91Y3pGN1JLcE5YMnl0cS9kdTMzZ1hyRGVSUWE1d29UOEEyWjlDNHAy?=
 =?utf-8?B?RGN3bzgraGV4UVNGU3FRdWwveExxTTZqQktBRU1ib1pMdCs0ekNXTDZVUVBm?=
 =?utf-8?B?RnpqTk8yMDIyYittNVBpVjUxa2l0bzdWMzBQWkVxRDVLSXZFdkdlV1JmL1I4?=
 =?utf-8?B?L3AwaC84enJWd05yWFRnZjk3MHd2RDMvZDBQcCsydkJNWk9VTlVkS0RzY0tC?=
 =?utf-8?B?akFmVGdJYmVVSEFlR0VzZHc4ZElzcmN5TlFJS254QXhzV1R5b2k0SjZCZ2hQ?=
 =?utf-8?B?ZHQ2a1JFbWM5dWt1TlY2TjFIWjNHUGZJNGdnMGdERENGb0RHZUZEUDhBajVy?=
 =?utf-8?B?U096MXFTMlZqbWJCRkhFWDVqQ2w4UmVtTS9La25LRG8zQ1YrL1F1cWR5TjJT?=
 =?utf-8?B?TGtKTS9RS0RDVmR3Z2wwSEdsR1hOOW5ubzQxTHdhS3dPa05SQytIb0YvV3A0?=
 =?utf-8?B?blMydHgyanJxRjhvakxjUnFncXZ4TDRRR2pYUndDeE5qYlhJMkNkRGI1djl4?=
 =?utf-8?B?UU9vcHZTNzJ5ZjU3QytmczEzM2tBNXJkRGlLMDAvdWdZVThpWDFxRWx4emRJ?=
 =?utf-8?B?MUFzNE9TcnBSeUlZeTNSVFc4U3BiWGdvSVcwb2xGdjB5TWhjTitSTVIrbzFk?=
 =?utf-8?B?Tk1Mb3JFWUlVZFoyRURiUURaWGFwN2NYSWdtR3RjN3g1N2M3c1VWaktvSHVj?=
 =?utf-8?B?N2hhbWhMRkd1UWRJSEZ2bUpjWlR1WFdnc1lQVnhURFkzamlONG9WT3BneVhL?=
 =?utf-8?B?WGZLRWFXVmZWaW1lK1pJTGtaNVRPVUIrVFlFWkRwR1N6dG9mclY0UmpxbjR2?=
 =?utf-8?B?dHEvUmFyaTRDamNqalNNMHdPaDc3Y3lCaGZkSTc0S0hrTkRWVnh1K2JGNXE1?=
 =?utf-8?B?dUk2TVgzL2hkTnNyTm9Bai9vWE1qenQ4MVBUT3VjS0ozZkphcVNHQ0w0NDY4?=
 =?utf-8?B?cUpLY3IxUXFXeEVlZXRBSHlGRUVERmxVTE9udHd5VXZvZmNpV2p4MXExUzhN?=
 =?utf-8?B?RUNxRldKSUl4QzR6bUhWNkJNczAwQ0w5TU1yWCtlRGwzTU1BeHE3cUpKR0t3?=
 =?utf-8?B?bTBBc2cybTZQVERvVHM2TG55QkNlZkdFQ2VybXVrdHdMdGw0M2dwSGtqWFhr?=
 =?utf-8?B?b21XUkdoc2c2c0dxMzlxa05kRVRvVEJicHdqcno0WEgyem80SFZEUzNrRm1P?=
 =?utf-8?B?YllCNTZFbzdOZ2syelJsYTdxdCtaWUhRdCsrbHk5L1ZTMGF1RTlydGQ3Z3Zq?=
 =?utf-8?B?RHJoNEdhRDBNQ1ozYWYxMFZlU0dJVXJkbXdMU0V2Qi9MSjQ4eGttc2prL1Vw?=
 =?utf-8?B?SUVUaG9iSmxlYmJCaVcvbHlEUnJYc2wvQktVem1CT0NIZTZWRmo0U3FJTmVn?=
 =?utf-8?B?ZjV4ektNVUdGQ1dUbXlqWWJKd1EzZWEyZWswaW9nMEgybUhnYXVnQnRIcFhw?=
 =?utf-8?B?QkZQd3J5aXJMNm9XNU1KVGdWU3RVRkxjSGRadk0zUjlDMUE5MHR2NnRmZDVO?=
 =?utf-8?B?eTcrQXowZFNCM0NqMlJKckRKcjZSOUdMMTU3TlRhMERuRWRrUXljand1bE5R?=
 =?utf-8?B?UkJnUm1yVkhrTVJsdG5TVlQ1bThjcUFrREo1RUN5WE5mb3NVM3FXZUliQkk0?=
 =?utf-8?B?dm5NMURhUTVPbDBmRG1SbWRQKzF3YitBbjJpallCSmZDc3REcWZtVzRWMlpv?=
 =?utf-8?B?ZVNnelVvT0UrSlR1YTNlaVplOUw5cVFPNk5lVFRBeWdOd3NmVHhqVzNUb3Vz?=
 =?utf-8?B?TWVEMVQwcklHT1BuQ1RXNFJNQUorMFpKQzNubHEyR0Y0dVdaZ0p6YzJ0ZUVF?=
 =?utf-8?B?TTI3Nno5ZDdkeFBpOFRlUlo4YlpIL2pRQ1ZjeW5jYUpEYnltblRHZ3BicnM2?=
 =?utf-8?B?UWR1S2J1anUxWEVPNms3OGtvWWsxRTJ4OGhPYmNDb3BDYk8wLzMvbnFGRUM0?=
 =?utf-8?B?SjRtQWI2dU9jc1puQU0yb0IrMFBSOEltbzZRL1VqRzV3UnNGdTFoZk5rY3h4?=
 =?utf-8?B?Q2ZrcUtMd1h2YkNiWTdDOGJIOCtSeHZlbGs2SmY5ZzVYa1ZZNDBmalN1NFF3?=
 =?utf-8?B?VURBS2lQS29MT3cvN2RVUHl4czVTcG5MZVc1bEhUa2N4MmNoUnZ3U1BJdDFx?=
 =?utf-8?B?bHhjSk5KYi9ETm9TTnhJWHR0VnRkNzlEKzdXWE84bzJGandmZEtzQVRZeTF1?=
 =?utf-8?B?L3duNk1pQS9YY0NnS0ZMM2g3SmpGMktPTEIxcVRmRUdBYmhRL1FSNitsNkNH?=
 =?utf-8?B?SThROXI4Q3N6dUsrbkVmdXV3Sm9tSXVocHo5ZzNnWXZLbHB0eURnUWZISWJL?=
 =?utf-8?B?Q3ZsQ1BURHZvS0NlVjUzRVRUQ0JTNDY5QnQ2anBKVG9aNW5zdnhxZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4620b3c-49b9-4023-624f-08df3a1e08f9
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5743.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 02:47:58.6659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQQGiB8WB1/A+O6ZWl3tqcCMQfO31+V7g7ZTEqvVBwdywuMu1VGcuzeAPrRO7/D9ob3C8dx48bACD1TPsTQJbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR03MB9817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_184807_354187_22F33938 
X-CRM114-Status: GOOD (  14.70  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi frank,
     thanks for your review.

On 03/11/2026 05:48, Frank Li wrote:
> [ EXTERNAL EMAIL ]
> 
> On Mon, Nov 02, 2026 at 07:05:40PM +0800, Junyi Zhao wrote:
>> Amlogic A9 SoCs integrate the Silvaco I3C IP with two controller
>> instances:
>>
>>    - amlogic,a9-i3c for the EE domain, which takes two clocks,
>>      "pclk" and "fast_clk" like the NXP variants;
>>
>>    - amlogic,a9-ao-i3c for the Always-On (AO) domain, which exposes
>>      only "pclk": its bus clock is generated by an internal divider
>>      located in the controller's own register space.
>>
>> Allow both compatibles with the "silvaco,i3c-master-v1" fallback and
>> enforce the per-variant clock counts.
>>
>> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
>> ---
>>   .../bindings/i3c/silvaco,i3c-master.yaml           | 24 ++++++++++++++++++++--
>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
>> index 853092f75..de1fdec65 100644
>> --- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
>> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
>> @@ -19,6 +19,8 @@ properties:
>>             - enum:
>>                 - nxp,imx94-i3c
>>                 - nxp,imx95-i3c
>> +              - amlogic,a9-i3c
>> +              - amlogic,a9-ao-i3c
>>             - const: silvaco,i3c-master-v1
> 
> You have drvdata for it. Needn't fallback to silvaco,i3c-master-v1

will move it.
follows nuvoton,npcm845-i3c.


> Frank
>>
>>     reg:
>> @@ -28,14 +30,14 @@ properties:
>>       maxItems: 1
>>
>>     clocks:
>> -    minItems: 2
>> +    minItems: 1
>>       items:
>>         - description: system clock
>>         - description: bus clock
>>         - description: other (slower) events clock
>>
>>     clock-names:
>> -    minItems: 2
>> +    minItems: 1
>>       items:
>>         - const: pclk
>>         - const: fast_clk
>> @@ -72,12 +74,30 @@ allOf:
>>               enum:
>>                 - nxp,imx94-i3c
>>                 - nxp,imx95-i3c
>> +              - amlogic,a9-i3c
>>       then:
>>         properties:
>>           clocks:
>> +          minItems: 2
>>             maxItems: 2
>>           clock-names:
>> +          minItems: 2
>>             maxItems: 2
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: amlogic,a9-ao-i3c
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
>> +          description:
>> +            The "ao" variant is the controller instance in the Always-On (AO)
>> +            domain, which has no separate bus clock and derives the
>> +            bus clock from an internal divider.
>> +        clock-names:
>> +          maxItems: 1
>>
>>   unevaluatedProperties: false
>>
>>
>> --
>> 2.42.0
>>


