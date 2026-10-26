Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7142D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0JcUFWc0;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dFtkNSjz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8yn+f7/xPBR45GbhMRQUjqpcIdGoRih5Xrmg69vMj9I=; b=0JcUFWc02bxX/5
	da+EZhl+fHshW1vN1FES4Lt6IDvLh+dkqMlXzGkLJm5mo9s5q1pLuLYDmNAgGbsTcF5a3YhpkK44M
	qlvMOV6xelXZEn4yye/aEa8w5ct1KSHiIwbtHvLPyxuUrszlNB1SvkodRCi0xzPR5QTOqfqRJEm+P
	fp6C/PsJ/z+gdxP9brHSweD+TVM3xnWe7ErvZjPduOOJwLRWKASJIakjMCSENfj+LAyosVCI/jB8e
	wwlsmxQWRGFiRfCFmcg4c875ez5v/bMdOL7d5fyuF42sVafTqotzhCBoVJ6atPQwerncnM2n3nmq0
	LoOlU7Ym8wYSqX2GBLrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJKu-00000002R1L-1Z4I;
	Mon, 26 Oct 2026 11:57:56 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJKo-00000002R11-2iJ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 11:57:54 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261026115739epoutp04f5fdf20744e8b0d7570b961777c04917~iEmymr7Q31639716397epoutp04-
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:57:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261026115739epoutp04f5fdf20744e8b0d7570b961777c04917~iEmymr7Q31639716397epoutp04-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793015859;
	bh=8yn+f7/xPBR45GbhMRQUjqpcIdGoRih5Xrmg69vMj9I=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=dFtkNSjzbIAbdXMTmo3EcYT8iyToFI0EBPZkBeG3uzAx4RsVzmUC9pPsmWingxIQu
	 Ji1FRqAL0f/NPoPuxh2t9CvHIUURD2hkoc0uRwBzg97dnjxJiaJ/rGxej3skOanJFv
	 Y3qVFvWUvTJN5XVh2bquDaDfpzuMUE/sMrRp0mbY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261026115738epcas5p18b2bcee968bbbf08476340af7da6ef1e~iEmxllekR1444514445epcas5p12;
	Mon, 26 Oct 2026 11:57:38 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jCsZ936YGz6B9m9; Mon, 26 Oct
	2026 11:57:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261026115736epcas5p399ee58609e8a2d9584fcd86dc1e5b852~iEmwPv0sJ0063700637epcas5p3T;
	Mon, 26 Oct 2026 11:57:36 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261026115733epsmtip16c43d131d64fca287f1f0c2545ded44a~iEmtNzYCi0993709937epsmtip1t;
	Mon, 26 Oct 2026 11:57:33 +0000 (GMT)
Message-ID: <1acd29ba-c9db-45e3-b7c4-49bf8f8a14b9@samsung.com>
Date: Mon, 26 Oct 2026 17:27:32 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <20261026-talented-wolf-of-karma-8abbbd@quoll>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261026115736epcas5p399ee58609e8a2d9584fcd86dc1e5b852
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
	<CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
	<20261023131501.3157463-2-selvarasu.g@samsung.com>
	<20261026-talented-wolf-of-karma-8abbbd@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_045752_965450_7F782E4C 
X-CRM114-Status: GOOD (  13.23  )
X-Spam-Score: -4.7 (----)
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/26/2026 3:14 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 23, 2026 at 06:45:00PM +0530, Selvarasu Ganesan wrote:
>> +title: Samsung Exynos8855 DWC3 USB controller
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
>> +
>> +description:
>> +  Describes the DWC3 USB controller block implemented on the Samsung
>> +  Exynos8855 SoC.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - samsung,exynos8855-dwc3
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
> interrupts go after clocks, power-domains after interrupts.


Hi Krzysztof,

Thanks for your comments.
My bad, will update in the next version.


>
>> +
>> +  clocks:
>> +    description: |
>> +      Two clocks are used:
>> +       - ref: Reference clock for SOF/ITP generation.
>> +       - bus: Bus (APB) clock for register access.
>> +    minItems: 2
>> +    maxItems: 2
> Instead replace all this with listing items with description. Don't
> repeat constraints in free form text.
>
> items:
>    - description:
>    - description:
Sure, will update the clocks as below in the next version,

     clocks:
       items:
         - description: Reference clock for SOF/ITP generation.
         - description: Bus (APB) clock for register access.

Thanks,
Selva
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ref
>> +      - const: bus
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
> Here you have correct order.
>
> Best regards,
> Krzysztof

