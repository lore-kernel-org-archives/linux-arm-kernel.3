Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FAF606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YTkpQjv+;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bh7ND2K3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+ecUGrEiBQtpTLA2IyMy3vDXkj/1N2HQLF4g2UIaYaA=; b=YTkpQjv+/zBfnX
	sE6x22jU4KfHpvHR1Uquda9avmFpDGWbl0eZFShN2Cx3IedwxhbQh0C0GT2TlpHlqKk3rviKPmDl6
	tDlR0jcsDjKIQQXcBvwiV11MSYe6vl+rdDs0AA8pphqrEdt8mc+15uQI4PC9sbbGVpblRFCvgo4ZC
	LVpiQeVFTfghBdJwmqx1jeCqSIxAVJeLzmQ4FO8lA65ncenMfDHw5+fgw5ZH2qY+caamqAWOQoGTq
	tH8tWQF/uLYoqlTZzH3K78yjuZ0fbxzEqcmbrq7yQGyhfalEAPNqKAo1dLZS3vOMc6HlXLVIXWJ7s
	N8tu1U4n/E1eLPxxWGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvnh-00000008gma-2gS6;
	Thu, 05 Nov 2026 11:38:37 +0000
Received: from mail-norwayeastazon11013057.outbound.protection.outlook.com ([40.107.159.57] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvne-00000008gkK-36mG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:38:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzrteTYZOFJwSJWLMlx07ajX2OL9lPcD558QFBFjR6209RcXHxaSdXAV7t57HSsVO/jHvaAjVRV01EgHTBiFrNl8GHY0YALMHcTEHRblCyzZvh95NMYJxidFIDGGZnv3Y7gzoV1rTY5r7nzFpUjCZg2uHnABWZvq1keK1AvTfD+yH0QAVRawhtstoSDatUcfGvrHS9NHyIjTI5rcF0DDpM3kj6NiP0aHVg6yA7mwuMDxGZwqwu2kOVYaqyUwDqBKw+GPECYr6wuviHMUilzviOVvfhpVFIyQuExuuNq0rvFiJjggGfhtkeyRLUf9ph70nK2Xl0fodOw+LafO16U0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ecUGrEiBQtpTLA2IyMy3vDXkj/1N2HQLF4g2UIaYaA=;
 b=iGgQJ+leGfXvCzJRyXpFEsulvBLhGg1/Pf7uQ0/0RtKlUfpl5cuDX98epUWX83jeSA9KKJrwk4WGGuwueDSn6XJ3Sm0OA8zf5LlwHZL5MNolySXq5Whr9daDUkhwZCUreAwL1OV2ZRsCeYmtc30vIDoj9ePAUZS/z1sn66ne5dZ+7g20D09tXSJeXws5nP+tgEX6tA0d+VHrCYtU40fdEn3/4lHBL4c9lzpedT5y57lcv7jbqLKJs32tCfQhtzJdiQ246ulOBssLsSNuXIZLSSFfeVxtQKqotMOzfFpihSOUBwcGF8cpj+3QZ7QSo7NiykIc+AqX9iNR6gNOd9SLnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ecUGrEiBQtpTLA2IyMy3vDXkj/1N2HQLF4g2UIaYaA=;
 b=bh7ND2K3FNQBuAzja3fM6wDeYCeRim6tsQpUMXLz7RBBWT3mdb3C7IzO1ftpCfgwq1VEYqf1cxR4j9G6/XJd53/WoUtgELNEBu5P+v4uwL5uYkfEj6vp52lIJYQclA1H53ZeujDhYK8IUaXem89XDKsEoVqKxld7XA+KTsVpodCTwSFXc4qv4hnUtBjFq8eteoMmVNzH6d+I+t5P6gw3/kfcmh4nnEECPRsx1HfJkq0Vh3dnAwGzNTHagF7pHqoDwLlCOPPwdi969D+INeUUmztlA27Q+OcJV07XbTPX/5dqwhAeeG5CypGPeGDIMmQ7wLkFxnSF5mq+Jf7HkDEiig==
Received: from AS4P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::20)
 by BR0PR10MB879696.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:2c8:2b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 11:38:29 +0000
Received: from AM1PEPF000C1AD8.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::8) by AS4P191CA0014.outlook.office365.com
 (2603:10a6:20b:5d5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 11:38:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1AD8.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 11:38:28 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 12:38:57 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 12:38:26 +0100
Message-ID: <a0ee7ca4-eb50-4b08-9840-134b9ebaf5d8@foss.st.com>
Date: Thu, 5 Nov 2026 12:38:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v3 2/3] dt-bindings: arm: stm32: allow TAMP
 nvram child node for syscon
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Christophe Roullier
	<christophe.roullier@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
 <20261016-upstream_nvram_reworked-v3-2-f65908490cf7@foss.st.com>
 <20261017-valiant-exotic-heron-c0b6e8@quoll>
 <ef5bfb63-4e57-49e0-a1aa-81b5de14a36f@foss.st.com>
 <b81b8404-572b-4ea4-91ab-6e201f0352b9@kernel.org>
 <6103ddea-9ef4-4d02-b41e-ed0b4701250e@foss.st.com>
