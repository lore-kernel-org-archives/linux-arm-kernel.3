Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B399EF30928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xhLI8nUAaEAPVC5o5dn95EO8aPRidblJeZgYVfyjJEk=; b=rvhloy4vMZDS8STocYHQv+4D5W
	HmNmRoZ2hecol/HRwrINmLs92vWIRT26nWbgQ+uLhZIJFafenzXTQQnuan1mmO8WPxlRNGkpBvz9m
	VcZ+JPr+X5Vuw1CgmjKdFiXSLiSVbaHyr//cjQfjPZKQGQuuCFQ8I++spwgnXvA+4JD32ZYMdkbZk
	UpRZP93Tq9277srtBsM/Jga2py6VE3TaRhEqPNl5+b9Q/4/JTzBSd6MKlNdpjJPxvyN/FNVN+Z4r4
	MNgyNmvi8U0u8sLpNgJn/EcuwtRmhGV+ox6hvviMNvHgDLL+NUSsHBSZbXCkLNBTgbOHUwdESbEa5
	Q+qEN+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5XU-00000001V8U-0aWz;
	Thu, 05 Mar 2026 10:02:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5XS-00000001V4S-1luo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 10:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=xhLI8nUAaEAPVC5o5dn95EO8aPRidblJeZgYVfyjJEk=; b=trc93GxcZXtTVfRYSoqyWTgx2G
	nwFngk45IbqsWOb4ZdIdxePIk3PuTpqKEYb6KIJngpekTqPoaTMI6H2drV2+RrliPIfNQillPQ/wq
	HLmlhnjAbbkfRK0647Rc6UR28i0YBWQLX+KID0awYck4noZU24UPvWg6SfXTXj4ZHElSInAMeu9BB
	b7XBZkZyJNOGN8YAIMSNzyi7rhfn6PMyoyqA3vdRg2KOOlFYAktNlsovN7D8pW1TVN2BzJoPuzhAI
	8JWVPxHvCSKZcrD1vIQYJqk2NOy5rocvVXXBIFaJT+YtNMHX+P/undOtg/8fkzi0vqM5sGhz8RZ5W
	9FZgsxgA==;
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5XP-0000000EnY7-01fZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:02:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgUi76d4zCuBOSCX4cZQVawoMFuoUWhSsDk3iLuGUunlMaYIr4ENIXFCXH+jjyQgHeQoInGYPj9RodOMI25vqvIBvLCQXxGOLPkDFyWOt260xIYJtuu28jQdoHIVsKjv9IW2xCbJVFZ9vaeKYp1c2gFO8eRrg7tya9uNzcxhH5Kbar8Rml8mcZXIUxkny9xXjnySy+ftS9y+x8q6uk2eJit1pJ75kud4zxmwwoVb6OId3cAFtEzw7gACB1RWPQ8eA+EJSbSDejfOOmPKq7pTBlVM3YxPPmTM+fnSqLHWUqF3/jm2MhZsXj5LMOWrNkZD+ISgoPYnUb3U4eS1fuqL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhLI8nUAaEAPVC5o5dn95EO8aPRidblJeZgYVfyjJEk=;
 b=gEh0zUJJ/dy1mP7Btol0xpkfR2n7+Cdvw1fcnVdVXtN+9C2YOWOw4Vphi6btj3T8VVLe1HR1FWpZtMGbVjGsjrJ6GwwBgWd0ZJnttgBbnk9XZWgXQF6k59bHBW6qGaUcyP40bKUJGKjAp/8uyJk7JGmBEtpj20ip0fmm41j62jKRSjH53M4cI3AKfgs6gg1uVcoabNmhmpkdJZCDLNAKLrrki76TyAEMr7RM0fDlMeTuFX7BnER92w0Dofs9WWITfOxZwwcQm/kc5ZWsgsqxvHw4oXUdV+AuVrBh9QARGN5SPbRX2sImGHiBPqaYBTyGeFz3SG9o0JqlpxK4spCahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhLI8nUAaEAPVC5o5dn95EO8aPRidblJeZgYVfyjJEk=;
 b=GYU207FKrZhSBTGDmOhpn0Kd4I8dqiEIPDabxMb4emjgpNytTV3p5xwRqWZDK60P9V3ppA6vv90QOM3v+dmMGMFMOQQ3dqRhSEZwEDhRMHDAd74VkYNjfqYCU/pl6CaxihagOFsxBbCRqlu00ULjB2nxIdSzUUxd0aa+hGjSo9EePkWew5K0sO/lAihJGePoEJwV6zu1TWmuKZvcezi3UFt6bbFUOikGn8itTIgGLZvz0pblb8uDRNTSu47SR0tT5nG1q31AOmyVr2C55IxOJJDMrn3i4g8olUloKN+YDJ3RAh11cAhHrEaPjysbX6DrCNJsT9USPoF+q+ZL4gPRRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB9128.eurprd04.prod.outlook.com (2603:10a6:20b:44b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:02:28 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 10:02:28 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	benjamin.gaignard@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	ulf.hansson@linaro.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	m.felsch@pengutronix.de,
	fra.schnyder@gmail.com,
	linux-imx@nxp.com,
	l.stach@pengutronix.de,
	Frank.li@nxp.com,
	peng.fan@nxp.com,
	eagle.zhou@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] media: verisilicon: Fix kernel panic due to __initconst misuse
