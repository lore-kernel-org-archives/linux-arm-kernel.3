Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66528606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L6TRZJgS;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=I9rygnqr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NGSJlZizA2C8cImpDLkPvxHtH4LbMb5XXQp3ATb4Q8M=; b=L6TRZJgSMLglEdL93KCW0tfUFO
	lGtXd6gSL8bG4tJfMAZ9MX3omvsnYULsBuE6uZX4k7CRB/PNOmuXrogGvkczIUTH/HvpqL7RXydz/
	KLAThEUYK5+Om3PsnkWfB3w46RdnF+VaIS9cT0RE0OOtxEefz+8cS7IHHc/wJ6Txx8z1Oo5aJ692H
	/bF/1yIDfQtAmSPudLvIN3yd3QXuQoc1u9HlnT1aDg/xELWW+xhqcZ0a/a9fFZW3PlG7yDpuFu1J/
	ATvg9fPa8YsoszJlyONm9qtu8p/jEmNtybOeWxHeFMaz2WAYAsphSceZRPivZbfzex57UQkrzd9G/
	WHSV84eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzZ6-0000000Ewbl-3jwp;
	Thu, 22 Oct 2026 20:39:08 +0000
Received: from mail-northeuropeazon11010045.outbound.protection.outlook.com ([52.101.84.45] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzZ3-0000000EwbJ-3yCQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:39:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=id+oHe5bP4bxXHKTSewrU5Xsdm+XcQQsExXBzA+g1wXq+9EbTL1InQs9BNQJKRvsB5PB3426UJNvs9SpIpmpSEymnM2MuJDZjNVbJ1qVi2jB+TUpQD0F+yEW6vQkU1GuLG4ekZP85Wcm/vbh4B/1tSFDKsx9jt9YOk28tnS47F4WmaHMN7ZzJpuFjuaZIoz594317Cjy3RceBT/Hb/IOTl7ru8RIWX018zRCsQuxDjBWfx2tCJTgk95Swgea5eXNZ/8yXF8ucJAmR4PDrs/o+EoR6t2jNlwjDFzvyS/8wfrqoTg+IRbm5SrHJRuJqBQvuyBwVovx52j9hM+YKbwU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGSJlZizA2C8cImpDLkPvxHtH4LbMb5XXQp3ATb4Q8M=;
 b=EMninuqpysvQHMFEI9Bi9glUrJwNJ73BdfVP2/0foPFDN2saWYc6R3tMa0Idk88BMChM9w7gnnpa/gjXDN3+2+TIuwlYevKSrDSvee51pGNiL6uU0e8r3tT741rxPhzwoht+R9zvrcZBTCA+WK97ESRVwO8/j5gMHk8zXnVCD+JI45Y2rOB6PGgxzBWLXGC1RJTZr/V8J/qUXt2rv2WbGwO1s/rFB7TILVEUNnJUc5hWo2AX01uQSx3KujoY//i0GUHeXGFVyyfcCRfw4zvItLKaToV4xN1PabaFgNjp3fqXayiQ9U+N9cy2LszX5JGXOpXD1ueMLVCnmnR7hbocYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGSJlZizA2C8cImpDLkPvxHtH4LbMb5XXQp3ATb4Q8M=;
 b=I9rygnqrNry7E6TtDEKtkH45UHZOaTGk1ZBfBl4DoXd9yUgUyvQ2BQ4Lh6hgKQl6m99CNppcU2pyipm/Tl7VMohCFzFqRW6KIK2i46aZIGlw0c4drMZnHltmbNsuMziN9Jn6PbUM/xwxNCRS0qYbLA1MxvJHHnW+z4wFfiJorRu+UsOtmd8ohsc7j672PzoBjyUNLJnNwR5sxNRi4HuB/guCj5PRFrywwKs4DfGj1lkz9HIsz/IIKH8nWYvrS0cUhUoaxFsYto0iq2KmQDxQwZv4WvpqWQCcZKTdyw60yNIA5O0qWFVkeI2XVy69WjenEMp+wUGsF9X9febW7/JCcw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA1PR04MB10868.eurprd04.prod.outlook.com (2603:10a6:102:482::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:39:01 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:39:01 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Frieder Schrempf <frieder@fris.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] arm64: dts: Kontron i.MX OSM GPIO Label Fixes
Date: Thu, 22 Oct 2026 16:38:53 -0400
Message-ID: <179270151011.1321553.3168804408481373964.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS1PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:8:44a::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA1PR04MB10868:EE_
X-MS-Office365-Filtering-Correlation-Id: 307826bc-d564-4e53-9a59-08df307c8114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|376014|1800799024|18002099003|22082099003|11063799006|261009223027099003|261021121427099003|10067099003|261022105027099003|260925021311599003|56012099006|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: AfgpdNH6U8kJqLkp8j36fYSnTyeuUisoIKzCG+I01dAbwhROIfcFiJeX3zLtLt/w8WDietnZoOXMYete4fmZoOJtKvVpm3lcgVXUjmqdcCkWTLFFxcba4rgOi063T+aZN3B5WRGYEbK59hA5qwyfjzhz8+w4XfM6YHAfIOkAumng9fkKjC2qwOXakaENhahSoHW5TSTapuLb6LJ79Gfke5AAsIda2GI/tsQN3xd/QQVEV/ub9TvBwAyxt/1W2yT2gryApjkxhkUqEm7e8yjsx1gU5En7RqSFzVS7rGY0Sk7TISggUfIFFmGwZ+slo5fsxrAa2VjxpdpY7PoTKzhaiJuRtIoIzlTiCaI83U5nqR1qLa3/a+mNUak9JazGyX2UORqSbuXFDwHFuEdeda4qtmwrDh58v1NBJzmiTpk/pFQ82B7rIYo8D8RKjLfTo0AFm/ZqksQ4L1XijAKZ8ABGC3gA/VqK5pZIL8dgdaXzp85RaqQ7VBXZT5i/H1rYe8R5du1kM6zCX9UidrA8zKfS5PT0gy+6Kzv5FZdNw5UczT8b3Ul6HW0Qx6/FP58ogyhfAaN/z1Uo2rLF1UnamDjmJKV/EZZPZixNOKzVi84566mKuGHWFD36HsgrqnmgFj3Wkl/fHFPhRRp0E+FyIS5+F8ORE/0ZX/c2K+62waqxEpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(261022105027099003)(260925021311599003)(56012099006)(260925022911599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmY1RnB3MCs4OWlxQ3gxWXllZlpNWFdOTHIrNVU0SFBSWFVIOWg4OExseVdE?=
 =?utf-8?B?bytTaWJFbTVlRlZKZC9GZ3FlZHVJK3g2dTZwU2U3eTgyVjJlMkF1ZkQwTG9C?=
 =?utf-8?B?NEVHdEp3L0FaeklqR3Z2Qm1LUUo3VC9vUy8zdllOam0xYzJjTFphQm4zSnZM?=
 =?utf-8?B?NUNXZzRCenZpZEt1TFdib24xQkhnYXVselYvemRGdVNZVXlieUxIOUVBMDV3?=
 =?utf-8?B?TlRWQzBzK0xhL1ROVXpXYzBLeEQ3bmkzS05UeUx1R0g2U2RxMGQ1clVaRlpO?=
 =?utf-8?B?RnM1N1ZNeHBxSmJFQmtrZUE0eDVlS2RTMFg4M2JrN1dyQU5GQkVkSFl2bk5x?=
 =?utf-8?B?UHJPZE1Lc0JkTkFoMnBzQkxMV2NzSGN4SkpURjQ4enZkWXNUcHhoYnMyZ1E3?=
 =?utf-8?B?WEF2cXZpUmpPWWhLbXZocURuQ1NzdFBjTFNQMGhqMDBuOEFndmtwalA3Sitw?=
 =?utf-8?B?eU1aakhoYjlmOFV4SVZBMDJjZUxmSlR2ZEVrclRGeGliaS9uSDBEUGhkaU5F?=
 =?utf-8?B?aFNIN2xzODMrQ1JhVlRVNHdYZ0JGZDhEWTZPaWFsSVRKOUh3aW1FOU1QMlJL?=
 =?utf-8?B?WUkrSDBlVGZRZ0V6YXNRc0JsbHE1THVZcjVlc3NXNDIyT1QrVUVBaHVXbm8y?=
 =?utf-8?B?QXBkb2hrb3pPK09Nc3ZQVVdoSFhiWCt6em12ZCtwZEg0c1piQm5nTHhGVVgz?=
 =?utf-8?B?ZVN3bDYwb1AzeklSWmZydHoxdHhoV01GZjNSY242V0d5NU16ci8ycWMrK0JQ?=
 =?utf-8?B?dkV0YmxKR29zWitCbXRqbUlPZ0xFSDloUE8rS3Y1L2trb29hTUpubUVjN0lI?=
 =?utf-8?B?MUxGU2lLWVNRNHFsU1pYaTJyMDh3b1V2N1BpcXVxdzZUY0VzRnRrY2tCd0FC?=
 =?utf-8?B?UW4vMDlYM3JmOUQ3bkREcjVWOGhPZ1VWS1N2eUxhdGIrT1NGS2RxNGNKMU9I?=
 =?utf-8?B?U2Zhb2t4SWR2QWRwaG1JQ0VaNHlvdnZmbXEzRS9QZXpuanZtZEVOM1h1NWR2?=
 =?utf-8?B?cjYreHZRZkEyVURQQ3RnR3pBc1ozMkxWS1NtUkxERy9GSlpkNTlhN3F2TTBx?=
 =?utf-8?B?MDhKYTJSS1F4SjRuSDNZMmFETXhaK1M4YzhFc1hURTd4bTM1a2hwcDJLaitr?=
 =?utf-8?B?Y3krc295TnZqUG5JdllpOExvOC9rcHIyejhYajVUK1RFeGdXUjNUZlhvSHd6?=
 =?utf-8?B?Kzc3MDJTU2JjdGxQZXUxTDV3SGFqbnJCU2pnV1NDQ1VQSWEvNUhUSGhMTGZS?=
 =?utf-8?B?R2YwZTlKeGl0T29SM2RRSEZmajlWZWZaMllWejIxKzg4QTdUSnhyUi9KNHR5?=
 =?utf-8?B?WlRDb29QczJ6eHRpZzZlNGpPZG5PRmd2RlJzOUI2UlFYYzQ3dk90SVNIUkp1?=
 =?utf-8?B?KzdSUHZWUy82Q3FPYUtLR1dPWmU4dUJNR1FyaWJhdnFwb1grcnloak5RK1Az?=
 =?utf-8?B?TUg5RURWQmlLeTIzNzFIQnIraXpMbVBqbUZBTm1VSVVCdHBZaU1kTlRyVm1o?=
 =?utf-8?B?dlNBbjhSdXdTUkZiZTAxVGRRRTJESTErenZ4TlN0UUJqTkxTR3ZkMWZDdW9t?=
 =?utf-8?B?L21PeEJNSTZpMWlYWGpLR0NIRUxUMmZLcytUUjJCb2N6WjFuK2I1YUpHMXpk?=
 =?utf-8?B?VUYwbU00Z3lsMGw5T251czJ0TU1QU0gxMDNMS1dGb0gxbGZKMU5SN2dIUjB1?=
 =?utf-8?B?SVRoZ3Vjei9JK2JscXd0dHMyY0Uwc0svZngvY1FTRklDTTFObzdIbHM1Rklp?=
 =?utf-8?B?eUNmWlBpWit4L2JFeU1Mak5aLzFMVWtCZHNKempiWjhwMmlmQ0VtajMzREt0?=
 =?utf-8?B?TTJYT3MwYVNTRlNjRjFtZU1pUUxCSUs4MVd1eWMrS2pmYUdSWlR3ak1JWmVJ?=
 =?utf-8?B?UStWUzJ2emY1S3hBeXBPSUZmS1Y2NVplTnJ0cGk4VXRXSEJNQzJoV2h5UnEv?=
 =?utf-8?B?akdPL2xEOFpPRXl6K3hOY0ZIZFJPTjhHc05rTTB3YkpjeXcrb0VqUUpKUXho?=
 =?utf-8?B?NnJaTitFc0VwQlVnUnNxWS9rMGtGSnA3S0NoMUtETWRkaU1uSXJNWVdla1BJ?=
 =?utf-8?B?c05GR2FoaFlDU1Zpd0pQdm9XMVRKL0lkcFd0SkJGeTUyWmJQam5NWUx4TlVw?=
 =?utf-8?B?T3dUZjUrRllVTDIzM0psZ1FQem5haEd0Y3JGY3JwUFBSZ0pmbWk3MTVUNzFW?=
 =?utf-8?B?Vjk5Z04zSGlRdW1XTXVCK3FCY0c5TUZXbUFMNkRjS2x2YlEvLzlyNnFPL09W?=
 =?utf-8?B?UXVBT1BLS1RKMldPNW5ZRlFrSHhHQVN3YmxndEtxUVVWY0dROVE4ZEc5VU9Y?=
 =?utf-8?B?SUUrV0JpbTdMaXZ6a3orNEFBb3pRMGdOREFhaGJmdTNNN1I1K3FWeEtUaTRU?=
 =?utf-8?Q?8VVMinY6Io8o/TZqAIvHLmEDVv5sX9x3Gz8LE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307826bc-d564-4e53-9a59-08df307c8114
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:39:01.1149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFIBZlZHZp1DR6GHZDYdsjga+E4wxAyMJYOT7c2/FlVvJICeKCb+0A36U7G9R0gMIcBPnlaEKEXsCsziZzB2MsEEGnmzEL1YxLfLJLXJjxkTmDjyDOD1VBoBrQFKlxB2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10868
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_133906_065774_ACAAAD7D 
X-CRM114-Status: UNSURE (   9.29  )
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


On Tue, 13 Oct 2026 13:51:05 +0200, Frieder Schrempf wrote:
> The OSM spec [1] clearly names all pads and GPIO labels should match
> the spec in order to have unified names across all boards. The intial
> board support uses different labels for some pads and contains bugs.
>
> Fix these to provide the correct labels the user expects from the
> documentation. This invalidates some previously used incorrect label
> names.
>
> [...]

Applied to imx/dt64-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/9] arm64: dts: imx8mp-kontron: Fix GPIO label assignments
      commit: d8ab5463133836a2556e1eb52d2e2e97217835f7
[2/9] arm64: dts: imx8mp-kontron: Fix GPIO for DL panel standby signal
      commit: b1b32cc59496b40e9125c175d913ba6062c3c6b1
[3/9] arm64: dts: imx8mp-kontron: Fix GPIO labels according to OSM spec
      commit: 31e0557c2f2eadd3563e0611baf48e7aecdc9464
[4/9] arm64: dts: imx8mp-kontron: Remove obsolete VDD_CARRIER regulator
      commit: 6796a4b7ce759f866f424ca5744dfcc69998071f
[5/9] arm64: dts: imx8mm-kontron: Fix wrong label for SPI_A_SDI_(IO0) pad
      commit: 3728951a3e3cf9810e266151e6fbd30c1e0e0fa6
[6/9] arm64: dts: imx8mm-kontron: Fix GPIO label for PCIe_SM_ALERT#
      commit: 7bcb2fd0339514d188519581e065e05bb11de4fb
[7/9] arm64: dts: imx93-kontron: Fix ETH_B_TXD GPIO labels
      commit: 327c0c3966ccb98ab6540c2efd28275571218f3a
[8/9] arm64: dts: imx93-kontron: Fix UART RTS/CTS pad names
      commit: cf8fd1d0f2362cd34b392a1b66d4db5f36aec2f8
[9/9] arm64: dts: imx93-kontron: Fix GPIO labels according to OSM spec
      commit: 2cff04d59d8fcfb289cbef9d7493fe69c14775b2

Best regards,
--
Frank Li <Frank.Li@nxp.com>

