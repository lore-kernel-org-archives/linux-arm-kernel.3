Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ADDEFCE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rXQAynDkgU2XzeoF/lM9EoyQxnCWYviidiGFBXeOxs=; b=fM+/HKZoBI/udlrmsOGjCNHSDF
	Xc4uzvBaBopGnGTbbNj17WAeGMQkao/FgW1Y5kakD0aVaCe+chuefTSfB5KegO7TLj9i4EMyL1A/Z
	Gv//CzUEZ9LdWjgyLeDgH7Emy6thl7VkGNQpgycacB92wQ/V7ZZr4VW63z0+NF8HzT8/Q99kik+hS
	tVtz+82hGb2XgDdPD6XCaKOq00yDZ9cRJBplRaLN0APbGXcptvy+iwIln4514agaxYFwf1nYX7V5T
	/PZetnWptsgrzgJmbPIEJouom0pviuNBR6SJrxiplKELq0GAW9bg+XRUsU5kZusu6T+aKh8kvCUrn
	tI2MSXbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqXg-00000000GIf-2U3N;
	Wed, 04 Mar 2026 18:01:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqWi-00000000Eon-0NwQ;
	Wed, 04 Mar 2026 18:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3rXQAynDkgU2XzeoF/lM9EoyQxnCWYviidiGFBXeOxs=; b=HOfGL2Hhe6pxt3OU2lEGzO/Sce
	Z/wzTDuZvHM+pxsisvSamgytudos5YWuUIAYWJk+5qgzJvEmj15Q6H/3B6l0t1nJp1xkFG7SeHtcC
	qxWug+NGc8HjmTlcLYB15fMagIqVjunNDAE2CkXTZ9SZGC7rRNOLvG7Rg3k52yYiaENIbrncVdD5G
	rYFuIEQbFHB/9wt6IDCu33LfUbBDaTB7Ag8ii5VwfVdKLBPUiQTSm5UIROouac2eqr4DhTybiBgWO
	murl+cJ5NorzBFr8bhEyj7uJFntSFasrmJ0QAUw7bFn49sdopGk77aN7AD7nlkN094xTwktjMAsHz
	ib4prFcA==;
