Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87852C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 10:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llk7nR+tr47KXadJEtGs+Y2kwXX45YVtERshbhlZMF0=; b=ZuByzpH+Ui90dHkyGdTteuhOXQ
	z7dZO6w3L6wCyusYg2527xkVN/f0WYxuiV+sCdCcY8snM5oBBh9KAdlGZb4fmzFLirL5JB4pTVDWg
	P/U/4JGi0e8ELeTyCHZR3eHlU03YPmRauWWzqKRKUz0/vUcRscfInXoFYVzH8iZNAFXpqzwSwkIby
	1HxEsObbh+m/Wh9Of6/Mo6cDWLliviXnsPYHP/CTS0rNv+M64yQrQ0sLyq790Dck0aF2vYP30fVzH
	mnuCxXa/Z2IVnWz5rW7A3OHDFTl4dQaJTFX/CEUIhZsoNREvM+puT6WOj5aCQGEwZhlqOkg7wnqEs
	WF5+UxCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzv1w-00000005ktq-0wxh;
	Wed, 02 Apr 2025 10:09:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzv0B-00000005khL-30ng;
	Wed, 02 Apr 2025 10:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743588438;
	bh=2D6/DR0EXXMZUwjDNtwoQO9absaDWxDLctt6KqIzTtk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OBLXlWnyHq6JdVN3P6jRHM/ZEfvWqjIkMff5S17AXozGFVJD8+T25e5SOJ2rDvCir
	 VJYEPY20GmlzALb5qrFyf82SkOpkhZrCG81ToTAIUlSe1FTqTUzetppJW4aZBRMNJF
	 l70RML5a6Aw3SaxmaRjAgqcBd0JAk7jV0/q6Pzl5Zkckd0iPFt7tlw32RC7kyMhBai
	 Yas+vjFIwx2z9k0tQznooWZdLTYPzoWQnKCoHSorH2zYJ7zcMle6Y025AY08ApikUn
	 psnRPM5tydbFegILx8t3Z58Mmj/gJ6CsPrLp08wKE9OnHtiJfwBDZmYkWyxxLtmzts
	 N0LpZr/6fKs1w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B96917E02BE;
	Wed,  2 Apr 2025 12:07:17 +0200 (CEST)
Message-ID: <33847b76-11b5-4233-a5e6-9f8fd3c691a2@collabora.com>
Date: Wed, 2 Apr 2025 12:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt8195: Add subsys clks for
 PCIe power domains
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, weiyi.lu@mediatek.com,
 tinghan.shen@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
 <20250402090615.25871-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GHf5D3JDh+OZ-Cxf91PTAGYk2+jvuwK1gymy=k1YOo_A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5GHf5D3JDh+OZ-Cxf91PTAGYk2+jvuwK1gymy=k1YOo_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_030719_929087_407F5926 
X-CRM114-Status: GOOD (  18.18  )
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

Il 02/04/25 11:34, Chen-Yu Tsai ha scritto:
> On Wed, Apr 2, 2025 at 5:10 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The PCIe MAC needs the sram to be powered on for internal IP
>> access and it has always worked before because the bootloader
>> on Chromebooks was leaving the PCIe PERI_AO MEM clocks on
>> before booting the kernel.
>> Add the SRAM (mem) clock as a subsystem clock on the PCIe MAC
>> P0 and P1 to correctly describe the hardware and to avoid any
>> issue with bootloaders behaving differently.
>>
>> Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> index b33726da900b..0cb96cba727a 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> @@ -792,12 +792,16 @@ power-domain@MT8195_POWER_DOMAIN_CAM_MRAW {
>>
>>                                  power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P0 {
>>                                          reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
>> +                                       clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
>> +                                       clock-names = "ss-pextp0-mem";
> 
> Doesn't the PCIe host controller already reference this clock?
> 
>>                                          mediatek,infracfg = <&infracfg_ao>;
>>                                          #power-domain-cells = <0>;
>>                                  };
>>
>>                                  power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P1 {
>>                                          reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
>> +                                       clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P1_MEM>;
>> +                                       clock-names = "ss-pextp1-mem";
> 
> Not this one though, since:
> 
>           /* Designer has connect pcie1 with peri_mem_p0 clock */
>           <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
> 

I'm not sure what this comment refers to - as in, whether this is referring
to the board designer or to the SoC//IP designer...

...but if MediaTek can clarify, I'd be happy :-)

Cheers,
Angelo

> 
> ChenYu
> 
>>                                          mediatek,infracfg = <&infracfg_ao>;
>>                                          #power-domain-cells = <0>;
>>                                  };
>> --
>> 2.48.1
>>
>>


