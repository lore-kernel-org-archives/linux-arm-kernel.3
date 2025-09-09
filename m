Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D5DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 11:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFhQjaX3CwLzX60lVC57V74nziXWr22DPr9UmTglD5E=; b=27m9xrzDojmD7rjpyWgpKF9+jV
	ge2eU0PW8Rk/+VM4wkfAvVeUAI1fq5A/UXiJYpcYsjPa8AGZ4vc/EybwtuBQmufv4k/4j8RBzbc2Q
	z8DXLNGtLiBnAyQNvV1OMY79dh8/jbgdL638m5IoJD/pE7Nr/6FYpupe1oks32IjTw2ExJ4VjPvQc
	/pShyOsO/jBrUZKsXweVVgDc+NxOiRVo3SjyMThKVo3jjYyZsFWo0aFABu5MjSXRfZcJ3psQOwiQz
	gx0T2KaM4/Vu5+PhgVU9GdKyymkU+b071O4ew8+1aWl6rQxwj4VRcWXN7+Abt9Gh+HHZbmXm5P1jy
	86v+yvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwyy-00000006uSe-22sN;
	Tue, 09 Sep 2025 11:57:56 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuWg-00000005uom-3MFH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:20:36 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cLd2s6McVz9sRh;
	Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVtZoeAlc5y4; Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cLd2s55HRz9sRg;
	Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 83A658B766;
	Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vVFyT6NJGbhy; Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D2D438B764;
	Tue,  9 Sep 2025 10:55:46 +0200 (CEST)
Message-ID: <ccb27487-9b3f-489f-bcea-dc5d7cca465e@csgroup.eu>
Date: Tue, 9 Sep 2025 10:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
 <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
 <20250902212458.GA1184537-robh@kernel.org>
 <646c8a39-c78e-4c2c-b820-d7d57e0a85fc@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <646c8a39-c78e-4c2c-b820-d7d57e0a85fc@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_022035_010028_4CC02293 
X-CRM114-Status: GOOD (  16.31  )
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

Rob, Conor, Krzysztof,

Can one of you or someone else help me with below comment from Rob ?

Le 03/09/2025 à 06:58, Christophe Leroy a écrit :
> Hi Rob,
> 
> Le 02/09/2025 à 23:24, Rob Herring a écrit :
>> On Mon, Sep 01, 2025 at 02:05:13PM +0200, Christophe Leroy wrote:
>>> Convert QE QPIO devicetree binding to DT schema.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>> v5: New
>>> ---
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - fsl,chip-qe-pario-bank
>>> +      - const: fsl,mpc8323-qe-pario-bank
>>> +
> 
> snip
> 
>>
>>> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe- 
>>> pario-bank";
>>
>> Doesn't match the schema.
>>
> 
> Can you be more explicit ? Is it the 'mpc8360' ? It is the 'chip'.
> 
> 
> bindings/soc/fsl/cpm_qe/qe/par_io.txt was saying:
> 
>    - compatible : should be "fsl,<chip>-qe-pario-bank", "fsl,mpc8323-qe- 
> pario-bank".
> 
> Which I first translated in yaml as :
> 
>    properties:
>      compatible:
>        items:
>          - enum:
>            - fsl,<chip>-qe-pario-bank
>          - const: fsl,mpc8323-qe-pario-bank
> 
> But 'make dt_binding_check' complained about the < > around 'chip' so I 
> removed them.
> 
> How should it be described ?
> 

Here is what we have in existing DTS upstream:

arch/powerpc/boot/dts/fsl/mpc8569mds.dts- 
compatible = "fsl,mpc8569-qe-pario-bank",
arch/powerpc/boot/dts/fsl/mpc8569mds.dts: 
             "fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/fsl/mpc8569mds.dts- 
compatible = "fsl,mpc8569-qe-pario-bank",
arch/powerpc/boot/dts/fsl/mpc8569mds.dts: 
             "fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/kmeter1.dts- 
compatible = "fsl,mpc8360-qe-pario-bank",
arch/powerpc/boot/dts/kmeter1.dts: 
     "fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/mpc832x_rdb.dts: 
compatible = "fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/mpc836x_rdk.dts-                  compatible = 
"fsl,mpc8360-qe-pario-bank",
arch/powerpc/boot/dts/mpc836x_rdk.dts: 
"fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/mpc836x_rdk.dts-                  compatible = 
"fsl,mpc8360-qe-pario-bank",
arch/powerpc/boot/dts/mpc836x_rdk.dts: 
"fsl,mpc8323-qe-pario-bank";

If the problem in the DT schema is the fsl,chip-qe-pario-bank, should I 
replace it with the two possible compatible we have in existing DTS, ie 
"fsl,mpc8569-qe-pario-bank" and "fsl,mpc8360-qe-pario-bank", or should I 
just ignore them are they are useless for the drivers, or else ?

Thanks
Christophe

