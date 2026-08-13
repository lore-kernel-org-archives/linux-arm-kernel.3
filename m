Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F402EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 23:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqzFBeTkl08g07JC6AeT1GoIZHKrk+NcGWCQbDWAixA=; b=allv1UD1JCyNZgZdZwNH+QFYG9
	5//y86ou4ZeZUeYVkBdc0hLGbOPh9mJJBeF4UDGbn3xGqrkK/yM6+AIYjKXcmHsOvASR2mNjcpV6C
	Rc/echcAVAc9cVKdhgabcBMsNGq9LRbFr0yihZRTCzEwUZUYpBvWpZzVMoD3J1m25/NclgKi0LBOl
	rkazUnG+A8qN4N2d3Qsxp7G/qonpx9Q7AVoMz9FYVq/myryx1Q/Cb8OkBVKI9Op7vKIIAfT/QX5w8
	pvwflvWlCHr6EpmAbZ11WxkMITsi8kRnnfW4qtggx5rrxNJ3+MpzAdeb8xy0rGKPVmYaCwQ06pHYn
	7oj9SQcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wufJG-00000001kvu-3bQS;
	Thu, 13 Aug 2026 23:58:06 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wufJE-00000001kvU-0a4O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 23:58:05 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so447215a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 16:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786665483; x=1787270283;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HqzFBeTkl08g07JC6AeT1GoIZHKrk+NcGWCQbDWAixA=;
        b=S6U6aPViEgaSL5Ro/EKGAPwKsgmTSki7BMvMCzv0kOaXXrLNJ/MP3wddXAhUHZaZv1
         1pLR/QNHV52zjqsY+yos/4xigrikve1t9yKrqDuAagsk5rwmwp9u4RZcw5rWG2mKx+vU
         6b1Sv0CvsTYtVi2BGCkZxSj5zDL77Tr4oFJ+Ohek0Rw9dY/zqBWdKkijgxYgWYHwBZBM
         eIZIh7Jyya+ffW/nCQaXe9yVCM5CP06mdrHlPBh76cB2O1tVc63upVZKR0dV/oTVnKZj
         /mIwkImPiLOoOXxVHo28VFEtQIg4OMp1df7dpi4qDtNDwNomO5qSjp2JOu27iNqRwRHI
         El0A==
X-Forwarded-Encrypted: i=1; AHgh+RoRBK+WsGLNb01VFeYMifQflhTK033MH81rXkQmXv8K6+eZG1RSu1wmCNj/fHWgb3WAQFuEBh+JkVeteKhipTsf@lists.infradead.org
X-Gm-Message-State: AOJu0YxPpjCQ0JayRgnyErSyeF/mXTfkpbhIkSZtO5ElxNyPHUnbYKzq
	4HRfoDbmE8SzVP+XpJulrUx5WhKjpkpESgdfsKnsy7zHpthhaOoCXG6OkzCXHvZBN5HsqPVeo6n
	9TiSIO23E6ptCfekLpaGA6yKb2SS5g/+5rddmWXSiBq+e9hMoaWBYHVxho76E4hpmXwH3vgY89f
	RCsC4wZoTJW7zjdPKr/UlCtRJ3QqzayT6xhXIPsw3SEjEXzm/ko9iNqr4rmRXp8tSFgAAtEyX1C
	57oSbIXUWkQKZzfxtt7CqcBzInkni/PkAQ=
X-Gm-Gg: AR+sD119Ms0ejYpntPJLKIYGc+g4bRaWf4t8sfSZ3UJFAniwTYmEP+qJlcYYT2/9VCc
	1WWk5H8CETViUUv/TVan7ABgAp10Tol/YjYZIyxd6j/MGIxAuFPaA2gPvTDiggKGjIEnx/AVJ4l
	j8EZlT2Rb8/tPhPxUywSJoy691Qv8L7B91iX7DCepO4/KvT2/uf3uvyN4DKFWPKjItktIHE23Du
	wq6gJX5kScbqX4GA593Nm3TNlZJhDCF3mRjhthw+FbaSNmMrw6QgLusZUWV2S6hAe/vfXZZIBNF
	naN+W1elEfd8OOfkdYAlOHO8Kx2/xykQU9jPrm2WgtvYg3iFTqdaF4iUEgoUH+Y+C0r1jC38v+D
	sPjkzP4tdUxjtBM8GILnpAGR4o37cKtmFjJ85jBQM3njbIlrzJZJOMg2hjpSyo7HYqMLNtCipT3
	Xtd8MwS/K5lKSQvLgv1cd2NBdxAtGKfzL4VdMfMQ==
