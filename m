Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD502D3941D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 12:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xie2KyAwJ0U4IgVD+zf7OHMnpQ6RnxyPLRDcOMmZ05U=; b=dqklG1AHHo5yURPkb3Rj33gIKm
	9sfjWLSDhyak3+himXPBMxnwa0VwZ92Z6LTpMyqaHT6ZFIPSWV2IP41Cg7QaLZKws/3fSx0OXx/se
	/JGwRIw90lHNnWyM0fbSnkr4erbXBXjwLHq6HbCdJipWGAZLYawS/8fXUWQV9h2rP//fS3WMMNKjs
	AoCha7YMRqHbfTB+RGgLd7mo8MDkOBxC5enxAz1BXlsi0wlHK/0jVfNaE3JmBy7OoQo29TINqJqUr
	2L+MJQOCKlbbH+LRLUwfvVFMJ1nQ1j4MKrJEC/5ovdUJz/IXDr7B9hfuWKhthzuitGbHOwaPRG3jC
	0oXWcMig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GsB-0000000HYx5-2rH8;
	Thu, 02 Apr 2026 12:10:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GsB-0000000HYwL-0TIs
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 12:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xie2KyAwJ0U4IgVD+zf7OHMnpQ6RnxyPLRDcOMmZ05U=; b=ePM5q/q3mlZsgJVsBVA0Sl9Oec
	vM/golfH/JR+RlR8Kj82V3ARMBV7HfdZOaAAQLCiqLi2bW+nChdzNVRvMXmxkB4kD3ocOlcsYKF9Q
	8DAcRNZ0evLYybd1O/7U5rlHZD8+idDeqgiAJuIZ8MpsAvjTlQAbDPEZ+Oq9SS2VdMBhpnLHeuhj5
	2o8+m6lhJuklANDLSL2j6OJ5Dbdsmz3TMwByGVU/Mp9asgrPO5bRcxAGOgwncJywAEuNbDmw4ATuB
	tt+dMoo4ArJXgHSQ8+YALAElDwNs/q2r4jhHNEkn03FP9TKrVLW5MFohqmxpYBpHj2MoMCYIUb9jK
	VbI0xMCg==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Gs7-00000002ORB-3qHA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 12:10:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZAPfUU9NCR1ms3/RY+k6vGJV9RNHdYkCxi/stIswZ+e2Yi+j3GjcfOp7zDXlj5BIv18pjzVmTFESNALz0IZ/ClpYXHT54PmoNghlwDr4SsV9bCQg2eZJuoDPVNJwntzhOnqdvlitWXuamYMpMqle/Xdt7TOz32dSqBH3Z/Pg4aCEan9KZbOdwogM16PN+dbauleJyY/BG7SdvvZmGVx2sm3HmrV3LDUd/m+32G8IyWA/7inGKt3AHdKladSt2MG9kU7uJF1yl69XJPjhHUVbadMN084JpPMXJKvZJwHYsUqfwILj8xpRkjvRpG5DCCyE5skXZZhR1/mMQL0hpGM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xie2KyAwJ0U4IgVD+zf7OHMnpQ6RnxyPLRDcOMmZ05U=;
 b=rMieMWb47kRo82RQfmaojXyeDjWtXSkcIf9ziPyKvubP4VEZAhUEgxaidH7WGxGnQE7JKegIVFMdbg+REcFKQD2M0ZKTdNR6V+p9hR05awhVD3nyKcqAF4wY532OiXwxS7jXBbuamjXO/z2yU9Z6GzoCA6xjnrc06kWcLRcfPjV78fhWhz17vzZF/ISuY2vLJEhJfZAksIKOvt++xWGqdxz7NPaBTqgmp/JrjttCvnSYJe/QalQf+zgYqN6YinrVgiRcRtvKN9Bau84SiTvYs0cxCVCaDL79jXZ2X4ntgj+/dNbbeFaDMH/bW7Zb5vEH5jyR94VKYEvTaMHoy1WniA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xie2KyAwJ0U4IgVD+zf7OHMnpQ6RnxyPLRDcOMmZ05U=;
 b=ASJl2gklOYaJPdCQvwuxP+6qkkqHTlXYUkh6Y5MnNSgPBB3NY2PNvCr63KCAP/+5KvsxH3OL1LSV/JZnjvDEkYPNrCYxNKcfeM0JW9L9WHa7VRhKWa53ZrGhWEeCDTZBiddmOvYlyDcTNBin36Mgh8x6zHzgJx7KGXVkrSXwuEHDo6c7uhKoQstE+i4tKenclINGOBFyW6DsvEeaW5rZaNKuZNtsn2LEstV2vlcZU5KrepNL+3m1vA+Ww7ouKEvB5aNT5cYWWbvcG8YSHBet+kyxeSWfhe4SvauKIWArq83+N4GZJEvEcqaqf0qp3FbTGJkmJ7w8GjRKs1cfUXbm4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by VI1PR04MB6976.eurprd04.prod.outlook.com (2603:10a6:803:130::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 12:09:57 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%5]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 12:09:57 +0000
