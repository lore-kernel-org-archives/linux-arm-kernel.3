Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8066BC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 06:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eU+WAthWlgyCACOPm0qsanWlkKCLEJIXdLnn+HPfHms=; b=S8NBSlqFGFrdc8N6/gy4uVJoLs
	KMbSXmH/A0AZwKp9029C4ujQiaf3KyTi77hHCh9yW2gpppZER0dRAcGk9OMLA0k/h/MYNlIhmhbQv
	XQIo1O3nH1EA1HTHmCEHcQ/Q73MLW7MVIlmOpahVmcwXElInRHZSMpvbxdODyDlVOTdklSzXRvZFp
	yjA9DdTu8STI9WnjOcOyLFBb6gMXXSxLlmDLoOF967SMMUG6deM3zZfEP3H+PSpdpbrm0WcmVvasV
	lZ5CaPZZM+0KOtB6FsJU9XAIovfssvjEZWzokoo5qM0dzVRBdunPHd++fuPpK4thnvgVoO37et/dp
	6+GbBvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGuSe-000000089pM-1SQj;
	Mon, 19 May 2025 06:58:56 +0000
Received: from mail-m3270.qiye.163.com ([220.197.32.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGuQb-000000089fs-2mzO;
	Mon, 19 May 2025 06:56:51 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1587f7efd;
	Mon, 19 May 2025 14:56:29 +0800 (GMT+08:00)
Message-ID: <632f9f4d-ec0f-4512-a153-d2abfd9f6841@rock-chips.com>
Date: Mon, 19 May 2025 14:56:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250519012632.94-1-kernel@airkyi.com>
 <20250519012632.94-3-kernel@airkyi.com>
 <20a565da-296c-4920-b962-e9de9af464d9@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20a565da-296c-4920-b962-e9de9af464d9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUoaHlZOQk1KQxlMSktIH0lWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96e754661603aekunm1587f7efd
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAg6LBw5FzE0Ii4jMSsLPxlL
	MxAKCzpVSlVKTE9MTUhMTEJNQk1JVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBT01NSTcG
DKIM-Signature: a=rsa-sha256;
	b=Ka8twIlywrsVRoj8joZuMcW3eNbHX7gY7ch+iU1OHqX+6+7zslvXArine9mFteoTl/apcyN/gJRi0rs4lA8aCiHKEcxuT/dJ7AIfildpe4TLr1kzqyGoOPdKAdnX7qs7DB+0IGfmX/oWgPABuzmw66/CvdowapfJaSyrpYJzR+0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=eU+WAthWlgyCACOPm0qsanWlkKCLEJIXdLnn+HPfHms=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_235650_228386_5EDEA9A5 
X-CRM114-Status: GOOD (  15.20  )
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

Hi Krzysztof,

On 2025/5/19 14:16, Krzysztof Kozlowski wrote:
> On 19/05/2025 03:26, Chaoyi Chen wrote:
>> +maintainers:
>> +  - Andy Yan <andy.yan@rock-chip.com>
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +  - Sandy Huang <hjc@rock-chips.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/sound/dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: rockchip,rk3399-cdn-dp
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: DP core work clock
>> +      - description: APB clock
>> +      - description: SPDIF interface clock
>> +      - description: GRF clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core-clk
>> +      - const: pclk
>> +      - const: spdif
>> +      - const: grf
>> +
>> +  extcon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      maxItems: 1
>> +    maxItems: 2
> Instead of this, list the items. Old binding said only "specifier", so
> this is technically a change, which should be explained in commit msg.

Will fix in v5.


>
>> +    description:
>> +      List of phandle to the extcon device providing the cable state for the DP PHY.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    items:
>> +      maxItems: 1
>> +    maxItems: 2
>> +    description: |
>> +      List of phandle to the PHY device for DP output.
>> +      RK3399 have two DP-TPYEC PHY, specifying one PHY which want to use,
>> +      or specify two PHYs here to let the driver determine which PHY to use.
>
> You do not allow one phy, so your description is not accurate. OTOH,
> original binding did not allow two phandles, so that's another change in
> the binding. You need to document all changes done to the binding in the
> commit msg.

Oh, the original binding example use two phandles. I think only one PHY 
can also pass the dtb check here, or maybe I'm missing something else?


>
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input of the CDN DP
>> +        properties:
>> +          endpoint@0:
>> +            description: Connection to the VOPB
>> +          endpoint@1:
>> +            description: Connection to the VOPL
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output of the CDN DP
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 4
>> +
>> +  reset-names:
>> +    items:
>> +      - const: spdif
>> +      - const: dptx
>> +      - const: apb
>> +      - const: core
>> +
>> +  rockchip,grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to GRF register to control HPD.
>> +
>> +  "#sound-dai-cells":
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - phys
>> +  - ports
>> +  - resets
>> +  - reset-names
>> +  - rockchip,grf
>
> sound-dai-cells was a required property.
>
Okay, will add in v5.


