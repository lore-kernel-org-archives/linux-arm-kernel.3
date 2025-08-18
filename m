Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00407CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmbMvHYcAKL1oYjNvx32A9vsyDt9UugS1sYtvrJfCXQ=; b=mU2MFRvv9aFsti8ODvCpPrP+8S
	PZZvnZoqulaQ9i1LizJgyjAaGzEah97ZboVOSpcg/CSM3z7skAsnHRwWeDuTywydZaghb2kjhY4LQ
	FsZDbc3an67z6GhjEYO6UjqFG9NnDglUe4iAaNOmiiJDHLC6CjJZRs8O/ofbIo+TgIW7qa0KIF05E
	ny9tg7+fkEtNVD7HtauC9KA4O63RYVpI40W7PZt4gSZbGzNmUC0zMTreoaPEbk2le9r9+hPi0+QXh
	53SD9a2ajgXQbaw6DZuo9E1tW9Sy8jRhrMpU78RuQJpL/6UKPkHZNam9OKztD+cYJJNSjh/hjzIC4
	V+L7u9UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo04t-00000007Wtx-2v2f;
	Mon, 18 Aug 2025 13:39:11 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvZh-00000006ypW-3PUI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:50:43 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55kL3mnlz9sWd;
	Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0_Y38SyLNAT; Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55kL2Zsnz9sWc;
	Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AE7D8B764;
	Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0VXbaU8cA_eG; Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E12538B763;
	Mon, 18 Aug 2025 10:39:53 +0200 (CEST)
Message-ID: <88b259e8-433f-49f1-a25b-f65a40c8da65@csgroup.eu>
Date: Mon, 18 Aug 2025 10:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
 <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
 <CAL_Jsq+1Aw5AyBeW+BhTuyWZ8BN8BJUq047oJCDKVQPZWxWYCA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CAL_Jsq+1Aw5AyBeW+BhTuyWZ8BN8BJUq047oJCDKVQPZWxWYCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_015042_023763_B11EAB17 
X-CRM114-Status: GOOD (  17.89  )
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



Le 12/08/2025 à 19:16, Rob Herring a écrit :
> On Tue, Aug 12, 2025 at 10:23 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 12/08/2025 13:02, Christophe Leroy wrote:
>>> The QUICC Engine provides interrupts for a few I/O ports. This is
>>> handled via a separate interrupt ID and managed via a triplet of
>>> dedicated registers hosted by the SoC.
>>>
>>> Implement an interrupt driver for it for that those IRQs can then
>>> be linked to the related GPIOs.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
>>>   1 file changed, 63 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>> new file mode 100644
>>> index 0000000000000..7c98706d03dd1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>> @@ -0,0 +1,63 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +
>>> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
>>> +
>>> +maintainers:
>>> +  - name: Christophe Leroy
>>> +    email: christophe.leroy@csgroup.eu
>>
>> Oh no...
>>
>>> +
>>> +description: |
>>> +  Interrupt controller for the QUICC Engine I/O ports found on some
>>> +  Freescale/NXP PowerQUICC and QorIQ SoCs.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - fsl,mpc8323-qe-ports-ic
>>> +      - fsl,mpc8360-qe-ports-ic
>>> +      - fsl,mpc8568-qe-ports-ic
>>> +
>>> +  reg:
>>> +    description: Base address and size of the QE I/O Ports Interrupt Controller registers.
>>> +    minItems: 1
>>> +    maxItems: 1
>>
>> This was never tested but more important this and everything further
>> looks like generated by AI. Please don't do that or at least mark it
>> clearly, so I will prioritize accordingly (hint: AI generates poor code
>> and burden to decipher AI slop should not be on open source reviewers
>> but on users of AI, but as one of maintainers probably you already know
>> that, so sorry for lecturing).
> 
> If anyone needs some AI (chatgpt) converted bindings, my "dt-convert"
> branch has ~800 of them. Feeding the warnings back to AI to fix was
> somewhat effective. The result is not the worst I've seen submitted.
> It saves some of the boilerplate, but can't fix things that are just
> wrong or unclear in .txt bindings. Despite my 'prompt engineering'
> attempts, it still tends to get the same things wrong over and over.

By the way, the new binding was not generated from text binding. I fed 
the AI with the driver C source file.

Christophe

