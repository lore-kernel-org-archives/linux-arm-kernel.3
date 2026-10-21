Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFBC606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m9nXegKu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=grSlIP2O;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=f9onuT6U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzRjMn9nsx05XJdSIh+c6gdAaZKurrSAnsrWXCODiig=; b=m9nXegKun28iuWSRdg2ZBQSjoz
	KSVbRxCnbvcvB1fcS7cxy6RAy0gtIAsRUBy68HOJ0ikd+nktML3W2PSUvuC35B3xV83EGWmBYs43D
	HtEVbryN8ZwprqopAgPopE12eTQcODgR5tF/edbvLMwpjgUOh+5bjA38QupkT57B63X3jvqVUDqu0
	VFkqajlTxgIGWTiDxSi0XMu3pOA4QH6GZVxF8y4tyCKTuRhFtEsmmh2sdoqrAkgf8w5dboYcNFRIl
	VhA/ahAjOGtdpxv6aiE4jqAls7YzozcRP/mVRPfY1yRf5gCVO6cJ9qnhjp1VAJf7x14BiJgkDHVLi
	MdNH5lJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRg7-0000000BLeI-1CO3;
	Wed, 21 Oct 2026 08:28:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRg6-0000000BLe3-0I0E
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 08:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GzRjMn9nsx05XJdSIh+c6gdAaZKurrSAnsrWXCODiig=; b=grSlIP2Om3kzmfPOCNjthQVIhM
	gsSxIG0rWGmw2iOW9Dv9hG7R6W59EkMR/n0AGg3fgRsHvVnSGORyspIpeyN+gkDnnQDscMe9hMMPw
	P+bOstZmkHZ3qgj5XRC7GcShsShCwosBvLR/mU/3WrwUgf5MGfC25bR+qnkd7TiWnIOXs2VsBL4/K
	O7stdk1DdhBTP4GWwAXyJgPReclhfvay6NgZAGsdwFnFFSgN2AwlmV2JFhpCAPgDZPUFwjuo1q5ys
	qFqVN07kfe7YxCpOL5CdEbwegfa/vBzlkGDVPtcsg6JUwjql8A4t9QQVFRpm7kX4cO4wVCG73dpGI
	9+B/HtOA==;
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJRg2-00000005aqM-3R7K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 08:28:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InzCciVApaNu4d9d4zHd7ZhiOorLKuqwIiQ+G0pCtLyoAWbATATrI9wBGv/qHYU4RmrATvptQvgsqIw32ZAoTTySz/OcjZKCL/oO0aZ6u0QVaya6eEJok5kFa4L6fEhMe/mSOMJ9M9iSsgmPL7z9LWn42K0lLaE3GaGTpo48HY49P6eUkVf+VYBofLiv6+579EzJfmeTDGb8djZThpcIJZWnDWxzbC4dnPV0ciJPgGdtASLay2ir0WGa0/FbS0p9+ImOg6tUHdJGWwuzgdH/hbEVaQ+3LCNQhUxLVEm2CzCHHF8P7dpzElwx8Plxgo08EZytI0re1YiPfVKxDvt5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzRjMn9nsx05XJdSIh+c6gdAaZKurrSAnsrWXCODiig=;
 b=NmlrEOo2405uELgdKW7EE07CsDpCHX4LHa+/b+DfzqU5cOUFVtAC7uUwsZneZcV3W7cXjFKUkG06tFcVlzR5rc/uZW42rNGh8O61doA9WtrMyChTcxCUfiZcgenlSowRiuh9WI9pHPNFGamXvcBUJS50QHNSK8litDb93Ar+P075EllO49b0P0IVZLPWX/16puMQnsi45DXbaGvZQZkBovYAMOIhFh8vD3/+Wgj7QrH/XEI2Yglv+Qavalmr1jhMXlYM04GwnjPpdnL1at+uohrjnHAMpUToM1laVzH9LSwkzFGng76lyIvpMoLlClzWn1wSqd0HRcgNLjzcz4s5Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzRjMn9nsx05XJdSIh+c6gdAaZKurrSAnsrWXCODiig=;
 b=f9onuT6UbNxEV9U8Ppm0ZxA83FSWui8LRo8eNk1jX5kF0esz1xYTMTw1Cw5ek8UpiZLzzYHTdF1VTA28t+FtM7tV+Zi8LpyFxiPAakuKnwMsbvt/eAJgwU2S/3tlshxOUhiSY+awuKu9d45CfmsxOmTuBF1YE0zlA3B1U9DJV9O+C7hEwxhM5FCATybMYBXtD/+1kRe3mTMkQ0Tg2esEK1e0y3+DwHwABc3wznHmAvAHE6utr7SkPgn4PSfxxDYMmt/BMBCLd2RweFFOn9ddRiweOnd2F5LL20DXBcpkgjPxFo1MHeDvy3zpCwy0jqKvaNatnMC/5QhXAj2OKfB6KA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
 by DB9PR04MB11509.eurprd04.prod.outlook.com (2603:10a6:10:5e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 08:27:49 +0000
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151]) by MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 08:27:49 +0000
Date: Wed, 21 Oct 2026 16:29:21 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Frank.Li@oss.nxp.com
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 5/7] arm64: dts: imx8dxl-evk: Add onboard GPIO mux
 controller
