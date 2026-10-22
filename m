Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452FE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 19:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jxJAFEut;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XlPSZvay
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VCLN+2g+sl5xuqNqEXPzgNxH+RnFTCZfojja43kQo0k=; b=jxJAFEut07KARoRWcVTWOD16uK
	3B68LswN+TNxc4V6EXI97C/XsAyH3JGic+7HXN+WYPpe+frNnHKoF7gO9yTU/fGwQet4VmZon/QdJ
	0I8du9VNggsxH7WJ2/iCvSEVB/SB5PJPUYZ754qMLYkhoRhMe/tUiCibn5YLwMGKVhIrUlkE6bzsG
	JA9Jk3hXi7P0wngBsc34Hj3odLhOGbZU9XTEydak4Es90zGK8Pe2e37BfvH904P5YX30JzWea58TZ
	X9sD2Rko9JJ/g3oS1hksDqPvTSHDr8bK9j/7l3BAau9O6eg9ji2R9fMcVOOEG+DuG7sJLblTYeDEo
	B+mowSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJym2-0000000ErTr-2l0U;
	Thu, 22 Oct 2026 19:48:26 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJylz-0000000ErTR-0vb0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 19:48:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTk2o1mj6BHR7mHSd+DZH1JXouLJrTCzcv28EGA8vEqlOrjUGOZcqG4rlfmzpvinFV7M+/7gDgM9PmmAwlfQAqqgY6k3+KVpt5NrPRS1EActodJ+LBJmcbcccATSRAffLA3e7K+4PuyTsKmnZjS/oIislIyh1eoMQtMovcJyC+99efMNcfFEpwWZDXL14GXygDWo/4XwKE333zhfF/KA/5D8pk5Lu/TTqOhXyxWB7u0QuJD9Zp28H/7IMOClCw7PQyv519ZFABDBRO3H0BMpeOe8qSPP77kPmXhm4UeVz711LfWCL0HxYKgiLmgbIoV5QT4yLf90d03fXyVRxzzGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCLN+2g+sl5xuqNqEXPzgNxH+RnFTCZfojja43kQo0k=;
 b=PGnT6t8wK6YFwt5gbEIcHT1m8pbvHD71RVx68KeCGZOucPqZyCR6v4n79RLKQ/OZ0U1ROThE9GaQ9kkkJX1VW0fyEYXKMS1M9tBprNUMXeJ4K4uGBducGbwP2sUYZADeB8PkWb1mX4LFYIDExCqjhdzhtbDhsC7WPYlVQ95HCmtP8PRK+3Ahe415x/hHk8PMCcWuiGEDkTsPe95XZpmtm8A9pC92QjMbhAzede0Abow+yXD0ONykAIlqNgca1zjJiN1C9bch8nJEXu29Mv6ZBgDs+fA7VLLuhPquUVX2mrpypb80lTZBNII3KnjJR0sHmkEyeub6kwCqbATTdngvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCLN+2g+sl5xuqNqEXPzgNxH+RnFTCZfojja43kQo0k=;
 b=XlPSZvayjJ7IIHb0cNoP1rbaN9MhfkFi84k+qy6MQzBOGQPC4te/ycOX5K1VULbpugSvyJNU+WKiSastNfe1cHZGLRWnwsnzCfHfGi9g11GzmfpAC3XV3LM3MsD/66e7JQ+bBvYvWLpAdf2TJalXLCx4CwUsjq7TnqamB6h6LPV89of+WrLVA9/PoKKndA/QmyszgrzUwwZ9ibN/Z7OYF1/O51cfarRZ1liSi+zxhsrG8H8AsllAhTcBh3XxplCSPVbDwhNrti4q1Uofoh5uJ0swetnSxdi26SXYFUm/TCi1ewckQFWVKuMAp13t3Um0pIIDhKMDcQaWmgqH2UrQIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMDPR04MB11651.eurprd04.prod.outlook.com (2603:10a6:20b:71c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Thu, 22 Oct
 2026 19:48:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:48:19 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v3 0/2] ARM: dts: imx6: phytec-mira: phyBOARD-Mira fixes
