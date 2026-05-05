Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FDACD343C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjpRsip07ivnO3WjrdxC5newK65dq/EQfEhmD+RrUBQ=; b=l4VX6Jb0r12B0Ch49G849mf0jl
	L1Sm0OjKbBDeMebSAa+xfqBVI1DRuC5R5J/yg5UCcpraQ5xcntX4oS9v8FgXPEBtHsB6eOPFksX1v
	vhKdwiFRSRvGAiIXHdnOCszQgOJbhUO0RViafVkfWA6VPL5JiXlFDcFqaKqdwemNFCGHlqne8mnv/
	kyI017yp/Qx+fkQEYAdihe9RD8wMWo6KSmSFEMPAMTC0qgKJwfJsGPTrQwF00uyZq3Pc64uN7txyT
	v9fACUTNy3837783lu+zHlxv6Im5L2/3I2wdnCIau3ufsTOym5dd8ntSWDgNHIDc6LSrV14qVX1re
	YDSy7k1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCh7-0000000Fnvk-2vZo;
	Tue, 05 May 2026 10:08:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCfq-0000000Fls0-2VUf;
	Tue, 05 May 2026 10:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NjpRsip07ivnO3WjrdxC5newK65dq/EQfEhmD+RrUBQ=; b=VYdujNTjfI3ZBZPUyQZ0wdV4rz
	6BGUpdlyf5Ez2ASI4Nz8vtoHkB81I+UT3VUS/k7R5dJ6pnV0OLzL6fWfONMdu5fVj6WfjWnRDIHu+
	PxeTSD8WvIjdiHZdphN9oWTAWTf52RyV/t0sYJrGvMgC9zrX4s4ukY3XiBGtYxQWpet6yuE4eHyTU
	IV5qCVMRTAlCQDgeKRUIhKFrqNI7jppmDm/k4BspVTvl+K/HvkClcmXyZJi1PfwJRuZpGEAIq0+//
	ax4bmIeYm+Py5mC9UENIRzrMd8MGB9UftDcxb4TPqUmQ6NLhfz6yOmngIgz6E+yaw7gjUjITzt4f3
	bZdnVZDg==;
Received: from mail-northeuropeazon11011013.outbound.protection.outlook.com ([52.101.65.13] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCfl-0000000D7xU-33Do;
	Tue, 05 May 2026 10:06:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3h5p6qEk1tQ3up0SwcDa6i2w4BBD2NHXzLOvD/VnlsxArNaNXsENOPeeV5QvFXh9pEyg+fzxtzmqNgM46govWXBaj7bQIWJJxQDawArymYJBX5me1dCQqph2+n8K+dv5qpidJs/MkigX/ghLxp7sUETMxmHc1q0mRKYxbEw94OzkzvKHzSZqDNCNhHG3tAQez76AEri9buxDogG+ZQZpOS5/bqHpoAHis6sIm6K5oCbItnZXFVCqfYszX9qZI8XHAugY+B/xocESWwEff0nQZPGjowmmE/bE5CmuUzCGVG/BddQtuZSgvyyXzQuyM7aVqHSCAGF8vjFu2F6DRR5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjpRsip07ivnO3WjrdxC5newK65dq/EQfEhmD+RrUBQ=;
 b=jT9hQwvAYVIZJOwFehnE/poe3Y9Gzs0BCElt5oSPAkMhJEHugZDAyvLQ27mfkCN2bYP7O4ebEleVHFl8YO4TD3EgLomDvidezQMFZJs9uJQJ8+mgxmsYMHNJpWPwfAYNUekXhekzfIPeabz0G1g0XMlZ7KJ2OKKTwgMKCJcBj3cI/wPfhFw3B9PIQz0vpkhtVN18+5s9QBDZgt+aa4CAgXfGwrAQ1YGpLTD+KgX7RaEDrQUx77UVFfaxr+kCKSxMr24UcVPumsTgVcFEat69aQZ1yT7M3JTSb3khvhYxoRsNrnRP0jjVR8C/l4PBMlh9RapDpsXgeuxiJiYCUoaxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjpRsip07ivnO3WjrdxC5newK65dq/EQfEhmD+RrUBQ=;
 b=TldIzJD7i53H0gNuGCyVvdNcJNXDbGL5yPuAp43WyYNdfAtu6w/DVbtrO7UJ0Mu1Fn6v3ZYNnqx88O2Nt94yse7YLlaFftRSQzjHfqNU2iQeGGebBAXNmXuntyTupsEKAP+1sAQJsdOf/pVV/7gL6qYFFFuaPnsBJZLPSukJalaD1V0oDfFwUFwrIpx+aq7x0Ki2aVY3ADYjaxzx6/5ofomrv//e6ZfzsRYYOJ3k17bBn2L3dYsXN3p5cc9V07rzJ2+muZlguoftv//nBkcSbGbLImw1pDVUDjMFBVNtd2DJxRWBwg3bnG2O0HDi0VLlRZqwCbg58CaMkwvnJZCOTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:06:32 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:06:32 +0000
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
	Linus Walleij <linusw@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 phy-next 25/31] pinctrl: tegra-xusb: include PHY provider header
