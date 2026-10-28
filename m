Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01441606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jg3ZggT1;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=u2CmHBRu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xIMOj3PE+ik6HlsZLnXdORefTEApKPYoc8YZAxtxc7E=; b=jg3ZggT1Lm7+HGcGMoP2ELVUdM
	tNpGydwFsMGUJ5wEILYNMPM8RdUXMQr5NlgZGCc4O9X36qzeIGD7G/RwYl+/YyVAYXuWh6WIBv093
	aXEkFa/WOdcjxULFlVz1hKd7aI7fxTVMf9xdLJmnxXaqHsdtcifuz1vhFeWz6sk5GQu4A5sMQa23S
	ieI2o1KUn2VHrFrVPYXHKEPHSPJ6WE80o4Y1jxNBgmQt1ERk6TPmmAim2JzPELY2TELf6apGQQdGK
	2hyYcLgxX8oYGiMql79Gnk8A88sOtSGXjbqwopTlv5niTvBgNQkWbMgL8vd8HunD4paIKv0r40o9W
	kNj31IYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2zW-00000006yLO-3Dlm;
	Wed, 28 Oct 2026 12:42:54 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2zT-00000006yKs-39sQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 12:42:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJCcYV5T3ss+K76Lb1JeEvQH+WfTfQj71YiDFUuCR3KZwnLW3skCfIUkay51ebFCzXtIfhI4OiPczC0gHdfsGfH+WKFpyxujJhGLM4h0mOZ2E1GEqwItXwNJUtiiFuKmaeLz9v1rfZCfkLRHqdC0lD3zqt/3eQbpxGIibZlHgkZckjF48bNBSUFp/3LPsDJjTzl8Z/mKYqT7coNxVvJSDqgr3xRlnrmAujTvC0Ljs6/jAvtvnIVaoDjcc/xelfaFlMyYK4ZpjUmwyxAdOfxAG+OPH0N0RIfQaOhxUTVvj+yv2ULtJCJMSEraA1y6sUwlYM5Aw5BldEK2//eX7/ZnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIMOj3PE+ik6HlsZLnXdORefTEApKPYoc8YZAxtxc7E=;
 b=L4mYe8C+/RS6p+lreyMzNS7SAkO7uPFJDtZ4VCUFNGUNaqtVwqOg+M9PAkFTR/CXxLtFkGO5usFjOfFGqak8qLAxhlqI1R8q5d7KktSQx8zGIjQB9aMrlfHIC+GiIVJF8bq8/iRRrHw7SarFlN4Caa+zxTZ8CuHRwSU+mJX1DnzjNhVE1vXMOWNL3LKEHTGnOiA9AqeEeiEl0hx0rxffDQ1WCn77VYmlxOZ/ixmAxjmMUfX2Pv/MbPZDe3uY0ElwaDYQVTm19MYG3C6XYuHa7+Vxjbpb3mtbiyw3sIbKuiySJw+3qPlARhH9wurYH1VFgFdbxBC6i88oS+y5T06y8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIMOj3PE+ik6HlsZLnXdORefTEApKPYoc8YZAxtxc7E=;
 b=u2CmHBRu43l/d5vjRsQlGWQmcAtTNF8J2Kx1Xuqg9OX5xDn/YPC5oKqFKhy4xj6KNAW4bjQn0+ClXtswbSA2Bztpw7rOkgFrSju5wlTvsqWXuKw/O0roUOThHZN17cQRYBdYTjvVWyQkwqH94IWoCuYWOC10j/SjcPWcvOq7RKbLJ+2a3BYzxoVAQJg26KuiA+RMeD+HrDs+rZzZGCzBWhORTPQCXa66M8aLx6mAKHaXvT7XEL7nCRlNlhPl/Q5Giq5rNlQ94iLTlmNi220XzecIaVvlT+yz2JVeQ75vk5/9h+UNvVebZrw0qLJ+dibHPn1yOCUIf3CR66ajho3CJw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM4PR18MB4144.namprd18.prod.outlook.com (2603:10b6:5:38b::8) by
 BY1PR18MB5894.namprd18.prod.outlook.com (2603:10b6:a03:4b2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.8; Wed, 28 Oct 2026 12:42:45 +0000
Received: from DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11]) by DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 12:42:45 +0000
Message-ID: <964724e6-3284-4179-a525-510fd2106c0a@axiado.com>
Date: Wed, 28 Oct 2026 13:42:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] usb: gadget: udc: crg: Add core driver and build
 integration
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krutik Shah <krutikshah@axiado.com>
References: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
 <20261020-axiado-ax3000-usb-device-controller-v3-6-3012ecfc0a93@axiado.com>
 <bafa6ad636d5e8a681494714adbd66bf8f2f7b19.camel@pengutronix.de>
