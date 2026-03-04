Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B004EFCE4B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 21:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjMldercvQWpYaz8aRXkY6+rLpvGCOQzCKj0YNWBhxU=; b=4vbWtOr4yKtBsCsFjRrIfogWcV
	WGZYrWtsmBy63BxNw64YsB5QsL+KvCeJ4ZSNbbpD8D1CMzx6n4RLCixZZPpbjyKtzWbd/wNezyomA
	MONwRQ8vPgOLggdhr58YBCLpk19hTaI+U8EX5fSSpMlBsxAZU40NCupbxm2VU6P34vYzQSylpB6+a
	VMp3AdmjuJAoFKRGiSOD3Hg2GLPWmiX5tcZEdYEEMQPE4HQJmCKL33qnD/cujaKcW1zwfE1e5mv95
	VAE5SRKRCYf5zr2drfqvOo7XC6uy0JkOcBcEmiZQa3tw59JbckOKwgdwmqD3qe2U7+b2gdasQNH9p
	XHipZiYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtjp-00000000W2K-1bo8;
	Wed, 04 Mar 2026 21:26:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtjm-00000000W1q-2Mp3;
	Wed, 04 Mar 2026 21:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772659591;
	bh=4Xnncoe1im22Gd++O66NN0sXnUSV5WQx7hFdbwwMeuE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=hwVg+qqtO823WxAJrDdekGg0chWwLiX4jglTnkBf8EftMdLJo3X0ERvFktguk0FuT
	 5Myz8LO83G8etw3Kf1o65DY6ajSnktkLk0SVxlNFOV4eXoTEgsyKegFYlrVMaxsqQN
	 ceibHgPOPhD5De4U5ydFOuWo19kTV4oCkD+AjoAwBk52ZNiDYsPmtsel9tz+lv2sD4
	 JUzY1dbGd55uTyFIdCs/RzD+9z9nUCPdFzqO8i0ryksDCvMcOmxENb5hrkUtNYeG5s
	 z6J49eU0YAnrQ9oHoMN1CK934sTfUJGBEpwpCO7DLs8NV4VcVJAwNryRyZggEgMjHA
	 qbTvF6TUanEyQ==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3EFB17E0A2D;
	Wed,  4 Mar 2026 22:26:30 +0100 (CET)
Message-ID: <cce68679-8dcf-4c8d-8a66-df426c037f6c@collabora.com>
Date: Wed, 4 Mar 2026 23:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260227-observant-roaring-ara-ef7eb0@quoll>
 <adbbdbb1-b126-4807-821c-c9850befd695@collabora.com>
 <20260227-omission-stoic-417d7109ad4d@spud>
 <3ab4f91e-37d0-4950-af88-01920705d31a@collabora.com>
 <1fe5529f-cd9f-4960-b6dd-96a2d02b8d86@kernel.org>
 <59b442c8-da2a-40a8-b9db-1609a8eee744@kernel.org>
 <a70731e8-375a-4ba9-b142-600b92ae1087@collabora.com>
Content-Language: en-US
In-Reply-To: <a70731e8-375a-4ba9-b142-600b92ae1087@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_132634_978089_614AA6E2 
X-CRM114-Status: GOOD (  35.28  )
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