Received: from mail-northeuropeazon11011005.outbound.protection.outlook.com ([52.101.65.5] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqWd-00000005H8M-10dJ;
	Wed, 04 Mar 2026 18:00:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZvnNuQAlkLcT3rv5aKUdHZPNbPhzgWJKP2zYSpMUwijwGYrli6bU5HLoPluwIZsUqrfYttPgFmEv8cflYY1ZcysYqYorFYmCf+hLm9xdEa6fqT//wWmq6fsVHbI3Xk1r7q0mqSWvlS1rpsaoMPAohnrVfsKZf+nwCKLETKsoZq3KDKY+NtdpmmRn+8+hVj7fDGp4FinTDRFxsHCa49YZO8lUdfVATN5YARwl4PgYcLUmQye4uh8W8qseU3uwDKC+YYFhbR8/NAnoGa9YZw7L385zz3b3uYoNCyMc/YbxybPIP9Y9VBmRTWCZenIzSeDSosje0q+rVaSmcnBSznY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rXQAynDkgU2XzeoF/lM9EoyQxnCWYviidiGFBXeOxs=;
 b=O2ZlA4CGonujLCL2b59XtDDvLQa/DqhB/gtVI1tXVapegnoelpjTj8Vbr3RZLSaYDNxMEC2fPN+MFd0ZArDV3AfGF+aMkbYar90RH7qkeG9i+8XeC7HGpRSOm2jjNuordiurDPja4062XwHLWp4iYHQlGDoZiFifeJOHdPIl+si3zwtrEtR91+hgOT/+CgCpozlHS6PTuGq0vG0PZU5xkN+b2K3K/YbCnCj4YzqtdYoaUHooH7atuDqFerEz7prJDzq+UDbfI96YxvttExqC4CdNsfFQTwXFYeJ/AA5MNxLdFaXPy40zuJ0YTpyr2naMzj3C29j6uLDq2Fyh+sG/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rXQAynDkgU2XzeoF/lM9EoyQxnCWYviidiGFBXeOxs=;
 b=EK6QG9zvvF8Qr820/rWXenPhPpGgD80xuxiBVS+or5U7ztGUvUaW0QZ14cUo6CzN4qa5QlhA5yqsrU5NvDg23YBz2tRj1Mov90lZOY80JrxucPVqPNwZR/CKa2bqzqYKhKUe1nTjgxVOTN9EzkIy0c0e13Lv7oFqyj0oU4caMiKAd43XZ6D2ZPcI1R+kJxCDcpI8YinlWokFJiuft4b1SMSfSgLB/XUlgcifjyGTn4AE8X7NICqTCCxf3GrScPm+0cvBAg+41YIQ8Zdq/QRzaHTms+v3exVOVfwXq3JHe8pTuJoeuVmqSdu1E5gcuKuFq5X16UPPrcs9coDucrrm0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:35 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:35 +0000
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
	Sebastian Reichel <sre@kernel.org>
Subject: [PATCH phy-next 19/22] power: supply: cpcap-charger: include missing <linux/property.h>
Date: Wed,  4 Mar 2026 19:57:32 +0200
Message-ID: <20260304175735.2660419-20-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f61b3b31-8d67-434e-a26f-08de7a17ef74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: H+R1IGueHJ+zeYLRmWYO7LEXZKA31h6VxXjiy4gXuh5jAVX/H71+hBMC5PZcmCuksUW2A0QDmER+GBZ+CNZOURWa9ZfokZtOBrP2B7uHVHlVMjLJYmg3u4HxTBX01vIcNsCysYYHzPqgyTNfrTNolZXijZlmhldhFdtna0nYmrN/PrX0+6DMvtWFWZkwvShiMn6zCtL1zcmrtNXmN6eiQ17i3V+5k18nWxdd0OOcJXECBWwxJyq+MlnAlDUSSLei1R8dM3LsC1gVK00Qz2D1+CeLUBjiUenjpCFCXCmy8Nz19REsFKC8FbijHfKzV1SFAAJlCmpBnuunZ6uxagbFUloCohalVvEfcUBbomWOoXv4FmrEwjjn63ey9GUbLyEwtL2+Hlyh2qGfapmXhPQhUEI0TENaruyEX33d+2jpONWUMvhw1qUKlZuRSksQXQV7o844Op//WhaA7NR1mGQStpEWSYbTK3F0xUSLU7m6H5HmOVeIOxTcJnUPgZA5Kk7VVNzlXvmmTd7IeVyEnq8gAtStNT1CQWJ5b57TcIGx9SFT30TnHC3L96L6Uo7ptHdltx/9TYzLZV1h3DnZGAcPg4Id17V9VIL4qXNfQyCT5DZi0I0a4hTXDOdzCNOPYhmtks8fZHTA4e8IBFoMPI5HsXOXGzs18zL2PRQKvv614tO9tcG96JM3LoSk8qpkL56Tom5uzwRqr5d9A9NjFc0XgFQtZudgEjOT/a0hlwfCHg0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QT+XooQFfxcldcpLzgaLb4xzD4FPyZNxqWRmHwmeO0SK8uXLcz4Ylrzgi2U8?=
 =?us-ascii?Q?9Lsd1NpYkQwQodLelwvlG38AC8mUFT3nqY7EKnwbU8co5+fiaCYScWrc4gR9?=
 =?us-ascii?Q?6byUV8e/yCwsBkCU1XBeC/rNTuV+/OilsHizc8946aRCelqQgURdj2jbCi9D?=
 =?us-ascii?Q?3HbNlPe1AHhF525RijlEvlDO2BZnwXhglHas5r6k1Y8tbcH7ryjML4dsqZrb?=
 =?us-ascii?Q?UpnRnEgD8veSUJ7QGwudkHgTPzBW66uFzGj4jL2bY+9zLQ4IHhlbXfSJvlx5?=
 =?us-ascii?Q?mSnr8z3VWpTGfmZoJKyJ/FrzfXq2ybpizmaqh+5M//npSN731vQOhzTCXTFM?=
 =?us-ascii?Q?O5h8e3BZyzuSPkQcLIa+vZil/T0Q3o37dHSasdToY41eYFwv8NCmXqPyVI+X?=
 =?us-ascii?Q?/sYDj1Pmy41v+AN2yOI/wVzdc4Mr0Bl9KNIaR75xMNZPcCvE6HYwmOcVIFaB?=
 =?us-ascii?Q?oCd9yqLYenGeQcJaMXFYtikx24olAwOGsLoBowjeYVJV2wvaExhijy6wBIzs?=
 =?us-ascii?Q?YZF/+cP8y/N/ejrJ1BVgWFLHD/xckgdXwk/TUjn/EZQA/+mV+fwivZeH5fqw?=
 =?us-ascii?Q?phwAhiFhItLjCvuZT6tum5CCFjOdrm9JUYBk63Jp84FFy0vJXpaS9i0VpgLf?=
 =?us-ascii?Q?ACqT7kegkHe3WInzXCZnITQOxxAezhfiqOOyErQTPazieVlr+ZycORlv0Lfs?=
 =?us-ascii?Q?CLwYbue3kNctdDGatCP3vIQjvAZ31Kn5QMovgcZEbiF9/oxx46IFqtLen6hq?=
 =?us-ascii?Q?1nM5NBtg/kBswCWomfCYWxPa84tTBFmlEDjcZMCvdVk9EBcz6Q3BJJ526cP3?=
 =?us-ascii?Q?NEuHOLrdtRCFmUItkhOfOK7VPkI2CBLrMbo6+b/cwHVcsb6FMMtZsyjiULj4?=
 =?us-ascii?Q?O/Unxgd+9S4e/TS0JU5o5b0yP0Owi2VJ87zTdKelES5FBp3b0GwDQuFQIwj4?=
 =?us-ascii?Q?wpS/7tSvLezTKGpbZZg3ouZzxPfO1NiksffQmBNmINAFVxysXq8YUpHjyqXr?=
 =?us-ascii?Q?4AUkknJ/SncS7WUaMI/O5emNPjXYSGU/ApWwdGTQRjcp5l5Ck5gjbYlw1WrD?=
 =?us-ascii?Q?7bt9KTqXTWLEiZPsuCRoF0TRow7++3j6BsdzXEXjKiMtL6CYGFxVEwjPO+GO?=
 =?us-ascii?Q?O6mlbgt7hvF/gmq1xy9QEmvzgIrJ3xwHFJhjXUXdzlUrssymS0qJdecx+vba?=
 =?us-ascii?Q?nlQgoMxJ6Qnuk9KI4zQkOhgvWUQxMjr/pNcVJT+Uk6OGGAoNvED7VvtOWHuk?=
 =?us-ascii?Q?ZiT+dGplz7yZNenGjYTgcyln3ZBHynOQ2Vaq0eEtI2BnE9OEieCvY3ADbwkX?=
 =?us-ascii?Q?7aFANF/uZO68DPtJcVJgQbojr1chqRiQx2dc+ACWqop7+KpJZaEhUxPQuF0/?=
 =?us-ascii?Q?kpIW8WQjKTY9ArCXCeOaLExwlmE1XsEwJrZV4KitTqcpTrrULeuKuSV4ksdS?=
 =?us-ascii?Q?LtAV6T8RQRhsFh0mPuZ8IVT5Iowj3V00IDJzOuU2cQtss2ez6AuJPomPFJwO?=
 =?us-ascii?Q?Cg5q9CLrpXiOZLGp2jFt3Q1oidqDgKWujeZGWYWmR0QQCpDTfJX4WsL3DkyX?=
 =?us-ascii?Q?QEjeuMSQcYpwtG8pXNm12uoV8u2ruZAjk7sDkUHiX5ZYjIRkLklkEb1ILQSb?=
 =?us-ascii?Q?1U2Cf5erD6LNgctUbf/Zn+RBmxMGJjSTj+jeses+o2rR8ujHFBxnr2TVm/jI?=
 =?us-ascii?Q?Xi9GCo3tDy8QMCta+nsql2nney9UfxlWf9F+bHKX7BTdTX3b87BBgxWKXxDc?=
 =?us-ascii?Q?off7ZmAa4gSxlSFyDHV0IqAMqzraCIuepxtoZhUU/2U+LoNR9jsKzIklrxeQ?=
X-MS-Exchange-AntiSpam-MessageData-1: x2FUvZFKECPk3TrLbz6BGoAKns3qbY+s728=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61b3b31-8d67-434e-a26f-08de7a17ef74
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:35.6263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGDh/aVQpI6ceftveuIoeRE9kRINxCiMzk1ry+sgj/74JRRVDAbPt0dAD0as6egpwLwn42nZL5BFzRFkF0OGSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_180047_392209_951BDDC6 
X-CRM114-Status: UNSURE (   9.30  )
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

This file uses dev_fwnode() without including the proper header for it,
relying on transitive header inclusion from:

drivers/power/supply/cpcap-charger.c
- include/linux/phy/omap_usb.h
  - include/linux/usb/phy_companion.h
    - include/linux/usb/otg.h
      - include/linux/phy/phy.h
        - drivers/phy/phy-provider.h
          - include/linux/of.h
            - include/linux/property.h

With the future removal of drivers/phy/phy-provider.h from
include/linux/phy/phy.h, this transitive inclusion would break.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Sebastian Reichel <sre@kernel.org>
---
 drivers/power/supply/cpcap-charger.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index d0c3008db534..24221244b45b 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -21,6 +21,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include <linux/gpio/consumer.h>
-- 
2.43.0