Content-Language: en-GB
From: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <bafa6ad636d5e8a681494714adbd66bf8f2f7b19.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0019.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::24) To DM4PR18MB4144.namprd18.prod.outlook.com
 (2603:10b6:5:38b::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR18MB4144:EE_|BY1PR18MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: 95085675-e0c4-46f9-e62b-08df34f0f6fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|4143699003|56012099006|261022105027099003|261009223027099003|261022075727099003|261021121427099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: Xy1V+VrZBWfIBa8KubHsMmRiyXFt5DUIV1O2MbtGWIUWFWzuITqWrpuFATcqGl0sPpgQD6Qvsq8PCgHyZh3IFV5NP62Mud+wGkpdqvqTJsZatb0b2EhJFF9c9ytGerx8Ld8RiAzX+u0m9oioEW+ajdATehaiKQ0ig54K7IV/VcSFrZAlo9BSwJ0jvv+SIzu3ijc+htHdsJihS5b97uCSGzGX8j3Mz1bgcfo2HMCndVEvY2xVY/hpFmlOkP1ROvR+6I4XhLQ2Eu29K/4vfe3edK3g9sYrSjd5CzSr7BX72YGvPy9GvkbjPLvLs88d9Dpwr9Is2iZOjMblZHynvV3r7wgVQ2bTZGrOzjxSXJVoIBSiVL7xsdTZuzavA5U49YdlwsnLNpCsNh2LumXSlwEijsIcM02MXmeP2OaFwsqMd6PE6p/WX8NxHtQPZmK5vOO4ugYblX47uwfzrCqYZ7FmtQDzA+sFOrmmTxf83up7pe0PCLdRLmMJPvQCY0CPJiRilk9qmfC5AyaGEObNpNMDbtPjO9wrXsltE8VGVa098yFn0YYWGMr7Ov0c3Ut4m/+SMELq5VMAmxKdDSCZ6M5vP9gavGSBCKPrzBbw9jaU0kJPdCv84jpSBcnBJj+gREsi6B7piQHw8oOZmmHBOcbK0Fab1wOGjNPpeUEnkNG6HFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4144.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(4143699003)(56012099006)(261022105027099003)(261009223027099003)(261022075727099003)(261021121427099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmZSeDhVekdNamNTamtqdWN0dG01Sk9tVW8wUWZUY0pGdEEzSHZSUDREb2p4?=
 =?utf-8?B?dUREc0pqOXZTYnY0VWxiMXhGbk5Rb0lBWk9xa1JBWThJcFR4bC9Wc1F4S2lB?=
 =?utf-8?B?aEJLWmJzRy92Y1lJSVdsSUVHNERaOWFXRHFCcWtqallQaHlxaHRMOHNZZlcz?=
 =?utf-8?B?OGNjOEtkWVRNU3BtS2ZBU1Fad3g0cXhrd2IzbzNrQ0JNZkRIUGtFMFpqR2k5?=
 =?utf-8?B?MDUvR1RZc3hLeEdQUmwzeUhxSzJHMnA4NDBCUXlnMkQ5UTZqYUhva09QQU9Y?=
 =?utf-8?B?ZG9oU1dLc282RXJpY1B5OG5ST1BPTDNLdEs2cmUzZCtocWZzUzEzUXk4YTRo?=
 =?utf-8?B?WVQwNFBkZ0dsSjdORUI0cklpaHNsYWlxU0IydXJWNHZWWWV0Uzk2ME96N2d3?=
 =?utf-8?B?dUpnQXF2L1JkbVZOQjNJUnNvZGIvNFQrTmxpTnU5Z0pFcUpPSitxZm1iNS82?=
 =?utf-8?B?Q0IrOUxOczZYdFY2dWgvOUdCZzR5VVBxaU5PNlhBeEpaTnhDWm1oL0xkcEl2?=
 =?utf-8?B?bHVXdWNtNUIyRkwxVnpWNERYaUpyaHk3aU9sYy9zY1pWU1ZhWXlxaWRnU3RI?=
 =?utf-8?B?Z2doWTBZZ3J0VDZlR09YZEVYNmJtclZhYXlkcjlMWGpGd1Z3ZnUrNzhmUmd5?=
 =?utf-8?B?ZEtQMXpXcmM1ZEJDTmQ2TW1uL1FwRlRJWjhlNTNRVzFjRXkwUHVnclF6MWti?=
 =?utf-8?B?TXJiRUhTajhLV0FXUVlJc0RQNXowQXBieCswTXRyVzEvZXZDUE5hR1MrZEFH?=
 =?utf-8?B?TnNxZVJLN1ZNWEhGd1crUncrNEVmTWdIVTZFeWNYWFdvOVJBM2NydVBIUHMr?=
 =?utf-8?B?SDBKbk1RemRjQXlYSDJEdDMxZk91Rit5THFidllqWDFCOC8wY2h1VUp5VDNL?=
 =?utf-8?B?QVFoSzhVRDI1elltSUhZOUNxOW9zY2tmWlU3SlZtblRHeGVibCtNMGtIeTFO?=
 =?utf-8?B?YXF0bTJTSkNkNzV4OUdhU21acllxV2tHaXZpR3dPUTRSQ3o2ZnNhK3FtVjAz?=
 =?utf-8?B?cUpXbnc4Nmh6NGhUcXkvb2VUVitxTEJmaGhFVnVmNFVGTlBpRjQ0TGx5Tlhx?=
 =?utf-8?B?cWluVDNKMzM2WGxWVnpjMHpXbno5Z3ZObTdMSlROSUN3SE1FMU5pZDE4NnV1?=
 =?utf-8?B?bkxuZk9XOG90TWt1WThUQjJMV0doVklEUk9ua2p1dHR2SHhTZDB0N3lBbEd0?=
 =?utf-8?B?dTg0ZjVSWk1tR2trOXJlSTJqSmtFTFNrRVZKMHQ1ZWtEazIvQlZGQnJtOFN5?=
 =?utf-8?B?ZEZjV09pYy9nZ0xEUG9CSFJoNllBd3JyRWlSaFBsbC9MWUErcHVlRGxiV3Bk?=
 =?utf-8?B?UHp3QUFwNWowNTBYY2tMazNnSEFvcE43T3pXbkpjNGRlZThFd3lqNmtKQy9i?=
 =?utf-8?B?NzRzajZaUkw0N2RGWllqYUlOYzFNZFltRHVFcnpNcklBMFFBUkx6U1ZQSWVT?=
 =?utf-8?B?cWJidDhMUWFMS3lNeWJ1b1dTS0lxQXNRUUJqNjhNdmFrWEZjL0tGYWxPTEdQ?=
 =?utf-8?B?a0p1QThDOFp4TXNBTnNiNkVVQm1uWUUydnpYdzlsQWZ4MHVzKzJ0c2plUi9n?=
 =?utf-8?B?MlpGOHRxbmc0RnIwM1VTS1RLcnNVRXRNZ25Gc0toVEJIaG9tVEQ3dmVZRzhl?=
 =?utf-8?B?YmFDamRVZVcvTHBla3ozZENmQmltRGpDRGw1cHNUNm0rOUNjWFZzMk9uZVNO?=
 =?utf-8?B?aXV5aHppWGdiKzZ2ZGxnZ3hrc2pEYnJrVzJpSW1aZmE0cmIreGVrbTQyNGxs?=
 =?utf-8?B?aUQ1VkYrUFRiNjZQYXFjcFRWTy9UaWU1bnMwVk9kZ0M0b3NCOVJFZm44eXJB?=
 =?utf-8?B?NzBzL09tRXBuNkExOEgydVNSNlRlRzQyUHBEdSs5M1B3ZnAzdThxMVNjYWxK?=
 =?utf-8?B?b1M1ZkFEL2RxdUZVZTFLY1gyVFYwWk1IanFhUzFRSlpaQnhtOFdLZFJpRVpJ?=
 =?utf-8?B?YWhyRjQzbzdrckF3em95aHpZN3pST01VWCtMUk8zenJjSVRsa3BLMmZ6VHg3?=
 =?utf-8?B?L2dQZmwrSkZza2ZUTkZqaGhCVm5TU0M3ZGJhNUdBTVA2bkt3WlRGNG8xZHEr?=
 =?utf-8?B?QWJQaEkyekFJclFueEhaQ1M2dFpSVElNTnRKeWlnb2dLaG44NFI0SkFjU1RX?=
 =?utf-8?B?VlVYSkx3aDFxaVlyRGdGWWl0MUI5NzJKQ1QxUjVTN3doZjlYblJYbkg2dWx1?=
 =?utf-8?B?S0hxUW01K1ltSEl5cllvUjlNaXNFdDhFQ0p4bURjNEhxL0xwWmFmLzVhMk5I?=
 =?utf-8?B?UWdoTTIrQnIzODdvTHJCMm1UaWpOMUZnVE9aZlU4eERXM0RUSjZJNWp2dFlJ?=
 =?utf-8?B?S0dLRzNzMmtFbFc0S3dObXNTcWFhQ0RFWkpRaUhpbE1WY04yTmYzZz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95085675-e0c4-46f9-e62b-08df34f0f6fb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4144.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 12:42:45.4817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0F6gbR4GKO+TMSuQxgrOpnLtHyQrJVZgd7Ud2BuwNifd3yhM7R4ryoytm9lLuf8bUO6Ul3vk5yZ7FGjYtzLiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR18MB5894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_054251_808067_AF9F40EC 
X-CRM114-Status: GOOD (  18.83  )
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


On 10/22/2026 11:36 AM, Philipp Zabel wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
> On Di, 2026-10-20 at 00:19 -0700, Petar Stepanovic wrote:
>> This patch introduces the core probe/remove functions for the Axiado
>> AX3000/AX3005 UDC driver, and wires up the directory into the build
>> system via Kconfig and Makefile.
>>
>> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
>> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
>> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
>> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
>> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
>> ---
>>  MAINTAINERS                               |   1 +
>>  drivers/usb/gadget/udc/Kconfig            |   2 +
>>  drivers/usb/gadget/udc/Makefile           |   1 +
>>  drivers/usb/gadget/udc/crg/Kconfig        |  16 +
>>  drivers/usb/gadget/udc/crg/Makefile       |   9 +
>>  drivers/usb/gadget/udc/crg/crg-udc-core.c | 706 ++++++++++++++++++++++++++++++
>>  6 files changed, 735 insertions(+)
>>
> [...]
>> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-core.c b/drivers/usb/gadget/udc/crg/crg-udc-core.c
>> new file mode 100644
>> index 000000000000..80a4fc6a61e8
>> --- /dev/null
>> +++ b/drivers/usb/gadget/udc/crg/crg-udc-core.c
>> @@ -0,0 +1,706 @@
> [...]
>> +static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
>> +{
>> +     struct device *dev = crg_udc->dev;
>> +     int ret;
>> +
>> +     crg_udc->clk = devm_clk_get_optional(dev, NULL);
>> +     if (IS_ERR(crg_udc->clk))
>> +             return dev_err_probe(dev, PTR_ERR(crg_udc->clk),
>> +                                  "failed to get clock\n");
>> +
>> +     ret = clk_prepare_enable(crg_udc->clk);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "failed to enable clock\n");
>> +
>> +     ret = devm_add_action_or_reset(dev, crg_udc_clk_disable, crg_udc->clk);
>> +     if (ret)
>> +             return ret;
>> +
>> +     crg_udc->rst =
>> +             devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> Why is this stored in struct crg_gadget_dev? It's not used anywhere
> that I can see. The struct reset_control could be a local variable.
>
Agreed. The reset control is not used after initialization, so I'll make it a local variable and remove it from |struct crg_gadget_dev|in the next revision.

Best Regards,
Petar


