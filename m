Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6D4EFCE38
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWdK/hTbLfjUylz18kPQgvwjoB3X7f3mTGgy//l43dY=; b=i1Fo429c9UB8S7HIfbLNT0g/2B
	tdpgcMLZYpqS33nZ3a9ARxGWsD20B+Gv8CLhlQVKvsgGa3bh4Owp/JqzsTurPD7mjk3B4zGdCLPK1
	2VDeWO3wZU3IC9Ltkx5HElMYFLY5N1ekchFDsHIMwHK9xDXtm4HMtlw9vXfdbjSSn2vsJJm04yW34
	EFitcyyWgH+1NsroLiQducVrSvr4qlNobB2JTYthgVIR2ThSpzdcsDSRMxxwy1h+wUJzKJEaccal5
	VgbPwTFfxLApRU5mtP34u2NOh1W59PXKzPPZaiGZYCYxfbDnyKkJleQkQeVi1kFnAQaiNkSw8wZ20
	DaarBWGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqXR-00000000FwD-2wJ1;
	Wed, 04 Mar 2026 18:01:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqWc-00000000Eei-3aA4;
	Wed, 04 Mar 2026 18:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oWdK/hTbLfjUylz18kPQgvwjoB3X7f3mTGgy//l43dY=; b=K5nmpI6oAtUN2bx35qoYvjusXV
	mNy/0pRMNNFJR6X6h16XDQyaHwLafNuTq5MU9nGUlPdimK+dzapCYCdUTA14x9/FPvrj9/RKAOmxg
	oBm2sIEP1LFe0fH5T+DBUze3ngapqDmk3GzB3BFgRnxzt/pXwo52ZMlEkAtdmpFTbWZnL+yFujWHL
	snpPpRcBOpFyurQnpHPfLu9VQtzBSEFlUglxoge3Uda/N8WRYiVm/ncUQ6dbZx1XV30YMV3JCk0XU
	KqNwn2MS46KnOAVPSFvV4zSlDG1bSRjb6va/mrm86VQMi8cTD41jrbSe6iYdCokLZaEl+VNY4Yg+5
	SxMexiuw==;
Received: from mail-northeuropeazon11011005.outbound.protection.outlook.com ([52.101.65.5] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqWX-00000005H8M-2ell;
	Wed, 04 Mar 2026 18:00:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8/tjs7m27W4kg/XDQKISa1uhC56MoVtyDXfCFgX2/usPoAnhCBTg3oXr54jhPqh9eq9wbpWPEeWKamJjA1drBynvVm1mNSa+jONRHkSIaYuXVk/w7IuJG8PsKQkcUDqkTK+vBG5qIAITFZzTufhynUHwVfj07UqZX1x4YBFRNYePQHL6I/IaeQMB+1cROYIlGPH5ia9CwOQ/aJFPD3Nvkc+beXSYgSRq3nCCYjvdxEVVR2H0QOTt1TRsxRuN8fC4DNiuJjtZByxdhnF8ko8KASC7MEh0KEMRIanLnKF90NFvV1ZZ2XGnSKIZa3nMIhB1whknefxcwhYcVC1ftIZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWdK/hTbLfjUylz18kPQgvwjoB3X7f3mTGgy//l43dY=;
 b=V1gWcfLOXoBqmMDWhevCDglODTGQShxoihoVxoMKEgFEdKQaWY/+s2qvYOUZfW9nBSL33RjwN7Zm6wbVqEIv1qf+pULlJTOz7t+ehNhsT2qDBXgoNIbev9kJsIiU7RUQl6n6rAsaLvou43duDxNH3IA/vrqz5PyLsqKM/4JKGFl/8jvzqw4chMrWXv3fe2PLINGr/YFv7ozfo97BYe4tOxm3eaYjhoazq7cSOUYzWWN1niJPI6NtoS+0DO3cwv+vIdPJXv77KWZ4y/qid0LlEyVJLLp7BgcM4um4FqEJ7iivtbvisIBtBkzgvOczq/PLJBqQWaqFXCeYHyh0WQ7bbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWdK/hTbLfjUylz18kPQgvwjoB3X7f3mTGgy//l43dY=;
 b=KO1+9NbabO+ygabz45rrl4o678hvjt5i5abloFAclklMeUV28kY9XzW+IzHtvSKjcAtF9N0UOWCyu5TOTlxn6t65830H/R/uqYDUedi7hcBSxH+uEkrGocwi4b3DDeqNRgB+KHpw4MJTeKpZ0vpy7KA7kD6xkXp5i6/1Ht2GlUozu9M/vKBaMbVIGdGKZxajhdEZopfzK9UYMvuLNt8qLdkYKJcTMLU75h7J+SO5aCxbU533KCwIpXUAgcclTD7H5P5VUuIOxHpsrefkEKz1Nhgqn76rW1Kc9nMtge5jzEBYMy84ob+GX3o6f6b+qch7cpWtyamPHMDGrUNeTVa9Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:32 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:32 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Michael Dege <michael.dege@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH phy-next 17/22] net: renesas: rswitch: include PHY provider header
