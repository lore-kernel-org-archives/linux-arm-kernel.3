Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28EE606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 02:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W4zat4dF;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=irGag7Nj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uQA67+sH4BvO6Ts47KPTX89lPvBpfPDkzZDa8ZZCNJk=; b=W4zat4dFeEba2CwA+w7tciTXTV
	+RKOylpSDd+Md5g8/Myen3dtDOvlEixuK8pT0cMOK/FIILHWJ/5C6JGbcHjItxhD2Oc8qdpyg0cS9
	sfTEWWh4Jfsn8He4nJ/7XDT8+acp6vjz9YuMGVBY8YH84RjYRyC1SZh/YhfTT0VdTUNK4uYz0hdCo
	qRMM9+uGiog7dUbocdYGfvtLyRceWFKsXDJaC/vVYHfykP+OSexBoRa0GdfP2mGDCVxH9GhgPr3ZZ
	+jFfNR9UEMrNZRGglVKbLtmIHImfIJbacgENnUd0g7LDWMt3VwO0aDIvlrZ6a1QMOB2QBri61U+Iz
	mO+g1DVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOR0w-00000004CVk-363G;
	Wed, 04 Nov 2026 02:46:14 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOR0t-00000004CUs-2XMW;
	Wed, 04 Nov 2026 02:46:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+y9xJd120StU6XxSqpIcssPavna+m80jDz622eBidc2gIwNfEq+Iok4+NIvScTSgtP4oGk6utN8lXzmUGBmsDXlVHexLAfaEIueIinqhfulbIBhSzJcMDJuONtF5iKIAarDXpAPHK0wqkB82c0U2PnDdcng2m/0PZzGlExNqdi0X3mshb5lGr/NKtWEewVvQFIg49r9qnyLs8xygn977JP3wMrGqnehel/JIzxnaw6rrZidLL6ZBjTEiwL/IirxhOiTVTASMTenIt3mhUFmISx3+Q/zDIjB9AtP/2THlzlJFqPJpqPIslJEHeK0oJe9wDHDzSJaxvCJb8CSLanGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQA67+sH4BvO6Ts47KPTX89lPvBpfPDkzZDa8ZZCNJk=;
 b=u/83Pv3bc0JnlcsD1awTVNq/osX1WsbcO3YrudETwvb6iz/x039RThjEzu1eLiOyt0Zp9HP/6UOTU0TT0wv0XLZ74OGnYT66eBYePGLLexcepCLpN0+vUy22E0ljU82Jtg8HYGFe7yze3+GluObKz56kTeQ0DzcF4jeku4lfxPJGC5HSfZrYam3rgG7hWLFpaEgcuHxNchghzK9ryyRGXdyAbGFbouJmMAIGztYGCHU2nTGtNgIQqeNRkQyntjjE0mfhkBDqjf9xAX77NUQ80TePyTMHEWluAj8F4ovFuJUJ/WAMvHsviSCFh6Lfprd8gogZ1JQsk0EWiFODWEZe+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQA67+sH4BvO6Ts47KPTX89lPvBpfPDkzZDa8ZZCNJk=;
 b=irGag7NjPnIe1a9r1nY7PBe5JfVCW9AFS7T5fjF29vjx3zXEMmMXBqmUGN7KjMzoVZorqJpKu5NxAN3cqoxT4n6PFAh7Naz7HkaeljhhslzE2LhgAZvc6ISOEbwU1e7bzk+gPFZx2lL4Vp4h6H1wWtpChOY02e0to9jMjwowuyNU7UBqIDaCQ2jRlO8UKniTig2urCQqJL/QkGJxzPKRPO9RQEBhZvuLH3QOA9nfKk4ULdlpLVL2A/8m5sZIlYdgD4fXCNPhPoSvrylAXCZjVeLdxfmZbO5efXIxKSFulUNHpFdI4YD1y9bQOamo1b7MIIEVIDUyhbtCpMdLMAU/7Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
 by TY0PR03MB6882.apcprd03.prod.outlook.com (2603:1096:400:265::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 02:46:03 +0000
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40]) by TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40%3]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 02:46:03 +0000
Message-ID: <de3cf5df-01be-4594-890e-9fed517eb6aa@amlogic.com>
Date: Wed, 4 Nov 2026 10:45:59 +0800
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
 <aukERgniLcU7BHeo@lizhi-Precision-Tower-5810>
