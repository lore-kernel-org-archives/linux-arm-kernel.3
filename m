Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6906FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9uP8cxjGLNlDC8IEuVAZKUw+9vO9WrsgXPNx2Qu4J8=; b=qPKOZeAOChobLNTcPDBInp1Vce
	t44WQ3xrUz12/JnwO9u2ymDQCrIciiQWEuRZyFaVw1vJjkG6B5r7ZoDIPNqMLYKJhBDe+OjtfY4uE
	N1DnnmZ6HO6OYVfxUSc04SHHax5hVfY9HGEKE2TF0t4ceUHSE5cHhjciyG2W3gwyQdAPZsJQbF+Rx
	4hEz9iR0kCYT3Uc4103j7WlqXuRa4JaRu5RHCxNOg+JN6snBClhE9TYX6FeRpNGY7XgMDBbKlfjXf
	8f+ThhIrj7QWmQ/fZPSa7MST+/VGM07MrGX36o+mlT/69WSzO1w6k2gCk0CUCLibbmE+SPORv6QPz
	xRiyfXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPrJ-00000002IvH-1qo7;
	Fri, 22 Aug 2025 11:23:01 +0000
Received: from smx-a.mailgw.jp ([210.171.6.215] helo=rmx-a.mailgw.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIKw-00000001NS0-0cJj;
	Fri, 22 Aug 2025 03:21:08 +0000
Received: from bccml.bai.ne.jp (bccml-a.bai.ne.jp [210.171.3.161])
	by rmx-a.mailgw.jp  with ESMTP id 57M3KnEh030847-57M3KnEi030847;
	Fri, 22 Aug 2025 12:20:49 +0900
Received: from [192.168.11.11] (bai859bcd79.bai.ne.jp [133.155.205.121])
	by bccml.bai.ne.jp (Postfix) with ESMTPA id 1624B8192A;
	Fri, 22 Aug 2025 12:20:49 +0900 (JST)
Message-ID: <d0d7fc7f-d3f5-4375-abc4-c194c5b78c03@bcc.bai.ne.jp>
Date: Fri, 22 Aug 2025 12:20:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Enables sound output from the audio
 jack on OrangePI5 Plus
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250821041555.4781-2-opi5plus@bcc.bai.ne.jp>
 <CALWfF7+rGDxtKDqYyazeh+8bndkyBb8LKe_gMq_EbNycD4mw3w@mail.gmail.com>
Content-Language: en-US
From: Hide Hako <opi5plus@bcc.bai.ne.jp>
In-Reply-To: <CALWfF7+rGDxtKDqYyazeh+8bndkyBb8LKe_gMq_EbNycD4mw3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-FE-Last-Public-Client-IP: 210.171.3.161
X-FE-Policy-ID: 3:1:2:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=bcc.bai.ne.jp; s=20240516; c=relaxed/relaxed;
 h=message-id:date:mime-version:subject:to:cc:references:from:content-type;
 bh=p9uP8cxjGLNlDC8IEuVAZKUw+9vO9WrsgXPNx2Qu4J8=;
 b=bDbcWxBygFWyIUYXw912ssQ4jaYb80gXSXk3Hl+LEmN4HH1ZKhOKkhJUOaDtc07a7wukwvTKE13P
	6oZOXVXfIa4E+/1Zm6IihOKSGAEagfxDQdU3xAZ3+zLxeYSeeVS97JCMO1vYUhPazKP8l+nVkj3V
	7JRo8lTgW7yUjmgFrjqMUjOXBBaRko9DCSF0iqHoGf3Qa+zFEiQSCInR//d43cfWLFi3jDOYzWwJ
	XRZjCELFZgbA46rJ7BraTB5ez6ylspMIGWypXImNQ/17Cb04VzIqeGNZlxcSWfTWPJfWFyCZNQsu
	i9T/X26iZp9erO2/qNx0hmYC/3GbrypfEcMiiA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_202106_752975_522E52CF 
X-CRM114-Status: GOOD (  14.53  )
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



On 2025/08/22 1:49, Jimmy Hon wrote:
> Note: the subject lost the "a" in arm64
Sorry, typo.
>
> On Wed, Aug 20, 2025, 23:19 Hide Hako <opi5plus@bcc.bai.ne.jp> wrote:
>
>> Currently, analog sound is not output from the audio jack.
>> This patch allows you to select analog headphones in alsamixer.
>> Works with kernel 6.16.1, but not 6.17.
>>
>> Signed-off-by: Hide Hako <opi5plus@bcc.bai.ne.jp>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
>> index 91d56c34a..656aac2df 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
>> @@ -113,6 +113,7 @@ analog_sound: sound {
>>                  simple-audio-card,mclk-fs = <256>;
>>                  simple-audio-card,bitclock-master = <&daicpu>;
>>                  simple-audio-card,frame-master = <&daicpu>;
>> +               simple-audio-card,pin-switches = "Headphones";
>>
> For the Plus, it has Speaker and Headphones.
> For the Max and Ultra, they only have Headphones.
For boards with an audio jack, the statement 
"simple-audio-card,pin-switches = "Headphones";" is probably required.
Without this statement, the "Headphones" item will not appear in alsamixer.
> So this property should be defined in the -plus.dts and the -compact.dtsi
> instead of this file which is common to all.
  This patch was created with reference to rk3588s-orangepi-5.dtsi.

Hide


