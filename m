Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F05460A380C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=biXAwa88;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aQlWIP4g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzxufTVBAk5L/1Zq+D34EozmoJou7+kTgMnz7t4vB6g=; b=biXAwa88Qy4HJgwY5vIazTbXHd
	ipYw7G6HBmuwLxqOlILY26f8kg53QERA2nh6lyMIs8JJNZeECOaosqz1ThNJrZjngjFmlpesI59hd
	VMD2Jk//PKFp0XLVUO4+NsJ1jaWZ2g22ztsKB5p3zmHFPBLuvPUNiTE22MONVTHk2GBgYm3ivDYqi
	5r6hLzp1TPfjF3//do7E8jjTz+4+Ht/4aFXgfy+LAY5enPvjbyUcvrJi5TJoNd1pl3XWFgZpcQ3lR
	mGlubgQawQmTfvxtFuVtQHF3FBh6zAh+mOV2yxnLR5oP9dscxTaWa0cYhe1RvDzbEa0oMEBQK7pUs
	oAOIsyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIs4g-000000089RO-2RVZ;
	Mon, 19 Oct 2026 18:27:07 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIs4d-000000089Nz-3451
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 18:27:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZq4J7C3iPkJTL69M/zDq7ihTYKoRmr81NUX+yIXqd5fmAra7T1lP8IrFVx4f3QVD1Fw9juw+RsIsxLbTM6Qp6B7j2kT20NzsbyNwmHq6VJFNQpcnBkJjxIo0ylvlDuiJ1DrShjUkxaPA+3WU8aadINAhQUYzzwdqJcLdblOQisJA7YtykMeGgpyly/XfnbrSP8oC921uCQqBJ0eyVRAU4eOPQFfhdjOvytrY/Z6w0+9SwmlHt8WibekHX5UmNNrp9Xjh13YcePw8FJMhPP8pYXZcVBoWr8qijTGYP0+1dlCK/+m6N4vVzZaExXQjqM29EokBJ26/wQ8wJz9VpkVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzxufTVBAk5L/1Zq+D34EozmoJou7+kTgMnz7t4vB6g=;
 b=CyfOLNPmuiZa1mFR+FuU2xEhBrJdZsY1rSmctamwcokEBffXFgjkPgCkHqRqLdYVZJqNpVwxSGhh0+uuwg3H9tmUmtjOWk68nlp7GiXeQzGdcoPOFDe/BMHNtZ1a9QTBlsVrf+fC0F7NOpCVU3VvOYyi65bdEPEnNOTV/npiFVxFIT7OYPFwp9LTlLPa027zzKUMZuJT4b9uN4peeq0g8rcRiQjj0Qvt9a8+Rw50kLpXNQSrvm4ThXr073Lnc+wTRGVnOx8hvCuC6k/HGdZCyZUct146HMuYhtEuqa4WsaiXZq/3INKRR4B3KWRr8mBaACobfVReOQgQwRJKsNezdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzxufTVBAk5L/1Zq+D34EozmoJou7+kTgMnz7t4vB6g=;
 b=aQlWIP4g8sbw9K6Arlnjw6bSM2O1NrPIaKQLfnAap5biWOes1jf79aj0EhCK3yN6hAD6irbmPcNB+UxL9cWlV3IOSS2pgRiW+4or2pr4ssvBH4jzSZgYnpvwZ+kKxzHWb862L4wLwAZKJqRA9YDfVtqvFXY6DYFkdAEtMS17L6PEXG3BKhwk+q7nJvJU4vtcOYuY2u4dqN7BmOt3f3K9c4Pf9RrMZk9hewhU9uWTo9U2w84kjSY7NbAB/o41mpDucUArDgBjd29OD0NcQ5lnHnedJX7j51rCza3scmlNPXxgXwwJFLqjxTVcYTBIzMDBiL25qGc+AnWPRT8kpw0/sA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:26:59 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:26:59 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:23 -0400
Subject: [PATCH v2 08/13] ARM: dts: imx6ul-tx6ul: remove front compatible
 string karo,imx6ul-tx6ul-sgtl5000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-8-dcdcbe6389c1@nxp.com>
