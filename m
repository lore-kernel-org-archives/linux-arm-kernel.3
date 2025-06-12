Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D84EC71143
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 05:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+3sU8wFCjokWIFdBehB5/Y1n0u9uF5QJ5WTUGQAmsc=; b=q7ZttY6EhvKsj2bSWzfECSfd1/
	LtjqgZdBsg3r1pyX0XiMQ2q67Hav5MqCn2x70t40T80Km6VSkbDrAEnasCNzof0eQPbtorQ9b5RGr
	LXT4Czb8/Q5Sjpnr2Mkcn9v+jPX3PZguRTCpjtfeHaow0NSWf/6sxpTHCXFQe3JV7ZFAy/rOen6tj
	q3tMQQCjhL/r/eXM/ldkY+JjPk0FJ66NivzKigqHokaIzSPodAs5zjykkOEDqqccCgNQERheAqRUB
	wM+s4qR7nk6mefIAr+90r6K39HTrfOBCFXfZ43mEUsWI89/kIuGaMaEF2dJTvEDR/DgjDsULonAKC
	SRBkNmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPasV-0000000CGlS-0fvz;
	Thu, 12 Jun 2025 05:53:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPaqN-0000000CGfM-3Vdh;
	Thu, 12 Jun 2025 05:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749707477;
	bh=slvcAQUT+HFsllFYLGyw5Fofz5HxNlsL+2o5mQBM/0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TJiONlJ9E7Ze3sRhwKZBV9R9Z6MEzthUCgwvyz+PCAR+b70XacpHK1Ok/w3otAUFo
	 xcTXGKlAwRPHZ1F6LQYAfijJx8cPS2ocEIIYr5CIe0ASepzhEjtn3vMGn46lxkk2eW
	 8psRt03UkK1YeCc6FFFhyESjq4YJXMdOEo/0/I0ziEoIMbfNowwJy5KPqv/k5cZNgZ
	 MxuwYQMKU4LDB3uCpiJrUHZmeU79iOy4kKyhervclnE+dBW10wK/xsvQM6s/UVMUUa
	 UcN/1JEs4AAex34cYtPmWbGHMbMtJnA49vF7KX6dJwpN6QDEC+iw572cMrnmH9AY6/
	 TKCFRDlv01aYQ==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19B3E17E0863;
	Thu, 12 Jun 2025 07:51:17 +0200 (CEST)
Message-ID: <33376472-679b-406f-aadb-41dd540c47cf@collabora.com>
Date: Thu, 12 Jun 2025 08:51:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add HDMI PHY PLL clock source
 to VOP2 on rk3576
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
 <20250612-rk3576-hdmitx-fix-v1-3-4b11007d8675@collabora.com>
 <6011857.DvuYhMxLoT@trenzalore>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <6011857.DvuYhMxLoT@trenzalore>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_225120_072399_8A05D8EC 
X-CRM114-Status: GOOD (  16.78  )
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

Hi Detlev,

On 6/12/25 3:00 AM, Detlev Casanova wrote:
> Hi Cristian,
> 
> On Wednesday, 11 June 2025 17:47:49 EDT Cristian Ciocaltea wrote:
>> Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
>> char rate via phy_configure_opts_hdmi"), the workaround of passing the
>> rate from DW HDMI QP bridge driver via phy_set_bus_width() became
>> partially broken, as it cannot reliably handle mode switches anymore.
>>
>> Attempting to fix this up at PHY level would not only introduce
>> additional hacks, but it would also fail to adequately resolve the
>> display issues that are a consequence of the system CRU limitations.
>>
>> Instead, proceed with the solution already implemented for RK3588: make
>> use of the HDMI PHY PLL as a better suited DCLK source for VOP2. This
>> will not only address the aforementioned problem, but it should also
>> facilitate the proper operation of display modes up to 4K@60Hz.
>>
>> It's worth noting that anything above 4K@30Hz still requires high TMDS
>> clock ratio and scrambling support, which hasn't been mainlined yet.
>>
>> Fixes: d74b842cab08 ("arm64: dts: rockchip: Add vop for rk3576")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3576.dtsi index
>> 6a13fe0c3513fb2ff7cd535aa70e3386c37696e4..b1ac23035dd789f0478bf10c78c74ef16
>> 7d94904 100644 --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> @@ -1155,12 +1155,14 @@ vop: vop@27d00000 {
>>  				 <&cru HCLK_VOP>,
>>  				 <&cru DCLK_VP0>,
>>  				 <&cru DCLK_VP1>,
>> -				 <&cru DCLK_VP2>;
>> +				 <&cru DCLK_VP2>,
>> +				 <&hdptxphy>;
>>  			clock-names = "aclk",
>>  				      "hclk",
>>  				      "dclk_vp0",
>>  				      "dclk_vp1",
>> -				      "dclk_vp2";
>> +				      "dclk_vp2",
>> +				      "pll_hdmiphy0";
>>  			iommus = <&vop_mmu>;
>>  			power-domains = <&power RK3576_PD_VOP>;
>>  			rockchip,grf = <&sys_grf>;
> 
> I tested this on the ROCK 4D and can confirm that:
>  - New modes like 2K are now working
>  - Mode changes is now correctly supported
> 
> So,
> Tested-By: Detlev Casanova <detlev.casanova@collabora.com>

Thanks for taking the time to perform all these tests!

Cristian

