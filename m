Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F039606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BJ3ZyAyz;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=YuLMhKyU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=psLsg64VdzBH9NvbUa/AK7zcw3q6pPNDIOEvR7E6oa8=; b=BJ3ZyAyz8zLBv4
	uMTGrqy8bJYAk0rTBTnvCi+GoexmNARGsM+WBuio26Rg8sNp4bZU4l4oanpM5ZmlbNWGEBXKtxCqF
	0e9GYoFnDWkXieaWs6KIa1iPAfH3VN2cpRY/h0R0ByoexhvguuD7o4SJmrUVkLPifkrbRBJUVkgIp
	gyCwLxLtl31ZacNFRsDo6mnRsvGcx2thewlfI8MkvQFYtwjFusuVZMok8fKDtsGkfoaK2ta5Qhen3
	9UHuXXJfWlpIldr/PRV9Ssyp9yvy4yRPsSduxJsb/bazClFl/FQ6aBmDTK7n/qFd1pmkcCEsTk0jm
	XKyab8Q/S5rROIhFqeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYS3-000000051mm-22NS;
	Wed, 04 Nov 2026 10:42:43 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYS0-000000051lb-01OR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:42:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEZn3Jfwwfgm8LrbmBFQ0yGVWudEpuiWIrqjiExcIekxJLLnO2k8vjG5+j2iWl/9JHP4FltGO2UmvrLub7OmTivr5q77GM9tvrHksczmFE8FbSFE2F0H5VecRaKSJgZ1eCpzAki9Hwj04V8jfcUW0FIfaGox8uekg20ui2bFzV+VJOrsRWrZpa5ieD27KWTrSjuFAwoy18nmXHpEmQFEycTsOw0xHVovuKNR0VPID/xeHvEOfdwBIs6GFoEIVO5pmV8gV84YodPemp2mkvc0Ex2urFA6hJMcFYe1JCliQ4aK3FHuT+tBHbYX37YGKqpRiVK17t+ljVOSS8lsD9mIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psLsg64VdzBH9NvbUa/AK7zcw3q6pPNDIOEvR7E6oa8=;
 b=xIa5IDNDNCHKT/UqWvAWitkHY9HHuSHZrHSHVE9ScD8aTrnVH18pkZNvec5ur6vhx9gUHhGuQWcVVNf96oT18CWeLSmiEf3ekzKnxsf/R0mt/ddEX5h0gpJ9ox9xo1wokPeXgLvWXxDSjnnYp99OkqLnXZN97Vuf0OHLsnqmRJWuuJ2UjhQNCKwFhB05feDff4m5NVFsDaX9UXSN1NmwkUgTBS4r+yYXT4AB7+/oY4JYiYnJRckVU5MZMDd9Bf/+L/rBxsDmbbWa/M+mww8vqyi+30v6vQzSfaS3H3/mV0RphOrg8VoAqin2U1a8vUr7ykbERT/VL6v99kLFW4jJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psLsg64VdzBH9NvbUa/AK7zcw3q6pPNDIOEvR7E6oa8=;
 b=YuLMhKyU3FYdT5tlsqOdyAToTSHVxDKPnRgdSJxpAJdSc64l+8VAvb4yM2nfc44TW3ftLfnaHa0h6X+FaUCgNXq8azMwYa36LXfOtiBkPk+1+Qrusw439y16TFxVbmj+k2a3xqn7N20JIRM409jpjVMDqKqI5CrB4ILLeL/BLN4WanfAYL80O/gQxB/5I10sGtF2rGUoFQPEqT2FiKZqLKacB9mt6H+AvsApTARZUY8QLEiM53UrFREcAUGXKCnQuq6oLsmWuoQgveYxHZuCRl0kjqK0lcIKgynmSyh/20N7XafJRaS1G0qd+1BvoGxAuriQabZ2GVD8aEJ+LUJG5Q==
Received: from AS4P195CA0053.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::9)
 by DU0PR10MB7531.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 10:42:31 +0000
