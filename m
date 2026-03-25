Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E65FEA834
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFHJenL92LrKfWG62GkJFLz3dOe+dw9s6P5bqmfdd1g=; b=nUeoXscppzRlsSNjrKXtLjrioV
	RsSpjZ7BjwHHoe7ZQt8zzrQB5oKzHQUDfUzz5NzPhiUR7Y+p7cdcXQSL/h3yEi9XKY7lpqxNghnG3
	UDtqXUxXSElej/XqqqPzWPGq10wXI63fBaQe9o0SYeHifE6ZfsOXWDkjlvPwemayDZsnFoH28HqWZ
	+gCavpxbZepyqdQtbqvofXp/mTjB7txknrlk1fxYUwBYRF7K3WaUz/EOh59L4WGuDjh6cAyVxmSeR
	rDeWHBtfhuGcNqxCnxayV2ux8LWOUrrUSkb8eUU2hF92Innt2d41UWioJ76THnDaRszCG94s5DUML
	jxD2npjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Js5-00000002yea-13m3;
	Wed, 25 Mar 2026 08:45:49 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Jry-00000002ydv-3AdO;
	Wed, 25 Mar 2026 08:45:46 +0000
Message-ID: <2c63a66c-8562-48d5-ac25-50359de3ad8b@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774428337;
	bh=EbpGoxqQXt+Kk2/8U5yoMgWyFVaTQNOoOx8b2j6G0us=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=QoTeywTx0cyBayxdpZrL++1gsw2TV/mGYRha6OoPqh2MWI4qe86v7yv0IaGWjfsgD
	 vUHRmtZyEyZ+HLcQw8qqsDlx1zxXOXLy8hQWTFHQg6WzvuXNK4giOmZKw/+zavaxT8
	 q9S9AX8y/ZNWIRI0QT0BWC0Pfe1Wn7//P/Qpnh3Y=
Date: Wed, 25 Mar 2026 09:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v3 2/9] dt-bindings: mmc: amlogic: Add compatible for T7
 mmc
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
 <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
 <c01c4e7e-1c0c-4bbf-b126-831160c8e32b@amlogic.com>
Content-Language: en-US
In-Reply-To: <c01c4e7e-1c0c-4bbf-b126-831160c8e32b@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_014545_006984_D4DDF671 
X-CRM114-Status: GOOD (  12.51  )
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

On 3/25/26 3:38 AM, Xianwei Zhao wrote:
> Hi Ronald,
> 
> On 2026/3/23 17:55, Ronald Claveau wrote:
>> Add amlogic,t7-mmc compatible string, falling back to amlogic,meson-
>> axg-mmc
>> as the T7 MMC controller is compatible with the AXG implementation.
>>
>> Signed-off-by: Ronald Claveau<linux-kernel-dev@aliel.fr>
>> ---
>>   Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 5
>> ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>> b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>> index 57646575a13f8..40dccf9715781 100644
>> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>> @@ -19,7 +19,10 @@ allOf:
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - const: amlogic,meson-axg-mmc
>> +      - items:
>> +          - enum:
>> +              - amlogic,t7-mmc
>> +          - const: amlogic,meson-axg-mmc
> 
> It seems that break API here.
> One item should be added here instead of being replaced.
> 

Thanks Xianwei, ok I will change that in a new version.

>>         - items:
>>             - const: amlogic,meson-gx-mmc
>>             - const: amlogic,meson-gxbb-mmc
>>
>> -- 
>> 2.49.0


-- 
Best regards,
Ronald

