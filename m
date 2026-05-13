Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D23CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnzJ4TVV0EX4vf7s1Pl8NhyeeJvaqVqTFCuCq9kgcP0=; b=RqpcR1+mJt9g9ydoEAZMsHm8Tl
	oAbRczydDr6blWe5ibSX12wgYKlKF90Q7ZwF4z5DoTR3JANt2feD4I5QKz672CQdDnUeH2n+yCy0i
	T3zJ3NjSSzuh2IY0k2E55GY2nzRS3xw/0SyPTsapCBJz8fhwSHYxbVwNjiI03hEhOnc4IV1jAxYYj
	rsRodt8jjpJ+nT1derfMwnKayi7tl9HUxOOfjj8g6ZBWcB4Hwm3jhvOfj0+7kFsilsYTyF00Xx1Kh
	Eoc3Nc2KrM1DzLH7+W+QbD28fXO6EoTbrkhgtUFy+Bs+dLSPz+uwJPdHGhMp9kU7VlVKu5xYBH9j4
	w+rCLMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5kF-00000001tHl-1x83;
	Wed, 13 May 2026 09:19:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5kB-00000001tGa-3xaX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:19:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88EC6165C;
	Wed, 13 May 2026 02:18:59 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15E203F85F;
	Wed, 13 May 2026 02:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778663944; bh=saPWjah0HLHCM+YaxUtnkBSyrUnoxwuOOdQv3RhfwtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dp0lKEjqTCnzO3qTka4I2ucQ8tggXkfL5dRAw+ZXV19eZPL5lw5mqRgu0Vjwc4/Od
	 +xwK1qZuG2j4G/5JPv0tilYc81JyCSIp//iuf0VifXoYYfpeoLRDFqHkDpppmUvalw
	 Ahw3GnbTX+4+YFViQC2gh+Uh7NVn1tKI01vfPrZc=
Message-ID: <ee9fca66-d079-4ad7-9cb3-5077e8a4f6d6@arm.com>
Date: Wed, 13 May 2026 11:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20260511221741.25888-1-andre.przywara@arm.com>
 <CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_021908_870468_B109AC57 
X-CRM114-Status: GOOD (  20.44  )
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

Hi Chen-Yu,

thanks for chipping in!

On 5/13/26 07:21, Chen-Yu Tsai wrote:
> Hi,
> 
> On Tue, May 12, 2026 at 6:18 AM Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> The Cubie A5E board comes with 16MiB of SPI NOR flash.
>>
>> Enable the SPI0 DT node and describe the configuration.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
>> index bfdf1728cd14b..7ad22fc85d1fd 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
>> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
>> @@ -344,6 +344,21 @@ &r_pio {
>>          vcc-pm-supply = <&reg_aldo3>;
>>   };
>>
>> +&spi0  {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
>> +                   <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>;
> 
> This whole thing needs to be an overlay. The HOLD and WP pins
> conflict with eMMC usage, so it seems that Radxa only populates
> one or the other.
> 
> If you look at the pictures on their official website, you'll see the
> SPI NOR chip populated, but not the eMMC chip. On the linux-sunxi wiki
> page, you'll see the opposite.

Well, I have a hard time spotting any actual eMMC SKUs in the shops anyway.
But you are right, the hold and WP pins conflict with eMMC, whereas the 
other pins are not.

> And you probably want to enable QSPI, like Sashiko mentioned.

Well, in the interest of keeping this simple and enabling the usage of 
SPI flash for all the users out there, I'd rather drop the extra pins.
This is mostly really useful for booting the firmware, maybe loading a 
tiny kernel or other data once, so performance is not a big concern in 
this use case. The BootROM surely does not use QSPI.

And as you say, if people are really interested in the last bit of 
performance, they can use an overlay.

Cheers,
Andre

> 
> 
> ChenYu
> 
> 
>> +       status = "okay";
>> +
>> +       flash@0 {
>> +               compatible = "winbond,w25q128", "jedec,spi-nor";
>> +               reg = <0>;
>> +               spi-max-frequency = <40000000>;
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +       };
>> +};
>> +
>>   &uart0 {
>>          pinctrl-names = "default";
>>          pinctrl-0 = <&uart0_pb_pins>;
>> --
>> 2.46.4
>>
> 


