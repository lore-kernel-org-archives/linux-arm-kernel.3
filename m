Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773A9C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 13:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvSKcW2JTa1S90pr5eaFxltSBWeBVmDeIAiv4OX7O1o=; b=NP81KlFp1y5HjVZf+uYY/nJEGu
	LzahHj6o6VFWi4vt0VyT10upcxjTWFEVz+h124ignXOspMUwzBxk8QFYdm3xFMidIBqZLIOohySjP
	tBR4Ggxp5Ng/WqU1DhJrKFrzCMeJTOeg9Mc8tRd+Q+t3QNHdZ/ZnlPWCKYmTM92hfw4igrhDqW7SL
	MpKHIPGypnseSlpOEK4A5GsuHDjLHgphwFPaZa/ey2rtF2l6NRLSP2jgURq04YpqKe6QVbtZaX05q
	2F1Z0VkizXGvQU4WLVv0SHP8juKF/kj4R2AYzbbiBrsP2kWiVK41ScKl3B6cuAEmdn9f1kVztxkGV
	B9XKJQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFD7-00000000Rwr-2vJC;
	Mon, 31 Mar 2025 13:29:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFB8-00000000RkB-1iQT;
	Mon, 31 Mar 2025 13:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743427667;
	bh=glwUne9cizaTnkLrGY1HEwK6Rkb2ZeouVxAPZRgLooQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aBXFn7SppLGstmOX2Aj099axN0Kai23N61ot1oeDIKbmvytLRHbIMKQ3AJmOYuIzP
	 YqAcaqDxmw31WEwxvPcjblnPO9XXzIsT9mbqZyukUv7aBmkfW80+oVlTQGY2UerfrJ
	 navlE+bXdOELK1I7xMPw3XfO+/pwk58xHAOp6FZYBWcKJEeBs2Dl33a24z1eCjC51U
	 qZwy6AhmiXbdGNtaHajZbVxhJcX6fRfF2Kn5CuhPGOWHZFhy1rvQ0/2H881O5FI0ia
	 UqZwwNF4rjAiVZBVVyMGbEWUgVA+1Wkhky8EBRpTyyelsRPrUslQp7oEzax1jiVfgi
	 IJEiANm0Dqcww==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E69517E07F4;
	Mon, 31 Mar 2025 15:27:47 +0200 (CEST)
Message-ID: <10703a6b-3f5f-4611-8545-21aa0e9be660@collabora.com>
Date: Mon, 31 Mar 2025 15:27:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Force ssusb2
 dual role mode to host
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_062750_601642_DAF1B207 
X-CRM114-Status: GOOD (  23.05  )
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

Il 31/03/25 11:25, Louis-Alexis Eyraud ha scritto:
> On the Mediatek Genio 510-EVK and 700-EVK boards, ssusb2 controller is
> one but has two ports: one is routed to the M.2 slot, the other is on
> the RPi header who does support full OTG.
> Since Mediatek Genio 700-EVK USB support was added, dual role mode
> property is set to otg for ssusb2. This config prevents the M.2
> Wifi/Bluetooth module, present on those boards and exposing Bluetooth
> as an USB device to be properly detected at startup, so configure for
> the ssusb2 dr_mode property as host instead.
> 
> Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> I've tested this patch on Mediatek Genio 510-EVK board with a kernel
> based on linux-next (tag: next-20250331).
> ---
>   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index 60139e6dffd8e0e326690d922f3360d829ed026b..3a9d429f0f14b501ae41551dfe7272f242345138 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -1199,7 +1199,13 @@ xhci_ss_ep: endpoint {
>   };
>   
>   &ssusb2 {
> -	dr_mode = "otg";
> +	/*
> +	 * the ssusb2 controller is one but we got two ports : one is routed
> +	 * to the M.2 slot, the other is on the RPi header who does support
> +	 * full OTG but we keep it disabled otherwise the BT on the M.2 slot
> +	 * USB line goes obviously dead if switching to gadget mode.
> +	 */
> +	dr_mode = "host";
>   	maximum-speed = "high-speed";
>   	usb-role-switch;
>   	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> 
> ---
> base-commit: 1c4df70331c0dc7f82f724166575c16931ec66b3
> change-id: 20250328-mtk-genio-510-700-fix-bt-detection-2711cbcbb2e4
> 
> Best regards,



