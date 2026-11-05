Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F12C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MgapFni1;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Vs+KnoJ5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3RgE0+S3OudSaNCCCBczPyxwQeNV9VnXv4HG8DcRRbM=; b=MgapFni19cd+x2ENDBW5Z9o545
	YFi7Ofo1QtfawLUIpCLmJBJo3cSmkM2xFLbt1zHRntZizw+i00E1X7ABZ7oa+8V7hZcqeWv3/CJEm
	twtmo9rb1h8Tv2XnnmRuGiCaZHX6dDYHaYmyuSuuJTmjzGocQ3cWtPrR4zOK9jSksXh9U7m8wbKFJ
	z0ONKscx5ygnZUmcCwC8LzbizZ9vYicFINNM8IosdGY4C6gRhPWCHYiO8U+IvH08xvkZPrVOoqSGd
	l6wUYGhq2hgCJ+/hlamaBIVfM55A3972JjOplmJU/Jh/Px0pfEdP9djP8FDk3mgRw1YFFW04RNDIR
	Vrm1gb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3fH-0000000AUXf-1cjT;
	Thu, 05 Nov 2026 20:02:27 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3fD-0000000AUWj-2zpK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:02:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQaqlETPkZFZhoQPi+YHrOZ6H5RkaCpvMN/L8+1aQsdDL3yjAKZ1ufNZNIVwnMhGxkctuAkSbzUp7qJWPv6V6FEKeuJfQqIRBFdMt6M8QQiGmbmG4KpkX5o6G8livfO8Co+MLdGORxcu8lAL34bnJV3MnEYjIj7gKnKehAbPKRA0AaBQQADOrV+OnD1dhm8r19gp+5ePXS2U10jPwV3/GxJ9j6PO0ruUFSyMe8SDRLuVNK5enVipIMo4J9vj2Z0d79OYQ/w2tVbWJ7E4AtCYZQiiRnOIhxXXqzLHOgoPnPTIenlZMIvBFQG2A6zusy7i3l4bGwegVjsBrcaq07TF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RgE0+S3OudSaNCCCBczPyxwQeNV9VnXv4HG8DcRRbM=;
 b=Bq5lWFbL/GJURTLkmDV6RNnU/l6QfV5LZJ53NtQ7JlLulB1KwaHbUbf6R0VeLllojVqvEZbkAb6zab08KhkY6OTIAFVhvIEnQYFbNKTE1tuTbylEfU3ENrmy2RfOvnlQ14URCKHxqr4D9X9GROGsg4h5bMZD4Wz4n/pLOWHQhsqXenU68ArBMKpfy4C7ojPsB6dLZiRl3ArjiNVmIvyUkNpyuXME4RHz0K5r+KEDZVMuNV/NRQe4GONslAqpshQ5e5gUgq9KWSJ4J+0vAuVaNI/vD5KQzeGgXLq/+hE4j/aIUUQbGYcIbzVybOZWNHj9U9pQrBZ/Ri8nsZzRMT6fhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RgE0+S3OudSaNCCCBczPyxwQeNV9VnXv4HG8DcRRbM=;
 b=Vs+KnoJ5ZjMKmNZi42ZxJemdetdl9FkdjOwCsY4yEZp9d5ujxHUn/7NLriVyNBBjJ4t/ibMBy9Yl/7rcxhz6+sk//bysPOv8y5VOZDaW1oH3SMSxMKbgWoZ4LsKOBNj/Xu+LdEVEPpkf8VqoatmCdY024J3YOQt7DABP3vANhCmXeSmOJAffl8KOWxOHjApocH5y0jY1XPmX/Iy2KV6zhuXvZr71pjrJSUzEAagHDAYIMp2P4SEM1GOuWRVIxoUJGS7SLBfsCFiAAsgcc8vjJl+iU4YB42VynBXeu75o1PnogvJrDnWvL30NcGBFWvaOj5Mx6Mb2o3RXHSycCj37CQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by FRWPR04MB11199.eurprd04.prod.outlook.com
 (2603:10a6:d10:172::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 20:02:19 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 20:02:19 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v4] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 remoteproc
Date: Thu,  5 Nov 2026 15:01:57 -0500
Message-ID: <179390890787.1675761.12799490750797393286.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028-verdin-imx8mp-m7-v4-1-d4e23e62ebea@toradex.com>
References: <20261028-verdin-imx8mp-m7-v4-1-d4e23e62ebea@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH3PEPF000040AB.namprd05.prod.outlook.com
 (2603:10b6:518:1::4d) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|FRWPR04MB11199:EE_
