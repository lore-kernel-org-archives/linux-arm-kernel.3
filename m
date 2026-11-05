Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661D1606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 06:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tmVSx4nW;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=J3JMI5oV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rr048qY3HNr3QsWAPMsxFmYMKWEuae4XAQPqDeEodXc=; b=tmVSx4nWjRc9xY5Add9fKwMRd+
	k+uKm+NUG7CyL1QNQYh5qtIxkTjSytHfhp/QH2oGGqec2azgfDbjeul6l81A1i5fNykbJVovzIjh8
	ai5iZBWnKKyZUMWKm7lDMeY3S76OLLCmtBNVz9cTNJZ8OGY+qRpdbVOI2ls61VIIcnaptB+iMsjgY
	cP3D80rzo7VXgi0TVEeayZScLuw/3SzlsFzEy2m6Orr4Scl7802NzMpKQmd1WPFPIQEpxCPmdk9Z7
	N+YrwH48Illf6wKK1ohQSxWgZje9QiWVou0a1jdfYThzj+EDRHm7YPKnuLej76MX7Ju8BnDYa19RE
	pRcgv/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrAG-00000007xoV-0Tku;
	Thu, 05 Nov 2026 06:41:36 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrAD-00000007xnq-2fRF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 06:41:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHIjzWpnFNF9vi2yFghMAt6cLND3iixSGeO6SPdHu/0DmeeVBMYIrpsfVr91q1hpiRt08HpO5nXozePQ1apyHH/ZCdwQL0hICJx+87FdIQIn0WEZPfR/LxQljymxvSlpPrXIHfFpKOKtjCfVHvae6AmK2DwNGcV1gGBiV6bWj7xGp2jCjNHxeOapBf00y1PWPUx3k23TddSo5mrAWATqdi9d8q1tywvImWe+wbOJscHgpGigMThgAZgwKBR3sbBMWLlf5P21NOYKglByrL3NZC5zIIwv2e21YQSlwVgfhwdlsiKFcZJiBlEO0Crf91MiMgXd/BmVcxisJmDpQGJScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rr048qY3HNr3QsWAPMsxFmYMKWEuae4XAQPqDeEodXc=;
 b=j8Vsctp3awcOpYEPPwHdgjU/d2UufZn9VW1tfAcYrP68nZ2k6lQzboEOaDuIQTLwS1NN9KG2FxaQMArdVr7uDtI9ztrrtCw5XMyqQSlr99N4fWbwtzrFt8FDJefaGkdyiMAbxH5PdzkZbKlYiC+iWZOyx/N5M/EUyf9i/PcpCoNbDM2MbOGy0WOHyl8olMNr4ZW1w+qOFUaQ6h0fiQ1uUKVJks0DdfxKmLQj5oY107PQdFQfbvu8hJFgMH5bUb8PAzKyKRqSoevWSxlW6dDXsFCJnAamXvIezn1P0lNz1VoVHXMMD0uxoJd4xPrhqJKpa+gmodZRkFey2yny6GEzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr048qY3HNr3QsWAPMsxFmYMKWEuae4XAQPqDeEodXc=;
 b=J3JMI5oVW7GP3hebTbP2VMfGiHN1N8XICNAkGVkC8UoXnd0gBuVfXRZd4F+wkuCPlI20ArF1PA+V+XOSwBfY0iDHCmqvXGBLjt/mIinrzCblXByi405GJqj7ohK/IJqzzITUyjw8R5KYvbG3KgVH196LgOibFaMy1++BV6p98jWdwf5+Foe6hyIOJiJrJvKhUlaVpxNBcODC1Pg9GODBrZlSKTjTC1OIXRSicFPUP7hYzdGe8LD6mSts8vPCSZX6OKANeB2ega5fYaJwjw4iqmL8IigSfRDYz2J3zDjLudTnfGPQ/f5YVAsUCe1I0pTvLJPFMSEmLKIR85uZ/xwPVg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DBBPR04MB8026.eurprd04.prod.outlook.com
 (2603:10a6:10:1ed::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 06:41:26 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 06:41:25 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/4] arm64: dts: freescale: Add IMX-AUD-IO add-on board support
