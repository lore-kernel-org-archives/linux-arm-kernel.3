Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B549606D81A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jVo+G23t;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=nNVM0Jf7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yZK/9p/lI0oDfTydxKTTtrPDcqaWpU7s0elEWk4bJa0=; b=jVo+G23t7l2w24
	OWx/z6Z7C19Nue7M1qavKZl/t/fv5xhK8uymd/Ms87RV/5cJFwL+PPP+0WQoytRsrkrpNb7UFpnlc
	awzvZfC33x5o4mUCyksvETezbfqOWVgA5TxZviyqAMOhTJHYnWZiqwmG8ZTSWor8BLU4i2d3yGEJM
	6/zAeaCkxwkw/vOGip+qSaTS3rwgF8fvnK+NZznyTo6NzevZ8XTJfwjoJiWiqqfiLlhgg1EQYkHT2
	UtfkJCudJ+qQ8uY7zE3Pk22K3IFSBndg0RjJxmSyHlnbQwffBa5GbqzqsMp9Z7CeFXKkYOC15FPnY
	av9IHK35nszjD44w/nNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTB-0000000BzuU-3WnM;
	Fri, 06 Nov 2026 10:46:53 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHT7-0000000BzqN-3NXs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:46:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1DeOjzTaZ3RD5HiKafA5RYpsoJ+j2ELP96DnrP1o868c+X7IZK/sh0PP/QUDkX+NujzoWjmxrgt7+xAuuT3m30/X/yCkfh9jrXZ/3AwWSafaZAiFpp+NIZx6G9Sd17AyOZvDR2t4ZCiVmP7TjwkzVcKc0si5iR88HwFxODYXdEHXH2UgqTXee/IUwUYIVmLHtbM0VipUYMHAjbH9e2379FWFCnjZZQSEmu+bBlq8vcYLHT/W5Z17G7HKZ/Xf6Yi6GMD+bVMzpL6ovoBDt8zN2ipXqcpaR4aVu6Q9B2ww1KSWYucPQpsrtW62j/GupMdiSkO3jr1KzL6TtKlXrRgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZK/9p/lI0oDfTydxKTTtrPDcqaWpU7s0elEWk4bJa0=;
 b=owMuHVTgTc9E2yg+bvKasoFwn6v8++MCdcqKtexHCTSZdF78WlckChzQ8/IAKxSYr+rm3v22an2Ge9oKJWAYC4h2fEwFYujNNIgfFU6wD7u1ifwAONjM1607X6RUB8QyawJIOzVnZ0S3+zPh1/mJi8JEfj0siH3QnPIl+Lmd9g8u0H2+LU0Ku/7pGcXaIEqm9BMSFybVu6LfrGehidLyvpxqhE7LZUrccs+m6XyGgVocDjywHVowDq/g7oFQN8dm9nq+XgBMwIE95bpZHYemlZ1py+2LKT1QaBN/k/rxdRQ6Fv30FqNtHAOjZCn8znxiiAEMC9S+bnxeJApmZ5qOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZK/9p/lI0oDfTydxKTTtrPDcqaWpU7s0elEWk4bJa0=;
 b=nNVM0Jf7fg45bZjy47kfhF5ti9T0CiRACM4O3Jk6CY5L4yiOAp/pDRnBVnAZgbI5+de6yju6rQjwfraFNuFfwRnoIC/davfA0d2pVuO1Nj8sT0UrDHWaD1LXtwgfGnqIMcutf/Hs9W05EBhQPRFo0r8VXlXoTsh/DlgIUfIb/28oErrWc50IAUPdBct67Q5uW+tdHLv1fysa94Z4L95DKoe6vJBl3MnvPQJqQrOlrklGU0Xt1Mfh4+aGuUQUA8u/LqR/qjSC309e4C/IrZIaWxkEEOTVg6mpnh2VeXWnkJWHs9oR4dLl+wQkfhWpAG3G+HmiKybMnjaSHSoJud7L1Q==
Received: from WA2P291CA0041.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1f::27)
 by GVXPR10MB8315.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 10:46:41 +0000
