Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBAD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y993ER4Y;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=Xy+N7pPu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/GljYGNCx8+r+gCX42gzem/N3NbngRMs4l24rHuV3uU=; b=Y993ER4Yjjk6jUK+kl2ifQNf9H
	yy0aU05IxAnrbE8zslikaMXVu4BqVTSg8fMYSEvjanMYOL24s9H+/OkcO+ZCbpfpDtWQXvTLQhHdH
	OJ8mrhZllC1JGdnZIHeO/sHWuU7AOCfCdczR1CX5pE2w+S5bkCJKr40skrHuMTFJegw/AZQJX3J8h
	i9DLH9oMhxrh6qWX6S+FPZz7LZWyxg3DjehfnsbRjSuhuxZH5ellzMrP2VEGyShRUFpC8O3Y2oo67
	gNlbtjJbDBgzsCyFfIba5sz0e0LNqNP9xngwIhLeox+Eekr6/Unlt5wXFmBDAD5nEzr6ktupCzwUe
	bPdVaQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ55-00000003OOw-2OG3;
	Tue, 03 Nov 2026 18:17:59 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ52-00000003OMv-15zQ;
	Tue, 03 Nov 2026 18:17:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdahW3vnm4F2MYmKJd4U78hiqaIcWjffAGeh5Rz0Uf9nfPMQCp2HzC8B6ilNEGapp2F3qKWtdUieg/HW0lW8UNzXv1VgtYL6gnFRALHRpe0JtbaxktHfci7mU81xErA4zwIJKIJIXCkY+w4SIAzF9FrEdwwGeB8FRt+GBCq5jDXD2wwh+VJphNRJMnUDiBJvfEKt0Yonkzk0MbUCxNo0H1/9kSCKJZeR3/8Em0HDBEU7bbfk+BErLkzSgVF65lUFY1MKh1MG9A5vj7ehSuKEfacYl96Fs4mnhSq9PzdHuxsGoD8/N9iZXJv6yCGEF/0BQU88lTIXKC359GMAk9Warg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GljYGNCx8+r+gCX42gzem/N3NbngRMs4l24rHuV3uU=;
 b=XWlisScb44uG5H9TWWP+1Uz3zoypLmLjJ4W1IL/EdzJ/e4IwkwYkv2oNg5OForadvayCMSO6IP28CVxl902p+u5ox0KafZA8nlNrftpDZx2e5WGaG9bP6pE6F/avzcRaeqISOApFXbAVRVwbEmdGYyvI6X5H508VlrZrMpy+mAWiJcdOWTIX1ETiADFZekNMfivs+pLbGvLdURbYpimrdGHn674WFJNE0C2b92irdhBbAGs4aVpKLtcEwNABNv849XH8/3FgA4p3i+kyblXE9gRsnt0//wzuCxG7yR+6hR2PcciJfnPZ65aaywMGveHX9C9lf3NP2Z2xDBb6vEsVYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GljYGNCx8+r+gCX42gzem/N3NbngRMs4l24rHuV3uU=;
 b=Xy+N7pPuLKcUieahe9DL/kNIY+0ju0S4mwuAUZVUUzT9VmcZLeUSyAW+b+tp4NIgpVHgvwavNqwl9pDbaO2Xw1l3iWiQWODyEOKKRW+AlmpdRNgapdlS7qZ8Lb4iRgGnedkZJ1cwRAbG2wnLBP72Z4FvnshEOuCFgs5SuZJ0VkY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by PA4PR04MB7520.eurprd04.prod.outlook.com (2603:10a6:102:e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 18:17:49 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 18:17:48 +0000
Message-ID: <ce82814e-c1a9-433b-9dd2-fbb84801545d@cherry.de>
Date: Tue, 3 Nov 2026 19:17:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: enable camera on tiger-haikou
 video-demo adapter
From: Quentin Schulz <quentin.schulz@cherry.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20261026102027.2451025-1-heiko@sntech.de>
 <1aa42d0a-5632-4ae3-85ff-2bf5e332b2f8@cherry.de>
Content-Language: en-US
In-Reply-To: <1aa42d0a-5632-4ae3-85ff-2bf5e332b2f8@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0085.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::14) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|PA4PR04MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 7960f24e-8325-4a38-43d0-08df39d6c41b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|261102123227099003|18002099003|56012099006|11063799006|10067099003|261021121427099003|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info: +xq2hgOO63jv/meUpXaU0zVFevMjQM1hUw6yREWap+q2TkHmOauHXdeVD3+bhMhtcZu0RbtyygPW3KmOZ35f2aLaxvX2RcwveqzPfIRqA+4cGhznc6TsHGO0nfYIFYeBtC0SgrgtZRAylRf7wi8FVo9uU1fUYqBP4WHXqB60zzbZ7FFjeYLAz8JID1Q/PjgMZE1D7RtImCfhMFIKBDVYIMoU4GtJfCI8ulUkUBweNTZqgKKceIECMClZxu3JzCtc1m6lFcunYQ35lv3mdUtQLQl1rG5u9kI9z2tJTht6UROl8XuSJdWo8FShaEsftO7n8dtKmQaDXPyiPmwWS4DShLtyDlkuf8MfPsVGVe4qN4b0m7OvS4RRHSe3Xwt2BhmNNpLeQPszGzB5vk/Uf2EnZA2D4ah+sEHJLRQsFObiT0GDPxv6VyfyGhULipkIXCygSgyKKeWznNy7OGdKsc9a402hUO/2kd+AUFHYVMPLAjdBZrLCdpCkqRzO3RSC8iEr2wOesFZn48NsoLAlvuSWaZK/F3OKD5jfGYXe637SwqHjbHNQalbSKcFh5ao6nmrAYoorS7FfzdhKAn/Y0cjb2usuOBkI2iEc3XWyMlwDOcqMYYg+rC/4Ie2APG2IFhI8cgUdYWzqFI5dxO33KgdehsGav+9LCvPmy3P+kUVh6io=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(261102123227099003)(18002099003)(56012099006)(11063799006)(10067099003)(261021121427099003)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUV2bE14R21OV2pEQTJGbTlMRXFUcDRhYUpVTjZDSlBwNzZpUWlFMXhwS21J?=
 =?utf-8?B?VEYwaVJrYndqL0hWZVJyQnBpQnp1Y2JlamJ2aWgwRzFTZ0NhMlVFbXM3VXZw?=
 =?utf-8?B?VmVsbGxLeGlNSS9oYjVXWnJpSzcrL0d3SVVDVGtuY1dzMSt3aXlFOTdiTklW?=
 =?utf-8?B?RDhxb1E1UVVuS2NZODdrVlg4WmJQZkhWRXp6QTFiUytWdzlhYkpIY2QrRWVk?=
 =?utf-8?B?QmdxeUtmMlFvZ0MxL3FkTXd0a3NleVRZSVFqVjkweU5LNHZvZ0RNZ1Rka3FY?=
 =?utf-8?B?ZEU2dmtYWEIwaHBDV21FbzZmY3hDUlN4a0NINEowQlpmUE4xWGQ2NEJUSldB?=
 =?utf-8?B?UWE3MU5BRTJWanFwR3I2bDM1U2xVMjlKdXFtczdCbjFyTmlUMHNBdVBpZ3gx?=
 =?utf-8?B?SXdobTNiazFWNHRaVXk1RjNtdVBwU1NDaEozMUVFYllMTDNyTkJiQlI1ckdy?=
 =?utf-8?B?OUQvWkUyamFQNmpSS2plTlZTalo1Vks2bFRIa3dYVU1VdGlnZHRqSE1JQ3lH?=
 =?utf-8?B?d1RPRlExMk5MeFNUMWZNMTcxbjBvd1BzcE83ajN0UHhYNUJCMGVoK0tsWFNi?=
 =?utf-8?B?aElCaVIyenBBd29qTm95dHFyeUMyb2c3Wko5azJGT1lBQ2xGZG9kSC9OYU9r?=
 =?utf-8?B?MWlzY2lxcWtMRFlzSzhVUHFkeS9FV0JKUFI4ekJhNE5JYkFKUkZlTGVNbGZI?=
 =?utf-8?B?dHhJMjIxb1ZMRDR2U2lheWxrYWNBc1ZvRzZEN0dLeTN6QnlsR2g3eFVJL0Uy?=
 =?utf-8?B?ZmpkcllLaDI5MDF1NFFDZ3htdTdzLzRsRFEwVnRaWHdUcVRCZ2FBRERmSVUz?=
 =?utf-8?B?bFhYa2IrUEZZOXdITG1jVDdvaUJTdmd3bXhQS1NCT0gzd1dqaHNUN0ZmMkdn?=
 =?utf-8?B?UWttY2E4UVYwWXNKbC9jbzBYMlhjT3MvWEowZlI1eU5STnFhalBjMlFDRk90?=
 =?utf-8?B?UGYra3RIYmVMbTlpaW9qcWg0Uk1aSWV3QlBYa3Z6dW1tcTIxTnRTcGpsbWVK?=
 =?utf-8?B?cmN6b2gvYXZXd1pYMTBIbitoRTRDdWJBK2hSYmthdFg4NmEvdExsT2JGRTB4?=
 =?utf-8?B?NmQ0MlVDUnhIM2tSWTRmOWRLZHhHY3MxQU8wUHI3MFdpdGhmYXdsVkQ1N3BL?=
 =?utf-8?B?aHdaanczeHhIU00zVytQYUUzcDBrYmZKcXBLczlyU2REVW1nQWZ5TnpRRTNQ?=
 =?utf-8?B?WHBHbFNEMEthaThwSHRGQnVEbG1NZkRScGN3SXdDc3U5NWxPRENvRUV0YlBT?=
 =?utf-8?B?Tm5VWFRKZlRCYmtLVGE2UDZsTFBCRnlYejBsVDI3VVhzWE5vN1RXaXNyZWwz?=
 =?utf-8?B?Ulo1WjZJa1ZxVEg1b2xIQkNtUldBRDh2c2YvWWFtc0paMkYySlUrUjRZUThw?=
 =?utf-8?B?aEhoRUVyMjVFb0NtRVkvcUVDamtpby80czNuMjd3bjVsbDRMZ0dqNG9HVWd0?=
 =?utf-8?B?UzA0VVdvajZSZGd6T0dtcnB3RVJ2OE40UllLRzdrQkVHK3JhV0pFQnY2RTVp?=
 =?utf-8?B?TFlIZkpPWU5USVQ5a1hIRU1GaExsbXo1WkhnRDdnZ1E5VVBQbDdrRWdTeFZU?=
 =?utf-8?B?TUV5Q2NUNFh5dWFPcy85NS94NkZkdEtxWEw0Q2tPbGo0NGFwM2FwR1RzZGoy?=
 =?utf-8?B?d2hWditLL0ltZGs2ak9NQnZjdE9GOWd2T3R0SWdqYWxRRmM3T0RnQlJSMWk5?=
 =?utf-8?B?bHVOZTZBNXZFb1RIbGNXYTA3Qnl6Wi80RWhhM2E5Z3I5bkpPeFZTOXZDZU91?=
 =?utf-8?B?eU5NUVBVQzF2TlJndUIwVmxHVzhQaVVIMzBBbGNvbEQ4VWtncklMM2htaGNs?=
 =?utf-8?B?Ly85TjNGMkRxdlFqckVoSVh5LzdBK1pWRlNlaWE4OXF2MGdLWHZGclhXckx3?=
 =?utf-8?B?QU5aSzhYcDdva1lSM3VaQzNSMDhxaW40VjEyMzF6ZzNnVUtEanA5TkpVUnhY?=
 =?utf-8?B?V1pJZ3kvdHpPb250L0FibzNmRG8raDcvNGI0a0prbUpLay9XVDZHZlM4eHQ5?=
 =?utf-8?B?aFY1R21EYktHWk9TcGN6ck9xRFliS25tdUpSaDZjQU1VTEtTckU0UnArQ2xI?=
 =?utf-8?B?Nk1QWXdlRGlSWXp0NEFpelJmRXBtVHZkOXYyWnBpWGtrVVZoUHFtdmttTFRL?=
 =?utf-8?B?L1p6UHM0NWhiOXBJN1dxL1BGejUzTG1OWkVqL1dNbUNibTYySmY2cnpaQ09m?=
 =?utf-8?B?Yk9vMTZzVkFhckwrcWtWZmo4SER3dThXWXpreUJrR1paWGNFNHMxV3IzbElu?=
 =?utf-8?B?cVJOVFhsMW1TUWZ1RmJTSVRzNnY2TDc3djZLeCs1elZhNkIyKzNkc3Bnc1Uw?=
 =?utf-8?B?VjlyQlpVSmxCaVJ0VjNwcDhicUZrcHVMbDhOU3dEdjNRTStCSkVnZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7960f24e-8325-4a38-43d0-08df39d6c41b
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 18:17:48.7631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mz97YT8JWbaJrmE1wcSVwYMoJCbhKwUmIXIlISEzTV5EONH4uFjDlXlvw9rQ2wWWBqL2E1XI/w94zNQTO3bwbaRSetAMoRCNeKs/DAom24Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_101756_311424_2AA30632 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/26 5:50 PM, Quentin Schulz wrote:
> Hi Heiko,
> 
> On 10/26/26 11:20 AM, Heiko Stuebner wrote:
[...]
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&mipim1_camera3_clk>;
>> +        reset-gpios = <&pca9670 6 GPIO_ACTIVE_LOW>;
>> +        rotation = <180>;
>> +
>> +        port {
>> +            cam_output: endpoint {
> 
> issue: missing bus-type?
> 

Nevermind, it seems that it only matters from the CSI controller 
perspective seeing the two other Rockchip Device Trees with this 
property set.

Cheers,
Quentin

