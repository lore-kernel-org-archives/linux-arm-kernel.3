Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB34C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 23:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:Cc:To:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J8nw1Bk+aSkucLNC98SLvwR+zCqTah52maugJYsl82Y=; b=x17bMhdLQpOjsbO8W6LVkm9qoU
	A4sYv0ri4Rnz2TvC0OSjT9Km8slQmbV9ebpHaRpGMa3prHS6A2IIOGTd7kXwphICkIc3rGLCUReCT
	uCJbYxLN5WO/psVKeECGkUoDS0cuMTPlznACyRn8jgia0x2mBhBsyxG544ii3dmSkkJz2nHttw8RE
	6JTgdQg1zLh03qKu7Q0k1NTdDAR66t0jEydRSUF8KKaB0sEeCPkGa591BOAbbFqi7HJRjIovGGkMJ
	Zb6MDJ7NehztO6LFqUXIJq3oXqY+kFycwGGtCJnHdMofcujZpAFHcRMT+fimyuzjmvoL7DqNTsxMC
	OtOhS+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnYS-0000000Gp9p-2723;
	Wed, 06 Aug 2025 23:28:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnRJ-0000000GoZN-17u2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Aug 2025 23:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Date:Content-Type:Subject
	:From:Cc:To:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=J8nw1Bk+aSkucLNC98SLvwR+zCqTah52maugJYsl82Y=; b=fh1NfPkHoxAmq+7hUb1rYD8gxA
	++/7cMz0QzfAfzt4KAIU/movhcBy5+/SvSnVG5Cu5468ELLG1sVGxqGGXGAhhIkrK0HZcpXouNF6s
	CQ/wOLU6+jvkcdqSyvscXp+xz0S1ghXuB/5G3V76azzwe3XHkbVDBMzl4ADqm6EXJZk+gpQcSnXO4
	zYKmXZZWSklO7OM3S98s/D7Azrvnq/Pe15WArOZDK4lrWIrx6EbLjp/bwcUdDLTK8mmDrGDmMGOL4
	4VlC8wp4R74RRt3WjlMCopZXHrsLl5BsFkosVEH+isV9JCiEF/7omSfgJwVyvWAGKyaf8i0TrvVSO
	CDauWGpg==;
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnRF-0000000ETDT-3lsy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 23:20:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsM/lhwtI00azywPQkqxzatBgyLyeXDv4UVIDkqDFDX7CZXhmHFujOWVvfIS0A2H8y58clN1/rORBtra5lYxM3i9CRuOtjNJ3lltIKi0wjz9dIDCfyTmjotDM+izfPwRm1iBSCB2kcfKNAV4+HH7PE6qbSjFjpA89LKktBfc7tCh/vLdhDG9Tt4iyTkeMJDpHQaRHeGKD9zoZ5+i+pSViN4/3KHnuK78L/bgvg9wPffS0MvUJcfShy2Vq4RBQZ/GHOSiV6zAcki1xVLeOK6gSy7KcG8kcfQFGNeA858+RiFA8qZ0P8/q/D1e6lilNSHOOZ5h5ZFWH+ojKfeEqZCw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8nw1Bk+aSkucLNC98SLvwR+zCqTah52maugJYsl82Y=;
 b=VowYPjRBxfebhTtsvA/kbpLh2o2H4DS0Vo+EAvqih01w10TTcpwju+Zub+Fj0Q2ZaSQ9v3gVnJZ1CrkJxuJj5k/YULevLC4Zs9BzOnbhQWjThh9oJbZE6blIZI+wMDFfgGmBdsodq8LIp+rfRnkMsC5dqWscL+5wMvWcH/yqJLzpXeozw+cu3JgcvmFBgHBrPNLBbVa7w+n3DrFAoNosP3DQiDrzIM+9vyVPCkzA57QZtikrbEOcZeQJZQB+YzKadx5n4gK5itUiv9l0HA2oTud8vpLBtjWCpy9rZHnEoiR7wuHzuFqKehMpKFYxn4OHUqAQ+Z0NcYeviKCXSDmPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8nw1Bk+aSkucLNC98SLvwR+zCqTah52maugJYsl82Y=;
 b=HwKMYK1Tk8fMWgzXGGYk3Ff2Sb6VE1Kyfap3XxYidH2n6OXnpvXFyJtQ0T1nx+BjOV9EiKDozk8WqkYVfDS6YjNt++goAfe4jMDoFS/SNOFiwqCf0lNFxXZBO2Y96SB4J656vpL6xx4rcEgcxxBPVyFfy96HgapAn/EE8lv66mI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB6910.jpnprd01.prod.outlook.com
 (2603:1096:400:d3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Wed, 6 Aug
 2025 23:20:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 23:20:36 +0000
Message-ID: <871ppodol8.wl-kuninori.morimoto.gx@renesas.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org
Cc: patches@armlinux.org.uk
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH] arm: omap1: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 23:20:36 +0000
X-ClientProxiedBy: TYCPR01CA0142.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e5e970-6502-4509-0955-08ddd53fd93a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EvJEzui8a2OWxMEdWKdtHeNFjdqMl9Ekb7dPu8EV0AxL12KbRNDdCH4f84eI?=
 =?us-ascii?Q?O/LEUi9RCqCA3tbm0+SVKXA5pSmS7l012LPaX4l6cSA6xjcFmf42R6JBiA6x?=
 =?us-ascii?Q?n8pC/oHCM5TNdguB2YYZMmRNI+a8VYXMf7+WN3Z13X8zsltoJLbSab2Bv5b7?=
 =?us-ascii?Q?GcAi6XbdX61bRPO3OZboeJcGucpO2h22vAXdxNvxk4v/Gi5oota/QmmM3MdV?=
 =?us-ascii?Q?k/bXLUNzcTTGXc7l5F0SsUahk53PAflIFiLS0l19Azx2SLUbpHXXfbwbfDtl?=
 =?us-ascii?Q?xuVHjHa+p/vk9mkjzHJYL1JHF1W6eDd4O56xYSZ19IUBrwgTFsgPou/r3dd2?=
 =?us-ascii?Q?o4ow4anFXXNXLf/2l2o9iEtqG77rRFZwOU+Xa1oENqyjEUbWvGdKxE58FI/e?=
 =?us-ascii?Q?M8Mj7CqmWNzLpLIzAT5xut//lxZGWKRiDMe4D+eqwW0SNt3GMuB+i5AtsfO5?=
 =?us-ascii?Q?mupAezo9ygEfwLSUp5Gj0wFSPHqQwZYEsLJFWATafn9gDrT1jUkZG3HK8xT8?=
 =?us-ascii?Q?4clXrf5DQpmj90xAhpHLl0JNLPP9jl4obPvS02njYkz07mfu1b4222bS3mKa?=
 =?us-ascii?Q?BkvLzh/u6Gp4SuDteFAQ/DIorCJY9I9ARIBUAh1PaRnIaUcBmJ/QjGvoCHZi?=
 =?us-ascii?Q?eE+zNYLNwGf4cnE6r/BVugQIstk2gOyaTqzommVLzNzl0bD35nFmOKEzd+Ho?=
 =?us-ascii?Q?z2iwYOi80UDmvR1DB4wmo7Zd0VLS3q80g6h07TGDHiBgeGyxE0/GJLuJqwu6?=
 =?us-ascii?Q?Xi3hm6QQPqHUzX6Qe65I52+yYOpnPnjMQ8MOmMVHbxKRErpULwKnGQWfdbT2?=
 =?us-ascii?Q?WNOTAwwWMyIE+B2khWWY91gROp60OJP9+E9DmmhbmwBokWf9Rxnpl4/mk/Kr?=
 =?us-ascii?Q?5akINNL/Tx7NUP9dy93uIa03IDvDAjzsJ+EIQAH7GiG1fA/P+BxM6Yup9APs?=
 =?us-ascii?Q?iVzEzt4+cbSUqqWeOP4mvMRKOwtWhdHIBFiUCTbEJTL7B7bbiqj1TEbRCZZq?=
 =?us-ascii?Q?mdomtJ+UAElu0FysvggxaMR4RsZwVZzwiEdcujFrQ7tD7/xtvOPanyEAGdrA?=
 =?us-ascii?Q?UgppOnSxlqrk06b//5LYJo4c5A1z2A8Rg+wdl+fL/urw1CiCpRhstB4jNNzE?=
 =?us-ascii?Q?KQAVzOQwYX2jC14tHPwaZeYdKn8b1uMbeavtNDsyqnSkZvA5rHNEpvwncwaS?=
 =?us-ascii?Q?gaB5sycKCLh3t/SBE6c+iWLekN6j+rAD2QLGBrbEBcZgsLcea9Bjtc21p1PA?=
 =?us-ascii?Q?NQMrWzuSg3TLvkp95EKoAYACIRtS8ni0clvZGNixRjGpcDxbn9TZ6Dw9aLsq?=
 =?us-ascii?Q?WI0+mzKkSQDkvoO08s6WMxPIO/JAOEtWHB0MmSJgUGLMJhNx0f26ZZe+cmei?=
 =?us-ascii?Q?8BOJ3Atc9lvsb3nmHHMr3lrbJiyoNyV7SCilPzbFOXDDS0veuwX7UxhZ/gd7?=
 =?us-ascii?Q?P3Yca2SaCJ+/tonw1rFEADwapr3frAnBQq6LPHb5zrJI2jZjFMzyVw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uKptFl52FTgwNg5/E/4V4WF2XTlKSJR7PACIizyANGRgnp4lxwMpDJimNvOQ?=
 =?us-ascii?Q?ecFc4el9r0WLsadl1hwdib1MTx8xzYA+u/64IBQktjoPoyvS8zGk78Qd4U4c?=
 =?us-ascii?Q?bmU+o0bv7IoQ+1kSM+wRllu69gWozINKcmbVH8me94/n6RzLjpMTmbWM4N/d?=
 =?us-ascii?Q?Z5fMi+Q3xzah8ojC9T6SdEQ39wCb1s4eC4H572D6Y3BMO+UhJTYGzTaF90wl?=
 =?us-ascii?Q?f4I2kjT6LDh19CNbtrC+VNRScgpM9SS21u2bI1udi+bQcye4BxTh4Vqw4e97?=
 =?us-ascii?Q?F10475W8G7xnPtvrkMr8DnDo+7lUquPaDHQcSiKQ6RMG7QkdMZa/qpvg2Ntz?=
 =?us-ascii?Q?PhLSaU/CcCOOjIfIOfjdEeaKdeZTyaFWflHqbjGifdSd6PflhwMuLPGVqsUS?=
 =?us-ascii?Q?zR/DGMCJevkbiVdZjooaBMS+bu3osmlyhCsR2wDaIcB2G4n4OBZf8K5uAfOB?=
 =?us-ascii?Q?ggnoVvVBDYWUQ3FYe/r+fU0qlVx8s6ehWDzgHOUlxfcMNoMuMxZlU4jn6zuz?=
 =?us-ascii?Q?ONeIT8TiPqS0sey44GHeroRi0DrCqfUAkkx9T1WW2d0Z7MRI7UwPo1q0O0DH?=
 =?us-ascii?Q?+fGiKSMG9JHpQ9v2g3KZJHniCBb1w4pesoF2Q3G440Cm2tPb+CJ5GDK5KZ7h?=
 =?us-ascii?Q?Q+aPzzKlRaTH++pOyygi9xMYOswkBXn8GZ68AJxFo68cDvePRh7eiBplUMzn?=
 =?us-ascii?Q?+ePpHZ5qtNryhZbZckj4LLmMtZImaJ3GvFpBfECekg/sF9/K00UaQFIkOtXa?=
 =?us-ascii?Q?9qm8khEVHBeitHXRkJIG+SjAGJ5zTijzpH73klV7TPXH+11EFpCVZhPC+9C0?=
 =?us-ascii?Q?srUsxEiDtoHER2hI2yJ/1MAWWftxIlAiebayJ+px4xy50RQXaRuoPp8aM2qP?=
 =?us-ascii?Q?74cIaTY4EfLbNSE7snoUM8801QeryompdTd/xExxfd5DRzwzq/z4sivT62hQ?=
 =?us-ascii?Q?4LO8lSxrjY4G75Fa2JJgm5YvZsf5oVyHV7aHwBo6JZm8uXcSywDtC+2g9tyk?=
 =?us-ascii?Q?Qhr0S0b+3n6irwhcfzESkYhAOR4j2tIQvo5GtLq+ydXcaxCkaMrfvZ02wLP3?=
 =?us-ascii?Q?0O4LvQnPYUeGB5N/b6ndoQlDaHPoz/tHbHxnVJApbhcc4q6/uS6m4PVsNYmg?=
 =?us-ascii?Q?K3OdezU1Hn2ny6VS6gxKjcOVgZu0PIiI4dCN7iNSCWer4m6klYjUCaKicJND?=
 =?us-ascii?Q?shQOHQLh0OJpDOdwnI8pWuOHXKRJxFjYF1MIgD5l24ynGwDyxkDWTFSgi1Mc?=
 =?us-ascii?Q?11/cP/H/BY8jUB8dKLqA87nHOho0hq3wLutoc+BakaZQxE6gxImuhKJsfTNy?=
 =?us-ascii?Q?huNVVwFYJ/ZiypCaiyu4GP83nFdsnuq9fVM1KCr0zjmCCR5lN9EuKCzQUleP?=
 =?us-ascii?Q?9wlwSCivQex4O8Sr29OYRjD6m3UE6LcLpsn7wo3fWahlewcUBscm7CYzet5j?=
 =?us-ascii?Q?+2QZb6KN8xLfRmgPr3n/1me5pF1k14e+hQNIdQEmd90SUGNFxorjfOUx1XCS?=
 =?us-ascii?Q?Xk24IoEqJ6J7ozExiCtMTKYoLkkz9YCpwAQFibqJHFxbFuZkuqMPligTlibr?=
 =?us-ascii?Q?QUvR+LA617fV+CsGFWNFNcV1flecXi41WfJCIxI/SFvksGKajtjVkA81po5V?=
 =?us-ascii?Q?sMRrK/Ksgn+1KnyFTLAO8KE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e5e970-6502-4509-0955-08ddd53fd93a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 23:20:36.2048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GRLxLJIwoyl6csRA4z/QelqiRPXBHp1+5KQSnoMtQ8IAWVhCitJi3p9IJ2NxM0mSQbMUFwh9HaeUaOv4EOM9PErQGM+cRluarEcSQgVl/nsZgXfGZNTGZrABGmYXQG/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_002054_427581_D88A743D 
X-CRM114-Status: GOOD (  10.04  )
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

We can use string choices helper, let's use it.

It updates format

-	..."%sabled", ...? "dis" : "en",
+	..."%s",      ...  str_disabled_enabled(...)
	      ^^^^^

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
KernelVersion: v6.17

 arch/arm/mach-omap1/board-ams-delta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 16392720296c..52681837ba4d 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -759,8 +759,8 @@ static void modem_pm(struct uart_port *port, unsigned int state, unsigned old)
 
 	if (ret)
 		dev_warn(port->dev,
-			 "ams_delta modem_pm: failed to %sable regulator: %d\n",
-			 state ? "dis" : "en", ret);
+			 "ams_delta modem_pm: failed to %s regulator: %d\n",
+			 str_disable_enable(state), ret);
 }
 
 static struct plat_serial8250_port ams_delta_modem_ports[] = {
-- 
2.43.0


