Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F92606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yRG+84YE;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=O6t7LIca
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p9UA02iUrJD+wTb5+Np9Dybz67toFi6JjtVXRYVXUpk=; b=yRG+84YEc6LWt+vOuhKt3murP9
	/wmO2z1D7zFesunPrgiaXrXs5I9rvo7BtnyDCXG8VseiXn6db52rEEpihAd91UFTe6LSjUQw+qDFC
	ljQiqjucWQ2r8NADpzTO9hsm7XYB/VICxNKBcyOH/vZcHbSLoDgH7PUPM+fUDFMBoz34B01sfq+DA
	ZW/sSSdttB2jTXM1H34Mutd+jQEyCHtJJwN40datD+cMFRxPdNnrGnvDh3paP3hdvNBt7/SW5UGdu
	Cplg+FvDIeL84lJ0HW8AxVPYhjYRf6+29TjN198EqqKZkry4xa/x/9AeZO4ofos1J196iL5RQ+NYK
	frT1KJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRSs-00000009Zwa-2v8t;
	Thu, 29 Oct 2026 14:50:50 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRSq-00000009Zvh-0mz8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:50:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/r5rn6tKCi4fYnqi35vLMU/9XLLCVVaeP7DywjCbVBb1gLEpRhH6P2SP8+eW9sjxCHXSwzshqeLFk7BmQ9rizFFA28QU6SIBguB1qFJCuAC7iU9kXTRCWSBZbU0z1G8cHYIvcNoJKHQ+csWTn+Qo8kxgz6KHuBk/QPkKszDeDXcTd4FTtBT2raNMjgcfYjyJzoEMCE+TNb+ssB/rhK42hvz5H66YTUd8fFO1+bbR84PK/paf4TSNQjNoFkV1BfWLMtxLpg0Zj72QsheBO9mpBC8uySxvcGtuPDpz0cENm2G0AGqYc7WWwvB8lucJ105Tm3//o+d/qqYStyaZbCq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9UA02iUrJD+wTb5+Np9Dybz67toFi6JjtVXRYVXUpk=;
 b=G4zJwFkDiLp7h++HrYMCRpJtgOi1qzWt+0m3s4Uj5+v2a4wfqC1yVkn8+AqInYbv6kQI67eDDgFcZUa820qkoMqF7dMR83gsysoTm5v780P+tU3QASzYF1mXabANK3GWhobTXmxXpKaoJecT0cSlLoB43NcdMmJ5gT/6TZfEUQKW5CEQTYSEEClUnYZcuSHN1/KM7eEByyY0mNf8z5FNzLKBGB5ACgLxJ+4spD1zVdq5rVijS7kDZmKfcmaEUzZGPW+wSjeJ4lK/kk4DtfF2gFEBS7QuF6/JQ1FHN6MmazsJVGk5e1guAQa2cEOhM2UNe9NUCkYy5n3lCN3citRHqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9UA02iUrJD+wTb5+Np9Dybz67toFi6JjtVXRYVXUpk=;
 b=O6t7LIcavTEBj8M0lVXXgP4kvdBl5gghrVxLDWqrepLFYL3gomABkPtX3wUgrTkTKufUwX9juT/SxlH3Pg4tDQQc/nxugeHSp++85n1UhErrm+TW0y5g6uff/6m/s/88+1nuAJuD5xg+7rTPXLJM2ZdUGKeehwmfcEeGFXNGBUrk4/VS6il3roJPICajNIxCyWtark0bUJrktidHvmh1OHwC8RMPPd2wWD436ZQM1fcacXlie+jhQU3Nesm3QVQYmuGK/YtnXDvBMli/K9JeTaicNbQn0KACBwyPR8kYRPLs6YGBwK8CnrbIyEWSd+mEvlbSEGBrnj5UnN+oBgQh/Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8331.eurprd04.prod.outlook.com (2603:10a6:10:244::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 14:50:40 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 14:50:40 +0000
Date: Thu, 29 Oct 2026 09:50:29 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 04/11] gpio: vf610: use devm_clk_get_optional_enabled for
 clock handling