Received: from CPH1EPF00000520.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::57) by AS4P195CA0053.outlook.office365.com
 (2603:10a6:20b:65a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 10:42:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF00000520.mail.protection.outlook.com (10.167.241.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 10:42:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 11:42:58 +0100
Received: from [10.48.87.14] (10.48.87.14) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 11:42:28 +0100
Message-ID: <8c8908f1-ed6b-478a-ad00-c67448b25acb@foss.st.com>
Date: Wed, 4 Nov 2026 11:42:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] Select the STM32MP25 LTDC pixel clock source for
 the RGB output
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Stephen Boyd <sboyd@kernel.org>
CC: Marek Vasut <marex@nabladev.com>, <michael@amarulasolutions.com>,
	<linux-amarula@amarulasolutions.com>, Yannick Fertre
	<yannick.fertre@foss.st.com>, Raphael Gallais-Pou
	<raphael.gallais-pou@foss.st.com>, Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000520:EE_|DU0PR10MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 3725a9ed-6b53-4416-fcf7-08df3a6053ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|36860700016|82310400026|261021123027099003|11063799006|5023799004|261021135927099003|56012099006|261028144727099003|261009221227099003|261009223027099003|261021121427099003|261026140227099003|261022075727099003|261026121527099003|261022105027099003|10067099003|18002099003|261102123227099003|22082099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: ovzv+NVvDKwSyQLmwCUAI3hTlkvKh0qRxEfJPt0EsIe+59HRxZuTgp3fs4wqNnzRlTnZFmK/DmHF1HGDGy/d1ZhSLxrrktV/w0m/3AVgd15j1AJjcZYys+l3+lSqSx+9srpcwKjLmdqc5+1faaj130scW0MwqAGZ0ZfsoX8C+mdrdfZywgfRHZ2pJhjzSC7EjCF+9BOGWtgVRPTyS5mxmffiwX3uuJCu7S8F0uPZKHs1GFZtlOqbLdr0siv7kNHd/WlwC0mvGrNil7oFRpsN3Mvrk+qHHNcssG+0VLNIMBRav45seu6CCblht0SZ5y3yg3VZ/ne4yBLWg4ctYMcrMvkjp4IfMV4QLXS9Fm+M9169Rm8+5+cXFkLFshnUgMXfeLLvbqUZDrq4jBkg48xymPwDr6q3SgmpFlhD2eF4x9+2A37vmD7sU0sWX0WgaDCxbFLWdRrfxqT+INR8lbZX0FfLl3Hv1TncIZi5hb5f0VnEM3ZwDtLOeE4pO+W0tTGhLP7jyL0k0s+AOx3mk0bOaGd4kjxRrRI9T4FHfIlqJZRTpXoyxSRBvhfy1y0nZCs9n57O1tkKPo5KOVYc7IWuQ+80p8kTWJoAj1gdGabhWaiDnypUVJoa5nUnoMQRmYIOwGrm8aI/sJCQzKejoiWiRxIbTKfPDxkroYzH53k0ws61oOmWKNKD+n1TwTgH8O/J8/CahDQUNE49qDDZs8Ky5g==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(36860700016)(82310400026)(261021123027099003)(11063799006)(5023799004)(261021135927099003)(56012099006)(261028144727099003)(261009221227099003)(261009223027099003)(261021121427099003)(261026140227099003)(261022075727099003)(261026121527099003)(261022105027099003)(10067099003)(18002099003)(261102123227099003)(22082099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zrpMjKrwaVMWFpNtlVoqpeLq74j+goweB6DVRluEGQstKL7JuyBOJ7yySG/cdwY3v7iEFZOpboJONKf5avpj2PWc3BSMgh60y+7rEsI6AygRwptD1yDdp82fbKl2TFqKLo01lM83qiICV6hLLfcdOxL+1lVrL+kN740az5S5VchepN3zKABsux7gR2xo8c0hUEe8c7Ti9iHqpp9y2lo9HXjVJWEqWGPAuvnbqiPdJtCEh7v4T/OhJ8xCKuz0k5G8Dq4KeZJaDh14YvWsE9lbhXHUld9DTUhksETRJOBJgBv4W1/51SXlNiOtjT+y45suEFoVDHqHGceo1DTRdZOztpHj4nXXh/b0WZlpnGd1fc+DURmdANSFN5P7SV/fcoWymzZrUPJj4AMv3drU05YO9bELSoaRrGdTTTC87laaja6goI9WiH88zZg6x3dohS9i
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 10:42:30.6272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3725a9ed-6b53-4416-fcf7-08df3a6053ce
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF00000520.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7531
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_024240_276924_D91BEEE8 
X-CRM114-Status: GOOD (  31.34  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Dario,

Thanks for working on this and for testing it on the Engicam board.

First, a small remark about patch 2/4: this driver is based on the one
we deliver to our customers in the ST kernel on GitHub [1]. Please keep
the original copyright and the Signed-off-by of the authors when you
reuse such code, and add your own on top of them (e.g. with
Co-developed-by).

Now about your two questions:

On 10/28/26 14:59, Dario Binacchi wrote:
 > - the mux parents are referenced by their global names. Should they
 >   rather be described by clocks/clock-names in the SYSCFG binding?
 >   Moreover, no driver registers "txbyteclk" yet.

Yes, I would also prefer to describe them in DT. I'm working on a
version where the mux is described by a clock-controller sub-node of
the SYSCFG node. This sub-node is populated by the STM32MP2 SYSCFG
driver, so no auxiliary device is needed (patch 3/4 can be dropped):

     syscfg: syscon@44230000 {
         compatible = "st,stm32mp25-syscfg", "syscon";
         ...
         syscfg_clk: clock-controller {
             compatible = "st,stm32mp25-syscfg-clk";
             #clock-cells = <1>;
             clocks = <&rcc CK_KER_LTDC>, <&lvds>, <&clk_dsi_txbyte>;
             clock-names = "ltdc", "lvds", "dsi";
         };
     };

     &ltdc {
         clocks = ..., <&syscfg_clk CK_SYSCFG_PIX_LTDC>, ...;
     };

The driver takes the parents from the "clocks" property
(clk_parent_data), so the inputs which don't exist on a given SoC (no
LVDS/DSI on STM32MP231/251) are simply omitted. For "txbyteclk", we keep
the existing clk_dsi_txbyte placeholder until the DSI driver provides
this clock.

I also want to keep "#clock-cells = <1>" with a onecell provider: the
SYSCFG has other clock selections, and I would like to be able to add
them later in the same driver without changing the binding again.

 > - the pixel clock source is selected in the board devicetree by
 >   assigned-clock-parents. Should the LTDC driver rather select it
 >   according to its output (RGB, LVDS or DSI)?

I think the LTDC driver should select it: the source depends on the
output used, not on the board. This is what we do in our downstream
LTDC driver: it gets the mux as "ref" clock and calls clk_set_parent()
according to the encoder type (LVDS PHY clock for LVDS, LTDC kernel
clock otherwise) before setting the pixel clock rate. The board
overlays then don't need assigned-clock-parents. Yannick and Raphael
(in Cc) can comment on the LTDC side.

Since I have already reworked the clock driver this way (binding,
driver and SoC DT), would you be OK if I take over the
clk-stm32mp25-syscfg patch? I would send it in a series, keeping you as
Co-developed-by, and you could then rebase your Engicam patches on top
of it.

[1] 
https://github.com/STMicroelectronics/linux/blob/v6.6-stm32mp/drivers/clk/stm32/clk-stm32mp25-syscfg.c

Best regards,
Gabriel


On 10/28/26 14:59, Dario Binacchi wrote:
> On STM32MP25 the LTDC pixel clock is selected in the SYSCFG
> DISPLAYCLKCR register among the DSI byte lane clock, the LVDS PHY pixel
> clock (reset value) and the LTDC kernel clock. The SYSCFG node is
> already described as provider of this clock, which the LTDC references
> as "ref" clock, but no driver registers it, so the RGB (DPI) output
> can't work.
>
> This series adds a driver for this mux, probed as an auxiliary device
> of the STM32MP2 SYSCFG driver, and selects the pixel clock source on the
> Engicam MicroGEA-STM32MP257D-RMM display overlays. Patch 1 is an
> independent fix for the RGB display overlay.
>
> Tested on the Engicam MicroGEA-STM32MP257D-RMM board with both the RGB
> (Rocktech RK050HR345-CT106A) and the LVDS (Ampire AM-1280800W8TZQW-T00H)
> displays.
>
> I am sending it as RFC since I am not sure about:
>
> - the mux parents are referenced by their global names. Should they
>    rather be described by clocks/clock-names in the SYSCFG binding?
>    Moreover, no driver registers "txbyteclk" yet.
>
> - the pixel clock source is selected in the board devicetree by
>    assigned-clock-parents. Should the LTDC driver rather select it
>    according to its output (RGB, LVDS or DSI)?
>
>
> Dario Binacchi (4):
>    arm64: dts: st: fix the Engicam RMM RGB display pixel clock
>    clk: stm32: add STM32MP25 SYSCFG clock driver
>    soc: st: stm32mp2-syscfg: register the STM32MP25 clock device
>    arm64: dts: st: select the Engicam RMM display pixel clock source
>
>   ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso |   3 +
>   ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso |   5 +
>   drivers/clk/stm32/Kconfig                     |  12 ++
>   drivers/clk/stm32/Makefile                    |   1 +
>   drivers/clk/stm32/clk-stm32mp25-syscfg.c      | 111 ++++++++++++++++++
>   drivers/soc/st/Kconfig                        |   1 +
>   drivers/soc/st/stm32mp2-syscfg.c              |  28 ++++-
>   7 files changed, 159 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/clk/stm32/clk-stm32mp25-syscfg.c
>
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> branch: stm32mp25-ltdc-pixclk
>

