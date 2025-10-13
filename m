Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971ABCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 23:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/DVX3J7XC1HoHEzPXDeLIMV83Vtl2eTSBU9DPAeXdJ0=; b=geInNx0R0DsK/nRzDrldKG5uME
	hH13ZtqWIqxJPAh1sA36HEaPaJ9T0gtmMAMsp86yRrOevtvOyqfe+lUoyOynVT47eFXxXCKdDb1Ps
	q4DFLKRH3PZQBrTRbIQLbHKcTXvFm71VptlB0J9s+RopFbU7jDp3HV44KT47GWNb8EnvLUl2SnQo8
	iyethlSwK5sT3KWaEjk3BWT1Kz97vQz4llDVhDGFvAnBVt9aTbIZSEQq0q9o6OMXphlOkILxSLrS/
	vRB1NQhrc+eOvy43q3ta4XbZ67oGKJpTmmxQVhZD7QrHncT87xIwXly9B0AVOUmlpMMNSPNUSUl+9
	6MVLoc9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8RyH-0000000ElHp-1bQB;
	Mon, 13 Oct 2025 23:28:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8RyG-0000000ElHf-0gbj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 23:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=/DVX3J7XC1HoHEzPXDeLIMV83Vtl2eTSBU9DPAeXdJ0=; b=EOt/RidRaVHlGnj9AbWio7hAfS
	dr06kAA+KMloMY8PiqNGEbbvh0TBHT/YsmlA3tzk2UW35XoS9WJe6D2sV21KCh63y8dfFOVS0wRZU
	ze08BXMsRtkOz/HC4wZHu6iJt9Aq/JjKSSnmxe6c4yTVL3ASUIOgFK7WYQkR6F0O6fv6nqwo/sAgj
	B3APp/3Sjsq4QQSCxtgwJ/FvIEp8chWHISBfob6CRsrMgPwfg6RV4XoKS4VhBFeo11AMNp5Mu3KSt
	AKnoe8W/oOvQVj5LQ1UZpNouRoqOZetGkINihdBOZ/wJi/pnBN3bWVu1IbNAbU4owT6OQyKoUf2is
	Rn8g/FOg==;
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8RyC-00000004k6Q-2Z65
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 23:28:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeLDrRhp/wMspnCZ5gC/c/rva8qdhcvYWFi5q7YqcdbPoehnUhL1ZSJ3HM4VOA6uSA9XefLlUge5lfGkUlBGK/9yWPZ8ttGfziDuOYSlCnxZ8vyR+aPIsBPaTD6yv0j+d4iCEiYOS9JkEIWORkVIqzUPripi0U1iiTrDo+Wuk3ENosmrcKvthEPLL20EHiRmD0JOX/h4nw0jBIX1P9MEyVGhJaS+oQ15sGibgdJ72GY+skqs6EgAGEYoCD3ehtnGokX0apCsdbBd37KMZOhGl+OjfqEX27TBR24PyS31LlnDTRa/stdLSqbVeA90yRyET98we2TNSDcP1kTs5+pzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DVX3J7XC1HoHEzPXDeLIMV83Vtl2eTSBU9DPAeXdJ0=;
 b=QljpGMDcxwapO9k83FCgvHEXW0Pi8RPGBp13hvdVUe5iJ5UatreLvQm9u5UCWph040YCXBK/JAQZ2vsIOOdauD36esUyWA+O9/yFV5upoIC6iOfrYGJ/m+XX3VbdLCrA9IbY87pN6qq0b4rzsdDyYKeUb6ds4RpECfthZs7q38F519bBIGEtXaV3MrmnX98RLWG2luE7F6QU9/Rx7k4uDf+FgKvPe0rnW9gJ+Q/2hD9gpca3IDGrGAf6Wdem9ByclFkF/NVjHE3G2Kl9CVqzOWPGq3eMNHL02aDjEb9mwPd+V5Ot7JWZlaOlShMWjOIZ70PVOa/LKD5etzBdX4Bl2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DVX3J7XC1HoHEzPXDeLIMV83Vtl2eTSBU9DPAeXdJ0=;
 b=YJA+ieOFS+j5hZsCXGL+q9y7TgdAldvupN9RAOoXtlM9VnTykXnK2Nvq32LVHu3u/vx0ZzsjvF/D3ALhTJy8JTLwkUzMhj9EAGUwPf6RfW8MdW164i4hcdvqFfm6opXk4h4YCW/agEOWh4I9Pi2Z4vzjT0wk+mPAiaqdIMmoqKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH0PR01MB7368.prod.exchangelabs.com (2603:10b6:510:10c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Mon, 13 Oct 2025 23:28:32 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 23:28:32 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: ryan.roberts@arm.com,
	dev.jain@arm.com,
	cl@gentwo.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Two minor fixes for BBML2_NOABORT
Date: Mon, 13 Oct 2025 16:27:29 -0700
Message-ID: <20251013232803.3065100-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:510:323::14) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH0PR01MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 5841d45c-3757-41ab-a508-08de0ab03934
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fYUuOC5p9y9RZefYZ3DY5FqpPu2cvGGLyWgyKeIhoGYgZxRFegIbohgA3lkw?=
 =?us-ascii?Q?kgvyAE5Z3QQ9S6QLIaX9r/PcZCz0aRXLrtUSIAReTG6KRXYbFRVH7yETvcWS?=
 =?us-ascii?Q?ZgJjeB/Lr5EYzTnEKY3dWs4n8g0MCAB4/uowXe148qSYBY/ZX7Ff/L7xR7YF?=
 =?us-ascii?Q?SbhT2P0seLtMdhqa2RSqD1iZxq9D0B8WWHYyBRsZ+rbt2vHzWGJaS2Lni8om?=
 =?us-ascii?Q?PcaOgHwpJb6rEEwmoXG9MRjqrfrarBSED8OFePfVmYU1EtvinprXiCETX6Pd?=
 =?us-ascii?Q?BTvoQ1hV5RgpnJUCVQ1IenZ1d0iTK4jcSHvnFCgsCLYTP45tz4B66pdca8WO?=
 =?us-ascii?Q?5kwkMy1ZxWauLUF5VM4bSrFIjbKvccxMn3uGd+PwhKZc3VVAls8L6LpudEj6?=
 =?us-ascii?Q?fQldmkKG96G5qDX4/lGDVpS4hzOcAtjyB2z/iiSxJALznT+KTVcQx7Ipep9l?=
 =?us-ascii?Q?WmaRGrV1HSn3+wft9X/gK594Zll7OdcvkbwJmSWkXXuXUeqLuSiSL3VKZoUM?=
 =?us-ascii?Q?B1UiFbcKzax27NR6A6cZ+xvRgAjHj63htanPcppkB+pRuQre2x1x/qxL07Dt?=
 =?us-ascii?Q?f+wx1y/yKJVKcbK8N4EOOcI9noIU+H8s/gwFLcwxb633KIgdLbxGqOIcGn2Q?=
 =?us-ascii?Q?9qnx1olDRMsAhTzZm3ilEjqfWNy6S1JLt1xjIXtkAzlqhS7c+/OZTet3ls74?=
 =?us-ascii?Q?eh5766J1bwJv0YJ6N3q8QRGt9XGoDktNoLa4/ZUvrvPWADaMHa6A8n0JKK8g?=
 =?us-ascii?Q?vnVxpPZR0ECe+4LJzc58JyuBwTbmKSBPeOKlePewQzDUPc/LgwAfa1ciMWRv?=
 =?us-ascii?Q?Jb4yYyPHtuumG0Hrw3dYHrKFzGEKSh40oOL0c58SqRwvdOF03scfNG5UG7dm?=
 =?us-ascii?Q?1NwX2Qwudh86IWASPwtuKNlbEGAQNCAZ1LwU8A5yu6z48eGXhZiJLGaUfYW2?=
 =?us-ascii?Q?iOnudljx9xQdRv2/PBg2N48lqihbEvW+kWfiGKwWTGm0sTG3oYV7vvaIcfhN?=
 =?us-ascii?Q?8+PDsbmlI+2DHpcKDKj7tqqa7qKcOGRu6LVXl2Am2zYy/ILHK1vanutJ+KIg?=
 =?us-ascii?Q?gVTPXXMQv1D/UNyXUS11afbKSYSdkX7/5BRgiwM1czFuJciOTjGDzrm5Hy4D?=
 =?us-ascii?Q?uDJ1KIIT0nyIiWDDT0yVw5U8GfQrIu5GasCLDIH3WDKrB6fRjQsVZtmvEhMy?=
 =?us-ascii?Q?Hlek/keIESb8Evs9MYS8eecNpoXJ42VCWwKB772ZfVwSDTwKNP2v7BjUf1CA?=
 =?us-ascii?Q?Uqjv83oA00icpTbOOPqXdMEN3+RB+lMz6Dr+avmPgf1cXi4If4KwWRRQqoWb?=
 =?us-ascii?Q?kKxJ5A8R0yRBzIpfBNfOnvHfHCqm8qxEAsZF0qzTRyyPgFpqMuJlZ3M87MLX?=
 =?us-ascii?Q?M7xq1LZvLmTfc9b6ctPWjlN54pECj9CEfM3ni6HoT2cXs5sxcuRzqt0acHqK?=
 =?us-ascii?Q?bHN/cCuTkOh7AroBv5ZQxRwycg0cLHAAXMnss5oXruIwR9sEivsfg/57QRZJ?=
 =?us-ascii?Q?AoPnLSDJDBzHOPHNZ80XTO8KGLFrXEArYjn9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3FpJgnQ6KhUBiYZ0egNcfImoxe/nBwmuwFRtktkjry8kX7CXIcbJV/F6UumB?=
 =?us-ascii?Q?pn8gQ/M5z1A4UzgRsUUujm0fGSg+gGHAYPJauHyisdPyHQoYfqgkESpvezSC?=
 =?us-ascii?Q?oYV1CFof08Mj4zya7fjWgG/s1cMrBnZc78biMCm8la3NwmXUwzZos2dA5yI7?=
 =?us-ascii?Q?J4CH2PPBlns/RJ3Zn/2fPiX6MVRK5NxGzWVp4JjFmZlMrosRSbb7HQ534rbC?=
 =?us-ascii?Q?bmdY22ej08iHWKiP1NRmRk6SY+IU5mGIbt8iWt1LfCGg162IZnCp3xF7i7PG?=
 =?us-ascii?Q?mXaejcIL33OZcevDrQVNxcMJ65aI+7rWtWKYgMJ/8Huyz96/fFHknu3br0p6?=
 =?us-ascii?Q?3TPTpxYuaPbiQRsqF4pWIeSywx7dgS4VhXfO2/7cuOWAdGFAmgL73b0v/MHV?=
 =?us-ascii?Q?znpU/+pKo2engUyaNi2soyWl7hjVY5GxXW3/lUtWKV6ksnnr7RDTXYQweyTu?=
 =?us-ascii?Q?dhBmfJw+prm5ckdpnZX2pkolwgRSte/pzU4vetUrGMses9QhdZQ2OJdypSqN?=
 =?us-ascii?Q?LUz/L6QmFc8BDgM46zgwDb0ShKdzlNjo5/FhKAHJVawMXk0yPcKHMuweJGe3?=
 =?us-ascii?Q?s2jNUZwt0awXikZq3Nw3WSiAHTUc1PYUr3zk5GtFFQlSt2HU00S4OnE8LHx5?=
 =?us-ascii?Q?seDpRp4TyWvHLhFa5lX7zhVIs6eIOvAYCubv6FJRGbFiUu0yKzsrfpVyjXdQ?=
 =?us-ascii?Q?hk8biI7DjJy111K1YjLcYuUgikamJ/s/JXR4PKHF+TlWGSTp8NIZyrtjKfwT?=
 =?us-ascii?Q?ntMTbdYvUFjkgj7orbiNsSpnSlHDEcSDKlmXzX4eio8ZEYiXn73kpKfVbJBc?=
 =?us-ascii?Q?tLVtHGFhFxMsAuTgjVOK/a89Lbs+6hmcIKSLrRAb6hi/T6T1qEew2zy52LH+?=
 =?us-ascii?Q?1tt4jWkET7Cy4TYkpQFaLZkU7il33P1DK119GeT7zpAbUi8r8nNQ5RNXsZ95?=
 =?us-ascii?Q?RGZ0gQSqsVd0lsiwr2qpqYAH1WTH4lO3u1oKhoRCMmMH0cTaPq7TxkHGQoR3?=
 =?us-ascii?Q?4RyhPE7KIEJuvo5nr4ViEDv2tJ/5ckXC107ByUzs8Etn47BP2o1T8nRrVV9K?=
 =?us-ascii?Q?lAyWS+xzmHiHgRjlHhhzkX8YpfVBEvxsnCLjnTONBxC95SSHEepo5SFXXoNd?=
 =?us-ascii?Q?TkW2O/nViZsksC9VBq2dyTqeg4DZ/+SxNX9QFT8/JBhel8X5X8/gzINDSfvL?=
 =?us-ascii?Q?qPOA84j7IPIAPKFGpiI4kI8mWnEGygeXRjRemhcZ32A7QjImW8dNRuziNwFc?=
 =?us-ascii?Q?UJToGv2JvzWT0Y5sUAL3TBj5PGgNHBpeEN9ieK12HoCLzK1jJ8QyzsxzLpip?=
 =?us-ascii?Q?jl2yLPFLE3A/VG2IR97vMC3UJC+Sktsp876MR7H52xfDoJmWdxYACxrwk6+k?=
 =?us-ascii?Q?reDB4xoA1DHJ8pmAOd5THltrSNN5QdanqhX+anJV+mzs1SoPYjXl3c1Z7Z+o?=
 =?us-ascii?Q?CA7zeOIhJ+eZH5kPYAeSqcgObttvfI5mLcacxUekUmmQjVVWEEj4s0hEAZgL?=
 =?us-ascii?Q?gpQH2+MZo7X/oYSAmEWkrYOytq4RYd3QvmY1BrQ7XiqBRv1B5pKxCeDN3bVZ?=
 =?us-ascii?Q?SSqeZbZg3wd9b040oJcRzAcHurwXoAfO7YWdE/KmOwdRLHzE8eAv6n/CZzFI?=
 =?us-ascii?Q?Rw=3D=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5841d45c-3757-41ab-a508-08de0ab03934
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 23:28:32.6267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LkNzAr+9Yu2lqskotQWGQ0EyIBF6oGm+H0bRh2UUxvyXk7MtLD7WFeUtEWoYm48EfHNMfkMOGwXPDPS6cqi890/1c2YYwdg+t6NtY+rf3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB7368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_002848_925744_FCB60685 
X-CRM114-Status: UNSURE (   5.01  )
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


Yang Shi (2):
      arm64: mm: make linear mapping permission update more robust for patial range
      arm64: mm: relax VM_ALLOW_HUGE_VMAP if BBML2_NOABORT is supported

 arch/arm64/mm/pageattr.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