Date: Thu, 22 Oct 2026 15:48:10 -0400
Message-ID: <179269845116.1266337.7411055467831992530.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002071441.2499132-1-primoz.fiser@norik.com>
References: <20261002071441.2499132-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:510:23c::19) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMDPR04MB11651:EE_
X-MS-Office365-Filtering-Correlation-Id: 3820b040-fdb1-4966-2bbe-08df30756be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|11063799006|56012099006|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 7flrvU4MijIhu9t62qe+4u43uunH9C/Grg1Ouue9CFM2SvsQI21ZQ3fyo0KC3/E50vsM4a3I75Sqrn4yPu/2iQnBu6BPLOekH78sF7+yASwo9MlrTI2kwdtn+Ukp26bh/MISR8CFyu149fSH6p/vVchjVXK7kdk8ISgSSC1i5WhL+iACHUxFdZx59e2iC1qlPZvFs4ALy9OEveNzUs+MoxrSciMYmAynCJcZ5gjYr3er307LSZ2NGuuyLoSy8XmqAxVWkA4TjWLZV5KqVAJtj0xyvYVQxHowEqvCK0FUtFthgn3xw4YfTs9n8xjMUJD/uSxYZVt45V8vD+cjgkoXzmV0uNxfFoVxukenEDXRVSLEazuAmkumLBrTE/FnZdtcQk0aInDpnnaVyzkphRBLtLsf/RmxQRg1vRfs+xYEX2XvfOZRTRZvfy6xK/dFQNMipCObZGfTIbuQrp7YVXiBYWHE9gvCDCKvVIRyCzBdjmD2C38rAxO3/rxnOJjxcqiU00hD/DYTjrnMzD0RISTwqxJjhc3w+DvTR3YxJJv2/4cM2ubJ+cn8rL6Y4AEY4B12cHhvATVBJRgBhCp+OWz4bFSlyTVxGvofqeFwdBx2eqEBAICf+dbPrSUXnlyo4r+2GcE14CTUeVNAj+xgUjt8ih1tC9hWPucS/yThXBA4oDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXZ0Rllhc296WW90RXozbXBJdlZoUUx3QjdhTXVGMTYyOWQ3VnRnS0plbUhu?=
 =?utf-8?B?czJxOHpCUWcxSkJ3cFZBeng1a1dGaXM1SnBGMW9CQ1RmWHl5RFJrSFZ5bkRT?=
 =?utf-8?B?M2hxTWg3dkRiTmY2N0o4ck12NWs3ckJBQS9XQUZ1VmpOOGtHUDhwU2ZTcHhL?=
 =?utf-8?B?WDd3VGZIRzg2VExtbjEvMlQ3Q3kyL1NqbHpGdFBxS2RnMTUyYU9JWlVXZGd0?=
 =?utf-8?B?Yjc2TXpDZWtNNmdIV3lXeXV5dTI3UVVTQ1hXR2ZLdzUzOFB3MTJJbXdFeURV?=
 =?utf-8?B?SEYyR3ZYT2hyTUxuc0h3Ym4rOHovTmd3T24rRC9zTDB0TlZ6MnZ1MVAxQlR1?=
 =?utf-8?B?OXhpWFhHbzlOOWNjaHJyYjlJeHF1RTlLNlhVazh2Q2JDQmhSY1NJdHA1ZTVR?=
 =?utf-8?B?VERucGFkdWNNQWtDRTRtKzFxV3lKVGt3VzFwbVdDVzVKcDRnakx2bG9IMi9Q?=
 =?utf-8?B?RGtQbm1qNTVXNEl5dVY2dW5waExvR1p5VjU2UGdPNHlhb2NzZ2RNTG9hSUU4?=
 =?utf-8?B?V2cvS3hhUEpicHpVVFFhMVFqYXEveThBemRzek1LNE5UYTBGSFlvUjZRV2Ni?=
 =?utf-8?B?UGp2cFN3Y013WVcvQ3hlUForbmxMRlk2OXcxdjk3cmJ3LzlMSEdKYW0vZFVJ?=
 =?utf-8?B?aG9VeHZNOHZrWGwxUERDNndvanl5VTJCZVBjUzEzVVNWcWRzb1dlVVNDV3JZ?=
 =?utf-8?B?U2tkQVlFRWYvTm1xa2NJVGdhUzFLSDZsOUx4U0t2bWJRRUxlVTFkMVA2eHJp?=
 =?utf-8?B?Q25FVVZtcHR5YmRsZWRvNjRsR0JIUlp4SE9ZalZXdUFTcWJZRVVpdElTYnE4?=
 =?utf-8?B?RGRCTzNPUisvenY2UG80NGxyMmpVeTd2MGNsdXJ1UmMwRy9WbjVIdWp4MFlT?=
 =?utf-8?B?OHR6ckJKTFMva0l0UldKRnd3Q1pGM2w2SzRoY2JzWkhPSExlK2pEZjNIcnJ0?=
 =?utf-8?B?azhVVjdDV3E5dUVseGJNa1pMZ3BoSk9zNXJUVVEralpabW1HU1pxU0VIZ0Fr?=
 =?utf-8?B?QlhoTzdqYmFqTzVJT1lnREIycDU0bU1lYXdDa2NHRmhKNG4yTzNCdjNrWHRp?=
 =?utf-8?B?b2dndlJPM3FNSVoxdjRhYUh2MWRuTFV5VnhRT0RUNEtUM2Nkc2FrU0NuL0s4?=
 =?utf-8?B?MCtnN0U4NXB0cENDWjlrTFBrM2R1dFdhTk4xdXh4S05KOUY5UmdUQ3VIVjJ6?=
 =?utf-8?B?QlNTSDNmei9xUnZDSDRXcGx4aGwzNjNwMys4SnNyYnFJUzdNMUtmb0M2VitU?=
 =?utf-8?B?bGhVbUYyQnB4ZktmRkhkejFuZUg1RFBpQWtwcFUva3c2dWtvUDNkQXBnUmhC?=
 =?utf-8?B?QUp2bVZmajY2b0NSQ3hmUWJTaWJxMTQ4ZEtaTTdaOE9iTHRHcGUvcUhiUURj?=
 =?utf-8?B?N2wvUk8zdW01b0pWSXRCbGVxQXBxQ1FJYUMwTmlOck8vUnlZR05EQjhXZ2k3?=
 =?utf-8?B?UjNoMGdMMy9ZTmhiYXhnamRBV3IweUhWc3BVeUJGcFpvSmpoQmg5QWk4MkJK?=
 =?utf-8?B?cGhzNld4QkdQVGUrOGYySXpZclZtRzJPUXpCZ1NzTXdUdG1TaEFVd1ZCQXBT?=
 =?utf-8?B?c3hMb204MUI3dHFRajJ2NDJDaTN2Y21lYWM2dUVqSzNmak9GSTJvdEdTK2Nw?=
 =?utf-8?B?N2hwaFpBYmlFdVcvVmRLWkJmNXViTHNNQ1oxcGVTanhLSDg4TmdQR01zSE1s?=
 =?utf-8?B?Y2RENkVPMDZVcFRUMnk4NlFFU29PM3pYKzRCVFozcW9FZkwyd2ltR0ZqL2VV?=
 =?utf-8?B?L2FMZWVSU3h4dnRhODd2Sk93TThDMitZYUZhYUFIWDdjZVRLcVFnT1JRVVY4?=
 =?utf-8?B?aXI1eFAvZUtqR2xRZitTOE9Md0t3VVZtb3dzUjhHbEc0U2U1aWV4UTcrekFi?=
 =?utf-8?B?WGh2Q01MSEErUzNoRE1sTlRYb2RUcnpDRER5T2ttMTc4SEp3RmMxYU1CREov?=
 =?utf-8?B?Q0J1WlJ5Z1IrU1QyTHFjblNPY3hwYTQxdk5MenVGZ2gwY3lURkZPQTJEUk9v?=
 =?utf-8?B?eHlZdzNnWVQ5YUtSQmZCYy8xeVlnSTZZeTh2UUdzbVlVc0Joemh6SEkrQmNp?=
 =?utf-8?B?N0hmeTZJTVBoRWNuNVlGMSt0cEZoY2xzeXR4dzhPVlk0Tnc2OG5PcS92TWhX?=
 =?utf-8?B?T251b3pLejFWdnpmT2EzZzZtS1RHN0xhYWFFaDlFdFh6UW4xaWRUMmlQMHMr?=
 =?utf-8?B?ZzRSckdBOWpPNnJxM2hkenU2WGs4ejdsb01HQWhlWXp6UGdIN2JvcXg4a0N6?=
 =?utf-8?B?RFUxOHlrY1Rpb2MzRUNlejcweVpRQ0RoUTRYWVVnMWhvdDlPY0NDM1hqT2RP?=
 =?utf-8?B?eENCVHByYjFhcXNjd2NaWlkrMlhweE5WU2V6ek1xbjRCUFdmSWFNcXUxVjFT?=
 =?utf-8?Q?rwoHYz+tbMEurQpavloHYqEC8vt9aP2KlQnjJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3820b040-fdb1-4966-2bbe-08df30756be3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:48:19.0324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ob48CAnVAGR0Swu7AiVUnRj4jzcms6XvMWucjqeocc+W7N9NFdJdcpBlYyhI7OwEAKNsT8Gqe532HBBS8vVmvfzarX6hrZsDX+jatKH9FUu9kGsYZkW37/kYn6L7Lci2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_124823_261368_B1CAEB73 
X-CRM114-Status: UNSURE (   9.94  )
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Fri, 02 Oct 2026 09:14:39 +0200, Primoz Fiser wrote:
> Two small fixes for the PHYTEC phyBOARD-Mira-i.MX6 boards:
>
> - Since commit 888e5fad9b78 ("Input: stmpe - add axis inversion and
>   swapping capability") landed, the touchscreen axis inversion these
>   boards need can be described in devicetree instead of userspace (2/2).
> - Fix uart3 CTS/RTS pinmuxing since pins were swapped.
>
> [...]

Applied to imx/dt-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/2] ARM: dts: imx6qdl-phytec-mira: Add touchscreen-inverted properties
      commit: d8e221cde0d5f166bf32a280c60609e95de327ff
[2/2] ARM: dts: imx6qdl-phytec-mira: Fix uart3 CTS/RTS pinmuxing
      commit: 14706ff23ee6174de7a95d127fd613137014d0c8

Best regards,
--
Frank Li <Frank.Li@nxp.com>

