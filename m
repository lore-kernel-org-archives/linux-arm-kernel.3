Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32688FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYoAO0Xo6F3IEHdR5a+M66oRDmH9iXSBJk5KxBuqk8E=; b=TeBdYe3JC9XKVcbgG3kuKFwqpa
	AmIF4B67g+o5ic6ZPNIoxDaXuaMc2ujJGefDTfGiRWOrb4BoDIjq1ohN/VmAI7QwWvga6Ji9XIhFs
	z8ndZnhdAomzV5l+uSb/u3qGuSkEWHWb5Yy3H/9qpXdX8yKLqnWK/VT+mqOTmEego0zFiz1wV3Bwy
	5K1PlrD6XT40zuu9n/71zHTRvJzJjKpfUCVSBfbiuiWyZzJ2JT5Cx9MbRJwOmzPHQDeIs6KGkifTf
	liblIc84fpmVITXzBITb9Hm+1VTDJH1uRKodrPIZEjE3VGL5csLkk0L52HvMIvYipbs3VBRR9EV+O
	Ozr4+I/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPGm-00000005IZx-2q30;
	Thu, 30 Apr 2026 11:09:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPFE-00000005GRE-2M2C;
	Thu, 30 Apr 2026 11:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NYoAO0Xo6F3IEHdR5a+M66oRDmH9iXSBJk5KxBuqk8E=; b=BRyXrHs0FayeLJCEoDNXWPtpeK
	LfP4f42hMadrTWFbo0H58dViEazaFxAkirQ0WFEog9sKacFFEhZ7mPLTE7octKFToMV+BUpRdw2IV
	+9ZnYdjBkpBnXuW6DczFWcGYT1GwxLyDP1+iaM70IiRUMHZsjSRoNN4s7HOGflcBtXAAUkoezaBPq
	09KrZlqAIviVUzUTnAJ3TLB6iAciDb2dI5OJuxzMMPEETAEH9or51vZhWt8vL5Yxc6JGYd3MuZK6k
	2X+pI9BWMI0UcyOxfeNWUbgbK5ECb0/btD7a5e52VgECEo3sU5NVKSIfYdNxO/ezAeD3JV+u9jnFU
	FnEx7XOQ==;
Received: from mail-westeuropeazon11013020.outbound.protection.outlook.com ([52.101.72.20] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPFB-000000076ib-0da7;
	Thu, 30 Apr 2026 11:07:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9Wt+sgOcCMKqxZYUeOV3Xz+rb6TNFPKff32yjtncZbEydBG3HyYx+EKob2aYoREThXWAjz1DTcIwigRzHZjzqv1Fb5Sdapa84nHXuJqsd+sEdhSszhSXFCK1xCyGJZutODUJQl+XdLclWKewopePSg4ENvbuM8nexhgJGXtcsGIZ18MCOY8V9bH+1lANjU/2UD1fibsJoQDN2pKVxg8ZNmcMbsJz0dijHxHPRwciZNnYHA2ayQOOuwDjsJdce+4Kc36+cr0x82eoCYRbDQpm1Md3eenPAOx7DBtVjKebSNC57n7jAd7s7P+Jp4/wgF5VtHqM2znFkHtSFH1oC0FUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYoAO0Xo6F3IEHdR5a+M66oRDmH9iXSBJk5KxBuqk8E=;
 b=IIyP7QantjZ1enfZ4hjqbClSHlYlU9W1GHycbSXkomPcd6QboLwxt988BhfuxPyQzgyQyPXQXui41ssTiDgtVrSAASYk2M8ObQj+1i+i5Cqf0GV75zv4qkGy7+/AcCDs+4Pof3iB/oIp3DyiklQi7G3OqhP05b7k/H0URJA8guBFebNK/U7KKzXnx2K1wEkevh69fWVh38hR8y7Q669Hn/03wZoXRnNim5YvxF8nakhYbQLqClKJ2jFJ7Hnl2Xa+LrNOuPG6X1KrMVt6zbgIkfEJN6x3SkFB7KAzQ3l2bK5BB/8gfk8ujOPRoghlV8EOasJr0JaqBotyQkk6VzJvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYoAO0Xo6F3IEHdR5a+M66oRDmH9iXSBJk5KxBuqk8E=;
 b=nTDb1lpF0ixYY1bY1VYKhV+y8paujEP36dO1zGWldaFKKs4ACgWuwc0MpgY7Xt4miFtDRK46ywgNeGarKrgXMXKdDiMmKyT6CkeHUmgUNnd3B+1RvuChq1gq5orN+CCJfPMDXNEYrg64XFfvyI7HYG4FdeZ//RMSBkZ6CMUcUV69D36QOKe3mF54C7C/MvThyics2CYBQnUvoNBlx9eU2wZoBRUdWIdfgZrj0dcGntcRosIqIqtvUCPWZ8Kg8gS+EEiP3Rn7fdXHN8t64xxM3bv08j9JY6l9RS3v1bFNSh3813po92miLxsXjYiLuxd83G+Mlh91rd7AIMwuf0oXrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10583.eurprd04.prod.outlook.com (2603:10a6:150:203::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 11:07:37 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9846.025; Thu, 30 Apr 2026
 11:07:37 +0000
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
	linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v7 phy-next 23/27] power: supply: cpcap-charger: include missing <linux/property.h>
