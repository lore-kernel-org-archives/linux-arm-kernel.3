Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDC3606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FH0/tWsU;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ugM2Iqac
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7iDxVqJeOVWXxJjrepWYYE/oC3/pvZ/kZoEfWPVFuNQ=; b=FH0/tWsUn+xu28eHTjwEeM3j36
	xTiB/Yd9O1oD/IqpSRYNFih0kR4nA4W41+Mr5j0q6Ojj4UY8NHWRtGXA8WguJi/zFp31UjJsTr6BW
	3Jns1YBoI1vzYXK0t4+2pVbxHZHmQ1dgOUuSbwdUrUJgBgRg0reVfius5AKFAmKATCDy+zmdqJR4G
	iFJktc8KuduGowzV8hAXBlWpEmGIua2SI0TrlgDjQ2eX/jCQBICDLcloIEdngKcfL2mNyHkAwFMNC
	vKI3oONqKdGOrbifKrNwr1uxeUoSDmCO17B0KGwaPNkxJrIHbgZzRKRHlgeY/qPYhxwVqdOCsNV4W
	JtvukOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzWW-0000000EwUE-1Mlx;
	Thu, 22 Oct 2026 20:36:28 +0000
Received: from mail-westeuropeazon11013051.outbound.protection.outlook.com ([52.101.72.51] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzWT-0000000EwTq-096Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkDqM9C6BnWAjv8LFRxjfBz6vBDAsvjJF5oREJPT/hJnC8oZfIzVUGBN8V5tbtYe3gCAjLHjSIM8AOA87NTFssQLjBkBAOpUOWuCd+vb75wkjA/AATzEymwwHIFkIpRBfFrwi4TucuzzK+b0zLiSGycRfi1JSpFCXNWOsx1tTVqfTAve5MZuifNlMmBUzwDG6FvUuC2VdvWzmAVvZ8WGjiuy+kpe1W9ksuH2xcKP6xD+ggg27oIIYZ0ea6cRCslJefaAMkQFycc7mymjDJ4QgsOzURM1JH8xHD64QDLYnGD8sVypzSNZAYoxln92TVYdW7zAH72muQa9Jz2xtodJgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iDxVqJeOVWXxJjrepWYYE/oC3/pvZ/kZoEfWPVFuNQ=;
 b=IJgtY67jcDUmFWaVeWKPMqDtPHmLm/1Ztepb28fuTlYKLSYVhoFgpaKi5PM09w1nPklLxksOWgQaTnVqTvIWWKgM75W42BPsH8zdEjNyf6+sqTaQzbmGyWqww3yyhTmmiCYLPGofzgcOXsQMXhnowD/86XS95PdcOwDZbCFkEHQfkei05zMj7/0S4fvbBVfdd1VLYVamg2LSoy+6wuAJ+HQVyO32SldgRT63SCMU/tjq+7+rAf2aJEmako9spqQrfvpbv1p639jclL/vHjltM0WpdXVT5/IeA50fkwPJnV2OMaOaORhWWROuYfsj4Uvq8yttgAtGHrfYxQUlm0qong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iDxVqJeOVWXxJjrepWYYE/oC3/pvZ/kZoEfWPVFuNQ=;
 b=ugM2IqacW5KrBXY/E3v5X0smFEjiPLaSTYl4EN3HEPoXOYwuO2t7M0gZJZ9awfsClMQIRoLN2q1Dn9ORtTUo+Lhh86Ib4Gwm0qeabaUBqZVgfzbHpLWx1P6YwlvV2+pxfSw6f+R7tenodM1JOXh+8+WIragGUVXtufDWRKDW0uN6MToewv1zvrcPBaOzb+BqDnuzgpYF85n3Axl98aMuX18m8Gfj7LkuNvXLNd2c0wcGnKH0Io7E8Y9ALsWd430YXnZAuUTQvi8rdGudmf+erwLOXk4gOS6636kXof7YVvQrCdGZozU/h2xlfqPCp4O6/HQQg1fBuM+A4XJ8ZVlLyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:36:20 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:36:20 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mm-var-som: fix touchscreen IRQ trigger
Date: Thu, 22 Oct 2026 16:36:13 -0400
Message-ID: <179270135211.1318523.9600540799860547403.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018170007.38381-1-stefano.r@variscite.com>
References: <20261018170007.38381-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0094.namprd07.prod.outlook.com
 (2603:10b6:510:4::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: 15eb5b02-bb0f-4272-e9f6-08df307c217d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|7416014|376014|366016|6133799003|10067099003|22082099003|18002099003|261021121427099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: IlkGxd/j1EtqP2nDi6caI/sRNQQyQXX9XVI9L4mNM/ib3QA0QYXCpRaaQugxQCJtzf+NdWtDNY72qd6fAeoUCaqaVXQeYrzhlp2EF9tQrOOl2thOiNoDhGE7H8lI+yEDHctianIFO4Oaj5tk+XXAklOZ1No1fwh19gep8UeT8PWYpytBjJFtkP+5e3ZXfF/8AF8Nf+N57iSGFXSzQiRaKpYI59j3GRB+Nf2tC/HETtoexOdz1iIalcD/ga1/HpIUYoL5MArVLpk+2agNx27JXXvXY5iq3/H6v4kdGS9HSNzezhv69EE9JA3uFWXDo8gs+wKfZAT4q9L1oDMltiw7MDkC4/UYbFWz7/WnQrKv+2WXN6gOhgs/VEeC4ocJCi3Z5F+6RJRbgPCnbo3HdIupk2oW91uItz3OmUKKKcNmc2JgWl7cW5p2a/suQ236wkuoSL5qfEw3M6tSb64ib/NVbgTNsX9lfykszHkUhZ4110IRU8cQo8OW2OOsJ7Ol84cDM+QZ+yG9FTnM3Ky7gofQ+tdykjJQrUzLrAykOfMpeA4MxWYyafR9rv6qUDSBApQCyvVZsZ77L7LSF6nvg1Gew30d7aOR5B9aGArn+huqKBBp/LEChjJFI6blhPGTwNrO/vyDup57AIoCf0qSCZonEtKdQrpq+ambpebzbPC4nJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(7416014)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(261021121427099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG95MWRoYnBpREZuOWlBZmphdVc3N3NSczBSYjBXNGpuQURHZjF3VWxGZyta?=
 =?utf-8?B?ZDlSOUNjMzBuTzhEelQ0K2ZRbzdrU0dOT00rQlhDR3hvanB5SE1DRktCbE5z?=
 =?utf-8?B?ZC8vcEt6ZkNUZ0k4QlNjV0ZScC8xY1B1aDgxUWV0Z0gwQTJOayt1bjB5bHZJ?=
 =?utf-8?B?KzZveFhsM1hMR0JtWVdNdDF5WTB1ajMxQXhUSVFVYS80aGJLK3ZQZWV5a3pm?=
 =?utf-8?B?WnpPZVoyamdkdjNzdWxiamRsbDg3NFViS0gwUUZQb3RLdjUvNFBMRmMzOFhY?=
 =?utf-8?B?bDhKUlhubkhOQnFEVGJyenpMaFdmVktIcm1nNUVnY3gyZmtQQklENktRMGRN?=
 =?utf-8?B?MGlNdnBQN1VMOG5jSFo3UFpaRlUxSC83WHhSdEpBMk4rUnJFSkVQbzF3YytL?=
 =?utf-8?B?V3dtSWNHTGJ6aGovakx2R0Rub1hYdktoQTVJY0lXQlhKRHkwT2tkdnA5WmFl?=
 =?utf-8?B?dFVObjZLZENVQ0dGN2I0Tm1BemxYbGw3RmpJanJaY1JvaXhzUzRxQjBVbUYv?=
 =?utf-8?B?QmtETDZCV01JZGJpdTFpcFdnc0JqYzE0Z09ncUV0bUh6V2VEdGdBUFNjN1Ay?=
 =?utf-8?B?RFVSYVg4WFI2ZXIwZmdyV1V4WThiOWVkR09uQmt2KzJ3cFMyc3Q5MVJDMTJw?=
 =?utf-8?B?bU9mb1ZKd0M1N3g5QUh4TXdNSzNwcDJ6NWd0dkV6SDFHc0NLdnFVazRxZktN?=
 =?utf-8?B?dkk4RVhOYlpqdnZMOU9wNzYzM0lBcFhHQXFERmtka3k2OTFYbk1WUmdpaFU0?=
 =?utf-8?B?d3NVcGRoTktIc2hJSmt5bHZyTGs3cXUrZG16TitpN0xmQlpHQnpQaXhhdVRo?=
 =?utf-8?B?MnptSFg5cEdpZUF4UFJxZUJGcmR3TmVvTVRFSkM3ak9FQzJrMU9YNnhBQUIy?=
 =?utf-8?B?Z1U4UWg3ZDB6bjhONXFqMUMzc0MzdWtvcC9HVk9hWXpDaWtNNUx6U3B1RHZj?=
 =?utf-8?B?bmx4TlFWMXBoMmVPNnBUYTZlNFc1YVdvWFN6b25DZGJXbmFMYXpyZDF3VDcv?=
 =?utf-8?B?Zmt3dUVLUFNyWENRR2lvekZOVnIyQmJUdUpzd2hzcmc1RHE1MEM1UnpPY3gr?=
 =?utf-8?B?MmhHRnIveEZFSzBqNW9FcjlWMm5YMDRxZVBMaGxHMkdhSGNZT3F0bHBIcnBW?=
 =?utf-8?B?emdBRVRGWjhrNGw4d2xaK0J4QmN2cUMxaWZjT3FUUlJSSGZiL2g5VlNlTXdI?=
 =?utf-8?B?SjhVdWVnWWJ6R1AybEwybFhCZEt4VkZiRkJGM3Z0TnpHdjFmUmtWUGNCTGx3?=
 =?utf-8?B?ZVV1Mmplak01UmlhcWZMY2pxUllOVG9rSnhoT004dkFMaDk5MDE0RURiTXhx?=
 =?utf-8?B?cWhnbDFoTlZRRTJ4akFScFluTXdoemRUaUZ3Z2VBMm9ENDZvRlE4d3oybVdi?=
 =?utf-8?B?SXN2MEhnRTlCT0R1Skx2VGh3SlpienB3ZEZpN0RkYzdZSkdRU2NPcit4MTRP?=
 =?utf-8?B?SVZ3WkljU1dqZHFCc1ZaVG9mR1FwTlY5dCtHelhBcTVaemFEZXJ6QjRhMHN6?=
 =?utf-8?B?UFBwN280aGMxNEtnbzZ6T0NWVDBtVDdSWEZQcldFdW9ENk5ycFpsNWRqbGNW?=
 =?utf-8?B?UXFmOGY5aVA5NlZHaWRyQWQ5MU5mek0wc1ZDY011WXhYNjFlUGp6cWhtV0RH?=
 =?utf-8?B?Q2szZFFhb21DTEdmQXZHM2VpcmxCYm5qOXhPMGxHaElpQUlORUs4cmQyOWU3?=
 =?utf-8?B?Qk82V1MyN3BOTkl1S0hNMW9PWXRBaTVzdGwxY0U5QkJVaHR0aG4zaFFrV2V6?=
 =?utf-8?B?MkUwS3ZpS3FIV09ZRTNYOE92LzAyakpNYXVFMGNXYzZoNG9sQWRJZ2Z0eURh?=
 =?utf-8?B?V0l6Qm5lalFMK3hUUnZDN2VGNnlqRENURlJYeE5tcHlTTjlmcGFuSVROVGt6?=
 =?utf-8?B?Znk4NUNPOVFRdGsyS0RMNlFWMFpKSllkVDNtS2VDc3ZkQ0hlN1JnOUl4RmNu?=
 =?utf-8?B?YVQ2ZlRzRTE0eDduMHVSM1Q2ZVVYR1UwL1c2SVJUZHo5YTM4L0hkUE9MU3ND?=
 =?utf-8?B?MUZUdUk4YUFUdkE1VUxENnVueHZQS2VQejVuKzVPd0NCd202eExXaGNPRXox?=
 =?utf-8?B?WlBjUE5iVmZ6cWFwRE1xN1lOQzNPc0JXeTNNUmJ4bjZMc1ZKeGlrQWhrekRY?=
 =?utf-8?B?VzRSOGlJMk96Z0hSV2luWXY2bkZycERkR2dYZ3ZhdHV3dmV0ejVsQVFoTHB6?=
 =?utf-8?B?eU95U2hDMzBOd1pzN3ZKN0V6UlRkdUd3VzhwRmlFM1pUVUZUVXJQMXFtUG5j?=
 =?utf-8?B?d2ltZ0k5WjUyYklVK1h6SGxzc3dFSnorTnJzQStGYmtwS1VFeWF4clR3b2JJ?=
 =?utf-8?B?RmtrZFJTRXVXTFFoREV0ZXVwRzhvRVoxWDVOdWt4M3A3Nk1mQlB2SG0rZ3U3?=
 =?utf-8?Q?X7Ep231bXLkMsZp/Dcvi2SQ2ZF5TrMgWTzWlE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15eb5b02-bb0f-4272-e9f6-08df307c217d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:36:20.6695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppXubDCiSDUkO5HMvv2dwVJXMVa8MquRK6JYYy9+wYkRU873uqBBC7SrvCX683t5qYkGX7uq0V0D6wKmQohOOvI+Gpz57EM8sNgvf5gMFW/Lo6vGci2Z7+HLHSATFBMI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_133625_224677_AAF8DDC5 
X-CRM114-Status: UNSURE (   9.11  )
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


On Sun, 18 Oct 2026 19:00:07 +0200, Stefano Radaelli wrote:
> The touchscreen interrupt is configured as level-high, causing a
> pending wakeup that prevents Symphony from entering suspend.
>
> Change the interrupt to falling-edge so the board can suspend
> with touchscreen wakeup enabled.
>
>
> [...]

Applied to imx/dt64-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/1] arm64: dts: imx8mm-var-som: fix touchscreen IRQ trigger
      commit: 57a0877fb852d8aa596e410eacd0903f956fab20

Best regards,
--
Frank Li <Frank.Li@nxp.com>