X-MS-Office365-Filtering-Correlation-Id: ef909610-be0b-4d07-046c-08df3b77ad98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|7416014|376014|22082099003|18002099003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: iTktDrdgezKDtT5t/c2KcWDinqXaze4iu3VtKoVTfFQV1TEpDK0gzkiAEF0qWDlkKvPW5KrDTRJjehPy8a5cdqQ6WWsaoUxhydwNL/J1lahVC4bv7QCcbJLK7/3Bi4iiZnkgNxoOfVscD2hTdvDqubO5GKtyaktenxKdrrBdWNOnrdfhFNB7Yux//Prv3MmbJ1wwigVZ26Bs6umHeo/qAIUdnW9ngBoConhucRg9WxOA2Vf7cBwGoxegPahpOPBlu3qEwBsQu9u3833BIJ4TQpT6DnfUEOmDeDvI2TGYpAxjMI+4h1oQtRkzTMUexsAdcKmmj/2lGSkk2OWp5DSvw0WPpHfoJXZLGXrMytCam6c/znDuVBUtAB1ihd2DlyZ0w1BJMduKvYjwZUA9lTblnqzabT4RzX49b6gqd5Vq862xQAmUI3o7rzA39EylarzGdPxitpBvU5rHw6aOmHRazqwynj+59f3x7G5wcr7MNM3ZNLzcXrVzw3T9yNCt11zBOS2FGzREEmzRjgslGZB5Aq0XOo1jlaC3nol12SEwqB9Z1v00ZfRJdDnxHlT3nvyXwMTGXG0xhylbbsnnvevumhBkdnt5WI6atdaPF1mftum6ViG16J4ltJ27F9SvFH1GnoQONsqLVVbybyEXNhvBOgVK8BefOmsSG9emR2UaBUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(7416014)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWhLYnlKRTJaSHVPNjVrQnI4ZGNKQjZRV2psNzFOTzFnNVBndnJWS0NmSFNG?=
 =?utf-8?B?NnB0OHppclppWllrRFc5TzkrOTdnUmt6eGJPc1NwNzRiV1dyb2NzTDEvME9Q?=
 =?utf-8?B?eDJOYm9sQXdkNmRqdS9oeURjNUFuTm4rNTJNK0dCWk16S3VBeG5OQ2UxbmFM?=
 =?utf-8?B?NW9RM243ZjgxSUJtMHY2N2hlcWZlbTBiOHFJbjBjaFBVWkZ0OU9TRXFkNUM4?=
 =?utf-8?B?UDJRdnFiS3NpU3h2ckdpMFk2QnpTQlQ3UFJNYlQ0N0VYRVJzSDhTUU9ySEVJ?=
 =?utf-8?B?S2t4TUNDZ3lMVmxZc3JwdVpGTFRXODNrZndDOWZwSzJwTm8wdEYwOXdtbE4z?=
 =?utf-8?B?eTlrY0NlbUN6WWVuR0tKTENyUVBzRFNsMmFIMmxwZ3pDRXJxbzZXajFGMDJV?=
 =?utf-8?B?eFdTUjNkeFFrbjZ0cXBMVTA4SCtEVjZmdnkyeTMwd2QwcE91MnozdCt0ekZk?=
 =?utf-8?B?VFJIbTROdlpUVVBMTEdZcmdDa2VOZy9KZkJpK056UFF3SUdvNXVBNXA1S3hZ?=
 =?utf-8?B?b1ArMXhRV3BVMWVqSUE5cVNnbGhPYTlRVGdQY1dtNnoxL2NTa0toaFkxTzdF?=
 =?utf-8?B?OWdFMGprUHFJdVhCV0ptQjY4ek5udWVDQ25zZlkxSCt2Y2NaWUJlWlIyeWs2?=
 =?utf-8?B?cjdsWjA1cEFGT2RObkZDOFNXb3lJaHpnVDhJQUdJRTVSSURRTDJaVWtaY3lB?=
 =?utf-8?B?ak9ibS8yeFFhTEhpbzJtbHRvRWlsdHFXVTd1YXJPQWd1RElRTmJPMkxLa292?=
 =?utf-8?B?NXV1UklGZWQyNjdhWW56cUpEclp0STJEdUFSV0E3aVZHdm41VGxwT0JuSnFk?=
 =?utf-8?B?cGtTMk81Yk1IbTNJdWpGMjA5Sm81OWh2b1RNNVEwc2pxYkhhZFJDRFEwN3lj?=
 =?utf-8?B?LytzVXJhZ2o0U0grUzlxNFU1aEFFNzZZS1p0bUVZVkllTkt2Z0xRS3psWlhP?=
 =?utf-8?B?dFBrZDBMdWxWb1NMdkoxSzVMMndOeE5KVDFmd3NtYVFHMEtYSGZpNm92MjNV?=
 =?utf-8?B?ajFXS0gvVmpaaEw1M2VvY2x6RW1wejhveEZSUHhSSDdzYmxCUmlHNy8wS1l6?=
 =?utf-8?B?RUFrRkdQRFZXaGd2V2JRdFVrMWgrNDBRbXNONjZEeEE0M0s3QUcxOVc5b0NG?=
 =?utf-8?B?WW5BV0QvYjJPMG9FMGZDUmZrQVJNUU16aWVwc1VNd0VUenFFWlk1SkEwdUJo?=
 =?utf-8?B?U252VXJYTzNwMmJ1VWNDcUJMTmczaTlwek55U2t3UlhBYVFHTlI3VFM2aUpX?=
 =?utf-8?B?TW1qNUhYSm5yOUpSVEd4ZEZ1NU5odVZRMkpjRkRNNE8vZlV5bXI2QTVOWVEz?=
 =?utf-8?B?Q2dyeGQvVzBYcG1ZaXdyMFplNEo2RGtBWjBTRE9JaVRRbk80c0FEd2srMy9r?=
 =?utf-8?B?QnpjOGJHLzZoV1Z2WHhJZFpFY2dFcGg1cGxPL1p6dHAzSHgyQzVZVC9CY1Zl?=
 =?utf-8?B?VmZJQ2p6eDhNUkp3Um5PL3FJWEJjWVh1Q1plMDNXYW0rWGFYSnptajFhbG1r?=
 =?utf-8?B?dngvN3RxSkQ2c1BuMndBdWlFdUExN2VQL0FjZTRWeEp6YlNLTlh0WldURC82?=
 =?utf-8?B?N3cwSFEvRWh2Q05la2xGZnZ1LzN2d2M4RUlaUGdXSTVqSHN0NXFvbnZ4bVhi?=
 =?utf-8?B?WXdqaUdITFlxK1k3UTRndkl5aEpuN3p0U1g1cUtWMVRGWkNRRGJnWnhoak5C?=
 =?utf-8?B?eWkvaTBmMU1mbm5PTG5VZngzMXdlaWpJR2hLYUVWSTNoRmM0cC9jWG5INkxi?=
 =?utf-8?B?cnRneExEcndtTmlSTjhUak9oUG53L2s3ZG94akVBL0FSSUt3VEpXTUNOWTVY?=
 =?utf-8?B?TVZBcDBCTUhFb3ZsK3NWTjZzZ0xnSVZHRTdjRW1ndGdjS2FSdzdzdUN4SjNl?=
 =?utf-8?B?UFJST09kZXFMQndqQmZsTXkzWWlGdlhBMnl3blJjR1g1c2Y0VlV5RTVsMTFl?=
 =?utf-8?B?VlBBejIzenk4Sitaa1FBY3ZzcjcrU1hpYjZOSzF5R1lDRHR3Y3E2dm56c1I5?=
 =?utf-8?B?S0RNaGE0a202QTZ1ODZVSk1CQ2ZCeHFRNEl4YUlHWXFCcTJ4NUdOZTdicFRj?=
 =?utf-8?B?K2tkL3NEZUR1bE8vci84aDVNT3NvV2NFc3I1NGhKWm44TWN6V2pIUlU5d0VO?=
 =?utf-8?B?SFlPNFF1WFZrdXJZeDJyK3ovWUVja3hvSHAvS2JBNk9sN0pOTkNDWHRwUEpY?=
 =?utf-8?B?STI4VGJId2xPYkxvajRpcDhVd1Z5cjNSemVkK3k4Z2ZuVWcyMi9Zck1McCta?=
 =?utf-8?B?T0N6eHoxcG00ODhQMUptVHphNDhJVHRJUTNBT1JPdHYxY0d4SEZTcCtWa1l5?=
 =?utf-8?B?aStmWE1oS1BxOTZuZU5OcGExWjZWb0RsUXBwcjZOYlRuYTNIeTNFa3dsanBB?=
 =?utf-8?Q?Av1vGfjHaChqpJfJJsNF597mU2SKPLt242W2C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef909610-be0b-4d07-046c-08df3b77ad98
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:02:19.8596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVNC7k3xK2gAoxLNDGJUAAAmdywgnBGj4/22tSP6WMR3hM+MeGxAUb2kRkkt54bO1KQhNjv3bI6wEhsNPI/FKTjWsqbKKQOL3MUxNZbaB+e7vKZT8n34eLXL7tqZbwaT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_120225_576845_3C2D1020 
X-CRM114-Status: UNSURE (   6.03  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Wed, 28 Oct 2026 12:35:09 +0100, Ernest Van Hoecke wrote:
> Describe the Cortex-M7 remote processor available on the Verdin iMX8M
> Plus SoM.

Applied, thanks!

[1/1] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 remoteproc
      commit: 347fa3f6d5e349a8ad399caa8ded1f0f521f4203

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

