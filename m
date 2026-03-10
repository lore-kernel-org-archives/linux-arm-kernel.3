Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2E8FCC9DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mJ/CYvCoKAhjgq3TEcyM/swsRMxPmDTwW0efuIyeRM=; b=nRp16boH+aqTwitRSVUWlw2l/C
	zMOKrrx7ty4zttDux123JK6Ws8d1bV84FHJyyz7t3n8Ca0tz0W1Dkhu2gUVf2gYV2/30Z+f2cSKvD
	J8eC0I78/sCV09tQwdYgt2eF2E9Jp4m1PFSstvaOWZqLAkMFKg7u1KVFbaQ9rcVu6zouZVlGQ1snU
	7TyUPgOw5+/+/EWF2QLDzgsqSJBRaqG0rGm8wLHWfPTo6eJI2RqPEyFi+pwe7qhdVUb6HYY+ok/iV
	YV6F20BFhO4ERs+CL1947pY2i1qg+xljXqvdh0QA9rQknG9Pf27PgaoSSkDmoFlxJkJMu6eDCe2A8
	RSCI/6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsas-00000008xE0-1Eta;
	Tue, 10 Mar 2026 08:37:34 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsap-00000008xDM-0wwY;
	Tue, 10 Mar 2026 08:37:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E00E28E78A;
	Tue, 10 Mar 2026 09:37:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773131843; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3mJ/CYvCoKAhjgq3TEcyM/swsRMxPmDTwW0efuIyeRM=;
	b=NCVHHLXkxVQcDwHTu/vDFaqUVetQCoT3BFuouIh0MF/MLd4WD2OsYQUHFaWStkYwheyvte
	BRie/DzNTPKkWKINkU7ePX5+svGm1nLMMlPC4ryuA+b3BaTzKYAHQ1HrEvsL+fGWCVjOdz
	/cXy+9OxtoDVe1VNCl6m6bFts9ohIciioWRRdBYdrUH6y6R1QoRAm0nHm3SicfPMmt9ZoA
	n5b/qT4BEl+ksmXRIDeyNem79+sjGmzqNrZdOMcmpuf0ANdyHrZX44CGnNVpeFo4aOEGkN
	OVVUltbzrcA0VcSmYOii5z933zM0OUFQNrZFriu7DpJt2jyPTy1/46FS+A67iQ==
Message-ID: <b48c07a8-3bc0-401e-9085-fc7030187db0@cjdns.fr>
Date: Tue, 10 Mar 2026 09:37:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 1/8] dt-bindings: clock, reset: Add econet EN751221
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, bhelgaas@google.com, vkoul@kernel.org,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, nbd@nbd.name, ansuelsmth@gmail.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-2-cjd@cjdns.fr>
 <20260310-rousing-tacky-catfish-fcba60@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260310-rousing-tacky-catfish-fcba60@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_013731_736323_EA71285B 
X-CRM114-Status: GOOD (  17.93  )
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


On 10/03/2026 09:21, Krzysztof Kozlowski wrote:
> On Mon, Mar 09, 2026 at 01:18:11PM +0000, Caleb James DeLisle wrote:
>> Add clock and reset bindings for EN751221 as well as a "chip-scu" which is
>> an additional regmap that is used by the clock driver as well as others.
>> This split of the SCU across two register areas is the same as the Airoha
>> AN758x family.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   .../bindings/clock/airoha,en7523-scu.yaml     |  7 ++-
>>   .../devicetree/bindings/mfd/syscon.yaml       |  2 +
>>   MAINTAINERS                                   |  2 +
>>   .../dt-bindings/clock/econet,en751221-scu.h   | 13 +++++
>>   .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
>>   5 files changed, 72 insertions(+), 1 deletion(-)
>>   create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
>>   create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> index a8471367175b..91abe7716fce 100644
>> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> @@ -32,6 +32,7 @@ properties:
>>         - enum:
>>             - airoha,en7523-scu
>>             - airoha,en7581-scu
>> +          - econet,en751221-scu
> 751 < 752, keep alphanumeric order


"econet," after "airoha," because e > a, of course I can order by number 
if that's really what you want.


>
>>   
>>     reg:
>>       items:
>> @@ -67,7 +68,10 @@ allOf:
>>     - if:
>>         properties:
>>           compatible:
>> -          const: airoha,en7581-scu
>> +          items:
> <form letter>
> This is a friendly reminder during the review process.


My apologies, I missed this one when I was collecting notes and 
updating. Will fix.

"Drop items, it's just enum"

Thanks,

Caleb


>
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
>
> Thank you.
> </form letter>
>
> Best regards,
> Krzysztof
>

