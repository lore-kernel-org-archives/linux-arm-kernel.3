Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE304606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nbUrw0+C;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Ptam/nNY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JT3tCTrzTrFcw681u7leXQfvC2+oYAPdu1cOn0M1xWQ=; b=nbUrw0+Ca2xfQ4
	imZKzsLKNY6VUwI+h7R42Z9r8bvkO0GZoF7AOv8VCi5nmKozr6iH4b6mF3QJ0/S4vypfERetyRyHV
	Jr7WorOvBgwkNDtawO6a9afW9fU4+pxwXqsBgxJyBMrB5DvFH66o2giVQurtsspjOiQqe4y94/Bt8
	+v9epOxzKMiD/JmQ3BnIfv/bgr1mUxaAtp5P3XTYFQClbVRjgZUU23Ro8WHoCQSq3u9fK75ENLZZA
	aEskejNV3EKY0q8+lh7xqEpYtqYsymzCGCM6GKjiYqpR2+/qnap74FRRvLuYDUre6oKvmRh6PRZgf
	zUxcMCJ95jstXvXrP0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObH0-00000005VbN-2BY3;
	Wed, 04 Nov 2026 13:43:30 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObGx-00000005Vak-3HSN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 13:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aF6MgCu0juHltKkY0Q8f9MBHbGgiBByvbGQlc19fNcsS17fiwNdW60QA6lKiI+03RrQl9BfwpbEzKkHOBKAbGR5aWiRNKMt2yYc7cSG1SyOuKSCRP753pxHwpdvNi7twNktDpcLTwYtiOMod99XZt2LrZJwaBjf0UKG/5VJJZoRRIXWuse+nScqNwpY7NWtv5OOLT+iU26yJitH2Xeh6xcUhhB9mYp49rjYtJotsAAnXudzfr/CsqYOMMc6A0B5HXVjNL7FuW8CrVSoNKM44BdIyA9AGhXA5GduZuNC+LtCHpK030riG4JP6mOpeSK1xtrkODJDitkiT9/mAgt38wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JT3tCTrzTrFcw681u7leXQfvC2+oYAPdu1cOn0M1xWQ=;
 b=eLgDWoVS+OU2NH7dmiZFnR0b5SZOP26rZK/T6qgjvj6g8lXKApG6Gy/UqZnHLs8cO8Rlvk5+gdWwvWOXFrNMYPS+qTX64w2ROVtI55eiWwASLdG8/zoI+vi18gFv4tIZ5uOQv8czpUqUdVxOndFlppyywq9k0xs/VovPpUFhlzlg1riBXv0n/TnZEviY22oaOiRbWcllP/TrptA6MEwoHzT1xPUZOvl2i6gR3G7SIhkHGJYZDALiebxzuPqGKzDkIrw4DyUincIja7xXsQAnyguz+BUOxjRoifa8Yh7n4JyhtFOSo9CG6K1R/k0WlDvsscKCSY5IXtYLBmMmtapluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JT3tCTrzTrFcw681u7leXQfvC2+oYAPdu1cOn0M1xWQ=;
 b=Ptam/nNY0UsDC1X6fG/9gBaDpn0aVezGZp7MryQxAi9JvL/eS0lOw89t+N/P9Ff68VCSFMR60zj8ec0aPv4GI/Ssl7oYTNH6Ikdwm5PS2V+11NEJCYKbFCBG+07bLLQIIhCpGPSt/8oR7WWKxg8QktaKrUVGdSBabxeIoxY+X5aoUHiLv7PjPHESoJ37TPFedabhAOImjr/kiMOuNkDaNYb27qgvhZwVfwuttB8L8z/+PYPL9ZX4u/P0om8WAFnEixtwllJIfrG/Egi3tvKVnJrxlDBB5jx6EdztGQnzKISD7MYKTfqRJi/XCOfE5RrnOKvrOy9eu2TFq7E0Ea458Q==
