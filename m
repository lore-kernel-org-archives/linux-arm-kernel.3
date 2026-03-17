Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C0CF3381D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYm1OP3m2t3lueRkfXlKhrkySX9Gq+XgEjdbQEvEJqk=; b=h6Q6EvXFKYtCBmqPimnEJsYnmX
	tJ/yoPbJ87XXctOOnyYFihEbCrgOVbGgl8BUjI0YwwGg6gn+DX2RxCtRT5Ag54a0VHMjAxa9Xw7v4
	mCzJey7PbQwR4yl5F7+QV+84mqn0dNfdmMI1QyTkOPNtlLL9gB0K2MTAPoIcpF7Oy1JnyeuDCicvX
	VvwR+mIE1SbSKlNO1Li2P6BjhS1uDNi4e6Qwx7DGfsbmDGYRuzIAH6dWdEiKPSrU8Y7hxM49AQ2HR
	MhUaNj3NXKs2B+20ZHyMxt6SQVzevyfOgcGM/rJmez8c2gENmmMyzElufPBF/QMcYJpNCU1aYjanX
	JV6MtWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QPe-00000005nvS-33rN;
	Tue, 17 Mar 2026 09:08:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QPR-00000005nnh-0RON;
	Tue, 17 Mar 2026 09:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bYm1OP3m2t3lueRkfXlKhrkySX9Gq+XgEjdbQEvEJqk=; b=nDbWNukk5Thtzoq5Nmjnln9pZK
	luc2EC3tmwple/F0MBOqVXkVWlva6a60yTa+ZWkovLyQL+EMaT2UhRreIxiptcFpSk9uH0inEi3xZ
	Kh3W3oUIW6QJ06gIdGajPA4k3OKHzza+AG8pJdR2NX+pQbmgRfAivq2Cnnz0YsrccKKDfzD8/A3RT
	R6uwKBTz1GQ4ha/3Fq7k+70oip2mtJ73NwPTUNjS8mJMFC1PNrDsMQDQMEiP08s1gfNKlX6wWmMsW
	KGn2DIvglePCi+rgDyfXGmfTFq+0J2/CHCCffZKNW73POvJGCaLspf4DGU+Hz3ROvw6LEbx7mTqDz
	Wo20URwA==;
