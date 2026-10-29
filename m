Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A189606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 07:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qj7ugmn7;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WyLpAca+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bp+PgnmBgr8mqZeZPiKndy2OczI5+DhnGg1TeO+B14c=; b=qj7ugmn7q2xSWSbIU/a+oKvDAr
	Bw8U6LjRmRfcQ0x375KcJDm3+tybjgzosi8bWyEBjWb2gaa15WjLHZpu105RMo+OROOL5xtEsJUzY
	vj+rDLPhG+qPkSTGUsbmBRpLBZRbbuPm9fR/BXy1tgN5zOm6KUVE+hIcEHtqHJMsbZztJHhx+ySd2
	MXpAEJqznEWzcC4x4xLI/FGCRnDxg3+5X4mK5y5wlr87BKEOr6KcawWBf2xdWKtC+hmvnbNCAMMzz
	V2+xiQ1WETOU8XQ/TxUoVLnOiaB4bPhh1KYBluJvOKlWSX9PalZNVptiWGNyHP8VqXYDs5DaOG+oC
	Fm+TW/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKbp-00000008Xtn-0Hqj;
	Thu, 29 Oct 2026 07:31:38 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKbY-00000008XmY-1nEh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 07:31:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5aWQz7gXGzZjo9mFTyfK/krLgRLHyIk65F/xqLNoWKSGFfFG7cBnk/T5nudXTU0sR7l+8nnQmev1Jzvd2dLb+uO47+ZYHJ8TmzAeZY80TESKmOY2eicbilwqoBlIRfqyNMzhAnt5XtTe6x8T/U+zZC8MTeUW/7w4iJcHU8L7rZhZ3Ml5S78a21bYnZi5QZKbnhPoGed1mdbAOgqlpPsowhdrLqWIzbIr7aomsYhecGe9PslG2EaZqtKr50SUx5NLcVeQ2JRw030igbw30nYOIXox2ydS0Ap9Xadg4KYT4xxsMVDSCqn9ZqHS3uVW15Aj+AvceS5SFXYLcCGEvJtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bp+PgnmBgr8mqZeZPiKndy2OczI5+DhnGg1TeO+B14c=;
 b=Gh6Agf8O+8LL64ZJBtCc2dUsp/0+36kO+lnL0eYJHJKhTdI96No0DMb0WtY9s6kN13oZey1V4v9bGITlswuCCJx8WRttVcIbhNQfe486oLEY4+wmrxa40glZQsYnAJ2JppTR4nvknVd7F7qjEpe821rhm7iFdLdx7CgYMdLrxNV9eI0Irg4ViAzwQqYOGAGLAe64Aw5p3tgGc/cInr9VTQFAe5hcOCMVdEretxfz075cECe3Phox4AyDSQfIk2clyrChBP9aj1XxY+ERikqk1JBr59v3vBNIlavOr3ZDYa4XANzq1JVgC9LFzHiRvV3E5dViJ2hcQSiZ0MnioEgLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bp+PgnmBgr8mqZeZPiKndy2OczI5+DhnGg1TeO+B14c=;
 b=WyLpAca+CHDDqfamdYiuC0bD15IHog/GtKGeq6o34xJhE0tsEH/GnF3VQADey1KBfK3+DVbLxZrT3CjGNtLgVFAC4jndap6ncKvhRL1wYU2tNtwS2GkEuojpLPH8eCZOf4f6/E93o1LByp/ygxXwfn5lcwHRVz3eyh7Bga+0fP1sTY1hYtZB5ZuKJyb9RYUwntozMQWanPJ87DGDrJI8ealcpP9ZJaBmS1TPEa24CNR0epNZKinDoMrcxup4jNih4aHoCRNT3VD2utXCbOEd9o5AZvY4Cvg/YKZbX1In2GwbVKDfAQGtKlmwIv1FlblmtlTt68xZj/ZH0kIhWLsqZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AMBPR04MB639722.eurprd04.prod.outlook.com (2603:10a6:20b:789::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 07:31:16 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 07:31:16 +0000
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
Subject: [PATCH 3/4] arm64: dts: imx8ulp: add HiFi4 DSP node
Date: Thu, 29 Oct 2026 15:32:56 +0800
Message-Id: <20261029073257.84594-4-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI3PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:295::8) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AMBPR04MB639722:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd91367-06a6-4c61-e570-08df358e9e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|7416014|22082099003|18002099003|921020|56012099006|11063799006|261028144727099003|10067099003|261022075727099003|261022105027099003|261021121427099003|261009223027099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 7qF0XdUDxEmxTQ3BqaNk/H4qbyrAPsFxf+BDvc7tc8sH/xjvYEgQcTdYZcuE0niHsPNulsmliH7v2LPp8sHpo/w6XWTRi1tppBLuI7AxlkDVvSZ5/qPw8QRrWPJ8DiYbct/JV4opz7imKMZZBHlj5JVGXyBcXLEojm5LvO1YLXn3L9oJ3oOnZCX4QR64/i3SbQc97GT4r7gniys587brL/TN+7jMxs24h6j/C92am42IffhL8qEK3K8Gl5Mw49ezM/xYbPOOK1A5wnt5yrAwPvXtFX1IKJMM+RZqn35cVmhYc7hIr+6Voz/O7bMnNp3Aph1uLggi2nFmw6tyDo1Ess325M9AceN0U4I1D1hHsq74QAi0pCAphWrCXQebtRs0R+muaD7qqx0I1uzZzLiPB8EEMGBuCkQZHfqAGOD82K2xvazNU2O+bm23A1cuTsxi7TgAiZl0qDz6FvNehkNB/G2cd2UNZJnsDTdyWrjf70jzQnCnRXaj1zY/aZjCk6nBaYK8dJmuSIE7zhqPfYT4Ml2spFvbBpvMs0PIdPi+GKLtYCfZYIjtm9YSNOS5COsu25Aqx/sCgIeehTllBtOVx96QnEfwnkyTsvDUZ6lVCrhU6SOWY/e46ZdhopO5RsejZl4oBXmoOQVSzU+S+ydkxz+U1G6sinSPRZ5gco429Hf4s9akFJSfK4+pz53p6zwR27I5l9Yau/WDUMe4t18WVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(7416014)(22082099003)(18002099003)(921020)(56012099006)(11063799006)(261028144727099003)(10067099003)(261022075727099003)(261022105027099003)(261021121427099003)(261009223027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UndjYTlNeUduaWl2RElKNWJhOHh5VFBkeGhhNUs0UDRnMUE1WjdrM2p6K1Zt?=
 =?utf-8?B?KzJjQ0QyTSt2cG9iRkhoQmZ0aUNRTDNvWmtnQVNNWHpTN0tobjRwQWxoUzVh?=
 =?utf-8?B?V2UyQkVYVElvSEVIU2Z2NUkyQysveE96NURuVHBwWW5JZW5MKzdaMHlMclRM?=
 =?utf-8?B?dkxMMHNyVnNuUGVaZWdON0RQaHQ4ODV3cTRKRVhLZmdPSFpOUkE5eERDYXEv?=
 =?utf-8?B?ZlcrTnh3V2lBQ3dadktYUGVsdWU2RU01RHZERnVydm9uWmVRbDF1NmpnVWJw?=
 =?utf-8?B?eWxWR0wwd1NpQ3NCK2JyalY1L1ZTS3FLSXlONGY3RWZpSVZodDVkems1aThk?=
 =?utf-8?B?RXZaUjdvU0RMZ2pOcGxMVEtJWlFsWm9kdWZJeTRGaGVqbEtLcUYvRHRudmRG?=
 =?utf-8?B?N205Q0V4QmdYbjBBL2JKY3I3WnRjRFRhRDF1dHdPTDZ3anN1c3IvWjBVK0ly?=
 =?utf-8?B?SklKTXkrOTMwMjNsU25OeFROSUFaKzNZU0NLSnlGa2ZQcThNQmI4WUJONXFB?=
 =?utf-8?B?VjZpMm9XQldnQnA1M0tzL090RUxJYlhZbFJudmt6ZVN3UGN5aDZQamROUUE2?=
 =?utf-8?B?elgvTDRubFJGb3Y1OE50MkU0ZzZHTDM4M1I5OUp5YVNIbEo1c1ZzemhYVGp5?=
 =?utf-8?B?R2RKSS9KUWtLQ1NDVHpPR0JjL1ltNVFIdU5LbEpTWm10OWdqMXV3WnppSFhW?=
 =?utf-8?B?SDRaWjFhUVJUSmtpSjRnL2VkWlRVanQwWmpxU2g2OVI0QkZ2V0dTRHlCbXVr?=
 =?utf-8?B?VUx3NUdJZkxROE0zQWtSeUE3Q1N0L1JMT3pkZkNXVW1Mc1I3dkNpdXhrSUN6?=
 =?utf-8?B?WEM0U1VqY2ZlUHJnaGpYN090RUwxSUMrQzlZUWtxNGhKVTgxNG03dkJXa05a?=
 =?utf-8?B?MDJjWXg0RTUrTW5ZNTJKVlRPS3FUUXFwczhIQTVMRlk3SEx4R0tFSmpBeGxi?=
 =?utf-8?B?Q2NzMnpXaFo3RWpIMFUxRWhDVDI0VWc4aUxHOGthOTlHbXgrTCtjUVpGMS81?=
 =?utf-8?B?YUZ5SXdDZGdtRzlLWmUrWTJlLzlaSEVGMU9pUU10YkNzU3pJSVZuVDZNaWpm?=
 =?utf-8?B?bVpNVGRiZzdxaEVTV1hKOTNoamp0clZaU1FpUmNGbUJ3YTdGbGVlbE1kaU5K?=
 =?utf-8?B?WlZFMzRBSWtLSkdubXZ0OXBQYUppcCs4dEp3UVdPS3FvMXhnUjlEcGNiaENX?=
 =?utf-8?B?THlFMEx0OFJNVmhoeEdRREp3dHpiNmhNV1R6T3dZK2w5NldJRHhCdEZVYzhB?=
 =?utf-8?B?SlVSaDBDcjRwZ1FwbHZUbG1mYXRVYXgraC9OdGRFOTZyNVA3OHRDRmp0WmlJ?=
 =?utf-8?B?bVlzL0hkb011RUVKcEY2cHRzTmxMYVE0dElNMG1WSTdlY3pwV3gyTXFvSFhz?=
 =?utf-8?B?a1E5dGdPT3QvOG9WMlNKYmlHRTBJazhaNHVFZGIxMWl1bmFjei9oRGJhQmxH?=
 =?utf-8?B?TUpNUnFLRVQxRHRIdXJ2MnRyeTRnQ241akE4ZldZSnlKdk52Zkp2RDB4SEdO?=
 =?utf-8?B?M3FXck1IR3FnTXpnajF0cEZrMTYxQnZDN1h6NXlXbWtwcXB3Qmt3K3JhYnBu?=
 =?utf-8?B?SE9nL3VKM0gvM2RjRHh1eVhmYzNLUGw4Tjc0NEFtbW9nczRTUjhYK3lhaUQ4?=
 =?utf-8?B?M2VJM3NiMmdXTUtWbGFtS21yOGdnbzV0NTRmZkRLZW9uRkdoOE14aUpKb2lz?=
 =?utf-8?B?cFRGbjdIcnV0dWJoVC9YdE5LMDdsTk4xQmM0S1RmUkhMaDVYRi9CVDhVcWFU?=
 =?utf-8?B?WWl0cVNnNlhsVVVzOG1UMGk1UmZEMVVGTmpkVFVjcCt2bDZiY2FCSFVpTkZT?=
 =?utf-8?B?Y28xOFJKcVRYanNzNE9ibnIzZC9SZjgrRnRqVmpsbVpoOFFPQWJqY3NNV3A2?=
 =?utf-8?B?K05ER3F5bDI3SnVJaTFzU3kxWEJDU1FJUFZTVmlJVXVham9LWFI1UWlqbSsw?=
 =?utf-8?B?QUdjWHRheUUzT3FSa2JhTjRMZjRsUm1vbWMrQnBmaWZrOXhFRXBBS3R2dnRM?=
 =?utf-8?B?MnJNOUhsZ0Nia3d0VGlpZDhGV3FXMC9ETFo1TGl3MThxcmZTam1RRTQ5Y2U4?=
 =?utf-8?B?djVHQnFtZmJGN3czdThLVFhGcVRnRUltOHJIYW5yN2h3ZjBYOGVaTlVQdDdO?=
 =?utf-8?B?R3pXN1F2V2M3Q05Cb2hROFl0bzh2UEVpY0lETThvTFJUeDQyazVnREx0RjY2?=
 =?utf-8?B?N2VSV1J0eTVYNFQ2S1lsSnViZHZOOGJZRnNPMDZCQXZ1YlZPMnQrWlBTSWJ4?=
 =?utf-8?B?dWxsUTdaKzRld01aT1l5S20weDBYTkM4RndWNkRad29JU0Q4YlU2VkVFS012?=
 =?utf-8?B?ZkpvNnVOcTRBVmZ1dWJ3TGZscEZ5aDVMaVk3aWswWmNPYnpyWUExbHQ3UXlw?=
 =?utf-8?Q?oRmrQt+XxyvpjTmWjfiU51uL6InuqiVawzpFw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd91367-06a6-4c61-e570-08df358e9e1a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 07:31:16.5621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /y5N0cZzrHazQ65hEOE/pCQCcV+G9mR+713yFYWfyULaVRGeF81c9LYPlP+4r2Yp3fZG2Tn6pWZ7n/JF4xCryxtn9imO9klXtzREomh8Mu9++st/vzT9QOYPWGZHnXFt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB639722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_003120_474283_854EE74E 
X-CRM114-Status: GOOD (  11.68  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Add a HiFi4 DSP node to the i.MX8ULP device tree. The node is
introduced with all required registers, clocks, clock-names,
firmware reference and mailbox connections, but its status is set
to “disabled”. This prepares the SoC for HiFi4 DSP support while
leaving the node inactive until a platform explicitly enables it.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index ac8293f81c6b..fd2c6b9d3c87 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
+#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8ulp-pinfunc.h"
@@ -208,6 +209,28 @@ soc: soc@0 {
 		ranges = <0x0 0x0 0x0 0x40000000>,
 			 <0x60000000 0x0 0x60000000 0x1000000>;
 
+		dsp: dsp@21170000 {
+			compatible = "fsl,imx8ulp-hifi4";
+			reg = <0x21170000 0x20000>;
+			clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+				 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>,
+				 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+				 <&cgc1 IMX8ULP_CLK_DUMMY>,
+				 <&pcc5 IMX8ULP_CLK_MU3_B>;
+			clock-names = "ipg", "ocram", "core", "debug", "mu";
+			firmware-name = "imx/dsp/hifi4.bin";
+			mboxes = <&mu3 0 0>,
+				 <&mu3 1 0>,
+				 <&mu3 3 0>;
+			mbox-names = "tx", "rx", "rxdb";
+			power-domains = <&scmi_devpd IMX8ULP_PD_HIFI4>;
+			resets = <&sim_lpav IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL>,
+				 <&sim_lpav IMX8ULP_SIM_LPAV_HIFI4_DSP_RST>,
+				 <&sim_lpav IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST>;
+			reset-names = "runstall", "softreset", "dbgreset";
+			status = "disabled";
+		};
+
 		s4muap: mailbox@27020000 {
 			compatible = "fsl,imx8ulp-mu-s4";
 			reg = <0x27020000 0x10000>;
-- 
2.34.1