Message-ID: <auNdNUfEAMH6RE9F@SMW015318>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
 <20261029-gpio-vf610-fixes-v1-4-45b484b4c434@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-gpio-vf610-fixes-v1-4-45b484b4c434@nxp.com>
X-ClientProxiedBy: DS7PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:5:3b3::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2bebb7-c745-450f-34f0-08df35cc007c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 8YQYtMXuXFtO2H2eVQKS1cDExm3osRLz1axWHd77fq49ww5n8U2L1ciW/HMpnQwHAIQewYwG8FGA1IaOtyM7076OsJlUG8Dm2U23wL4NH/sDL2hfiWNtWUTArHInWhyC6NWD9xKNGGmE5k/7a5ir1EkcMzQNr2JXvJ15XVJsGwdKpfDzDb5k8X7Xurl1YJvqXH5oGBgXLkxTP02J61sP6dMav643MCQedOh9rHriRXDqGt9gmep374KqworznXPNBu7ty0DEVQ+i994MHmCwmiHbbkiRRtDvyLZ534xULw1y5Q18+uiejDPvHcrbWxFOPJOmSgs9F9+vy4/z/jNFLC8wrafNRfk70CBAEfKYF2HqGPMFbIGMpkpnteeoOhszatz6Z/8MAjtLFvWtZE44Vce4krNUpN/dQf9NMACkfHuBJ8AMNGBWCv7K15x4jIU6tqlhw2yIC2KMA1F7PP6x3zFbZoo59f521l6w4mRTZvjuRDX63zr6FAf4Zpvb/CBfa6uNW+t5lLYdESmqN04CRYTA6EFMeOu8qbtlEGzlZlylpGrhv1rnGPoSXCQpgJQQJyo92esWbQY1yIE486080CGD5oAiRIrL3w//LHlf6/frwrGvyYf4vQ+rhmiBIEyxrdmFK64wKbyFLn4+XfBVimcE27TMEl2lc3BfE0mXu5o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Db5jwDjkm4LTgERJzfY3xwYZXdxDGchUphbphtyKxCbKnirEP1w3idw9ZhYQ?=
 =?us-ascii?Q?upviDoknkoyoQZJxYSWPy623vmpWkuo85pfQvSRoCjmdyvyW/CC0LvHkbETx?=
 =?us-ascii?Q?optLphpULDJQADgfCGSt3rB55KYa7wfbsZpjLca8Wc/xf9JeebPW8nXBLKNC?=
 =?us-ascii?Q?Qhh6QGoZGPWYu/dxoRqbjGgnyLtcGobWhAoDhsNr7unVsbECfrXsVaa/azyG?=
 =?us-ascii?Q?c4EpgqPw8PZLfXjWUX5tJyiXm8/f+tt3wY8ViHPOE6jNT9dPwHqK+lxEwrCZ?=
 =?us-ascii?Q?mMgMs6Gh1PAfIyOAZG2LTwJGqvnnle43N216JawohALmmanBL+wzaDelWob+?=
 =?us-ascii?Q?bfboR/ahmfRPTFOStPsNf89Ixm0tchxTQuZh1XyURlSQ9PpsZG4KF1BPKxyJ?=
 =?us-ascii?Q?0rKm/wC2A7n+WIYjc8ItNVvJ9i45LfVM7nZtB+MhnDpld/OeH8o0frW4/2eK?=
 =?us-ascii?Q?Z0TM6ovfhzu/tVYMbtAhhF3kMv9uuE/J48cgWHSh1skcAv3iCrTZAlj45SNK?=
 =?us-ascii?Q?1KRIQbJ4GZw1cd58BWvJw7/a8PE/oAP4+z8581UTyDDah9wN5xch0nr5tcYK?=
 =?us-ascii?Q?e9Lk89hT+Q3FZqd2L0mvvarw10f0G4IQcvf4vLPgXFATq5hxXwvRNEvD4lCQ?=
 =?us-ascii?Q?m0F9FaqLKP4WsnC2e5g3z5K6NCxzQZigQI27hRwf1pxhZ1iJ9fZXXtLRmTMa?=
 =?us-ascii?Q?hL20c3VXbE158iMpt0aMq0Psx3XebzdCMavS6f/Rqgg+RIV3K9ew8UJ61yWQ?=
 =?us-ascii?Q?+Tij76vJuhTPRHdfCjQVo1L7we0qPEZWgIn0CpEqEB56mOgnQz6BveBGkqPQ?=
 =?us-ascii?Q?zUKed140ZYfJjqbvnYgH6brddrHkDcIeqElbvIkptBI4xKPh8OPreUisfIoe?=
 =?us-ascii?Q?hoLmBxcyPoQMFhosrW+76878Kc5b4Eb2l8754dQBapXiQ6OQ9HDf9X9qd39i?=
 =?us-ascii?Q?fwis11aqMlzFjjjVcPKAaha0qzTKbTHpiOp3BJzNd4W0wMOQMjYIQvnMRrhs?=
 =?us-ascii?Q?Qbo2kea0JI9JQqTXlabPzkHIRg71Y4AlgRK6QZrYLgfmQnaaaCxDASxJMaij?=
 =?us-ascii?Q?U+jjXVeoiGEcjXvVHFHmrOUv/EBcykDqKSqVXT8EFssKN2yC/FDMUu/YO0gW?=
 =?us-ascii?Q?tnMFUSRLVbDtXe89sXtlwGyPOpi6stXO8cpLYSx/5D++7Hltn4IL0tDiD69m?=
 =?us-ascii?Q?vrT4OwRZwDriN24b9hxT2aeXaBK1ewY9m2PNDvc6RISJ4aXAxDbrC4nKBPKt?=
 =?us-ascii?Q?Ey4TkrAK5QaZOG8fA36gBC6SlOTO2Ew0UmRj2/YXeMln17ovFo8sPfr9MDGW?=
 =?us-ascii?Q?QMQ0r6vH3H8h1HeGYDREJKNQg8rwSidEN+rQJ5igsXW1eGD9zS76X+71Pszt?=
 =?us-ascii?Q?PzI3nkSI5tDKE1Ph1SM79Oj4BSEAsZkTAio6NzXwSg4qBksaPj537w6zeDuK?=
 =?us-ascii?Q?ZKq4mVkcslaAhyO3+3riN8w7m9eLlBTkJKKKST1udWfXXhgBTGjTuCOx0rOS?=
 =?us-ascii?Q?5hfyNSmmLs2hf/r0ONKcoEqPNhVXxQyFcb/2onvg5LzTMPURfCFaxghEPTU2?=
 =?us-ascii?Q?70K+zpMbKV5C74dbAcGWajYxRD2J3hVYZeSZgdqrJTymcaxe1dxiBAalJ7Kd?=
 =?us-ascii?Q?C6wbt5NpU6gOaZEYXR0eLTAgVUKSSvPcXd7M2KAHLjLZQb/gR+kLNs2z0TEF?=
 =?us-ascii?Q?kSjNZVKFSITUNcJUriWwvAsAEUTjV7vmzc6yGPJOFnLArX71wFSD8jbmOd2g?=
 =?us-ascii?Q?GZHHP7a1VXv5uArCox69w39bo20Rt3RJX/yZoxXjwApmh1KpOWuu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2bebb7-c745-450f-34f0-08df35cc007c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 14:50:40.8437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bupIt8acDXyBpb0wvbxxqF0V8I2ZSx8aVSYoikrXfrk9pukusyI33rR1YrntGkeJw2bMmYNejkw0v+KiJvuF4ch6/Nt7QhVEwwgPR9LyAnPPcflqinZz6Q/QhQppITSD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_075048_249155_42359033 
X-CRM114-Status: UNSURE (   5.07  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

subject: devm_clk_get_optional_enabled()

Frank

