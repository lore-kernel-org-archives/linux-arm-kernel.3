Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3958ACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwYuYWkD6HG/WmASteon2R3SgEbV3PMKCgt21o3VGAc=; b=B4YM/rUHJ047UbsXFhwjK9Jrp6
	WsF2y/FhEVoLs2Dtfhcs9Oa3MB5p/6YbRSzxaTE4631Lutwct9BGONmyACaiH5fZxsNmj103WOhCa
	Ioop8PqBUzXut69vlPO5s4QLzxLFseXwAwHWdOhYXtyVsP3YHcocR6VY3RrJjTZqWS/FjL6tCnCgJ
	CRN3sxwyyO6XCbhhIzDhppjGP//84r3e03JwLgDW8q2jJYYJqVlpMSncW/KRf6jfnMD/hIqqNNIZ4
	sR1rUPmoDEYbufEGRiHzVjW/sbayNeKbFVu+mAzUGp8xPBQwjPNlaRT45BW7cPyo7KkZ6L7km7S5a
	MXCuFTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo19z-00000007oCG-3C6k;
	Mon, 18 Aug 2025 14:48:31 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvZu-00000006yr6-3VnV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:50:56 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55g45CxBz9sWv;
	Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkJOApxeOfnh; Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55g43xC4z9sWt;
	Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6ECF68B764;
	Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id U_Z-I48WiQ0s; Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D1758B763;
	Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
Message-ID: <a14e4ec5-74ff-4f0b-bc26-76c59ecb2357@csgroup.eu>
Date: Mon, 18 Aug 2025 10:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
To: Krzysztof Kozlowski <krzk@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
 <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_015055_056658_44B00C4A 
X-CRM114-Status: GOOD (  18.00  )
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



Le 12/08/2025 à 17:23, Krzysztof Kozlowski a écrit :
> On 12/08/2025 13:02, Christophe Leroy wrote:
>> The QUICC Engine provides interrupts for a few I/O ports. This is
>> handled via a separate interrupt ID and managed via a triplet of
>> dedicated registers hosted by the SoC.
>>
>> Implement an interrupt driver for it for that those IRQs can then
>> be linked to the related GPIOs.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>> new file mode 100644
>> index 0000000000000..7c98706d03dd1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>> @@ -0,0 +1,63 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +
>> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
>> +
>> +maintainers:
>> +  - name: Christophe Leroy
>> +    email: christophe.leroy@csgroup.eu
> 
> Oh no...
> 
>> +
>> +description: |
>> +  Interrupt controller for the QUICC Engine I/O ports found on some
>> +  Freescale/NXP PowerQUICC and QorIQ SoCs.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - fsl,mpc8323-qe-ports-ic
>> +      - fsl,mpc8360-qe-ports-ic
>> +      - fsl,mpc8568-qe-ports-ic
>> +
>> +  reg:
>> +    description: Base address and size of the QE I/O Ports Interrupt Controller registers.
>> +    minItems: 1
>> +    maxItems: 1
> 
> This was never tested but more important this and everything further
> looks like generated by AI. Please don't do that or at least mark it
> clearly, so I will prioritize accordingly (hint: AI generates poor code
> and burden to decipher AI slop should not be on open source reviewers
> but on users of AI, but as one of maintainers probably you already know
> that, so sorry for lecturing).

Yes sorry, overconfidence into AI. Until now I knew almost nothing about 
YAML and the generated file had a good look. I didn't know there was a 
special procedure to test bindings, I thought checkpatch was doing all 
necessary checks.

Fixed in v2.