From: florin.leotescu@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [PATCH v6 3/3] hwmon: emc2305: Support configurable fan PWM at shutdown
Date: Thu,  2 Apr 2026 15:25:14 +0300
Message-Id: <20260402122514.1811737-4-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
References: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|VI1PR04MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: ca38969a-09d4-479d-f319-08de90b0c140
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: tECoUPbti3C/CXMlmJJRwGbud5UOGVTPhkhzeRlZaaMg2xeBM8aCrGYr/WD5ds6iUBhm6HENVc2djWoYk45zWYlzKTmBoReeEj/Qvi1rJP9z8JvFm4R1zG9WTiCgpWFRnnNpz/xtPtftnX15PbuEQxykY3ulTPSvVGrCdQYu0PjadlfdX5NmYcw934JU0lOfiIvX6vgh7kWJ5ceTttJoYc7C9sbSQwfOuSOKIHzQrKMTKrJaN8YleSahG5V5BPcmBlVkrb6i+QztxZFhlZw0RijeInKqNTSS1VUthxmxJNt710nI6LM6KAqTX05r11vd5JuvlGjbb1gA7iJAcS1DtVYT0qawRU4c0J0PB87fs2M1kYemAuwBaMlLQp4EzxUmI9jLIbupT6BvXY8sQ3AXt7dBrsisQVe020VwDvngA6Oul8Zz0inLmnuEab/hdT9XqOrJBYpu03NMYt+aZbUEf/PejMj6RPJEoXnjl7dhDaWozDSI3r9XvPUt1j564Ka2B55o/E8SPqu9FoLcOfP5TQ5v7xQbLlRlCHBscKohhSrF90sXb+F1SsbG73kCwgAMUMkQdlrriJ1jbVrkWh8aDZ13bgdkLw76sI8bhC/0DmvvpAg1ZBwKMielNSyp/XVU+opLiGDbJdd26wyBwiWaRn5GTN539j7a+tTg+WMUsCG5T5ndUWrfn+NKMzW41yvwlJTevHt3GPGN35GGfKqU24f1weZWK7l3qX/83OfPFeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?plpbRoIPtv6qUmj96otR+Y0AaduChBzVXGZeq4MpacsyqcNn5VW/EZCGlq?=
 =?iso-8859-1?Q?gDdOYglS45Urh6zQuKxo1Lf5x0O7XJOllIlL/8xpl5H444zKobIGjTKYc/?=
 =?iso-8859-1?Q?7yAJN4jS4a4i62qGO/2mR7ueEqbFLfvY6n1kAe+w5RbqPwSYxdACdCw9zS?=
 =?iso-8859-1?Q?e2/Ol9ePi3sNmdtmXm7Vlj9OEK/O17/gi1OB73uL4RqGqR9Fj+HB4DoizE?=
 =?iso-8859-1?Q?Noaf2HxuVkQBp19IqfOE/odxD/Ul7jE2VCCCiVvlhaG9GcunxsOkOqupJH?=
 =?iso-8859-1?Q?q6x5ivShY8uCmRqBXyWYzsr08UmzBB8Sdk7WsCk5+BTI4rgSITZ/Lex8hh?=
 =?iso-8859-1?Q?KS+oWDgKf9KjDLUhfUw55cV3Rsl3+X1iBbgk7C1fpT/6berh/8MP2LHGPp?=
 =?iso-8859-1?Q?0yDKehoyi/+lPGBMh1xXM5A0CzmQ9hwXTwX3FqqRv518aCP4PKoPZg8ao7?=
 =?iso-8859-1?Q?BcJ8r5fSUJI3EgUH38+yjuSm+0aTffOcu2PZJG/P/0/JDjmiTHQ4mKIg/F?=
 =?iso-8859-1?Q?n9rdnGIS60vyFlQl23Xf+250gDh03D3fUe2VsL4T0S6wPIK8H03bw4XgnU?=
 =?iso-8859-1?Q?AVX6k0j6/7gPVJYZHHxPIXjP2pgpl3BCC/YAavWT/npTbwshoovQcLiIc4?=
 =?iso-8859-1?Q?Hu0dmpaEjB15foFDv9iigDW0PN7L+i46uLcLaH6f1C63OtIsvi19/0HNdx?=
 =?iso-8859-1?Q?bpSrgY6Gc5iZOGP+psrPpWzlqh2IdvEOd9lsY1Gs/GWx6Hh2BmodkHqM9X?=
 =?iso-8859-1?Q?vmGdY+7ECRJorVnmLUWNVD07xeA506gPlrzpWGaxbASTP8zj9SXA5iKtZz?=
 =?iso-8859-1?Q?Tg93IuPyKbE5Uhl3QHlzYybZtwtfc/AhnQYIm+MgyR3NM2PCES+e58ZhMg?=
 =?iso-8859-1?Q?mUdT9qf5ntYGV5102CLsFXyAERqhSnRv4qGxaaKDjOBIUCfh6kdD6fbHr5?=
 =?iso-8859-1?Q?xHmkgNijub5I9pzSPaVsG+CuUjCl4tiTLQEseyBEN2grJSP55LOAKfZ2uM?=
 =?iso-8859-1?Q?97nT7rLUXDHyZ3U0W05SYNKlYz5Q1j/W9pI1ta55ipDZ5TUbFBWcJUAf/q?=
 =?iso-8859-1?Q?KJvZRvjtW6v5nACUMlSwHFDiDvzAyq/or+V8XM8tr6gn9iBNjAzFFFyjj3?=
 =?iso-8859-1?Q?on34Fx8Rj6XB6pCAYuh9HlLs1K+Zuk67Y9tLkdBMMVHK0Gal6k4cTwxUB5?=
 =?iso-8859-1?Q?IW3wiXMSiBAxOXKGkczSgAt1RJ6IkwWP0PgO2VIBeoyb09nmZTuVfQhhHV?=
 =?iso-8859-1?Q?42Qg3RZFAfADwikohdv+UJmT+2/mAKrtiT+t8v+4KeEJ1bdpXhaV+c+jQ7?=
 =?iso-8859-1?Q?1iD/dTqSYxYZ8EE3/WIaoK+5sevco8CJXbgZWTIDHJ03WhrLuAjYEY50kq?=
 =?iso-8859-1?Q?8nlr9YMihqljhLeHl0YqXvNoPr+0tYGidDkuWqLMD8nHdVK40lcJVexI+M?=
 =?iso-8859-1?Q?jFxjoBqqLD6YbIp0xLUnNBWthanW5E2b7DgKCSTtS80g4AT505nyvouPcv?=
 =?iso-8859-1?Q?qG/MplSnK9Ztdu7/S54KMp+SZj/ApTWT6ADa+PcK92dGgoKrhygY+PP1WS?=
 =?iso-8859-1?Q?wLoL/kanaUcPPJq9UQkfyMJJFKNqzIYlLogCS/RzmU5vEE/KhxnhmhMXAu?=
 =?iso-8859-1?Q?tP3UCYNcuWFYdr914UvE/jf9PwTTDmqUBNSuRhOpt7dg/da2de4UtB2vPG?=
 =?iso-8859-1?Q?o8oSR/7PWGEDokh+D9MZhiNsuTuweG/ii1EQDxoi9ulFLYt0SCMeU/2oOC?=
 =?iso-8859-1?Q?/Xj5XNsidUhOW+n4igdJhBEuZFCTift5mHEvHgz7+BmEOkb2r+U8kZTmEu?=
 =?iso-8859-1?Q?qz3aJOYLlg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca38969a-09d4-479d-f319-08de90b0c140
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 12:09:57.0105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8klfTJzF4NLJsfaaEvZtYYn/vsanh+H/GVJBppp4M+lOhJSd949wCwgTtSsUpIvdriYP88YbJ+R5ZD9Oeb3Ihg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_131004_154827_9053CA33 
X-CRM114-Status: GOOD (  16.97  )
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

