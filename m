Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BDDE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99ClRVy4vsyyhWYul3n84Pu6qzeHfD9vqAHXOR+dU8Y=; b=qiuxeJ8AegL2k+6cbh0clfk+wH
	OABqcLaAhuSmJYMbajWfBiCCOpP8lDeVESFNzk0m84CjWw0MA/EG0hYv689uHKV0rbDsHLHbY8Qrq
	oPX61wczWRgoGm8VDPYcYhZlUJp7rsyJIt7GFMmcD8wuek3K8WpYrYa+Qpip0Fy5rvPIAqaq2rYn3
	DB/peUaF/M8RiJnjso2F48oBl8YufT1B3FGMsPBokJl3ts+cKTxRbTObDAy9UtQ51U2XjB1s+am6e
	wmNuFVvTFM9/VgSR7YASEqXCmQ6/9/WW6kIPwYKAqkyBRUbcQGvkuyUI2fC6HbWj/Mih1QXdxhsR7
	/smGKPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqXv-0000000BgUD-32Eg;
	Thu, 09 Jan 2025 11:17:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqSx-0000000Bfat-0bBn;
	Thu, 09 Jan 2025 11:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736421161;
	bh=haxvYvRohcK0Kj/7lVEpMZ4B0Hxu9JPmmPdR3rjr+HE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ekonyUTi6rGkKlzE/MCBrzH/lpCzQX2KBYMb7HMG90ccnbfEL8TYT4NGGC6vXGCor
	 7HxTIooPlUCVU1F92dkwK/BsUrA/nOdau0Rl4PvFn6uwHGIrZWprRe/O6cBhHz2cW5
	 H2JbJv89UfSq+fpYaH+6a9CyliHgmGwn4jn+mgM405jZSy/L8rq/bnjIGl/CbOE3Qa
	 EpTNCV18yX2MMK7yS+d4GoL6t+bT0fyEHb0d9TSD1v9LEeN1ozkVaxPL2pQWRBMYvb
	 ZPCOA1nrQE74nrInt0+jXNgLwV9GdaXT4Cl1nhijvp1XMCmYat0WYufLylS/aIMynz
	 QhDlbPF45jqKw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4084B17E1569;
	Thu,  9 Jan 2025 12:12:41 +0100 (CET)
Message-ID: <31cd9b95-21e0-44a0-9f60-cf84b2b66e6f@collabora.com>
Date: Thu, 9 Jan 2025 12:12:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt8173: Fix disp-pwm compatible
 string
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 YH Huang <yh.huang@mediatek.com>, stable@vger.kernel.org
References: <20250108083424.2732375-1-wenst@chromium.org>
 <20250108083424.2732375-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250108083424.2732375-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_031243_355935_EAA2EED2 
X-CRM114-Status: UNSURE (   7.77  )
X-CRM114-Notice: Please train this message.
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

Il 08/01/25 09:34, Chen-Yu Tsai ha scritto:
> The MT8173 disp-pwm device should have only one compatible string, based
> on the following DT validation error:
> 
>      arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pwm@1401e000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	    ['mediatek,mt8173-disp-pwm', 'mediatek,mt6595-disp-pwm'] is too long
> 	    'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
> 	    'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm', 'mediatek,mt8365-disp-pwm']
> 	    'mediatek,mt8173-disp-pwm' was expected
> 	    'mediatek,mt8183-disp-pwm' was expected
> 	    from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>      arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pwm@1401f000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	    ['mediatek,mt8173-disp-pwm', 'mediatek,mt6595-disp-pwm'] is too long
> 	    'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
> 	    'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm', 'mediatek,mt8365-disp-pwm']
> 	    'mediatek,mt8173-disp-pwm' was expected
> 	    'mediatek,mt8183-disp-pwm' was expected
> 	    from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
> 
> Drop the extra "mediatek,mt6595-disp-pwm" compatible string.
> 
> Fixes: 61aee9342514 ("arm64: dts: mt8173: add MT8173 display PWM driver support node")
> Cc: YH Huang <yh.huang@mediatek.com>
> Cc: <stable@vger.kernel.org> # v4.5+
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


