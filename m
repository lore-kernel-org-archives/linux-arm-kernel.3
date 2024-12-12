Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA471E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjgqYJxr37dpN3U+eIPz/npkCcvBeMOngfUWkg7iyec=; b=3gAbjXeVrT4xL8sQ6q1tEnRpL8
	RTrHfLOid/Au2cXyFSAotsKasrwncmlX2iERcwV+Gy66CapTuBmxQpTE7QUiYLS42yDXdXlsWvPN3
	l6ld0+D2LxOMveNuhSXlo++rKjv3ujaFX10J+UHu4EpIK9RkGp6/iQLVsadtUZydaPgMVYEMkaIyg
	5/wS4TCgUaM3+cGa5zH05JHHg53+fUT/3fmRfxuvPVquKcNKra0tdf7rnl5zCF+fMczTsa7j7xx4+
	FQaPX3uehTtLcqb1ieLclDPYW7WhC+/78KBsKYc8XDm2eJWN0GHZlntdd2KS6HyMXgrB9Nc5pNAt4
	frZ4uvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmfc-000000016sW-21Ue;
	Thu, 12 Dec 2024 17:08:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlh5-00000000swc-2667;
	Thu, 12 Dec 2024 16:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734019537;
	bh=J1scdp67Yf0dN731s+TeIiFUh/val29sz3XZEjfTzxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TLW5LTOpDIKHws5iJ9xFtxE1SpY4vug6sm8YNGS9UMeD/RRqKXzTAAtKX20365AJh
	 kILazhLvIPfBGbHfUhkqqWlYRkMyX87RVJY6maxF5yVxSg0qzxMMnqywXWBqdGdtMM
	 L1wKaWDqLDWhCzJ9zS7wvrLU48dloqzWKKFjqumNdiNkF1nvBEAK4BjAoWtvXB2HuY
	 SZFeZAfjqFp8elCWJTxyvNMYMd89BIcZRkkrYwl3mSC6m1xXhK3QhA2nMHECjSTJev
	 TFgFupVDtvA6s9cAe6sZ0iFiJ3oo0P3EaGbrhYcgCqrzramOKQHrjReMSuwLpg09Ah
	 Cqt0DYXeNJ9AA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C079417E37A4;
	Thu, 12 Dec 2024 17:05:36 +0100 (CET)
Message-ID: <6710abd1-128d-48ff-84a1-880053fd9e84@collabora.com>
Date: Thu, 12 Dec 2024 17:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dts: arm64: mediatek: mt8188: Update OVL compatible
 from MT8183 to MT8195
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fei Shao <fshao@chromium.org>
References: <20241212153344.27408-1-jason-jh.lin@mediatek.com>
 <20241212153344.27408-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241212153344.27408-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_080539_727621_6FAFF9D0 
X-CRM114-Status: GOOD (  14.23  )
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

Il 12/12/24 16:33, Jason-JH.Lin ha scritto:
> The OVL hardware capabilities have changed starting from MT8195,
> making the MT8183 compatible no longer applicable.
> Therefore, it is necessary to update the OVL compatible from MT8183 to
> MT8195.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Jason, just so you know - I have patches here adding DSC and merge components of
VDO0, other than all MDP3 components.

Those are almost ready to send, I only need to finish some testing before ;-)

For this one, anyway:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index faccc7f16259..23ec3ff6cad9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -2488,7 +2488,7 @@ jpeg_decoder: jpeg-decoder@1a040000 {
>   		};
>   
>   		ovl0: ovl@1c000000 {
> -			compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8183-disp-ovl";
> +			compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl";
>   			reg = <0 0x1c000000 0 0x1000>;
>   			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
>   			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;