Content-Language: en-US
In-Reply-To: <6103ddea-9ef4-4d02-b41e-ed0b4701250e@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1AD8:EE_|BR0PR10MB879696:EE_
X-MS-Office365-Filtering-Correlation-Id: 34691bb9-9f84-496a-5518-08df3b314fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261026140227099003|261026121527099003|261028144727099003|261009223027099003|261021121427099003|261102123227099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: 3pl8NMurb/UpdVh6uNkeDcVjJHLG+wrl83q1S2uqttIQgqEHfexrUzK+cUHTnZbh8EoMrIWdyWLzDseebYFl1Ru/OT1r04vZIYkH1Ohknb7LgW669Gqz3yCb5E47EJVk0zLyUYaZRzOG+QyFF/KMpgIaHMHsb9ju6quNaoLKEroXwgKsaovXtxTOwxcL5ytxi/bnWuhxY2qaRu12t4af2PxPeT9nkFrH1WyRs7vojMpKGOt6ccD3BNoe2qEPTFe/SXvwMW0HwW4xisvn5hZMOLW/ROdptqqo1Bl5gDd9TETXhMVY/gwN2knAm+21THWc40WaCZlj87ufa55QFhCasoelJiEAQVRaYLuwovMrCXL+QD/5XMgovT3FoWbxnSYGzE3EsDy1kVYEL5MY6Nq73LghaRMUWQFPvxkKJVPK3vMDkGqAsPM0f3rGSdf/vfPA+U0N4jV9aInvcVcxUP+/5letbo6n5NcxJDc9OzhuBFTEhZGh04bLviA8DqNw3KCNtuWRz7DcvgchZDQNjwLuCvVf+jKm/ouYMM0WfOypYCa4T2c5fVzf/Pn69f9vwBYklJUbhVYHadrJbCkK9IIE2SrG9DLDSIdsr3Md+sx9slYlLj6HfijgBJn1BpWgF2OPKlMm9tCiacXlExIhClqIWg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261026121527099003)(261028144727099003)(261009223027099003)(261021121427099003)(261102123227099003)(261022075727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HqYOvNsgOnGugazxYWMZjBnLhu3MiS+v2NeaFZNK9blf/16B5lX7/DHjIgA/62zgLt9O1LVzZPJ1IFdfqHoFmugJ6f2zybQaHptJ6Xy+HW30BCYbR7568BOxGPeT5HK9/Xu2zm7roj++vLwt4NoK2v71EHm/yNUucWY1sRWffE2+5ZgbOtow8slYe9hu0byTt6WMTLtS+L1koJSLWrfO3znAwIXnAv5CMPIk0pTm+KNjQ9ic89ksZW4p33yDDB5o22trg2f5H6PjiCKbdUH6S5S6EwPdc29Wbp/kl+R9I6CWaQ4yIJjk+0IoJojxUqv+22rJg5BbeF9vayU8wAWEXdGn+iMarzrn5yF3osL452OEu+reX6J///R9kNhqdsEjUb4BWhZStEORJoMi2As4+ayq46UnST0A9j+V4iSrDss7gyRXXapv7Hw6va42047Y
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:38:28.8915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34691bb9-9f84-496a-5518-08df3b314fe5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000C1AD8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR10MB879696
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_033835_051263_75EAE663 
X-CRM114-Status: GOOD (  11.17  )
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



On 11/5/26 11:31, Patrice CHOTARD wrote:
> 
> 
> On 11/5/26 09:17, Krzysztof Kozlowski wrote:
>> On 04/11/2026 14:43, Patrice CHOTARD wrote:
>>>
>>>
>>> On 10/17/26 19:52, Krzysztof Kozlowski wrote:
>>>> On Fri, Oct 16, 2026 at 05:26:04PM +0200, Patrice Chotard wrote:
>>>>> The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
>>>>> exposes its backup registers through an nvram child node described by
>>>>> nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
>>>>> "#address-cells", "#size-cells", "ranges" and an "nvram@..." child.
>>>>>
>>>>> st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
>>>>> reg/clocks/#clock-cells, so wiring the nvram provider into the DTSI made
>>>>> "make dtbs_check" fail on every STM32MP TAMP node:
>>>>>
>>>>>   tamp@5c00a000 (st,stm32-tamp): '#address-cells', '#size-cells',
>>>>>   'nvram@5c00a100', 'ranges' do not match any of the regexes:
>>>>>   '^pinctrl-[0-9]+$'
>>>>
>>>> There are no children of tamp@5c00a000 in
>>>> arch/arm/boot/dts/st/stm32mp151.dtsi. How is it possible to reproduce
>>>> this warning?
>>>>
>>>> Are you using some other patches bugs as a reason of change in bindings?
>>>
>>> Hi Krzysztof
>>>
>>> yes, in this patch [1] arch/arm/boot/dts/st/stm32mp151.dtsi is updated
>>> that's why bindings need this change.
>>
>> You cannot use future code as a bug being fixed.
> 
> Ok, so i will merge this series with https://patchwork.kernel.org/series/1176665/

Don't take care of v4 i submitted yesterday.

Patrice> 
> Thanks
> Patrice
> 
>>
>>
>> Best regards,
>> Krzysztof
> 
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32


