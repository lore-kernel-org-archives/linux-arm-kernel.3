Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFC5CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fv65nKp43OZdEalV1z5tijGZgq/KPVcBSktu9V6AazA=; b=NHbeQeFLMqJfsNq0gEQd/5aGrG
	A00PvBUuiABwMb3ANN9I05FHGtM7L0r1ZAL9aaTuFvKxbrfORQMU3QC9voojjgJvYiSm6YfI7uoS/
	c7n2NkJw4fRnmJzOMYds8FCoTKK8ny3ogtTT8sJDnJn24svjSqDLXCExI/fYrbh7qloHWqn2ie6v5
	Uj2mYG6B5qKazQuHQ0btZzZgRNRgDfEJ+wGFqTIx66dyYZ+8lJ4wxYjnehQosFtPCFPcNj4P+9OAc
	JV7CVp4bEhfQtXudXKgssnwLzL/zSd3Vhl8jMeZNKf8SDPfg0zD7CcUBNx2WYIigI7BMO4hoA0OlI
	S/2hdiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKChT-0000000Fob8-1GHx;
	Tue, 05 May 2026 10:08:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCg8-0000000FmFn-3afB;
	Tue, 05 May 2026 10:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fv65nKp43OZdEalV1z5tijGZgq/KPVcBSktu9V6AazA=; b=Sh79B6AL+isoIKerDGwDctn3io
	fSmphcOylNQ5MQ9E28t4qJBLdjvLxctmIfAu0ncWwq/f92YvsPI9FvrhxzFwdWC+MvG52GOignlY7
	DsyvOO8QSi0knuhPeRUbXMP+1OJh+/5CWmak5vbBqX5gnSaXyBSkzyPSKB/5neD53s1zeoXhQJDut
	HG+Nteql40ToEUIylg6jXBhfUWpAIO2f3qrNH6Bwf5BKuNrQtDA8Oa+jyK75hiS2WLuHYZGOm8ybA
	W99B/NtQRCgvTgGDZ2O8gLybvZisCvttBfmuSm2+eLUQ5UlviBqmGB/R5N4QQ3gITQzhgBvB7nRJK
	aNPMz5Kw==;
