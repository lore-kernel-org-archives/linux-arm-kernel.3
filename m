Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BB4CCF2D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAlCbjUrN+BpPsVqqjJr3suHVnb/3Zw7R0d/PceQi/U=; b=N2G8mwoyjDvarwROuEpAgGqD8a
	nYbtUW3C9KiryNMevRP7LVXXe6+i+7CzHfu6GL08A7qXx8BcJIbz5kLrnR3gLlfQ14NRegi6nK/hC
	MirzLxNNEf1c58NumtUDXKFLnGQIiXW60vgErVKbhPpt55fr/njiAIzR+SMYtOaC+YrAAPvyfcerw
	t9wa8ShXCC5sR3NAiW/D+1IUQY7wUkU7XJ6wbad88GFcEmyhC6ghXbm/3z0zT14eG1Xhnr1JRPECQ
	X5a/rGoWHVm6Gqt8mSCHbKzYkzMSPApuFFHWiqEL0nFZsXWw1hTZDNnld/z8fjaY4Gi2Rmc/L8/ot
	ouuBNpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm7v-00000001hwi-0DPa;
	Mon, 19 Jan 2026 10:04:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm7l-00000001hsp-0l2U
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 10:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OAlCbjUrN+BpPsVqqjJr3suHVnb/3Zw7R0d/PceQi/U=; b=plwJT60hB8FjWpXvAodJJmyAX9
	5VKOIjTRY+GVkGdr4TyAlfTxQa/6fQ+teDacIrpD4DCPzhtTbIyI43YmEFXHD+dEnX4DQQ3x5IiDy
	rx0BdclcCawKDKJ+SB9ZD/YJ/onTUC3GEWc7GHb1N/6U3VNer1lbMKvBb+IQ+nDDJ0yuufhPEbqHV
	R8Er2k4BOoR048nopS/UVgYJZ4En4I4sqpEQ5aYiqbg9r6Vlgm76iSsGGO4CdQTPEtNpvpf/vAl8s
	F/YpvSv6atTGr9OOU7p64v3ANcvcwt60pWrl4G+atygt+ROzXW1Ylu7PIn9Exl2KhQCkeb1BWhc9S
	H7M0Mdug==;
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm7i-0000000BnxO-1NR3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:04:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSWy4KnqyJWDXJMeM1gUY5+2n79jpqg8S79rcdYIavV3xFZl+Hn2sL/3KvaFjx/eLfe7qU9AzmfwKzhuESi1cvGKNhkiRa7ADcvFBiiR+iNAZ0BUKVWxR1L44zmheDg49erRicYdmj8DTqR9BHUiMPwKGXHvwZ96m+/dl/xIX2TNaRXBoBcLavPhiRhhQVsjvXKql6/0F7MCMuwdmqihy3foiT5SY7scHGQP2E9yhgMHZXGwDNzKtzd3Sk4X7APfCkQVu4bGWn9wr+oXaoLtZomCJKOocXOHPoSaF43xiCPwRjYZcPEFoF4aAQYezL/ceHc6bq/8uOlC4U9555XL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAlCbjUrN+BpPsVqqjJr3suHVnb/3Zw7R0d/PceQi/U=;
 b=xvxX0xePy1lrKhxcVju8oLHSR72FBxzPIJ72hlsMg0i7d+a+1ze9DUiVjte/qQAEXHVItUgJyjQ8cQ6bj+SQmEnxtt6pSgVMh2x3Qoc3EPjh+xawHwiR8Ta12hzWcXRgPJFN1GjuR/UAjzza1CEZqZxOOvKLZTB3KjwGHSFk8xMP8Sfpy7qjgz8/s4IxR+xZk9V0FcWkWxegjDnN85rDClCdaW/Ad6qpzZUBtopTmP+zEOYANVW9iK0HZnMTAKgBamYZwMUgY/ohuCdM6JHboH70Qf1KLOJKUnxpYGgfekR88NT1ll2zYoDZup/XUxV3QvE3WCZJEuW8phcA+Ha1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAlCbjUrN+BpPsVqqjJr3suHVnb/3Zw7R0d/PceQi/U=;
 b=QXs7YZ0xSI2yOApHnD4f4Z6XlKBRjwgX1NkOVpm1VRFHhT1iuvjYjJcW3QoYBNY7V6pK489OSUUdgyF9vKh6cVu5S2gOJ0hqMk6+DNzBoxBgHbdYfs7tRVzaS7GFj5y2Pwm/q48CJe6342/8pbX8xTaJbg4liB4Yg/EsPoU03etwVOzNgCYzKbqBGO912/reHedjVw16YkWKBJ791T6czJsnaOPKukPeVLpnC8iyZ5TWLN3vnPlFzr5NJMnSWx4gB6cCtnWusPakL4CMlb4JspSgRC8YrYvBDDJ4Wt7yZ94FhpuQ5lQK0m5AEdAQiQTg6kXZFzu/mJMfUuC3Kdpwqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS5PR04MB10020.eurprd04.prod.outlook.com
 (2603:10a6:20b:682::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 10:04:34 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 10:04:34 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] arm64: dts: imx8dxl/qm/qxp: Add Root Port nodes and move PERST property to Root Port node
