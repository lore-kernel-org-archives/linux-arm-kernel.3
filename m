Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3530606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nj33QmlX;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Doyk1PfY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IwFa/IZCEkb2k77E31lZTIY0B5l6h/xTQQXneqWumEc=; b=Nj33QmlXk9eyte
	GKdDfFjqYbYwgXcXyYYSKeM7Nfb/6aPOlrJiWTeXSSlP+DseBGOVCjUkeMiIMpSVjvPPC6E5owb/q
	1NRVJaToALsGx52AOYRRx+PZQc/mWi30seamazorLaUDHlRB1XuCpGjwAnO2C2j+njrGR5Gxb6syT
	t7EbvKF+pI509q0C/s6TeMC+GXDq9GFj4Kx+z8mE+SjhbqBgpJ8XGtOsyMmxcyaVQF7J+D3vy8BY+
	CS87e4XI+9fVZhSagfQ6KS4O1S2WCG+nwA6fmdC+vW+NjeTqhb713NqARTIEq6RhBlWN+kqeISkQc
	kxKc6yZ3GYmRVp5k0wfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHGL-0000000Bwu2-2nMo;
	Fri, 06 Nov 2026 10:33:37 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHGI-0000000BwrW-2m3N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:33:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFXpd64nZWUnu3cHro8zPnb26txOTIt84ytUk2a7fc/uNYLUYtUIsn72ks6ZFhbMJpqZx/yoeunvK2WSJisZXXQcGOw//LiCAqJPnHef0rhhfX+hQsvNcDOS3rg2OL2jlt/mfUf5J6kyoA+Xzqv/sRa6lAPRXlYyOQ/Eo6nx3e0XbwN2h6WL2T9EIuLRGh+p10lMib1pfz/En3YX+BA2p4vJFJbwAsRXHGgj3/SKAYloGNVATzj3xGNTGVJ/F/TchfcI/ybDJNU5/0QczkPW5yQq67LX6OKkYXHMYy4o5WPpQKrfO2HS3qj6M9t2tZvXJDir+dhkPacGYBgsd2qVnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwFa/IZCEkb2k77E31lZTIY0B5l6h/xTQQXneqWumEc=;
 b=HOJZVtfPynyLEHGfctvYli6KtsmTEIxE0tRQPJfcl4nK9c7rxx96sktigikGFtdiZBKe/8/ZVDaILipKqHeT1gL9n+Kd4XcH2iP2ALG/D8D+NSbikb5VMF2aLSjJZIHSThzmB3jc0aBcIZvV3b45HnYgMkraS/UnvFgLp03dae58EBjtc6w9JxYZgXIvRXEThcCxiYODrJH9inogD2xjASZXbMY2RfFBkIPpY4MGj4a7vObYzQtZFlJC8qgF7KQGh/5SbkqBMacr2fZB+3REf56v4TB4c6Bh8ETUuaEEtuS4HY3u9Vbpj3VwAGsYNSeqshRm5LnbbqAaUe3jJM4sWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwFa/IZCEkb2k77E31lZTIY0B5l6h/xTQQXneqWumEc=;
 b=Doyk1PfYKE3Xu7C05LssdibRNgfJMsmyo2ZpQgysQv4n9MUj0g+fosNLRpH0ywiaoOpzzAvltGyt/s0vVnKsXrYzKzKOnjtlWZp+/7pdyAFZgosW7CH+NnXjAeV2k/QnQm/LbwN3HCpMmbJlLBW2D1v7dGIwF4+wDye7+HWRlmVyUvEaYfJDpOFHvR46Db8DCb9BzZZSoGjHuECuz6GBNANLKqNocNibf7Efn90FvNsX+0Xe4a4c/9VRtWzKwOIb1GpW2obBGvX7leAb5wvCwNtvNj7+nnZ7cbwTuGKFxO9Txfxn9LsaXq+YOrdTQATAbHc2QC657guR04LrBdnVkw==
Received: from BE0P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:a::14) by
 DB8PR10MB3130.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:f9::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4; Fri, 6 Nov 2026 10:33:26 +0000
