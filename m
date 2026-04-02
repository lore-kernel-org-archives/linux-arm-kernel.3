Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CFBD39406
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuwbxAuMyLI43XOLY5JuxEeUskoPPcPtGM/zWepoy9M=; b=mKUDUXHmixfLbNLipgQ9sd1no3
	2G45HnrNYX5/3PQHXkcagNX8r1zbg90UCOncJz8G5uJlJWuoaRP1iaR8b0NdsRPq0ies4W1SmwclT
	NMI643cRm/2Bq/ViwpGPUYYrp+ky8OfzOrRP9B56WmzQ0PuFvReDFpS7sDXm8k+5ua8H5dfygdI2z
	TcIJIOSawCJTS+u3CcQ4BTrsijKsSsPJmOrnJ41gcBwXCD/1rNyWzmNciIyyRoQU1HYaHDmL3jKSB
	Lu4wCZl8wCmMdm/Qf3WIwbXHbDMcrXwW9+tJznqsq9b2Mf07FHOLIJArkBJCzHgDALAXtdP8/pfL5
	MgZ0nqtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Egy-0000000HIed-3nFD;
	Thu, 02 Apr 2026 09:50:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Egx-0000000HIdY-36yV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 09:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WuwbxAuMyLI43XOLY5JuxEeUskoPPcPtGM/zWepoy9M=; b=gk7mou0CISXn9eES3IS+x2A6Vh
	mycaLEv64cKDQ+wbQRqmJgYzvm6L2iaqQtKy8CzbADGdSeRMNkq0S2K7WAWY5Q4h9nBdRKHSmQHxN
	gToTa6QkmRakqkTabS3Fj2BawCmkbEfwU8gFzQtmB/TCZN3faNn4qLkeFBj2DRbnKuSobckp2k8B9
	bXcnrPrCIwLDmITy0+l/bu4lm8WmkzXkn0MTAy+dcD18o2DarbBOeFHl2s+WFfYrH5vnTU3jhL/gb
	vd1p4y+eYiUhNd6xCfwKiGFx1NQGe+2XfqnWOw0s/RlNQco5iprgI0sqokcdD8Jmdq7d6wIQYhxkc
	kv3qTufQ==;
