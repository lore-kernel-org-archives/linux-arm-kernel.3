Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23524CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 07:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b612zyZuwwWZsTfE+gJ72Y9isVumaiaCq1dyAr8cbwI=; b=x9Bdg1ncV7sz9UAiDQuMY6utEq
	Ya7FQw/x087Kani1AaAsL1ZGG27qkW4TZLmH9xh+kxmU/KMN2D3rnWwVOlRIS+nAIunLXxx96IgkB
	Y03JggL/gDfMiBNo6CBPBrEAuyun/X47UvirIjNoq45UmWokLfCl3hQC9s8V11vbhJfvLCg3D6Pmu
	pJ69Q0EejMX0rXhXi2M4aYmzzFJrAPZ/NOteGqbM0WgsGB/lBRgl20Mv9lks3IOLGAGCjrqZjIIgy
	emM55WfGswolSSDA2EoNaHZlvulFshgNi6pDe4/Zagr1KPJD0hpc0NpG7Q+9Ek93F32Ie0FDCaU6v
	CElBraxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq5LS-00000005qDG-2S7t;
	Sun, 24 Aug 2025 07:40:54 +0000
Received: from smx-b.mailgw.jp ([210.171.6.216] helo=rmx-b.mailgw.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq5Io-00000005q3E-180z;
	Sun, 24 Aug 2025 07:38:12 +0000
Received: from bccml.bai.ne.jp (bccml-a.bai.ne.jp [210.171.3.161])
	by rmx-b.mailgw.jp  with ESMTP id 57O7bqps028395-57O7bqpt028395;
	Sun, 24 Aug 2025 16:37:52 +0900
Received: from [192.168.11.8] (bai859bcd79.bai.ne.jp [133.155.205.121])
	by bccml.bai.ne.jp (Postfix) with ESMTPA id 9DF3781AA6;
	Sun, 24 Aug 2025 16:37:51 +0900 (JST)
Message-ID: <5c5e6fe7-866c-4b79-bf52-35a393fbeb3d@bcc.bai.ne.jp>
Date: Sun, 24 Aug 2025 16:37:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rm64: dts: rockchip: Enables sound output from the audio
 jack on OrangePI5 Plus
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, robh@kernel.org
References: <20250821041555.4781-2-opi5plus@bcc.bai.ne.jp>
 <AM7P189MB1009A6BCD143F9BE5C3341FAE33CA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Hide Hako <opi5plus@bcc.bai.ne.jp>
In-Reply-To: <AM7P189MB1009A6BCD143F9BE5C3341FAE33CA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-FE-Last-Public-Client-IP: 210.171.3.161
X-FE-Policy-ID: 3:1:2:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=bcc.bai.ne.jp; s=20240516; c=relaxed/relaxed;
 h=message-id:date:mime-version:subject:to:cc:references:from:content-type;
 bh=b612zyZuwwWZsTfE+gJ72Y9isVumaiaCq1dyAr8cbwI=;
 b=e2L96bCAWEGTgj74lXbRoZnxCIbWVL3ppVqDGlL0ZnVtS7RoSJm2HWDELDPzNuqRkIYFGDW1EkJ5
	rpHcIPzY025bY5XYdVQTqXqPXJIGgfV7VWbrEhojVRuwnePBlI83Sew7IpdlAL91zFnWDrnuAVy5
	ieE4VEQrqIqoxC7Vu5j4A+rkFKucGIzVg0AwKXnK971z1rYMff+5hFbB9GCcTKNTaP03rJvyZEb6
	d3rBs8470uc7P0ZW1bJ9bg9Ge0vfA9vu1rB8Ic32JvSApbE5QqIJj3wmoZklAY+CugAfxanWNy0w
	/g7lLA3rXnPXxcislm2I01rkBglnTvpUA4F+HA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_003810_873040_C693967E 
X-CRM114-Status: GOOD (  12.92  )
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

Hello Muad

On 2025/08/23 19:00, Maud Spierings wrote:
> Hello Hide,
>
>> Currently, analog sound is not output from the audio jack.
>> This patch allows you to select analog headphones in alsamixer.
>> Works with kernel 6.16.1, but not 6.17.
>>
>> Signed-off-by: Hide Hako <opi5plus@bcc.bai.ne.jp>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi 
>> <https://lore.kernel.org/all/20250821041555.4781-2-opi5plus@bcc.bai.ne.jp/#Z2e.:20250821041555.4781-2-opi5plus::40bcc.bai.ne.jp:1arch:arm64:boot:dts:rockchip:rk3588-orangepi-5.dtsi> 
>> | 1 +
>>   1 filechanged 
>> <https://lore.kernel.org/all/20250821041555.4781-2-opi5plus@bcc.bai.ne.jp/#related>, 
>> 1 insertion(+)
>>
>> diff 
>> <https://lore.kernel.org/all/20250821041555.4781-2-opi5plus@bcc.bai.ne.jp/#iZ2e.:20250821041555.4781-2-opi5plus::40bcc.bai.ne.jp:1arch:arm64:boot:dts:rockchip:rk3588-orangepi-5.dtsi> 
>> --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi 
>> b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi index 
>> 91d56c34a..656aac2df 100644 --- 
>> a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi +++ 
>> b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi @@ -113,6 
>> +113,7 @@ analog_sound: sound { simple-audio-card,mclk-fs = <256>;
>>           simple-audio-card,bitclock-master = <&daicpu>;
>>           simple-audio-card,frame-master = <&daicpu>;
>> + simple-audio-card,pin-switches = "Headphones"; /*TODO: SARADC_IN3 
>> is used as MIC detection / key input */
>>             daicpu: simple-audio-card,cpu {
>> -- 
>> 2.48.1
> I tried this patch, but I am not able to get any audio out on my 
> headphones. using kernel 6.16.1
>
> I did see headphones in alsamixer, but cannot get it to actually 
> output any audio. Any hints?
I use ubuntu 25.04.
Setting -> Sound -> Output Device.
Two Analog Output-Built-in-Audio are displayed.
Please select second Analog Output-Built-in-Audio.

I'm currently working on another patch. As pointed out by Jimmy, I'm 
creating a patch for rk3588-orangepi-5-plus.dts.
Thank you Muad.

Hide