Date: Thu,  5 Mar 2026 18:01:48 +0800
Message-ID: <20260305100149.722-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::15) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: b3efc4fb-7e00-442c-d8a0-08de7a9e4eaa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 8uuzn7jfqaoiBZn2InAnGq/UKEvCvPF+hlNyQsD8p/WRZTvpqJUaH+dQoo7ds+3ebYjoz4xDWZkKOiaQteMS/ZFt3uDSkto2GKe9D5UH2BPm920450iacQSenCWw6MSCq11+1r9+OhEmYKtHCphwctFdoyX2tKmjBNH6aLnlIh6gTqVt21EEpEsmBuTykbLxbQ+fSaZoPhikLg8LZWKlcbJt2oG0ZNt5Syv9Hq0vpbhwS5hPPnAMmoVGtjbpnb7ET4XTCl2p+/RJ1+ug6qqQP4Hw7on8dMn2KIdBImCKNh3gkjF6IymRmCVgNXxRwW/nNMrLkwMZPAcRU2zgxU9iwcoKLRZ3qwi5EMr1g4nrjedy5HVOtoh3YmS60R5MeOeTIIE9EoWU8miUmzRDMkvg4ATkbvfSsJm11QUS+XnOs2cFjTtDkRnZdRhv4Q11DXS3vFOgnRy9hWD/v5FmNCKLKC6EN0vBQCOxG9v6dOUzk9V36HwGIouZmJ8XmKRlR+Ex0iUW/IDAnN9a+4SypYDXlQzx9cAIv4g/pMGy8h5ScaqMb1RSitY8obOdG++N5OhazCLEAeRKcjl57PImMvQQi3qdxAmMd8xKGil0Ov4HsvseLBaGh962o5HKlRyKuLgsJ2QaXEHii0waZXPN91Ca95s4/z5FGx2f9Xn9WQzf+0i7HwIMDTqSzM1XwXaaLDS0pKGNl0b1p1iNrAWahxuDONkgccP6FY+oUq990/bSyWh+iZkDYFgoOQ/6PI3ZCY7rGbW+XT6g9rskubGHsIpPEu8CTavS0XVJIszsE3kthM8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U+QVKa+j8T5XLIKEBOjO1c+sYSLRaNZThXsxG8j6XsCYeFKCB4iFroiwZbUT?=
 =?us-ascii?Q?CjSKqtbia+VjzXWLRitQOK3+79dboQpxhPE+wuJgGJ68WcwOy93LzXZCw3jM?=
 =?us-ascii?Q?T6TTHNwCuAOyCIwIAdaEjdhdNRPe/VBnimJtjlvqFz8OoilFTZ0Va1u9JB/o?=
 =?us-ascii?Q?gi1Sjd2m1nWkG4H36eN7ATnRaXeDGWWVBBFqjZruftIK0vB2waIfzWF40aA+?=
 =?us-ascii?Q?BXA0mvOkhmWogjwZGrWXfYagDVSOR0ff3wx6Qj73K4806XrHatuRsgS1qOgB?=
 =?us-ascii?Q?fCHAGpUR4e/UOfWLArHkuSLqYCAyCe9erT5rDfXAwCqWSGmB3YO5p7z4vb5W?=
 =?us-ascii?Q?ZXvUSjaFvh+7mQxou9B6o4NTD95W/BgSwGMeNN+rcodAdcel1rw1pGuElL9I?=
 =?us-ascii?Q?vIq2UVDGY9+xkSHQHsTq7LcfkRy9+XeeRg+3EFZQSJWU+VRxb2X5wAmnfG50?=
 =?us-ascii?Q?Hcw3lhQvtkUFmluEeXMUkO5bFvpuJcj+aLdCBocdb2aI9nerakck+tj3svwg?=
 =?us-ascii?Q?TEJocCTf72qmSGxFXYYwWut5RmOaZUksCcqpQ9J35CaNYU3P5Eoxny35jWBq?=
 =?us-ascii?Q?xKnPqaBDZGquIquUMiha7Xpn7pp8B0p4hQ3k49oChqgPQPyteJYUUnOJY01u?=
 =?us-ascii?Q?T/Ob18JHbqxpl3L2DcJ4EPo3gyuRg9PQ/p9pkBDxBuAZ118KJP3Ph5toNPzg?=
 =?us-ascii?Q?ebLqnJLyhokQ+P60F2MheTdTfLrRZ9x88ml9wcuswBRoAp/FZgMuylPKV7k+?=
 =?us-ascii?Q?LKZdaUyrim2cJDg+s56QLToNrz9ARg0yfjAQu5uDBGrAxygTiqYnsjSlo5lx?=
 =?us-ascii?Q?v6GyDuohOcNXQYf+fTI1//O+1MK1r4g17UX46QuwECJWxOTwvc4KDFYMKSJJ?=
 =?us-ascii?Q?Comlr1UVhsK6HajS4mzTLjO5ctRF+HqYd8qtiFmxIl4Iz1m4FSVWZKCjI7du?=
 =?us-ascii?Q?G/kjnIacoDbrhOLL8sQKCrKldKDW89VZSKS1qhTjUNEIu7JV4GBHfyDeAGri?=
 =?us-ascii?Q?MOVGyIQiDDRAOrwq18U+No2ic4uEaLvPl8ScRXFeipg76N3RlxGDNUs5LbVj?=
 =?us-ascii?Q?dLvxkNXOU5R0odfJ4QS22pTTSKXt3+0Ds8q3D6ESaoUspAKs3GwC+wnxa4JR?=
 =?us-ascii?Q?99EHyCqTCIvO5grixrqmqUtJaHKrasHAgrVBxB4zvb2bvt4B64pYTVdD22dk?=
 =?us-ascii?Q?f6jToxHFyZSHtCVHxUOn6Qyty/B1KekyNmLTS5B6aMrp5l33Kvgul12hliQB?=
 =?us-ascii?Q?/ZZBnhiAZGWO3Cil7GJxSaVHP8BIEQ7JEDuHXeTyayjq7QBnzgTdoHigti0w?=
 =?us-ascii?Q?Yjo8fPfKivDFmBWv/7UiuAu2LWJklbhT76s+ENfWH6gKTvwNHKRDLwPWkdCK?=
 =?us-ascii?Q?TAhsGJ7iSBNtP6XEbQLoy713W5hBvlL8FgCInqER0Z2zByZfXPh7IxzXCSXK?=
 =?us-ascii?Q?xDucB3EFrqjOO5rDX8TrDBdh8qLR7HD+0J3MwWma5N2+GfN5mcf4miI2gncT?=
 =?us-ascii?Q?KDE2vO+VXiPqkYgF+64QFm2FYdL8oIGlv80rZ6UXn4TCf4Ommj/w+6voPMK7?=
 =?us-ascii?Q?+MakKJANNkEUGlwOZWPXXDpt6Q6tiNAofqt/7x1knW1yiEqoj8H4SlHuwa0e?=
 =?us-ascii?Q?pac86EhhY4OdTw8c4d5W0va54Rd86HOU2DCmxh8I4jLjHwgBT94fxWD3Ka2D?=
 =?us-ascii?Q?r29xDq3aRJ19wkijqON0WXdtqIYFtm0tCXlne3e6UmKK8Wlt0YRYU7EXj21o?=
 =?us-ascii?Q?aLWYDNvG+g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3efc4fb-7e00-442c-d8a0-08de7a9e4eaa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:02:28.0097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPMQCLI+E1Q5SMGH0+2vJlwoDMIQ3XPb/vmmCQL4WJnBOfvuvZjBhIwkYL1Y1sYXk1gu5qOuVFl4hvY663OPHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_100235_056224_E589FC53 
