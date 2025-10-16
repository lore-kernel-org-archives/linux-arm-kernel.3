Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3171CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 14:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vqmi7s4EIiMHfK3Naxxo/bu+2H1Uk7/GMfxGBRDNiK0=; b=XZrQ5bgWvP5lAprl6QRoeepBNN
	OghkUDYDMoXD28Pl7cpdAvkf0E/bbT42F5yCkCrHuOrQ/IjLZ0AwEudPbsiYVi718i0B7RRlpKfm2
	5roNmhtXdhcq+y3D8gtDtpUMKU3yMbY9ngzHjyTwboNaTdNxJxNiAhIRF0R1F3ksB4fvqxmEUiNay
	UNw5ABNWc39gp6Ihu1fu79018afV35679rg21U92qU5S+q5DPH6IO7Zis8LHPgPmTcXgaHMIPX1uE
	08wekle/RL3aw2PR2YTgXNZLtXOP1zyVdBPsnACHHR2jAJFzuPy5MkPfHomnNTxG+dwtBIGi3UJUk
	4lfP2RJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Oyo-000000050CK-49un;
	Thu, 16 Oct 2025 14:29:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Oym-000000050BD-2DH7;
	Thu, 16 Oct 2025 14:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760624956;
	bh=/ogrshpBMHpUYx7hds/fD1WgLsoTS+62iSlrqAObxms=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SXqJvaEeN6DpDXxKAJ2nZHAdiOodqfTfzvKAlonZfsIL8ee+R2Jj9dwe4gQG1/8UT
	 ikbDgKu56YCB82nhg8NnwreSXKB/uSxqzstktVanLw+HYEWmpyhhF4IN5iJR8XYk7q
	 yw+2zrYQbGhkyneR7LvmjtU/tXFnjTlororY9q8M0Bnt7ufMdcclUwHujGfpx52hEX
	 Jt/CYp4aWZeHLgd04du5mXg9WrqSRzEky39IAlZ8Zffdf33kq3S347zBoJBlQKrzo4
	 6MeTDZnuykjPgjSBXEN37VJblWROrGp7oN5suST7x0Ikj708rJ923s8OEOFXcyAWpE
	 4XY5LVyF0CVtg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D939117E0125;
	Thu, 16 Oct 2025 16:29:14 +0200 (CEST)
Message-ID: <5f430ff9-d701-426a-bf93-5290e6912eb4@collabora.com>
Date: Thu, 16 Oct 2025 16:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] arm64: dts: mediatek: mt7981b-openwrt-one:
 Configure UART0 pinmux
To: Daniel Golle <daniel@makrotopia.org>, Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, netdev@vger.kernel.org,
 Bryan Hinton <bryan@bryanhinton.com>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-2-de259719b6f2@collabora.com>
 <aPDnT4tuSzNDzyAE@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aPDnT4tuSzNDzyAE@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_072920_727005_959AAA18 
X-CRM114-Status: GOOD (  14.26  )
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

Il 16/10/25 14:38, Daniel Golle ha scritto:
> On Thu, Oct 16, 2025 at 12:08:38PM +0200, Sjoerd Simons wrote:
>> Add explicit pinctrl configuration for UART0 on the OpenWrt One board,
>>
>> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
>> index 968b91f55bb27..f836059d7f475 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
>> @@ -22,6 +22,17 @@ memory@40000000 {
>>   	};
>>   };
>>   
>> +&pio {
>> +	uart0_pins: uart0-pins {
>> +		mux {
>> +			function = "uart";
>> +			groups = "uart0";
>> +		};
>> +	};
>> +};
>> +
>>   &uart0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&uart0_pins>;
>>   	status = "okay";
>>   };
> 
> As there is only a single possible pinctrl configuration for uart0,
> both the pinmux definition as well as the pinctrl properties should go
> into mt7981b.dtsi rather than in the board's dts.

If there's really one single possible pin configuration for the UART0 pins,
as in, those pins *do not* have a GPIO mode, then yes I agree.

If those pins can be as well configured as GPIOs, this goes to board DTS.

Cheers,
Angelo

