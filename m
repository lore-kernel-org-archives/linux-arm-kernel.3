Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B9C106F30F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwzOn7Js0oppDX7/Xyisc//Eq9xvRdYjWCMbGmFBdtw=; b=cBetiJXayNBRmOL+VJlUqQ/Ob5
	eiB1yl791aBb8em+UAN5VsQd8MynsDxUlqYVf/vParP8p9+7Z13tKhHy8biEE8qozlHvoLlZ1CwNi
	G8Um1cPhaUcQJOyH2rO+JKrsFOhdmZ7sYwOfqCFuuaQmIsp6ZLvvkBfnAjvkCwgLmVxxTZU6qmmZ9
	pR+UyE4t+caZtLPr4WeUYwEF08VIlYkLZUgAahXokV4n1gYQGoPh9jgNDq55BhlV05llo4alV/rZD
	Z4Vun0zsVexKYaEfTRh7a08+8CX4fh2oIntYC40mTSNMWOMDv5HwJenT7Unz7WN3TDKgWLMjSxAqW
	mWheg05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gwa-000000058l1-3F0J;
	Thu, 26 Mar 2026 09:24:00 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gwX-000000058kY-0Bhx;
	Thu, 26 Mar 2026 09:23:58 +0000
Message-ID: <8a55370d-766c-40ee-82cb-f00da92f3069@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774517033;
	bh=BHRxRbvvFb4piaXNRPVBVIb3thJ4Ma0C42kYE+KbYo8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=XtkNLdJdiLgoEhpzUaPHC1QetPRsoNtT2WE0lXpZcnlH5lRZIR0/W+d63ZjAlUnc/
	 cE6TZhPEOpedpxUd0f3Cji+ZVU8iuP4WnQJxS+N4gIQc0Kc9RtPZfjQ+wbemgBYfZr
	 9LDc0tyoAF+FIRP64fIreZZrTQHRIDOvNRJCSuzE=
Date: Thu, 26 Mar 2026 10:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v4 8/9] dt-bindings: net: wireless: brcm: Add compatible
 for bcm43752
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-8-44c7b4a5e459@aliel.fr>
 <20260325170922.GA3822305-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20260325170922.GA3822305-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_022357_380860_ADD9F5CB 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

On 3/25/26 6:09 PM, Rob Herring wrote:
> On Wed, Mar 25, 2026 at 10:15:26AM +0100, Ronald Claveau wrote:
>> Add bcm43752 compatible with its bcm4329 compatible fallback.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Missing Conor's ack.
> 

Thanks for pointing that out, I will add it.

>> ---
>>  Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
>> index 3be7576787644..81fd3e37452a6 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
>> @@ -42,6 +42,7 @@ properties:
>>                - brcm,bcm4356-fmac
>>                - brcm,bcm4359-fmac
>>                - brcm,bcm4366-fmac
>> +              - brcm,bcm43752-fmac
>>                - cypress,cyw4373-fmac
>>                - cypress,cyw43012-fmac
>>                - infineon,cyw43439-fmac
>>
>> -- 
>> 2.49.0
>>


-- 
Best regards,
Ronald