Date: Tue,  5 May 2026 13:05:17 +0300
Message-Id: <20260505100523.1922388-26-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
References: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::10) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 79dd05c8-8099-4103-0263-08deaa8dfb9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CNHMjX7syP+P9gmPDOpWzB9LmveyO8FMHJ9hYT832sFXI172f9SynUR93UxtijOkHYxncCbr/z2tSX/DX1d+UpuNe+2reXyz6fti+VKg30zI/LSFe97F7fm12z2eLapdVofS4JTh6fE0ub0NkZMLo96/lFrGjS81bhwkPe8kNUAJptwkqz7vIUFgzngUqI7G+36FqvOHvFh3hFAVTf9935B7fG/RT45ZdDST9tUbWRGxYVIxnBcPn3sWEIOTgM15Iofc6rm0YM4+UlfJBOaj73+Lhc4vZ3xNmifg8IeCqc/6bg5uLi6iftdKhOXl8PdfFNsQskkPsPOTIk7SPkLRCux5rKBNEBfaOG7vmTwouG4Bydf4TTedy0ujm7KolHkEBM5flvgWsirQ+bJ69odeTosJbGmWQNO3/ltbW8Qpiq9Zksb/qdVIQpqJwjsvefuWs8us7L/DqRBStDMWTQCp5iWGyd1S8hS+EB4cVarPbYOe17f011uME5NUI6PJCELmUVqsoSyBoHiDrzYEvgYhWxYTuUvyhnksrQYHyvOjf6n8HFieKm5iIa3iQ7N7M3YWcWadkh3v3HWs1uKj6NtVQRyQqhOtZIwzP2whdaOabb5AdGZE/gdewE9P9CscNUbrQusbJ9iZv+hdt3OZWlCKSrFMkxfIZt38AjqDTjr5dQbJBxNenwdZ3JH9wuahAhXi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vmoUeasJ2G5eE4DwPniDoGPjd/LuK4WXxZzfm2P3GVDh6k/fgHYbiZW9Bi5g?=
 =?us-ascii?Q?z6DsUcs+Sw/g4KHGIxc6evQh2Pt7xMvFIbphzkgcQkHg9jL2RGA7n0LcvxZZ?=
 =?us-ascii?Q?Ovhz8tGk9vLjblSJ7mU6wBJt2S8nW8QF4vedJmfJugNjS9IIRpRE/oMquAtl?=
 =?us-ascii?Q?Ma/kcnfX1DktweaeCbgfZ97e6/Zwo6bnB7dZL4QPU4xz3RN4MSAD0g8A0Zqr?=
 =?us-ascii?Q?hgS2eAdvVNhm0RvM/EupXowLz7IVCQYsM3V6Ke/kRBJ1b0+HIh5OU1qlTZXL?=
 =?us-ascii?Q?WSXUxhCT0s8Mk9q6Z6Feod6Xrgd2tRYqd2Mlk0rhvQRQXm1NfY2JpAhoA0XQ?=
 =?us-ascii?Q?GwnV4dT/StCvTRyklUM4SAJeAPJL0FfbArR44oN23GK9ESaDQbwXiUu5u84O?=
 =?us-ascii?Q?FRJ/gpiYCsdXNmJ2CpAL1d2XpX3GssBLCGAFICGPMPRtD+c4kDL00vMchKIj?=
 =?us-ascii?Q?xgGJuLzt68yOXLWR5GA01EB1Cmzce/JD8S2LSRkuuuzRGbo9QoRSAv0tWdbP?=
 =?us-ascii?Q?2ump9Sl0Kpp6+oYrFRcTnFjZzJYVbPUsH6MKOlDnxOPNIfNV22F6ds+LK55E?=
 =?us-ascii?Q?txsmLw2Cy65267C8GJICi1Vu6gQwqBPGsSeEmR53kCJcNrhZLTZw0oft1SGE?=
 =?us-ascii?Q?1dJ3lnLCqG2huU7qC3fWjXqVleiYOr+Ldm4aTzRq6smgXS3XtfmXhFKr8BeW?=
 =?us-ascii?Q?WPxqtXBhjfzIdHyNr5tm1fTSi+/EziG73fTRPvhNVT1peadXejXvwoYinq5p?=
 =?us-ascii?Q?4ZOnIG6Woq2N6ll6Z8+J+LMk/WzuFK+l685CZezqb1m+sqQ66uEKCLsnH0U7?=
 =?us-ascii?Q?bIMD8FNDcKVXXkAWXZdA8IAtQtkbIc+aG4BuOCq7GtY4o+OY1Ee+HqUaiP6g?=
 =?us-ascii?Q?o2/QhKu3mvx8hphf1etMfK2Sk0Er2ag+V+ZeG7kFEhWn4Ek5aBe6m4FqLRuW?=
 =?us-ascii?Q?tXKUObhB9aC1qJ2W8i6fpOrY5h2BgylNePfYlfQrxX0x0SZCkzTmvqfn8mzs?=
 =?us-ascii?Q?TEJ1Tlo6ze5782i/RC8RSVVaikm3BW6J2U0/RV9JXlAJfLZZ0+w4pIrYKRtR?=
 =?us-ascii?Q?aWL/y+xVi6Bn/uYEQV1/I3rL+UjnYQRn5/Yl/Z7X5MlvQaCVr4lAgcWAbJZh?=
 =?us-ascii?Q?NFh7qWlUmJqhyEYUYEdnT7YxSmpbPWrxs+IlZCwHvsG+wXATU0OEpM0iCMl1?=
 =?us-ascii?Q?aoQ2L13OI0BsNZBIIBI/xvN1zWgrdc/Wd39cDGgEHOUy2QllXyC1gP5+/C1f?=
 =?us-ascii?Q?/QGv2bITASGjX/nSS+CWmVOAtIWG2cBjESWjAowq2nDN+VR5MyHMA+tJBAHk?=
 =?us-ascii?Q?Bn8vk5zhhg/S5B8ZcTl6ZcNv+aavlz/TFCKu8YkT6EJ4zjSMc0Ig2rhZp323?=
 =?us-ascii?Q?J8+psej7uyUMZ3tuc1UQjIKXlVLAnHjMYa7d2x0RamrpKzXbHNh9mwePsEyL?=
 =?us-ascii?Q?RDuCaUBsBJMd5VJjUGqMDwUtwOel5eeV95WmdCq937c42vVvpzFnYGj4HRYR?=
 =?us-ascii?Q?oxTgHDHPIBbFfzx7X/6bbOtWBEl7NcL4MRpHdlyhRdW9ONpyRcFB2TcJJJZm?=
 =?us-ascii?Q?jCBHDqf59aHoLgaA0rel80BIctptMzk162lHtDRiBjX+Z6XhALE3tL0Zb+27?=
 =?us-ascii?Q?SUeymgpHwufjN9b2o7hSLOdulGBGFOqXcjaG8Hn8AS9THsq9XvZBbYwgPtvM?=
 =?us-ascii?Q?noiJ5BiB+9SEfORBWkM9/IzYmzZx4PPoInvKi+4jX4oaf++QGWRTOLwUL+il?=
 =?us-ascii?Q?P+kPrbwRvA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79dd05c8-8099-4103-0263-08deaa8dfb9a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:06:32.3914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGuZOemYSQXY0evhz90cl3RnTA7Xh96RGNB+hwaW34wA+pfPvFGEN2c2kvgkA3XiZ97CBTB4YELMzrSdVQ7H/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_110637_805250_2BE2AA17 
X-CRM114-Status: GOOD (  11.91  )
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

The tegra-xusb pinctrl driver is also a PHY provider (calls
devm_phy_create() for PCIe and SATA). However, according to Vinod Koul,
having PHY provider drivers outside of drivers/phy/ is discouraged,
although it would be difficult for me to address a proper movement here.

Include the private provider API header from drivers/phy/, but leave a
FIXME in place. It will have to be moved, eventually.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
Cc: Linus Walleij <linusw@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

v2->v8: none
v1->v2: collect tag
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index c6a51bb21215..6b609bf685c7 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -7,7 +7,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/seq_file.h>
@@ -19,6 +18,7 @@
 
 #include <dt-bindings/pinctrl/pinctrl-tegra-xusb.h>
 
+#include "../../phy/phy-provider.h" /* FIXME */
 #include "../core.h"
 #include "../pinctrl-utils.h"
 
-- 
2.34.1


