Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E1BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 08:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBnRdVz4zTV+lUCBx37JQe/ES6s0uqhB+z5yrHCSXoo=; b=gGtzqklb2mFjKovDM/evMjxU1s
	JXPkAlsjdddPS7yPiZV4HVcq8+h6J9AloS0C9IabDI5V+RM3Wznf4eyZ2nmFg9rVJXDpuxZ8BAwPS
	KQ6QQ8v2D3IPYHyZU+KR/alnXs8afwpDjnrOlcZ0/mcAQjhnQXhXPnl4MsP03pZ94XB5fK+jb13Il
	bK4YvJirO0zTw/Uina5AZRvklOIHXD3gQcDvrC2/o8Q0EC4F9p+n0Sk8K9e9LfH9oDEl3LBslW3XL
	6L8U4W3F1Oma1Oz6xE2Lw5u9Paj6flgFFPezrrxlK9LrcNUZOdALwpriCx/9N9swI1PpGHR7F6KgA
	kCNYyfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFmN-0000000Al5a-0TTm;
	Thu, 03 Jul 2025 08:58:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFjs-0000000AkNh-0x91;
	Thu, 03 Jul 2025 08:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751532973;
	bh=WRYS/1sGoCCDr61DxzWsZ362lJvyxDK2jvW+DD8snwk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qsJsW5iGG5C7CO+LNG8zFmzphjOfTuPdEzMUh/o5exQGGb/FZS4JEnJLfmP43Un/g
	 oxvyFxfKDuaTBmNO9nsXgAKvKH0Qo8ebSMoTngL4ZIxcYw2GY/Ol9sUlb7tQJpn0Dg
	 tUJbpIMXOER45eqWRQhSLMYYjBwJz5sRgBnQR5DDJvx48YJiGcGIuNPAAh33zjwh1y
	 PzpOD2yhR/8bujX58qjEiGRV1maNpUoujm+tqTV6qPUrqZO3+qO+N4b+3IaDzLuT4E
	 uKC8XhdwZuY8puZeg1ZeUMFJgpOgjstVukqBm0ajc2pvpt5xK40A6zKxgdfFPS+MpC
	 q0A0ZVarrLY3g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CCF717E07FF;
	Thu,  3 Jul 2025 10:56:12 +0200 (CEST)
Message-ID: <d41a6c60-5368-4bcd-b028-2477e42e29bb@collabora.com>
Date: Thu, 3 Jul 2025 10:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] dt-bindings: firmware: Document the MediaTek
 Hardware Voter (HWV)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 ulf.hansson@linaro.org, arnd@arndb.de, m.wilczynski@samsung.com, nm@ti.com,
 khilman@baylibre.com, kabel@kernel.org, quic_hyiwei@quicinc.com,
 pjp@fedoraproject.org, tudor.ambarus@linaro.org, drew@pdp7.com,
 u.kleine-koenig@baylibre.com, gregkh@linuxfoundation.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 laura.nao@collabora.com, kernel@collabora.com
References: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
 <20250701151149.136365-3-angelogioacchino.delregno@collabora.com>
 <20250702-debonair-lynx-of-serenity-ee7138@krzk-bin>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250702-debonair-lynx-of-serenity-ee7138@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_015616_428603_7195DFC7 
X-CRM114-Status: GOOD (  26.21  )
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