Date: Wed,  4 Mar 2026 19:57:30 +0200
Message-ID: <20260304175735.2660419-18-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b3b9b8-689f-47a9-f821-08de7a17ed47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: dxVbo7t1Dx5GPcITiEGmely93wo3Mk2sHR1lAvV+aGhMy2q4XIwOrZ0Bs2cI6/746VanDh9QyGWgALKqpcAfiE0WxkIKzLb0pWS/1/6RVuUb1izbO8+BVgPGqLV3WnDg6tW9IAME3ZWUctobx2laHQ6FNnVp//pOy9/OGEQVQRlYCMRegsKuT7o+4tpgxZeK/0HwIYGpkfY7UyGCq4i+45/upMMiOVtaD6gpxy91OUgyeD/dDDpTYLptNrS9jXy58NUDJrODv6stJawNosAJfM9vM0UgU7JlMqm7X5s8DCDue+fbRus2LsDBiqbpzoC3jhj/LZqrtNEmqvqaoZ+bSWO8a7me5tSJlFQVz0hp3iZAqLzRPZT/seq/XTXaN7K+swQmJD+6Q5O4h8NZWWKlo4F0aAuqxGoHNtLRupxE0fsVpd1tF0CVG3R1/RMDSHAzYrbHkqV1lfwJyio34B98dQLb1lLFQyUQiM1ZdaFnjfG0jkKccQ+Pol99NWQna3XgXaqvXCygkiQB4R3u3PJtImICmQAAaIq5Jpqtq69A0Sjp0ORkmOErSNoOyqf2TX650EdxBvFrNNGxAmne2WpzeQ1TbkTyJCaf8VoJlS1CGdcA7wBdT37yDOQAVpJOcC/OrlBkY8k9FEJhUFpAkEiJklF9ghiQ80R/vGZBsf/fMnruXcknsVPhWPksGWpxeK/mNlKnD/KQ/BI5szRWEaAXbg71pw3hduI4wBPKjehIOiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QYFX3vDr/0gITb1XXQQCutBbu0JSNkJiPk66pmm0iKkkW926Ok+0YLyoJ8+B?=
 =?us-ascii?Q?mnKbLsB+v8jdYVuGOHPYZ3BuCfbx4UXYmkc2QevhSaNgK8Wq+qlk9s7TCMs8?=
 =?us-ascii?Q?1tWTIIwjIyzA4W7Kl8jRcbvNeTDwS+DWKctiZ3PN0mJxw7ZnScdWVqHvMfhB?=
 =?us-ascii?Q?+eCbAXtTEzxPljzXxQF+uDOsJllw7kZflRZjGjk6QT/Egqutby4ICypg0POX?=
 =?us-ascii?Q?C+qRMWvQtgdImbHxOzP5ATbaFUzSV8kbpFtDHtbUXgefxDUU1Nzo9xha/Hf0?=
 =?us-ascii?Q?431WA3eV41CAoNZwYi/UNbwRrSMUL55kft+TXRM3hiTsWsvB5hv3I7owOURd?=
 =?us-ascii?Q?OMXQFITYR86uo5TsWA1nLWetDWjG4AbOTUMlLQno02c1wVlV2bR+/O78Z/UR?=
 =?us-ascii?Q?mbIRC5t83lEIMXj7+kyoAaeJxAKgQ9LIH0hhEmamPLv1oFpA/Sy9JxsCD9Te?=
 =?us-ascii?Q?4CHtjO+dcsdETpWFudOz+A5DHB32T/TdDQEZ7SAk6ejMtRibWGPCIhu8wO/z?=
 =?us-ascii?Q?8yVShSMlXKEFCF6y8DIfvXqpxkfXnb5PeH/EmpPyIn42ocq8zg83R9C5EKl5?=
 =?us-ascii?Q?a5L+uajLVSIQF7TaXCfqQ9uudiwAhXFsYaVtbg7o2ixhFw0Pl8/TaQ4QaWe9?=
 =?us-ascii?Q?t6OmrXd/RLNwfyikC29izxnDz9reatUezsHjejFRzDS0ILF6d8k9npcfzEI7?=
 =?us-ascii?Q?R0n89VfPP4mX7SvtRPbUI5l3m0cO47FezX2v82vvbrgGZEzhnelDwTgp+wzl?=
 =?us-ascii?Q?ww0kPKLwKKIrlMN8cTaqQYD+QrgmsFIvCZqBSed+HVmSsXANzQhWaPxb+0ZQ?=
 =?us-ascii?Q?Pi9NOsc3ozqk2KR4yjvblFbbYjDnBNzyQeoFLevYPLRJZzeaemAFBkBKJHyR?=
 =?us-ascii?Q?0l51PKUhmBNYBN8xYxmW3VEy2lBGh2+6sSTmASC3uThRoqGglWzHdp0tlOiq?=
 =?us-ascii?Q?qQd5k+sB+YrO8Q3TA1uHhzouJC6n8VRYzo/b1gvBXC4w1HweXjFPebFQ6vdY?=
 =?us-ascii?Q?xLV4okwYMyf4x0RPfqePRmJIQnDAYQqslbBEnGjDw9PLlNpXjiBMoJkX3VBh?=
 =?us-ascii?Q?nQ4m5gRXvVw0JQGH4ZXHRuHeqYn3ev68B3W8gQySfb/SF2Y7AyWaZxjGLCzD?=
 =?us-ascii?Q?IJVaeO8DmGoeh1IKDasnk8DWJX+DvHe/OE9ptzu+oWlXEOay7blbj/NV3gKf?=
 =?us-ascii?Q?pV6/EQvAyIbYJuyTiYdK0kQQyQNX5cYmqWsym+Ok0Xd+egco1R+bhp24tk80?=
 =?us-ascii?Q?oaQu0yCSG6agSgU3rJ9RW5cdD1fmItU1OobEX4vQIzLgA8RUaFsZAac/NBeh?=
 =?us-ascii?Q?Gs0w3N8/h/RWPjsFFoOs0zjsaXXYxPmmFLCAJQtYQYwPkG94lp/55UeBAR0J?=
 =?us-ascii?Q?YX/vdu8P7OlJGVUD1IrJc/uGqCJvEOA/VNR2ZCZ3pSv7OBmGohLSKBYWSunc?=
 =?us-ascii?Q?vnAJAhhuXjxejU3cLP16g3NxqipbyOXGkXj4OICLPb2kU4JzrC508IF8sD5Y?=
 =?us-ascii?Q?VYdDwYElawquFartooEFXk8W1SLkxhIKON6ih/lDfEkky/VqjiDeTXHlr2h6?=
 =?us-ascii?Q?9UJ4X7LZBMHUoHz1MYM8Ia5tcL1M92dzxCj45HaD6vp1mJKpSgXwOKYj5pxq?=
 =?us-ascii?Q?xQHP5GyvCu5X7vQVNWGPCEcXGPn7zKiPWBV2SmdrcoxoP0uFadNfbbKpZZSR?=
 =?us-ascii?Q?M7koI0Z/LEucXMvgYku1DlmGIasM4oaMIqY/SB+F8OoIJ+2i/Xfj5sJFrVQT?=
 =?us-ascii?Q?YuxXuKhxQDSjKfkOMiJM8Py2ilv/vZXmtUmGW0YmSLU5Z1GdVLkfOdMJ8VsW?=
