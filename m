Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631EEC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJ6W7ONfd3B0fKV4Ska0mkb9ZyQ2o0en1Prq02isjKg=; b=AKWaXqUXug6iIzDzrA9TRzT6ZW
	Gancv28f6LqZXNKRGEL8PtUcmjWeUyamIygvQkUk3Z7qkp/LjezZZRMLBsDKXxAXr9XbYirGqqawL
	AjBRrnEg9adhQaE+xZFPMOimG/HgLXTVl2g8U0TQkbnYjl574sl/2ndNGuz4OSVb7GaLi+pE8dF2Y
	0c75VyDLuRBF+D+nc/TB2D9F2OFiHZDICJeg4/kV+DNZkcKEvRdz4K2lFUwc1DUhrMAPSTMQflexf
	MVYczTnvrhPAz+cz6debxrOkJYBfDg4NmTo5sMNcovQRRPA6yZTGxSBQP3SuUlzI6NcpRd5MBJkub
	6W9kW4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhpp-0000000DMzt-3kyB;
	Thu, 12 Jun 2025 13:19:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfjZ-0000000D5gr-3HuG;
	Thu, 12 Jun 2025 11:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749726275;
	bh=+Ccw5JM2ysrP6p18gVlHfA/xuzZsyf6EShm65BKIUU4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=crVdHEJHZ49tKIM6cQp/sxc/UxQS0Md/A9mrs7WZOkhjq8cTDVp3bXd251kYyZ9ES
	 tIru8QtPCoM+ymTaCYPFVysC2oVFi+IWaKpPZfvhinNeiK5m/MPEGeljYEtCZktkcy
	 KU/RZjdrlRcTyhYOfuZNW+BAyPF1ZiTWe6B4ypKVOqwE9ROhDjFRYIpllSyfFapLc5
	 PMpW7jgXnYZwdrN5Ju3TXOQLHo4Saa6z6zyWdwl9RBrZd9JPyLu0lF5pMa1py3aSEU
	 dHQqmCoTgonMIG6DgcPYqqpehYKSSSwQBV09hbO0Vc6wdyXdncNZKGfflK2gF50f3d
	 QtXM5Fq6DOJJg==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2B0D417E088C;
	Thu, 12 Jun 2025 13:04:35 +0200 (CEST)
Message-ID: <535a4e1c-33d3-4941-8315-df20d4dec799@collabora.com>
Date: Thu, 12 Jun 2025 14:04:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add HDMI PHY PLL clock source
 to VOP2 on rk3576
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
 Andy Yan <andyshrk@163.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
 <20250612-rk3576-hdmitx-fix-v1-3-4b11007d8675@collabora.com>
 <01D5D2D8-392B-4926-884E-1A4FB87C03CF@gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <01D5D2D8-392B-4926-884E-1A4FB87C03CF@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_040437_973283_095E8BAC 
X-CRM114-Status: GOOD (  14.67  )
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

On 6/12/25 1:22 PM, Piotr Oniszczuk wrote:
> 
> 
>> Wiadomość napisana przez Cristian Ciocaltea <cristian.ciocaltea@collabora.com> w dniu 11 cze 2025, o godz. 23:47:
>>
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
>> arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++--
>> 1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> index 6a13fe0c3513fb2ff7cd535aa70e3386c37696e4..b1ac23035dd789f0478bf10c78c74ef167d94904 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> @@ -1155,12 +1155,14 @@ vop: vop@27d00000 {
>> <&cru HCLK_VOP>,
>> <&cru DCLK_VP0>,
>> <&cru DCLK_VP1>,
>> - <&cru DCLK_VP2>;
>> + <&cru DCLK_VP2>,
>> + <&hdptxphy>;
>> clock-names = "aclk",
>>      "hclk",
>>      "dclk_vp0",
>>      "dclk_vp1",
>> -      "dclk_vp2";
>> +      "dclk_vp2",
>> +      "pll_hdmiphy0";
>> iommus = <&vop_mmu>;
>> power-domains = <&power RK3576_PD_VOP>;
>> rockchip,grf = <&sys_grf>;
>>
>> -- 
>> 2.49.0
>>
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 
> Cristian,
> It fixes fractional hd modes for me on rk3576.
> Thx for this fix!

Thanks for testing! :)