On 3/3/26 2:26 AM, Cristian Ciocaltea wrote:
> Hi Krzysztof,
> 
> On 2/28/26 11:58 AM, Krzysztof Kozlowski wrote:
>> On 28/02/2026 10:54, Krzysztof Kozlowski wrote:
>>> On 27/02/2026 18:42, Cristian Ciocaltea wrote:
>>>> On 2/27/26 7:13 PM, Conor Dooley wrote:
>>>>> On Fri, Feb 27, 2026 at 01:37:17PM +0200, Cristian Ciocaltea wrote:
>>>>>> Hi Krzysztof, Conor,
>>>>>>
>>>>>> On 2/27/26 9:46 AM, Krzysztof Kozlowski wrote:
>>>>>>> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
>>>>>>>> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
>>>>>>>> register blocks have been provided for the video decoder unit.
>>>>>>>>
>>>>>>>> However, the binding does not properly describe the new hardware layout,
>>>>>>>
>>>>>>> As you shown me last time with excerpt of address spaces from
>>>>>>> datasheet/manual, the binding correctly describes the hardware and above
>>>>>>> sentence is not true.
>>>>>>>
>>>>>>>> as it breaks the convention expecting the unit address to indicate the
>>>>>>>> start of the first register range, i.e. 'function' block is listed
>>>>>>>
>>>>>>> Imprecise wording. "start of the main or primary register range"
>>>>>>>
>>>>>>> (if you have 0x1000 with one reg and 0x20000000 with everything, the
>>>>>>> unit address will be 0x20000000).
>>>>>>>
>>>>>>>> before 'link' instead of the opposite.
>>>>>>>>
>>>>>>>> Since the binding changes have been already released and a fix would
>>>>>>>> bring up an ABI break, mark the current 'reg-names' ordering as
>>>>>>>> deprecated and introduce an alternative 'link,function,cache' listing
>>>>>>>> which follows the address-based ordering according to the TRM.
>>>>>>>>
>>>>>>>> Additionally, drop the 'reg' description items as the order is not fixed
>>>>>>>> anymore, while the information they offer is not very relevant anyway.
>>>>>>>
>>>>>>> This is fine for me.
>>>>>>
>>>>>> Thanks for the additional feedback!
>>>>>>
>>>>>> If I'm not mistaken (please correct me), the only remaining (hard)
>>>>>> blocker for the series would be to improve this commit message.
>>>>>
>>>>> No, you also need to fix the problem I pointed out about reg-names being
>>>>> optional on the devices you're relying on reg-names for. 
>>>>
>>>> My only concern is that by marking reg-names as required we would break the ABI,
>>>
>>> You are ALREADY BREAKING the ABI. Really, for absolutely non-important
>>> cosmetic change in unit address, where I asked you repeatedly to fix the
>>> unit address, you change the ABI affecting kernel and DTS users.
> 
> I thought we've already reached consensus to allow extending the binding and
> keep both lists, precisely to avoid breaking the ABI.  At least this was my
> understanding according to your reply [1]:
> 
>   You can have also oneOf with older list "deprecated: true", if want to
>   keep any users unaffected.
> 
> And this patch was meant to do exactly that.  Did I miss something?
> 
>>> This is barely acceptable, but I am just annoyed already explain it to
>>> you multiple times.
> 
> There is no need to explain it again, we've got your point.  We've also brought our
> arguments and I had the impression that we eventually agreed to keep the unit
> address unchanged, based on your comments [2]:
> 
>   Yes, with drop of the oneOf this would be fine.
>   I meant, the "one item option" in oneOf.
> 
> Is this not applicable anymore?
> 
>>> But now you claim, you can break ABI for cosmetic unimportant change,
> 
> No, breaking ABI wasn't our intention here.  If we put the issue with reg-names
> being optional aside for a moment (as that one will be handled separately), is
> there still a problem with the current revision?
> 
>>> but actually doing something meaningful is a no-go?
> 
> Making reg-names mandatory has been already clarified with Conor and agreed [3]
> to be handled in a dedicated patch.  And that one will indeed break the ABI, but
> it's unavoidable, unfortunately. 
> 
>>> At least use correct arguments if you want to discuss.
> 
> Sorry, I'm not sure what do you mean.  I really believed that we managed to
> address all the open topics by now.

I've just submitted v5.  For some reason the link to the cover letter [1]
doesn't seem to work, I'm getting:

  Message-ID <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
  not found

But all the others are just fine, e.g. [2] is the for the 1st patch.  I've never
encountered something similar before.

Regards,
Cristian

[1] https://lore.kernel.org/all/20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com/
[2] https://lore.kernel.org/all/20260304-vdec-reg-order-rk3576-v5-1-7006fad42c3a@collabora.com/




