Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06199E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5oDElNOfVKumcJf0HP7XKJD2ufHoitezzJ1pBIRyeA=; b=Y3VFVLRV4SQK5RCWZvMEerGqWA
	Dv/DOVgW/d9j5jgHe9eLmgEXcv0k2KN+/x8o3PfOCHjCe0m5VTIcuDdtFTXZsFD7z5w3LB66xrhnE
	XhmaREGpVfH7tyv9ZD7M7m3EisVWIOX+vtK6CqQD6Tr5haiCnOck4X2jyI+Q5HpQKrtPqDWYDJoWU
	t3kSnn+hwojjP5MXKoomAR4UnwrmtKbc/x2N+vQNwNN8gwrY/FoTHLneFFeyi4x8dZUFwsACLYXIt
	L9aL47gEUT8z5jisog5NhGK0gs99KIqQ549bngIO5sXdqq/DDUPaPH2MdjBytvioX90zLNvZi94Qi
	LD9Dag7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM30v-00000003RHL-22tJ;
	Fri, 13 Dec 2024 10:35:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2yp-00000003Qu5-13M5;
	Fri, 13 Dec 2024 10:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734085985;
	bh=yx1so4SVqMJRI+3G1bJUtF2KS6HaHhebzPeIaKasoZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ryhuf5kIIPp+ofnHBbFh6PFetgQYqNWjnSfZ53iZlSYOF/9f5Ug3yaysVeygh3n4f
	 +6Znj4Wr8YzNoxfFNb+7WTJ2dnBFFu8C9+aMh6b/3pdKIcYyfnjKYeRz58K7OEH5wv
	 K1VoxQkEYa4lOVdHXnZlwMs00EqequPJNHJ2hMtlXcHsT2+0OTgEiWFTVm1KkE7Kg0
	 rZ9MZpGHdVZUTyjvtvUKFDwZCCc6tVLYZgID//UEJ/DWTe8TO/5rADt/2Z3x3+roAe
	 QhtFNu65WKLEdCtcolwoyQRBq+yJMjhhp6TYEUrw+vpcogRtvO/UhoDsY6+OxBmSh7
	 vG9UxhOHmGGMg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 83FCF17E3610;
	Fri, 13 Dec 2024 11:33:04 +0100 (CET)
Message-ID: <980d28d6-52f0-4430-954b-da673fcd92df@collabora.com>
Date: Fri, 13 Dec 2024 11:33:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dts: arm64: mediatek: mt8195: Remove MT8183
 compatible for OVL
To: Pin-yen Lin <treapking@chromium.org>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fei Shao <fshao@chromium.org>
References: <20241213095044.23757-1-jason-jh.lin@mediatek.com>
 <20241213095044.23757-4-jason-jh.lin@mediatek.com>
 <CAEXTbpfOv876s3NLTO3oMTtVi_BwBtgb-816Gt5ZjKMjTZZKQg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAEXTbpfOv876s3NLTO3oMTtVi_BwBtgb-816Gt5ZjKMjTZZKQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_023307_431238_B7FF5C38 
X-CRM114-Status: GOOD (  17.48  )
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

Il 13/12/24 11:27, Pin-yen Lin ha scritto:
> Hi Jason,
> 
> On Fri, Dec 13, 2024 at 5:50 PM Jason-JH.Lin <jason-jh.lin@mediatek.com> wrote:
>>
>> The OVL hardware capabilities have changed starting from MT8195,
>> making the MT8183 compatible no longer applicable.
>> Therefore, it is necessary to remove the MT8183 compatible for OVL.
> 
> Similar to patch 2/3, we need a:
> 
> Fixes: b852ee68fd72 ("arm64: dts: mt8195: Add display node for vdosys0")
> 

No, we don't, for reasons that are similar to the ones that I explained in the
MT8188 commit.

Besides, this one was already featureful before this commit, so really this is
not worth backporting at all.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>>
>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> index ade685ed2190..137ee8929e01 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> @@ -3138,7 +3138,7 @@ larb20: larb@1b010000 {
>>                  };
>>
>>                  ovl0: ovl@1c000000 {
>> -                       compatible = "mediatek,mt8195-disp-ovl", "mediatek,mt8183-disp-ovl";
>> +                       compatible = "mediatek,mt8195-disp-ovl";
>>                          reg = <0 0x1c000000 0 0x1000>;
>>                          interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
>>                          power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
>> --
>> 2.43.0
>>
> 
> Regards,
> Pin-yen