References: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
In-Reply-To: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=1036;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Yem2vptnsHA9x22kZvdY8LFX08zxctB09/1Vq20dEII=;
 b=ygRS9F0WDilILXvuewjKOaUw1RfDu4UDHxzlTU+eHzJFTVsPkN1KitYrEvsE4kVVtM/2wLYp7
 ohl+rdSHtu6DLH7CZEXffHvXoCyUPLXPeaKH2rK9FHJ/WM/oVddj/bQ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:1ca::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 21984cac-4471-4345-062e-08df2e0e904f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: q3Y54VCbwjtcNsEXLmpQG0PAtvVLVtUHdJobbpBgCfgCD7SOGOxIIlczLwe2nM+IZLsfaOqFan5aK3YX2WuQqinNgADLGM7L6Ww2tgnqRtY7lyY4GCXh5pZPNtazPNSKTxuS2jdYIv9qbIcw6nQ+oabawpmntIuVQYXVBebDwTv0oNQMBkCZLNKNC+enactxuYl/OAXRrcdrg47AM7wzgndy+/ayBoAn7qUMOaaLK4S+6s6H1CM8ZxQmmvlg/R07b4YntCigij33E3+fOTkHK1Kqgo8aoWtNS7rSB8npJuWIWhXR+3IbgcYSo4uPT5voH6aJ63NJhkD2Z3NGnonCGbMApVhQDlbQodbUnV62Mdo7RWALmLhycZzuE6D1SpaB/ljuK5a6d7Avd2g+eN2kE0HhNPPi5eH4JXUZvbVw6mWNabJt4SmDQyKXruGpaoU9ROo5LOx1CETxmSCwbuJ8MkBnh5aNB0iUC1uPpxjJM4Q9jUAHbTgFnBqmWTqDPp02Yej+n1B78PDmqGKsglSdBYLjiAPDNdWEDjk7uzvP06aEU98/5WTDdRJ/9BrNl9PgAw/rvI6k3rVFSM3Dpt9RemFcTuL26eYoK3VZfyucvowLqVz3ctQFhKjNU5CUiqXZfBL6m6IMdqI4XHwtXoDsVknhfJ63d/ULWC780LxehfY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amo1VFQvVTVnaVNhbkc1SVZWTWhOeTFrTWF3RWdwMXF3Tkx1bDNleWIwdStk?=
 =?utf-8?B?STViYjNCVnZhR2JYc1JNc3JFNXJ0WlRjYUZtSnp5cUVEZ0h6TkNad3R2QjdO?=
 =?utf-8?B?d2FBZ2NrZEF3ZHBGdjNiMG15MHBmNnU2U2tSYnQxTUw0Qitnb1h0dEdmd2R4?=
 =?utf-8?B?azV3M3pYeTdSTDJxVWQzZTFzbHBFOXNBeE1meGZCbVpHajBGN2oraHZyeDBl?=
 =?utf-8?B?UWIrRk1rWGlqcmJ3R1ZLWWpTWUgxZExNMUtodnp2T1pZY3E5eENXQmpUa1Zq?=
 =?utf-8?B?aE1hZTFkMTZmaXdyVjJwSFdqWTA4T3l4N1JWelV0bXpKVkRxL3VZUUhnVFB0?=
 =?utf-8?B?anVMRmltaU1vVVFKRHVkdlNTelZqUXBTWDR5ckZuWFBPRklrYndGblExNVkz?=
 =?utf-8?B?TzI5aEFwb2dVQ3lBaE94SGozaDBFY2lINm1jMFN2VWljZFVZTzZmTndHYmNU?=
 =?utf-8?B?Tmo5QmZWWXRjT1haSUMwaHlLaTNtK2pRV1RkZmxzNVZvMXhpVlhtd1YyZXk0?=
 =?utf-8?B?OXRaenRham9jODFTM1BlUURqNmNDWC9TcEV1ZFdjcW41L3RmSVFNc3cwYkds?=
 =?utf-8?B?YUFST3JyWDdzTVJWeUJjWld2SFQrc1YrNlhwRzlycXZPSjVkK2daUHA3enQz?=
 =?utf-8?B?V24wM0pTbnNTWGZlSjRmRHpHWjMzUHRLczBEZmo2RERKRWlqL0hzbzB6SHNW?=
 =?utf-8?B?dEpIc1ZqSFZmZzZNWkdqVFJoYkFTaERLODhuTGlQQnkwY2NkY1ZQb1M3eHUy?=
 =?utf-8?B?aU02bHJiaGFQZG5BNE9UckNseDVpdERKSFFUV2dXakh3TU9UaVdnaGJpaVVj?=
 =?utf-8?B?ZFV1akFGK2lZYXcyN1ZLNENpcTl4SGRsVlZtdkZ6R09PTEUvWUNqV3RWaGFQ?=
 =?utf-8?B?RG9CRjJjZG1MamxqazBZWEdXcGFub2M5c3E0RzBRL2RIbmlXR1M4OFp5TUtQ?=
 =?utf-8?B?MklZSmRDdlBvWFlWM2JnekN6ZzNGcDdXVWtyNmpYdGZtYTNLT202WU52SS83?=
 =?utf-8?B?dUlkV2FiaGpxMjZpNzBGakJBTFlCK0RDWjFOMGd2aCtHSzRFNHNidGoyalBN?=
 =?utf-8?B?WFM5bVIrcC9ud3VBV2h1T3V0WXVnTnVQR3lrR2lKSmQ5OEV1RjFkTk9XNG5C?=
 =?utf-8?B?S2VtUW9NeENpQ0x3eHczZVo3QjAzV3RpZGQ1U0QyYWZ5eXNzdUEzWUloeldN?=
 =?utf-8?B?ZVJiOGwxQXY3dWdrWjRycVpNSDFOVm9RcTFNNFo2TlJ2UkRYMzBtWFViZEFz?=
 =?utf-8?B?b3daTzBDbzlPdzFCWE9PVVJwdnIxTG00b1VtTUZ3cU9GbmdDRVZRY1puUmFz?=
 =?utf-8?B?Tkt4VzdqM0s5RVFJV3dMd2ZYMlJtLzRhVkZKQll3N2JlVGI3dnR5UUhBV2RN?=
 =?utf-8?B?R2s5Z09QcmhxS3VhU1NEUXBQWkJOV09hTk16NGxyYjhYV2EzKzVPOEdONmxj?=
 =?utf-8?B?eXFsT0g4c0dUeVZoUDZyYjBId2pwdlp6WDJNbmJNeDZHSkF6dmpISDZBSzRN?=
 =?utf-8?B?Mzdra01USjBDcFlRWU9EWXRNZWdiRkpSNnBiSldUMUQ2TXdrdjN3bkxoK0ZS?=
 =?utf-8?B?N3NLQjJTbllsb3ArQjNneUpIcDZ1RGU5aHE1T29Xb25EaFk4ZVFodDhNMFJX?=
 =?utf-8?B?Z1Z0TWRYMlRsSVpSUEp2akNzV0lRNUVrUlZNdnF4MFg5YWs0cmxvWncveU5T?=
 =?utf-8?B?a05jai81T1dkRHFGM2cweExtMWNBeTF1bkZFa2NRZlBrSm5YWm9sUVMzd0hL?=
 =?utf-8?B?TWpWU1B5NktvRi9YUzhrenhLTzVRemxnZ2JjdW1CZTBab1lBaTlsdXlnQ1lj?=
 =?utf-8?B?M2dtcytmVDIvYWszWlc5bllFc0JYdWV6S0hmbTNlRGtJa3pOUkJrTE56NjUr?=
 =?utf-8?B?V1d6c2tJSVZIVlVTU2FqZUtJUVhOazBOTmU4VzdyVi83cXpacDgxVndCamlq?=
 =?utf-8?B?cDdvbWgwL205c0dITVVOc1ZxMGhXZElhZk01VFFEb3gybWt2d3prbjJ3Z25m?=
 =?utf-8?B?emx0WWI5VTY0Um5TV013NWZSN1dFNEdHaXdFb1R3QUJxUXhZS0p3WVFIMXc2?=
 =?utf-8?B?MGhxcWdQWGpVNDRDVEh4T0pBK0RiVGUra0h5b253OFJpdGxtY0xWNlVTTFhF?=
 =?utf-8?B?a09TK24zSng1b0VkN2VWMkRRUXlYOGw3aXl2L1d5S2Q5a0JyRnh1dmNYemxY?=
 =?utf-8?B?SHArTm9Wc29iUUFHNjJpdy9tNnVDTFRpdEhCaWpsdklSK0h2N05Eay9tdXg2?=
 =?utf-8?B?dUFPZmRkbmxhdlhVbmdwUWxqKzBOOTYvaVJ5NCtmbmg4RWFmKzZjU1I1bzlT?=
 =?utf-8?B?Z2V2RXFOdTNxakJtNGVkVmlyd0hra2hOT2NRTXk1bTZTMlBFZ25zSStEYVRL?=
 =?utf-8?Q?eNQ/2PUHjRATl4Fk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21984cac-4471-4345-062e-08df2e0e904f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:26:59.6227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkDRqYLVBF8yV/ZEUqwiU1UES/JpNFJ+506xEwSr93uk8I+vfu3hQpT/ZoXBD7Mn4INMNqNYL8iVcAG3nheNFt6TvzUaZZebsMPiv4K9i6Fr06LnxO/+S+jFlBgdf973
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_112703_817151_CC6FDD3B 
X-CRM114-Status: UNSURE (   9.95  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>

simple-audio-card needn't front compatible string
karo,imx6ul-tx6ul-sgtl5000. Remove it to fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /sound: failed to match any schema with compatible: ['karo,imx6ul-tx6ul-sgtl5000', 'simple-audio-card']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
index 2f6916c0359c5..c678f8fc06c28 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
@@ -192,8 +192,7 @@ &gpio1 10 GPIO_ACTIVE_HIGH
 	};
 
 	sound {
-		compatible = "karo,imx6ul-tx6ul-sgtl5000",
-			     "simple-audio-card";
+		compatible = "simple-audio-card";
 		simple-audio-card,name = "imx6ul-tx6ul-sgtl5000-audio";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0


