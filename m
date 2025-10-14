Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F0BCCD196
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gB55HFhQxEZJTXXfL20cEZvtXoUBSpDyye9zlq+B10=; b=XZJ1CBd5L4DvQigpjHa2/abvvl
	STzbaeCNKFz1k2yWminbdYvAScnk0O0LCLdg5F2Qep7N9i0HUQ8zssvmFinrAz0hYcf+edOzOxucs
	4NDA7su5VAeLubxlbSnIt4nCL1hEXuBTuP6172JJiC1miDW1WhHQkbwMeLm01O+xufcPUG7L+/kzq
	pWvxLYpqVf5zq5Mp+8R2WchexEL3U2P2I/azy/1gjYSO/FEReNRFuLt+ENWxpHhzDtnH7fE9MrqQL
	SDczRnGc2/7gC49CnioYTF1Oz4k1XtRGpZXmIKumcyzShdAyr0d1/RrRuF3OJ9p7CvskOA3OveiK0
	5R+5hPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8f3X-0000000GTng-1jfo;
	Tue, 14 Oct 2025 13:27:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8f3U-0000000GTkz-2bCf;
	Tue, 14 Oct 2025 13:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760448426;
	bh=URTgDDEhtyvhh20SZd95qIetjf6RT09dnrFHc1mT5yY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R0subUQTKkUjsYFUrp4t9i7bjvtPMdoSjRRftGhYs4pDdiLtrzSdydUFADaj6iRQg
	 Jx5aGaobFBEk5a82pwyyfUmMAxeVKGZk1zFj06FxkpTTGYbxTtqy+LTS3VIv26DYe5
	 UNrP4QKwD96LFbyrljtNX+kSoP3LESCK5qCaY3D/8r3SPRvrZfakj+5gvh3/vpBMsZ
	 nyX2JSvj5t1uPF+OssXbdwtZ6DA1aivsWC+SbimzN06wKhA7ltbGe4b+xUxSBvcsB0
	 VFzifRvqTsLzpZ4NMoDLOG/qE6rLi1nvGh9ePTh6oVrz5HR6NWIDrgSq36StT1LFqk
	 J3o3rNaBxnXZQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3230017E129E;
	Tue, 14 Oct 2025 15:27:06 +0200 (CEST)
Message-ID: <b20a1c7d-0da5-433b-987c-f55a5a229bed@collabora.com>
Date: Tue, 14 Oct 2025 15:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP
 core
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fei Shao <fshao@chromium.org>
References: <20250814092510.211672-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250814092510.211672-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_062708_848841_4860F416 
X-CRM114-Status: GOOD (  13.09  )
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

Il 14/08/25 11:25, Chen-Yu Tsai ha scritto:
> The first SCP core is used to drive the video decoder and encoders.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Added SCP vreq pin
> ---
>   .../boot/dts/mediatek/mt8188-geralt.dtsi      | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> index c5254ae0bb99..7fedbacdac44 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -164,6 +164,12 @@ reserved_memory: reserved-memory {
>   		#size-cells = <2>;
>   		ranges;
>   
> +		scp_mem_reserved: memory@50000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x50000000 0 0x800000>;
> +			no-map;
> +		};
> +
>   		apu_mem: memory@55000000 {
>   			compatible = "shared-dma-pool";
>   			reg = <0 0x55000000 0 0x1400000>;
> @@ -1077,6 +1083,13 @@ pins-bus {
>   		};
>   	};
>   
> +	scp_pins: scp-pins {
> +		pins-scp-vreq {
> +			pinmux = <PINMUX_GPIO98__FUNC_O_SCP_VREQ_VAO>;
> +			bias-disable;
> +		};
> +	};
> +
>   	spi0_pins: spi0-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO69__FUNC_O_SPIM0_CSB>,
> @@ -1146,6 +1159,18 @@ &postmask0_out {
>   	remote-endpoint = <&dither0_in>;
>   };
>   
> +&scp_cluster {
> +	status = "okay";
> +};
> +
> +&scp_c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&scp_pins>;
> +	firmware-name = "mediatek/mt8188/scp.img";

After a (very brief) discussion with Arnd last time, turns out we decided to avoid
using the firmware-name property, including for mtk-scp.

Please resend without firmware-name.

P.S.: there's a patch to construct the firmware name from compatible...
https://lore.kernel.org/r/20250911140043.190801-1-angelogioacchino.delregno@collabora.com

Cheers,
Angelo

> +	memory-region = <&scp_mem_reserved>;
> +	status = "okay";
> +};
> +
>   &sound {
>   	pinctrl-names = "aud_etdm_hp_on", "aud_etdm_hp_off",
>   			"aud_etdm_spk_on", "aud_etdm_spk_off",



