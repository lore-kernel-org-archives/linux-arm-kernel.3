Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89096CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCB9XpQH3mUOKP5r35FeEglaiMSGXBht3MeXLys0bfY=; b=kHr+DpU4kWuo3AnJF3yrCO5KbI
	1fWe6ZrTnM0zobSIAOszETRKXD7SZQMum7ppOPD0Kx7zYPx4WWva1uMduyAuyKtIiTGr9cYhXt3Ax
	2MN3Y/NhlbzBXRh8XkLUo3gyAjMiFyi6DP0EnEVmF9pf+LsR1AwvvdfIwq1ar9pKz7gXS4LSi2Uan
	TbnmJBUcRaoTr6Dwu/TMFxt7jl8UraEMKE1Pczp5lo/6YJG1+OYwhr3vX1RkZAUCW5wsJ6pjS01JW
	CXY9TmbdHHFHaz3i3P437poTYr4UI7/ETS8r5IHsDhlz+OaAvX5MquWvcTEnqJOSh+BeH5JDYe8Un
	1/QlcXXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvazB-0000000H1AW-37hG;
	Mon, 08 Sep 2025 12:28:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZpz-0000000GbFr-3OXc;
	Mon, 08 Sep 2025 11:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757330105;
	bh=OMK7ztTy/hr+DFx5lept7xu4GuQI0uzYkMpWvYSDScI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XpdT/jZXwuTehiGIMwpqT+gCEf11TGAG4gaTFsV2bMtbNLtV2xcDXF4MkycLHrI23
	 SMyPiG7ulsQVhZA3zyrI9Cjj97KRwYK65ueKUi5D8g7oj377B3QxEOcIwavDeXHuIO
	 fb4hy1g7HPNR1YBQiHjU4B9SJvsr1Z4Qh+b2NuBVpRWDAYdGSne6zjF3D+VSjdu6bR
	 y10MCinaMkVCY57dZAjXkgCtPstbZl8sFPI1v7CQtCMkGW05whW4KAgt/uouJuZ6k9
	 q+1+cM9DscPa5ifKovnFtpHzVBJWutGjRjLgh4sSKh8YTTjPhINScRkBiPST/PAKCr
	 dCkSVkalKLpIA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66F2317E00A6;
	Mon,  8 Sep 2025 13:15:04 +0200 (CEST)
Message-ID: <751d3abc-cf40-40a2-a580-7c0ba425ac25@collabora.com>
Date: Mon, 8 Sep 2025 13:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/10] dt-bindings: devfreq: add mt8196-gpufreq
 binding
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-2-7b6c2d6be221@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250905-mt8196-gpufreq-v1-2-7b6c2d6be221@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_041508_023653_8B3050CF 
X-CRM114-Status: GOOD (  34.87  )
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

Il 05/09/25 12:22, Nicolas Frattaroli ha scritto:
> On the MediaTek MT8196 SoC, the GPU has its power and frequency
> dynamically controlled by an embedded special-purpose MCU. This MCU is
> in charge of powering up the GPU silicon. It also provides us with a
> list of available OPPs at runtime, and is fully in control of all the
> regulator and clock fiddling it takes to reach a certain level of
> performance. It's also in charge of enforcing limits on power draw or
> temperature.
> 
> Add a binding for this device in the devfreq subdirectory, where it
> seems to fit in best considering its tasks.
> 
> The functions of many of the mailbox channels are unknown. This is not
> the fault of this binding's author; we've never received adequate
> documentation for this hardware, and the downstream code does not make
> use of them in a way that'd reveal their purpose. They are kept in the
> binding as the binding should be complete.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   .../bindings/devfreq/mediatek,mt8196-gpufreq.yaml  | 116 +++++++++++++++++++++
>   1 file changed, 116 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/devfreq/mediatek,mt8196-gpufreq.yaml b/Documentation/devicetree/bindings/devfreq/mediatek,mt8196-gpufreq.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..1fe43c9fc94bb603b1fb77e9a97a27e92fea1ae8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/devfreq/mediatek,mt8196-gpufreq.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/devfreq/mediatek,mt8196-gpufreq.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MFlexGraphics Performance Controller

Doesn't MFG stand for MediaTek Flexible Graphics? (or did they update the name?)

Perhaps it's a good idea to also add that reference... I think it's a little more
readable and understandable compared to "MFlexGraphics" :-)

> +
> +maintainers:
> +  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +
> +properties:
> +  $nodename:
> +    pattern: '^performance-controller@[a-f0-9]+$'
> +
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-gpufreq
> +
> +  reg:
> +    items:
> +      - description: GPR memory area
> +      - description: RPC memory area
> +      - description: SoC variant ID register
> +
> +  reg-names:
> +    items:
> +      - const: gpr
> +      - const: rpc
> +      - const: e2_id

