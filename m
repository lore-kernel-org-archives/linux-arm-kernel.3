Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DFFCC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmrvapIyNOMc21KmtuXbHJaLrEICIWq9hrvqnzYMR3o=; b=MqWVOeE9z9aK4UkQZvQ7ezTN+j
	yhDCu95/j7sudGjO2AFARDSKP/ENZt2xuk5+fDH5+DWzRY2pyS9qSGcyNUejVAH04MysI1roGkNXY
	1nRhonEWmbZ0QErPnBD6MShTnkN7oxJK6GTyFTOOcLK4TzoWKV4po+lnapW3z73wUAMC7cdwRv3oR
	qjtbxq5I2saOKNnunApm2sQ80mTsNzY66bclfumKQdsxg2735OLsk3vkjRm6rl/EcwZ1JHv9CXpKT
	Rv78ohcZTpHgJpqViA0F7z8rgXIMo1ph3MZMBEZg51EVssvYcJ3AalB4lWIIjXRpTrCK/ShOE63ZR
	xi8I8Wcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJAE-0000000HV24-3T8w;
	Thu, 15 Oct 2026 10:58:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJAD-0000000HV1q-1XU7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 10:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xmrvapIyNOMc21KmtuXbHJaLrEICIWq9hrvqnzYMR3o=; b=Kn1YyfhktUwdq8ppEZcroCoD+Y
	rcsG/RDk6AOuGpXegyJdSDbM+rn02KKD1LgsZUrgf3G2g7YT9sZp9g6yWnAuO7IjsndvuErObKdrU
	YUJaKwkcfaffyVwsA9JVkQM3knpQWTzXa3eqGsi0jhuSWLE7kxsv0njDM3FtYuS5VYChu/5UZIMJw
	SVJ5kj9PO8xCrtXaG2KygHsHDTT2yql0mMf1Sen5we4yOkHDEBQ/VWkb1fMOjKNnftd1MSAG5+o4a
	YArHjZg8IJGdeogmNRqyJ2YHGssLHiqsBTSyFGNejVU0TFxu1l9mSUfGqpYCqxjAonxniRy+7A2IX
	ajnSPDMQ==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHJA9-00000000HFC-491S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:58:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSKnXCs0bP80Crd0c6S5IaPDqRu4rj3r2eB47nSVUf8lFTBPP8XNz4mTD4PsLGQOypygZNANL5r0Bdv3yVGzJuZpUe9BuLbOUiMdsQCBlnTDT7iCM5gPyrekBFNFqPKrdRsm8YreRetuRFxrmJjj1+4NyD8O1uDdr505SnQpf30JVsFqL+JuPhiTySqpdOdkaT3w0P2eWGkrPD1dAiNdK4AdekEwo9JvHn7MVhAEUdZRZ60xYQB5ckdxw2yPw1euMj3hBEpjum42f3pX2j+BibY8cDO4uspmkRFXoV/qKeX2MGeJ4ew3B5LSN0n1GAFXLXpZT3zba6i0Ekv65eIn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmrvapIyNOMc21KmtuXbHJaLrEICIWq9hrvqnzYMR3o=;
 b=klt/MTSptZKSrr/9TkTCfInD+GkRd4HoR9bJT1CELfY2cp64n1tKSZIn7gYIcXHaf6CYjaI4Zq69zQEBc5/7ui6JvTzbR5o7FhmtiGfGnEXfrale7hKwL+UZZzHeoSgUz7TlAa+tvt/FgDbbjJPken/9DBhfI1oXeP50kyHjiyy7yimt+N5RrzL8y31uwGROYKJOFvC5JykcTYD9jXPJV6ZyxNTZ4Q9RWn8XeiSoU7t5u7AWxBoX0A1wWh9aaDOHBicgDxqCI3RXMKN6egMIwdQ61utfwBbAo+4QcJs9R5IRpwWSVqFDocEkOqaaskKr53IsNI05K+VudeIGvMNjJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmrvapIyNOMc21KmtuXbHJaLrEICIWq9hrvqnzYMR3o=;
 b=qvGqT1P3kDwQFE9QCaEsma3w1V4qgvunpZjPdekIuHTz0Q6qEPaI+B70gCB3TOrCEolNtrKDF+FXCu2jx3lN2oY40GKNSDt3fij26Xz0CvQG8EhxegHtzTkzA9zCSmeQH43Z7hs+njYO6u0QyZtkhDQ4xJ+6WGyGxB0JSlwNuw0GGC8BLxdEnZeSFH11NvYbonmzbkbTuTUOt13uKnDcW0+qeH6eNHlo5wLlIdqWoWEudmSd9v5pIbWs1o3Va7ib+2D1as+zCnUoJ0l8r0i7vJVygNOgCvTI73WgwRGRScCljrcM+IbQVyNNHaGbB3ImJQn9xFTup51blUqEVVriSw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6923.eurprd04.prod.outlook.com (2603:10a6:10:114::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 10:58:13 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 10:58:13 +0000
Date: Thu, 15 Oct 2026 19:02:48 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag
 on i2c3 GPIOs
Message-ID: <atCy2Li2wrPHhW8K@shlinux89>
References: <20261015081149.5919-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015081149.5919-1-stefano.r@variscite.com>
X-ClientProxiedBy: MA5PR01CA0304.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 907d2b36-3e25-40d5-a8de-08df2aab34ec
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|23010399003|56012099006|261009223027099003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mcd0Yybp7h19jwE+PWshiEU3NLltrX6VXQsRo81aFu6pxL6lNOuWJyzWL9JeBwVaP2YedXdjCWepcruMiQ1H9j6Q7dnUWf7bCOkhwv16ORqTT/wpvYRQMUsy2YeAOCYm6ELxQ5i5RePAn5mdwL0WSEYTpmPMsu/fCHaFD27V+LykuTBRJtFQPZgpPCegpryqeuQgIf5/0K2qm9h1Tl8BahkoCDrEdA89oIh6M52LHMofD//CNBjSCXG+9f6GnzepYpd/pGaMpunfjIn3/pDqYPqbGHUR5MXIf3xRrFgsEgCVASGu9prB7gzgkLIrqmf12Hxx1uL7WRTRNdfEMY6b89WitEQAOPE67AB6hsrLbuEDbKlNlbVAjrvMrK5OodCwBasYreG9luWOR4iBUyV7aWaoYQAVZfV+pBf2rfnjGuNBHMlYA6IDG/N7PbUtioQzcChbNQcdv/O9n/yRYobUl7MDGZFS725KXVEiTJWdh3IJnDXD/KZLVqoLokt+I644AuJqbmJlTiocDrFMVANilFsUxewz7Axb76fmomhghRZ856GXbYFSNCBvCyhLFgRUT7BuxgJCmxWa+DPg4VP0GaoDrp661LPQ90RtLzJGs2wxFRbmlGn37PWA7bDlCEm8qVN10wZoxuZ6DYS9GxtcOoswOkX4Jbfcbwiea5EKBts=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(23010399003)(56012099006)(261009223027099003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1JfCCSHWyB/xPFO13l841FawzME2MsH1Wa10gM1tjJZ/FpS0+OIommht2t/9?=
 =?us-ascii?Q?sWkWIFd8UhtAMPmwaFOdDzxoRx4gUflYpoqK5a8BoM45iJPUBxYdd3NqR36t?=
 =?us-ascii?Q?L/h/HqBSLsWkvgX5I5KCRvchDq1uRfBQ5Cmyz1hr4HK1Es+aO6qcXMOi9pMp?=
 =?us-ascii?Q?5/fxcZbX2izs/wj/3YApZvSwjUY0Pgrvm1ZGnPHYPtty5IE9pqXAE2bDtS2D?=
 =?us-ascii?Q?HAxZ1pWEbdgcujWuaiqZNWb1LWm/LtCrhYFU5P2xd7xbAPX2SWmst6OcndvY?=
 =?us-ascii?Q?PZqEOGARu6OOlTgeW65WZn7E4KYVYAHpu4UQMN9DbAJ8qRQ2yImS8D+BJ6kD?=
 =?us-ascii?Q?vkd+41BUSZVQfaFf+sT4+HbdPq54ohxr9/lRZ1o+vgFivgHG1zIiwwzDNbpN?=
 =?us-ascii?Q?3XJW+6VSt5Ref0eUGJZl7qdfDi6YmsAAgxYofDJcKVV9SWIpnEhv+aph+jt1?=
 =?us-ascii?Q?a5LB2nSYdMhO4/1T8u4zbeNizeIcNl2YoqNK8UKpshSsE1Kl3CYK70a2+lR2?=
 =?us-ascii?Q?tqKgHBWHCxkLM1zrcv4aFqVsUaDY+jv1JjVN6hUNLIdQosrCrKoPD29ZjS4I?=
 =?us-ascii?Q?MII6p/SUPIRj4OBqNyujtK26vU6LN2uaDx+oFe/oxozxU4XIswzG1GYuKTU8?=
 =?us-ascii?Q?Y3jrw3Cw+97JcBmvymOMZ4Riki3MTzkBNcHqwB7hztm6PEfFoZuPaM1Shlrc?=
 =?us-ascii?Q?7byOqZFTgnPXjGfyrZSMuIkPcsA3+MtAlmLXWH87lQ7jRRcRY6tMRRaWujof?=
 =?us-ascii?Q?AOUaOuIsxTA3IhPrbJ5itBD1NBjd1bFwvSzw27TTQqFWvH3bvAkbi/jOcQpp?=
 =?us-ascii?Q?CDgaeP3ZCiXJQFKenapZpyvWWFGnVXXPeYq2e5wsw24ir+gFoMzojsmk8EhT?=
 =?us-ascii?Q?WTbART6W+50VMxMJdcZYf0rbhHi8QAoy7VBVnzuSLn+er/gWh1dswe8ocKgq?=
 =?us-ascii?Q?ZUhuaChyuowzJblAdBcDl1pCrI8s8rVgZhTDsESgah4W0xQBOgFadniOJQ4W?=
 =?us-ascii?Q?OSNvPzNzWtwssWnCLnCtBPW/hGyFVrSSS3/iTvS/9Nr3bSEZ6fc5pdz7Ew/d?=
 =?us-ascii?Q?5h3DPwLOcOkh+SXUCSFi9ZEWU/xJZDz6zh56L30ezIq8q2hjUo7Mj+8iQZ/B?=
 =?us-ascii?Q?Q7cA3cOuNf4JaG9X9FZF6Je/blSFOY8Ru2JsD61WfP8pXVk3P8qG1BFdKVOD?=
 =?us-ascii?Q?8ZJnYqrmeKwdTjao9FtIMA7+iIFO9UUHRVHu1l+giB7nPnGUrUa6O4M3jjfH?=
 =?us-ascii?Q?1HLNO3VXuzQBRHo4kaVUCDk8XQg2MdkFVhNjThcx7+LLlNJs/dlJ2bQ9sdAQ?=
 =?us-ascii?Q?bAFfy6yVoKTT38KUT0264+GtUS7lOmXLioi2DZq2zlv1zBwAs0RpfcM+mptq?=
 =?us-ascii?Q?/vVZyA05e4jo5ZTZsQGVv2miMC7lVSDStdC3u6nFw7wTDVgJNPogJq+05YZL?=
 =?us-ascii?Q?MMLje9C94JyZq7CWmoQRr4MedDHwJ6/7Rh/D5EENNTYJIJ43z8Z6gS5vYKan?=
 =?us-ascii?Q?JB4usBC/JMJYcDls6HPn17aN3W5qfBmIzqgmg/GoXMpqJ4wYOqmAOfrhZ1yg?=
 =?us-ascii?Q?IsT3uLIXJ3wDmXFCrTa2ATSjpw1TjcKlfcb3vsEm2TtVQJiC2Odtv3NyQjC5?=
 =?us-ascii?Q?CtnPW/IxnnS4Zh4w2aq94ginDMsOxa/UV6q9ftrR2xMBXyoVvSW4CikS4mMq?=
 =?us-ascii?Q?VgwuIR01PBhguUEaQL65ZsA9Sf3xShVOWoy3Rm22oAF7lJq21vJ4jQgj754O?=
 =?us-ascii?Q?3HcaLSrLc1TsS21ikG0gZhakVSuf0h/y/4p+t2rrw54rKHx9feQb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907d2b36-3e25-40d5-a8de-08df2aab34ec
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 10:58:12.8789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaN7sniQUJl4F3YKlew6ADRFQWFaYiX38LuQUadzstqIV20YBhG4xOvUehZgS6xBfJI53PByZMGUfa/GiMzFiUL0onUegEwkT4woWtNnUZrjUG1v+Bv91bLZxWZ51k9h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6923
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_115818_165728_CCD63EDF 
X-CRM114-Status: GOOD (  12.22  )
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

On Thu, Oct 15, 2026 at 10:11:49AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
>following run-time warning is seen:
>
>gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
>---
> arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
>index 3e590afa4fab..036afa0f6990 100644
>--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
>+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
>@@ -287,8 +287,8 @@ &i2c3 {
> 	pinctrl-names = "default", "gpio";
> 	pinctrl-0 = <&pinctrl_i2c3>;
> 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
>-	scl-gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
>-	sda-gpios = <&gpio5 19 GPIO_ACTIVE_HIGH>;
>+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

I think ODE should be configured for pinctrl_i2c3_gpio.

Regards
Peng


> 	status = "okay";
> 
> 	pca6416: gpio@20 {
>-- 
>2.47.3
>

