Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7F4E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIQ788GKje2F6HrUzF/NP2sjFm1lkmqThEkpfptv+x8=; b=FKM+UUyMtKYqEqU9zHfPllxEA6
	qISBwUWPmr92rkc5rxaESJrwqbEnlx6pwMtA6NkiwTTsyOkATCLbnYfqPdPr0uRFpBbO6bMtYPV0f
	k2uZbatLNsyL9dZiYfpGMMakcNj5sxR/xdS6Zx33NAIM0SSdqQctV0Fb4K2l256ElA6VwAf/DYlwx
	h9lcWiMn8PiE0YuqfkgIISfV79RhNC8mBi3H+Qjo1q1hrBn1DUsHXSixUuOFC3ZKAniSUdQRhRcY2
	kUDq6Be4naun9Kydbw0zfe0GRXRNiG5IWmuU+uYBiQDxBHQji9dN7mvPL4HZpGCupWi+OwPQVNfkV
	zMBL32dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2zs-00000003R4f-1aPo;
	Fri, 13 Dec 2024 10:34:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2yn-00000003QtS-1UTL;
	Fri, 13 Dec 2024 10:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734085982;
	bh=ApsrYFswezGftMuwmeTEeSUOM/0FX0NYslGs2NfWs0A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S4bN2vIn3fGXb5uMGXT0vcyMbMw3mhQFzQZojR301P8vZS9U28S7S3EUbZnggWInf
	 ReLSvhnbcbTXwl1X43tNyQSV1AjUFEtU/z1PS4t8rvL/O2htkfPu+WYdbxXue8MTOj
	 948x6TUMPeUJil2itKHbFYBg79Qve/EdnetOQ+aR3VQ6ezzc/gaosjIxNtH7K6Wyj3
	 uckNr+NcwYacsFRb4zutjG/sw4YDgoStxcCxAvEc8BrBDPs9Uqnvi6riCNKf7lBfZu
	 Jnlbh3vEqAEvjsa5OCOYfzPrg3CpUBLI0kM/logl8RF+WL5fO9++Fk1eW56v1BavOx
	 Lr+tx/BsNwjdQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C203117E360E;
	Fri, 13 Dec 2024 11:33:01 +0100 (CET)
Message-ID: <e1909a09-f871-4c8b-825e-835605ff92a5@collabora.com>
Date: Fri, 13 Dec 2024 11:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dts: arm64: mediatek: mt8188: Update OVL
 compatible from MT8183 to MT8195
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
 <20241213095044.23757-3-jason-jh.lin@mediatek.com>
 <CAEXTbpcp31oWOCh2c41QbWOc5F_gpD1Bia0NiZeVyDbqKo98Lw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAEXTbpcp31oWOCh2c41QbWOc5F_gpD1Bia0NiZeVyDbqKo98Lw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_023305_557854_1513F18A 
X-CRM114-Status: GOOD (  17.31  )
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

Il 13/12/24 11:26, Pin-yen Lin ha scritto:
> Hi Jason,
> 
> On Fri, Dec 13, 2024 at 5:50 PM Jason-JH.Lin <jason-jh.lin@mediatek.com> wrote:
>>
>> The OVL hardware capabilities have changed starting from MT8195,
>> making the MT8183 compatible no longer applicable.
>> Therefore, it is necessary to update the OVL compatible from MT8183 to
>> MT8195.
> 
> This probably doesn't need an (immediate) respin, but this patch needs:
> 
> Fixes: 7075b21d1a8e ("arm64: dts: mediatek: mt8188: Add display nodes
> for vdosys0")

No, because the binding must otherwise get a Fixes tag.

This is not a fix anyway, and is technically adding new features to the MT8188
OVL; without the additional features, the MT8188 is still compatible with the
MT8183 OVL, as much as MT8195.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>>
>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>> index faccc7f16259..23ec3ff6cad9 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>> @@ -2488,7 +2488,7 @@ jpeg_decoder: jpeg-decoder@1a040000 {
>>                  };
>>
>>                  ovl0: ovl@1c000000 {
>> -                       compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8183-disp-ovl";
>> +                       compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl";
>>                          reg = <0 0x1c000000 0 0x1000>;
>>                          clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
>>                          interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
>> --
>> 2.43.0
>>
> 
> Regards,
> Pin-yen