Received: from mail-northeuropeazon11011013.outbound.protection.outlook.com ([52.101.65.13] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCfp-0000000D7xU-39a4;
	Tue, 05 May 2026 10:06:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsSnW3CH17mj9OJzuK6q+JgbYBBYh65r6ODlyadVo4j8wIomivQHKPtDhZaz2kFYwAGIHPUksF9f7qYG8DU4F5CWfHrc3+uVdSka06goTT3USTda6Cobxbu2598NtepiZrtlVF72Pt6LKxfCi0kXxZNZBW9q+1Nw3eufFryjTp+OGdrbourYN4QLogV8XiwMoaNBQoW1vrNDPScOdkVw5D+Gu393QtNlz74QIX8iIwdM1ma9qmfQciXEvM/nS5GooCg+iU3HDKFNO2rhoykx7tYl/vQgX0bA4JOH1piIRmlqSSax1jy+z1qyEY+brcchdxru+7lITyjPgzvpufmLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fv65nKp43OZdEalV1z5tijGZgq/KPVcBSktu9V6AazA=;
 b=X6M+wWEdFZti6gpOkMyAERhX1A/tLeBTG+4+C9p/DQ9h+GuTDpjprNddObCfroFke0rKZXx/6VnKeGWYU7wMKT2WnpUi67kXS2BEMFn5b3Tm7GONIP7Jkf39FtVca0wJlhuE547cv0a8yVni322K77Op3HUv4OlL0bSwCeuOaJEP/gfa4Xl5JJGOOfNAbcxtLNXTl1w2k+8lXy/Yb+1DSCCv3TttDbYmorcxglTpqVSM0YzKUtVAf1vPjoC/qDHLlyGnLmIQDzrJDadBGhJBXkOUdnUTifEfEPeoGL2ejCv4gnR8qireRDO1zIKo6XSrPQW/hrIQwXTDQ9aACveWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fv65nKp43OZdEalV1z5tijGZgq/KPVcBSktu9V6AazA=;
 b=I/PF75AW0aMxFT6wHHLiRWAGX/4FMpjmz3MaZYVLa9Uk1og2DYuwG1/xQvoFthOfd+fW8EYaU4EjLgcQb9/Y7Qvigp/N2EHFVbpAR6YdqOwJeAK9xbbxXtyb0yO9tQMH30cGn80iIp9EtxWLnAQKjhRvF5YqVtn+zKPhEkq9P2GbimMr2RsOhvNzkt6dhtV7tgLw1jxjBhIhwfQxDzQUhjqF9BnG/RA8qWqd/IurXwA2pT+cri29m042srDhV8oNvBnJFIju6irhBN2pDEe/EbW2cWcdwNEN7mt/M4KU9CwOmzqS7WSzml/ZkbJQ3w5988vA+D4PVi7XwL5qV0gdJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:06:34 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:06:34 +0000
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
Subject: [PATCH v8 phy-next 26/31] power: supply: cpcap-charger: include missing <linux/property.h>
Date: Tue,  5 May 2026 13:05:18 +0300
Message-Id: <20260505100523.1922388-27-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
References: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0323.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::6) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d54076-9964-4e1f-bc8d-08deaa8dfcf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hlrbwWDt6yi1JRLyyUZokb605EaDA4gzVvJI+mMmJMquMqHmwCuSD5JnHTDgX8gcVeUT2zvEHQNM58XBpO5yuRWz3V0yRtGuq7aF4NPOnf/6NuZ3gIodWLDTnUbF0vsG6ULuW/Jli0y6ExBjOuA908ROYgEer7bzlPuEjOFSdlou7+fCKZ1VQB8XsOQ6mkc3DVS3ATGsq12WHDNzfQRkntLYB/GXsAd4U1QJmIkbo95nBU/iHgulFriV1oz0mWQ65kMbJ6eMKTDP83/MUAv9/DJIeE7X+nCI8GwABi+JC83Q2BURgLx9PmvvDB0+cX6OPAK/6ylo/tUo1oSdhFEbPVqivmh0VR1yD3UB+RVv7zSnGuQ2c/Xh1GH4+aGHlvozsSpjyAZLbYXHV+fFd4yWuyMBcBmtonWsPBM1xqb7wMPB48pSR/Y8SJsMaMKOvODEtvMkRqLe190TyW8BNf+zq6Yzqr45Gc2kzwMKEECs8W3qfJoCJPdydAI6+B2n9SmFRYwy+ab5mcFL7nmHWCpdT8sAa4IDumPpTfgf8kSHJKZv13zqLgm0x3sHLUNtxYWBZGROiFe7I64H2cm4d/j1glkxvpCdFmKIkWefsan4DRFO4klDrxge+myqkzoQ1vByrGt8xOXoPey6EzXMMYs76J/GRLRXxIO988h+KxIhdpSdawh4re4bZByHJAEtQN60
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?me91NVNy/CE1y8DWXsm+pT3rug3HN82KspaeReTq+xyjJTu3EaWozwOSYQty?=
 =?us-ascii?Q?szyXW1noauzVxXBtLQicE6dReNZvajQUGc1/vwU/+JukHyT57CTIGwxIVAsH?=
 =?us-ascii?Q?EZeK3473recopg1H6DwC2Ls4AE7Q6Kv5SsfC/zjn4iEE7dVYy2ytWLwDPHss?=
 =?us-ascii?Q?rmWRAlFCiDE97K007MfWCwCusHWW0edc0AIBDApYNxr501CKcc01lT8mbkHQ?=
 =?us-ascii?Q?3QZojr46tC8ZFB7WTbiUzvWcIsZ1Jail7tAmMKSidvyj17lgI7Jre3xdCBsJ?=
 =?us-ascii?Q?CnU8/Q9lzL8itdWbjJ5XXfDry5U0bulubTFHfmimhHA7Qs04sfMXZtlm7Vyv?=
 =?us-ascii?Q?YuBvE4spW+60tV3g3rC0un+CYyZaRLjDntK2VyZIOwK7NLtmzC5sLJJWFTEd?=
 =?us-ascii?Q?AgkxOz3lM1OKONZanmLVpF1OvxYKu0WzzZ46MbqDFxLhZKu9yXHzrrBCToH6?=
 =?us-ascii?Q?vprLO5Tple8wYl9syPrA+6CVs35FfFxUHybEBPpSP2FGvB8+U/YdD+/KxujU?=
 =?us-ascii?Q?rmQFFinQxw7w+4x851P4HMmXQ40totwbER0syqK5eby2HqLVhg+SFo908j2c?=
 =?us-ascii?Q?e2nofqOKxFsQO2dRRUDyE2O9v/nPpGx+UCzZa2r+3qtdRFS2Ron0bSPlc/nS?=
 =?us-ascii?Q?9C+aRC+UJSyfBukWMmUNswuDKQVXZi1sPljmCBEuAcdtCp181r2aSUW/9MOu?=
 =?us-ascii?Q?QR9WeZgWzQGdnztWZlzg8VQd9wkWdz/Vq1r/ZztatkvpqlTR/18mNHvJEvcM?=
 =?us-ascii?Q?TB6kEz7srmlpXzndgeEJqHRWl3JCud4XPlsQpWLl5BCLe8CjBmPhfyaLhiyy?=
 =?us-ascii?Q?adR3EGc9o+bNBxjs/Tc21ZbLyK20vI4awa4SJaGIXy7NxThdcpRfzPIMf790?=
 =?us-ascii?Q?pWtWtnjFB9PrJApbedmO6tXd+eFLX1YA7upphvVZCQ+E8bdM2t+PBXLS3kP3?=
 =?us-ascii?Q?EHuGXn1m0aIH93aHybEpU2WdZn8r0lz7XwQ8HvLCGMeHz2VETbjlSOfXuf0N?=
 =?us-ascii?Q?HBZTaVta1/S+BTRVruVONWRnUFXmq9T8abqAeg255FwHWiARLU1wBICOJhfF?=
 =?us-ascii?Q?UNB+uLbNDcsGe4+QG00Qtp2uTu8fMofoY/99mSDWBoCY1novJaUipTcnsLLx?=
 =?us-ascii?Q?LDv3+zVIK4c/TVSLsKXMIeC4wH750/sggflckTyt5F0GHNHiNp95mrg284Kt?=
 =?us-ascii?Q?ONYN9Bq1YXoS1V4k3AEA42zpf+XwmOa3R4OB6bSaMacwMuh7tJahm8K6f62n?=
 =?us-ascii?Q?t+9OkpwcdT8YL4rOudHCfMIRyNF9+MPqBurOGHg9Ttf1Y39XAKb8dHaOV2JU?=
 =?us-ascii?Q?hV0dolg2pL6jCL39ad+rJwIv4boWXzczyGz5tDfqT0MS6xH9mvMW50tQTXLE?=
 =?us-ascii?Q?D+Cqja5fx6DjT+/nw8pkqv4t4S/Ju0QhLy9xXX14lzYhU0dj9AktCmwJR2fk?=
 =?us-ascii?Q?lOx6gtdyi/TxqtZ/WT+C1e+D94huphY/2ZdrIJuoNeEx5JIpjKteSKp15F9F?=
 =?us-ascii?Q?ul2rxc78xO1XFl3EK49xcnV5dNNorG4QvN04K09THDjbDuX/BlAxrAGXhORo?=
 =?us-ascii?Q?M/KTcNuocKNSfLVs1yBrP/5ktY//GHvzx+3+mYYUUKzcWtqGWVHE0ee6oAou?=
 =?us-ascii?Q?VrU0zFA1qr09xxGHy5A4uOky+A/wJtP/5XGsBte+buOH3Ct5ADFFIxYtAlyA?=
 =?us-ascii?Q?T+mBSbG/CO2wvmFB7I0S86pqgE8MW4QbcwrvGjKTKKh2RmLBc5TEANMF0AwF?=
 =?us-ascii?Q?6cyYAkn6eg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d54076-9964-4e1f-bc8d-08deaa8dfcf2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:06:34.5510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oB9HGKCtipiB5s+MLoceA0kXCDdXHImxyUMKntCf+Vc5dRxPozpdK5u+M6as6DN5nH5iS6r7EPrc45XUAiE5BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_110644_929385_5C5082E6 
X-CRM114-Status: UNSURE (   8.79  )
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
Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Cc: Sebastian Reichel <sre@kernel.org>

v2->v8: none
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


