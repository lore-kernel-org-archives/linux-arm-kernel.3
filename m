Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6B5D44D56
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KSHsMKeAaP2NyytT4cGNT2lzMnqZuAvu8V5wHhb+MQ=; b=ScVndhHfGM4fzxoiKJg5XRuMCp
	vk2pnegpgiEiXo9xLCZQ7VgkjtossuS96Ivy9DmnS2MPLpPmS1M8GrBdZe2Kvw8I70QY/G/Jr+B/r
	+wq7B4KNc1nJR1WZi0wEyun5D7nbT1Z+ycujv7RxXNtc3ixy1JF/FqDAV6t+Jm14Xu4xXpzhwrTzs
	ZfE94k62ig73BEMrYoTLdowwmSNaDq97eqhlLRCYsizTwytpoxOxTl2kxUxsGwK/32S4K+e0DiyFU
	lCPdR8XLGEI1Wj60mG+Z/cbIO7jYQOTaJa6E7Os1ltnYvZTT40VFpydILK1HgisopZpEcQ/MhFltf
	gEVI4SQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zz5-00000006X2n-2tHJ;
	Thu, 07 Nov 2024 10:43:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ztR-00000006VUx-0ZJm;
	Thu, 07 Nov 2024 10:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730975855;
	bh=jRvsshBvtU/WBgIHhfAeu/Lb0e0oxCz8G6yAfOku9p0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dh7LiPnQl8luK4lXoov3CcdVUIXDM0d4+LzuIqO0dFGeYrmNwA2HtxutzHJ6Yoa9m
	 VoFOSZIHtd9yzP3ssnHOBGW+p4DPeBQds+FUXwJC1EPurG6JCbmTTvbptIRVn6Eu1s
	 EIz5obxv8S5gMR+NYZZYdMMkWcsQD0l6tUHPqJOxNCsOhKwjjgk3TDE2K4sPiKs12A
	 LiV62UIWXOc0yRHa307dOKLCsZdCqJblBYz/KrjEn6hyTip8Hw2fbKFu4ota9klOwj
	 slQiT/OqZQDXVKopjaUodcWkuZZW8HVn+6u8yZkeL8Vi4Tgd2/UDJYh4TUjUNYu0tA
	 nBvmKjihEomvw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0700917E35CB;
	Thu,  7 Nov 2024 11:37:34 +0100 (CET)
Message-ID: <59f4bcc1-c752-4f2f-8e55-349cc2432b8a@collabora.com>
Date: Thu, 7 Nov 2024 11:37:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Introduce MT8188 Geralt
 platform based Ciri
To: Fei Shao <fshao@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20241105093222.4055774-1-fshao@chromium.org>
 <20241105093222.4055774-3-fshao@chromium.org>
 <b66dbf9e-b35b-482c-9eb7-112ef1f398d6@collabora.com>
 <CAC=S1ngozo11g1vF2jnHjTLcNmP8tOMsQhK+LR0QWqoeXwSJjg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAC=S1ngozo11g1vF2jnHjTLcNmP8tOMsQhK+LR0QWqoeXwSJjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_023737_394942_1ADAAFA1 
X-CRM114-Status: GOOD (  26.65  )
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