Received: from WA1PEPF000099D0.eurprd04.prod.outlook.com
 (2603:10a6:b10:a:cafe::6f) by BE0P281CA0004.outlook.office365.com
 (2603:10a6:b10:a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.5 via Frontend Transport; Fri, 6
 Nov 2026 10:33:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF000099D0.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:33:26 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 11:34:05 +0100
Received: from [10.252.31.114] (10.252.31.114) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 11:33:18 +0100
Message-ID: <f8a1dacf-f701-4d04-b837-906504d6afa8@foss.st.com>
Date: Fri, 6 Nov 2026 11:33:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: nvmem: add STM32MPX TAMP backup
 registers
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
 <20261104-upstream_nvram_reworked-v4-1-144024496a44@foss.st.com>
 <20261106-truthful-humorous-centipede-bc21ab@quoll>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20261106-truthful-humorous-centipede-bc21ab@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D0:EE_|DB8PR10MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: e3082801-be9a-4e69-86ee-08df3bf16422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|7416014|18002099003|22082099003|10067099003|4143699003|261026121527099003|11063799006|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: 4RCrxcsTsG54ZgZcJ4H6e+VvmIZg2YAA5sm3UZv+i/aQkplIENKpdy04qZtjKL5v9pPoOQ1+YgUyu1/7CKTkhO7kGo17V+LOAtj7GHU4HPYY/byLpjm8aMdfVw6hzFCu9UX3tFy8bMhNppbiY4iB5+4ZBngafNwO/2fYN6uU6siW5zBN3b/lyrHbPPi4uuLoZB+GNXhPH6KOoA867T2vkeUyIh/914rP/L9q+xry2k1uAyQcw7/SSDAM8LKy+Payzp1hZN7tTrZGShTdddx3xXCLFqcov6W0Jdhn9cciwxBQnwTZF6puu6ZsBwiqGVH+AgOtjbFEpdO+qRLil2aKOeEAV9Utx6a1uM4Slvr3ftKP/YUF6iVQUDMTJpgLMKgcPxMP2dtW9kyhFxyTxojNWmfjo9eUQa/SHVihmpEzZEDPrJ+RvV29Y1KbbTeW3qv4DRJyyWiWOClImmOtzgL0QfiNiKzfK1hdPcpNX5EGqhPAhGQW8yMyd1IQQg8GnH9H0DZVMpowpLH48lTS35G5UhU/VQ5nq6EAnOmkq07qDs9XUfOU5a8I+ZaA3WQ4bmu2EtE4Kl7KWEG9gncnYqT2FJSFWGDtRTQy12ZWkswMqOSVQLwPMI6IB/XgbnDRx0KWflVQWKdusul9NTaiMG1Nd7SXtl0oBBf2/z91L4sgPz9KboA/Ixu4GGDQm7cOy/2EglUT8L+tJnR/bWSV4J2Txg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(7416014)(18002099003)(22082099003)(10067099003)(4143699003)(261026121527099003)(11063799006)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aYOyV0aNO+wuVD3QdGaA7lDe++Fp3+P01+YS3RQGx1XL9yQN71IuS5W7YIWG+lUaVCE4wgyCXItXPi1nGlDyQ3eH2uGyaYGeFI5EF3sGOKNuL2P+022n2BxlASGv6++vmTHXKsj8ZGQaXO/VnI2IiJCP6Sew5HjcRqyOZ+ehjmA2XpIrFMkJCuI+/KN0MMLx8Xk/FNV+m/ogR1uEl3b4RNdaviXAWpoesptEfVXfbxrz6ULAUBuiNYK/OVRCOcpy/1uUECXsQKkWZ6mn/hzAPhJaMIKX0h8rpbkI/69ljB/aTYWopfv7nRIQv2xPH/UoKz0yse2wLvwcaElCMiVNiYLVnEKxBpW8KKWughiWzecBtwrGF0/UVLkhKNw4pHYm5eJ2w+HQj/UoBkslEFm/uW03cdRkYRUBh3cyYNoQAD+WrZggkR5w+T0TSeTxx1wl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:33:26.1920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3082801-be9a-4e69-86ee-08df3bf16422
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099D0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_023334_937658_BE5ABD8F 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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



On 11/6/26 11:16, Krzysztof Kozlowski wrote:
> On Wed, Nov 04, 2026 at 04:20:08PM +0100, Patrice Chotard wrote:
>> +      nvmem-layout {
>> +        compatible = "fixed-layout";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        /* Data cells */
>> +        wakeup_sec: tamp-bkp@0 {
>> +            reg = <0x0 0x4>;
>> +        };
>> +        boot_mode: tamp-bkp@50 {
>> +            /*see boot mode selection feature*/
>> +            reg = <0x50 0x4>;
> 
> Mixed up indentation. Please also run scripts/dtc/dt-check-style and fix
> obvious issues.

Hi Krzysztof

scripts/dtc/dt-check-style  doesn't return any errors.

Patrice

> 
> Best regards,
> Krzysztof
> 