Date: Thu, 30 Apr 2026 14:06:48 +0300
Message-Id: <20260430110652.558622-24-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430110652.558622-1-vladimir.oltean@nxp.com>
References: <20260430110652.558622-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10583:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f85700-710a-4050-9753-08dea6a8b019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|10070799003|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6ZPAkq80cN1vzhq3p1T5YtHUW/QhUfx08KbVLr4uC0hupgSWwphINffwaDNwxssLxYJamXZed4XzcOJP4CU5TFxC4OTSQdn3ggngg5J0OHAXsGBu3daupOc2b8c/7PV9W5OW4TLA/D/Bf2CQkDaNuCGfEfDsGXcrdUZR7v31iTvGSJ20P94TUE02NDvQFFTiKgZamZjFRDeUcXsbj9y1oxv++MHfRqczg9Fs2iImfXu+FfudO+Pq4OznJKckjGTFzQo17575mDFwooqf9KnFm92aK4Fa39oz3u/W/Yxg9HE890O/VJvxzO7iIuqkY4BdYPbRkZjvBgw97E3QCa3ptoJg1kHJkCpXYbqcvu6ueI8zWGxBdJojKhG3BlUl527cytkHa9lbS1GfrwSh7fXcpmmnpFHHXDcoulmU02QdeAB7AGGe3xx0osECjsuhg6sXkrBDQ1cme0R8GKhs9wy6Z6MprMAOQXsmzMj7GcOIe6mmKFFhuhNDa/8JFXxjAfMDCXFgkexGVCocib+6iZDWzyNfoxIKalia5uEj8WBKAa4TFfY2SkqZ5A//SlVBcDuh+4bvQBO4OUbMmx43D5Oe3a0x+2irUKBUpo9Q+b8UA3+4DJmnenuOCOkomMb8jsJART9prTwfT6yvrE15uOSxOaDM8il4utKMwimzN6ad8EvSLK4PUVd81VFFPpfG79vHrl4VPStxTTWi7QSqJSFdh7pXws/dMKF3JbBg0FwNBZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(10070799003)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UcbtH1V6qak90plvja/ckAEr3G4WNmdfzRfPoaUEHqDs9Z3F4B+w1SuwBedT?=
 =?us-ascii?Q?r93gtYj4cOxbnr1v/MfK7R/wPu8QPp8+hFX3VIyWLhI6KklD7X091Rtz85JQ?=
 =?us-ascii?Q?wijo0HShnonoJQ8OUifvI5gocipigUS+xJqIEVLjVB5V9XBoHWIcTGWXNsPf?=
 =?us-ascii?Q?F1shZYfxEzkLradm7bu5nx+C1scCildXlvTfchU1/6t5tVNFeQ73tJwZuand?=
 =?us-ascii?Q?qPjOhp8ya7hFxj8S71C12cihX5mtum0F/Z2xoaxZ1QyQ5quw9MDf+n+no4WX?=
 =?us-ascii?Q?zqbSUnVBE0PxxpiUuY/+pCeCMNUDtW0ZfJmuEyVoz6vGnlv0Fv/SKn+GOfox?=
 =?us-ascii?Q?Ye0ciJ59cBnItpdy7Hw6TUhxPd4Kqxa9RqUcXUDq8PvmysDVJjhME6rx7rnm?=
 =?us-ascii?Q?oi3ZNuq+hnGhKYwEfYaIY5lC39GyI6k9GmThBPJf3si83pBvW0hI4vdKJD9H?=
 =?us-ascii?Q?GY34U94RB3UEsP/5FXHzsLt132yleleafZzyKPEGEhHbCHAmcGvsw1B0fALF?=
 =?us-ascii?Q?O8rP11GQeFVezEp2+PXOu3brdvPlXFtn6M9CxLgoJhk1TBM6Dwo+3dNOpId1?=
 =?us-ascii?Q?VQ+0bb+LetpBroopOGEmkRwFOwAuIz8SzPirhkPb6SpbVKQSJnVh/QmN2W+6?=
 =?us-ascii?Q?3qC7Xi8XORK8U75DEyiwZs9HoVNDSogXpC2ULujzUVywFngDj76hbboGKu8I?=
 =?us-ascii?Q?CqdDzXUoqXxlOVwz/XsKkDzG7nPJEu95/Kb8xAcN1jPDecvsn3TCOcpQNOOD?=
 =?us-ascii?Q?gb3iTGKBfrOGFquJyPKhgLRC2iKOoshs/9569WlFRcjWicZFp0FmvBs2pESE?=
 =?us-ascii?Q?blQGz50UrUmEaE76FxWR5GUOkGje5j+iu1Ay41V7yPLmK8+MwdEfYLqdXVmc?=
 =?us-ascii?Q?KByMEd5TS96uS9C+VXB97oESmJOtlcj3tS7lK0muESQ67EN1Tf3xOYvrXoIw?=
 =?us-ascii?Q?Cj0yntH2bjTqIV9u1lvAH+EB6puRICtFXD5cykXz80lzhoS+tlzwWQUzcteo?=
 =?us-ascii?Q?nQBYOieqttO2LySZSivXN4FRUV06m0HDs7j6xUB9lbz78jOX/MdhjKvm3wNL?=
 =?us-ascii?Q?zbmNdGXb9r5BIya+V0CvZtgdKsV1aWA4asG45mmSVM4zsMAVDBphQ3RACXjp?=
 =?us-ascii?Q?LJikXWlSuJGWiHJlQbOTev2C0ev7VEv0VK3N9FtPq1yFwackdITr857/6BKG?=
 =?us-ascii?Q?DPNGt/eSL0kp/4OzWu7T4YX16X/sSBH2aSxBDOUJIDb46K9mWbDY20M8wJJQ?=
 =?us-ascii?Q?gqF5CSGpnl9Hm9VsANV2BZGcj+ojF1LMKEb+TKKgP9t0yGOleRp/+XNbVIbl?=
 =?us-ascii?Q?CuS0erJ3jwc1Fb97K468KGOGLLPiT2fKxM70xaGTJkQMJfidURC0JdCQJYB8?=
 =?us-ascii?Q?rQXDiUw+D70xKQwFsaD4BinxFOttEw3YjDwZ1hO5McU6uEpTvWLQjqgIPsJ1?=
 =?us-ascii?Q?zWgxhEwvRgsQ7iRamoaqENqLacQLhymJVl3molv7N1v0OFLnYILh9StlH9od?=
 =?us-ascii?Q?552K/55rpO2TdO3E0eEALaGugIMikA9bUjRiJt1VV1hGO2BXBpKCj9zAf4q2?=
 =?us-ascii?Q?JfPma2vD0QxYNhOisFt5TtBBOq20FeFd/0O5LrnnkXIfdZjHR/CKOmVOeCK3?=
 =?us-ascii?Q?E86+O18v5FGVqqCT9FzdULFjHKTa/Ye/ot7mGCZE0WB/DGvPi+Ed/9Xxup98?=
 =?us-ascii?Q?qJrAxNle0Aec7wf6RAm3JD8+tfpsSrj4GuWcDC1+GN7SJiI5Pn59FtyX1WGZ?=
 =?us-ascii?Q?w2gRXyA9MhPEsMLi5bts8jl8R0xk/J/wjFE9Uaq65bsMZ+vLInvI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f85700-710a-4050-9753-08dea6a8b019
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:07:37.3213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByjJ3dPsSFvgX2VcZQQWh6RfjFxgnNe5+niI30WqhEGSCQ8CcO6olw6Onkw8Mlzn3g96H2ekW2NGNPtJYO1Ceg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10583
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_120745_469760_CB461FDB 
X-CRM114-Status: GOOD (  10.02  )
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
Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Cc: Sebastian Reichel <sre@kernel.org>

v2->v7: none
v1->v2: collect tag
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
2.34.1