Date: Thu,  5 Nov 2026 15:41:13 +0900
Message-ID: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0079.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::12) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|DBBPR04MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cfa246a-97c0-43f7-e5d7-08df3b07d038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|18002099003|6133799003|10067099003|3023799007|56012099006|5023799004|11063799006|261026140227099003|261028144727099003|261026121527099003|261022075727099003|261021121427099003|261021123027099003|261102123227099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: +hHg0P2Kr4ycLlHvdUvfvDLJ5/HGXsXpJ/MtMYIoRUTf0C6gBNZoYPEmY9ZwTakcpNssUQanjL3ZsEsja97dTMeIsw4Y21YA6TDG+NjkAL2DyG4AwF4/J3vKf9Y/7h3aqGJ8ADZgXRVloNJ/5Pewsy8dwplmya/AKUF4kWSHJgpcOoQVRZ0MrN21yN5/xLunrBR2PUY/hWLcqHBXf3Aj57X5kI+vvaZoHRo1r4BdA4OUPfrHd4koYh0zI7PZ6YvUyT6TmaJHB3abX1xSXD29vkwZewLdFUJfN/walt+Q+VqPPBE1WnmvmaJzR1T5N+ojQYV6iiVonYm5rPKj+jKV64WyDIaXFuGBbHRapHZQGAUwV7yqsLjozWVfjoSgPfKy0MwUzt/bDeF4v9cKNQQ/uSqa8tLFTusZJYuMuITM5enleJKSbRDOM01b2ahRucV2sTErF3DLAJBZOwdCPWLebq6HLCv2434nOJoW7UWWeBihVDN7DsDjgzg1N9nXoidILpsSNUWj9aZ9XxZ9VJrLVP/NGShTWtGANpUHiXxyA9S48AHzENjKtUGD6+/j41rXiQ+5s+t+yHVOxloy74g/3qMO+eLYxUSZ6H/l4tcDgT/AOEitIEXnz8lbv5zQr6FM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(18002099003)(6133799003)(10067099003)(3023799007)(56012099006)(5023799004)(11063799006)(261026140227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JYX6YNXWvgS9ToFr8TtUiyE4HnPfuI7bstm9wnY/zh27GIOp/XQR+Cfzk50U?=
 =?us-ascii?Q?+FDOmVtmZSbcO1TpWpQaMi8yvwIjLSlGKucgRprB1Np0ABaNsCrFBKgibZy4?=
 =?us-ascii?Q?uL3KzfpWMG1tNB1Q8cNgK6g7757vKVye4lUi4JX4vNWn1X186D6eOU/+pqZm?=
 =?us-ascii?Q?jE4FRELCIUxuHhYYyoXGELcjhM8g6lLYdGxNvk7Q153ACkKkNGCiWXbOYmJG?=
 =?us-ascii?Q?/v9HfNGKECV41brW+5AoWQULD1n0FDlqGUF2mgAMDGwrCAlCd8k5mGjvDakn?=
 =?us-ascii?Q?YdZcIoXxKEJgeHZ3mOEnWOCVRgmpR02Wlqq/Xq5Po6CGnKt+PXtdeiMMeW92?=
 =?us-ascii?Q?/BiEwQzlbdwcraaJGuxEtAGenuWEcdCiWFN+DXONd7l23iVHcWuGr6l0glm+?=
 =?us-ascii?Q?O1tH6sxw44yDYquZPRqReNgYy7IIhPr/99c4y1MM1fdUfI3XvMRU/NvYGqhX?=
 =?us-ascii?Q?J/TO975JzVOreeOzyQ48cRVhfYFrLgARBEk01e2U8U2QMjeA4Ph4HOcPXr+0?=
 =?us-ascii?Q?35T12iKnSeMqcd1TN6LvRKll50cu/Qb/w5VkMYRjkTFYCbAnwSOzgVWNT/RY?=
 =?us-ascii?Q?osadso6UwMi3i8ceohdVT50JyCkjoDuR/f7J7jczL5ah4+NNofeIDW8Se2qh?=
 =?us-ascii?Q?6iExjKPds7yvhqoHUFtZg1hi1ICzA9N/ykBFB1bKiK0d8z40yWC1dDtTimQf?=
 =?us-ascii?Q?axSueO6Exie1ZuGxgfjheQPbe+yRrJkwnCl5Y6ejwiXOlqe1jOfhs/9xFYWA?=
 =?us-ascii?Q?HA+Z+R9mqBCxTk3bDVD5lT+2ZROtQkAv4sOVxTJY3A4bLYLcZ3N0hZ+yaEV0?=
 =?us-ascii?Q?rohcm5XNk9UUqW0GJ8bhwLIthz6R44VefeV/ZafYD/nSJ8OrIpHQrUge0KRb?=
 =?us-ascii?Q?82ukPUG2yMGpURGhIV/kRD3J3ZPt5IxWRTzKC9f8KXnappkCHEgtQ3ztKZH5?=
 =?us-ascii?Q?RnlebhmNB3MzHmNJryvfJAaz5eXyPnMtylcFPE4JlAw9K/hUz0dJhbB8R4zd?=
 =?us-ascii?Q?7+QhK6L+VQ8W1psGexnw02I9CEQkR6i5BtcwHe9cVBc7k/SWwMr64Wmn9Ahp?=
 =?us-ascii?Q?JpPComxhs+bN7oz0BBraXJZt2iTEUVphvbuKpnfSNwsera3nBO2niFzCiKSB?=
 =?us-ascii?Q?ahq0oLdHeCdWecJmMAc1/yG2S2F9hUo+TdbPOJxuIh9I2THwDrOCz141GyDf?=
 =?us-ascii?Q?Vezi0dIq57DO3Oc7tkCzOitwtjUw3ZNGViy6mdI+WhEhkovtQS1OgJ5zhhru?=
 =?us-ascii?Q?m1yLeji2n8Ql85riv9o6FlL7xZSIixfso4NP92JUdvBjyoG9aTdkacXRFzFc?=
 =?us-ascii?Q?T5OQuhSn7dLL9f5rI6tDWYKFoc0S7pgIrioIioZP/K+uS1x+guZWYpnSsma/?=
 =?us-ascii?Q?JyQYt2Qa9JzTp/xq4AyNSaDKD+tByu+9SkeHExQxYpy2k6UCSEopKuvSHzkn?=
 =?us-ascii?Q?e4GvGLiCcLD5KwNy3CeqIsGQYip3mHuAe2AHH1iw8ctChPSYluWLQvar+JRs?=
 =?us-ascii?Q?N7Myd/CsMofhfbu+o/EWs8G6Y0WW6WQAQK8h0tHbFGcqNQMSnI2GUU4ECcui?=
 =?us-ascii?Q?QZitgLBCXiBnzCaufMZUP06aw0O9K+PeqbXOETRyWodaLVyabAwSCpi3oCV+?=
 =?us-ascii?Q?pDOTr2Ao5w52hcttVR/5hDHXlp4jze83CVoqCcP1nBWBWcGY0U0uwriwxY4j?=
 =?us-ascii?Q?4UzsS4v2ATnQojE8ziCONqz7YmH/ebF1WzxOjLqgj46GnMXXP8CJkebFifOE?=
 =?us-ascii?Q?Vy87V6pgLXHC55xQmxMLX5UESQrJs8dEFVRBN9gqpEHIIShXtdeL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfa246a-97c0-43f7-e5d7-08df3b07d038
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 06:41:25.8010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWReM7BhGlWjzPtTtwV/TWmAg2D7pdrMlWoYNpc4DcweTk6mvnoSbfmO9cW6srsPZXjqSK3VBhvsXssZ3qtc9hRYmJBAGgpczGyymXe91CQnNIqhxe2+T4GtyYc0CwcU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_224133_712935_3F6F4B47 
X-CRM114-Status: GOOD (  18.23  )
X-Spam-Score: -1.0 (-)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chancel Liu <chancel.liu@nxp.com>

This patch series adds support for the IMX-AUD-IO[1] audio expansion
card on the i.MX95 19x19 EVK and i.MX952 EVK platforms.

A connector is present on the base board to attach the IMX-AUD-IO card.
This connector is described by the fsl,aud-io-slot binding. It acts as
a nexus that exposes a constrained set of I/O resources, such as GPIOs,
clocks and interrupts, through fixed electrical wiring. All actual
hardware providers reside on the base board.

Also update the EVK base Device Trees to describe the connector and
required board-level resources. Add a DTS overlay to enable the
IMX-AUD-IO board.

The approach used here is inspired by the discussion[2] where a
connector is described as a nexus mapping board-level resources. One
important difference in this case is that the IMX-AUD-IO add-on board
is not a hot-pluggable device. The board is connected to the connector
before boot and remains present for the lifetime of the system. As a
result, the connector is modeled to describe fixed, boot-time hardware
wiring rather than runtime attachment or hot-plug handling.

This series depends on the clock nexus support from Miquel Raynal[3],
in particular the clock-nexus-node.yaml binding that defines clock-map,
e.g. commit e0be7b4eedd3 ("dt-bindings: clock: Introduce nexus nodes").

[1]https://www.nxp.com/part/IMX-AUD-IO
[2]https://lore.kernel.org/linux-devicetree/20250902105710.00512c6d@booty/
[3]https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/

Changes in v4:
- Switch the meta-schema from core.yaml to base.yaml to describe the
  connector as a nexus without gpio-controller.
- Drop gpio-controller and interrupt-controller.
- Drop the explicit gpio-nexus-node.yaml and clock-nexus-node.yaml
  references.
- Use 0xffffffff in gpio-map-mask and interrupt-map-mask to match the
  connector resource indices.
- Use 0xffffffff in gpio-map-pass-thru to pass through the complete
  GPIO flags cell.
- Include dt-bindings/gpio/gpio.h and replace the raw GPIO flag value
  with GPIO_ACTIVE_LOW.
- Use four-space indentation in the example.
Link to v3: https://lore.kernel.org/imx/20261103070433.2307145-1-chancel.liu@oss.nxp.com/

Changes in v3:
- Drop unneeded clock-map-mask and clock-map-pass-thru from the binding.
- Constrain gpio-map/clock-map/interrupt-map maxItems to the number of
  signals the connector actually provides instead of a loose upper bound.
- Narrow gpio-map-mask/interrupt-map-mask from 0xffff to 0xf.
Link to v2: https://lore.kernel.org/r/20260629074734.3643227-1-chancel.liu@oss.nxp.com

Changes in v2:
- Drop [PATCH 1/5] clk: Add support for clock nexus dt bindings. Same
  change is already present in Miquel Raynal's ongoing series
- Drop PWM properties from binding. This connector carries no PWM signals
- Rename compatible from fsl,io-connector to board-specific compatibles:
  fsl,imx95-19x19-evk-aud-io and fsl,imx952-evk-aud-io. The i.MX952 EVK
  uses fsl,imx95-19x19-evk-aud-io as fallback
- Add property constraints instead of redefining common types
- Fix inconsistent quote style for '#interrupt-cells' in binding
- Add required GPIO nexus properties and reference gpio-nexus-node.yaml
  and clock-nexus-node.yaml
- Make gpio-map-pass-thru a const value to pass through only polarity
  bit (bit 0)
- Modify dts accordingly and some commit messages

Chancel Liu (4):
  dt-bindings: connector: Add fsl,aud-io-slot binding
  arm64: dts: freescale: imx95-19x19-evk: Add IMX-AUD-IO board support
  arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO board support
  arm64: dts: freescale: Add common DTS overlay for IMX-AUD-IO add-on
    board

 .../bindings/connector/fsl,aud-io-slot.yaml   | 96 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/Makefile        |  4 +
 arch/arm64/boot/dts/freescale/imx-aud-io.dtso | 57 +++++++++++
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 52 +++++++++-
 arch/arm64/boot/dts/freescale/imx952-evk.dts  | 67 ++++++++++++-
 5 files changed, 272 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx-aud-io.dtso

--
2.50.1


