Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A67CA100B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 05:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwZ6lyeUGPsPUI7Jbg2zCet6AR6fKn/AJZG2hUa1h6g=; b=BjU2NoM7Xj1/4hFqXrhnW48eSn
	O3VcnJkDZQMJjEX2ATDoJlYVecLKtwP3f9Oeq6hVn2OgKm3whftdrlzaQTdEV5+KYs4CWFIoll8L5
	lwxQNO7OEFnOcFRytjqiyzv54TSaLDoiNLKuX5PrFV2x6HHXfQRQnkkMeRqOfN1LWqgJryPLKU6Ek
	jBTYcTEmeJ3UN4fvOQQQ902rYwhr1saHJ5wV9/aley0Wj8MUI6y+rNfY6EhTDNyXQY4eDMFpgnwBF
	yqm4WQVI6/Usi96atIYigLeziZ/xq0JuB1EhYJW5urNZ3dBpO7ByubuMr6k8i/CXswXlHmYwQdSb7
	+0ZM8m3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfzO-00000004CJR-1Yf5;
	Wed, 03 Sep 2025 05:24:58 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfvA-00000004ATP-2giR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 05:20:38 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cGr3X4MGDz9sSC;
	Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqXfjTzkKbXw; Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cGr3X3cvPz9sRs;
	Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 665ED8B764;
	Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id HhVS512OWuWk; Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D82298B763;
	Wed,  3 Sep 2025 06:58:31 +0200 (CEST)
Message-ID: <646c8a39-c78e-4c2c-b820-d7d57e0a85fc@csgroup.eu>
Date: Wed, 3 Sep 2025 06:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
To: Rob Herring <robh@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
 <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
 <20250902212458.GA1184537-robh@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250902212458.GA1184537-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_222036_835585_E419C12C 
X-CRM114-Status: GOOD (  10.90  )
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

Hi Rob,

Le 02/09/2025 à 23:24, Rob Herring a écrit :
> On Mon, Sep 01, 2025 at 02:05:13PM +0200, Christophe Leroy wrote:
>> Convert QE QPIO devicetree binding to DT schema.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v5: New
>> ---
> 
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - fsl,chip-qe-pario-bank
>> +      - const: fsl,mpc8323-qe-pario-bank
>> +

snip

> 
>> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> 
> Doesn't match the schema.
> 

Can you be more explicit ? Is it the 'mpc8360' ? It is the 'chip'.


bindings/soc/fsl/cpm_qe/qe/par_io.txt was saying:

   - compatible : should be "fsl,<chip>-qe-pario-bank", 
"fsl,mpc8323-qe-pario-bank".

Which I first translated in yaml as :

   properties:
     compatible:
       items:
         - enum:
           - fsl,<chip>-qe-pario-bank
         - const: fsl,mpc8323-qe-pario-bank

But 'make dt_binding_check' complained about the < > around 'chip' so I 
removed them.

How should it be described ?

Thanks
Christophe