Received: from mail-japanwestazon11022094.outbound.protection.outlook.com ([40.107.75.94] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QPM-00000008UXh-1syT;
	Tue, 17 Mar 2026 09:08:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1kMDGH4VgSrgivxYMEvSy2GMX0K/Pc2WS0xAW3jykW2RBWCdgfSrooUeUdPqRYRcR3IVrQ8JLJLO3Znhh2FX9sSHJdcrxdj4iFtBlAEDWhbL0pIYX7U99l8yEWzprCblKOPdPefH8LUB1uMTdwWesPlHrH/tZ7kM26N6E6krcCRHKku6gbZGuUXg3fVi5TPS/6+nj9Dk7YwQUcqeCzYSf1XS6fqzJl7jA/0/fT38ZCMCAuBmJtd/RCP5l6zMNw/zY+oI5A1s2ihHJanrOvYERZqJAtMV3R8pMVtnGYUg5d/NeLhwRMahNnCaBGy9uGGq+H9B1QYDd7n8uwyYCRQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYm1OP3m2t3lueRkfXlKhrkySX9Gq+XgEjdbQEvEJqk=;
 b=pHkk+BVQheelM2iDfSE4IjBvK49oc0nF6q4igPLFRgajiUTbYnv/H1S8Qs1SosB6cihtGW/e6ykwJNYWjjMbNbCw6+S4s8h6C1Pfurwwi2pleLevpIDYsMMVC+9u6SlOye9TrwO8pTzfdGZJoY8wsckQ+abKUyuIrCFhkcDvXoT2yuANJag1gbmyAj1bsLkRNcvsrdCc0Hz6w5lXV1S/J7fjfvIZlUoWQJTF8PB1t93Y6jmZ0QQSMSaiYhU42f6A07Hl+KNyRt1xM33G1G2QKFwMMjgHBlEMqdx/HEzDPKXsI4guh7BBxoMF5NnlXqtIH+KtmflBj1frzCf1fZq9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEZPR03MB8663.apcprd03.prod.outlook.com (2603:1096:101:22a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 09:08:01 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 09:08:01 +0000
From: Gray Huang <gray.huang@wesion.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	naoki@radxa.com,
	jonas@kwiboo.se,
	chaoyi.chen@rock-chips.com,
	i@chainsx.cn,
	michael.opdenacker@rootcommit.com,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	andrew@lunn.ch,
	alchark@gmail.com,
	pbrobinson@gmail.com,
	nick@khadas.com,
	Gray Huang <gray.huang@wesion.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Khadas Edge 2L board
Date: Tue, 17 Mar 2026 17:07:30 +0800
Message-Id: <20260317090731.600787-2-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317090731.600787-1-gray.huang@wesion.com>
References: <20260317090731.600787-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0222.apcprd06.prod.outlook.com
 (2603:1096:4:68::30) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SEZPR03MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: c63fda87-b814-4449-cef3-08de8404b089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Q1lmz6Q2pW21SkWAS7mMKPT1LZN3W0DeDsGePan4gN3a+SeF13NsSN1uTaoFGDaPgpc5r2p1hIueJoaVkcavRTkudiXCtRjqup+f/LzafoxiOaB+czCLbj22zjUyU62MRtNYuClHuB0lCRh3ET0lSg0zuMACNRon3SsDyx9Ygn19l0eseBcuasfXvENUbKPwDORaGi6TgnFgrN+lCITlmst8yrfOFj6jaQFNAzetoxVcxiiiTNysQ57hl4wewOf3E/bkFyDXgHbGJERpjip3IYmd+C8HoSGFdE8bmUFOETbnPb9em2wpmM4sRM8e3Ssenr8EuNRRhrl09P82/lZCSvHjmLmMnXzFLS3bTTr9Up5TjiB/NOQch7yqBVEs37097GfC9WFEvELjmzv2zWolUpRBGFCOx+s/3WHfu0V0Cfz6d13T5yDpgPM/mnySkBcItiuUmU/t1gHqDaYVlacSDNZNi6SMJigZ4QUSJHADuQkNSa7TpUQXLkpf1lHEWyaHp8Tzt4qBe0XC282msHeGV4KAsHEpcOqTK/kP4pOezvBHqaSuMosYEd1dywBekt9Rr209Z5amI4+75AYFY768TicOoMPwcUC1kpmFV944ysM7k5/FnU36x036U13RGENlhUp00v0AD6jKtAeddexNiTC/GFOd2sh+hkd+oHy1CvEiUOZt79jbZQ9fFXdG4wJIijinTa1GV3KBIIO+Q4IYGfsswdx9NpHEJurOxHdge0QyAhsrJN6S+t12/bY3hYbGcT56J1wCeOF/2S7TP+FiRzqbb02jV8P63XhJ4teNrbY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fzmh6QMigyFbZFxScgq6YJHNJNr+1Xru9MXharWyEKMtniifeV2SvLsUC3n+?=
 =?us-ascii?Q?hRLOBOnXgztHkKUdfhnM1e7eyLZHRTxrcZQzUAD/BwsauGhFCQusbTefFLy/?=
 =?us-ascii?Q?lJ6bCLQx6Gqu2E8MirdIn2pGE7ccdMJk9cCEE4qIyNpLLYw0XV69V3hPuI7J?=
 =?us-ascii?Q?IPtfoqrbwuLrCPE7We9bluUpeeeehdcFdX/7N6VzT3/ebfbvAHhfh0mHbLeh?=
 =?us-ascii?Q?s9NY9/XJpI54xB35wPESWf7KCgkfZgHUkYWBKuNZjtjq3DBABl3Xh0OZsmAf?=
 =?us-ascii?Q?xqHG0LF3q+tmV1MgFpFxbhpnw9BglcsTi9GPFJnB4ilf1eil+Ko+I0fyuc51?=
 =?us-ascii?Q?RkZ4qcy9+P/SM41hPvEcmocpnoPL6uyAc58VxGh1VjHpTwfW0WEqE3Hnz629?=
 =?us-ascii?Q?1XTH3WV0yoPIePYrepXQsATrsE1BSq7lQPn4l0gBWd4FGmSVH7Lp974+kZ7G?=
 =?us-ascii?Q?MNCedME3zkE9t2snhpXKlKJq0SfaR7Whyl1xV8IgrkUYW/y0htAeysrGIb80?=
 =?us-ascii?Q?Pt1yr0WeNxSUklVv9nojc+tkjBElEZD5WeKHzzAaAWp6TSFIrOxbaZdtvEmv?=
 =?us-ascii?Q?/T0K0lbL5Ym6AdtpdFJCRJ0wnBTaHxwjK+L0IHfwRPZoThd4uW0xMzc+2JTE?=
 =?us-ascii?Q?6VaQ/cHZDmntbKkkvCIM+Z6cOP3MKfwxHq0aRadYuN+d1W3dxgzi65CniQqq?=
 =?us-ascii?Q?3Ax1anUZ32ePtoJJEg8IbvgKHRu6qAF/DMo4QBKnAAsxm1yqfIqmBoc0m4hj?=
 =?us-ascii?Q?a+UiLNZRRW4Os9XwJQkSmjw5G2OPw5bSJOCAi1hCqLUEW8JUFc3+RXJFH43P?=
 =?us-ascii?Q?V2zbbAF9PinI5Ry2Pxo2thtOKZelxnf9zbasS8qDrElNaCEa1QzSP0Bs3bY0?=
 =?us-ascii?Q?kYV8fE5b2auN0+c/CzlBmuImQqmYLxxvYqX7BwO5AWMEe1SezFx2BmvVS7je?=
 =?us-ascii?Q?7McOZ5V/dVLJRyFCsplyyt9XXWJPu5MRJyNaPwozpOipbmTvRZbaggFqWSLu?=
 =?us-ascii?Q?/DJKtZy3tfPUjDVwbHFGZuWqStnTbpOBgk+qZpy+MtxwrAvFS+Aj/tHp2C9t?=
 =?us-ascii?Q?dmopB7bv3zLYevpH1ZXzRSAt6P5Q8L3MJFX3FMaGDHulV2jS/AvDqEFhQC1W?=
 =?us-ascii?Q?Fs3eEq1101naKve3qFyD1LOrEy235afPY2ItnVN+iMNxq8IenDyp3WQ4aar2?=
 =?us-ascii?Q?i9diF2Z3BRdi/vO1+GbuYQsh7ZmdKZmAEY2KTRItCTZCrBEXT1GTB0ePvt3o?=
 =?us-ascii?Q?xptLFtQ4+83KNZnqWXRdGl2ZP090g4DrYkp7R1SnAFTEjjUQwll+aQHxni4q?=
 =?us-ascii?Q?DssjZmqVZ+kt2QOuYcZpKhLwDvookPVnbAHFQWQEcBBSTJcLm/IiVo9Ww3OR?=
 =?us-ascii?Q?5Lu9q5Fcw1oaerf8EzOIakCkZLTYJ+CK1ewe1QRiESpaIKZrIv6ery1u/gO/?=
 =?us-ascii?Q?OhKd0x40nj98UJqYMMgrFaiuOF1rfr4jWCFaUXh1k7vC2LQtRtt+bTU7KFuA?=
 =?us-ascii?Q?nfD+13T9gRKVCXZoO+iExrhd4G2i4JAOJ4BAF+X21CODOZFYU3qSFuki0dY+?=
 =?us-ascii?Q?pQASDrlHFlwe6/cUi3uGxAKXLlDxKU91JOx7oUB+GarVVJVQzTxCAavIvMEZ?=
 =?us-ascii?Q?p/K7jfw+b/Yhc4AQbB/KNPULgxyFz2p9Q0VCmVzdAnV9QOb6pdOyIx5S5a0T?=
 =?us-ascii?Q?gX3tZ/vx3dLSHFVPCyYsYcwQsCPU9F0GmJ6Qfn5vn/wBv7RW5fthgTnJxV45?=
 =?us-ascii?Q?b4vGbz93Aw=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63fda87-b814-4449-cef3-08de8404b089
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 09:08:01.1688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndfjIOFhB6ivWidT28uXMxtTpeTmVdWRRktiJq3qI8h9xJFFGbCfUfDuFjPUl1wnYSXX52z7RFAoZy9/fvwy3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_090812_687807_62680E84 
X-CRM114-Status: UNSURE (   8.11  )
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

The Khadas Edge 2L is a single board computer based on the
Rockchip RK3576 SoC.

Specification:
- Rockchip RK3576
- 8/16GB LPDDR5
- 64/128GB eMMC 5.1
- AP6275P WiFi6 LAN
- HDMI2.1 Type-A
- MIPI-CSI x2
- MIPI-DSI x2
- USB3.1; USB2.0
- RTC clock
- PWM fan
- SPI Flash
- Pads expansion board (UART, USB)

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..aaf6ed3b364d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -754,6 +754,11 @@ properties:
           - const: khadas,edge2
           - const: rockchip,rk3588s
 
+      - description: Khadas Edge-2L series boards
+        items:
+          - const: khadas,edge-2l
+          - const: rockchip,rk3576
+
       - description: Kobol Helios64
         items:
           - const: kobol,helios64
-- 
2.34.1


