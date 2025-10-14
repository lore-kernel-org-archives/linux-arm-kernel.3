Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB838CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmruejlz1j3QPHoL5R+RiTFH65lF/njSra/H4BdDYPg=; b=hxK3mLI7z4oOHwAzOejBuB7jp1
	ZDgcxpuN0WmiFfoppKVXzjgwVaXD9QPowBPMTh3lmnkCNcSJi0z0eDHE9s9j31aKbrVCKk9ryivGx
	wk7//ZYqMjZY8OKrSJYipfsJGUQaSI08u6nj4g5s8+diw8rOViUXuL1UFDPiZiZhSyoIPLfP34l4R
	qPtNTyesjdNSREYurV8kim2Lq6AsA5ql86PXsMDpp5M61vCwtpDHAAEmz4nhe/WQcewx1YTJqgpq8
	GqrUVCxnfMvMqd5fUe6yOWT5ggxIlv0VIc4kZ26o6YuBE1Yiz33YJbebntUzPw1Unrr34mD2DkQTF
	F6KE1/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8evI-0000000GRyT-30Yx;
	Tue, 14 Oct 2025 13:18:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8evD-0000000GRut-3f21;
	Tue, 14 Oct 2025 13:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760447913;
	bh=N9CPJhNcpyyh4sczYatDI6/r/7qpIp3TR5G111HRq78=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=epsDhhe/mwkwONk0kXV9Zj2RKIc2TCEiXIkdiwvQx+ULEB69paBU3kQDB2yujqJpk
	 1zGXChqrS+4IpngqHl2POYI9O6e6qOtzyVanhODNoEUaOIoYPYrtiDO/vWTHEPdOkg
	 4wfqYLjlbDo4+Yud8dQn/pxbkQjw/fBWZ01ekg2e2eWgWovoXCtqh3kigNuy+wtiBR
	 pFkoiTfF3iNFz6tmEsLI0L6z14oejco+dCYPRIQYcFBWjNAmwWZ2f2YZvJqFoYbrwI
	 66b1hy7ZlsC2Ubn9TrfsjA5ZVUNbI1UjUZkiCtiL+4Eu3sswJZ5lzeXrUru3iLITge
	 2k0jF7MfNstfw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3496117E12DF;
	Tue, 14 Oct 2025 15:18:33 +0200 (CEST)
Message-ID: <c29a4ea7-34fd-44bf-bb32-a7a96bf0e04e@collabora.com>
Date: Tue, 14 Oct 2025 15:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt8365: Add GPU support
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com>
 <20250813-mt8365-enable-gpu-v1-2-46c44c6c1566@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250813-mt8365-enable-gpu-v1-2-46c44c6c1566@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_061836_110499_DF7AA70F 
X-CRM114-Status: GOOD (  14.04  )
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

Il 13/08/25 11:25, Louis-Alexis Eyraud ha scritto:
> The Mediatek MT8365 SoC has an integrated Arm Mali G52 MC1 GPU
> (Bifrost).
> Add gpu, OPP table, and MFG clock driver nodes in mt8365.dtsi to support
> it using the Panfrost driver.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 41 +++++++++++++++++++++++++++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index e6d2b3221a3b7a855129258b379ae4bc2fd05449..6a7b4f58918b22f51b792f3a99bd777acf72df9d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -267,6 +267,24 @@ clk26m: oscillator {
>   		clock-output-names = "clk26m";
>   	};
>   
> +	gpu_opp_table: opp-table-gpu {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-450000000 {
> +			opp-hz = /bits/ 64 <450000000>;
> +			opp-microvolt = <650000>;
> +		};

Blank line between OPP nodes, please.

};

opp-560000000 {
	...
};

opp-800000000

otherwise,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +		opp-560000000 {
> +			opp-hz = /bits/ 64 <560000000>;
> +			opp-microvolt = <700000>;
> +		};
> +		opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-microvolt = <800000>;
> +		};
> +	};
> +