We should find a better name for that "e2_id".

> +
> +  clocks:
> +    items:
> +      - description: main clock of the embedded controller (EB)
> +      - description: core PLL
> +      - description: stack 0 PLL
> +      - description: stack 1 PLL
> +
> +  clock-names:
> +    items:
> +      - const: eb
> +      - const: mfgpll
> +      - const: mfgpll_sc0
> +      - const: mfgpll_sc1
> +
> +  mboxes:
> +    items:
> +      - description: FastDVFS events
> +      - description: frequency control
> +      - description: sleep control
> +      - description: timer control
> +      - description: frequency hopping control
> +      - description: hardware voter control
> +      - description: gpumpu (some type of memory control, unknown)
> +      - description: FastDVFS control
> +      - description: Unknown
> +      - description: Unknown
> +      - description: Unknown, but likely controls some boosting behaviour
> +      - description: Unknown
> +
> +  mbox-names:
> +    items:
> +      - const: fast_dvfs_event

Any problem if we avoid underscores in names?

> +      - const: gpufreq
> +      - const: sleep
> +      - const: timer
> +      - const: fhctl
> +      - const: ccf
> +      - const: gpumpu

"some type of memory control" .. it's really a MPU. For memory protection. :-)
Besides, I don't think we have to touch anything in the gpumpu for freq control
via gpueb.

> +      - const: fast_dvfs
> +      - const: ipir_c_met
> +      - const: ipis_c_met

MET is a hardware event tracer / profiler... and I'm fairly sure that we have no
real reason to support it (at least, not like that, and not in a first submission).

Ah btw: ipir ipis .. ipi-receive ipi-send

> +      - const: brisket

Brisket is... something. There's one for the GPU, one for CPU, and one for APU.
Not sure what it exactly does, but seems to be or control a FLL (freq locked loop).

> +      - const: ppb

PPB = Peak Power Budget

The PPB needs its own "big" driver (the PBM - Power Budget Manager) in order to do
anything - as in - this manages a SoC-global peak power setting based on the
available maximum deliverable instantaneous (and/or sustainable) power from the
board's power source and it is mainly used for smartphone usecase (battery!).

In order to work, the PPB HW (yet another mcu) needs to be initialized with tables
for CPU and GPU (and APU? and something else too?), and with other data explaining
the maximum instantaneous power that can delivered at a certain battery percentage.

Important point is... I doubt that PPB is being initialized by the bootloader, on
all of Genio, Kompanio and Dimensity chips, so this should be disabled by default.

You can keep it, especially now that you have a description for it - and because it
does indeed exist, but I doubt that we're using this anytime soon.

Cheers,
Angelo

> +
> +  shmem:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the shared memory region of the GPUEB MCU
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - mboxes
> +  - mbox-names
> +  - shmem
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
> +
> +    gpufreq: performance-controller@4b09fd00 {
> +        compatible = "mediatek,mt8196-gpufreq";
> +        reg = <0x4b09fd00 0x80>,
> +              <0x4b800000 0x1000>,
> +              <0x4b860128 0x4>;
> +        reg-names = "gpr", "rpc", "e2_id";
> +        clocks = <&topckgen CLK_TOP_MFG_EB>,
> +                 <&mfgpll CLK_MFG_AO_MFGPLL>,
> +                 <&mfgpll_sc0 CLK_MFGSC0_AO_MFGPLL_SC0>,
> +                 <&mfgpll_sc1 CLK_MFGSC1_AO_MFGPLL_SC1>;
> +        clock-names = "eb", "mfgpll", "mfgpll_sc0",
> +                      "mfgpll_sc1";
> +        mboxes = <&gpueb_mbox 0>, <&gpueb_mbox 1>, <&gpueb_mbox 2>,
> +                 <&gpueb_mbox 3>, <&gpueb_mbox 4>, <&gpueb_mbox 5>,
> +                 <&gpueb_mbox 6>, <&gpueb_mbox 7>, <&gpueb_mbox 8>,
> +                 <&gpueb_mbox 9>, <&gpueb_mbox 10>, <&gpueb_mbox 11>;
> +        mbox-names = "fast_dvfs_event", "gpufreq", "sleep", "timer", "fhctl",
> +                     "ccf", "gpumpu", "fast_dvfs", "ipir_c_met", "ipis_c_met",
> +                     "brisket", "ppb";
> +        shmem = <&gpufreq_shmem>;
> +    };
> 


