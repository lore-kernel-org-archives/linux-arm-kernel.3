Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAC8606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DxSvxeul;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lwOfuw4m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15gpbQJaROHhKAWjdlM4SFUSfhXN2/k7Qz9trFS0NdQ=; b=DxSvxeule1Bbvl1AIddWPEUSCX
	kGL8l4o2ZQfWeom6YO+QWyRMK4QT6yEfLigXt5eTPIcfgq+yPTFY5NoopGyicOfGMkxS3R4JoWJW/
	dfvi+5iR+qbOM4wsEFglPtWh7Z7PEwTpKpnEgCIU/ewAl7R64yxm6InBAQRuLC6RXMATel3aAcdzU
	5DfnH50P4GlqO/Z2/aEXXEZp/OVn8U+cGxUylQN6Jkac6AtqN4OwrMWLpCr4eUXk+XvvRWUAiua8O
	AnUgsshyCfwJFTtPj2ziK71qgiiGkL04v2D5j6X1Gl9cqM8SePzAhLa2vLarW7Gf/lRUcgrRXV5Rd
	sIsyz2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ39a-00000008upR-3xUh;
	Tue, 20 Oct 2026 06:16:54 +0000
Received: from mail-westeuropeazon11013022.outbound.protection.outlook.com ([52.101.72.22] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ39X-00000008up2-0OG7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 06:16:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wL8G0/oYunTHc1ajzC88KK8Fvssg3ny/f2S0UTY/P/HWx+k+KqNI1JeGXhKPeDw9zLS8E9aJ9DsoM7NuGF1iti4FSavpWsJtEibrE5I9XYFeTj+UYcNaYC2mMtMclZCbKL4rFsRaCISQqiLB9HgM6GV3HFoZOxxTWzTU9mgWLZ6pshnkYnD1b+atjj+70ypX2bS/jt4IJX0wkFIsgE5yLeqgae7DJR3ZWFjoyD0IuLEtcovBlK2l0oIJD1EmxV7MsL8+IGw1OBR0qcf6EAFQRSZnwjSSPHOqX+1mGhC3HrN35E3shF6nKzPpk2ukodfc/zQrxnXYJsg0vC1qQM826Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15gpbQJaROHhKAWjdlM4SFUSfhXN2/k7Qz9trFS0NdQ=;
 b=kmkbgwwoB41aRHY4rdnho4tDrDgQOFJDuzmVRt1dXWGpD3AlPw9+0CA7fXy+Ggh2KXKjC89iRBe1a6zeTXg25SIEnaAbf9/PHppWQmMjH04VVYJziz2wPIXXs0BWTLSqoiRxuj6SFclrlbektKbBl7PlODCvN/qJAosYb9oj1hXWYeWO3FaDRKV+ODvlGaTvE+6OXCichqsyfobHNpf7nWh3kTdFha+QhXGkMHciPSmF0+vuJUjRYkMRzqCFdzcK69DgLBvkKXnOW99f599xgeicdmKvWqzqEnx7h7F65vLNIfCXQl3QAh0YS0JGlykB5ZWxkdejG2X2cBKTPzEilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15gpbQJaROHhKAWjdlM4SFUSfhXN2/k7Qz9trFS0NdQ=;
 b=lwOfuw4mIViH62NBJ+9zFlkvECiH+FuGGPUJy+yKWyFsmzmVu9hj3N29MhlclNgR8cS8Xfdrd/Zp8rDamPfgwnGgjBDGg5b1LrBMbNveoJ/MazATn629oQ/NBlAdqkKGAnXn0LOXr6i26lHDGgp5B4z+0vGdhqcYQV8EjO//NMFvCIwV5NXId3TFKe4oUreBq+gG/6coH968QpEzz+J2rWkHVE1i7qKcVZP8xo/vxxk5FKpQ0iHU2vVP2Pkqy02z0HAW39x3l6oejYlivCOwFz0vBQ0bufDpoX1b8jXIQP0GNjv3WNkONXytEnEcvug+piKcR+snIC3abuG/7rn3QQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM0PR04MB917899.eurprd04.prod.outlook.com (2603:10a6:20b:7fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 06:16:44 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 06:16:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Frank.Li@oss.nxp.com
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
Date: Tue, 20 Oct 2026 14:13:55 +0800
Message-ID: <20261020061358.188550-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261019-memory-region-name-v6-1-2e46b2e7d667@nxp.com>
References: 
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM0PR04MB917899:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e432011-7f1a-49e3-a637-08df2e71b6c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|23010399003|56012099006|11063799006|5023799004|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RFDvcTEiAh6R1DdFw5MUUEvkiKrTV+ixR6SxKJ7AQBBr9snq7fGRwE5N8xWa0+0KJAifHkMhKfIOH8b6nIozvSvQ0D9/uKqPu/xmLMMzKpJUcAvqf1mcozLFSFRNcgL3+nrLOtTHRf797UDO73GLjqg57YabnzHLgkr01Xd/SI4wKIScHYB90BmPLwDFPhVTEBNax4QToEbESTjJd8akvLjcDbhf0oqjKh8klrWB42exIBjySmwgRztWc0GhPcOJE+MkyBouKwJzm0dUdfdCXkqJHqPGF/RO4tmUvjUOKU4+3u5NzoWJzmm3/Xgo3YMFM+GCc3gDeEubRz4OqILC14mo0mIqEOa7JS8Zswiyg0opBRAPFu6gOG9cv6VGeTPMftkqh6OlIARAfn8F8DfOqvvcbfpkazcgLSnqqxwyMr8rK8YfXGDkONQh40s/PbBVOm88z8Gabv41HjrtN+erzdXiIPbKuJDSbaTMoRGLqFk2QwTcYXYCnQlOn7LbEOFXhTtUVV/ABeHBXxOSyvEgR+kHd11aOwnvn3rqJNopLzDipiX3KEp0ZKnoHq0RZT6YfaugcslYunK6YVf4KlJ/hD2ZXoqQbsh6+G2R3hgvRyh1Dbx8S343C8qxFqsT4Xaa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmNYLzhRSzlnVWM4eXhuRDBXdmVGdUIzZ3VQSGhvU29JWElTMTVVTnpEK1BY?=
 =?utf-8?B?UXovVVRmaGx5R2dOd1pYUFJVMWF6TVovbUdNbFIxd0dwM3FoL09VbWNNUHFJ?=
 =?utf-8?B?Q3JiVXhnZjg2Q0tpeHJ6Sk5teGNWYzRuc1VoaU9MMU4rcDh2TUF2Rmt2MC9O?=
 =?utf-8?B?VHVlZjl4dlY4TTgxY3FaV0tGWGJic0kxbmF2dzd1dnV1UzkyV1MwOU12RmNF?=
 =?utf-8?B?b0R5S1I2a25uSTFLcm1pdkRsS0d0azczdnN1WlYxZ0xZZHhFd2NjL25OQ0xN?=
 =?utf-8?B?MFozY1BRbjJpZTg2ZUoxQmIwQXRQeUd4UmZEMndmM0haSVYyb0FJVDRYQjI1?=
 =?utf-8?B?R1FtRmkxV1lPQnIzdjV3bmVCNkRHT2dZd1J0QW84NHFySm1oN0pyYjRkNmY4?=
 =?utf-8?B?b3pDaFNUc2RKQU1JMGpMUzdKOTcwRnVCaU1kWHRYTzhnd05hRkNzcVJ2WUM0?=
 =?utf-8?B?a3dZUTZRcFVUeEI0NXMwVVdURzFiN1FxWFBpNGIxdWxFUzZlWkdpWEduSmIv?=
 =?utf-8?B?VXFIWE53YlcrRVhyZzNDK2lRdDh6ZjAvQUlLZ28rY3dSNFBmNDNNUUtGN3dN?=
 =?utf-8?B?dW01c3MzbUZWd0RsUEdiYmk3b3VPVFNaY2VzS2tzRG5lTy9uRUhQQTAwUWxS?=
 =?utf-8?B?R0xPRzVsMFJIVDkybkZpL2tYNEFUVUtrc1FJSnNLQjIybjhkaDMybzF2YnNr?=
 =?utf-8?B?RzFkV3ZTRnJUMXhFcDVKbW9NT21CSkpWQ0huSVNuSWxwRWpXVm1paGJMSWQr?=
 =?utf-8?B?QTgvZ1lBVmdrNmF3YzMzd2dJdXQ0UFZTUTlFeUhqL00veGI2SFBaL0lOZjR1?=
 =?utf-8?B?RDRTK3lFdVZ0b2JFWjF6d25WZkxGVTVCMFF5OVlMbHU1aWl0QnUxamUvOXBZ?=
 =?utf-8?B?SCt2bDZuZzhoSHUwNnZaZ1VFZUgxbUhsVnlLaGh2dE01aDd2UGRON28vQVZE?=
 =?utf-8?B?eUhTejhZWWF6OFN1QmRicGtscHVxZEpXZ25jQkl2andnMmcvaDBONTAzbHBr?=
 =?utf-8?B?SmtlZnlLdkJ3N0VGVDQyMXUwaEdXTEhEWWkzMkVWazU0MGx1L1RLTWJmL1Fz?=
 =?utf-8?B?ZmtMcHlldUUzUW80NDcrQU1PRVhYM2ZzaWtSbHp2VE9PN0lsRGF6akt5d2x4?=
 =?utf-8?B?TGMwVnl6Wk5iODMxSjB4cnF0QTh0ZlZEWERBV0l1T2VlOFVpMnIyeDl2dzB1?=
 =?utf-8?B?a3BaTEZpUjlrckdsQWZ0MkREOE5CbHB1dVRoN0d6TTd1VXpGd2pZSjhiUGxv?=
 =?utf-8?B?c3FaTFlyVEdqNExXZHVyQzJ2R1c2MXltL0hBVnEvTGJjQ3JDNVBqQmZGOEhX?=
 =?utf-8?B?SzFMMmhGMEJxYnhBaHJyS29UWEc5MndnR01iODZJUm0zLzJKVUgvQWtvLzh3?=
 =?utf-8?B?NTZza2ozSEdsSkxwd3FFTXRMRklnV1NoMEwyVlBLM0R2K2dhYmRxaGdmSllv?=
 =?utf-8?B?bkJzUXBuOC9TRzNUNUloUlk0bWd0MHY5UFJrdHljOUozaXlUNEVTUGpUaWc3?=
 =?utf-8?B?SVNDSk44bmdBRm5FbUY3UGlVZWoxVE93SlA1RWJ2ZmxZdTg0eU5MZ01aYVJ1?=
 =?utf-8?B?Q1FReVJtNzBqVW1GVTdFaGVzcUZaWWV1SXQ3eWo3ZVlkVFpObVl4QUJSOU1x?=
 =?utf-8?B?WnMvbzN2TXRVYi9ROCsvcjBzc0pHQlU2bTdLTEJUMGhGSXlMMEJiOXVJUW5l?=
 =?utf-8?B?SmhqcnRncGZPUFBTSEpuZk5RYnJtVkNwMmEwQ2tsOGljYkFtOWVSY3JDaTd6?=
 =?utf-8?B?aHd6SkFlVFJFWEd2M1VqMjZCMzFadk9TRGNJMzBoaGtuSFY4ZGU0MkhybkZY?=
 =?utf-8?B?dTBJbUNvL3U4NUVLdnhvb2p4OHRadk5XYi95WGUzRDF6Q0ZuaFcrWmZoRUZB?=
 =?utf-8?B?MnNxaGNCYUI1NnNocjJZcklxZ1lhMVI1TGN5NmVpUVFNZ212RzQ5RnpYaHlY?=
 =?utf-8?B?Uk5lL3RFWXBSUVhNM1NEUis5amVabk40NHF4NWs0OW01SldmelRLemtmRVhk?=
 =?utf-8?B?L2ppdlV3T20vK3R6aGRBZmMwOW1GNWZwbXVlNTJTSTlveUE5MVJBeWdoWEcy?=
 =?utf-8?B?cWFtUkt6bDlwT2doSnROSXlGWjhFQm8rZjh1cWJnczhvaktOQUVBUi9NVlBu?=
 =?utf-8?B?NHp0b3lsemlFUEo2OWJhRldQV2R3MytHWlc1UXZlbEFXTEVoaDAwUUp6Z2pt?=
 =?utf-8?B?OGtFam9Eczdhb0lSdzN0L3lGck5BQUtKMnk5eWNSZ2Z1MklCZ3pHdkVUbmNK?=
 =?utf-8?B?aWpzZCtoOFJFdVJTdE1lbTI0Tmk4ZXlKWlR1N2ZUZWU5WXh3bjdob2dPTDlH?=
 =?utf-8?B?SUhSSTNtdDJCZGl3MFRleWl6UHpHR1FKdFBZK3dOMC9zMDh0NzVvaWZuR2o3?=
 =?utf-8?Q?4Cb9P+lLLLvk7m3ZcndZiNtllSy9bQJaNuZ/4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e432011-7f1a-49e3-a637-08df2e71b6c5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 06:16:44.5055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmfQY/yP3E5FkzW0+bL5c0IFmWEaih/je5cdGR83nNNeFWUNeSxFDrGlIc72mS6nfZTraEk7JHPXtvgM0cxgRDQjT6ahuLd3z+EVRkw+344ygF5LQagq7Jm3FrJHB5lT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB917899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_231651_778932_BA7534A4 
X-CRM114-Status: UNSURE (   9.80  )
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 14:55:48 -0400 Frank.Li@oss.nxp.com wrote:

> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Document the optional memory-region-names property.
>  
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Add memory-region-names to explicitly identify the expected memory regions
> and avoid relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

