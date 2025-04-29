Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CA5C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 02:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0aFO1DU+qVWVpVl2V2ZBIhpix9P8ocvhYVqNg/qweY=; b=X9BNbCnZqfJoYvhRqVV9IbLrIS
	lx/GC1nh2lF9sjdQATm4wwz2z+rA9skTrxVc7c3A+l1hBYMA5HSpbjt6Gc6TuBYFuNj8VnAPbSDnR
	cjmKvymI5WOL8IDI1Q1o5YF4lI3VXdclxBPQbZByq0+TUQS+Wa149qt9L8IDOXK39Vj7/5nJWvXFT
	V0Fkzt+AohjptsMEjbo3vwaPBDwI8GV4qK/bwDwmH0qisLVvRY7sEZx4Ma8CXgoNnMmUNocug10dP
	d4HyX4AajwEdMO9j/7tSgEI6yX/Nhe4oKkribK3zn6BDtb4eLH0hrxshP44tJckrzS+uzqLBAbJKi
	cuHISblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9apX-000000086lS-3tIP;
	Tue, 29 Apr 2025 02:36:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ane-000000086cR-0qJA;
	Tue, 29 Apr 2025 02:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=H0aFO1DU+qVWVpVl2V2ZBIhpix9P8ocvhYVqNg/qweY=; b=aFoJCSyLQRi/LA5e1US5ZPrJgC
	79GCoMlzCS/6nzb5BUvwTySu2kWSLT/dse4zGao3JS0V6sKzsGhQXa7i3ZGAIhjotR77kuP4QIfZY
	licPXIvTo1e/BzkFWS6ru224QuI4Ccj/0StW8WZ5cKAMnUUNnB4cthE02UFdHWfO+Fdx/C5Rxkfsp
	ZFVHtSCDo25XM9sifR7ylTdB3pJtgGplLM9qkGnY4aDrORp7r9MaX1y4AiMfyysu/hPAlFdb/E5Ke
	R9s7BmUJC4oWFACdJu2u/jaJI09bW1b93j/KR9SWSbShGzhuCyRkOA07+doRZtIex+p/kUBxufzPR
	12S6Ag6w==;
