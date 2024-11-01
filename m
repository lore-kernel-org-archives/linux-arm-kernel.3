Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66B8E674AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFu8k5XEfFAMWiNmTVFR3yKiKPpe/MW6NewXVId2T4o=; b=UnhWZSav4Bybh48/uVcQTZ2myO
	uTYVJk9zTB/pi6yKD15JEyC/XMumRbyhvgMydius1LXhxrBUmhSMHpRMRvD1LwQQhjdweGRs2DKf0
	9H8XcmShjW7+a8vADWtXPlsUMtC45HgGS7QGeMG6NtlJ+UCgtKeQhnRoyu5SZFVQWgR3AGYIuMKsG
	BR3mSz4rXtU9xNbQY/UF6WrokXxepxlNbJ/zbkS1CUuk5fgrp2FOwgmGYT+DOn9/4UqnEHy95dEE9
	r07LxrLzdhNV3RtpovX/Hv0sE7fL/XVDk0nMasKLk4UexPZtm/tb9Mk2Qn2fomZ+elIxj/Tp0EdRj
	zQIGwrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ls5-000000064o3-2HbC;
	Fri, 01 Nov 2024 07:15:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6lat-000000061n1-04IH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 06:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tFu8k5XEfFAMWiNmTVFR3yKiKPpe/MW6NewXVId2T4o=; b=Evm0SBxcelkgTpkQyY30MbNO80
	AEbIvZ8BO92sXFR2nRRM6sB6z6QmVFMEaTxyBq0qEb3ldGtsWm+kzM0nMVe8pAcdRXPlL2/CRb2Zp
	PvRx8R81vRSIGIfv9lB92t8xH/uibPUddCoqhdBCHI++kyDvvP8DbCWyW3yRIjF+Y+K8Pj+dYlnOs
	koJMhiZYhC8rjTebOqcig0WyLnwrwCiTF9rzlJ3gpZmDpsTDvPykJpPXRVxOnTBcQNIZaHXrelCWl
	GtNlEWpT22p5vq4alPprbyKAORFzIa8tLtWZJn7NSx0QeHk1HZyMstGkGVT8tExQeteaT4Xcsubp0
	MGiSUKHA==;