X-Received: by 2002:a17:90b:384f:b0:390:b41a:b92f with SMTP id 98e67ed59e1d1-3933e648702mr1376580a91.18.1786665482582;
        Thu, 13 Aug 2026 16:58:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-394ea9943b2sm35833a91.4.2026.08.13.16.58.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2026 16:58:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso405107a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 16:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786665481; x=1787270281; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqzFBeTkl08g07JC6AeT1GoIZHKrk+NcGWCQbDWAixA=;
        b=FL4WKFXBTX/AR67mFy4byUnEP5lajmbFWZ2qBEP7lhmD+WLLqzbB5kZPlL7+L3Y1t5
         417vXYxAruS2iy7PPm+75Wrd+HZCGVfGLlRE2Dk5hiAgrxm8iRR98IwampAplHAA+IfY
         hyNWYvNE4lOcw540CEA48K1TuaLOyNY4HNDkQ=
X-Forwarded-Encrypted: i=1; AHgh+Rpgh1IPDJMlk0mZpjCS2OrdLPjLF30ULiSFKok7C/apWNdZF4vVFQoV2mhm5s3S7NT6R41PuTgr6DnlyX9ql9tV@lists.infradead.org
X-Received: by 2002:a17:90b:5803:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-3933cb3b889mr1708603a91.8.1786665480774;
        Thu, 13 Aug 2026 16:58:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5803:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-3933cb3b889mr1708520a91.8.1786665480115;
        Thu, 13 Aug 2026 16:58:00 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887ee70sm2452391c88.11.2026.08.13.16.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 16:57:59 -0700 (PDT)
Message-ID: <d448dccd-27be-477b-8444-2574f95f7f37@broadcom.com>
Date: Thu, 13 Aug 2026 16:57:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Adding brcmstb-hwspinlock support
To: Kamal Dasu <kamal.dasu@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: robh@kernel.org, krzysztof.kozlowski@linaro.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
 <22348975-bfb1-42c9-9593-06215f961845@broadcom.com>
 <CAKekbevRigjTVMUvbOsnU0rAvWZRZnuqhnxprujvG_k4OFC0HA@mail.gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <CAKekbevRigjTVMUvbOsnU0rAvWZRZnuqhnxprujvG_k4OFC0HA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_165804_329956_44F57EE1 
X-CRM114-Status: GOOD (  17.38  )
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

On 8/13/26 12:25, Kamal Dasu wrote:
> On Tue, Jun 2, 2026 at 11:39 PM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> Hi Bjorn, Baolin,
>>
>> On 4/27/2026 1:12 PM, Kamal Dasu wrote:
>>> This series adds hardware semaphore support for Broadcom set-top SoCs
>>> via the generic hwspinlock framework.
>>>
>>> The semaphore registers live in the sundry block; the DT binding
>>> describes only the semaphore register range. The compatible is
>>> brcm,bcm7038-sun-top-ctrl-semaphore (BCM7038 is where this block first
>>> appeared on set-top chips).
>>>
>>> The driver has been tested built-in and as a module.
>>
>> Is there anything else you would want to see being done differently here
>> or is this ready for being merged into your tree?
>>
>> Thanks!
>> --
>> Florian
>>
> 
> Florian,
> 
> Since there hasn't been a response from the hwspinlock maintainers to
> your ping from May, and given that:
> 
> Krzysztof reviewed the DT bindings (Reviewed-by),
> The series is self-contained under Broadcom STB platform code and has
> no core framework changes,
> 
> Could you please take this series through your Broadcom SoC tree for
> the next merge window?

I want to give Bjorn and Baolin a chance to respond, but would otherwise 
have to seek help from the ARM SoCs maintainers in order to get these 
patches moving forward.
-- 
Florian

