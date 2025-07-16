Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B7AC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ft3Wq6C1Q+KCfARaoberFidaRltktScsYGYlfSEwaro=; b=UBeCd9DAxD4B6enY3IJ19QwN0y
	EwdBDj3Ab5m35yAxXpravpIlO3wwUEomfpUsnQdQzZu1oK9SAHzjrb23/ZJWZPM4SUyr1yBqX6SEC
	NuPs9l0SNCXCiIy6MipWp3WqxjPfPsNy3Q/5H9a9xR3keTOpP4MQCE1E1uBnrKQl0v0UIV60FCV39
	9S4t9Y4oUu0edjLNjg3b+Lbs5ePyFtRYKeCCB4sInoPIwlp2aEK/zj8HUogK7/gbG17SrcYKGe4OK
	isX9ART+AK9LQV672VEEs4SgipfFhm6+YC9dsYrIed1hvZ8MRUDZY7g0AzBjjzOVx0nfqV/WBCySW
	cwNRY/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4rh-00000008Agn-1SSx;
	Wed, 16 Jul 2025 16:20:17 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4pD-00000008AJF-3Pul
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 16:17:45 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56GGHSMF2540402;
	Wed, 16 Jul 2025 11:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752682648;
	bh=ft3Wq6C1Q+KCfARaoberFidaRltktScsYGYlfSEwaro=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=W5RMj8eTZcR2ac5EvYEJwO2NAMxtLHsyT/FOoaCkkSjCdv0vN0A6aUigg4Xgr70H7
	 THuS9Athxb8CcYb3ckaXDe/helWL0/AN1opyIhptp15Gi9AEB4ihSb3AIQLNztDsli
	 /K8i+zaBYJ3NYnUF4QoeHAg7pT9bglitwhEzDA48=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56GGHR63998251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 11:17:27 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 11:17:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 11:17:27 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56GGHQQ9753586;
	Wed, 16 Jul 2025 11:17:26 -0500
Message-ID: <d76c0299-a19d-4524-b026-79874fee10ee@ti.com>
Date: Wed, 16 Jul 2025 11:17:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] dt-bindings: gpu: img: Add AM62P SoC specific
 compatible
To: Michael Walle <mwalle@kernel.org>, Frank Binns <frank.binns@imgtec.com>,
        Matt Coster <matt.coster@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250716134717.4085567-1-mwalle@kernel.org>
 <20250716134717.4085567-2-mwalle@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250716134717.4085567-2-mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_091743_937895_CDD18A96 
X-CRM114-Status: GOOD (  15.09  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/16/25 8:47 AM, Michael Walle wrote:
> The AM62P and the J722S features the same BXS-4 GPU as the J721S2. Add a
> new SoC specific compatible.
> 

If the GPU is the same, and the integration is the same, do you really need
a new compatible?

> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>   Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 4450e2e73b3c..bad3e412a168 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -23,6 +23,7 @@ properties:
>             - const: img,img-rogue
>         - items:
>             - enum:
> +              - ti,am62p-gpu

There is a check below based on SoC compat:

>  - if:
>      properties:
>        compatible:
>          contains:
>            enum:
>              - ti,am62-gpu
>              - ti,j721s2-gpu
>    then:
>      properties:
>        clocks:
>          maxItems: 1

If you do add a new SoC specific compatible does this check need updating?

Andrew

>                 - ti,j721s2-gpu
>             - const: img,img-bxs-4-64
>             - const: img,img-rogue

