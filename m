Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F68606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=curHb6KW;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=C734oRTY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1CVhvj5IbUTw0SYzSbv9o3ZvdCPb8bD9rIcriVhuels=; b=curHb6KW74Q4RzXXOkUp00wWIu
	XY6PjKE2mg2aSwfsfdKRmm066qHSWiG+jCXMM7VxWzmv822Zv1ZlPgJ8TJ0wY50gClru38+Wdd/Eh
	KvaXrMCuWTF1l7IMzJKqSb2xSdtNh+kounEbGGmpAuLMVsfuXAA37GOXEvvG8dNHeeN5hakShVl/n
	iR8QlNJopudtoJ+VSYdXcTVRTI3sGAN5uZZiC3hczXPjWdLXCnjAI9KiF4ZVhUA7beLR3q8CYVWHx
	84vCAVOgateD5cNUhMagVyXreORVNHlq2VqxHVEoEwkD0e/VhCQOt4PDxl4tHNXrQgKma5SHUEvBy
	4oFNPvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKG9N-0000000GVOL-2gRP;
	Fri, 23 Oct 2026 14:21:43 +0000
Received: from mail-francesouthazon11011067.outbound.protection.outlook.com ([40.107.130.67] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKG9K-0000000GVN3-1gUZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 14:21:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mk7kqN1oyN7FbL/HOqBjAtMBCg7hLqTwzQD0WQVIGbN4SCNHoglcIAdut34xb84bQ6FgkAGCIESS3LvZYGjFeLBD9JgRfsH7y1dGJAqJfJ/k10xHCRxfL5a76PbwEXtwYDAVXkuYjFUilrzGDx2vucFzinZX1TfNLAOi//IQi/Uq8LlD0oi3sxlvjAl51Ffk24QflfefdJZmE9q5XxQiNRI0xMfjzXOxZkBbNZ1SuSVXt/L1pYjKRnTYbpzXYLNPzCSrU4VLx7eznJsgeYfJXZbi0+Z4Ujf/ukRkqnihFqXfZ6bwKFej1w4XXefLdiaJIAbwacC9RrBFiiH1WsQcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CVhvj5IbUTw0SYzSbv9o3ZvdCPb8bD9rIcriVhuels=;
 b=tFKxL/nykdbl9QNGg/tcsJmz8xI24i0vJE8MjQbADf8CDgfEqPbhOYsZedSt3P9DSTCjtQtSMvFEPDG9OWNDzjmuFMs0rVOiBwq/hpLe7QDtG2YH5tH6poVkvxkqlrKN9v2CuHLt5iAtfv7aPeg/fMk7t+phYroHAxaabrE3FvDueitl6ETY5JI4dPNZcZ6Q3drIyBMcNhdh49pcok4obJ2U/b7OQQqkmbHw04gg8GWWL2dsf7kFIofLyNPWrAKpyxPEPXRCaNUXK1gReSgHvkQwazF3BpmXb+NwedMXpJEyrmMePcttQEwVkgbdMCHsrAnMnyZkmDopabElNSwFPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CVhvj5IbUTw0SYzSbv9o3ZvdCPb8bD9rIcriVhuels=;
 b=C734oRTYQDA2ItgkGWXWBHFegYHt0cLwTnDo2lmlgvkjzlC7VcgHQGrktO+Z1tOlPPlox8hAzzwcBii08KR5caVa5M9FPwg0dfkPt66FsumSPTcZgvWQWHw1BhVA63NzBCuS+ElYmtm+AisvjFfxMnec9J2h69KWNXrAgInhxlGfFrPxgSdL7tRAyjgzkxmn3zOs/EQ0/zVN8wh3Ajg+kwh6m4z0oWh4dj3jxCwleEFptRWegwoBe3GjgYQN8lu9myuewZHnzcRIZaZa+HLWjZE8TDkY4zbyVFmW5XcNE/++7uICQoJV62QuEhhf3unbMH56hC5GqoNx5LDFnW09rg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DU4PR04MB10861.eurprd04.prod.outlook.com (2603:10a6:10:592::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 14:21:31 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 14:21:31 +0000
Message-ID: <78c875a1-f90e-4ab3-bb31-f059845ba5fa@oss.nxp.com>
Date: Fri, 23 Oct 2026 17:25:15 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-aquila: mark +V1.2_DP as
 boot-on
To: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261023102408.119509-1-francesco@dolcini.it>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261023102408.119509-1-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0309.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::6) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DU4PR04MB10861:EE_
X-MS-Office365-Filtering-Correlation-Id: b7bc1af1-a2ae-4148-1cb2-08df3110ef0c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|366016|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: gclQO5zyiLeC/Q3NJx4C6DBVMqKbnUnckoGk2xDUfKdMAJRdsCuTlTb3CJeqO+kL/DETfIII42P5svs0eZqolr6XLIRA8BClUJHE70LRQcWBQVTuDryRrIdbKrC8sZhpJxkPjjTiJAXv+ylWFQOHC+Ayqp5U1FDGG5tmJ18Ri4Fq+HIsi+vDoF8Cz8CL2fvnaHxJC8Z2cELqiZQr4/FZsCGlvDWESikOaONHmwPdRWooO+c4/5mR3XxHI8hDJIN9CG0P2FC9ocy0TKPtJXPqj/ka1pu2KoXSxaN6kbNeRg9cgho/SITRY2KKpWWP7qGbzAAF+zhzmuniZJlLZ3nwbBWhhTbbSZbFNaUU/6bw2vqbcm5+AEoEF7DCYcC8ygA0L/wzTstGgdtnCRp6AIAUEVQ+sn6GfohUdwYfGjyHADhdHSUDP0fuHd+K6Q3bYbdQg2yMl5juZgFkorTt94hbB4jyiYFnLyd2gr+UmDXOHqJULhvkI0nLFYkTYoqXEUCFN2jpP9e/UqNisiTDvCGnRdF0Ve31uv+XJjN3Fh5d3M1/U1rOgKBT6OyFReaGneyU4xXZgWqRQ0t6F6WmxvLHRWfPpdItb/ElX9ovM1d3Ig99x1CCqpZbV2xZrxIVQRlz3VpBILuywyScKixyt8rOLvtbEtWxkEWb7ysj7LXzr48=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REtkelhIR09QWU1RWUE4OEk1SFdCcXljWmJDZEZpbDNkQUpqUlorVzRNYXNC?=
 =?utf-8?B?S0l3eUJtQVc0Vi82cVpCY0x1OURDZktBZDN5ZXV2ckxKZ2NwaFFsbFlvZ3Vp?=
 =?utf-8?B?YXR1RUo1cDFQUzFyMmoySVBSK2piR3MzbVVpaDhGV1IxNmpPV1lGUTV3TFFK?=
 =?utf-8?B?TExaTTgxQTA2S3A0VlZPeDY2a0k2cklZWlNmUUlEQ1FlbFZVb29IUkhQN2lG?=
 =?utf-8?B?VG53ZERSUi9PeldSYU5YZTFKcTBSTldCd0ZuOCtFdVpLQ01hNE5zQXFuL2dJ?=
 =?utf-8?B?R2JSZjhkTFBLb05oTUlrWFpWWXV3S2VjVVQxTkk5M3JqMWl2elNRSzZuYUF1?=
 =?utf-8?B?cTlrRldNaG9zV0gvcytJVDdINmIrc1NKSUJsZ0NLNGZQNmVrTW1NZ1dhbkN2?=
 =?utf-8?B?STZOVnlHKzNtRUl5NEMzNVpIRmJwS0VhRElwMmd2L2hXMGhVazNzbEtYUEE1?=
 =?utf-8?B?WnE5MXNZL2hJMTJPMXBVak9HcWFCd3ZDZFpmcjFEM3lNbnh1WjFBSi92VjBk?=
 =?utf-8?B?UlJ0T3BNT0h4Y25qUlZWbVczTlEzZmlDSTh6d2swRWxNcWhXVE5Mbi8yczI2?=
 =?utf-8?B?RE84UU4yTDR1aVk2Qmhkc0lpVnNpZE1xbXdBMmowcDYwSHc0WWdtbHEzR1lJ?=
 =?utf-8?B?aG1MUDRvSHlEV0NJKzI2ZjlORlptcFV6Q1VNNnlGQ0cyTGFuOXc5aFIxcTBt?=
 =?utf-8?B?anUzN2RjeXRzMXhkRXRUUkE0RnpFZjlsZG5CV2pqVkxuUW5NRVdKMDdWNVlu?=
 =?utf-8?B?QUVjS3Z2OEtnRllXVmV4aWhrb2FnK0drem5QMVJlbVJUeG9NdWFPSGZ6RWZ4?=
 =?utf-8?B?RGpScGlsMjFCaUFhVXVqcUU0cTg2aFBHN2p0OFcyelJObzhRRnpWQVZKTXlo?=
 =?utf-8?B?S0Jpd3JSak5zWlJPb00yWXVyckltNU1pNUtXU0t3Q1dVbHVQTkhPcHI5QnQv?=
 =?utf-8?B?aUZtNE16VXAxTDBtT1ZqTGQ3Q0ViMzZnSWw2elh0L3RaTXdBYWFTcjFrbEFV?=
 =?utf-8?B?d3IzYyswWmVkQ0ErcXRXTGx4WnNvVEJtNFhia3FTZG9XUWtIcEJtMWpYY0hr?=
 =?utf-8?B?c3RuTGdYd0lnNmQwU083cXRYUFFSZmRONkpBeEQvM3NTL1BLd0FpUTM4d0t4?=
 =?utf-8?B?bm5vZDJpTUpmd3hHaUZxWFBiTEViZHNPL3BXUmtpZ1JmTHh5NUJoa3VzcXRh?=
 =?utf-8?B?cGZiZjFWUkRIZlIwbXZCeW00YTltSERqbzNCZWVFTDN3ZU9WOUFIMEJ3ZEQ4?=
 =?utf-8?B?a3o4U2k2UDVaR1gwUzNVYWpjNWpUMmJRVGU2UVRwZUFTNVUxbUNINDJseEIw?=
 =?utf-8?B?bHRsWnBGZE9lMklSQjdNR25LRmQ3SWlHV2pJL0krK2ZDK2lvTHpPSVhLWm1I?=
 =?utf-8?B?aEp1VmJpTWJJR3l1OGhsQW42bk9QRXh2U1M4S0RRVG9nVHRCZjgwZVYvK1Bn?=
 =?utf-8?B?UHRaWW1TWSt1bGZkYkpqbkRLa0dvU1ByNVlZVnpFVVhvVWJacW82K28xMkEv?=
 =?utf-8?B?MGZwZGhHMHF0TDd1SnlEL1B5NHhKUTVNSmtIWFRrcGI5S2I0cm10RHArWFNu?=
 =?utf-8?B?a2lTOG1ncXZSalN1eFNxVnZkVDQ0a2RJSWZFVEJiZkVBYXBMb2JhWUhDVVlm?=
 =?utf-8?B?ZnhKaXpOZU5ieXJ0WWhGcldER0FIQXYxcHU3aXBXNHBraTBNRU1yVnJhSkxK?=
 =?utf-8?B?UjU3QjlCQklqVWpGNFhQOTlNOFk3T3dhdW1IQ0pKTmVGaDlsZjY0Vi85UFE1?=
 =?utf-8?B?TFFBdTJvSThzMHovY2E0S1VBT1p2QU1aa29na2JRYXZUYlZBRWVPQm0wRGta?=
 =?utf-8?B?TXE0QlAvK09sQkppWWdYWFlVZ004OVZ1NE1OeFhRbkc1QzVIenVlS1pZUDdR?=
 =?utf-8?B?cHhlWnkrOFZEQy9odU9UOWtGaEhhZDUxQ1cxU0FvVUhTL3YzSXZNSno1UUNi?=
 =?utf-8?B?T3cvcUZmMlJJdFJVYXdQQ08rT2NoK0Q0Y3lQYlVZNTJydnpRODlmTktienY0?=
 =?utf-8?B?RU4rWlBWblVFNnUvTW1hc25uOWY1a0gyaFhqYlRQOFc3bzNzbG03OFdBOER0?=
 =?utf-8?B?eTBWWENVZUNOOUo0K0JVRnFGSk8xdElLbDhjL1ZJKzNkWmRhcDZ5US9XZExS?=
 =?utf-8?B?NWVBQmxzdjAxa0RvODcrMG9ueGhVd21YQ2V6V214MXBkcmZYWDYzUERseXMx?=
 =?utf-8?B?RjQ4eVlGOUVoM1Y3Vis5QmxOSVppSGNhQ1RjWlBoRU51ZlFOL01tK2Z6dTRD?=
 =?utf-8?B?YWJsNFMyRTRKTDZkOFhMdDBydEJzSDQrWGpoOTk3ak50UlFiZkFaaUJDdU16?=
 =?utf-8?B?ckRXZjA1dFBGV0lFcGRMeWNKaENTclp0YmRrT3IyUDFrekZFS1pjZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7bc1af1-a2ae-4148-1cb2-08df3110ef0c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 14:21:31.1582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoRV+D6Evv/Ardt9AD9l79zuksC1SwSWrBYWFssO5QtHuFTs4//rMDrVMd3WHWsy/m35k6eA3f7JhB1JKFoQTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10861
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_072138_455560_1F1A5E29 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/23/26 13:24, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Mark the +V1.2_DP regulator as boot-on, matching the hardware: the
> CTRL_DP_BRIDGE_EN enable line of this supply of the SN65DSI86 DSI-to-DP
> bridge is pulled up on the module, so the supply is on by default,
> before any software runs.
> 
> Without it the regulator is briefly switched off and on again during
> the board start-up, potentially disrupting I2C transactions on the bus
> where the SN65DSI86 is connected.
> 
> Fixes: d5c082ba23db ("arm64: dts: freescale: add Aquila iMX95 support")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

LGTM,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