Received: from WA1PEPF00009B3E.eurprd05.prod.outlook.com
 (2603:10a6:1d0:1f:cafe::89) by WA2P291CA0041.outlook.office365.com
 (2603:10a6:1d0:1f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 10:46:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF00009B3E.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:46:41 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 11:47:21 +0100
Received: from [10.252.31.114] (10.252.31.114) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 11:46:34 +0100
Message-ID: <795b43bf-f5c4-4b2d-9764-e0a9ae783fdc@foss.st.com>
Date: Fri, 6 Nov 2026 11:46:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
 <20261104-upstream_nvram_reworked-v4-2-144024496a44@foss.st.com>
 <20261106-tireless-cobra-of-passion-1fca1d@quoll>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20261106-tireless-cobra-of-passion-1fca1d@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3E:EE_|GVXPR10MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: ab4f831f-58a1-4f8e-0415-08df3bf33e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|18002099003|6133799003|22082099003|3023799007|10067099003|13003099007|56012099006|4143699003|11063799006|261026140227099003|261009223027099003|261102123227099003|261026121527099003|261021121427099003|261021123027099003|261028144727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: 6irj3x2srs/rmLbe35ypQia31EYBFUIlVzcOf7MB4OyRGJDaXDG/LCTDZgZgtQApQkQAba999W/y23VyNYyt9mvJIzAjVEZsPqih8HhsRmz+v3k5YEFfMK4hNNeWOSL7JbM9gcwcKbK1zmGAJJhDZr3x3YZTtVLk9OXfF2qCmG15TJOtAwu9o6TlcRI2870JY8JnlfbLhuJmuLVnqNVmKp8nvnPtAAcyWQpD6YaA62yzU/oegJE8tfI0HNYceCDTp11LqSLYR6BCOuoT1BPeT0qkhQ2WlCmbFEPRGP+fsimz47wkZilEYUwwDnf9gcIKmnBsK60YBhTfQn93rF09CVbC0JgsNngI6RGnA4QboWT6gXYXduMromdYP5TK0+T12WFhtldlLDlQb7W7RR1fR2lDpS/1eer5O7Qj6AL/9VTzk6fdtT5mpLjvljnMGH3MavQIn0AvbsSCzSgNe5Lj1Fc9MeyCVfXsI6vcCK2/CiSQgO+5S8DJyDmsAD7BZJZ6yjJyWNJFQrcD65tf6A8zy24qcYHW8/UsG5E//cYnNitzxCpCUI1vPEbV+714HWtnB6PDMWa/uWd8vysdLiKs7XuMzj7CFNRtX9PBdi9DHyvl3t3jEydXTVOE7dVscJA6gkObXEiJ0XakVsvrksIuZT+DLjmLXiniosIRaX9sWNQ=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(18002099003)(6133799003)(22082099003)(3023799007)(10067099003)(13003099007)(56012099006)(4143699003)(11063799006)(261026140227099003)(261009223027099003)(261102123227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261028144727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KA2I5Jn5jXraCzflQJWf6YiovFyCvWud97YtTOF0ookjgiodfa71wateoN3CuD/JWQhxKE9n21NfGB47m+Q2drZ18NPqNG4876TXBCYHp2SYDymGyf3WqbJ8i/hHQSH/Wu7oxWntFxO4L1FnpCl1A9wyUkXYt6CS2RD8XwrbNg4+Xxk2DhQQYr6R+WseU3Vkg/kEx9A8nfEPrt/dTKYCL5UP//9G9b/l2kcnXz7PiHwqBc8ZmAMeNdQBeA0Dx45wctvtjPbsQyzONBs/Dd1DDevK4UFXf6Ed91a3uuqCujpK1xphiqQo3YzIbB63CUqcAPf4mgCp5F+27E4f9bD818W6v977MWrZ56qBAk9ywwusdT/9VU5Wxr2F+3PK4qLz8548ODN+wf0RbcurKLafWSMKLj4nNCgl8m16rmFz56N2QjQyVmNjKu6WCuUXlFBI
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:46:41.7531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4f831f-58a1-4f8e-0415-08df3bf33e51
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF00009B3E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024649_886994_57B18F39 
X-CRM114-Status: GOOD (  18.60  )
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



On 11/6/26 11:21, Krzysztof Kozlowski wrote:
> On Wed, Nov 04, 2026 at 04:20:09PM +0100, Patrice Chotard wrote:
>> The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
>> exposes its backup registers through an nvram child node described by
>> nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
>> "#address-cells", "#size-cells", "ranges" and an "nvram@..." child.
>>
>> st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
>> into the DTSI made "make dtbs_check" fail on every STM32MP TAMP node:
>>
>>   tamp@5c00a000 (st,stm32-tamp): 'nvram@5c00a100', 'ranges' do not match
>>   any of the regexes: '^pinctrl-[0-9]+$'
>>
>> Allow the addressing properties and the nvram child, gated on the
>> st,stm32-tamp compatible so the other syscon variants stay strict.
>> "#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
>> (an empty "ranges" requires the node to match its parent) while the
>> other STM32MP SoCs use one.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 38 ++++++++++++++++++++--
>>  1 file changed, 35 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> index a559f8b03b84..51cb565e05ed 100644
>> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> @@ -43,13 +43,19 @@ properties:
>>      const: 1
>>  
>>    "#size-cells":
>> -    const: 1
>> +    enum: [1, 2]
>> +
>> +  ranges: true
> 
> Addition of ranges should be separate commit, because you are fixing
> existing device which can have phy child.
> 
>>  
>>  patternProperties:
>>    "^phy@2[48]00$":
>>      type: object
>>      $ref: /schemas/phy/st,stm32-usb2phy.yaml
>>  
>> +  "^nvram@[0-9a-f]+$":
>> +    type: object
>> +    $ref: /schemas/nvmem/st,stm32-tamp-nvram.yaml
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -84,11 +90,37 @@ allOf:
>>          - phy@2800
>>      else:
>>        properties:
>> -        '#address-cells': false
>>          '#clock-cells': false
>> -        '#size-cells': false
>>          phy@2400: false
>>          phy@2800: false
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: st,stm32-tamp
>> +    then:
>> +      required:
>> +        - "#address-cells"
>> +        - "#size-cells"
>> +        - ranges
> 
> This has ABI impact and is not really necessary, as the child node is
> not required either. Drop these three.
> 

I send this series too quickly, before you made your reply on v3 [1]
[1] https://lore.kernel.org/linux-arm-kernel/b81b8404-572b-4ea4-91ab-6e201f0352b9@kernel.org/

Sorry for that, the v5 is already available on mailing list.

Patrice

>> +    else:
>> +      properties:
>> +        ranges: false
>> +      patternProperties:
>> +        "^nvram@[0-9a-f]+$": false
> 
> Best regards,
> Krzysztof
> 


