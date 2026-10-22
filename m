Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D70606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 21:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0lnGaOnl;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=v1Zsmryu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2OjDSp0+jFFFhlvnLvNIBbFm+t0Q+yFcC11j7CCf+0c=; b=0lnGaOnlz0Cc6JqgV1wRC06LFx
	R4GxgCJIW+QQSvtszOrcsWjqC9DfaaGUdrYcRwwRhJogNbxH4sMZ9KCQHAbf0stQn90+GNv2rvzzu
	hgJlCu7NkE7sP2LRmtj8ZBODzmTNW7IKPMyNIuT1nUOlinryWx6eH0hlD/fxxRvWEnKpxzSnlJzCB
	M0+1fvy2+bUlbJcwCAqzH4svGAuRALcbgpBIc2mOrXHjtsnBA/FrRTUqg5T6r6LsWHfpZau5IEBmR
	FYBtIWhfQlzQQpKfXibDmaa1RqRhBXi4f4TMC355SH197XQJ0XRkI5/TznhjaaQ4jLM1s3AWajqJp
	/Rv0Z8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0Om-0000000F0Yx-1HQz;
	Thu, 22 Oct 2026 21:32:32 +0000
Received: from mail-westeuropeazon11013028.outbound.protection.outlook.com ([52.101.72.28] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0Oj-0000000F0Yd-3RQA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 21:32:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phFsGIORmmtAQ+mxSI4rwkGR9N6xgU8+Y6SGBLG05tRHQYhFqQ5C9QkR4z0zm1VELoQowJ76zc9zvhfa4cEtx1RJ6dsCNf/iVEYViYq8EZZMPzwlWayEsQlmGxkoxrtZD1FYkE9oSHvY6FpAbRvJK6UwINUQoH6wozNsU/Dy16qT54Jum80vnZwRZWdWfbpkgGSHL8LuYrw7CMKdUZ3JC8LU0z6BJyJnBOL4sYn8GHXUct0dyal3v9JBRDYA4FRo9G7O3cH4s3BBe8yfKEbGXbQvnGYGGA8AYbuKfcK7mtGeb/wdy2W1WDJyUcqcgqlS/jG54Y4TJYgyUZRgclHuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OjDSp0+jFFFhlvnLvNIBbFm+t0Q+yFcC11j7CCf+0c=;
 b=vCDPmKab2KII6pfRKtD/YMr8QiUJRQATseYJZzcUrsJ3IpGp1ycGdgRWgqnUWi9DPCiPmzAa0BwtSi5Pp0N7VeJZECBucrP6HMeaxDE2LrVP8q4I2JHFdIaH0JKPK4QtT/RIn560tidVA78NP4N0AR0y+jn6Z2xT66RxrrNOsGz2oj7slB7PkFKnnrg20UcugJCbruXgHUaDxPd7evZmAwhN47mapRj0q7oU4o0TyecopwoZG7bwEEtAyASSQFl+TTXj2YMZVWMDQyuucYCqhf/j9XIr5Ds/o5Ugu44KvLXn6rF5Fo/i7LCBzscO5bv8W9Wpki8VliL3u9uOeA//og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OjDSp0+jFFFhlvnLvNIBbFm+t0Q+yFcC11j7CCf+0c=;
 b=v1ZsmryujWLSNSq+MUFjPsZDaJM3l1s7VkcTcnKEEWaluI27xHvB+DzVyUkpwugjNyUPkinJxl0di4695c5Uy8AqW6okJSyNJ6/54hXQqM2h/QStfeatwW9IBPib2TCF37LXBu0KTsGnzOb6As08BPj4oyk2svmYI+bYDBA/mLYz3xHYdnM7YcylYN6Tu/7BzPwEWPsgY3Z4MpO5YQuOLQauY9kqXB7sRXkp1egp+PEn93xSfB3MBRtLg3Ku2tkpHmncXWNZ0YdNQusJMsW3t+SySZHsm65EUY7Z4KmcPISD59WwQ/BZpmhyaANZ8ao3sGRpp7BCbvH3mV88EAx5tA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7329.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Thu, 22 Oct
 2026 21:32:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 21:32:24 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: colibri-imx8x-aster: Enable I2C bus
Date: Thu, 22 Oct 2026 17:32:17 -0400
Message-ID: <179270471307.1376912.8643007825204379432.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022161708.690702-1-francesco@dolcini.it>
References: <20261022161708.690702-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS0PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:8:191::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 94af48bf-da70-4884-b6fb-08df3083f697
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|23010399003|366016|22082099003|10067099003|18002099003|11063799006|261009223027099003|261022105027099003|261022075727099003|56012099006;
X-Microsoft-Antispam-Message-Info: FHU2qNaPFVlXjaRq23Igm73v8j6nCUi4CI5dlXx2AYrxvuMcRtako6DTc4+qA8K+CbbJNgjG2mMEzANE9724F74jZXOdMKMvtTauEYyUfKo6lYHAoqn+ooXBNBrMQ6fWxs0MUDxbxOfXyKbTE4SisVXHM8IiPIE5/4t36lkesFWiusYJF+xGeeAnh3ythPFWrPMhnhChY8Uxil1RzOIClruCrt4fjpDrPyNEuhmG+qK9b/pOTLEPloBTSJQCjrCMSvHYiDwtvSBMSJ6ZYPlv6sSITb4OVt+3I1lGojsJU50LbuGrI0C20MhIC1Ug/aQLj8VDm4waPxo2E8h87OAhiYgll3CSRjbNuuXBCrIgI33hEthhT6OoiRp/MhQ1XDWcnAmgP3XMJn2VLOM5xr+LfGXzo+e3kgKI8F9RXpnyWgOi0dxai0jjDybAIFwwiMeb3XPYEYaWUrJV9osNfBqkOv0o+27UFbDbJTp5pw6N9phoup38uywjYQafyUvsKrhHVqBtxFjvqnywNabkR57qcw+iJkvFMmMKOAG6CjzuG3yAzKjZZuTUoaCrQXuGQvyY81228SDmiUwdBMds9q8NARkUmRv7zNF8mWgpYCSnrgfy261wyq+xta33iek9smxZjNvJqo5n4DuoMFs8Q5ppOoc9q5/WV4/bzN57xcRr1Jk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(23010399003)(366016)(22082099003)(10067099003)(18002099003)(11063799006)(261009223027099003)(261022105027099003)(261022075727099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWMwcDhndmd0c0NSWENQb3FoVG9IU3R5OTlnTzQwWjdnQmZyOC8rZ0c1MFVH?=
 =?utf-8?B?bjVEWnR4NnVnSStDV2VBWHpMZGVaaCtjeXQ2dGVEWEJURW5PS2hrbXhIemI3?=
 =?utf-8?B?Q25COFQrVEN6NG5zRG1DbDR3NDVMQzM2T1hOV2JmMUJJN3VYSUJVeC9RdVRN?=
 =?utf-8?B?QW92OUJIdGsxS3dlWEpuU3dDZ290UzhDWm1tUzdzbzRVaDcvcHZFTnJWdWVj?=
 =?utf-8?B?aXl0ZzBVbXdVc3h3SUJGaXVwUzdJVXZVdjdrVm53K0J5YVpWcUZySXF4M2kv?=
 =?utf-8?B?bzJ5RDlKTEYvTEZyeStNS2dmWFpjZWZSTVBvdVFHQmtJbEwxTVF2TlFNSjgx?=
 =?utf-8?B?SFRObXpsQ2xWZGtPTmFyY1pnUWJIWWhKbllNc1JDZGVucTE5dGhQZU83MHMz?=
 =?utf-8?B?SHlnSXdNcVpjUlA4aHZ5blRsSE85azdpWlRFNDgzYW1HZHY3VTgxcDhybmJj?=
 =?utf-8?B?d0hzdS81Qk1OQ0daTE9QL3JYTGp4YUdwa0ZSRmRWWnpuM0NOWTNqQ3ZCRUx6?=
 =?utf-8?B?dThhZklDbHdYS3BVU2l0RWg1RCs1cXl1a1kwOEwzTUdXMEN0TTRGRVE2NzhP?=
 =?utf-8?B?aU5naVpBaGtMbUZNdVg5N0x6MDJ0VVhSNXh0cEd3enRsSVdhOCsrZlgzcDZB?=
 =?utf-8?B?L3h0bHdjbSt5RldCUVdIRGxjeXR0SDF4RmxVakJudkFCZU1HM3ZGZHBoUW9a?=
 =?utf-8?B?V0dzdklrUnNGeHdaaFhweFZMYmFOK3NTajFZQTdrK1pUMlhLZTk3UlBLbmZn?=
 =?utf-8?B?eXFBV0FIb0VibW9wVkFKOTROT0EyWEFRdWVuamd6TDVkUVd0MXZRc2xHWUlk?=
 =?utf-8?B?Um5OaVg2MC9MV0phYytVYlhEYkRQR09pck00cUg0TlhScDRBbUpqdVcrNVFX?=
 =?utf-8?B?VmZFeWRRbUg1WThpRFA1Tm5qd2pKVmtzVko3WDhTVXRGVjJsMGZrMHFqbll2?=
 =?utf-8?B?V3RNQjFQQWg4VEc4TWJlQmNCVWhWSFJ3WXljVlhZVWNHbGtCajhXWS9VYUow?=
 =?utf-8?B?N3lpeFVLL2FUL3FZb2prTzJqb2diaTVLV3Fqci9aemJnRHZDYjVuMHBZOTNV?=
 =?utf-8?B?cVIyTElxNEhXeWp0cnYzNmRucHBtT28yL0t2MGJGMUE0eHM2Rk1keGgrcWpt?=
 =?utf-8?B?bUJNb0I5ZUVValRMOFFEUmVxWFFMTTVpb24vWVdsM0NUdWg5bjNISzlNU2dG?=
 =?utf-8?B?YUlGb1VtdGY2WHhaUWdkSWtYSVFkVjdGbFp2cmVqTnROTFF1UlNUWEprWW5i?=
 =?utf-8?B?TnhWQStZME5xTmVybmdpOGtGNkdkWEF5WGNSWlNtNVB1WUd0YTFpRGV1ZUJZ?=
 =?utf-8?B?cnM3MXdhU0JmaXBON3hGMmt2RW9XeFcrNDQreE5kNStweCtqbUVpamNNRmw4?=
 =?utf-8?B?SlRmNTA4RjJkQnZlSTV2QVZTM25BOVgzMURmRWM4bWJNY2ZXVDRGUFZ4L0Rv?=
 =?utf-8?B?WS9HM2NaM0E2QW9rck5WQmJrazBML2dkbTFpUDJCWGY3b21Ga3BsZWlJUUhx?=
 =?utf-8?B?RUZ2THhZTGw2MmhsVTk5NDRhd2sxT1VJYmUrdUNkVnpPZTZSdnBWMTNUd1lY?=
 =?utf-8?B?WXN0UzNhN2FUQ2RkTnhTMGlNOXFXaVU5d0hwd0JVOW9qQmRmZEVBbExrODNF?=
 =?utf-8?B?Y3puUS9uM3JHSzhNb3kxUld1ZEhNMjNnaVhKVzRpak83MEVQMlNvRmxqeG5n?=
 =?utf-8?B?UVBWMklCUXljbU5QS1FJcDFKM2x3dlpwUlU1bmRaOHNxRThrZEgzaGFEbnhO?=
 =?utf-8?B?ZUx0aUlsbVQwbHd3VFAwdlJiQnBOb0V6S3pXM1c5dkZxRXBwWFBoTUxvNklI?=
 =?utf-8?B?RjczQWd4UjRUd3hzemRocU1uMExGMWt4a0psU0RGdjIzazVsNTBiYUdxb0JV?=
 =?utf-8?B?anlKL3ZSUkZSL0ltV29RaTU1NU03NGhjbW1QaEk0QUorNXFhZnVReUxkdnFy?=
 =?utf-8?B?T0ZGZFlsOXRvelhjOGNuSFhocVlyTkY1UG53bGtZOFVrRndzT3lnSlc3Q0ln?=
 =?utf-8?B?SVdWRk1JaFlSak13UHNxY2Rhd0J3cUt1WnMvYmJVNUdtTGNSVlJpZUQwck9l?=
 =?utf-8?B?S2k3bzFFclRrN3RxTTNValZpSG1GSmtTK2w1Qlk2bzZCWkY5WTJhMHQ0Lzc4?=
 =?utf-8?B?YW05WnVaUHVvVUE4Q2d5UHAwSFZDMHFpeWVrZTRFVzZqTDlvZXR4ZXpydndr?=
 =?utf-8?B?VldnYWdHTEI4N3JMcU11cklyZDhYbnd6cHRYem5GS08xeUVtVHYwd25HcHBp?=
 =?utf-8?B?NTJHNmdhUE85d1h1RmNYbXpRSUxBTkpaeEZYQU1jRXpES2FzTGgxU2VLQjZC?=
 =?utf-8?B?YlhxN0FteFVHbUtEZzRKdlBaZnhUK3pONDhiT3ZvMkxVRnRmZ1Y4ZGR6Wm9H?=
 =?utf-8?Q?QrImdC4U/TecPNPrMCW2cGe/J/vuZNSbMh2FL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94af48bf-da70-4884-b6fb-08df3083f697
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 21:32:24.6704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmZsvxR30X2PE+qEj7i4uvbgH/gUJMf/U7+3QTKrAdU8b/n9iSjpqsp8ZPbyJkWbPwq2Uz1FFQValrb9oYO1g0GiaHyKnSpY3r88RRq8FDWFPK4eLDrj1FarKp3rLVoa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7329
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_143229_862483_A3263381 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Thu, 22 Oct 2026 18:17:06 +0200, Francesco Dolcini wrote:
> The Colibri standard I2C bus (SODIMM 194/196) is available on the Aster
> carrier board on the 40-pin extension header X20, the Arduino UNO header
> X18 and the capacitive touch connector X3, with pull-ups on the carrier.
>
> Enable the bus to allow userspace access to I2C devices connected
> through this interface.
>
> [...]

Applied to imx/dt64-intend, will see in linux-next after v7.4-rc1,
thanks!

[1/1] arm64: dts: colibri-imx8x-aster: Enable I2C bus
      commit: ae05b3817c0c5216b829ee4a096adc3833bc33b1

Best regards,
--
Frank Li <Frank.Li@nxp.com>

