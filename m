Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B212D39000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gU7E9DUC/tzvoHkYBZS23VcZDnNNdcvckzbt+soynXQ=; b=4njylJZWIplVyn8lXBmosCh4kc
	VO5T2S9cUPm393rgmDGHvucatOxZzuSw4ucWelYINer2VzqHA15RhaATFO1OWNbkwmjJCwN46PaZh
	qxy42dGWjcWMA6QpPG8lsyKnn1VdTaD8p5XlUObmy1LvwAQR+amTKnDsF++hhvJpKC3eGlagJBhMW
	m2Tt0fYT4rCpkuAnC89qXOQcdHTblqJvHTSBSBKVOT6qMTfnWdjhXMCVJnhgXxfuQCHHvd/kp4Grl
	/tYXMutAGunWX4RJkCwhmTxIxoDsW9mikD26AF1XMFuWT5toCjxFnBgySR4FI85IILAm/ckY4F/n3
	z9Sq7qNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg51I-0000000ADAy-1ohQ;
	Wed, 14 Jan 2026 17:51:00 +0000
Received: from smtpdh19-1.aruba.it ([62.149.155.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg51F-0000000ACwT-1qYe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:50:58 +0000
Received: from [192.168.50.220] ([84.33.84.190])
	by Aruba SMTP with ESMTPSA
	id g51EvJo0PclBZg51Ev2sWZ; Wed, 14 Jan 2026 18:50:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1768413056; bh=QYH47T3+q1nxGSrtGTBSP5UWkWbV4qDT/rcPu4Xa+Rc=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=eTsFIiwn4gewslrI50V0fn4RWbprop4YjERP65Cb/Jhuru42kavUuBXbfQLd8nW8x
	 znM+EVKD6EMMEO5xct4QxYW30o3H8F9U45I7ddFi0d+3WYnFxGQlbk7tCBMmH3EPHw
	 84dapkXfFDQv4QKqLcxCUs9ClA8FXUpl6KInyGPawLo0+d/L9N8jvtLxAAor0OaFGw
	 XSwzMHiVtSwPnnyXutOSJnxU7k2fXtsG2x2H3jRucfAphQu6lRrBTGLkmAsJ81xxfm
	 jt1cI3WYoGTSta3wmLf7BguaXP3Ks1GuzyHkT9A7ySqoDPhUWmEJRHEX3/cc1CewDT
	 O+OVQu0EvZ6hw==
Message-ID: <9fca977f-4179-44de-b0dd-8e68d57addd4@benettiengineering.com>
Date: Wed, 14 Jan 2026 18:50:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: sun7i: a20: fix MMC index enumeration
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
 <CAGb2v66gpmreQiDMDJ8NE1QJ-e+iBUVicw9sv=RgiwuONfUFAA@mail.gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAGb2v66gpmreQiDMDJ8NE1QJ-e+iBUVicw9sv=RgiwuONfUFAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfI4O5EWksWdoOgtzKoloOwVUZ8Bj6+ptlGREGTz6tAhvPr/Ogj++Q0AR9lt5iCBb1rmZSuXEipnK/dxCtqPH2FkzJWOmpOYqH3E42/49WB6fsiay4zSz
 Vz8sg3phLDYnVUWeib75lZr5qrZNbPuNjsIcKRwd3ZcigeMMV+mD9ykFJ4dUQeKA17Vc1lDJWCGFsPu07hl3phHSQv9qN0VN4S2C/fgl11+9OUW8epQeNNhz
 GXeWpDA8pEeeiYHvVmVVAL2TGTJZU8MpPV+rrhlKuekTUodUgkuuCLexry1kPI7u94pr3nQSZadeSpjFkFehySUK/p5HNQp72kc2wWAKjsWtzKnLsBs2CCqC
 Gh4zGWHtEXojm6435e6b/oTDY5EXsFANYUM9OfabvXUQs37ZRsktuwUAYyp1B7puLcEqkA7koXEG3efBO+MuvhcG89SFD8K8+POeWArZpdZv1vLgAj1e7kd6
 dCW+rASKABkd+d8c5H6puH7FzMJ+Bw2eWVqsHlcFDVuJwYZdt+ZG37UebV6hKeEizqAYtT8QIVnhldPR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_095057_638087_6BA18124 
X-CRM114-Status: GOOD (  12.78  )
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

On 1/14/26 15:07, Chen-Yu Tsai wrote:
> On Wed, Jan 14, 2026 at 6:50 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>>
>> Currently, the OLinuXino-A20-Micro experiences non-deterministic MMC
>> enumeration during boot. When both an SDIO WiFi module (MMC1) and
>> an SD card (MMC0) are present, the kernel may swap their indices.
>>
>> Explicitly define mmc* aliases to ensure consistent device naming
>> and prevent mapping conflicts.
> 
> Years ago we (sunxi maintainers) decided against this.
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 4 ++++
> 
> And aliases are per board, so this definitely doesn't belong here.

I see, thank you for taking care.

Best regards
Giulio

> 
> ChenYu
> 
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
>> index 5f44f09c5545..a958400bcd7c 100644
>> --- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
>> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
>> @@ -55,6 +55,10 @@ / {
>>          #size-cells = <1>;
>>
>>          aliases {
>> +               mmc0 = &mmc0;
>> +               mmc1 = &mmc1;
>> +               mmc2 = &mmc2;
>> +               mmc3 = &mmc3;
>>                  ethernet0 = &gmac;
>>          };
>>
>> --
>> 2.47.3
>>
>>