Message-ID: <ath34U4JkqSZmofA@raspi>
References: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
 <20261020-dxl_lcdif-v3-5-adc944659e14@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-dxl_lcdif-v3-5-adc944659e14@nxp.com>
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To MI9PR04MB350878.eurprd04.prod.outlook.com
 (2603:10a6:290:c0::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB350878:EE_|DB9PR04MB11509:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b3ed78-efe2-4ec4-9e37-08df2f4d3136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|376014|7416014|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kcCodV+DPUI9U1gKzJxQdWW6BYmMaAmhFfLO1E6ghAYOMiGzjzY//kfhZB4fxCbL9HAxMhlzK9Tl+KU2sIRrtU6qkRYLkhWC8Yp7bweNIHKjm+ob4sMI0yiXWv32swL9zCBXSSC/vbKB94pWkmsarc5n52uUYUt6E1H7yqhwjdzwXEamWVTnhWzP8lWULXxL+4zksRtnL4BwDF26m03aNXKllHzmfCkhVO0IakY7SDTYS/joukEmPYEZQjaCoX9nI6/aDqaJzENPI4h9LfOSvim/ZDLFM6B17MmoEJKbT7D7IAd4q5vDFw4P81qBatQK6GnTLXjE2EGbMlf60cGsZzp7xftqrQ3rfPXWY8yg1cc4cPDVUResqfj1H4WbNnRpdv+nMWvjVNNmO4G7P9/Y0f44B3W44icOnZe9FpxzBe+cTbNy63oycnVXDrnbbLnZBpf8PNOToqZHeLyCLxpgsXqqGNRIDnwwZFFS4PmXxBwuX+SX7hIvKo3F9vjwdA0vZiOMy3E86n3YskkEYuUNRyNs8V1y1rvSQrza9F5PSXEuSkC231hJ5V/L9L5izOqc/7egIKM7NJldpC44j/F22mwK/vwYbWiU5bTU4EHsVwmaWE1l/Qn7BGo7KkYS173Zj8cVQs7iK/ksSYu811A4uIYPAWbcMTkTsvVawRs2Q60=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB350878.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(376014)(7416014)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5gywwsxNAnndCumqQh1JCLDAju6y7g/ZF9YAod/c4RONyly7JxWzKMqAmSob?=
 =?us-ascii?Q?pwKUzdrKhFnpgpe1rpfmPpu3LMGI48KLjt06KOQSYax1Kk7M/N1vYaqGBcQ1?=
 =?us-ascii?Q?xWU6qfR6Zbbcw6kqqGaZJiBeokBjJOYzH48ztC1QZLvUVEj2zEzOKuGd+ipW?=
 =?us-ascii?Q?AJOmTgIStyHveODSTOcWZKlsZcCpCyQDSJMxQ1z56nqEsz8AvwF1DGsqU7A5?=
 =?us-ascii?Q?JJ2qHJhvvyaGlI9iWquyOVWQroXbY8dDdN1ZYVB4JvlSo70sw4CnKCkIk236?=
 =?us-ascii?Q?hB5KNNffS7ZCEBoEPssKiUfoHDdq/hE62VAbyj+jB5wq2Lmu7NOuM2uF0Tas?=
 =?us-ascii?Q?clAr5h3NiXJLX7NoV0RbUONok6rdoVeIIarnb3FyP2h99rG5OmFc6aJTLQQp?=
 =?us-ascii?Q?SPqPEtqIDketrroXwtJuKuxmV6bfhkfsdmTsQ9YdMkc/hNOxdpQVyD9V5/mA?=
 =?us-ascii?Q?cJp+LdgO2nDJl8TGDxOjZeYi37RHkdKDr6XHl4AmjjVNymNPY1Xmwwq4JcCE?=
 =?us-ascii?Q?KavXt3vsHf/V4aIv2L1rrVXDZnhX396qmA2gikZh7seKZ5DtGxiovyHp7CkK?=
 =?us-ascii?Q?sIKOR/8/B89nVVVbrnWywqO0JuhkF5gVDarwEtZ/2QWGgYxeQKEOpeW1jwHJ?=
 =?us-ascii?Q?VDfhuAiCdfc7w8QNLPE5J/PlSmv2l3be373EvUVqhp2WTw1NXGS3KDPQ4bfd?=
 =?us-ascii?Q?F01Do/znXTUUkSKBIonHV7T3B1qF4U6A3BlPfwZNHFAYb9UOMEl7cBpKhUWR?=
 =?us-ascii?Q?l5jHOgpuY1K0FFmI8Sf5GELFB/zb07nbkMzTZrYS+7TBQCTGfDxxU9zwBLsE?=
 =?us-ascii?Q?DskzKiRbhG0I3nzaJgOJmBLJxiL+KBKRPmPQb8JuLTZGA+1tBg04eAeyWCTv?=
 =?us-ascii?Q?vYBdmwSM4WB5pnlKhm0nXLeKEgse7N5m5MSFAxoJWchCbo99znSV8KcTgay/?=
 =?us-ascii?Q?C+YnQcbv8aD2NBiwyl9X25Oqf9OcWyRO4V+jq00Dn8GdiFUEzmd+oeLcCZih?=
 =?us-ascii?Q?5phmWs2TaEVEBR4snk083v0qKtzPeQGGmN5zIjjCjzyt2HZnMa/bnzXNfllt?=
 =?us-ascii?Q?cSb7M4nWwuvowFaSpKyh1hGlXRmtEC1TS89Kk4fyhCnMV6x80ehvoAdK3rGe?=
 =?us-ascii?Q?M/s3vzFyu4nwQxCWP/CWHchVGFKWQs4GZHu/yf+rAPAHJqT6DS8MXptQoFII?=
 =?us-ascii?Q?bsTYYk0h25cqpkGyVCoMJJSafT5X6XfZtFT1dGFT8VSfJICx4ogPc2+14fjU?=
 =?us-ascii?Q?9Mzh5PBj6S0xrNxD6juiGWn69J/hjnuR9KGuH26MByw4jqQ98KZz2NYyfsTV?=
 =?us-ascii?Q?edeICWyikuigy9av7ymMzG0zN2FSLwWMaHmu1E7eDsThkLRdV9N5HNbtVFkY?=
 =?us-ascii?Q?7p2ITzScdH+CXOtt1KiWCOQ+jkgGTwyydkc7l98MaSYYB5r6xrsN4FqNTfbp?=
 =?us-ascii?Q?k9p786wKQQVSeGrIpuToXt2QlIYYwbB10XRIPwzzzYvle+gQG+6/2wqerRmf?=
 =?us-ascii?Q?yudMpYUoRDP6fkO9B45vPKgpHuKwiroyzXQbu/+KasvYnyjUVEEZ6ApMwupS?=
 =?us-ascii?Q?eqwj2op6WwhleOpMg1s1nzg6SWdL+N4QwcivZ0OpFdLHydRfECxm6ZHDJOtw?=
 =?us-ascii?Q?uMTdNcdWRRQknxKwdZtkW06AxRTHFxk93KD6ia0yPVTnfRufxi5EaYnqs4Wc?=
 =?us-ascii?Q?+OqkBgWboqfzT8T73GFfhjLUk9b5eVU9wjK0AcLjx87nDqBhkgb9n2DNQKQ+?=
 =?us-ascii?Q?SMBvsDXbjw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b3ed78-efe2-4ec4-9e37-08df2f4d3136
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB350878.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 08:27:49.5395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thgoPj8s1m0+s57qFezi8jTvDblDs+3CVUWfgg/CgllpuU7Em7Uluw/FDxnzCAvOyOVq8gBuMStnsm8Dz6Cfpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11509
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_092803_089373_393ADAEC 
X-CRM114-Status: GOOD (  10.92  )
X-Spam-Score: 0.8 (/)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 04:12:55PM -0400, Frank.Li@oss.nxp.com wrote:

[...]

> +	pinctrl-gpiomux {
> +		compatible = "pinctrl-multiplexer";
> +
> +		m4_debug_fun: cm4-uart-grp {
> +			mux-states = <&m4_debug_mux 1>;
> +		};
> +
> +		spi0_fun: spi0-grp {
> +			mux-states = <&spi0_mux 1>;
> +		};
> +
> +		spi3_fun: spi3-grp {
> +			mux-states = <&spi3_mux 1>;
> +		};
> +
> +		uart1_fun: uart1-grp {
> +			mux-states = <&uart1_mux 1>;
> +		};
> +
> +		lcd_0_fun: lcd0-grp {
> +			mux-states = <&spi0_mux 0>;
> +		};
> +
> +		lcd_1_fun: lcd1-grp {
> +			mux-states = <&spi3_mux 0>;
> +		};
> +
> +		lcd_2_fun: lcd2-grp {
> +			mux-states = <&uart1_mux 0>;
> +		};
> +
> +		lcd_3_fun: lcd3-grp {
> +			mux-states = <&m4_debug_mux 0>;
> +		};

Nit: Can you sort the child node names alphabetically?

>  	};

-- 
Regards,
Liu Ying

