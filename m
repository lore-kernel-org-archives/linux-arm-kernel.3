Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B86D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 02:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X7ObP9rK;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uK+F9AnX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TAn7+Wk2M3UlzBXkuosoEWax/i3Bsgr0BRsGxMt6+MA=; b=X7ObP9rKMnTFdQx+n1CisUOPko
	WaCRdG6wWXCYkN6SC7cPPU5dQX06+5RpkPP89c0nC/Zp2DRNp3+sVklEDAIXjUs/1nIX9trNoURTv
	dzJ5z7+vo/n3L1VnjPZ9CQhzwg5BYRWNScubakdeCjN5kHvs+fIab8cG/by3RfB7r8fL/DUFJUPO/
	Q8Vir/U2tuL2f6ZYiqoQQW1VU2u+uTJaMGbNi2c+Q3k2CQ6cO9fkVS5KYb4wrVXNQnGTyeQInIiPh
	TUNvMgH2+SFGb05rCD61BAnd0YCh31DUOa6Dev1h9yMrvwJ7YHnYotahv7Yy8d0/53s9b+0QXMO32
	KiAE7aDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnMc-00000007auY-1neJ;
	Thu, 05 Nov 2026 02:38:06 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnMa-00000007atN-0clP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 02:38:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPaMeY6cSrIBnWP7+IqqARetOoC1McQvrxIVgAfiVjyWgV3VSUK5NZhyIzpTQsgVcIlRpUhyYzFJmjCgZdXAn3CsEfVLizyMxpHvDtpdTMmA9A0qZnTdcI3owjLy9MIdlroRviVrLcIyC9CRTHJWzjiUJJxAWQ5Z8e8nuaodsgilzRpj7lvdQ7xWT7ktq7QPRR/fOtw+/N/pNIOW+3YO7RXVnncU1VABcgfbIHMOa06X1hZIHUYWiZmAUlt7+XVeOxmyv0+iG5nS5EiEu6Wv1LGFfvTbtCrB+mS9L62BZAZUWELdnscEel8IA7ix/NVBu4fMt+V3jPRpVjBBprV/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAn7+Wk2M3UlzBXkuosoEWax/i3Bsgr0BRsGxMt6+MA=;
 b=tY8meiu6EpGVGpkymTmo8vHh+Wmyjjs1OPh2kFpiHMDdade4BvcjNl+p+buesGG7c7McoBw5UCIjJg3i7ChhzI9XlcaCPChwBOOoqFoOnuOMScYcxBcvYqUh11jVkupAXBBBnVkm4QZ0S/JmX/uaVB5eTBPFh9go1TancCegy3xTTdXhpcYtyGx4JIBMkyGP66rvo1MQc5RvI1Otnlx/MAOBXFkGR8JhUoALnQuH7J6Ggn4TqmkQ+fuHeGls3sTDbEEk3xaqaJs7GATfvrjgQUBDcslMST4v44LL4+dspCOGXPr0qIsf5NdYubIWp5hfmn6QtubgsmZ2X6DgH/l0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAn7+Wk2M3UlzBXkuosoEWax/i3Bsgr0BRsGxMt6+MA=;
 b=uK+F9AnXn26aStQT0qnXXRBz5Hjx6z+yq0N8Z1/WPqUHZqu2KoV8H71bAHpC0ETP3Pze63UjoU5Xz8q6Ihzmm2vF5RrmWb49otTBKmj2I800MlWezQmfwQqP3wtu4bW9fabX5EGI+0pylHys6P0OzDGg0VS2/Nut+JaC+pkKweYpKFAmVC9sylCP8qhS+14/Vk48fFeLdMtPPQNtibrw1/iSA3KCSiYQL+WsA2bXcVu9sdj/0SfBa/4iFbZs3ep6hGHQELY4G0sRJEDQOZ4kRoIA2o6iL7sMIcwr8ychTCvoIqfzz3j/wHFdUR+MRk4OjACCpPaTRpGctoXwLfu3nw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GVXPR04MB12060.eurprd04.prod.outlook.com (2603:10a6:150:2bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 02:37:56 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 02:37:55 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	daniel.baluta@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] Enable DSP device for i.MX8ULP
