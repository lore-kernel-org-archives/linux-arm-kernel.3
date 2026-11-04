Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC85606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 04:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vs+3X8GQ;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=EBR2/y3I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BvNNTtasCYk6I+BVqRmAXflYZXg8UhuCssGC0KauM/g=; b=vs+3X8GQ5FQRpk
	yNpZpstjlxi5/DKx8IGt9yCTaK4RNv/tLdg+qvEq7Nfi3kZA8rRQgxO9QMJ3Iu7cQ366SlWWSegKR
	fnKoPQypcmT2L1URTxzHaWjft9BGmfhLWWMKBqHSg9KNqC+rgYON/kOS+C+UeSb9S/7QU2t9/PY7A
	4gtFOU8Tm0CKwce6AK3lLNjXfB0JVQEtVpnNoIJQ/xz/RX3yrGRU/STVj2HtIIa4u4YRzePRugKMX
	JsNImer6ubgm+/UoTcU9AnrLjnTAbBiLhjCa7/nxMnZT5hsvgLaXQgXhAJiBbfUaL7m7YhZA9BPPb
	qDnnwZrxYWxSLaTW++SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOSEy-00000004I8x-3AvM;
	Wed, 04 Nov 2026 04:04:48 +0000
Received: from mail-northcentralusazon11013049.outbound.protection.outlook.com ([40.107.201.49] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOSEw-00000004I8A-2hBT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 04:04:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGjr+qwiIuPPikPozBzth45j3PGlNo5mzClVRnpYcMXlcU//oDOIXEntU1+X9gTQzjL+fXMYLBMyj7GHNSx9+YB75Ur9RVCzmfOqYnZk0dgnU04+yEMy7kPk+vRaXNzKu66IoWAJ/GMYr9iCXi1XJKkC7TsCTon4mlH54FoajkQt9RAq78T7lVeq8K4hX1SPKDhjpwOeD8EuOORKDk9+QLNJOPnZGxPYohhOABaI6a3lmAfMGtusFLrDrSpqzFV65FmacMscEYqJVx0K6B2qiUhbFsbeE2Wzgy6s6QHIMVbgfyJJdEkuDOoN4x57sgYzUEViPmHBxFRK5Pgy0ayIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvNNTtasCYk6I+BVqRmAXflYZXg8UhuCssGC0KauM/g=;
 b=vjoAQPAHwZHh1AGoD35guHGHhJWCbiQCquzDJJUxYS9KRi8Tp/iH2GYHkqeKBl+s/5jGmcoOARywSGGjjmGnZuqLHqxlh6W+aeL3l8oIADYVgu7RJ0HzInHe1A/M6HusXNZr8xTfp93GBGzRhjC6dxvqQzSiNS+TcA5MD8IManq1wbtPGcZxUFlITDaC3sWvKVdKRAeSAINGLEPHSiVYnmogCwtw3PR3ZUAO74OJAlidBpcn3S2fv3KTbFgj0zPQQqGoa7wsHbSaJR5cgSkDCll5dcjvoghymEt9lwxdGvkGftfRJ35HswSx/SDNM34u8mfCckQzGsVqzfdEua2T9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvNNTtasCYk6I+BVqRmAXflYZXg8UhuCssGC0KauM/g=;
 b=EBR2/y3ICN9hhkQQnI7vSucVYoqSvA/13N7GT9sRQwcaS2xlvIQxUnK1ZptWaF/NNo22k9NKu+tfFegQwXUfAae72N6uPktmLzTAykTy/9ewxI7Z4GQ1cFzXJ9r/e/0qITL9AXk8Fm5ktbibDAJYqennZYyOIqB5Nvg/0wUJiJjRHbu3N7rBjVN2jx1tssUXNtUlB+OGH3zQTXmAYpbsf5UoRcmQDqCGeRIN2muUAh6MWiJXYDgPLSMPLmgmNifajdRFT77dDdY2XAeVLIgDhUGcH1TClv73Ettyx0XN2+A9nf6a4tENkZ58/OjN4E64zhuQgGyoVjBxQ3g/tfHI+w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by MN2PR03MB4958.namprd03.prod.outlook.com (2603:10b6:208:1ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 04:04:05 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0569.010; Wed, 4 Nov 2026
 04:04:05 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] net: stmmac: dwmac-socfpga: Add support for Agilex5 TSN GMAC with FPGA converter
Date: Tue,  3 Nov 2026 20:03:20 -0800
Message-ID: <20261104040320.18077-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261104040320.18077-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20261104040320.18077-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|MN2PR03MB4958:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3fa316-622f-4a8f-538a-08df3a28aa56
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|22082099003|55112099003|56012099006|3023799007|261102123227099003|18002099003|10067099003|261009223027099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|11063799006|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: zNi+Ao2pz9AtkwEXdl7zV7hldLnTPf2otLtBg9M0BhThCqoxkjQn6nNsLWCB6816FhgVn4scBj0BGE1FhKEATSkxpn/qiYwwpvOhq34BW+svaij4Cu5+ly7zRBKStQgKuH6zwj70J/iq+9jd3yURbZpfXobEz6fIxwAY6nPS0NfdwUKP1iDoGxPNh+bcMGiblHWA6huBvDt/33+g25g+UMii3P4vJZa1v/xl0yekBToDHYX5a1J++i7LNTxiiEP+6YD6HzPjp2RUCuhCnpDq6FsLaRyTDr8yimV3ok4c6yBZtZ9F5c2xzln4fuXgowxxq9PRnzQhDetE2ssWuHk8fF3v02r+8erdvvSy9TC0T+EiN5HBXs9dyW2VtdCBPWYh3FId3UD/172I2i5X3pUtifX7Ya8idqSDjrFhSMMZVuNT8fPN6eVFj/YnKgG4Z0siOsf6Qhw3oi5ETiBTNSNh2NTf6bkPVKkjv3swuzlzgf6VM2fsbsXJpGAKe4TIb3H1yJX1ZX6BjVcUfKZqAI920CSAxZ8/aVa+5FQIg0574sXE7DNtFOKh4yMyzuEYZkbS4fYx2x2Jk3WJ9Wq1kz4NOcaj2G7QVtA2iq9+o4daCSJs7oTgnNPdoRGR3sXNY7mMEMp0HCs/3R+nMv3MZ0PsvJ28eVvNud3vr0uJtBZCkYo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(22082099003)(55112099003)(56012099006)(3023799007)(261102123227099003)(18002099003)(10067099003)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(11063799006)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cqbcoPgemKUAUsq2b2JhI3nlkm4o55tlGrgrfnCJfP8iHBggs83gAuJgRu+/?=
 =?us-ascii?Q?Logyd5HnpE0g8Xtv+1WO5L0G0C5uEDIUjTeeLUsL32/3fqtyw3Cg6a+xn93l?=
 =?us-ascii?Q?FyUvZdvF9Gn+3yM54/SZGx7RA/NOUrV+Iij2roHbw2QgYYZ5husBkxndwEhA?=
 =?us-ascii?Q?ytkaZTyZQhGs5JrCTUoT0O1BRXD+j3dToUVLRSv9da4mtESkxc8nCKhVwAyU?=
 =?us-ascii?Q?tgjGPQ1JTZiQOKy12cK/ix4RtME9XdbCktdEdlW0v8ep+gZgN3G79LqlSqhv?=
 =?us-ascii?Q?RS7SUMrFeA5/gLlzZ6u4IO99SuU0PU+LGPS/XNa55i8p+ocUUc4A9JYyMO4U?=
 =?us-ascii?Q?Pmu6NQiLg/rUHyEBCO+ZGS5BNVuAkFhq9vy+ACpPs0Qo6AuwIVAgGtk22J4Z?=
 =?us-ascii?Q?oWYyMJu9/QjHXXxItmYz9i66/NxFZAnzZ1HDZTJMZVlWRWQrjIy/bJ7va8Q9?=
 =?us-ascii?Q?x3bkIjO90MmD19o4IO95CACo1i08l5x46qKFvopFAYI0RhRK96708OTMXqm6?=
 =?us-ascii?Q?9ZiSfAdvtVjyvAkLlG14hnFol9u2DQy51okzKNgfGH09azUdIB0/5pyZVST6?=
 =?us-ascii?Q?wMnqCpBXbgnXWAMyBA2pbShQXmHZr4BlpzOFeQ+edTD1+CDSW/9dsW4mRg57?=
 =?us-ascii?Q?A7FFIrvf6yhh6hvKzEKcWU5v4UrygY7nCW7p+Qxf5Kq+n6UKVVvVuRGE2F8V?=
 =?us-ascii?Q?Z2A01qDQh0p6W9Vdx5IpkmzFJxgwfp1ZGC5Y5jfZkHPGOYsu2TmiJkjPO/7L?=
 =?us-ascii?Q?BUSS19UlfQ68NE9KHMxTQyMGjIlgUX21sulMcLy3Kvov0i7AEmoGoDK2RX9W?=
 =?us-ascii?Q?+hzwKN7m6Km9C+QBHZ1eJgPb6oZszLRvAs0NtAoEuZfEkE3YGZ8x4o4oLGvv?=
 =?us-ascii?Q?8NaVri24tvNvtLH+4eHc1xdTm/dYY5CqLgO98dDk6oSx34LDpKnd+Au08Wde?=
 =?us-ascii?Q?OSYbDA4Xcp1MaCBsWjukLx4i0QzxaebySyuAdM3EzLUh+5/MinJwZ5KjLa/B?=
 =?us-ascii?Q?jpy7ui/0RUIZ64uAQ/7UglbLXijH025Z6Trjbwq43k5fpf9T/sk2/6q2mzjY?=
 =?us-ascii?Q?lbdP8K4r+QFPyW0v4uBPWVkPvkNSCLIRY0kdsx2QBDZzAPODFyF6HGiv/9s/?=
 =?us-ascii?Q?rrjRiol109DAPaGzUaf61sivUdzRYCa8EE3i7dcs0nltK3TrbG2SOyH8BuQm?=
 =?us-ascii?Q?olJ1u7y5RsJl1Eswxqz0Tuwo2fgW1ZkBIuS5dYgIf6bY7HZ9Jpl1ej+Kcrz4?=
 =?us-ascii?Q?AavnJCozRjkyj/8ZXiIG5NxXP8WBJVVpjj8Vsa2ZUdKsDoOwt6ll6louW9Cw?=
 =?us-ascii?Q?n4XObVNTQjvUnaKU4LvoBL+n5Nymd1mdNN3ngVWt6jhl1JNT0seCFpjiS8oz?=
 =?us-ascii?Q?asJm706nARpwK7f4mBSBroSBUxFr4YzMmrtCWgC6/0B5mrE+MGhMA8ny/yS/?=
 =?us-ascii?Q?G1/+gp0Opd1tANb5c1hOTICLy+INnLaWkQ8hgTjrqlarC0YQVue/RM6/sGI0?=
 =?us-ascii?Q?f79QnLKTn6jEtLEZ2h0/CoixOjfz5tVH3jW4W2g3IyIslFw/UzCRlhosQpR7?=
 =?us-ascii?Q?miz9uAjR89kiz2iy0Tf55uExHLkFL433iyHORmiD1ZyeC8zkg/t3dP6i56ip?=
 =?us-ascii?Q?xFhezzvScQMp8LIRwwToUaHJw4ccVRi4NT+WY3xRwePqCSTHORjJIQBR8ePs?=
 =?us-ascii?Q?owBF33tSB1ALCVzbgwOVVrugru048HxVhwbWUX7BI11hRW2QlboSrxSQ+fCz?=
 =?us-ascii?Q?XViVmZmvaE2BZ/3I1mFb1XHgSLpyJd7yUlKNsN8rHBEVB+mBUdqxZMZXLifK?=
X-MS-Exchange-AntiSpam-MessageData-1: GNL4DZ7V4exYug==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3fa316-622f-4a8f-538a-08df3a28aa56
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 04:04:05.0268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETcxXLrg5rJtbly0J2kcQvEYDBiUT/XcX93P5qdwD4MXuJzQL4Euw/S3cnu8eQzvznGlZu61wTbWeoQvXNRYdt+k4oWHgbYkfaeTJy0HRFics5REW9NPbnEx203w0PltGY6kyuJOwhPvhWS0UA9sjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_200446_709403_6B9468EF 
X-CRM114-Status: GOOD (  16.92  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

The Agilex5 SoCDK TSN Config2 board uses a GMII-to-RGMII converter
implemented as FPGA soft IP between gmac1 and its PHY. This converter
provides the RGMII TX/RX clock delays, so the MAC interface selector
must be configured for GMII while the PHY is configured without delays.

Add the "altr,socfpga-stmmac-agilex5-tsn" compatible with dedicated
match .data ops that extend the standard Agilex5 setup: force GMII for
the MAC interface selector and strip delay bits from phy_interface so
the PHY is not configured to add delays already provided by the FPGA
converter.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
Previously patch 4 of the v6 board series; split out for net-next.

v2: No driver changes. The netdev bot's note about rewriting every RGMII
    variant to plain rgmii is intentional (the FPGA converter supplies the
    delays); confirmed a non-issue given Andrew Lunn's Reviewed-by.
v6: No changes from v5.
v5: Replace of_device_is_compatible() probe check with dedicated
    socfpga_agilex5_tsn_gmac_ops via match .data, per Krzysztof
    Kozlowski and Dinh Nguyen.
v4: Add Reviewed-by from Andrew Lunn.

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 6d4bc1fe8f75..131d2a98c863 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -69,12 +69,13 @@ struct socfpga_dwmac {
 	void __iomem *tse_pcs_base;
 	void __iomem *sgmii_adapter_base;
 	bool f2h_ptp_ref_clk;
+	phy_interface_t mac_interface;
 	const struct socfpga_dwmac_ops *ops;
 };
 
 static phy_interface_t socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
 {
-	return dwmac->plat_dat->phy_interface;
+	return dwmac->mac_interface;
 }
 
 static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
@@ -653,6 +654,8 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
 	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
 
+	dwmac->mac_interface = plat_dat->phy_interface;
+
 	ops->setup_plat_dat(dwmac);
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
@@ -673,10 +676,28 @@ static const struct socfpga_dwmac_ops socfpga_agilex5_ops = {
 	.setup_plat_dat = socfpga_agilex5_setup_plat_dat,
 };
 
+static void socfpga_agilex5_tsn_gmac_setup_plat_dat(struct socfpga_dwmac *dwmac)
+{
+	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
+
+	socfpga_agilex5_setup_plat_dat(dwmac);
+
+	/* FPGA converter supplies RGMII delays; MAC uses GMII, PHY gets plain RGMII */
+	dwmac->mac_interface = PHY_INTERFACE_MODE_GMII;
+	if (phy_interface_mode_is_rgmii(plat_dat->phy_interface))
+		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
+}
+
+static const struct socfpga_dwmac_ops socfpga_agilex5_tsn_gmac_ops = {
+	.set_phy_mode = socfpga_gen10_set_phy_mode,
+	.setup_plat_dat = socfpga_agilex5_tsn_gmac_setup_plat_dat,
+};
+
 static const struct of_device_id socfpga_dwmac_match[] = {
 	{ .compatible = "altr,socfpga-stmmac", .data = &socfpga_gen5_ops },
 	{ .compatible = "altr,socfpga-stmmac-a10-s10", .data = &socfpga_gen10_ops },
 	{ .compatible = "altr,socfpga-stmmac-agilex5", .data = &socfpga_agilex5_ops },
+	{ .compatible = "altr,socfpga-stmmac-agilex5-tsn", .data = &socfpga_agilex5_tsn_gmac_ops },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, socfpga_dwmac_match);
-- 
2.43.7