Received: from mail-vi1eur05on20618.outbound.protection.outlook.com ([2a01:111:f403:2613::618] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9anV-0000000D9qg-0BLT;
	Tue, 29 Apr 2025 02:34:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvroP1ePL1eBOHbdevh6t97Pi2VaNgzB0ilXnuJ0mMsXA/QQiz429C53Ywrk9ASPP0puc9Exo3CbSqQ5bz4BZAUhNSeBl6E9LzNwYSyriYAX0beZOoUZGWTRHSYM5R9h9bxibBgnYmTR5g4qHHqqE8dQz0S5tCIeTO81kz0YebtvAzGPd5xvRbsqTUMbe3k7wQiuacZNLMaaPOjHuT0gH+mHBZxxSXlZZHciw8RsVMkqkbsuBhrWkC5J48De42tP0Yr1+bX3mpniZjsSed1LbZH5M+p9WB6WbaomZdO1KcXCmqHdP42jJY+bCj2NiJQo1dHJmQXfO/W28a+rs8lz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0aFO1DU+qVWVpVl2V2ZBIhpix9P8ocvhYVqNg/qweY=;
 b=MFmsIApkVtB9n8h3UzMDPBQh8RxkLpS2CLywxB4z9irH7W9FLzO8J8pgecay5R1R2Z2vTyybAlXTFqqBAirfpuqKqzYHofWPtnh6O3KQCzO3N3gyyNwdQbx3RzLr6wDIrQ6E9zS9/7ZcBf4GlBflEhyIiVIOiYbZ4NA+FQ9cbyM2gaiyeL1FqEJrfEtfpn3oJnWuOhmKM9x+T20XF7unmXkW2AxFnpBwoxSjmeouFVnmBeYl4uZDG3526Aym36J7P8Abmyo8DLDZbXZCPpGjnPaJdRxbYN7X1jGcaWwmPvUTCdQyWO9g8hSbJqHEDiC5H7T8vFZbI7tKCEEdRiXmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0aFO1DU+qVWVpVl2V2ZBIhpix9P8ocvhYVqNg/qweY=;
 b=T6SCeNZ4fVwd1Ig5OkM9aEv1KUm+PWV1DsCXgkkYliK2yep/S4yaV3xzAEOpwAJ8aZSxi5JeZPvxY/4rfWrmrXFiPoVkCuzR7SEdL2Jru5AsE3V+S0CPD9pDIl40wG6CusieS/wAvZI17Mlbdw8dWzqGNb6R9LcubtA7JXzp3zCAlNTBt0RjdIso0Pd28dAD+QplHA+OWKFylPG7MjilDGi9aiDOhBYtPq5S0TlxpsGZ83pRVf+OXB+zdfK37Qm8UWoRYRN4Wr4tDCpxUIGrPzodrkxac2ak0fJ/U29sO4gBF+BBQvyxMTZdJRtmGLNx1DOqPvwTPP2MXYjrDAddyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8360.eurprd04.prod.outlook.com (2603:10a6:20b:3f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 02:34:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 02:34:06 +0000
Message-ID: <a5cdb20b-06ff-47ca-a0a4-593a4010016d@nxp.com>
Date: Tue, 29 Apr 2025 10:35:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/34] drm/bridge: imx8*-ldb: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-31-8f91a404d86b@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-31-8f91a404d86b@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8360:EE_
X-MS-Office365-Filtering-Correlation-Id: 6595992f-a933-41b1-0946-08dd86c65005
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TldqT2ZWQi9ZQWY5V3ZIT3B4NGszWGR6elVBOUpTb2h6aTN1d2xTTmtZN29t?=
 =?utf-8?B?ZGZMclVFYXZSOVE0R2c3YnJaMlRMTkNpSzQyZmZxbHVFZ3VFL1NYNVYrVUxM?=
 =?utf-8?B?eTRKTTBCMzdkMi9jYlZHaStYNTJsaWViWlp3OVVJWGYwNW0wN2gwSzFKVm9i?=
 =?utf-8?B?RklUYmNtWllzcisvYUJWWFBuTUFpVjRVbFZCNEMrS2I1aXh4TzVZMlRLT1BO?=
 =?utf-8?B?Qm4yZUxBd0FMZlJndWhIVVhVcHFCWXpWZ29FZUtUeDdENVg0YmtqSzhLZ1RZ?=
 =?utf-8?B?azFKVlROMmpjcno4N0pnWExKTnFENEdJa2hHVUJ2Rm5vRE9HZE1PT1VVN001?=
 =?utf-8?B?VXJIMEZHVnpnMlhmYmhjVTlWMWhCdTdYWk9lVjRLNnNPbjU4eVlzdG9DUUU1?=
 =?utf-8?B?djVJeGE1SWxMcTJEd3hlZys5N1AvWVRQUENKM2tVUXVpTUtOUkRtOWh1QkxG?=
 =?utf-8?B?akpsd3NSb1BEalNXL1VJVU5vdWx2aldwS2xXZ1BicUR3d0ZuQS8vYUZhdDVR?=
 =?utf-8?B?aFI2dnY1dkpOU3NCV3BFWFY0RGFEYlhkWU4rUGNqcVM5eW5yVTllTi9seFo1?=
 =?utf-8?B?dTd1cXRoeWdEaGxkVmZPTTlCc0R1MzlPN2hsWFdCK0p4c2ZDaVlMalpSaGkz?=
 =?utf-8?B?Q3M0SlhZekphZU0xNEpueGh1UFZYM2ViUGsvTHhsVUlMdUlXSUJkMkh2cVoy?=
 =?utf-8?B?R1VlUW9EU3FrT0psUDEyQUtUcW1HWjVPNnB6RkdxaXpqc1d1Yzhla0ZRdU5U?=
 =?utf-8?B?bFVJS1gyZVJXSnhOSHBMcjg2N0RzeG13Unp2ZzQ2Q2RyYUdud2V0N3c0VVR6?=
 =?utf-8?B?U2FDL2U0OEd2SS9hM1RBTnFzTStnQ3ZNcm1CS2dMMFRma3VlZWRaeVlyNHN6?=
 =?utf-8?B?V2krUjN1cDVDanhJZWl6aG9acDI2OVJMaVNBcHhCbFhRTkcxOTBIOFpza2Nq?=
 =?utf-8?B?aGI0NmNORjFpdEtXZ1Y4NEVsMXh5bFZmWE9qTHNkN1U5Y2VBZURacytwWnlz?=
 =?utf-8?B?Z3NtNkc1YjJDOGRMM0QyOTBhWXZrd01QNG9pV1duUTUyckt6QStxWEtUMm5p?=
 =?utf-8?B?QklDaGMzOVpUSXh5VVIya2tOb1JBbHpyRlFGZWVQMEdTREtaUmJRT0o1eVMy?=
 =?utf-8?B?ais3N2hYbFZWbUx2Y2pCTk8zTHpvYTdzREk4cUR3ZWpjNVN2WENGVXUyU2Jm?=
 =?utf-8?B?VXhudjlaZGpBQUhpeDJlZ3ZlSzg0T0RlaWVQMXVpaXZ1N1dDMHlsWmUvYVFZ?=
 =?utf-8?B?eUVJQ2crbldLaldhUXF5a3pQS0FjQ2xTNDFjMHJzUjFvRmJxeUhjZnpEWG04?=
 =?utf-8?B?RmUwZDBLeTdZQ2FUVlkrWnNnNHV2QnAwU0VuMnhkUTdDclUydUZRNkplMysr?=
 =?utf-8?B?NW05SXlZNnRrSFJDN3FRYVRNUWcvUnQ5WS9tSE5jaFo4S2gvbGRVeDlKY3JE?=
 =?utf-8?B?OWZ0ZUIxSm91TjRiTlV2RkNaNWF1ZkxvV1VSWHNjNENQYkQ4VWQ4ZG54ZjJW?=
 =?utf-8?B?TXJjSGRTWFE4MjlRcWhWdTNHa0xGK0RXbUZhZnNGMTk4SmVyK3EzTnBPb0cx?=
 =?utf-8?B?Ujk0OHNqaGlqN1Rsd1BqM05mbmRyamF0QWV2aE82UVJnY1cyOFF0eDBNam9H?=
 =?utf-8?B?c2dseEdicFdIUmZYSEJUb3pSUXZjRE1NVWUyWHhJeFAzeFY3MEJOc21FbUto?=
 =?utf-8?B?QzZpUnI4TXdlaUQ3ZC9aWFRMMnFRRHFwWHI4TVR4M1c0RTRVcXBFbjRIZ3ZD?=
 =?utf-8?B?V3FWZFZsSEJyZnMrM2YzRllnOG9YaWM0aS8wdis3Y3N5VndPd2g3d2w0UC9G?=
 =?utf-8?B?NG5mai8rMHVNT0RsWDlBaDErQm9uaGJXQURZSERacHZyQXZMVlFKZ1ZqMlNH?=
 =?utf-8?B?YXRHYngyMVZzaVE1UzZpN3N2TUtmb0ZSSjRWWW9lcG5mRVhsc2dqZk5rT1pB?=
 =?utf-8?B?bUVscWVOU2J1ZmMwTGpObU5RSzVIV25IZndkSGRrQ3lpY3JjU2V4cHJ1TTN3?=
 =?utf-8?B?Q2x4NG1iS3pnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjJvZ1FWc3QrN0x2MWhCVGVwWG1QeWpkcWZhK2lXZ2dCV3ZXN0lqM201MWNr?=
 =?utf-8?B?UEVnajZReHV0M2RYNEJCbnk5R3NmaEdlZzFkMGovVll0QWRxK1BudXIxMi9w?=
 =?utf-8?B?SW1Dd0VzaWhycTJiNzF0Wk44MDNLMnJuUk1QcTB2bGFqSnZzVmFQNzNrQUhv?=
 =?utf-8?B?eUVVbDZDRjcvQ1VsVWFDdDRnTzgralAwbldvOEE3Y21sYmZCOEY1Tk9ubHFs?=
 =?utf-8?B?eE53YjN4clpVd3RoclNCSmgxQ0krSUxLR0NzK2xoNSt2dVpPL0lycGJsRVBQ?=
 =?utf-8?B?bnRySXNrQWY1b0xXWFZxUkdNUzdwRUtUNmtwMXFML3lQMGZEYkR0SGFGUGlQ?=
 =?utf-8?B?bnUyT0xZYjhvQjF3dGtidlFySzVvNVZuTUJWdXUrdWpPckRxeENmOUtWK3c2?=
 =?utf-8?B?OVorRFYyaGdLdHRMZ0g4VkV6bFNRZWowMUVUNTh3REEzanVtdGtqWmFZdXlD?=
 =?utf-8?B?UW9mUlBlTVdWemRacmxJQUVPdjFnNnZHb1Vvb1c3VGRqNldKVFlSek5GRm5B?=
 =?utf-8?B?ZXdjcUswdjZ4am42NXlrNlljZkE4MHpVSTV6QmUxRXg1V3RUODhydmI3YUQw?=
 =?utf-8?B?Z3A1QXR3Yk5nMGxTY05vQTdiZXBpM2p5ZTFDbnd3M0J4SXhreFgzMWpLQlpn?=
 =?utf-8?B?MEQ2ZW9FbSt2Vzc3UnNaaGNzeCtNSEMrOU05RVJ4MVFPOE01VXpXb1UvLzJ3?=
 =?utf-8?B?NXArbFdueXVjSEpaRm1BMkxLamlkWDk2MU5ST29IUmlQdzdDWnRSenJCelp5?=
 =?utf-8?B?UTJvekd4WTIvWjU2ZXVPWlJCdUczeTA5VmU3ZVdwR3FyVmxrK21DcVptL0hk?=
 =?utf-8?B?czRpSlRVZTVLYmJtalZyRUxBMnFsOHF0THQ3K2YyQnc0QXNtUDFCOVNLbDRP?=
 =?utf-8?B?UkN3SXl4akhKOUdjOXpWYkVmMTIzUEc4TlV6WXdvZFBLYStNNUhieVlIb01W?=
 =?utf-8?B?a2dkQWh4UVJsS0ZqTXcvY3VpaWUwc3IxS1JZc09SUXN0aE9GZG1QME5RYTZv?=
 =?utf-8?B?bXBoanFyY2E0SUs2Wkc4L2I4bktaOFNXV1FPUjRtQTF0OSs0ays5NndVQ1lh?=
 =?utf-8?B?TENZTVcwcW9BMHNCYUVnUEp1TTJvNzg2YUtWTkgxQjNxNkZZZGZ0TXNIK2wy?=
 =?utf-8?B?Q0dUNXhrLzBkTDB0V3lmL0c0cERMd1VqdGxoNFFTNE5RTys2U3BUTkZ1L0I1?=
 =?utf-8?B?T2lRZlNwY1hCd3ZQUVJMdjZEYjFySXhCaGpJYk5EVUFqYldrc0V1QzNpanNO?=
 =?utf-8?B?bzB3eXd2V3NUSmxaK2hrZmFZUkpTUXJmQnd6VDJTekw4ZVY5YWU5dTd0eHly?=
 =?utf-8?B?bnZoc2xKdWdTUkRCUldsNkUza1FnRVpaeVB2Mkl6YTdnQjM5bVJnWUVveUhJ?=
 =?utf-8?B?UG9aaktWNDZJUE81bVRPUEJDTCsvSEVYaC9QWE5JT0NoRllUTVBUb0xFWWVo?=
 =?utf-8?B?UjlQK1hzVGpCNFRSSXhKUzZTNkpUdXlxZCtUYkdFT2plcFZzVDQ5R2luclJt?=
 =?utf-8?B?b01JdVZvNnhHZzN4eUlwVU9Id2FJRm9qSjFhL3I3SWJkTnNiZFlDSzJTNGFG?=
 =?utf-8?B?ZTkrYmhJbnFGN0VUK0RzV29pcTlwUmt1RkZNT3VqS2s0UndBR2pGSGFLRnM0?=
 =?utf-8?B?ZDBLcmpJUVlDY3kyc0x0N0lGQUN5NTdLV2Q3VytEQkJqbjNsNzhRYmt3NUsz?=
 =?utf-8?B?a2l4MzM2czlHbnlpRGNBTG5oVkZYck14bTdla3dyZzQ3c1IvLzVQSk44VW1Y?=
 =?utf-8?B?TzI4bzZPUCtpZHo1SXRsS2RHUDMwMFBqV2lsMFVmOEE0cnBkVk9SM2U0TEZU?=
 =?utf-8?B?WDE0OGMvSjQrbFdMejA2M3V4K243MjRnbHJNRUtGTFZWZHBxa0ZjOTB0b3dx?=
 =?utf-8?B?N2tXY1NQU2NxYjBHcHFBVDVVQ1UyekNOWjlRSzVvMzFyYmN0ckVCZm12ZDUx?=
 =?utf-8?B?alFoTDJSdW5WME5IZjY4WWh0MkhodGdEYTJxS2o2Q01NYXJ3WFVDTlJhQnhr?=
 =?utf-8?B?eFE0Y0xTTEhmeDkvNU9CRU16a2VoR3d0OXFGU3JvNmpsY3piY0R1cFFVTUE1?=
 =?utf-8?B?aG9kU1JuV28rTGRpT1RXMGliOEV1a25PQndra3AwZWswU0RsNmt0ZlNOMzdK?=
 =?utf-8?Q?40T8JA96gQVsEmawYh/mgDPgK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6595992f-a933-41b1-0946-08dd86c65005
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 02:34:06.2113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dh5eMrzkC2kDuwPCGKgXR4r54IMY3YCHUldNpg4S2X8dzg9yCc9NGJbikDrP5kx6uuD6UV2YDmxRTxFYAlr3oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8360
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_033414_951689_C83F1537 
X-CRM114-Status: GOOD (  13.72  )
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

On 04/25/2025, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> These two drivers are tangled together by the ldb_add_bridge_helper(), so
> they are converted at once.
> 
> They also have a similar design, each embedding an array of channels in
> their main struct, and each channel embeds a drm_bridge. This prevents
> dynamic, refcount-based deallocation of the bridges.
> 
> To make the new, dynamic bridge allocation possible:
> 
>  * change the array of channels into an array of channel pointers
>  * allocate each channel using devm_drm_bridge_alloc()
>  * adapt ldb_add_bridge_helper() to not set the funcs pointer
>    (now done by devm_drm_bridge_alloc())
>  * adapt the code wherever using the channels
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c |  4 +---
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.h |  3 +--
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb.c     | 32 ++++++++++++++++++-----------
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c    | 20 ++++++++++++------
>  4 files changed, 36 insertions(+), 23 deletions(-)

Acked-by: Liu Ying <victor.liu@nxp.com>

