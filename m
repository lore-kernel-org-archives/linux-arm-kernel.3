Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AC960A6F41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h/33LCLl;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aw11csvE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jI2AC+CdF9MgCL1fJFQjIkDxJsvnyd/hxIIiFs3seag=; b=h/33LCLlX6OSbKh6NilHeiTvN4
	aPNm95jCuLr4VXm/ruA2gIjKtYrO5TW+3pdS/c47lgNeSFCZjQA/HdGDFLaAQJQiJNZz+1ezoIS5V
	q6Fq6drGNfR1yLFAcomvkFkM/BXIsr9UaEwhVqdLilgpnyRH2lpOGU1iMGPtW+R1D9kuk/RBAXnq8
	m0MV0nUiDnWMo/CDaBQfkZJ3Eda4w5MHFtyquAuDncXB7QwvU1IjW9yfJkNiF5BJHO58CNMTiQxHb
	d/3/T50ikoHOgrG3XKJ8JeayPKalZ//fW75FYqpS1IR2aiq+5fFPpG8xWZM+FSTPRCyn/w0sRcWBF
	1DSBnD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuR2-0000000ENpG-3Tml;
	Thu, 22 Oct 2026 15:10:28 +0000
Received: from mail-westeuropeazon11010020.outbound.protection.outlook.com ([52.101.69.20] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuR0-0000000ENnz-0eL8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 15:10:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtOULvzNR0YfEcPG0YmnOIyk4sekIC7IHQWa+tunhrk6CvJP6Bn9ayuO2ZXuwvfa50oZKgHEdfXBcHcJFI6o240AGDQIGyAUWPDOPoKRgkM/NawgeL3fPz11Gf2AOecgKwpys1gP1uEg7eKWipLBzP1Nm/naIp8rTq8iM4qWuRavqs/9OruA9ODDEtng/gBwe4fvRmsxz1TiAO/cmGUnmzfcWVZMOT6fMhOa9DJw/PgSoz9JzfLruQgNsLIHATkQFS6gx15X1NOYghIymWHCXYx080VRuf7vN3no8LRavUAZgibzRjjnHzYAU8rrTjD+b6CYN0rWr7HRxIQZwmz9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jI2AC+CdF9MgCL1fJFQjIkDxJsvnyd/hxIIiFs3seag=;
 b=IutWhB+0HjSqq1aWBihWg1epdwe89K9hf+D994WXud32KZOwXLzXz1eDnuy0UCtASoaZRNKFa0y2UoMQ9E8OTtBtV445tWc7hr5kFgaVL/m968ViU2ew/+kiAaF9BDgI2roRSqbG6ED3JCfUss1AbgtU0AQs6SrRkXJVHy4agGoDYu6XI56PV4OsmOtHGBz4U1QMC5QHgpP925gOw8PzA0Aa5Sc65qXMVVmVN1OwOA//gohDYfsbvaJM6K9IWc/bcTpEvuJaEFlpW8HTr+Li7JWwzhFt0ZvVCfTGDPFgEKNhJ7spLMYSqQ/LYvbDWAtaEMNbhVsxeq2aGPHm05AHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jI2AC+CdF9MgCL1fJFQjIkDxJsvnyd/hxIIiFs3seag=;
 b=aw11csvE54GpQupkC4Z9Pk3aJCnnENMabwpJ/qbPUm6SpAEauZJGC7MKcQNKxasb55shA5Ou3QMgGon+8tPR7F6iGsOX7H+Uk5o+QeJbMX54P5WoJYWHGZvjPszJGG3DGA65+jhttMo+sjRkV6XQbtNjRHUtHN37nmgXBfMfvoY+1FvO7YpuNI3WQHArcXZ4vXuM1wtXGNvvB6Uj4FuUz3uN38FaTqhaC94pzADmqJrQmj5B4XKzZxZ3f6Kv1RQarOFWIPa0Voqmm8CXd3FGNEdezUtg0dXK0aV2T2Cv3MTkRExlQxrAzEsTcMvzzMR9pujdTdOdbgKB01eXTuU5YQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 15:10:20 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 15:10:19 +0000
Date: Thu, 22 Oct 2026 10:10:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: freescale: imx8mm-verdin: Share the
 UART_4 MCU overlay
Message-ID: <atonUhtKvsH3CjKD@SMW015318>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
 <20261022-v1-imx95-overlays-v2-1-c769d6eb54fd@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-v1-imx95-overlays-v2-1-c769d6eb54fd@toradex.com>
X-ClientProxiedBy: DS7P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:223::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 706fd67d-540e-47e4-e1e0-08df304e9606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|7416014|376014|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: oBWGdJI7P+y2/5k3i+CzIew3L/07oSv09NZ7vE355so7THxbro761xQ86DQuzDLBkDk7jMl99sS2eZzY7JcRBGEygkYbmTHBusTd+jwmSHMBVI+khonIMjDVZvZz5v73oEITXKvfm/o9QWoowU3/LH6eRwAVfIR8U85lviCM3G1dl0XhHzDXW6MqYCqbW+XsJxTQyGLu8sx9wS4sJMR1hDj7dqz/waAlRe5affuJ8AZgI7KvD/eOL3CncJVboKFTe8UnTx5vnnmoRLKZLlx+O+d8XMjFGAsMXvsuQK6pAKEpy1Fx9cjbbEZhHsJBeOfwopXm+qfn9tOTcBQ/qT2Tdfs8WKBjQMKjKuT0h5NyD0QCnzo5BjykOWmzRsOjNOxIZ4HBPhzWwFbOuFHGVZCMLIf1zlRVIXMuZ+0U++t0Fq6DLbuPs7FdqtVymp156Z9R/s1JvTYJv8B3wLEuBzBp5TAY9LDoKsHrAumH8DjH9DpaZDPscjpAsiWFy5aSULOJ1EWY05BdZKN9deIyAUVYL/dG8ajkrlUkd1E7M0pkyLNPwrskif8vrtm1VSW2OILf8jIS1SzZbn3GnS304oWghl6up21Czza0SOImXk1RsS0IzJkCR+sY1ELRFXkIw774u83yszJQgOonsQDoqds4rQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yav7R676PljzdCj4k4mjBfgbyMRBWsBoqM0hrVxH7uPgQgUJnj9PETrShZPh?=
 =?us-ascii?Q?TUS2mdWA4dh4JIBwc8V+v9HPwWvd+/DktFOD9gOs4O+Do8ZkbwqbOGZFgERJ?=
 =?us-ascii?Q?gHqS4wg4ixCbI5Vn+eJD7Qi2+4XaTGNbGmhBmSV9lwOwYXwoZqUSktcVfVki?=
 =?us-ascii?Q?UCvD4kkLxKhUaal0NWcjKkTIZrVe1VZng2T4ssxG7Lb66O6MecuQsn0pjzfN?=
 =?us-ascii?Q?VloyZPGqnpAoQpRyhFlO0ASGgOjlPIcMeNyxk8QzEdCCZDAFcRZvc0nZHMKu?=
 =?us-ascii?Q?rqTqvHNBRmffxOEXgnogu7RW5EikWw2l3kQQYmtRR7qRpUdR7Qta06yKQYPv?=
 =?us-ascii?Q?wgRn2U/JLN0mw26qO7ITTu54ANSSXCy2bYUTf3YchXmaPXHzDsQ6UsTptUs1?=
 =?us-ascii?Q?Skh18gSGnEr77QlfK99R/tSa5a3Lt7gvl1mT4LLXRrJ1ZFSr/gde7t0uOo9K?=
 =?us-ascii?Q?n5PLAjcvqvK5IRJpFj3T4cFZun8uXdqRsX2QU7pj3z16bgoiwWXsfiyiglRq?=
 =?us-ascii?Q?92K8+1Y2l4huHA51EHOx1c0My9jali0Sg/3/tqZ+1NvO5WJ5EJQvLHq2EsV1?=
 =?us-ascii?Q?wL//+crxv+otgZaCZ6Axe+sgXIuURhJMZN1znqZ1YMUfv2jNfbmAsDLX1j8L?=
 =?us-ascii?Q?r6wI6e0K+X0sGPUSZfP4TZglY26/c5/H788G4XRCscQXE9gxngCgB/+gGFTV?=
 =?us-ascii?Q?pW4sI1NLfnrkwdG179wA1d2Cb0Vi5Ms/UUytrEJyklFjLpzfizkGCJuB6Gh0?=
 =?us-ascii?Q?qHcDzSjpB8+UuKBoMBSTdpebq5aaqvedy7O8F9KvClGmhT1cBUKQZodU493n?=
 =?us-ascii?Q?RhJqOQR+B4u7R4hK1/D2FeGbK5t9cO8HPjl8Jh0FdFaGJ43+n2jO5luDNwY+?=
 =?us-ascii?Q?WmurIDMJQ6KuOIUYyKoavvqDJZYWm5TZQRT0RdB0uO7+p7b3nWyoimA0JgLV?=
 =?us-ascii?Q?ZwNcOOGV7WmTT6K+TmTNMT2sVghL6DwmgXewtnmhAtc66n2gWNAp5wmn4BMV?=
 =?us-ascii?Q?dYIPnYog5orZofA+f5SuyqmtHheYVL5bZiAjcKQq0bpxM0G4RVHnLAJ9SFqh?=
 =?us-ascii?Q?tkm1DyEAKz0qYlM0R13VoTPo5z8MB3Dq0lj2SAs17sJL53v7LHwTzbydFyQr?=
 =?us-ascii?Q?woR0nGTm2DS4PTOKS/3zgaur2vlCe7RyyJwFS4d6wQq2i6D7Nlh2kHrnyaca?=
 =?us-ascii?Q?xA0btbTIC+TJsVPTO2+UkxtjhEsw5PGVrYvzM1Zvk602IoMRoxRl5vg33//C?=
 =?us-ascii?Q?Ws6IhR9HlnLRrx2VCi6xWcXa3el6KoC/ECGl1yUh+Y8HqjwprPpi283xMREH?=
 =?us-ascii?Q?LXEfIKSH/MOypAImnRVeUXf/Qt4ssSkrp8RnHWA2pHRdNaiIp4BaIsHV5gFt?=
 =?us-ascii?Q?6N0MNszvXBRVfP/eFzkovAfKm8CQFy3YPk5iKQBK+Bdnwhqz3lvHGLaYFtvd?=
 =?us-ascii?Q?sxYwcgtcKUPmv4nRXa+Fz96rCIFIhcCCRYCAzukINWPCIBtaSd/8NDIHT1DO?=
 =?us-ascii?Q?YWZFG+8026YtcPGZVw+NKk6nJePyppvS/rH7fY+4INEBqcxR1s0rkCMmTRka?=
 =?us-ascii?Q?SplwpIDChewzuxONFhaXHvecySddt57blHd3L/1GM/LB0nrAwe42Uv4dMrvC?=
 =?us-ascii?Q?QbPnilf1xpV99Yg4UGQpiFPLKIhVtQ2AO/rwWcOwY+Tw1ayscYqylw6RBgPe?=
 =?us-ascii?Q?ITWcf4bduPYpFnn3jzrQD0p8PjAq9tC0QGmwEj3LlX928XxnIZETNpUOM7tM?=
 =?us-ascii?Q?vww8ilHLmhs7N5Q2pITSsZlxouvnHEDuUCuFMfj44PGn0MrcTmSy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706fd67d-540e-47e4-e1e0-08df304e9606
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 15:10:19.4356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSeptOFAQlZbH2O25ybxT0Z4RwMVXXlcYVd6ugRorRygg4OPhDSdyUtEftovq6SXeKrRap0kEml9vAoLrNUv0Y3Foh/OwpbdtFCNzSRj4dZNHxEczbjKxzTWhOPazZfq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_081026_222818_C738D48C 
X-CRM114-Status: GOOD (  11.82  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 04:09:33PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Verdin UART_4 is the UART the module assigns to the Cortex-M4F core.
> Other Toradex modules also assign one UART to their Cortex-M core, such
> as Verdin and Aquila UART_4 and SMARC SER0 on i.MX95, but on a different
> UART instance, so an overlay naming the instance cannot be shared.
>
> Label the UART uart_mcu in the module device tree and turn the Verdin
> iMX8M Mini overlay into imx-tdx-uart-mcu.dtso, which reserves the
> labelled UART. The combined Verdin iMX8M Mini DTB keeps its name.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---

Thank you to make shared dtso happen.

Frank