Il 07/11/24 07:58, Fei Shao ha scritto:
> On Wed, Nov 6, 2024 at 9:19 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 05/11/24 10:30, Fei Shao ha scritto:
>>> Introduce MT8188-based Chromebook Ciri, also known commercially as
>>> Lenovo Chromebook Duet (11", 9).
>>>
>>> Ciri is a detachable device based on the Geralt design, where Geralt is
>>> the codename for the MT8188 platform. Ciri offers 8 SKUs to accommodate
>>> different combinations of second-source components, including:
>>> - audio codecs (RT5682S and ES8326)
>>> - speaker amps (TAS2563 and MAX98390)
>>> - MIPI-DSI panels (BOE nv110wum-l60 and IVO t109nw41)
>>>
>>> Signed-off-by: Fei Shao <fshao@chromium.org>
>>> ---
>>>
>>> Changes in v2:
>>> - remove invalid or undocumented properties
>>>       e.g. mediatek,dai-link, maxim,dsm_param_name etc.
>>> - remove touchscreen as the driver is not yet accepted in upstream
>>> - update sound DAI link node name to match the binding
>>> - add missing pinctrls in audio codec nodes
>>>
>>>    arch/arm64/boot/dts/mediatek/Makefile         |    8 +
>>>    .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   11 +
>>>    .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   60 +
>>>    .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   56 +
>>>    .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   15 +
>>>    .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   43 +
>>>    .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   73 +
>>>    .../dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   69 +
>>>    .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   47 +
>>>    .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi |  397 +++++
>>>    .../boot/dts/mediatek/mt8188-geralt.dtsi      | 1492 +++++++++++++++++
>>>    11 files changed, 2271 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>>
> [...]
> 

[...]

>>> +&pmic {
>>> +     interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
>>> +};
>>> +
>>> +&scp {
>>
>> Is this SCP-dual or SCP?
>> I see SCP, but I also see a SCP-Dual memory region... what's going on here?
>>
>> Of course, the SCP-Dual won't work if you don't override the compatible string...
> 
> To clarify, the second SCP core is used for MIPI camera in downstream,
> and I deliberately only describe the first SCP core here since the MTK
> camera ISP driver isn't in upstream at the moment.
> I had a fixup patch for removing the scp-dual reserved memory region,
> but likely it was missing during the rebase... let me check again if
> it can be removed, just in case there's firmware protecting the region
> and the kernel shouldn't access it.
> 

Hmm... but the second SCP core can still be brought up, even if the MIPI Camera
driver is not upstreamed yet, right?

That shouldn't cause lockups and/or other kinds of bad behavior, and should
bring up a core and just never use it, without any particular issues.

If we can enable the secondary core, let's just go for it.. as that will help
specifying the exact memory layout of this board (and failing to do that may
create some other issues, that's why I'm proposing to enable that even if it
is not really used in this case).

What do you think? :-)

>>
>>> +     firmware-name = "mediatek/mt8188/scp.img";
>>> +     memory-region = <&scp_mem>;
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&scp_pins>;
>>> +     status = "okay";
>>> +
>>> +     cros-ec-rpmsg {
>>> +             compatible = "google,cros-ec-rpmsg";
>>> +             mediatek,rpmsg-name = "cros-ec-rpmsg";
>>> +     };
>>> +};
>>> +
>>> +&sound {
>>> +     compatible = "mediatek,mt8188-nau8825";
>>> +     model = "mt8188_m98390_8825";
>>> +     pinctrl-names = "aud_etdm_hp_on",
>>> +                     "aud_etdm_hp_off",
>>> +                     "aud_etdm_spk_on",
>>> +                     "aud_etdm_spk_off",
>>> +                     "aud_mtkaif_on",
>>> +                     "aud_mtkaif_off";
>>
>>          pinctrl-names = "aud_etdm_hp_on", "aud_etdm_hp_off",
>>                          "aud_etdm_spk_on", "aud_etdm_spk_off",
>>                          "aud_mtkaif_on", "aud_mtkaif_off";
> 
> Acked.
> 
>>
>>> +     pinctrl-0 = <&aud_etdm_hp_on>;
>>> +     pinctrl-1 = <&aud_etdm_hp_off>;
>>> +     pinctrl-2 = <&aud_etdm_spk_on>;
>>> +     pinctrl-3 = <&aud_etdm_spk_off>;
>>> +     pinctrl-4 = <&aud_mtkaif_on>;
>>> +     pinctrl-5 = <&aud_mtkaif_off>;
>>
>> Add a comment:
>>
>>          /* The audio-routing is defined in each board dts */
>>
>>> +     audio-routing = "ETDM1_OUT", "ETDM_SPK_PIN",
>>> +                     "ETDM2_OUT", "ETDM_HP_PIN",
>>> +                     "ETDM1_IN", "ETDM_SPK_PIN",
>>> +                     "ETDM2_IN", "ETDM_HP_PIN",
>>> +                     "ADDA Capture", "MTKAIF_PIN",
>>> +                     "Headphone Jack", "HPOL",
>>> +                     "Headphone Jack", "HPOR",
>>> +                     "MIC", "Headset Mic",
>>> +                     "Left Spk", "Front Left BE_OUT",
>>> +                     "Right Spk", "Front Right BE_OUT",
>>> +                     "Rear Left Spk", "Rear Left BE_OUT",
>>> +                     "Rear Right Spk", "Rear Right BE_OUT";
>>> +
>>
>> ...and remove the audio-routing from this dtsi; it's anyway being
>> overridden by the -ciri.dtsi devicetree...
> 
> Acknowledged, and thanks for all the feedback here.
> 

You're welcome :-)

Cheers,
Angelo