Received: from DU7P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::28)
 by AM7PR10MB3671.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:131::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 13:43:20 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::3b) by DU7P190CA0011.outlook.office365.com
 (2603:10a6:10:550::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 13:43:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 13:43:19 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 14:43:48 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 14:43:18 +0100
Message-ID: <ef5bfb63-4e57-49e0-a1aa-81b5de14a36f@foss.st.com>
Date: Wed, 4 Nov 2026 14:43:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
 <20261016-upstream_nvram_reworked-v3-2-f65908490cf7@foss.st.com>
 <20261017-valiant-exotic-heron-c0b6e8@quoll>
Content-Language: en-US
In-Reply-To: <20261017-valiant-exotic-heron-c0b6e8@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|AM7PR10MB3671:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9a1023-7d14-4715-7f73-08df3a799687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|82310400026|36860700016|5023799004|4143699003|261022105027099003|56012099006|261028144727099003|11063799006|261009223027099003|261026121527099003|261021121427099003|261022075727099003|261026140227099003|10067099003|22082099003|261102123227099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: TjhWadH0wcV2GhDT98azZKlSYa4n06JVvAHxhgczU5WBecebvqO1J9cplJvo4P7gS1P+W6mV/A6VgTCnzUAJaLe8B/rFKJXs4Q4j8q5g+0Ho1Cwh7mijVL3uuumzoXWQg/8xYJofUfh0qwY+++y4ibNC7dWuaZks7b+qRQnI28r6FQyjYp9iq0XPoBWCZN/YCqNPTSTA8uCW6cFNSSyPH+5aexsZWhyy5zXlC5oORoSSyE/HkndCK0S2g4IuoNSkoZruwv8lTYCSagqoi1WxuLn+qskUiEaaCbdpfOKdtaKbnU2Su/OG0/8CIpE5XJuIwltQOiQzelg2WQTNlexF4U+fbsnB+18LFYuoaIbUR9MMYbXPtL0YitwFKtpnUCaD0KL5YM/A6TEDUjGv6usdb7HvoosSEdX89YMau1hU8OAIra+PS5mClmWC/JeW1nEdcr/eRTu/btY/DFOs6TjR2yexzY8mXUz+cETDLkNBWEgZpT2088EcfuTSYasha3+4rk+tQ6guUutBKCYoObT0baSwtrS+UdAI30MQMENTtlgA99qxjUsOk02y2YxyC+62hw30YU76F+/MFH50Y5SeGEeRDaW0gvLQV89at8FPU8dOfgUHfikcy9pi9WfwVWhyEJGdMkvGzwuMvcX/6bST/T4iNOafYNdHMVKJT2PFGm0=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(82310400026)(36860700016)(5023799004)(4143699003)(261022105027099003)(56012099006)(261028144727099003)(11063799006)(261009223027099003)(261026121527099003)(261021121427099003)(261022075727099003)(261026140227099003)(10067099003)(22082099003)(261102123227099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zRYf5QUSa2EevLESDNPzuee4KYrMLD77BTU5xOgluLJ45YhVuc7d9BHN9tXpZUgV1e+lblYiws71GIJ91/xZRPLGq6b+k8LQVu+Jj+JUCrYUl4eVi0MZdVXZ47+ocA5v3VUvFRzrY5aINeLhEy0pRYcmKXoIfBfH/ZmaAJ7qhBQItao7RwRESnztCKzJ1/YfmmXbmoLQK+dsMLZ04V2dP3E4Q4MrLM4+X1/64XilYZbs4Es2qSBURO6MU2E7khEeBLjvkO1S5UPfBr4KUXl7EXoRPUYjs5swxjFunwLcPGchHmbnw9dAGI6LcEOleSKBfn8zlH9S8x7Ue6rO0mAQX+Ch8hQ+SjgBoN50wBMBeERatFBwjLz7hf9Uqx/etYpBxp6ly8sLxYUB5cMv5koYb3QVVuj/EjBCmL8RquL05S45kLw4jeiZnINyG5678zMn
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 13:43:19.9624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9a1023-7d14-4715-7f73-08df3a799687
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_054328_047560_0C07F42C 
X-CRM114-Status: GOOD (  20.85  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/17/26 19:52, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 05:26:04PM +0200, Patrice Chotard wrote:
>> The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
>> exposes its backup registers through an nvram child node described by
>> nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
>> "#address-cells", "#size-cells", "ranges" and an "nvram@..." child.
>>
>> st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
>> reg/clocks/#clock-cells, so wiring the nvram provider into the DTSI made
>> "make dtbs_check" fail on every STM32MP TAMP node:
>>
>>   tamp@5c00a000 (st,stm32-tamp): '#address-cells', '#size-cells',
>>   'nvram@5c00a100', 'ranges' do not match any of the regexes:
>>   '^pinctrl-[0-9]+$'
> 
> There are no children of tamp@5c00a000 in
> arch/arm/boot/dts/st/stm32mp151.dtsi. How is it possible to reproduce
> this warning?
> 
> Are you using some other patches bugs as a reason of change in bindings?

Hi Krzysztof

yes, in this patch [1] arch/arm/boot/dts/st/stm32mp151.dtsi is updated
that's why bindings need this change.

See the complete series [2]. 

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260930-upstream_tamp_nvram_dts_part-v2-2-bd73158ce46b@foss.st.com/
[2] https://patchwork.kernel.org/series/1176665/
> 
>>
>> Allow the addressing properties and the nvram child, gated on the
>> st,stm32-tamp compatible so the other syscon variants stay strict.
>> "#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
>> (an empty "ranges" requires the node to match its parent) while the
>> other STM32MP SoCs use one.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 30 ++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> index 95d2319afe23..1aeb54867db2 100644
>> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> @@ -39,6 +39,23 @@ properties:
>>    "#clock-cells":
>>      const: 0
>>  
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    enum: [1, 2]
>> +
>> +  ranges: true
> 
> You work on some weeks old tree.

Indeed, this series need to be rebased on top of v7.4-rc1

Thanks
Patrice

> 
>> +
>> +patternProperties:
>> +  "^nvram@[0-9a-f]+$":
>> +    type: object
> 
> additionalProperties true with ref or false with a compatible, just like
> every other binding. See also display/msm for some examples.
> 
>> +    description:
>> +      TAMP backup registers exposed as an NVMEM provider. See
>> +      nvmem/st,stm32-tamp-nvram.yaml.
>> +    required:
>> +      - compatible
> 
> Best regards,
> Krzysztof
> 