Received: from mail-db8eur05on20607.outbound.protection.outlook.com ([2a01:111:f403:2614::607] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6lam-0000000AdEe-1eg8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 06:57:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ernqjTxBEgGizre9HD9Jg3mRSGy04vsdNf1+qbTCIdt2RGlFPhry4gKSIieUBQvoVFp12xHWjpo9S9TiblhiiXVnO/6sUcSZRxHhuxpk95T61kmds9/wwDMU8k9Ritzndncprx2NNFPFeieUJDlhBe46K3OMhafBN+t5mQRuf+aQX3icdB6VlZ+rHz8Bnz1br6xCX8y8bbNJfkCjlrwIUXEi5m64DPutwLDZ7n286bMCBq7w/a3VwSup3PQBg//hG+Bfvb4W/SVdDt5bI0iTXS0gARVDjMUhu2NPnBuNBgvlTkVKWmKUgdJEF5gnLJQ597rF5hUcHaZKSRVmEiWR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFu8k5XEfFAMWiNmTVFR3yKiKPpe/MW6NewXVId2T4o=;
 b=NvroZRWwm2HrBDZip1Cg7eXVLEY0itMhH1yipM7vmkRgUBInDol6MclYFvuLC95Qou3G7m5uvmdHLI60ZYQLMEzIqFL/lllUTroVuqibT8Nb+FyurgrDyvbTr5nUxJwUfHgMieDY0JkGKxCj7Emus654+KTaDE7uxlCfs0mvY07QjF7Y7FNI/Ujbg4niX/ZgZ6kBOLMU+XjNx8bILjeDjoJCogdmR0OHbTIgnHrJLuP42/u7+4N+FpgTIiLWRgjadGcXKkM2BJ1VVMZlisUgmA5Ij7II+YTdkxykX1RFZWGu9MaNOwiGJnCfuARo44Xqemms15k8v+VdmzP/AJCgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFu8k5XEfFAMWiNmTVFR3yKiKPpe/MW6NewXVId2T4o=;
 b=Ns7Q9p7WAUxFjb95k9dJRJfS5RkGV5KzLseqI1pnaDI86+BTC3Ak3/cFR8Knl2CWqbnh5Q2iz+azccsXvjNgV1rRk1V/5W4MyUS1uxzBUHpbkT1ne2gKKdMrTGsj43dyCwxDj32RMG3Pk/H0Wxk1mXUGRUpVg/ASpOxqSH2R6wXRD/wHQjUv+Mv89Xc6yuaXgf0PVZ5suEA3X3sOdDXcpI3fthwA4vfC+gjtBCk2gWVcpsh4iqv6BAEoHOzMrBpw2d7gALo6ZH2fREUzQZE94S9RCR0wQAh+U0gATK+BzH9Czq0L9VfKaziPxYZWyYJValcq45j2J6COZOjILt5X5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by PAXPR04MB8573.eurprd04.prod.outlook.com (2603:10a6:102:214::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 06:57:07 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 06:57:07 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: l.stach@pengutronix.de,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 10/10] arm64: dts: imx95: Add ref clock for i.MX95 PCIe
Date: Fri,  1 Nov 2024 15:06:10 +0800
Message-Id: <20241101070610.1267391-11-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|PAXPR04MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da5140f-cd67-42ec-168c-08dcfa426624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W0eUx7gMZh18g4eWi2icQKH8wQIbIiipvmlAR0Vp7O1nSqH8mj6QnlBwBnGi?=
 =?us-ascii?Q?qlGYDgPcEmdNi7U2z+eJmXc+MdBHyzfSHu2snsOlwpC5oA30P4qBny7ZLMgn?=
 =?us-ascii?Q?TEHy53lAqEodqB1OBPiSw+Tqs7upcF4PR5n8huGfPUGRW6gvUFTirQP/lsfD?=
 =?us-ascii?Q?hUDQqPZMLFdz1/mUH3mAGHieq6CvafSrX742Iez544agUXPRQ/iN4hG5Haf4?=
 =?us-ascii?Q?lFe6Ql4igkWrAK28PJTV3JsxJL7QOErKMOxnVIWx7GIj176krhewJzYPMh0Z?=
 =?us-ascii?Q?R72WW/1TKnDMjXViXg4HcU83HXFxVOFlN5WZN2yC0JN0JV2V69pM9A5wIYHj?=
 =?us-ascii?Q?QUJrr5PIRdSe1ZZYW+LmKRBwCwDQhw5eXBLG8hO4oc08u8CMMpdaFJ7pD5vX?=
 =?us-ascii?Q?hrtxNkZEtHA97XoSQV9VSaenmjlnJc44kKuDKl5m5ogKcNabGsZq/K1nv2dT?=
 =?us-ascii?Q?dzjaOrTgb84tFqTibwDaJ4UIUMkObZhwQ95oN13xeAj07iunkXlx+7G7zS9Q?=
 =?us-ascii?Q?trokLCWpwlgzvkM9WnuEDE1YKzjdKZIxGrp6ftNdn7Z2pjMDtiiyrpurUQhE?=
 =?us-ascii?Q?kluZsvgF6MvCV5cXq4Vr+FapqrPQECRxg+xl7LP1cPjzvGWjZhH165a9mmgn?=
 =?us-ascii?Q?+/fKE9pW9soSxvMXg0cZj/gYfpHSC73+hdk15Vx8V8c0ltvF2qLhbyS/TgII?=
 =?us-ascii?Q?BSd6CjagJSX2OhcxNVX0VfzdMXc+iDMhQyxAJmf5d6U1VF+erAjQPL0LyM7l?=
 =?us-ascii?Q?GBQOoIM+UHys7dkkP6R/kaTV/Yb5tHK8wMg8QjVmLnGdSGk8tUo28YQBQxT7?=
 =?us-ascii?Q?ZWUchduKUHACmL2MDps1DC5uYvge4zUOJSj6l3eMJ+MIKTO7N8ggJwyR9S5W?=
 =?us-ascii?Q?4ud2rpYnls8iVfb26gftFqg/pvHaJHqGDO8K/V1qDU9VWI7wvC66SKap/SU0?=
 =?us-ascii?Q?blm2eb93GSJJjmQ8/X99LxmmaUwP19ALlF1yOKxyA6tMkAAreqGItNFb7HSU?=
 =?us-ascii?Q?qBVxaoxT/Jp14UXc+6/shmCNx54uVNfECJ37pwruEVVzsrkyRyBl0xg3oci3?=
 =?us-ascii?Q?XRehNWkiwpoj2h/tY1DmNxhz7WgCxoD+SKqjcvALTxLUL4LUCclgXGSaJM45?=
 =?us-ascii?Q?OWUkKfv7HF5htfsNt+8q+833CO7WCL0f7ZP2G/0D/RYKTxUBOFyue3hhd/U6?=
 =?us-ascii?Q?+5sPasfzsXW7vslvYhXnBBorcWbuGglMziaryU1rwQZgCxMa76YVmXZ82XHa?=
 =?us-ascii?Q?CeorsnV8Dt8yw0MuvsbJmnkfFrgYMsWEWHILZE+nOU7QYOccIF/c3Cqt/nnC?=
 =?us-ascii?Q?vVoHWXbBaRON9vv2b0sKzJgUKVUQRXXECnJWPuAmBCQ8SaPd5QrlzGfYUlAK?=
 =?us-ascii?Q?dFe5U/UmlAfRQK3BuSGL7bIH/a6k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TgLI/XVTm7PNJupASVlPmVMu//JkJQ9LrvYb3EseW1NfsLvehviGKIdOiCDY?=
 =?us-ascii?Q?tkohs8HgzrBqplWM4ine/erVVpkuQEF5utrxY6Hql1ws0D04jeWP+PiRuk7/?=
 =?us-ascii?Q?jJUYm/bVm0EVXDjKUM/bu+RAmTsPb6kpdG/P9STLTbRYjtQGhEoKGHj4dfG/?=
 =?us-ascii?Q?EYbqQvc6NUB7Im4ELq6OeEOVpitLbuP+GnpscJb1gVrZMRtqa7J2MR0vYjNy?=
 =?us-ascii?Q?Nv4Guefs+gGoiWR+ooaeF+3pafw//sCm4DohBfwnSvgtOaBKvkY4uABxZGnV?=
 =?us-ascii?Q?5nLzcjdXjiHkJ8SVotndRrjm5Um9YPWguVadA24fJ+OOpfyRuxkTYOR9ogoO?=
 =?us-ascii?Q?YtmFzWwdmzwiJ2avsO7akS5yUc9Eqx2xlGyln4iBmAagoJoiI/dsDodtbpUu?=
 =?us-ascii?Q?D2rkcZKUF5SrDnXWBWBQ3PVykrrT0HCkoDWhYJQGCttb1/mCRuJ6hKRa+Tx3?=
 =?us-ascii?Q?ynIV0IAOANtXRI6Sh/b2WD5VucKX7YIR+Ppx1velyW7Q5Z3tyP7CYvgFeyHp?=
 =?us-ascii?Q?QAk6e/GvMDxe94IMjJfbKfLcifoJ8p5ouQRMK3wTm7/86Zr3z731cKawgWT8?=
 =?us-ascii?Q?7UvIOhqZm9bSmG8RZ7Pcx/iN6yDxbJo2F4A2EitQ63j4jH+TGlbLv0cI9BXL?=
 =?us-ascii?Q?GZeMR7JT4ZUJB9vebCUSRiE1aU/2Cd20XIC3ipp6fpe7kWukQruSAQzHoErg?=
 =?us-ascii?Q?Ih8nGdW5Mulw+yeVet67vFucnDARJqPz1pOdn9cWCHj0ChSsxEfXS4bUP3RX?=
 =?us-ascii?Q?HikDm5musytHo3JAIC5bM9Zz0bcB1tVocZV/3uXDCRsaN+iqOHNBjHAywN2k?=
 =?us-ascii?Q?phfPbqhYCjGkIfEg4lGd/XDyi6m5dywV55OfqLeTMMLF8pmaBAsN4bI4cGhH?=
 =?us-ascii?Q?OYGmcb6c78n4cuse1qlgVJRJRT84JafOjqAmR8f689Re1mkFExY4/hWfF8jZ?=
 =?us-ascii?Q?g+dubDBuG2APjh5arWu4d8XNxCV5EVMUoUvfMXAfTXijsXzB7xg+NRM5GCAp?=
 =?us-ascii?Q?cfOVmmkAGuLT0Je77WnjeM94SKo3zhqJ8zaDW/0yTuKa8lmJfbivuPzisK8o?=
 =?us-ascii?Q?yjkgBnHU01f400K7sjs/z7bAKzDU8Z8KxX47VaR/4pHzlQNCGPIJ/Q0xCIlC?=
 =?us-ascii?Q?NaUeMGNig/bXquve9GAtC7+3U4Ro5Lk325TUc6Vfcl2PUvkFLPoZYCtyaNiq?=
 =?us-ascii?Q?K8BUXe3zTEQBTnMGs9Tiqocql752aBFdfRU+YU+5+lHxklQ6jXUj8l4X8BwJ?=
 =?us-ascii?Q?ydYXhryfx6SSxDO5T/6yNwS0PvCEBuhpMuWja7p5sl/jBOMytNnsu7n3mRrt?=
 =?us-ascii?Q?/JOBnwViDyCJqb4dEz+FSWT7+B1nW7ktWqw+rAC1B69zaWzeFXBJBGwOo4CJ?=
 =?us-ascii?Q?qvE3muFwPQl5mzI4b4BWSmzzMNJqPrMj7/w4fGuafNJYXqCi5CvjQssRIcpl?=
 =?us-ascii?Q?8WlUo3uTH04BXzKV1W8c8qvGo2ri5ryHjSs9GZLG2FBv05qJEUvQql2TVC0+?=
 =?us-ascii?Q?j+Em35oyZVGmXX1/jjMqVhn5tM5KE58NZJ1JkNq8gbH75BCqY6XUFsYXy7+F?=
 =?us-ascii?Q?ls7IHDCPUL+GZUxlWdYKzGt3Sk8Qw6dckukWaomI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da5140f-cd67-42ec-168c-08dcfa426624
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 06:57:06.9883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHeY6IjiqcYiTVGa7s/WQq3CiXFfr0ATuixw55RNiCfs8pA84rOSQpnHb71XDlGQhVt0KBq4IVliP51/CYE+FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_065708_698770_2396559E 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

Add ref clock for i.MX95 PCIe here, when the internal PLL is used as
PCIe reference clock.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 03661e76550f..5cb504b5f851 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1473,6 +1473,14 @@ smmu: iommu@490d0000 {
 			};
 		};
 
+		hsio_blk_ctl: syscon@4c0100c0 {
+			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
+			reg = <0x0 0x4c0100c0 0x0 0x4>;
+			#clock-cells = <1>;
+			clocks = <&dummy>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+		};
+
 		pcie0: pcie@4c300000 {
 			compatible = "fsl,imx95-pcie";
 			reg = <0 0x4c300000 0 0x10000>,
@@ -1500,8 +1508,9 @@ pcie0: pcie@4c300000 {
 			clocks = <&scmi_clk IMX95_CLK_HSIO>,
 				 <&scmi_clk IMX95_CLK_HSIOPLL>,
 				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
+				 <&hsio_blk_ctl 0>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
 			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
 					 <&scmi_clk IMX95_CLK_HSIOPLL>,
 					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
@@ -1528,8 +1537,9 @@ pcie0_ep: pcie-ep@4c300000 {
 			clocks = <&scmi_clk IMX95_CLK_HSIO>,
 				 <&scmi_clk IMX95_CLK_HSIOPLL>,
 				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
+				 <&hsio_blk_ctl 0>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
 			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
 					 <&scmi_clk IMX95_CLK_HSIOPLL>,
 					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-- 
2.37.1


