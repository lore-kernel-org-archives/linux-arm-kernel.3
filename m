Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E025606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dV2LVRHC;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=e/dyLHNK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jh06e6JKmAn4uARtbOF9YIiQWXQtZNDPqplJDLgVFE8=; b=dV2LVRHC8hEW/xXPgH8iZ2rrFu
	4C6GGbSRDPZJWMBGSsur1/4wvpkgZPf7eKezpaR9KwMC44VsDcjLOF212UrHxYH0q3nmiBBbDnc3g
	ImA92F5LjXIsc4id4Lc+eTdsapJblrJEkHJ2G8+2s4dJH5f2YeAUAwuMPw2RcvXLTcFnGIYPVUIvc
	kTMmkBooqx3UXL54qSElPM+iaLJy2f+Wky7gAt5zc0E1t3p+iMEqoufGlu4Q3w52zJGvGslDTXW7Q
	k9UpQ0eAWrGnzIpwMVVitJOS8PH+sGxTOB4C0Dg3uN9AYMa2FzQCpDizWdeuSzadzdMlwWgjnPtqQ
	/fVsibiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHj6-00000003DtD-1OIj;
	Tue, 03 Nov 2026 16:51:12 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHj2-00000003DqD-0jm8;
	Tue, 03 Nov 2026 16:51:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYpCThKkdoZTaSRuOYqUO5fhhy8xkf/4GGASufIa4aZD3cxiAy179vpQQdj8OdtxrONgBuDqeCyCNz7JzFJWwYSLHZCVbFFjbUkyWcETeHooOLKT6/rIXeskUbsjy3d5TOtmjPv5QiZblH00BuNHyUXvqOjtkvy1wiO5iaV7cDx62+1Si+KKnuh89T3OAzu8Q6AQfx9ZluUWh0TNJ5iliieQAOWldH3jq65KRoQNMn5bXQ5LKAnAO7UQT9LtPae1YEPrGV9copLeV4FTk/9mDprdJhunjGMHg8gjXrc8lIHdxRVSYq8+On0dAcsuc+QfCIOr3jRg/pVGcLy/XnHGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh06e6JKmAn4uARtbOF9YIiQWXQtZNDPqplJDLgVFE8=;
 b=TD2QVZ0eQajG4iq2gFiA6ohNVwcTwlcl4r0WNayj5eWoWLzQdqUrpRJVedXKwImSVNQNOHjYbS0LXgDWFrO2g4NlO7kq3RNo3bhz49MopeVX3ceL70NvmTDhaCjXR4WVPWhdaIXXEIOhUW3rDAhYsRhMAZqDO2vqngqltVXP0W6d58NrFaAmvyEF2UFkdY71AHeOesjeT5PeQWND1lGgiwrWStO8ck8S+iVaL2RSyObFNbh/ZirCc6AgtRXkyfLHG6zniKqOm04z4KzXHC/A552dOt9eD7EU49a5ESLlZHn2XhMwHFNuS3G5+t9M+Cx8IyPi+3M8a8UZZFz9YYMwMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh06e6JKmAn4uARtbOF9YIiQWXQtZNDPqplJDLgVFE8=;
 b=e/dyLHNKxg5c7k3GB4WTGU5zDwindKY/Jfry9nkYldaL+PN7bROio6FyN76Bn3TAdHH+56maLcKHyJ0s2Xxr80ShtkD8/O2CudBA+GGEj37fXMiLI4+sRbOo8q2VeGD1LhQLhd0uLbf9v7TYhT3u3dZs/V3gfv1zsgWrk6RlQCE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by MI3PR04MB12636.eurprd04.prod.outlook.com (2603:10a6:290:7f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 16:50:59 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 16:50:59 +0000
Message-ID: <1aa42d0a-5632-4ae3-85ff-2bf5e332b2f8@cherry.de>
Date: Tue, 3 Nov 2026 17:50:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: enable camera on tiger-haikou
 video-demo adapter
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20261026102027.2451025-1-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261026102027.2451025-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::10) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|MI3PR04MB12636:EE_
X-MS-Office365-Filtering-Correlation-Id: d72405ef-cf3d-4752-47c7-08df39caa2e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|3023799007|10067099003|56012099006|18002099003|261009223027099003|261022075727099003|261102123227099003|261021121427099003|261022105027099003|11063799006|261026121527099003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: W8Tj4yVP7PXC0+LaJb8nRDY++xdP4tYheb4jftZrPb78BT8vWTBljkZ0xmLzytxSU0VUFTD2+GOAUzcku/tbpSUewrgIYYr7vvYF3gg4PjTXclg/B6ZXraxhnWFfJnfbT5L9GicBFg2D7jCP1ITmfo1LwKQO3xklQ87LnFKyA+OWJiiicVBGsSq7BX5ZFxRMrY0eNunnjd0cd0benXQ70wq+Hiqc7rVFGTPYmlcDDQuTTxjaUvDR36b5d+LKCLw5Gv1NKAemBgvEHAwtTiMoMY0TCOGe3UyDAe8nG+ORcXitaan+kx9foqhdRivgIgOJCweuSnmXjUgX77xiRrUV1Aeki56qeHUBtxNDqnVW2+AaoB7cIwtOfa+/i6LmtU18wJOmKnXO2kLHSIm0Mpvv5lZUvqAjF3M1aOo+v/IBctD2Xa92kKKDLlBVYQdKhKQ0OInL6+ArWgGLxNvtwVipSTu3cuFEvq/55c0P3k1I8GVh4taQ0Ujyqc6O609YVmIC6nsagtk2KKUWOCBZOIpQR8a8m1QcSqYsyHzzPCKuFmXGkEHBCfPSe88JuwtYBsXDeyP/1AFBgsL6++ZOYo+giFboRx2fBmU0hxy2hdMQGGKWoUMTSzT+4Ph7PSlXbcUz4Q/VbcszWugnQdLqmA8I4dInYfp7Odv05vwrRLfD5hY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(3023799007)(10067099003)(56012099006)(18002099003)(261009223027099003)(261022075727099003)(261102123227099003)(261021121427099003)(261022105027099003)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?My9HNEJpK0E1V1NJVThYWXUyOVN1VjZDTjM3UnJLeWV6RTNMOHJSb2prbVQz?=
 =?utf-8?B?UmplRXMyWTRNQmUvdGN4V1RtbXZQcFBld0RIL3AyTHJ0bjVnWDU0SVJOcHJG?=
 =?utf-8?B?YWdhaDZkOHl5OHlkdEQvUXcwQXZjM2YyRFJCMVVOcmwzaXRESDVUZUJuMFVD?=
 =?utf-8?B?Y3dCcG9yNEhYbkJIQitmYkdRTG10ckxRamp6QUlVQnVzUUhXOHcwbFRiVUJM?=
 =?utf-8?B?eE8yWDhsYmNhd21KclE4MmJveWg4dXB5d1FhVlZ0bThydlUrbVE5dk90WHBX?=
 =?utf-8?B?RnJreFZRQnBrMWlhVHRYU2F6WCtqK3NPajhmKzlCU0ROUHdvbUF5L0FQNEx0?=
 =?utf-8?B?VFhYYlMxdVFPZFRkcERHS0kzZXg0R2t4Z1pKUUoxNzZYT1NiT20vZ3lqa3E1?=
 =?utf-8?B?VDF3VUFGZXJrKyt1K1hOY3d4Z3kreWJLNGREaFF1Z3diUzFsbjFqcE00OUpM?=
 =?utf-8?B?eWhWMzFpaWtLeGtjdjI5aWlpclFKb29JSUJERjJJcG9ZVDROcHNNTlhDNlVq?=
 =?utf-8?B?S2hBWVJpczdzc1pWZjNDenNCZHFjeVd5d25rNnU2ZXZUbzFDcHpGM3p3Wkcz?=
 =?utf-8?B?NlFZdkRsakdRcnc1UFQ2NmZtNGFXWUtqbTZDWm1iNlpzMGxSNUlkaFdUaGN1?=
 =?utf-8?B?YjF5N0hhbVRjQ0l2YkNhTW5TR2Z0TXNkaXFmMmp4cDhZaWJvZlhjZlgvNjZU?=
 =?utf-8?B?c0ZQRXRWZExMVThTODV6Q0VGbWs2RUtBcTJzWlhiVXFvYXRPK3FJOThxc0s3?=
 =?utf-8?B?R1U2bm5DclFQa2Y4SENUL0tqR1docGt5NDdlWkZlKzBPR3V5R2U3ZUJ2bWhQ?=
 =?utf-8?B?YTAzaVVEbk5GQzhXSm5xTzdHYTA2RkJhOGc5RWFmQjF4ZG40bFowSFVXbUpC?=
 =?utf-8?B?RXBzQVB6OG1UWXJIZnlycUlKOTF6WWVQa05XUHovWnJ3ZGY2WU8wREFBVGs3?=
 =?utf-8?B?a1JlQ1FyK0hNZTFBeTFXS2VHTGgxMjJlbzE1ZWIvOE43QW02QW5rcWFaNDBs?=
 =?utf-8?B?S3l2NXljUXNrbk1jdC9iUCtDT3I2dFVsQ01EckJyWGlYTEhKdmZkOHhZbXN2?=
 =?utf-8?B?bjJoWWJxdnJuUmZxRzdFS1VNNE54K3ZKS0hlN3BPUDRiSGpSOWhqTytiazZW?=
 =?utf-8?B?YXFWdjhnMHliNVpYdTJNZG1wZFZwSC9LZHpVQkRBeEd4R3dtbWR5OHZ6bzRR?=
 =?utf-8?B?VjZUdDM3MHJad2pVRlllQXRpTkVMeDlrTnNMWTdIZThKWi83eVVseXFzdlRF?=
 =?utf-8?B?bVNFdFBYYU1FZEJ0bkpESGhYWmNrNUF4UzlTL2RPY3F6UlVBLy9IczU1R0Fy?=
 =?utf-8?B?eFNKUGhhREFrbkcvd0pFQ3ZNeE9VaUxMeUdNTWExY2dPQVNxSUxvQ0pUUDUx?=
 =?utf-8?B?YkVQNStYWHMwUXZkcUhmcU1hR0cvRWxMWmNOakgzaXQxdEVvZnFIUWdNOHhs?=
 =?utf-8?B?R2hQMFRzbytsRzlCRTk5RDY0KzFxZkk5RUp4QWNjU0ZXbnRMMnhRQUhqSWk2?=
 =?utf-8?B?WFc1Y3VFK2R5V0JBdE1tbVVFZnh3cFNacjd5TFoyZXJnV3ZoVmx3ZkFhUTN1?=
 =?utf-8?B?eklsUWxZZmEvT1ZtVjJvZ0ttWW5IbUt3WWg2MzlKVkYwVEtRWmovOU5wUEtV?=
 =?utf-8?B?dnpZRDhKOUNXVm5XSUp1OWxzUjZkN0MxQy9oYWd0bytMdE12cUpaVUV2ZHBy?=
 =?utf-8?B?U003dnJxWHN4KzY4RTZJaW8xcjRBWWhYRks2UDBROE9VeWhYRWVxd05ZQXN1?=
 =?utf-8?B?eFpHZkFmYy8xQnYzbUtDeXdFd1UwRlpGRXo0M0xJdXlKK1l5TkFSc2ZDZ3hm?=
 =?utf-8?B?L1J3ZVFzOG12KzBUTkV2bzcyZjVzL1FHKy9oUjkrTDYvWmhBQlAxSkxGWVI3?=
 =?utf-8?B?UTQ2WW91bHNRTnRFTnJHcGtnVmMwaHQxWlBSUFRTYU5XNi9zNVFFNXZReEdj?=
 =?utf-8?B?MU05TDFpNGJsQXZ6cGlWS3NHZE84S3ZYbEFPZFg2bk9qWFpyQ3dzUk52OExF?=
 =?utf-8?B?TXRnZS9PUCtPQTdpcGQwZ2ZKRHh6QU5lemVzVDVTaXZzYkZBQStYN3FwNXpa?=
 =?utf-8?B?Nk91Z2xicko4RjUvUlRZWW5jMjNKZXJIWm5DMzlMQWhyQ2xpK2hRejhDNTNv?=
 =?utf-8?B?QTNvYzVsbWZQcFhra1ZGd2hHQmZBd3dGWTJXNGV4S0JDbzVpSnJLSkxvMHI2?=
 =?utf-8?B?UFFSVVNJYjdDeVRHWGd0em5JSld5bkpWYlRJSVQ1NVlkbWttMnp6U2lvazVY?=
 =?utf-8?B?RkFJVDlXNjlBamdDZ3U0VXZub1BhbTdNRDRJQjlGa0JOeTlpay9lQnBuSjdE?=
 =?utf-8?B?K0hwRWJIMVpBcVlwL0VtQUFHSlIrSnU4ZVphRUQydlgvOUJjQ3AyUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d72405ef-cf3d-4752-47c7-08df39caa2e6
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 16:50:59.0253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ro7o6pRcgfo0eaHduLyWITj4KnSIWUTQjk3h6Dv2V6KPS1Vjd6mVQnQy1Xo6L6W0+LDRkIsmYkOrvDY5c1b0nGsFV20O1VdTMyKziVYJsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_085108_257015_0BB44F71 
X-CRM114-Status: GOOD (  15.17  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Heiko,

On 10/26/26 11:20 AM, Heiko Stuebner wrote:
[...]
> @@ -57,6 +96,23 @@ video-adapter-led {
>   	};
>   };
>   
> +&csi4 {
> +	status = "okay";
> +};
> +
> +&csi4_in {
> +	csi4_input: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		data-lanes = <1 2>;
> +		link-frequencies = /bits/ 64 <450000000>;
> +		remote-endpoint = <&cam_output>;

thought: seems like we are missing link-frequencies and bus-type for 
px30-ringneck-haikou-video-demo.dtso?

> +	};
> +};
> +
> +&csi_dphy1 {
> +	status = "okay";
> +};
> +
>   &dsi0 {
>   	#address-cells = <1>;
>   	#size-cells = <0>;
> @@ -96,6 +152,12 @@ &i2c6 {
>   	#address-cells = <1>;
>   	#size-cells = <0>;
>   
> +	focus: focus@c {
> +		compatible = "dongwoon,dw9714";
> +		reg = <0xc>;
> +		vcc-supply = <&cam_afvdd_2v8>;
> +	};
> +
>   	touchscreen@14 {
>   		compatible = "goodix,gt911";
>   		reg = <0x14>;
> @@ -118,6 +180,31 @@ pca9670: gpio@27 {
>   		pinctrl-0 = <&pca9670_resetn>;
>   		reset-gpios = <&gpio3 RK_PC1 GPIO_ACTIVE_LOW>;
>   	};
> +
> +	camera@36 {
> +		compatible = "ovti,ov5675";
> +		reg = <0x36>;
> +		assigned-clocks = <&cru CLK_MIPI_CAMARAOUT_M3>;
> +		assigned-clock-rates = <24000000>;
> +		clocks = <&cru CLK_MIPI_CAMARAOUT_M3>;
> +		avdd-supply = <&cam_avdd_2v8>;
> +		dvdd-supply = <&cam_dvdd_1v2>;
> +		dovdd-supply = <&cam_dovdd_1v8>;
> +		lens-focus = <&focus>;
> +		orientation = <0>;

issue: please use MEDIA_ORIENTATION_FRONT so it's easier to read.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&mipim1_camera3_clk>;
> +		reset-gpios = <&pca9670 6 GPIO_ACTIVE_LOW>;
> +		rotation = <180>;
> +
> +		port {
> +			cam_output: endpoint {

issue: missing bus-type?

I have an additional request to Heiko with the maintainer hat, please 
only merge this once the necessary parts in the OV5675 driver are 
merged. I find it very beneficial that only things that were tested with 
merged commits get enabled/configured in the Device Tree, because I only 
have to check the Device Tree to know if it should be supported on our 
devices, and if it's not then I have some more work to do, and if it is, 
but it doesn't work, I know that it is a regression and I can figure out 
when it got introduced without having to patch the kernel for each 
bisect step.

Tested-by: Quentin Schulz <quentin.schulz@cherry.de>

With the two issues fixed:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