Date: Thu,  5 Nov 2026 10:41:02 +0800
Message-Id: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GVXPR04MB12060:EE_
X-MS-Office365-Filtering-Correlation-Id: d01dd598-2520-4719-9686-08df3ae5cbcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|7416014|6133799003|10067099003|18002099003|921020|56012099006|261021130227099003|11063799006|261022113327099003|261022115727099003|261102123227099003|261021135927099003|261021123027099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003|261021121427099003|261026130827099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: qDpRV7EOsZBY/m1dL4FjnxfXQQPJu/D8lrNB82xTIJDd5I+bpgalPbe+90scYiru7SD5pB2JHJIHKYivl1Wqv6dMV9ILVQQBPvrz3qZAfoiggvJAcfJTjeheTjFcf8HU9QeY1Al464EfTYhnf4wMwCA/e1kYvbUnNCfomMTRFMz/OLEUldLwlheGbokSU0BvWdbplmb7EI93ojBMFLA0vceWCxFp2eufD9q4cXR0GGWnUawQiwjHHr4huk0HEnKPOjcf/QHNv1IhNzXHRu0zGghXV97lDxWHEQfi3m8J0kSBK1r9SaW6ThbVhgbMYOlyU2y5djDooEk0o7N9N7P98pws8jLrVmS58AS6aEcsRsP6ydeMXhRnEMlT43Uqqv0thzeXsZMffcW1FErxMMWIFOFinxbpR2nzEVMRaitVZliX9msF+rPEwJPlYTS6gWtvEhfhQXQyIS3/OdmCDZnzfmMVPIrHPKKxFjqPGWnIdIRjIx7ljCLEv1TMLU/I2ahOTlKjDXpCSk7KXenKqNQzm0dzV6wPLyG8Wlmd0Tw1ocko+tI16/YpKykQWbyf2LNnKPvxlbWUU7PqMqVZIeLzTXqZygj+XAjGQ9R97wWAFiY/byV5zBg1eb0BcaLWC9utx1+wioJTwd4OeAHAtIvdkQRSNG7pTGRr+fSKiYX6NuTmOMFw2Uc0Ve3ZhpA0vBjLO8T02JDpwPJcoYpmU7NWNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(7416014)(6133799003)(10067099003)(18002099003)(921020)(56012099006)(261021130227099003)(11063799006)(261022113327099003)(261022115727099003)(261102123227099003)(261021135927099003)(261021123027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(261021121427099003)(261026130827099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2RneDV4YXAwcC9OcWI4ZE44Zld2UFZaQTh6dDllT0RWek9oZEdBUDFrV2FR?=
 =?utf-8?B?RlJTUjd4K2FvdlpzeUtFR1pwYnp0R1dnb210OG5HMmRRQ1JNVEZtU2l3OGYr?=
 =?utf-8?B?eGZEaGk4L3lDL05MT1YvRWQ1M3k1djNTdnovT1Q3ZlpDYUtDTWJ2TUo1QjV3?=
 =?utf-8?B?eGFMR2lRWnZLL09XTUc5TGNRTFV1Lzl5Yi9TQTFVTnpMbHBsUmFzYnFiR1hL?=
 =?utf-8?B?UUN2aTNQVlJwU0ZwWVFMVVc0clpzR0dhMzJ2c3lyOFBGbEhxN1doajY3VEto?=
 =?utf-8?B?TzdZd09IVFI0c2ZWaTAxRVdOT2lOUmhVK3NRaWszUVh0VE45RnNJaCs3V1ZZ?=
 =?utf-8?B?Ykgwc01xWHp2a1BNM255VHRqMUNPMW5lZThpeG1BWmRYRmIxNlNSZlU0bmVn?=
 =?utf-8?B?STBpc0g1UStsYmQrMkNUK3d3bGxuNGdBK045Z0tVZkNObVZzQUlWQ1VIV1Nv?=
 =?utf-8?B?elZYMWp4L0xCbHlrOEZzcnJwR1JPekNtNFVBd2tGNFdQVmtPeCs2KzZpQ0dW?=
 =?utf-8?B?TUI3b2FjQy9xSzRvZlBsUnNmOFhNd3JxM05vZ3diOEJVUzZWZEE0bVVZZkpP?=
 =?utf-8?B?NWd5K2NRZ3I1cDR2bEdDZ083d21kNUJJdHJVNy84NnBWY0ZPT3hhSGFQbTBs?=
 =?utf-8?B?OFNLR29PR2NlSzNQYXREVUhHcnQyaHphNi9kN0t6RmUwYnJhOGpQUENhaDlB?=
 =?utf-8?B?bHMxSlNlcTRYZE03RUVVdWdhc2tybXB2UStmK1lDMDZSL2pGQkJaM0NEZm1n?=
 =?utf-8?B?SVFGL3JPSU41Tm9hL3dKei9kQ1RrcmZIVWxkRWxsRjZJZUNUSTlLY2t1ME5D?=
 =?utf-8?B?R3k2dHl6Mk5EQWYrMUM0TWhCaWNJL0I5cWFzanMvSmt6NHcxc2daTUNNVHJ6?=
 =?utf-8?B?U3plRS9ob01MS3JJeFBkSm1xZ0JZcHVuOTdDVmZxTjVaa1hTWXJsbkVaUXkw?=
 =?utf-8?B?TGZ5NFZxem9MRzFBTXBjTkdxYUs3Ym95VXZ3NWtzQy92SHNNNEpQN1o3b1Vn?=
 =?utf-8?B?SmpKVTQyTGxpTUQ2b1VsOWFDR3hsT2NFRUI3KzAzS1EzK2hDWU5sWVVMTktZ?=
 =?utf-8?B?OEFqYktVTlVjbkxHWXFyYTYxaGY0bmRuZGVmNU8xQTVXZ2hnWDZiYkdjeUxo?=
 =?utf-8?B?NE10TjFFT2FXaGhUb0JiaEphVVBLdWl1V2Q2SExvMjJ3Nmd2RGdIS01BR3RB?=
 =?utf-8?B?M1BYc21EcGhOYWhhTVFYUE9lT0FrMXBzSzBKYWRiNWZ0cWU1bk9WUDZCdm1n?=
 =?utf-8?B?ZUExZk5tWUluWHBRQjN6S0IzblRzclhGZlF3Q2EzWmw2QnRXWUJZYUdIQ1Vu?=
 =?utf-8?B?NzFyRHQ4TVRHTUQ5c0xaYlgrS25rQWRtdW9sdGkrVURtRnVHRnR0S3ZCdHh0?=
 =?utf-8?B?Y0FyaUVTZnVFaEpMVTgza1FHbU9ScDR3YVVMTGw4TCtpYThzQnlNV0pBRXVi?=
 =?utf-8?B?ZlIweFNOQlhoQ3k5VlgzWnZxS0VjdGVpZWxKYTIrZDlzRnF0SlBWYnl1MU9L?=
 =?utf-8?B?Mk1paXBDQlU2WUFBRS9HWGZTVFZ0NUFUc3VZT2ZPY1RTNGZ2ajFsNFpZbVVi?=
 =?utf-8?B?Vys3MDVkMVVTZkR1UGxQeSt2SjF6V3h6TjFNRVdrRk9pV3A3dk0yMFVBWXZu?=
 =?utf-8?B?Qm5RQTVlUUphM2xDTUpEd0tWTktBZGZubUkwN05IUHJQb01KZVkvd2h2ZEJG?=
 =?utf-8?B?RTh4YnRQajBBc3p3c0NQRm9kVTJqUVFrZXo1TnRQRExnR3hzQjlJNFN5VWF5?=
 =?utf-8?B?SGpLUDdHdUtQWmNqZVljMVZ3Zm9qVU91S1NXNTlrbFB3Y2JKLzdscHNBN2M5?=
 =?utf-8?B?bEZRR1FVZnpNZkc4NmhlYWdQMVFUdXdXbjdiRTdHWXY0UlRjd0pwLzRjQ1Nq?=
 =?utf-8?B?Z01uQkJxdnhwRURQZWlxTmlkSnpFVGNJVDk0L0JUcllsVElUV1NnSXJaOW01?=
 =?utf-8?B?SCt1S1ZiTWJSUDRJZE8wekMvRHQ4RVVrN3BXSHVFOGQ1N0RSUm1LMnBtZk5k?=
 =?utf-8?B?bWtJdDc0eXNPOEZIeWd2MFBkbVFHTWxBVStXejVpU0JKbWRGWTZoUGVjb2R6?=
 =?utf-8?B?VkR2ZjNBVTd0aERON1pJcy8yazVvM0p2TnR5Qm4rQ0pobkVrYmNpWTdpTDBI?=
 =?utf-8?B?eGJjK29ZSGVoS0wrTDBsODdjc1ZGaHVkTjhObi9JRkpLQXFjc0duRWppMTBK?=
 =?utf-8?B?eUM5RnhML081bVJjL0EzeUNIWHpXTm5tRS9PUTF0NmxUazNCQS96RWxFUDdt?=
 =?utf-8?B?bTRINXpQSE9RWFMwM1NYVExxKzlDbTJaWWxxQVdXNTg3TDV5dEo0aHRHYTZv?=
 =?utf-8?B?eEYwZFl1UkpHaUtJMDE4bnpBeTQ2WiszbkxxV2lxSXVzWGgxQkw0ZWpWU1hw?=
 =?utf-8?Q?AOR/EBP1hBIP5U8KHZ9P4hhNcd+tGNs4Yz3Xe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01dd598-2520-4719-9686-08df3ae5cbcb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:37:55.7394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRf8+vNEbCc/IFm6LJhfnzDVbQcNZ2PWFPdUmxdm1ansqLS+RSTPPIoD6XuAy+3lD58CsFKkIHhmm8vge8IsmAmMgbCmePyfXCKaZjQ4+Lrma0lM4P8NsUvmm140yhyG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_183804_216607_DD81A793 
X-CRM114-Status: GOOD (  10.06  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The debug reset control is one of the HIFI4 DSP’s reset mechanisms used
by the debug interface; add documentation for the optional debug reset
controls and update the driver to use both the soft reset and debug reset
controller APIs (the soft reset is already documented).

A HiFi4 DSP node is added and the DSP device is enabled in the i.MX8ULP

Changes in v2:
- Update commit messages for all patches
- Require the reset properties for the i.MX8ULP HiFi4 DSP in patch 1/4,
  as suggested by Sashiko
- Use sim_lpav as the clock provider for the ipg, ocram, and core clocks in
  patch 3/4, as suggested by Sashiko
- Rename the reserved-memory node from dsp_reserved to memory in patch 4/4,
  as suggested by Sashiko

Shengjiu Wang (4):
  dt-bindings: dsp: fsl,dsp: document debug reset control
  remoteproc: imx_dsp_rproc: Add softreset and dbgreset handling
  arm64: dts: imx8ulp: add HiFi4 DSP node
  arm64: dts: imx8ulp-evk: Enable HiFi4 DSP

 .../devicetree/bindings/dsp/fsl,dsp.yaml      |  4 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 34 +++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 23 ++++++
 drivers/remoteproc/imx_dsp_rproc.c            | 76 +++++--------------
 4 files changed, 82 insertions(+), 55 deletions(-)

-- 
2.34.1