From: Florin Leotescu <florin.leotescu@nxp.com>

Some systems require fans to enter in a defined safe state during system
shutdown or reboot handoff.

Add support for the optional Device Tree property "fan-shutdown-percent"
to configure the shutdown PWM duty cycle per fan output.

If the property is present for a fan channel, the driver converts the
configured percentage value to the corresponding PWM duty cycle and
applies it during driver shutdown.

If the property is not present, the fan state remains unchanged.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 drivers/hwmon/emc2305.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 0b42b82c8e22..dec3a79933c1 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -32,6 +32,7 @@
 #define EMC2305_REG_DRIVE_PWM_OUT	0x2b
 #define EMC2305_OPEN_DRAIN		0x0
 #define EMC2305_PUSH_PULL		0x1
+#define EMC2305_PWM_SHUTDOWN_UNSET      -1
 
 #define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
 	DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max))
@@ -104,6 +105,7 @@ struct emc2305_cdev_data {
  * @pwm_output_mask: PWM output mask
  * @pwm_polarity_mask: PWM polarity mask
  * @pwm_separate: separate PWM settings for every channel
+ * @pwm_shutdown: Set shutdown PWM.
  * @pwm_min: array of minimum PWM per channel
  * @pwm_freq: array of PWM frequency per channel
  * @cdev_data: array of cooling devices data
@@ -116,6 +118,7 @@ struct emc2305_data {
 	u8 pwm_output_mask;
 	u8 pwm_polarity_mask;
 	bool pwm_separate;
+	s16 pwm_shutdown[EMC2305_PWM_MAX];
 	u8 pwm_min[EMC2305_PWM_MAX];
 	u16 pwm_freq[EMC2305_PWM_MAX];
 	struct emc2305_cdev_data cdev_data[EMC2305_PWM_MAX];
@@ -539,6 +542,7 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
 				      struct device_node *child,
 				      struct emc2305_data *data)
 {	u32 ch;
+	u32 pwm_shutdown_percent;
 	int ret;
 	struct of_phandle_args args;
 
@@ -585,6 +589,16 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
 	}
 
 	of_node_put(args.np);
+
+	ret = of_property_read_u32(child, "fan-shutdown-percent",
+				   &pwm_shutdown_percent);
+
+	if (!ret) {
+		pwm_shutdown_percent = clamp(pwm_shutdown_percent, 0, 100);
+		data->pwm_shutdown[ch] =
+			DIV_ROUND_CLOSEST(pwm_shutdown_percent * EMC2305_FAN_MAX, 100);
+	}
+
 	return 0;
 }
 