Il 02/07/25 08:50, Krzysztof Kozlowski ha scritto:
> On Tue, Jul 01, 2025 at 05:11:48PM +0200, AngeloGioacchino Del Regno wrote:
>> Add documentation for the new MediaTek Hardware Voter, found in
>> MediaTek SoCs like the MT8196 Kompanio Ultra for Chromebooks and
>> the MT6991 Dimensity 9400 for Smartphones.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../mediatek,mt6991-hardware-voter.yaml       | 70 +++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml b/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
>> new file mode 100644
>> index 000000000000..173b74c23a91
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
>> @@ -0,0 +1,70 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright 2025 Collabora Ltd
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/firmware/mediatek,mt6991-hardware-voter.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek Hardware Voter (HWV)
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +description:
>> +  The MediaTek Hardware Voter (HWV) is a SoC-internal fixed-function MCU
>> +  used to collect votes from both the Application Processor and from the
>> +  various other remote processors present in the SoC, and transparently
>> +  turn on or off various hardware resources (for example, power domains
>> +  or system clocks) based on aggregation of votes done in the HWV MCU's
>> +  internal state machine, therefore guaranteeing synchronization of the
>> +  hardware resource requests between all components of the SoC and hence
>> +  avoiding, for example, unclocked or unpowered access to the hardware.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^system-controller@[0-9a-f]+$"
>> +
>> +  compatible:
>> +    const: mediatek,mt6991-hardware-voter
>> +
>> +  reg:
>> +    items:
>> +      - description: Address and size of the Hardware Voter MMIO
>> +
> 
> No resources here, so this should go to power controller
> 
>> +  power-controller:
>> +    $ref: /schemas/power/mediatek,power-controller.yaml
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: true
>> +
>> +examples:
>> + - |
>> +   scp_hwv: system-controller@14500000 {
>> +     compatible = "mediatek,mt6991-hardware-voter";
>> +     reg = <0 0x14500000 0 0x3000>;
>> +
>> +     power-controller {
>> +       compatible = "mediatek,mt8196-hwv-scp-power-controller";
> 
> mt8196 in mt6991 is very confusing.
> 

Yeah that wasn't intentional; fyi, it's almost the same soc, that's why I mixed
them up... :-)

> Anyway, this does not address my comment at all. You again create some
> sort of syscon for voting, so no. You are supposed to use generic API
> for voting: clocks, power domains, interconnects - whatever is there
> applicable or necessary.
> 

Making that loud and clear: Interconnect is not applicable.

The only way to do what you're proposing would be to add a bunch of `reg`
to each devicetree node for each clock controller and each power controller;
I can do that, but looks a bit dirty - and still yet another syscon-like
alternative, but without having a real syscon declared in there.

Mind you - both clock and power controllers are writing both to their own
register space (and enabling external regulators, etc, for power domains)
and to the hardware voter MMIO (which means that the HWV, in hardware, is
fundamentally broken).

After this reply, the only option that is left to me is the following:

		topckgen: clock-controller@10000000 {
			compatible = "mediatek,mt8196-topckgen", "syscon";
			reg = <0 0x10000000 0 0x800>, <0 0x14500010 0 0x48>,
			      <0 0x14502c08 0 0x24>;
			reg-names = "base", "hwvoter-base", "hwvoter-status";
			#clock-cells = <1>;
		};

		imp_iic_wrap_north: clock-controller@13c30000 {
			compatible = "mediatek,mt8196-imp-iic-wrap-n", "syscon";
			reg = <0 0x13c30000 0 0x1000>, <0 0x14500000 0 0xc>,
			      <0 0x14502c00 0 0xc>;
			reg-names = "base", "hwvoter-base", "hwvoter-status";
			#clock-cells = <1>;
		};

		/* Power Manager with Hardware Voter */
		spm_hwv: power-controller@14500218 {
			compatible = "mediatek,mt8196-hwv-scp-power-controller";
			reg = <0 0x14500218 0 0x20>, <0 0x14501410 0 0x20>,
			      <0 0x14505514 0 0xc>;
			reg-names = "hwvoter-base", "hwvoter-status", "hwvoter-ack";
			#address-cells = <1>;
			#size-cells = <0>;
			#power-domain-cells = <1>;

			/* SCPSYS hardware voter power domains */
			mm_proc_dormant: power-domain@MT8196_POWER_DOMAIN_MM_PROC_DORMANT {
				..... etc, all power domains

At this point, I'm really not sure that this would be better than just passing
the mediatek,hardware-voter syscon to the clock controllers - as what I've done
previously was effectively representing the hardware in the devicetree as it is,
matching the real HW layout 1:1 (because again, each of the whole HWV MCU(s) are
embedded into each of the two power controllers, one for System power, and one
for Multimedia power).

(btw, hardware speaking, the power controller is child of a system controller:
there are two system controllers - "scpsystem" is for "compute part", and the
"hfrpsystem" is for the "multimedia part" of the soc).

  _______________________________________
|                                       |
| SYSTEM CONTROLLER (SCPSYS or HFRPSYS) |
|   _____________________               |
|  |                     |              | <===> Clock Controllers (more than one)
|  | Power Controller    |     SOME     |       (provide subsystem clocks for iso
|  |                     |    OTHER     |        during power domain enablement
|  |     ______________  |   BLOCKS     |        even if a PD is voted)
|  |    |              | |              |       non-subsystem clocks are voted,
|  |    | HW Voter MCU | |              |       but subsystem ones are not voted
|  |    |______________| |              |
|  |_____________________|              | ===> Rest of the SoC
|_______________________________________|


Hence I'm asking you - does your idea still stand?

Because after this, sorry for that - this doesn't want to be an attack - but
I'm starting to have doubts about an approach that doesn't involve syscons.

Cheers,
Angelo

