Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9233606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HFjl1Lrs;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AK/qbtBP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EbSpynavqoDFnl1RpVUtokCrDV5Frcra9IAngscRbm8=; b=HFjl1Lrsw7yCHGxWt4SXae9nKA
	JyjCR30hbF3LtmbU6dQl6Zv6M3VGfheUqtDJtwj9s9Uydc2iH+X7rXp6t+XCxwGQNfbdSnabUzGHh
	D5a4RjAzXHj6yHZ6j4yxTOHUc3TVtHz287tqFA3q3cub+HGk8EXl+wikqw9UfpHld85GQnkJWE0OQ
	PMwkIg+dsKAFR8n+eJGagg4upBLbncfgy+wP7TMHgz/QCl8pZYtnjvs5TcZ1AnIYG31FpbO1Q466f
	/3po81nIcreW504Vx4Cu34GzouSdiTdP6YozsPKGVzLYxQ7KR8Gr++7go1820YTrqgQawFoD4mY7i
	7s8oL+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzhp-0000000Ex32-3fpR;
	Thu, 22 Oct 2026 20:48:09 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzhm-0000000Ex29-3L6r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:48:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdl3WGcMsY1S1pqTPsMRQdqo/t3Hc48C26p2JI6glVlmsbMVg/4bpzt521m9ZsiVpaR4uPNyLUtgz2wpB2RTkAL3vnaLLnpmZTvAkxRU80gSX5Z5JUoLxf8w/DxwCYrwjei/P4BzJiMLmgbQFmO0lXobghYrpt6yVH3b4GNtgqMWzyFTsDrYjCfNEmg6+ADtr25szToIETNrsVYCqDrUJc9quhVYQYcULn5RR+IRALpG47z3DxCPRBUZJmXFt5TfpcmDMg0aLjyoSBC4tGG9tZxschzrYa0YACe2x2kjJHVYuafd3tIn2wSIZxrKHGzjFWKrvOmz5Grn5cHNcrD7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbSpynavqoDFnl1RpVUtokCrDV5Frcra9IAngscRbm8=;
 b=mOnwMisSYExo7GFwW1GIAEuT2xa74gPF5SSh5aEzHJBpCa17ed3/b+mIk1qokV8t1hMwekikgJYC5VQg77pqU6OzmJ+Mq8QFbcbpBSrEtUP2hthLRWSZFKLnxdBmc9FUj9u6KUtsuTH+fU3Hy3uUs/4oy9VOHmODtSxFerz+h2eoXmXShZWcuHy92ZvXR68UiwL3s+2QUiCLWHolkmWNciYQH4XAG03ZH935HVcwK+UYQWuMEIDRKIfkyc2/Jv0aTbdFf4PT/Lhp1FlygkflffH7btYeUk0ilJJbFP9UpAqkR/bTzTFKGlvmZvXvlpj/EX3xHGwJ6mi10LijxYx2eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbSpynavqoDFnl1RpVUtokCrDV5Frcra9IAngscRbm8=;
 b=AK/qbtBP9LJPzxkxOx7HXoXtIQxtbJXi1fx+8akj4R6jjl1rswCPZ8JK8zTUGHvZnrV9LnLdUanomYmWIt4N6VIrdYVxF3Qa4+326l8MLmzsjBOVtF4Kl3qQgIEpnRr2QLZfmOnu/U/TofihYxMAt4iqI7aRMuTkV6RaVgIFl77+jvPL87bAgGUENfjF9ZrGuEV1v1fPCjFzeFVLuf7zZtG1VdTFvnnEDT3HUDpEby6tYbTQt/tiJb7QCsiJWJ+CB8i7K8kQD9/asBeMoy0/0wvdKFzpqZMZb0dPCcWf/XfAIcxg7Nc1RsI+NLGLE2W6s5ulnOTMUh+Qe66yD2cN3A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BR0PR04MB431110.eurprd04.prod.outlook.com (2603:10a6:2c8:33::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:48:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:48:01 +0000
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
Subject: Re: [PATCH v1 0/2] arm64: dts: imx8mm: Enable DMIC input on Variscite boards
Date: Thu, 22 Oct 2026 16:47:54 -0400
Message-ID: <179270203436.1330608.6264909391367606820.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792139809.git.stefano.r@variscite.com>
References: <cover.1792139809.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS1PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:8:44a::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BR0PR04MB431110:EE_
X-MS-Office365-Filtering-Correlation-Id: 668f2672-b49f-4df9-de37-08df307dc370
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|7416014|366016|56012099006|11063799006|261009223027099003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info: oya8ab5vkhCV+ZsFwe4SBEUbuAkXszMqKZlsiZK8az/nYyt+pSiuTOUSWvEknbYmpcPzPqcbNrspKj25ZbRR4uoh/YMo7jMrArAsyVyaYbSREZRWpRDd1dhIwLqHa+SqaTvo+VBWqgT/sCY8Ng0OYGMolvO/zrGMIukomjhEGKdSRr3gbMSzcTNJpAYvXzl43x3CN7svIBOJY/IxxzlX+Wcgxy0UxTI5kBH8qFoJb7iC+8Yc6zUq1uOfYwVipAy1csJo3fy45IBP3JuE4sm9ZiWrHDZ3eIx1/zLTD0a3QKGMko1cLeLCxZnPmKrumoC9tGZJ/dnF7IsKYsq9JCCjgRILT3wn+oCH3JFGBvUuIoI4oc5EOJmO+kxRJggpWWYtmMkiYOO+v9Ba5DZYAHwAB/+x1EBAu3uwtcU/PfbMI3SuL0cudpUQn3URPii7tSeaJEGHqq+W0yglMwKyQQlt4n1+iF4Cd3eWiLbrZVj9AipMyrhrcnJEIdur7q23QOTzoJp2UoJwLEiQyQC3tApo40sUUK6xdK8BIwB6Yc+F++17whFzwztXSDIXUX6Z5jH9RZT53zEl7Q+KrNgYPg/Lmaj15vZ47gDTBQkbC7iE/ebBgIb8nut4s3D3pzjW0ypvgtX++4voxgHCIb3LeD3+XX03YNpV23X7VXiGdXYB+o4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(7416014)(366016)(56012099006)(11063799006)(261009223027099003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTZJczJ5Z01ic1FOSTVhV2UwT1pkcUZ6MEV2a29xQzl4TTNRSW5mc3RnWXUx?=
 =?utf-8?B?LzcyeDd2Qk40SjRiYTRVNXBYcnQ4Tktad2hOc3dsMUl1aGtQbm1rdXMzYUxz?=
 =?utf-8?B?QW9KdjRnTVdYNmgvNFBuZ3MxbmxlNEJHdk12SWVicFVraU9iUEdaWUdCWDV5?=
 =?utf-8?B?clRWOTR4UGJCR1F1bzZMVzhJV0lBdUlJVG1mYzNLakkwbzNnU3hrK1d5bGRZ?=
 =?utf-8?B?dWE1QzVNVVJwR0NTNUtuckozUTRwRFk0SFI1SnhXNk1hV2FOQ1g4R1BwaVpl?=
 =?utf-8?B?RUIxYXRPQzhYVGwwWWQzcTlCSlpoOFNlMjhaOFRNQytpL01WQnMvRGtOeUJh?=
 =?utf-8?B?M3I1dGtrck5RZ2hSREdiYWc2dEdSKzRMVFBMUlRZSm5TNWsvaDF2UUxvaTJs?=
 =?utf-8?B?NnNQc1lVRTA1UE9hRTlUQ1VmOXdwc1poajdWeEFLSElIbTMrVWphaGpUeHV3?=
 =?utf-8?B?VDhiWHQvVUtjQjJwZzhJNWcwbStkeVlVb3FGdUJMc0dVOGFXQUtrOWlCMUpK?=
 =?utf-8?B?TlJ6OElMbENmR3ExeWtaNmR6eDJlTTJHUCtVTmxnZ3FtTVdPbXNJUlo5WTNj?=
 =?utf-8?B?ZlBJZTdyTTNqMzBlV1ZCSFdyY1ROR1JKQ2JSdHBuZk5hcVpRNEVteHNqQlJV?=
 =?utf-8?B?R1dWT1B2UXpPVjR6MXFmQ1ozNVVyR2lxVER0US9LWDFWUmE0WGVZZ05aUS9w?=
 =?utf-8?B?d2lYdElGK2xFbGs1TkVkMGRQZTN1RTNlTHBvSDhkT0ZCZ1ZjSmxsczd1S0F1?=
 =?utf-8?B?U0Q0Ni9IVCtKQ0JxQSs2RTdSVGFqYzdwL3d0a3lTMHFkQ2N3QlhCcmNHWGZ5?=
 =?utf-8?B?WURIcVNQZVN4Y3p4TzV1bEM5ZSt0azN0cGV4RE9BVVdyOUJES0VGeDNXM2pi?=
 =?utf-8?B?bGRJWGF3UEU4K2ZUMUpMeDNkRnVCTXVwR2pTOXhyWWlPUFI5THNUcy93VzdR?=
 =?utf-8?B?OCtPbDU5WmVUeHByaDFncXF1QVVEZklvMHlTVXlBRnM1ejRxTXlJVzJGVHVq?=
 =?utf-8?B?OWQ0VkNFKzIrQStDS1pzcUpXQ0xpUTZoa01aOEhrWFYweTdRL3lLY2svdlc1?=
 =?utf-8?B?YWo0QUM2UGgwOG9sOVU5aVg4TThhYUhlVFRjNjZhVFg1L1hlOTNMdmpPRWRN?=
 =?utf-8?B?bzJkMDBsekR1VzhLK1BFOXp0d2pzWjM5NnBJY0tRS2tOTWxEMFU1WlZrR20r?=
 =?utf-8?B?UXNPdEkzMVVGWGJsSHVHbHRFaUorUUJxRHN6bHVVQXNqZTVHTXFTTVlQeWxU?=
 =?utf-8?B?Zy9Zb0MvWU9ncmVKNzZnVUdhU2tTYk02Z3JQNUN5TFFRb05SMkhXdlVDa1R1?=
 =?utf-8?B?SUE0OFpwTHY4V1hKcFVjS2xXNnZsZXNwUXpveUgxTVVBV1JEcUh0d0xOdGhE?=
 =?utf-8?B?QnlYdVo4RFFvL05WWWZ6WUFGNG5pVm1iUHZqYVZpV1hhTWxIN1p3RWorQnNY?=
 =?utf-8?B?d1Q5a2Q2NFd3cFd6OWY5YTZhSk83aXRqMjdvbGZoc3FNMnpza2FjdEY3NVVD?=
 =?utf-8?B?ZGxVTE1GQXo5RllJb1pzSHR2Y3grU2hXZzAxWkZBU3BJWm9Wb0NIcU14elN0?=
 =?utf-8?B?dEdTZGt2dXVYWExsN2ZvVkxuMElTczVwQ2IwbmorYmc1L0dmUmJRblFGbkt2?=
 =?utf-8?B?b1MwcDFXMXY5WnA0OGFuMnVhVEtwTytuS1JrbGFIeFFLOHhweE5OMERkZ3hS?=
 =?utf-8?B?ZEFvMnFVZGwzcExxNWI2aXZFRnFKZExoMVJLZVN3ZGg2V0R5bEZQNlVqYVZE?=
 =?utf-8?B?amtWaHRvV2dZcFhlN2ZtZUkrL0pkNnBpZzlHZWxWdlZiSE1kZUFuclRLaGkv?=
 =?utf-8?B?YlVKZkpocnhPdzYrYU9sZlA3T01CUmgxUWN2WW5xN2gzZzJYWEpHSjFDZmRF?=
 =?utf-8?B?dVlTU0FycDh2VjU4ZVpRbDBUS3Z2Q3c0djZSUjc0Qy9qTzUxT2t5dEpOVXdE?=
 =?utf-8?B?WWQ2T3pzdFlBSTJSMngyRDUySUwrNG1PYUo5WWNvbEhWSWVOVmE4WHRvakV1?=
 =?utf-8?B?em5ralo3b214VnkzSHcyNWRQZE8rUFcwbG1uZzkrc0U4eUZIaUo5WW5PKy9t?=
 =?utf-8?B?K2RXbnhyNDNRQVh0bUJMdHF6VEFjdWE1a2JZL1dhNmlLazExd3RpdFVvUDYv?=
 =?utf-8?B?U0pmb1YrRXFOekY1M3R3T3pobTJsSjBtNnFBOS84WStreHF2Y3JlRFBoRlBn?=
 =?utf-8?B?OTBmQTBKd2dKOVFYWXo1U1VMNlBWV05yakR6TVN1dXJNYSt1QWpIbGhpUnRy?=
 =?utf-8?B?OU1NcndTZUZrTmtLZWlXYWlUQVdNOUs5MURXMWZUMDE5akF6MENCUUpJMmg4?=
 =?utf-8?B?MFdZUlJpQkNIWjlFc0FYdHFzcnR2YzZXM2NvN0xDV1FrdzJlazZndDYvRWRs?=
 =?utf-8?Q?RouXd+KSLU9WDbGNBrB6Id/4/+LZ8OPzP/abi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668f2672-b49f-4df9-de37-08df307dc370
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:48:01.8688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xfo+cdOLbckJZTxU4I8tny6kyxunYNoNHeLcfXYgyHEVBEFwNhFJ0RIWclXfBIrnY/DD/SL0p5oL2a21/9cd1QbVGW3zmVS9vDh4GOOL0LyIHUubjvWlX1gLw+mq65E0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB431110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_134807_036737_14AC6126 
X-CRM114-Status: UNSURE (   9.81  )
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


On Fri, 16 Oct 2026 10:40:09 +0200, Stefano Radaelli wrote:
> This series describes the digital microphone connection to the WM8904
> codec on the Variscite DART-MX8M-MINI and VAR-SOM-MX8M-MINI platforms.
>
> Configure IN1L as DMICDAT1 on both platforms to enable the digital
> microphone capture path.
>
> Stefano Radaelli (2):
>   arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC input
>   arm64: dts: imx8mm-var-som: Enable WM8904 DMIC input
>
> [...]

Applied to imx/dt64-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/2] arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC input
      commit: 98bb62f6426fe83d1d9ad1b0a8a689d2babfbcee
[2/2] arm64: dts: imx8mm-var-som: Enable WM8904 DMIC input
      commit: 5391f84729fb68a5b0e3180e4fbf9d64282fd036

Best regards,
--
Frank Li <Frank.Li@nxp.com>