@@ -637,6 +651,9 @@ static int emc2305_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	for (i = 0; i < EMC2305_PWM_MAX; i++)
+		data->pwm_shutdown[i] = EMC2305_PWM_SHUTDOWN_UNSET;
+
 	pwm_childs = emc2305_probe_childs_from_dt(dev);
 
 	pdata = dev_get_platdata(&client->dev);
@@ -720,6 +737,23 @@ static int emc2305_probe(struct i2c_client *client)
 	return 0;
 }
 
+static void emc2305_shutdown(struct i2c_client *client)
+{
+	int i;
+	int ret;
+	struct emc2305_data *data = i2c_get_clientdata(client);
+
+	for (i = 0; i < data->pwm_num; i++) {
+		if (data->pwm_shutdown[i] != EMC2305_PWM_SHUTDOWN_UNSET) {
+			ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i),
+							data->pwm_shutdown[i]);
+			if (ret < 0)
+				dev_warn(&client->dev,
+					 "Failed to set shutdown PWM for ch %d\n", i);
+		}
+	}
+}
+
 static const struct of_device_id of_emc2305_match_table[] = {
 	{ .compatible = "microchip,emc2305", },
 	{},
@@ -732,6 +766,7 @@ static struct i2c_driver emc2305_driver = {
 		.of_match_table = of_emc2305_match_table,
 	},
 	.probe = emc2305_probe,
+	.shutdown = emc2305_shutdown,
 	.id_table = emc2305_ids,
 };
 
-- 
2.34.1