Date: Mon, 19 Jan 2026 18:02:34 +0800
Message-Id: <20260119100235.1173839-10-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260119100235.1173839-1-sherry.sun@nxp.com>
References: <20260119100235.1173839-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS5PR04MB10020:EE_
X-MS-Office365-Filtering-Correlation-Id: 6153e36b-994c-4f0f-ca21-08de57422547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jm8S9axG0yMt3bIVJyruxgT3lSZnF7FJh5BEBRAiu/dcWbYdinaGGd5C3AA+?=
 =?us-ascii?Q?5HIxr8pvlJ1/A9dJXc2uIOB8a0CaAUdaErXobHHiN4X/8YJKpCwKuD/rtosW?=
 =?us-ascii?Q?ktm1Yavwj26rRpoJ8RbAhYKpNtbwJNmlFakhCB72xSXDSyF8/RG3jbTwihWv?=
 =?us-ascii?Q?JEWbC70ZkMdHQveV1ePzkjhuv4zJ9L2td+J/Js0n1GITZBijAfg4pKCDp+tc?=
 =?us-ascii?Q?hszIi2ugX10V1Vw8uf2YtzHnwLxCEbcvRL/4rdtja1EzvcIT8WRp6frp3Vi/?=
 =?us-ascii?Q?A2Yjj6fbWZM73s/Oqkh7FJTHoL+l2lUFA9YtuFmuhNy/+h/gtS7vpfWw7vtk?=
 =?us-ascii?Q?7q3B3hQ4fFHjElueonMWqdhFZJJxzGeDCNrcKVKTrSrNZ/apn2ZB33+MqcJ9?=
 =?us-ascii?Q?3p5tBDGSMM6/IODv+Hl5hmdu5EV9aFZA9f3CSgcbSgmwaShbumOwW/EMZsxY?=
 =?us-ascii?Q?kxvq4IYfpcfT+QojMDWJ4vtkPShbs6qiPitL9PVcjo/cBw0JQ/BFoJ6AOCTy?=
 =?us-ascii?Q?mJc0xFkGA7CljylE87tM/OxRxY2fqIGZy4KT3dfjkcCWFrio+HFF0F1T1PjR?=
 =?us-ascii?Q?VmiR7bLGwA5HuA9m4uHAr9sXIAfPy7AuEngtA5W1xliN5+Gp4Iy1x3aySu5O?=
 =?us-ascii?Q?MJg77tto8t/X7VoW4mQcf/adiwxhkeTVaoDv6YfwoWkfH3+fh1UcmhXnDdef?=
 =?us-ascii?Q?JIfMUfpb6UmrQNSO0CzloD4l96ek5zG9MGUtQxn0GFVRZ1zOVgpsFDJTP7ju?=
 =?us-ascii?Q?7qcwyT/CLfp8uU1f0LeMYjX+qF0PmGYShZC9Zv9U/8JpZVhjD9l+mn5QkuYs?=
 =?us-ascii?Q?HP8GNPpS2kuS0HNEf3POBiHzwidhkR5CVMgDbroN+rHtPG9UsduH+U1hVZnS?=
 =?us-ascii?Q?jAgCUVv4yTAmN23GJXurPjVhOSJTdN7KSKTbjud2qBWhOjfJ5iufxusMLBSf?=
 =?us-ascii?Q?S1L/7NLaeQFNIWCrHNvwJNAWQhntmNihz8NRIJD2Oq+KbpGlUnTiIFgZ3iI7?=
 =?us-ascii?Q?Pv+PnManMgqW1MNjbuSJz5X5QKJaUmcv2iS2Cw6PXkEb7g0kgt2CowX4117T?=
 =?us-ascii?Q?Rqwuaq+FMafhgxewNQoeAZb8NSSnjvEN+ajwaPhkfjgf5EZWbHxQGCjxIXhg?=
 =?us-ascii?Q?gpUmRnYHfIM5Ep/DpFKzqTlkHwNvWgys51IHVoR0RQZ9hKtzMVE4hxhRAMtH?=
 =?us-ascii?Q?JPxFfMdZF1m6rFPXeQI6eobqP6FurLDVi4LsNSCBreCbZlX7oyZtM0LL9y82?=
 =?us-ascii?Q?WXSyn2+Q+XUACLb51kxiYSFQWM+el+wChZBpaHhjtdvOG9sY8bPJcNsT0qv+?=
 =?us-ascii?Q?37lm7GzSo3+hj6Z0D0Xt435q9xqagLHXX87FmOPE1J3cXnC44KqyqNXLPeXy?=
 =?us-ascii?Q?mr6uJtQngU81LSGG11KRckAPTeolRHdb/nPFCiGCiH+anMg5m4DXlVXr7CC5?=
 =?us-ascii?Q?OWw8sMYfJq8WPYUonzGy5euS5KeaJL+VHI6E+g60WpGnwgGdZ+RfU1c5hmeT?=
 =?us-ascii?Q?NGx4mwJTYHHUJ5pNAb3M40gTV/yULEgmtaWavsRj9Xcrc1wi56TSKTRPjtyR?=
 =?us-ascii?Q?MswRDNMOhVppq4PAd8Uo+FLuAK/cgpFh3RjnqjN8t9tnhgOtQmkhY2PXbdbQ?=
 =?us-ascii?Q?ts590KRY+vODnap7V2OUTVgr5PgIK+SoLi2NjlNoqQ3Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EB9YRLP66iCpkzpsIJtL7PipZ5fBFcLVAvtw7zvfSxO8TRQtsDXWVdxo4uec?=
 =?us-ascii?Q?sKoY8LglllPxbEVffkat9mQrRbiPhix52svArvhJ/bvdS2e9Biie+TmUnldK?=
 =?us-ascii?Q?4W6Qgf7eP8JuWoVZFOzRyaLnR4MfqRDdF3sKIAzXbVOpB+SxLGDkMb7qqJHn?=
 =?us-ascii?Q?U5cXWb7eFhD2YzdasRrdJePpn3npNbKMSAhzOqe5Ewo+h1f7gsFeyOZ4WKVr?=
 =?us-ascii?Q?ykKkV2QW/IEj/Cat3Bm9fk5J8vx1Y2ljwacgKR2OnJWRRrf2hzaRFQ89sRjo?=
 =?us-ascii?Q?eXElb+e8TwcTkRClbpsg4pHZbkHeWYVffktbqx1AjnN0G56ZwCccJhimB5Kk?=
 =?us-ascii?Q?jISev8+LKiWpNeGLSDDTmkKAnxPLcCqs72PgXrUddmLuP/4Je7ItYO7cHHQl?=
 =?us-ascii?Q?8wT8w32CLawQpRbXqEAfW21gDw0jPWT/CUCjgToVFLogndAvJFr3SkgXhie5?=
 =?us-ascii?Q?XQW6lCgjJDtWHCspBLC/jNggxZ91uWdCH7BWY7r6/1cArO0kWigZyCrajU7D?=
 =?us-ascii?Q?uGZLRO8nXOnx77M4vRo1mMyZhqYWxnSHNVzoEQHTP1BE39HWd81HwLfAWauP?=
 =?us-ascii?Q?WiISlLr9Jqd09OXgt+MxeznRAyM2bY2DJ8+zzl0VVzzo9VCG4vsiefx3TjNk?=
 =?us-ascii?Q?1GkSxg9rlJufl3QiuBgdOvjfaKno9uuXvlvqKAIVImZIjmE1OFD0OJEJOJHA?=
 =?us-ascii?Q?oPO3dZNJ1RDMkOgDAJVNmOzDSwU/wjOTLCAvOtgLZofmdQ3tV3xNJtznrlXA?=
 =?us-ascii?Q?CVf8PvEjHinQ5m1L/D2eUlZaxTgHeiIwwRMvFIyK68w1WmB/nzjthezjcuJQ?=
 =?us-ascii?Q?vVG5CumzbW2FMIUILLtGQso728WI9t6wsdy+7riKQrbHlOtIoMstEiKVWEHE?=
 =?us-ascii?Q?Uh9fLPHqqqCdAvuDLQzAQuurcRqXv5W5HUx5sLFZbSvYbbf9k8OkaWv3uTcu?=
 =?us-ascii?Q?1kpZsbMKNtiWlavCkXd2sZtbj/lQmfyJu3H/yVHQ69YPjLl1pBxSRJU9nLX9?=
 =?us-ascii?Q?pqdEBcZCOn7kW6CR/oVvB8LZbaDTgBr+npQmsx4Ea7ojzuXXo/B/N5UY4mC/?=
 =?us-ascii?Q?g15zrYdDcpYGNDlYS6x/g1cQ6cmS8+NLD3xYx3DpP+h0r0uuHuxIpai4VwXH?=
 =?us-ascii?Q?eMPFquURHdh0Np0v94muUC8Wup1SKs4qL9L0Ncza88SXwpBV8vRbz3nftzbD?=
 =?us-ascii?Q?pd3uI7tKy1XVVsTl4rSVtXFLiSNRH7sXD3t1zAotHFXBuTO1mxhIOCFHs4TS?=
 =?us-ascii?Q?D0fhwQobQ53fiMaoEU/izVRxZL77QHmcq88VbRfwW25KOPqneXaQdxlaswqg?=
 =?us-ascii?Q?4D5dW5DJZmPMwf1nP6oV66/I4fyrO+s6PVNAp+dlrYGzqjCW24tw2dgaPL9y?=
 =?us-ascii?Q?Hrt8g5gKo792L8GkuvWMpzmwihRWP0BbHcqs2eDtS+GzcPMwdltr6YlHQOVP?=
 =?us-ascii?Q?V089OGCmJIbjsUixz3qZxwDM39HMAvfveo2w+h8DrKcjj8xOBv9xqE5Y9eXC?=
 =?us-ascii?Q?bYM5RsQnDwgO0glD+6hQDmuZ006XpIAwjhBYwlpk+Qr4w6oxji81pFYH2Y5V?=
 =?us-ascii?Q?4Wjgovsbwmf04FDjX1Vd993PmZAQ7wD4TeYB2nGv4/7P72KhqRVm1yV+LidD?=
 =?us-ascii?Q?gd1gcbTSh7M+5rpFLa/vRIGAnQsdmV/vrz/Xme+gayv2TcSsPA0kk22mooTU?=
 =?us-ascii?Q?f+0IwGYqcCDc5Mvm/kZxeGTUMeO3BezoCUg0w6mg1h0pRVqiGoFpURx8Yv+x?=
 =?us-ascii?Q?XvzTLtMwJg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6153e36b-994c-4f0f-ca21-08de57422547
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 10:04:33.9688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72add9/AaU5FCRtAmQuVmgdqzW72l05szhW2fy6gW2ZZOSVhP3Y1RAMK9d+a57YyJepusmPY8ZbmmcDSvnFNVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_100438_449721_0E34A2D0 
X-CRM114-Status: GOOD (  11.91  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port nodes and move the reset-gpios property.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 .../boot/dts/freescale/imx8-ss-hsio.dtsi      | 11 ++++++++++
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts |  5 ++++-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 10 +++++++--
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    | 22 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  5 ++++-
 5 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
index 469de8b536b5..009990b2e559 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
@@ -78,6 +78,17 @@ pcieb: pcie@5f010000 {
 		power-domains = <&pd IMX_SC_R_PCIE_B>;
 		fsl,max-link-speed = <3>;
 		status = "disabled";
+
+		pcieb_port0: pcie@0 {
+			compatible = "pciclass,0604";
+			device_type = "pci";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			bus-range = <0x01 0xff>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
 	};
 
 	pcieb_ep: pcie-ep@5f010000 {
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 5c68d33e19f2..63a655399888 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -651,7 +651,6 @@ &pcie0 {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	vpcie3v3aux-supply = <&reg_pcieb>;
 	status = "okay";
@@ -667,6 +666,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcieb_port0 {
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+};
+
 &sai0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai0>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index dadc136aec6e..f57d2391b0ed 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -802,22 +802,28 @@ &pciea {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pciea>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pciea>;
 	vpcie3v3aux-supply = <&reg_pciea>;
 	supports-clkreq;
 	status = "okay";
 };
 
+&pciea_port0 {
+	reset-gpios = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
+};
+
 &pcieb {
 	phys = <&hsio_phy 1 PHY_TYPE_PCIE 1>;
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 
+&pcieb_port0 {
+	reset-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
+};
+
 &qm_pwm_lvds0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm_lvds0>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index bd6e0aa27efe..48c29c2cfe8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -40,6 +40,17 @@ pcie0: pciea: pcie@5f000000 {
 		power-domains = <&pd IMX_SC_R_PCIE_A>;
 		fsl,max-link-speed = <3>;
 		status = "disabled";
+
+		pciea_port0: pcie@0 {
+			compatible = "pciclass,0604";
+			device_type = "pci";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			bus-range = <0x01 0xff>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
 	};
 
 	pcie0_ep: pciea_ep: pcie-ep@5f000000 {
@@ -90,6 +101,17 @@ pcie1: pcieb: pcie@5f010000 {
 		power-domains = <&pd IMX_SC_R_PCIE_B>;
 		fsl,max-link-speed = <3>;
 		status = "disabled";
+
+		pcieb_port0: pcie@0 {
+			compatible = "pciclass,0604";
+			device_type = "pci";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			bus-range = <0x01 0xff>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
 	};
 
 	sata: sata@5f020000 {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 40a0bc9f4e84..fdd9009a2a7e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -722,7 +722,6 @@ &pcie0 {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	vpcie3v3aux-supply = <&reg_pcieb>;
 	supports-clkreq;
@@ -738,6 +737,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcieb_port0 {
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+};
+
 &scu_key {
 	status = "okay";
 };
-- 
2.37.1


