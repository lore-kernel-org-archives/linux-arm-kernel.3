Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD45AC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 10:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PejrpZc6varsop1cHRE/jt9ptJ+hWT7Zfrw0Q6mJqMs=; b=Pcf/wBZDb+SD1neq94gYNlmHgd
	VMR/a/g8PQpPJQ/BOoiPy4FBaZ6UGNdnLJ3EUzOi070ANqelYd6oyMoBM7KaUc9nGHqF7fiY5A6Rv
	2gYOyfywdrhrUOfvHyfKjQoZPNB1P+QnSllbaw6HRj+9XQO/Ummz6k85NVSGhbsKBMMISMfUuaRhM
	05xQ1r0Cr5LE5bDaPAjzHtsTfob3kozESoY+jNWguuyw+0BibH4NjC2tS6GH0vLAaiUbUFCTLhVle
	KcK/zFZv/3zMwkLGRhcuqRSxbky4oWzUBwYmKVYQZHezYhAlmQx61pSokTuMARF+NOHqujyklUMre
	FQthpyKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIlnw-00000005ikD-3UNN;
	Sat, 24 May 2025 10:08:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIljf-00000005i8D-0c2P
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 24 May 2025 10:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PejrpZc6varsop1cHRE/jt9ptJ+hWT7Zfrw0Q6mJqMs=; b=i4t1zKLxjKpiWGvV301nU19BKO
	nsGYTWUO9xgtzkZE/yqVafHpMvTjy3ykLzRC5AGnBJ6ZaGJxgEr3PEOmsZtnsS9oopXUzP2pGq/Eh
	EV0wu9yBrxIiYA3+567BasqvpgI6qVpY6t/Ra2B63heyFtP2e3eMY49DCvMcvh/fvjvTstW0kZMam
	kd+rgaTbbrU7APGiMab9eikLmGEPT3TgCTmXMzCIMRjzT2mNc8rt6xEwLlTqrYl161i7bXLwq35Lq
	eIC/5g7Vah4o4WzCm1Gxn4TFjxqEqtB0U/xzgUPruYmWr6u1Fsb/FZzcoUHOH0SJ6QPbrKWj0kouq
	19Vc8Law==;
Received: from mail-centralindiaazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c408::3] helo=PNZPR01CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIljb-00000001RQ3-1RHh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 10:04:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqehe54qKJkOu4pIHBQ15Fi5hChZ5OmKXHdbO7dTuhmRJ/gCb8roYapWAJmjWke+ASHbPLxrKop66HCH+tPL5fymdSSrgLqvyOacE22PeEWIkKntXOjQwGQ+cmnHrk5gfsHeJ2cvZSPlLrkvEH1kHa5eeee0vTf6kar8nZ82DASvAwsldfInnAP5LbO49N22pqOCInPX9mzUo0lb/BofN19xqq8vopBiHRIOlkc9m9zoJg2w0DEdvAq5YiPPUAmj2hLlf5WFhsIAwdz0nIEjF+4ovyBzC/fDqvIkKuBdUOc9l6KTAH/wPzZiTb1izKJc84BOgaO//tUFQxWvu8d5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PejrpZc6varsop1cHRE/jt9ptJ+hWT7Zfrw0Q6mJqMs=;
 b=woOGMmlOIpVOXIcNqP8UrobQTkl5rVOLBeynxeagJ0L4aMBaajO5Uytjq69ITimDbr1vNcPs0aWnBKcMiojPNHPwVgtVcYEXfQBeR6iniXfwZR6hJ1GE7BOEU4PxnoXzEvdradUnwFLsxYxNGvmi+enfpRDojU7wX06AjzsuBgiliWcJsuKkfFVXHC+wSvZe3x5BUli5Gy/1N7BMyQg0QdcC0BLYdQh7EJwLk9doLMTynmBQYB01EvlbRKBz3IFcMyGUIs2N4Xi4TBBRcw5rjZkFhG0A3UBi2BjpzYfRv5ha/Ric7mNwAb48IrIkS9ip0vZsbg2bWcsInpXGTEl/RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN5P287MB4228.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Sat, 24 May
 2025 10:03:46 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ac6c:f2c2:8013:8d0f]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ac6c:f2c2:8013:8d0f%7]) with mapi id 15.20.8769.022; Sat, 24 May 2025
 10:03:46 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: alexandre.torgue@foss.st.com,
	amelie.delaunay@foss.st.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	David Jander <david@protonic.nl>,
	Roan van Dijk <roan@protonic.nl>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ARM: dts: stm32: add support of stm32mp157f-dk2 board
