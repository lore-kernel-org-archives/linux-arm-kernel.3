Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C45C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTukOEt0duVEzWcVCW2PRpsFfsww49TWD0w2DSDo5+o=; b=xEn0SnExG8Lf+JJAqy5Bq38yOa
	gfDeA+oQAbVJEvf9a2yiU/xX4B4Mt/XfSqCQzhbHA6bB7q/GuoUxqrhGBTYx+5f9gYIMLL197OTKh
	u0Q9Vah1iRkEaF2zxokuw1khPmMjod/9EGF/4/JF0wRy8fXKM9lVqAoE3P5JFFbfjXzZ/h2XRER5v
	yOfB8hD+hV3g6wxU+qTenPFq0ebS8QuKRxfASPE3XiHmK3gHvABbQ53YYfy5kH39BiWDUuFjdv185
	E9YHUzaptZMfSNsMpva0YKV4s3p9UQhLNGf1BwaGO1APZMVA/spqDgY/y122zbDoj9c84xCEpxLB1
	8HMjRvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrJA-000000047qx-4BDI;
	Tue, 11 Feb 2025 14:32:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrHk-000000047cZ-34la;
	Tue, 11 Feb 2025 14:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739284246;
	bh=tbjejdOouQ6QCsqtz77VNBHHu2oCAUL9pu87VbKonQ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cpj4GfBArV/d+/vj523v6D8xuOowB6481kI4EOBzfLzYPJFUOo3fboXCd7xUwJkqK
	 4EWkZ6iXu1Qoflc+N0T6g6OEqN9DbAFgtSCV19eGUId+fy6YtuK7VxhJADupJtzHRs
	 GHtv3tK4zMxd8yilOuOSkuXqksXQPEr8dDbuRLjZ92M3y9veHdZKB5XlK6WlTbtG8s
	 SftwxK6M2ZFN5c5NywRyuT7oI2Bnm5+KThQDPrsI/pRvGh5SktlRjWjWdRECGlJ7pw
	 BbJYr6cKkAF6o+k18eUTShluGHpb95XHJOPcPG2sPiXm8DClYHtFzs7Fw98qC170du
	 K1rjmsawSlQDw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D32C617E0EAD;
	Tue, 11 Feb 2025 15:30:45 +0100 (CET)
Message-ID: <6350446a-f253-4702-b1da-02e2915a3d30@collabora.com>
Date: Tue, 11 Feb 2025 15:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188: Assign apll1 clock as
 parent to avoid hang
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Fei Shao <fshao@chromium.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?=
 <Trevor.Wu@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20250207-mt8188-afe-fix-hang-disabled-apll1-clk-v2-1-a636d844c272@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250207-mt8188-afe-fix-hang-disabled-apll1-clk-v2-1-a636d844c272@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_063048_959417_4644CEBC 
X-CRM114-Status: GOOD (  19.61  )
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

Il 07/02/25 18:41, Nícolas F. R. A. Prado ha scritto:
> Certain registers in the AFE IO space require the apll1 clock to be
> enabled in order to be read, otherwise the machine hangs (registers like
> 0x280, 0x410 (AFE_GAIN1_CON0) and 0x830 (AFE_CONN0_5)). During AFE
> driver probe, when initializing the regmap for the AFE IO space those
> registers are read, resulting in a hang during boot.
> 
> This has been observed on the Genio 700 EVK, Genio 510 EVK and
> MT8188-Geralt-Ciri Chromebook, all of which are based on the MT8188 SoC.
> 
> Assign CLK_TOP_APLL1_D4 as the parent for CLK_TOP_A1SYS_HP, which is
> enabled during register read and write, to make sure the apll1 is
> enabled during register operations and prevent the MT8188 machines from
> hanging during boot.
> 
> Cc: stable@vger.kernel.org
> Fixes: 4dbec3a59a71 ("arm64: dts: mediatek: mt8188: Add audio support")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes in v2:
> - Changed patch from explicitly enabling apll1 clock in the driver to
>    assigning apll1_d4 as the parent for the a1sys_hp clock in the
>    mt8188.dtsi
> - Link to v1: https://lore.kernel.org/r/20241203-mt8188-afe-fix-hang-disabled-apll1-clk-v1-1-07cdd7760834@collabora.com
> ---
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 5d78f51c6183c15018986df2c76e6fdc1f9f43b4..6352c9bd436550dce66435f23653ebcb43ccf0cd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -1392,7 +1392,7 @@ afe: audio-controller@10b10000 {
>   			compatible = "mediatek,mt8188-afe";
>   			reg = <0 0x10b10000 0 0x10000>;
>   			assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP>;
> -			assigned-clock-parents =  <&clk26m>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_APLL1_D4>;
>   			clocks = <&clk26m>,
>   				 <&apmixedsys CLK_APMIXED_APLL1>,
>   				 <&apmixedsys CLK_APMIXED_APLL2>,
> 
> ---
> base-commit: ed58d103e6da15a442ff87567898768dc3a66987
> change-id: 20241203-mt8188-afe-fix-hang-disabled-apll1-clk-b3c11782cbaf
> 
> Best regards,



