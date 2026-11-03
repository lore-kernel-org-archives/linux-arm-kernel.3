Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF3D606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 02:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fkltQqpg;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=A3jd5oPA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H+s8BkOyNSHuRie2fC01Wy19tDVhaca9HVahGR1s/5k=; b=fkltQqpgV9AdVd
	qF2MDMkuSEKukuELWrU6PI/SoMxoXFiFSi70J29R2sTzPnalkf/u90EF1rl3UTkedMat3MD5TKqmx
	5z7wiJt4Aho+9mQefJ1K+xeiIyd4YYSSUS6L5ho99YX9seIGUOoIAxhYBe7Tr/IYVjpUq8woCSG3f
	VXyZts7Ut43WzGknZsxbmNE+H2TrXeSU3JlZRCYqQuWIOMkiss9h9Hchj8G+/V67mZW92NBf3uEgJ
	sFCG3j+u6eHemCAqbqTxh1AWCjdJQQnqhIv/sFtolbRevs6wrSsEUY5TGa1/zr3mkb20btGjBxWx3
	ogeAE8ppM68f/XiMcI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3uZ-00000000pnW-0OPM;
	Tue, 03 Nov 2026 02:06:07 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3uV-00000000pkH-2TRG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 02:06:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucERacy81Sasz0q9/J6OytSBCyV03tZRsNROcmuEuDAkd/bFZgN51vAmbzPNnuw0U5Gx3ZPTL7o47wfZI2zM2EquIQc472YEqrdSIjmGVpsf0RxosgVo1s+kT31EKm0naClWNXBKI3Gz9oEJafUviny5CSm44GHoJHr0/BFK22pi7io9KTtDB1/LSL9zwCKbqCOi2vzCKsa1y9HQMpFduGydQv/uv8Hhi6jdlkVO4AK8n2neruUR36lhPSPEwidx7KN5jGfPIHGVUoiwI2WG7kMUDSLHN4CqtAtKBB57pxC6Ekf3lrGQRGpM3lB3lBvE+VSbgYm3Ca7Jn9jjXyfNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+s8BkOyNSHuRie2fC01Wy19tDVhaca9HVahGR1s/5k=;
 b=bEbn+KiwOmAw7wTHExzBRo4kUPFJQjqfjX9KWYWcf9C+2h/HIXix8bkA7x61Yt6VlcpErIzIIHn8AMirgjA8sZe6y4dekuoi9Op+Je3sqt+wkRPRtNkHpKuHk57I9olAJklxSV79SbPbabDduJ0rTZwDK6b1R2/zUJCDb6zVJBecOpEsgccgY9xE7fE+s6Upm8YHHIoQ9vLNaIs5JBMaa1S4d3SuqUvhFj5wxaqBYKOHQLSfTtqz/zgOi+8WH3J+U6A8qrnnAjrCUHjGiSzuWKsv2Hdy3xOa8C+YeGhtgyq/E6IAJGBckfs9AyCkS/yAHONWVCXfe7YSowo6MSS4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+s8BkOyNSHuRie2fC01Wy19tDVhaca9HVahGR1s/5k=;
 b=A3jd5oPAnWcuyBRbzbomETdZy4PbDz7NI24jOGnfQuj5X6lEmBwtel5jO6VtOM6T6EnAXnWCfjmNynHE0HVCze85QqYPd3GSbyI3SU6EAn/uJM8WpoKXbt8/jQHKwTrPT1dDbRQG2P9QQGUgC9B3lU6v4cDhaC3KzA/spVpMjzB5BmmG6wo4m2+YcgthR5ReiDrXhDlkrQmzqqR9BLkxPvArir+LPlE0T2E3BAZweHcWfdCbjDp0lP9hO6i2n8z9U9Hf9mKNWHZFZEQb5JVPYUFoPacMx/SjAteXDRvzDRwbtqqWWzlUo07mH2oevL2EOrP9PHq0Ix1LAbd3Tz3XFg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by AM7PR04MB7094.eurprd04.prod.outlook.com (2603:10a6:20b:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 02:06:01 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 02:06:01 +0000
From: wei.fang@oss.nxp.com
To: xiaoning.wang@nxp.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	richardcochran@gmail.com,
	linusw@kernel.org
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 net-next 2/9] ptp: netc: remove unnecessary pcie_flr() call in probe
Date: Tue,  3 Nov 2026 10:10:17 +0800
Message-Id: <20261103021024.3121936-3-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103021024.3121936-1-wei.fang@oss.nxp.com>
References: <20261103021024.3121936-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0218.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::13) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|AM7PR04MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bbe6cf5-0e1e-4d5a-f6fc-08df394f0286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|19092799006|921020|261021123027099003|11063799006|56012099006|261028144727099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ve03WdkdK/aZinYPBXsbcNnGfJF4ESo/DI6ZdSOVPvA+VxJbfQlhrYvWYo+nFvYqKcs1dT3MBKafVpQfBRspTYB+bCJyw1uv++wRe5WEpEVvUyNfodf17NyyXmyk4f6yMzcXySZSoJ/kAhGOsbCmSIfXxp/mnwwKCD+0EVIyOBEYEkSbOMpuilpQ8e9YjN7d3G3rlDzAgYSfDkpnlr+ycoYuiFlAiWOunXfDbQlf++YKkE1Nk9OHNv6DIvoCbLgaeAAtyDnlIL0euJOlJMRgVFJdbMQVqcXc2k5IH0tH31YYeGp3criWlxA2poec3l+j6FZga9LcAXMdBo4wlM4VCNxePLUpafAm1ebMeDygf08LXnarBqXQb5u2yStpNtF6gLuCn5ia/aMk4Hwx6cyLtsmtxBpC+M0dxsTfkzev2gcXRqQbez8BQMl69PcpFX4fCWbrm/7YGqJwDWOVvxlnqqnKpaUByOBgfESTcPT8oa5NuF5MhhfEaMiLhg1Ag5ONnso+aAfvDPbsjs7fqMaRcomaxEH3GY4pWJ7PjRuowSwJL7Uv2Npyc1dePufzHNSk3RqnHZsfG3QCi3KT8Dt2OaB1SUt/bheedrmFErEEuHc3Fb9BGMYl+kdlYKoovg9JxrZa1z3rqwO+1Rh0nb2xGVYZEvZONSCYUrD3F5J6uLym/3QvwfSbovRDorBqcsv43J9hzr4u8BHj9baJI/cBZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(19092799006)(921020)(261021123027099003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l7ZdpE81AKL+Sh0hUTW2ZfFnKoqxHy4PaP9AEgpF1WvXEiY1l0a1NfpUq9y9?=
 =?us-ascii?Q?E+0f8oyq8kkqDNFZBQIQGKtL9x3gEAyrD/bLT96asxcqZ7qZ268yFLPI//yU?=
 =?us-ascii?Q?Y/KwHsM9x97RLLkr7cxW5mAcpTnIuOhFNsl+Niyh1L28C9JLq7U271q243fZ?=
 =?us-ascii?Q?JEZtYdYQ8wn5jNGdMIpSS6l//u03Mi2pwA8gaay3ysyxORgDGJUDSayjjbqc?=
 =?us-ascii?Q?sQpQ4a0bOA8o+TDGFjhJMS/HBa1bHw21CGN+NzEB2OEy+RKe5gWDK6uJixM9?=
 =?us-ascii?Q?beszrNMuzXz1IwAmbntpvb/4SN0lRe+PK9LW6a3Oh7YDkM7srjN/+R7YJAsc?=
 =?us-ascii?Q?FBlhWyCz3toRgJW8+hlB7xCoDqWp4Hn4aExdPxDRDvDwSMIk00+T/9cIr/ct?=
 =?us-ascii?Q?GSO7A0MVpd2PMOcKm0RoxdUZ/UybwBhedbKciIdVdtY6P2AyqcqwOKM/sZKh?=
 =?us-ascii?Q?JNiiRRVi6jONuYPsHwMPwj2OZHfQhOz0GNJ7mL7x3g9w6QGuOtUj3hy1sW+s?=
 =?us-ascii?Q?1BDYyYPEzjNANmrW7ixx+9EdXsVpDDeNSJQ1UJII15VBjMEbogOfowf9U9vW?=
 =?us-ascii?Q?nadZg9MXSyO6kg2wptBhiwyPMx1TjBNBAj8OSXfEhXf01Ul2YbRAukyanXh+?=
 =?us-ascii?Q?VaiZC2/VjEmXfwJ7pxVKLBlt7UefCDmKCnLgQ4FFOHdqmyvdajFG5bZD337O?=
 =?us-ascii?Q?KGuUJMsCO9fStD1O6j1W5zmb+UYdoIv4LURQfTtwTY9qbxOqy7yxRaeDk6LU?=
 =?us-ascii?Q?0p0n/LsmMqPirK61TXoUFcPp6WMDwHwugvJq8r2wWCOrImqgURUI/8ms1Qhh?=
 =?us-ascii?Q?ESwU8C26CmtAwjb/Ncl+U7sWoP35OvPEE1D2vw/GqskALDXl7ttI3JpTTLPI?=
 =?us-ascii?Q?NYTq0Z+7PXkv+CSoinSu0+A7jEyop1lAValXw3Qf/2JOBx7IM+tm3mStUMrr?=
 =?us-ascii?Q?I/dmpjExf9F7vxeXV9edwKy1K54CEtfkxhWNt2E05nlq3gbQD/epdAuPgwBK?=
 =?us-ascii?Q?06uefYYWh1FuhDgoqIVRaYq8njm+XJ6fjRfmtxPCT5IRt32ZWIgK0NfclBzA?=
 =?us-ascii?Q?CQqaUlK0xzRn4znnRpYXbx9UnKB5NZfp0YPGW8ZlPQLZ5PrQw1ljKiECAN+x?=
 =?us-ascii?Q?sOaLKX9V9+DiWge7eqhzqcGgk42tKp6N6ZVKWktYrQq0LO4TxIEspEIKxXBH?=
 =?us-ascii?Q?pAyMCwC8yH+FcGMDibAGpErdYPdnuYqNmvXEJndeLkAZNTKiYAk+YJ3ASU79?=
 =?us-ascii?Q?paC+eAWt2/WF7fZUvP1xrHvqT8xstCtAuCJ7PCGmo+AV9ZCUJm7xb5Jvedun?=
 =?us-ascii?Q?+3cyZ92/pMhJl3Ew+voxkzDISZMwYVQ9Z5CMFrlKNvUR0AtyP49tIkU6GT7G?=
 =?us-ascii?Q?96G28m3ry7OqSQj/WsagId+YvxaLvgUkjj5UzNG/qThMuzSgAN5LWO9orqfS?=
 =?us-ascii?Q?PeMK5IH9DXE/FGfE5qPEjVhLx/yV7bY/RLNlTXtyOx39AOccNSzpLYztxNyF?=
 =?us-ascii?Q?MKyyB37FHa0chfjf6oGRE4+FToa0OeIVIP19AVSFXERvIfpATuw8zURqSx0b?=
 =?us-ascii?Q?pagJN+l38N4fjlSC+Lnzh8o2w4kyc+pZgl1X9syS68wb4YyB6WJBB4zzQrq5?=
 =?us-ascii?Q?Fthov6Z0Fwpn7hiAPlJqn9xpS+UrQXYG1pblIAT4LmATCzEbkAV1uCGQRCqe?=
 =?us-ascii?Q?MRoqC6H9i7D5ej+ml4rsSnY3YaUhwj0/93WuE8ydYifKtGSIdJhxGpHGHeiQ?=
 =?us-ascii?Q?lvr/ZaVcPLLKVM9fLFYMCEZjzVb2QPeYflwFnf2TRyV2vtzIQctO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbe6cf5-0e1e-4d5a-f6fc-08df394f0286
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 02:06:01.8613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9uPH/uHRmM92aU70e076tm6RV9n2wFJ1m2Crap4rJVWFnvqsry6ByTN739O3EEPTXnhBJcAg7Pbqo9tQrsq/BL4UIfU7V0U94wMyRe4UWa8A5fc8s9bByM6xb+EOSEk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_180603_650495_ED707146 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wei Fang <wei.fang@nxp.com>

According to the NETC reference manual, function level reset is not
applicable to the timer as a supporting function. Remove the pcie_flr()
call from netc_timer_pci_probe() as it has no effect.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/ptp/ptp_netc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
index 376b3b0d1a38..aa9be8e2a630 100644
--- a/drivers/ptp/ptp_netc.c
+++ b/drivers/ptp/ptp_netc.c
@@ -777,7 +777,6 @@ static int netc_timer_pci_probe(struct pci_dev *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	pcie_flr(pdev);
 	err = pci_enable_device_mem(pdev);
 	if (err)
 		return dev_err_probe(dev, err, "Failed to enable device\n");
-- 
2.34.1