Date: Sat, 24 May 2025 15:33:13 +0530
Message-Id: <20250524100319.22521-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
References: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::7) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN5P287MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab2e250-3aad-4544-35a0-08dd9aaa45ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eyZQV4cToypTv913qJdIKn84kiBnw78lOQT9E3/PkT0DbkAsBKaeu8w6l4mQ?=
 =?us-ascii?Q?h9H+eTxk9xstXL5MWZq6p7KHU8P4bmrnKcwWmOsio+wbD7KOxl5MUidp+UZX?=
 =?us-ascii?Q?8+wbYMD7MZyYAUxdCf9rOupZ027cNCJvsdnGCCmGkB3/LA4ITBwQ+dnyjiRz?=
 =?us-ascii?Q?Mkbn26VHp/uDuA05kaTm9THA0RiWAvbIFsPsTqTDDBC1uFKraGMFlghcHsWS?=
 =?us-ascii?Q?qzgKoFWjDLBuF8mw+8fu3FQ1fDe93BslfjCToKbtUDJoHcwr1KB9m0CJhVJC?=
 =?us-ascii?Q?DhoIKDx1/q3pc85bfb3o8jLQs3BHQGkYxOlza3LBGcaO+iSGLjULJJlq8uj+?=
 =?us-ascii?Q?ndUAPdFIYUgli4b4yUG0VKKIMIUIq/ktWYQrdCSw85Cre4XLExIajKUnFqew?=
 =?us-ascii?Q?KXCPgfvKtg0HDdn9yGFazG7u80NNX/1/QvxMjgZpQWlVTWMeI1FeYa0zinYC?=
 =?us-ascii?Q?GYiRs0cOK9r1D52LqOMkr9BeSViQZgX13R9lpYs13Nbt8/o+PRwYBpSbosQa?=
 =?us-ascii?Q?vVh57dvbL3Ft4cYDSZ9XChUSX7A96bxS2vbnJyGrdkNmAohBAtaaoN3NUrc4?=
 =?us-ascii?Q?XYDYc6GMwofuFsnndfJELSIB6B98RwvuTKsG9QPyt0YzSi/SgoWjY3di0Fni?=
 =?us-ascii?Q?KxoDr6y5eKqfl+lxYu2XRPoiD8aWXGRg0VYQD7n/+y6L3fjLk9itTg1Gs8ga?=
 =?us-ascii?Q?4Oe3cObKGNQsmMwiplQ1GBt3AkPkMGhFzClY0Hy2LgSsLynkGuDmFXANm1uy?=
 =?us-ascii?Q?dfNWmab1rHE193gfjLjrcJhNrNG8xLqMAE5jI1GNIuniUT18KSUzkHzWD7NR?=
 =?us-ascii?Q?8SPFyZNlgQ4fAVJiPZ28lemQYdzAkKN/QbMooXP0Ua5C18HUStyYTk5VGq1G?=
 =?us-ascii?Q?3q8H8d/9QrM/ay63eshpyHcvYti9eUyOPk6D1c4ehto/BfvUcYjkZbempaMb?=
 =?us-ascii?Q?+qtzQVtWWwn0h406Kgprgyu7n5OCznosm1gsWnepqoPSauOBZTpUi226BdRx?=
 =?us-ascii?Q?X8a+gX1NANcyVyUOCr8NlwEQcD+Bx+m/+2taqa8QrO0gBX76lB0H/4ly5Wv/?=
 =?us-ascii?Q?Fe1OwEoV7CYkumvx9LtYrZzkEWG5mTmYxxmrNiDulYEz6CgmTvIUhw8e8MoP?=
 =?us-ascii?Q?+F7hyYfjE7hBijidAGgXvjCAYc+zUyZ60rbgZPY4KbhgkmDEC27vN8hIneB7?=
 =?us-ascii?Q?n2rIx0ErAmAh2pRWYb+0LHu6n9gmGrmG0eFd0ubcyX+6Xh2mgFwsyxBQ++Ld?=
 =?us-ascii?Q?uQcyHd3uB0+49Tmw8TkHb+nrH3c08plZ1aJIlP6T67QpxQ8wqWDZhFjeOKUm?=
 =?us-ascii?Q?LdsJft9ATIz157XuZ2xlVrPkzl42ZrXBW7AfO1z6lQwUYrXDk467ZRlzeQPH?=
 =?us-ascii?Q?3iKtKYz/DFKNOfjKGHxn1/QeZh/qxYbZyM8+aUErdibQxvNSrWg6AwvVYnSl?=
 =?us-ascii?Q?bOljRMxhPwHuCtHh03vXypp4rzYH+tm88WJjYV6dHduGw9pwpvefpr23z4Om?=
 =?us-ascii?Q?34BTQ26MpslHCuo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hHSmxU6rAX6tYlf8Cq4n6fC6s6pgBubjQZxmxNnLNz6Rwx9/UdVJDgzSPWRq?=
 =?us-ascii?Q?VJlF0/yFo5Sk8qyGrx6uQY5HJkzE0DYuOgHDBPJZpLsLkPtrPi3vd6nH8l77?=
 =?us-ascii?Q?6ISHFq034dzB/GUTkpUIJmLmMvpSUcUDcfSxLVrMdfiGJwo41griK5/07o2x?=
 =?us-ascii?Q?F3lZCQPXfri978ungpCRDMfvP2K1BHLr08YKQQvAIcfCrOHw5K/cCgM96/8l?=
 =?us-ascii?Q?PF4B2z6cZHxrNNcNse3bdPKopwbUpIL2cVeuUseK20A+6KdYyoPPplxvnMxs?=
 =?us-ascii?Q?f51UqHmJN+FVMaFexThJoPhiy4uPcaZtPGZswf/8rrPcS/kOCiw99Ehtvzmt?=
 =?us-ascii?Q?7/JhwMruXV9dVqoggcr1HAaeVduRj3QFluskGTAOi95gYVO9TnlOjGtGbURq?=
 =?us-ascii?Q?X1TRqYxZCRia5MmMozSLxFPo44zaHGuTtepIwRUX9Zl08NAqChv+D6zrvEA1?=
 =?us-ascii?Q?CH7UIrVZQXQGlrFYi8eomlFe4zwiAl77TvTRF5L9V6BWczfjQbYKJTjL3XDy?=
 =?us-ascii?Q?8osIVQbPk9U61IYjN28MZszn8L39fcLGTj/R7cm7ZYP9nYvC1DI/iF2v1B73?=
 =?us-ascii?Q?1Qdv5crDMvbn1EkVP51NB5YLLFDcIyZEhGIUpFy+q8TQo6nG0pyhJReKiixN?=
 =?us-ascii?Q?JIaaOyQm98sLURo2lbEud7feMPaOWkXbtaknuto6jk11VgchtZ12ieAJA5FA?=
 =?us-ascii?Q?bWCcRF/BN9n2Wm2A7FQZa7SWsi8VrmP5rh2bIQOArv/iU0t4cJVR6Q+YbSwn?=
 =?us-ascii?Q?7Olc/8FPUNZDd7mw30xZyla6dDAnFA2NBdVoYdqwvgW+l0aCSuV17GIWZcZ7?=
 =?us-ascii?Q?P9BqMNLeex2myjntAx6oNbyB5DlKZ5hETfj6qv19mmcNKhhq6M9OWaEsEGfE?=
 =?us-ascii?Q?Rf7GjxDuYNUn58ah7uDKhuetjZsEADEMu2ZAkBEn8juBvkNvpCY/n/uveIHR?=
 =?us-ascii?Q?p5QtlQZPOrEOM8gG3QK4FEvqZP7xVzRNRO78oD7okaSPO5D+pfM3l2MDuNgZ?=
 =?us-ascii?Q?58jnAZIEoY3o7u30O7hYKJsW8Sv4u25GNYCKFfM2+N0mF4yJqwPj4mcIAH59?=
 =?us-ascii?Q?u5aaZfKezmOKk83jHk6iIgUdAtC80ZWhTyAj6Vv6e/qiagIav/urdJYDDrCG?=
 =?us-ascii?Q?I2BUELTpNSwMx1zTqrcWoyan2RglLyaVaSbVjWaEDLjahdxiu6EZ2WJoLxVN?=
 =?us-ascii?Q?89by50Hmf+qb9zDy59BKbZKuD7mu25hnFFlLwhZvUMI3NjAtdJSZlpNEF6lS?=
 =?us-ascii?Q?zsloKcYpSuIPEcSkzLSapCeTN63JwyFa/bGG/2g/9+ZN7sVUyCgcG0fiUN6S?=
 =?us-ascii?Q?4U0L8c280DDBFTtsyCUYV6dRERFupD9OmjxeVlnIyLu3XGOF5RFE5VK/fKry?=
 =?us-ascii?Q?7kHOG2QygsT/sHaBM1e0x2h/ZMgOx0F/eQAZksxMeofitLerRjSVfqOssynJ?=
 =?us-ascii?Q?M+7Wo99EnaclZm7mRT5yLnqA1uxE8YnfK/w5MMwP2WildLAIteKERODbWfJY?=
 =?us-ascii?Q?bB6ts+t5hIacPe85j0cnn5Y4r27ZjCFv9Uat1M26LWbxV3t5N2l/4+jKTIBq?=
 =?us-ascii?Q?DnXvEzuBlbl7szEHrMZ568cFscAY7oQvIwVRuk8nzPeoLCqP/lE0r1hCNsu/?=
 =?us-ascii?Q?FnMveZwQU/rDCorbpTP405k=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab2e250-3aad-4544-35a0-08dd9aaa45ff
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2025 10:03:46.6929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMoPM7g1OAyqvRxrJLRABCDmhBylldtbNBgBaT2dw0Ora21RMpieRI8nIR5wCOZMtKBROapNtwtlcE+v1EBkzCc9vwkseDlgBMB1nBjq2T9RxbXVgNSuUm4erWSqqXa+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN5P287MB4228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_110408_085790_6705BF42 
X-CRM114-Status: GOOD (  13.55  )
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