X-MS-Exchange-AntiSpam-MessageData-1: 55zn5mWwFJncX9bbZPNZ7es9AUyBKfqteBQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b3b9b8-689f-47a9-f821-08de7a17ed47
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:31.9770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USxNbekmGZOrK+lkiK/AYQJ30g6tCew4Cil65auS1+mYvIO0kdflyfkSduNNYXA2vnyuHau3AuixB6I06kL57Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_180043_171170_E6B6F5B7 
X-CRM114-Status: GOOD (  18.21  )
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

As a PHY consumer driver, the Renesas rswitch dereferences internal
fields of struct phy, something which shouldn't be done, as that is
going to be made an opaque pointer.

It is quite clearly visible that the driver is tightly coupled with the
drivers/phy/renesas/r8a779f0-ether-serdes.c, which puts heavy pressure
on the Generic PHY subsystem.

This was discussed before here:
https://lore.kernel.org/linux-phy/20260211194541.cdmibrpfn6ej6e74@skbuf/

but to summarize, it is generally expected that when a Generic PHY
function is called, it takes effect immediately. When this doesn't
happen, the PHY provider driver must change its implementation rather
than the consumer be made to work around it. PHY providers which rely on
a hardcoded call sequence in the consumer are just lazy and wrong.

The most obvious example is commit 5cb630925b49 ("net: renesas: rswitch:
Add phy_power_{on,off}() calling"). Problem description:
- Ethernet PHYs may change phydev->interface. When this happens, the
  SerDes must learn of the new phydev->interface using phy_set_mode_ext().
- drivers/phy/renesas/r8a779f0-ether-serdes.c implements phy_set_mode_ext(),
  but this only caches the mode and submode into channel->phy_interface
  and applies this to hardware during phy_power_on().

The commit author decided to work around this at the consumer site, by
power cycling the PHY for the configuration to take effect.

This had a worse implication from an API perspective in subsequent
commit 053f13f67be6 ("rswitch: Fix imbalance phy_power_off() calling").
It was observed that phy_power_on() and phy_power_off() calls need to be
balanced, and so, the consumer decided to start looking at the struct
phy :: power_count (the technical reason why I'm making this change).

This is also wrong from an API perspective because
- a consumer should only care about its own vote on the PHY power state.
  If this is a multi-port submode like QSGMII, a single phy_power_off()
  call will not actually turn the PHY off (nor should it).
- the power_count is written under the &phy->mutex, but read unlocked
  here.

The rswitch and r8a779f0-ether-serdes drivers both need to be completely
rethought in terms of Generic PHY API call sequence. There is no quick
fix to apply. Just include the PHY provider API along with the consumer
one, to keep working as before when struct phy will be made an opaque
pointer to normal PHY consumers. But this is a bad offender (and it's
not even a provider) so add a FIXME.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Dege <michael.dege@renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/renesas/rswitch_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 6fe964816322..132be5f15073 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -27,6 +27,7 @@
 #include <linux/spinlock.h>
 #include <linux/sys_soc.h>
 
+#include "../../../phy/phy-provider.h" /* FIXME */
 #include "rswitch.h"
 #include "rswitch_l2.h"
 
-- 
2.43.0


