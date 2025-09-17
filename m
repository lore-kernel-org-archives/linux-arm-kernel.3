Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94617CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 09:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzRRUL/+P+4FYP9L0VT2fJTeeiEM8fOowNRAIoAFKUk=; b=vGYOFGjJ7Cyr9QSf3bjxfFRAKg
	JiGDnCvOw2sr20VOL5TOAOTFD4MY9r4n0ffWwJsNT6fhb+45Ba+EJBjpPTfrQnP/8NF1Ssy45Pv9j
	u47+BOmuYisk42LpSFTJBPgtWvbxe85u5q/XsZs0IHxr7T+5fRtvWyb6P8d4IHfa5CwCMjrc0PbNV
	0P817QZAtNOdsiTbR3Ezi8xzBXlQu5Z9CXIxJZ1hKQqdQ4jEmynqo+Ssj7MTQx9m3LsdBRAubDtDJ
	/fPIvG53/9rVfQABbzmASgO+B9ELGb1OOPJ5KW5jQIbL4U7DpzD9BVj+uUUbXeIlSkTkw9MvPEC1u
	d6/iwCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyo7G-0000000Ajxx-1msx;
	Wed, 17 Sep 2025 09:06:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyo7E-0000000AjwN-1wKb;
	Wed, 17 Sep 2025 09:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758099974;
	bh=uysw1dHCz2WslwLQVyxUkMNdtoTDG8ekcBjPK/8bbwU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=HuBjnmo5S5KOiTh4tR8/9rfTE7/gh2nfoH91h2NwGzJCfJwBUE1Jz6zRUhljdJjA0
	 yUNLVn0wL0+hM68nwAbRUVyeA6ORBMJKcEV8oyHt7FBxGYUsBzrzRrSQB+6IZS4LYX
	 guY94nP+L4oovufloOu6nT+ArGQVBbTwtjPiY7xvYKzfwqn2L64VLH7K6ggN0N7SHR
	 KcpeUY5d3VtdmDB+79+HNCtFip33Vv+HRdDpt5cmJ4WARce7JgthF621vq2q8Q527J
	 iS3Yv8TOsGH2t30qlt/KVZ3zFcBNJ6hE0pDCqejZ856ZfIZ428u7eE/W4DMf9o8/W9
	 9inEpA0MNHK5A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6E0D17E124A;
	Wed, 17 Sep 2025 11:06:13 +0200 (CEST)
Message-ID: <87179c9f-cc7f-446f-9e8d-c84bddb48660@collabora.com>
Date: Wed, 17 Sep 2025 11:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt7622: add 'serial' cell to
 efuse
To: Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <18af6977cc34de75e64279141dee69dcbc81c420.1758063737.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <18af6977cc34de75e64279141dee69dcbc81c420.1758063737.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_020616_663567_6FF08426 
X-CRM114-Status: GOOD (  15.69  )
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

Il 17/09/25 01:05, Daniel Golle ha scritto:
> The efuse of the MediaTek MT7622 contains an 8-byte unique identifier.
> Add a 'serial' cell covering those 8 bytes to the nvmem defininition of
> the efuse to allow easy access from userspace, eg. to generate a
> persistent random MAC address on boards like the BananaPi R64 which
> doesn't have any factory-assigned addresses.

Sorry, but I don't get why this is named "serial" and not "soc-uuid".

Care to explain?

Cheers,
Angelo

> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt7622.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 917fa39a74f8..0b9803a183b9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -278,6 +278,10 @@ efuse: efuse@10206000 {
>   		#address-cells = <1>;
>   		#size-cells = <1>;
>   
> +		serial@140 {
> +			reg = <0x140 0x8>;
> +		};
> +
>   		thermal_calibration: calib@198 {
>   			reg = <0x198 0xc>;
>   		};