STM32MP157F is similar to the STM32MP157C, so reuse the existing
stm32mp157c-dk2.dts as a base for the STM32MP157F-DK2 board.

Datasheet: https://www.st.com/resource/en/data_brief/stm32mp157f-dk2.pdf
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 arch/arm/boot/dts/st/Makefile            |  3 ++-
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/st/stm32mp157f-dk2.dts

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index 60d55516f723..38179638e5eb 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -70,7 +70,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157c-lxa-tac-gen2.dtb \
 	stm32mp157c-odyssey.dtb \
 	stm32mp157c-osd32mp1-red.dtb \
-	stm32mp157c-phycore-stm32mp1-3.dtb
+	stm32mp157c-phycore-stm32mp1-3.dtb \
+	stm32mp157f-dk2.dtb
 dtb-$(CONFIG_ARCH_U8500) += \
 	ste-snowball.dtb \
 	ste-hrefprev60-stuib.dtb \
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
new file mode 100644
index 000000000000..ab406b2c44c1
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2025 Silicon Signals Pvt. Ltd.
+ *
+ * Author: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+ */
+
+/dts-v1/;
+
+#include "stm32mp157c-dk2.dts"
+
+/ {
+	model = "STMicroelectronics STM32MP157F-DK2 Discovery Board";
+	compatible = "st,stm32mp157f-dk2", "st,stm32mp157";
+};
-- 
2.34.1