Content-Language: en-GB
In-Reply-To: <aukERgniLcU7BHeo@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JH0PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:990:4::18) To TYZPR03MB5743.apcprd03.prod.outlook.com
 (2603:1096:400:74::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5743:EE_|TY0PR03MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: b2409cab-c2b3-4e40-5fc6-08df3a1dc48d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|4143699003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261022105027099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: pbGFuOfemBu9+OipW85F1CQh8d5LfwBthnLlAPY94Gn7zp0vrp0U7srUVxaqFaOYPuosJyDy9kiANpZfknq3Xo0PvikW9lSGa+978npWiLmp8w+sIbVfKHf7P92LY9/u3jwxaO1mTYsFLtGHTxbB0Dnn/DAPfwEeelnvo4RehYftWYPa8oAvAFsCKLgUD1GB8xfjy3Sk6059jfywwZevZcYdf188qhkARphcvx2xCc1FJLbH6KYIqyL1+hw6mMqwToJT0o7aySHzSuF0soQW+KIJEMSDfedGtlVRxCjRBVrd8/er/RQ5PLzpneR8Us9HRyrDgHf686e6SpDaAP2uMs7+tsZUQBYD2mpeHwuVyL14rDu8WXnv8k3dAoJAxXyWfoot83st1rwfYiDiLitN+m4t9zgli/fOfY5FOhJcjFkS/QVhTFHpJUBRxOiEfgStbBKEr+I4WhzlPsGiTkn1EBIlH8C1C6v7MigDfCitN+87MDL56iWqhbovJDTQcZBNNgsyLYpkOZhADyEXDPFfOsArPSG6RzurTJ1Bp+lqL3Fqsjd2lziGXNwTIogI8IuKrZIdElyMAX3K7gcb2xPvyUDtoH+qRUja4rz/wDTLNiTY3LxFFM7gnr7vXMTGtn1EhTOA8AUtykiVWJC+/F5rqUTGDrpsc7IMS3wQKkKvQRI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5743.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(4143699003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261022105027099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2JFY2NFdSswQy9nUUR3blZlMEJ3TEpNamVKNDRBUHc1eC9xeW1Fbm9aaGx6?=
 =?utf-8?B?aFBlVUxQYWxDNHo3bWFFSFpVV1Yvd3NERGYxVkZ1VWtkSFI4cG8xdm1vNUdx?=
 =?utf-8?B?Z3dSdW0yVGlJWVlTTjN1MzRFZ21GUlNDMXdYSVlRRDBYU1NlM3MvM3pBZ1Yv?=
 =?utf-8?B?U3A3YjRveXVLZkJicEFvaWVQc0FqM2xoaVB1dldZSGk2RXFQYWdOTzlyaGxv?=
 =?utf-8?B?VTlvc1VBbXZxY3h0cEQ4N3JSY2gxU2NPOGphYWtaNm1jbDUrN3Y4azMzQ3lG?=
 =?utf-8?B?OU0zeWMwS1ZwYVpaTFRLb084VjBNbi93cVdsemZhVC95NlBBeHFUbFMrYmFK?=
 =?utf-8?B?VmFiZ1VFQU9FbkEzczlHTE9rVmxkbmYvQlJzR2ZMQnZ1RHRXb2xwSzN2cURW?=
 =?utf-8?B?cm9Va0lnSWJWQUNURW93RlF2NTFJbVA3U2ZITzV4TmpWVkJKTXVkQ2plbXNC?=
 =?utf-8?B?bm5JWXJ6UG42TVQ5RkFDWFRVSWRQdTc0dWpkWi84NDkxOGhrbUdrbU5jUHNZ?=
 =?utf-8?B?ZXZRQnJXc0NiMEhXcEl1WEY4SmJINURzcVZuWUlXRGhxbFdHOU14SlRiWU1T?=
 =?utf-8?B?YXE1VExCOWp3eFJJQWNqS0cwNDVabE1BaXZrVkNpdHhWbTJWd0ZaRnJQbEdS?=
 =?utf-8?B?THVkSzB2ZzFTNVFRRUFkaDNMRXptNWtXbWFocVFjY1lFTTl6YWJsVVd3ZDlm?=
 =?utf-8?B?OUVsSC9iY2lPUExNYXdSYmROWndjUkxCd1FtQjd5M0h1SWJMTFZIb3dYdHVL?=
 =?utf-8?B?dXBsYVBSYU5maUg4M05VRkRoV0JBNTVqSlJldjczTThlejhEUXNtczA0SG9E?=
 =?utf-8?B?UEY2dS9jMlAxY1BPZXVIaHVqdWYxOTg2Q2NOOVMvdW5LUU1wK1dXcmN1ck1u?=
 =?utf-8?B?QzkrSnltTG5yUDFzbjNvbkdOTVZ1TW9XNDU0RElLT05KN1NST1pOeDNONldt?=
 =?utf-8?B?RFpEWUFFRTNjYWI1RitqWS9jdWttNmk0NzJ3MmljS2x2eGNBc0pnNlpxekZ0?=
 =?utf-8?B?SFdIR2FLdTF1eE50eWt0RWxESGtheTFueG9YS05UdW4wNTNXTlEzSndjbkpK?=
 =?utf-8?B?dHNrdlJvTWZSbFh2NllneXhJWjhscVYrNnZNUytLT1ZuWnZNNmlLL2dmN09Q?=
 =?utf-8?B?enVkNjJsRHJIMkgwWU9IYllGSnJ1ODBmb0IwblRZdjJ5UVpZUjNsMEZ3U0lV?=
 =?utf-8?B?VGZXZ2tpTWd4L2NLRXdjR1hlZE5DS0JsTXZCTGVZUVpBcGFyNWp2dGZhRXJk?=
 =?utf-8?B?MnNIdDkrWnBKbVpoWTl2cDB1YmVLbHR5MkgyamticjFQRXdndXpSM2FmN1VK?=
 =?utf-8?B?TWdlUnF5OE1ycThMWmZwY0tKOTh1UDBmS3RmWHVxamdLbElNTlEzK2JHYlJk?=
 =?utf-8?B?QVZsQ2ladFZQdkg0dTdkUGNiYkZtTktiQTh0Q005eWtMYThaRmZvbGhQVG5R?=
 =?utf-8?B?L3ExSjk5ejl4WVNZVmZZaXYwVUZ6VFNYbXloNUdEcHhXUUdEUFhPUWlkUlVo?=
 =?utf-8?B?MTFXbGk3VHR3SDcvbUNUb1IrUWZ0RWYzTHJseWhUQm8zSHplakVIZGhmakd6?=
 =?utf-8?B?N1NrUEdVUUxtWUppZ3hwbkd5QkFjekRRWTBOc2RGR25sVGd2VS9QOXV6ejE3?=
 =?utf-8?B?aGNrc0l0b0dqWTFTODgremIxVGR6MTl2Z1h1QnNwU2ZpVFgyang5MUhBZDli?=
 =?utf-8?B?cjJ0RW9aR2VXQlJ6endEUHBtbGhCMmJZRE00Ym5GMzRLRmt4aVdnUUlpbXhp?=
 =?utf-8?B?dWFNK2x6dXcvSkYrQ1JhL052Ylh2MDdoTG1KT3JkSjd0VGkxN1RUQi9sQVFY?=
 =?utf-8?B?L3dza2E4RUxsUkFzUGFVMlRGUHQ1ZjhkR2NLR1kwTE5TcXpJV01FVlY2aWtz?=
 =?utf-8?B?V3RDRUd1SEx2MzYxbDA4c254cWxHVzF1S0dBZWEwd3FBWTNXd21NNU83Misx?=
 =?utf-8?B?Qis5Zy9qQ1JrVXJaajM3ZUlhSDZ0QUpRc1JVMVNuNkFJcFcvQ09LbUYyRXJ6?=
 =?utf-8?B?UEpubTdGMUt2STFxcFMrSFBDTXpoUVdHTS9FSEVGMElpUG9oWit1R21HV3Y1?=
 =?utf-8?B?VENvUjhGeEJiajNiaUQyb3RSL1F0UHRzNEpyMmRtSTBDMEhZMTFpdi9IaFF1?=
 =?utf-8?B?b1g5aC8wSmdQYk82R1lob0xCRC93YWc4dlcvNnEwQ0tWMjlrczZLSkhiOEYy?=
 =?utf-8?B?ZEU2anVucVNsU1drTWo2RnJpSXFpTEZqL3pYQW8vLzJwcHNjVkcyRUJpYXoy?=
 =?utf-8?B?d2kzanRrOVk0Qmw2NXFWa29lYnU5VXhpak1tSUNObDBtNVNRQ0Rrc0VrZ3Jz?=
 =?utf-8?B?YVVwUnZQWGxFeTcxMHpMUlN1MW42cVpkbzdubkNGTWtCbzNRcC9oZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2409cab-c2b3-4e40-5fc6-08df3a1dc48d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5743.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 02:46:03.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iecvyYZijhg3ulf/Ypes+y8ZNrfIJiLsQespQOa/qp+RHE06liVjIyzXvhWlX86/5cf0WWsZ87xL0TrRKrd9mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6882
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_184611_655572_16CEA481 
X-CRM114-Status: GOOD (  14.92  )
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

Hi Frank,

Thanks for the review.

On 03/11/2026 05:44, Frank Li wrote:
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
> 
> Nit: if respin, add empty line here.

will add a blank line.

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
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


