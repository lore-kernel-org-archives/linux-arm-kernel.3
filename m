Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C32EFEFB47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLiDRnSaV35IrLpPDDvLBp9e+zJyP+knHmDbnV5+ZcA=; b=bG7Fj0p5fpPH3coh5Eg/xf1Fv/
	WzrxCnqXvrssZfi7XcTzHsTdL2yP3ei+fTczmylHBH/DIdFfwUoPrMbFlSUKiVJj5CP2ZyYR3fyJb
	ZWkKE2Qj/PyfJ6clQl9ZlwSUE8P4qi/GNxne8+coucEvV66XsW5k70TpaRteSDbgZ6FXLh5H2lj3r
	nhwFGeIdU2U+rUPepe9hsu5SYu8xj3eUma+J83vJh4mBvQkGPJntLQnBdLkp2q5YIU7IbIDCv+2I0
	OPHKQi+E80g3YYu6TZVI/rCgZk8gWvJn+9npn49XBlt8pTNdZGfkIALN8MJhVZ1PURB8uwrEdGDGE
	YD9FYioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvxVM-00000008MDb-1yaf;
	Fri, 27 Feb 2026 13:03:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvxVI-00000008MD2-1ubH;
	Fri, 27 Feb 2026 13:03:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADAA1438C4;
	Fri, 27 Feb 2026 13:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C71C116C6;
	Fri, 27 Feb 2026 13:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772197415;
	bh=bERn3UGgISbC0PbmUnSEW/5x9liqJFQrKwBEdBhysS8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T7AihO16oQoaRbGruNs+3F1qNdA1xBl134oPZnqO+JybZGbiDiOXqaOrNO6J/nIPs
	 WwCIiAqY1sOYDs1qeN7jfy82R9I1rU+9V/FmrGDDMVO4HiP2X0M3G5yCP6s/AsHufn
	 EoYXkND1bCNkl1+wHlvoF0gpMM5BVQIvvc3jB2XrrM7uXH6Ds7Qp5PIJIjnzRF3kZi
	 qemM2LAB9KVdXMn0AwgyI8gnLbyLB+Fg57oyYs1DBtpF6FRYmOy5c3JYmsCgpUc589
	 MQVmaaFtT2R25LyecUJ9s0KebZ+ff1WKAJ2vvgWkpcsloBBFtGMeqKloHcmHZnxwd9
	 uYeI+Enc6HPBQ==
Message-ID: <dc2e9e13-165f-4ca1-be29-aabdbf133856@kernel.org>
Date: Fri, 27 Feb 2026 14:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <adbbdbb1-b126-4807-821c-c9850befd695@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_050336_560350_7F722B71 
X-CRM114-Status: GOOD (  22.37  )
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

On 27/02/2026 12:37, Cristian Ciocaltea wrote:
> Hi Krzysztof, Conor,
> 
> On 2/27/26 9:46 AM, Krzysztof Kozlowski wrote:
>> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
>>> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
>>> register blocks have been provided for the video decoder unit.
>>>
>>> However, the binding does not properly describe the new hardware layout,
>>
>> As you shown me last time with excerpt of address spaces from
>> datasheet/manual, the binding correctly describes the hardware and above
>> sentence is not true.
>>
>>> as it breaks the convention expecting the unit address to indicate the
>>> start of the first register range, i.e. 'function' block is listed
>>
>> Imprecise wording. "start of the main or primary register range"
>>
>> (if you have 0x1000 with one reg and 0x20000000 with everything, the
>> unit address will be 0x20000000).
>>
>>> before 'link' instead of the opposite.
>>>
>>> Since the binding changes have been already released and a fix would
>>> bring up an ABI break, mark the current 'reg-names' ordering as
>>> deprecated and introduce an alternative 'link,function,cache' listing
>>> which follows the address-based ordering according to the TRM.
>>>
>>> Additionally, drop the 'reg' description items as the order is not fixed
>>> anymore, while the information they offer is not very relevant anyway.
>>
>> This is fine for me.
> 
> Thanks for the additional feedback!
> 
> If I'm not mistaken (please correct me), the only remaining (hard)
> blocker for the series would be to improve this commit message.
> 
> How about the following:
> 
>     With the introduction of the RK3588 SoC, and RK3576 afterwards, three
>     register blocks have been provided for the video decoder unit instead of
>     just one, which are further referenced in the datasheet by 'link table',
>     'function' and 'cache'.  The former is present at the top of the
>     listing, starting at video decoder unit base address.
> 
>     However, while documenting RK3588, the binding broke the convention
>     expecting the unit address to indicate the start of the primary register
>     range, i.e. the 'function' block got listed before the 'link' one.
> 
>     Since the binding changes have been already released and a fix would
>     bring up an ABI break, mark the current 'reg-names' ordering as
>     deprecated and introduce an alternative 'link,function,cache' listing
>     which follows the address-based ordering according to the TRM.
> 
>     Additionally, drop the 'reg' description items as the order is not fixed
>     anymore, while the information they offer is not very relevant anyway.

Yes, it's fine. My comments were actually not blocking, I just wanted to
wait if discussion with Conor resolves somehow.

But for me anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Best regards,
Krzysztof