Received: from mail-norwayeastazon11013046.outbound.protection.outlook.com ([40.107.159.46] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Egq-00000002A9E-3im3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:50:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjbsQMZPHziS6oTdLi6xaeZ8YMKJ+zC4b7R3J0/1pMihRP4WUiliBTlfthJhqGbbQXCJlzAXCJlnV/iTPkHaVwK8m7uCqg6wJpSlBthm50Ush5+jmCSk/2cFmdLHzLPQXbdq3+XoGi4fUxXPkzTI6Mx/Zjm8OcROK+NMgwb/fj2PyXMHO7Pyrxb871uxt3E2XTc1vOqAFO5+XPtaEtCnNgxNHJmkHBjUb7oUCrq5ZgVeQStRi0ZslXfp9SzuMVyly7qkwSPsub+pvsRLIit8EYacmta1e1gQT1rLNSmLJ5jCO3qhtw3Lm3sniVsXlsRuwHex/gPub14YtJ/AJYiLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuwbxAuMyLI43XOLY5JuxEeUskoPPcPtGM/zWepoy9M=;
 b=Bx/A20lC0rarRVRuv3s30fXTT/VhZ/OKOOWZbqUvOro4JmvAx5O09SBZ2zKSUscNLRx/Y7eVSs34JAEBYxxcKwRnl68H6RHYnbg3LsdddywEeiF+6Onsg0VwQjyxOClReZ6V3cdnTLObVao4qeEZKAz03GufNt1VFACJWe/tDqliX67whASkqIO4pVYhN5FELu2ujAA1wku4lEpSpZ4nFf6oYRffUugcaQUyWVvYySFeFMEfhrKZZbcn0Zcyi839Aw+8Xt9ZIG/rKHNFrrB6HlAA1Isuf+O5xyZ+wc2l3k42la8Xw6wEbVkAmngNLSwgqYLIsTC4n6EHhLo9vdaYnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuwbxAuMyLI43XOLY5JuxEeUskoPPcPtGM/zWepoy9M=;
 b=lCxVstBz9aSRhzYJyLKdF4LMZr2YamtWYAbvCsEHGLfwOdC2pomouC4VSC5FN/WteTj5UBDqMesIRSdnPoZ23WGVjuiPJu7lkByKElUvNRYdbWW2nE+UONIbqxXmOSpXvr5SpWIal+oe5C91epZUUj90XWiuJIKT5KIiCt0o9nYqWZycbeyEeXJimqRbTCE2Xt35/MqQd5BkqsE1ggNk7DCRhOtfAqdKIS1ODFPiV7UD8Bp8z0ZbKuYIfMbjTZqZ+n9JJWECz6Zh5kYv7/n7nRaVq46vQKgoGSRKuNLbWiWJe0XT1+0HPanQeqzAYjaY1EiIudM8j4nNg34n+77dxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB8471.eurprd04.prod.outlook.com
 (2603:10a6:20b:416::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Thu, 2 Apr
 2026 09:50:13 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 09:50:13 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V10 02/13] PCI: host-generic: Add common helpers for parsing Root Port properties
Date: Thu,  2 Apr 2026 17:50:56 +0800
Message-Id: <20260402095107.205439-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260402095107.205439-1-sherry.sun@nxp.com>
References: <20260402095107.205439-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM9PR04MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: e76d3db6-79d6-4156-1a5a-08de909d3c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|56012099003|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info: Hm8RyGXvv8CprpOxKL6qGbZqCPcxvPH6I+NHIPyNJcK3zXnLubc8s6mhHrpS8PFLICv5SccBJWm5xjB92aznk6/djrUxBt76VxFH9+CgKWXdWfDOR7aWlTANNmRv6TK8z+c3Ojv9HLxgYGWBbYi7ghc3AojtTJQRioaUaQjTCVfLqj+30WU4x9rZahgsKEoh0cvIJAAOIroEdPj1qaH0/bC0uq28PTAtNsRy1kul1mT3Vm2GRkKMrO5+pSoejdVfBMPIM0SYupQQ67D+Zo2INWb4dWmw0o8vsw5Kn2ARd0hGrZ02necpGGwPhSiFCO/ies2tyFP07Oy/uGC7CV728YyF+vGryNBcqAw3zCSB/jHByiA7xSXVpZ3JQscOXEnNmUl8pwc8YTL7uQhWAw9MCmc2KSUqWL/3G64NDK9XRf9q1hERfWaqowwYKjEVTG2XkbllydYQq+sBKauHHoegcXVByOADf9Q3x0IqrfZLn54JEP0Z0AeOJqy9t73h67G+HxWbpnc1KhtA1wM+3yXLKv7SsCqZrrHxnRXmEMg5VDfyUkYXN9CNswLFJ+DmCUoopv7AF0oU5/B9rNg8KefarmVrmH9sCgWiYABzlVKk0NRkq1KeM/+c6g5eCMNW5mbpSYLfGY5HsUOredhzbLY3Os9v4iK/Akq+TleA8mF9ZlsyGiMn+U8KflLVzU4RXZZpMexmszoK0wolB6x4ADFi9qE5Z2qiH9/AH82EtwujFfkqWemXK3VPC5a8tSpQ/Dpzx4zDxUGOp3OVFQR+5i0Mw2UMJ/qoZ2+yovx/vWVASEI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(56012099003)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z9YnB2hQSXFmI+jLWGcmu8djXueKVLtyphlEJZ5QHIFPpPVETb0nG9Ep5mKC?=
 =?us-ascii?Q?LQJ0yHlLu6m93CPXiJJx5t3o95LjF6gSrVwoHbzLspNOZZ3eM+pV6FkvFD6k?=
 =?us-ascii?Q?ruxXzcXQO+eWTr3TIMrcjGDigCazI5k1YRbzEgaHoOF8nm8BMPDtWyT3BT5w?=
 =?us-ascii?Q?0s8y/0hWmr1ghOFr++qOgOgRbyxSALWn+tq8X9rYM9UOCLLRT5CodhImhBp6?=
 =?us-ascii?Q?yg7vwvOAWPdOx9ccQKGxTknGIsXLeGcMUpqZrYbs7Xg8B04NLQ4AHDlff+FI?=
 =?us-ascii?Q?eUomdcnMByv5e0uHeYenV5WdcCEHu2Eg1m5yK927ThJ4+NzcadBiZ5lxGuJo?=
 =?us-ascii?Q?sYMMld4SwxbrcyrTQ+pvhXqBr0XNb8C/qUWyoDDey7HonBo6tP5JLGWKalH9?=
 =?us-ascii?Q?SEXzqkky54e4TjpZ4EIydB4hhL9n3KC5cA1Jsv+u9h//6oak8uoOtJtx7+4i?=
 =?us-ascii?Q?ncoWWfZs9/0lGmXgrJHqXw3fmKFiOKM/Px5AtP2rqBNKzs6UeIWdmMWiPqTx?=
 =?us-ascii?Q?kQkL0cX+AJx3hoc6rM0pwYh5wj/n5cJb7Gp5JfTJs3RYhbzqzwF6FqEEJo/4?=
 =?us-ascii?Q?1X713GmI2Rlcxr7MaxDOHU7TWeGFrHmj+hDcbmM0fpdz1dF2V/u75kCp4Q9i?=
 =?us-ascii?Q?nM+xBAYiU2Df/3Z3VWqD01c+NBv+zom37EhTO5XS+uDsmcXIZHurthr74AP3?=
 =?us-ascii?Q?tLLHUQNygkhNbJexZEynhYJCfYMA08fPqjNVOQsLlSc96gwbjbOhLHHrBe+K?=
 =?us-ascii?Q?n9hX3aIZtYIxZGwKp6rfyQ7QUjMM7W/NSAClP3yHrkx7iIW2LOafPjk7nMID?=
 =?us-ascii?Q?G3C/SJ719J0y2CFuO+TjQlnyqTd50lTKyI7KwelrlQjGdoubxiNRbpco7YCI?=
 =?us-ascii?Q?n5ywi4B2QrpcX6dStRYNkIeO3cd2lnj3u5XeAXKnURv/Iqr6jKiamiQ5BCBY?=
 =?us-ascii?Q?ONeCwEh2sBvje+G8dDg+i7nEZ1f8Xyuyg6p0fveOa2nD/o7qGOy+Pq9QaBgA?=
 =?us-ascii?Q?XxPiq/C0QlRdZ/JcAwGbbx8R+aGOaMB4xwU4QxMpmgdmogtEuMvv98tx/Z6u?=
 =?us-ascii?Q?5e3gtfVsDuz3pxfzl6Jjs4jpcbF+PxdG5g2XD2By266kROOr6i347JXYGzYS?=
 =?us-ascii?Q?vSf781D2REEKqCo6jCLMOaq9r2msVQlPvgoPCUqddK/fgBWT887/4WKzV5Oh?=
 =?us-ascii?Q?c0LwGue3VfeffyOQiAEBIqjujcaHCB4qLe8F8aL86w1FZ0EyMZ3ksKV7/67x?=
 =?us-ascii?Q?rY5qdGrIrjHL3Ac9NtGYnUpuKhHAMZbUa4Cjt59kwCtPJUqvAdWfD7lMxdEJ?=
 =?us-ascii?Q?86HGXHx0czov23JtmMDV3XXDt+BIID0h71RMJquKOV4ih25gjq4ovVntDzZI?=
 =?us-ascii?Q?6GPNNNFOz2yAkhY5bXC9B1ntd+fQh8YB1IBmgXRBkKdkvu473SzPTFWe8K5+?=
 =?us-ascii?Q?25q8AoJ+y4cti8HbeXfJ9bA42IukJ3VLQ9Sw5SzPieqHTpbc4X0bE7V0/IbC?=
 =?us-ascii?Q?QpA7egshpjdBufRaE709cKHlZDaW8YLpqF20nCUZ5hoQnZjGyCUNZW5QR10h?=
 =?us-ascii?Q?Vw6T5h4HFA8x283su88KQ7JFF6DKFWXn7mKu+oPbnPqFMrgTsU09LfEHvG0r?=
 =?us-ascii?Q?umVPXQRlQisjEoPurGx93+3aBf975VQVgkxvmjYeUIh3TyAsSZVEu1xmoOP1?=
 =?us-ascii?Q?6S4SZrXWyFtWYunZITgF0mHU+BCIyfdsRtig/AQHXn8dSSRmF91a2xrY0v3p?=
 =?us-ascii?Q?g1jZIOEXZQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76d3db6-79d6-4156-1a5a-08de909d3c95
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 09:50:13.6077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fv75gd43VOq2+GWOUMvFYaDwqxZHOzMh6Hd/A7ooIBQ5Gx7wAMtwh8YK1gX+cQMLq9uTboSDzSQXrLxncdLt/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8471
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_105018_738331_293FB82A 
X-CRM114-Status: GOOD (  17.51  )
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

Introduce generic helper functions to parse Root Port device tree nodes
and extract common properties like reset GPIOs. This allows multiple
PCI host controller drivers to share the same parsing logic.

Define struct pci_host_port to hold common Root Port properties
(currently only reset GPIO descriptor) and add
pci_host_common_parse_ports() to parse Root Port nodes from device tree.

Also add the 'ports' list to struct pci_host_bridge for better maintain
parsed Root Port information.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 drivers/pci/controller/pci-host-common.c | 77 ++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h | 16 +++++
 drivers/pci/probe.c                      |  1 +
 include/linux/pci.h                      |  1 +
 4 files changed, 95 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index d6258c1cffe5..0fb6991dde7b 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -9,6 +9,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
@@ -17,6 +18,82 @@
 
 #include "pci-host-common.h"
 
+/**
+ * pci_host_common_delete_ports - Cleanup function for port list
+ * @data: Pointer to the port list head
+ */
+void pci_host_common_delete_ports(void *data)
+{
+	struct list_head *ports = data;
+	struct pci_host_port *port, *tmp;
+
+	list_for_each_entry_safe(port, tmp, ports, list)
+		list_del(&port->list);
+}
+EXPORT_SYMBOL_GPL(pci_host_common_delete_ports);
+
+/**
+ * pci_host_common_parse_port - Parse a single Root Port node
+ * @dev: Device pointer
+ * @bridge: PCI host bridge
+ * @node: Device tree node of the Root Port
+ *
+ * Returns: 0 on success, negative error code on failure
+ */
+static int pci_host_common_parse_port(struct device *dev,
+				      struct pci_host_bridge *bridge,
+				      struct device_node *node)
+{
+	struct pci_host_port *port;
+	struct gpio_desc *reset;
+
+	reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(node),
+				      "reset", GPIOD_ASIS, "PERST#");
+	if (IS_ERR(reset))
+		return PTR_ERR(reset);
+
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	port->reset = reset;
+	INIT_LIST_HEAD(&port->list);
+	list_add_tail(&port->list, &bridge->ports);
+
+	return 0;
+}
+
+/**
+ * pci_host_common_parse_ports - Parse Root Port nodes from device tree
+ * @dev: Device pointer
+ * @bridge: PCI host bridge
+ *
+ * This function iterates through child nodes of the host bridge and parses
+ * Root Port properties (currently only reset GPIO).
+ *
+ * Returns: 0 on success, -ENOENT if no ports found, other negative error codes
+ * on failure
+ */
+int pci_host_common_parse_ports(struct device *dev, struct pci_host_bridge *bridge)
+{
+	int ret = -ENOENT;
+
+	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
+		if (!of_node_is_type(of_port, "pci"))
+			continue;
+		ret = pci_host_common_parse_port(dev, bridge, of_port);
+		if (ret)
+			return ret;
+	}
+
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, pci_host_common_delete_ports,
+					&bridge->ports);
+}
+EXPORT_SYMBOL_GPL(pci_host_common_parse_ports);
+
 static void gen_pci_unmap_cfg(void *ptr)
 {
 	pci_ecam_free((struct pci_config_window *)ptr);
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index b5075d4bd7eb..37714bedb625 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -12,6 +12,22 @@
 
 struct pci_ecam_ops;
 
+/**
+ * struct pci_host_port - Generic Root Port properties
+ * @list: List node for linking multiple ports
+ * @reset: GPIO descriptor for PERST# signal
+ *
+ * This structure contains common properties that can be parsed from
+ * Root Port device tree nodes.
+ */
+struct pci_host_port {
+	struct list_head	list;
+	struct gpio_desc	*reset;
+};
+
+void pci_host_common_delete_ports(void *data);
+int pci_host_common_parse_ports(struct device *dev, struct pci_host_bridge *bridge);
+
 int pci_host_common_probe(struct platform_device *pdev);
 int pci_host_common_init(struct platform_device *pdev,
 			 struct pci_host_bridge *bridge,
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 162166c2a9a8..360d4a1e9353 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -677,6 +677,7 @@ static void pci_init_host_bridge(struct pci_host_bridge *bridge)
 {
 	INIT_LIST_HEAD(&bridge->windows);
 	INIT_LIST_HEAD(&bridge->dma_ranges);
+	INIT_LIST_HEAD(&bridge->ports);
 
 	/*
 	 * We assume we can manage these PCIe features.  Some systems may
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 3e6b92fdabcd..545f6ad4a8a7 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -642,6 +642,7 @@ struct pci_host_bridge {
 	int		domain_nr;
 	struct list_head windows;	/* resource_entry */
 	struct list_head dma_ranges;	/* dma ranges resource list */
+	struct list_head ports;		/* Root Port list (pci_host_port) */
 #ifdef CONFIG_PCI_IDE
 	u16 nr_ide_streams; /* Max streams possibly active in @ide_stream_ida */
 	struct ida ide_stream_ida;
-- 
2.37.1