X-CRM114-Status: GOOD (  13.66  )
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

From: Ming Qian <ming.qian@oss.nxp.com>

Fix a kernel panic when probing the driver as a module:

  Unable to handle kernel paging request at virtual address
  ffffd9c18eb05000
  of_find_matching_node_and_match+0x5c/0x1a0
  hantro_probe+0x2f4/0x7d0 [hantro_vpu]

The imx8mq_vpu_shared_resources array is referenced by variant
structures through their shared_devices field. When built as a
module, __initconst causes this data to be freed after module
init, but it's later accessed during probe, causing a page fault.

The imx8mq_vpu_shared_resources is referenced from non-init code,
so keeping __initconst or __initconst_or_module here is wrong.

Drop the __initconst annotation and let it live in the normal .rodata
section.

Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v2
- Remove __initconst
- Add missing Reported-by tag
- Add missing Suggested-by tag
- Remove comments of sentinel to pass checkpatch.pl

 drivers/media/platform/verisilicon/imx8m_vpu_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index 6f8e43b7f157..6fbe3c581032 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -343,10 +343,10 @@ const struct hantro_variant imx8mq_vpu_variant = {
 	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
 };
 
-static const struct of_device_id imx8mq_vpu_shared_resources[] __initconst = {
+static const struct of_device_id imx8mq_vpu_shared_resources[] = {
 	{ .compatible = "nxp,imx8mq-vpu-g1", },
 	{ .compatible = "nxp,imx8mq-vpu-g2", },
-	{ /* sentinel */ }
+	{}
 };
 
 const struct hantro_variant imx8mq_vpu_g1_variant = {
-- 
2.52.0


