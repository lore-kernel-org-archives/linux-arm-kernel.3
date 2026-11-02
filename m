Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E852F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W2xg/1fS;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aVMO5DF6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KowglsUGucuwN0s6uI9Bre+GD+nznBIhIiDQmxMQP1Q=; b=W2xg/1fSdSZTQnHF7p+adC9dHw
	5ken2q686/R1bA/OP93dMp74P7oyajGt6Qg4iiqcsWkQGr6VywzirGYSBr7y0oLTV8Sd7wvOk4CgF
	7kQ56kDAIQFCLlSwzbVl54io8yYBHlX6JwcYJaxZ8r4XN0LT3KQB0jpGLJu6udQOPXg3d7JTBXg+o
	Rc54jldpOIXSf2J82ZMw+uQPhSt11GarT1Xf8fCLYAerypjwXHUzDzls5dFT4u7K+vMg7F1WKMRLt
	C6r2+cQjzvBBptZGrS1oMtWvO0Ym1LJG3VEsMfoI5e1H2eLzgVjZgKTouyTjvz1+0ozvS+1f/yS2D
	DNnRzeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzpq-00000000V9r-1Dxp;
	Mon, 02 Nov 2026 21:44:58 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzpn-00000000V8h-1Hzf;
	Mon, 02 Nov 2026 21:44:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmBUwJFeeZIpbE2nR06fxCjcT0lT7j+aUycy6Wct+p46avG7cofk/bYLFl/RCbp/iRBuKoU5M3ANNrZiLEdnunv2xt+nGO9v7zqoAjKYbqVuiKlhzDbcIdN+tTidxLVzVNGf3eUNg7/g8Sfoly/XalR2jmLeYynu89ssa+PhsIBVhCdjwN9o/72HLeoOR2nKOMiLA5OHW3o7xcobM3LhvqbeVDEw4MMazMSiq5LxDGsuag3T1eZtLcJQTtgg/FGz4qGKsAx6WYXsBO4aBVT3bC6h8UsMMvnjS0mJhzGcEqM2/yj4HK3SuiSjAnWAFOSx5aIkDS4JiTlYbHCJrhqSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KowglsUGucuwN0s6uI9Bre+GD+nznBIhIiDQmxMQP1Q=;
 b=JNC1mawal2DGNoVihCd7nEeY9khtS+OqKsW6D1pSvplkBV5i/9kOnQ9MwoS5JjmlPpv7P9VuVb1XJeiHsqhQQmxAoXKhg2jIf8U0578kvQAm/TERiciX0PkyG6GjZWVmrB4HN61Tn2UTzvp7+dDFMP8WAo7YdHE3AdqzqGtXaYlqRTSGFahzz/oAt1DnFeQLZ5CXXYcSRnsHIE480x1lS+W40sKhVnHOn4b3qKPcXRqygHWt+aFzZHTMnX+ovv++b7dpMCegg/LfXUSmoyB/9UHq4Hjm8u+UyRbJKoGHTGYsh+m3cTToL+GW10qPZc8mXlM92B/6h2moBuk7AQvQeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KowglsUGucuwN0s6uI9Bre+GD+nznBIhIiDQmxMQP1Q=;
 b=aVMO5DF6VYbYhudMUfSPL6AuXN5VTOyPE2BX499mGGVYr/LPuEGcfmTurO7/TK3+BtYrvelYJYcSnMITsltqjVzbSIvmW+RPU2CIE1yercrO3cYaWJqqKUWvh55xxlPAiF8iZTlg9pu4qmWYV+oPR6cRY+Er7qCyHAUjwp7ogY+k22XdLxWoC7p1+9FhxJfjfgCK41bZ9cJJ4rn3Axt9w846njjZe/ly8aR4e2Om6oVjLtgrIJkkAxmAciWmhIalaHlVAUFkKy3Uf3dqf/hiujf+Hv51oZPBoxYVsQWsrYmA2GNvUNNrNWL/p1KPOUukh0HzBuhckWl5QgbAFRgHPQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8555.eurprd04.prod.outlook.com (2603:10a6:20b:436::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:44:49 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:44:49 +0000
Date: Mon, 2 Nov 2026 16:44:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com,
	Kelvin.Zhang@amlogic.com
Subject: Re: [PATCH v2 2/2] dt-bindings: i3c: silvaco,i3c-master: Add Amlogic
 A9 support
Message-ID: <aukERgniLcU7BHeo@lizhi-Precision-Tower-5810>
References: <20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com>
 <20261102-a9_i3c-v2-2-0c474bfccffa@amlogic.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-a9_i3c-v2-2-0c474bfccffa@amlogic.com>
X-ClientProxiedBy: PH8PR15CA0005.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: bb48794b-c1d2-423f-16b8-08df392a8528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|7416014|376014|22082099003|18002099003|261102123227099003|56012099006|4143699003|11063799006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026140227099003|261022105027099003|261026121527099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: Ggkj3DlZn+Pfpr5rZu2dxdkZjUMWV1JrL640BOAU4yibrMDG1GvUZDDSPQ/16viDb9jWWn6dgjEQlBUad4cunHe13k148uIcfHinD/BMzfGS0CwwdzFanz2MQXpvr12XY/rrfb7PedlBEXOiCtP1o54w1v9sHyq4f9EaXqkVzq7o7JndgD0bKZzBirYF+uWCBwHxA9Yy9IHqOOt0TgoUaFmO7bmRuH2MQ5JliaVaeqVuVWTJNY4iQs4GoQsHw7RHuNrD3UHK9GwcMLuVOcKRHoRpdR/rgsDg+oh74/PJqweK/edfCFHkTnx/ATRMVGix7b5Yf3XC6kY5jWP5OMlYX06Pu2a/m+f/AOEOaU9iUb/Uu7N3Dbd0WmwTMVMIGebPxFQXeZxg+V4qULkLINxet1eopR8Kn8JooRWKYuZdguEjDCl9HqX8MuR01A5CS2mRMNGGA4P1tXEfsWsq/W/xW8TC8hdb2wzxcCimhGWMAYjf7gnQo0l4QWkrW/ZpUCX7gn9iOg0upeOvQWNldsAMY/PfsiEIoAAWfW2B+22o2xVxKL/a6BeYKZPkr9gcLNS9NM0z9pW+UzsA72CHlOdB35ZfMp5KwrDsLtmAFVhHzXnwRhtSx70r9s+3H+5qWUAhxtlzQOBaww6bUOJsUGuwbm8fu4RN8DgI/cZVZySdGAs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(7416014)(376014)(22082099003)(18002099003)(261102123227099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(261026121527099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?87q7JOvqJy14yzndaKTf5vtk50r5SzER1F88r0CdmliDAfrg+Hnh9ELX4s+W?=
 =?us-ascii?Q?rFH+j+U7KA2kJALEH/FvdcLaAOcBi1E8pU+Hfwp6A+DJWu7RS382sJF4UWRm?=
 =?us-ascii?Q?P3XbvHU5nOo8MjF/I8B8o7VR0B12rkAhe5ZXgmwTCuWsn6sq1WuzImVfRjmm?=
 =?us-ascii?Q?nH+h93tTVwCTGDh7AePuIsIjhi1RxaFlaPQp/B0cmWpdZ82GNYKxPHT2UznB?=
 =?us-ascii?Q?p9ed0T4JUh2FmGJ0KzuVJXIRFjNO3PvFULL6LfNEFuW/93R6hulKhNKShLw1?=
 =?us-ascii?Q?mbqxXe5YuTAgzqb2D//h2MjUek968pXXh1/BPaWS5rqqJPz8YhdeEtUWl6Rl?=
 =?us-ascii?Q?+nbxBUaBmT++wZurACqqf9h/Zf7IEygfvLtwuzZbmFBOMIxeof3ix2phKab5?=
 =?us-ascii?Q?wrFfS7dGzd1VNP1md0GABOPWcoEGJTQz4C7YZNr7IIp+DWQTr6J1bXc4Oxvr?=
 =?us-ascii?Q?Tl+qE++fuipmNyh1JPMfH4kxobRAYqTS5TPizaQFL2OWiQYSeogoHso5SICh?=
 =?us-ascii?Q?ox+zpJB3bQYC6vwm5a8HbssdbiFhLYkBPZfjxn0lOGU11onHG+TspsTvJ1CX?=
 =?us-ascii?Q?Te8McuCzegyFhV6fYItbSjc+lKq6ZQHa0pO25ThzVwWHN6UxTDaF1bFhu+W1?=
 =?us-ascii?Q?VzLDLBevHDrp9HiZQmFgSvPW0YPwbRhQmOVThyxSQJZaE9OcYkKZCZq8lRaz?=
 =?us-ascii?Q?jBTa84rrkIwao+uyXyt5R38Z0Uv4Mb88bIBxCrKxPAhIFbrJ308U1RC0z94s?=
 =?us-ascii?Q?X8/8CR5wtQ2tJk05knb5VTIfq7R4AMVtwBy1fmhkTzSoF9LMm4RS3KGAbtRS?=
 =?us-ascii?Q?fLhGCM7GfQUM30GsEf13Ey+qJsdb/tg7NUiGaCWvkgNZVtT49A8kBYIUtl1F?=
 =?us-ascii?Q?0dOOBKvBlhbyzjTd2Do32jLS3Dt73SsahtLGI0hhBW5KshW4p832dv+uQsxQ?=
 =?us-ascii?Q?mRg36HMWefUNkX1Wq/XiYy0vKBJCR2oGf63oidIC0bT8+SMW4CrBZd7nJHZN?=
 =?us-ascii?Q?jCFAJ6j1GUSh0D8enoCOfQnaPyjdb2q8QMJvbiP9oZnBECUqCqG+1PARUp0e?=
 =?us-ascii?Q?hPnA/BzY1ellcdEakdHUymD32iYUn6AZagmhtcFTYKPxmXBxDhJa3BTnDYvd?=
 =?us-ascii?Q?G1Xvdlb577srntWEVu62GMUHZnpXJrzogwlj2T4iIrRKT3vyY8px3ZrURlgt?=
 =?us-ascii?Q?qzZJDPQEYXksv6W5jHxPeI7NDJpjx6Lt95bcZlqEBy+Pn5tSnbMqx8F6A+hd?=
 =?us-ascii?Q?Xjf/K99Buq9q1IS2t27hl6LI79jOdyCoFncw6bYc531NXcRZu7WzeUqP5MQp?=
 =?us-ascii?Q?Q7w9EedU/HtJy0v47vvURI5DvM7RxQJhjLiYsDKknxhFvLE2KxwNgYMbxxWj?=
 =?us-ascii?Q?aX+3AR8xdkOZeMJPiy40BiMBPJfYnItFdh9vd/hglxn8r7Z7q/6wNoKH8R+Q?=
 =?us-ascii?Q?9N5wXrAcBAVccOymFGmkm0KJpO1kFt/YM2B23YLizGU8i26s88vblS8cb2f5?=
 =?us-ascii?Q?iT7yKzpjFIJ0Mo6Y62suv+4qmyRFz7gylhupA8hMeEo5/Bxc/CQyxPNd5u1Z?=
 =?us-ascii?Q?Y9R5b1jzsV921IE+vwNIYBlhgkhszPJdFsmHSzDkNEGNRERHcT6Hy3XCNJmK?=
 =?us-ascii?Q?xEFCYlb4sWdHoq7f0+uB2k76vsb3x28e53c2im4Cf7nv2ktfk6D5DnOsesjN?=
 =?us-ascii?Q?ty/aNr5gtlx4KQ5lOE4jckQwl4wyPTkwykh+nhuQxuI4kZ9uvjqZ90mmetIL?=
 =?us-ascii?Q?n41mdBh5XC4XcpabXTBIhjBP+SUmnUnQdcIuGgcuJ4+5tcAqASSZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb48794b-c1d2-423f-16b8-08df392a8528
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:44:49.5904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVDdpLbEmnIJ1kQOcflogArgHb1gI9rpme+YPLDgAKJ4bjXkVFvqNpHVBldAt5PihjNQF++yOb/4Z35tGIHEWAs8dkOPyB3ACpXLAlJEok9XFD4f0OLPixDct47HfOiY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8555
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_134455_349118_5A53D7C7 
X-CRM114-Status: GOOD (  18.04  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 07:05:40PM +0800, Junyi Zhao wrote:
> Amlogic A9 SoCs integrate the Silvaco I3C IP with two controller
> instances:
>
>   - amlogic,a9-i3c for the EE domain, which takes two clocks,
>     "pclk" and "fast_clk" like the NXP variants;
>
>   - amlogic,a9-ao-i3c for the Always-On (AO) domain, which exposes
>     only "pclk": its bus clock is generated by an internal divider
>     located in the controller's own register space.
>
> Allow both compatibles with the "silvaco,i3c-master-v1" fallback and
> enforce the per-variant clock counts.
>
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> ---
>  .../bindings/i3c/silvaco,i3c-master.yaml           | 24 ++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index 853092f75..de1fdec65 100644
> --- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -19,6 +19,8 @@ properties:
>            - enum:
>                - nxp,imx94-i3c
>                - nxp,imx95-i3c
> +              - amlogic,a9-i3c
> +              - amlogic,a9-ao-i3c
>            - const: silvaco,i3c-master-v1
>
>    reg:
> @@ -28,14 +30,14 @@ properties:
>      maxItems: 1
>
>    clocks:
> -    minItems: 2
> +    minItems: 1
>      items:
>        - description: system clock
>        - description: bus clock
>        - description: other (slower) events clock
>
>    clock-names:
> -    minItems: 2
> +    minItems: 1
>      items:
>        - const: pclk
>        - const: fast_clk
> @@ -72,12 +74,30 @@ allOf:
>              enum:
>                - nxp,imx94-i3c
>                - nxp,imx95-i3c
> +              - amlogic,a9-i3c
>      then:
>        properties:
>          clocks:
> +          minItems: 2
>            maxItems: 2
>          clock-names:
> +          minItems: 2
>            maxItems: 2

Nit: if respin, add empty line here.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,a9-ao-i3c
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +          description:
> +            The "ao" variant is the controller instance in the Always-On (AO)
> +            domain, which has no separate bus clock and derives the
> +            bus clock from an internal divider.
> +        clock-names:
> +          maxItems: 1
>
>  unevaluatedProperties: false
>
>
> --
> 2.42.0
>

