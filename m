Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A911EC01B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ma+sCIU/amVun6wDil2mNjR94in5yy/hwcmilDBpqY4=; b=gube+q40n5NgRZESGlJPhGNnmz
	r6rpY//24Bmyycjv2Yv8gjvcfyMcwO+3r56GEiUQ+e04GBFUQ4hMJHXQYkYGDwULVBk182nHOlbzc
	Bkf5L9WoDkKY4ROXMU8287tBrBiiSqWtnQVm9ktgtG3qnE8lb5OGewHNkfeu9BhXhZZgOtiPXffTj
	dnTqKcYx+1Pj4lo7o1ZIYHcg7VEV8yNNPAbbKZ+IQVIMBqWNaFxYQKpo2EPO8a9XoDokJhxN8gqKw
	S/6eo1M6eAr8oxY2GDnkJADnsJxEboJnlYL1Inrkh4QsccXHpxGoTmP2po8dZv+/O2Ecl9kIyBKTo
	C0p3ddAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c4S-0000000GRbb-1q83;
	Mon, 23 Mar 2026 09:59:40 +0000
Received: from mail-m19731101.qiye.163.com ([220.197.31.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c4N-0000000GRWs-0rkR;
	Mon, 23 Mar 2026 09:59:38 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37f125092;
	Mon, 23 Mar 2026 17:59:11 +0800 (GMT+08:00)
Message-ID: <c349eaf2-5852-4bb6-9dac-f7240e1c8098@rock-chips.com>
Date: Mon, 23 Mar 2026 17:59:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: display: rockchip: analogix-dp:
 Expand clock-names "hclk" for the third clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 alchark@gmail.com, cristian.ciocaltea@collabora.com,
 sebastian.reichel@collabora.com, kever.yang@rock-chips.com,
 heiko.stuebner@cherry.de, tomeu@tomeuvizoso.net, amadeus@jmu.edu.cn,
 michael.riesch@collabora.com, didi.debian@cknow.org,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260319104031.1986946-1-damon.ding@rock-chips.com>
 <20260319104031.1986946-2-damon.ding@rock-chips.com>
 <20260320-amusing-magnetic-harrier-20cc40@quoll>
 <6bf2b3c9-4af0-4c3a-a34f-ebe881d4827b@rock-chips.com>
 <904ad60f-82d6-4ad9-baa1-4d5196c57c76@kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <904ad60f-82d6-4ad9-baa1-4d5196c57c76@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d1a22577503a3kunm5765aa83592746
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx9CHlZLHklLQxpDGkwYGU5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=QaDPqk5+K33rWGC+Sk5tDLChlbDsO/bfMYXaEULZkUQCERH77KlcWVFsyhSlXZR2Y46pQUsNpqfFa2U9iWQ3stkbwgtTG9J4/E012AU6aaPKYYdzVm+wR1iSAoKDsvA+OzjKs14O7GOkHTuwPdAlURjPYGWeJq297DIxSi/RtRQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Ma+sCIU/amVun6wDil2mNjR94in5yy/hwcmilDBpqY4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025935_774100_0C0CEF1C 
X-CRM114-Status: GOOD (  11.58  )
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

On 3/23/2026 5:24 PM, Krzysztof Kozlowski wrote:
> On 23/03/2026 09:49, Damon Ding wrote:
>>>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>>>> index d99b23b88cc5..d2bc8636b626 100644
>>>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>>>> @@ -26,7 +26,9 @@ properties:
>>>>        items:
>>>>          - const: dp
>>>>          - const: pclk
>>>> -      - const: grf
>>>> +      - enum:
>>>> +          - grf
>>>> +          - hclk
>>>
>>> You just told me it is the same clock, no? I asked that and you
>>> confirmed? Or you replied with an answer not relevant to the question?
>>>
>>
>> Aha, I may have misunderstood your earlier advice as meaning that since
>> the RK3576 and RK3588 platforms share the same design, their clock
>> dependencies should also be identical.
>>
>> The 'grf' clock and 'hclk' clock are different.
>> On RK3399, the GRF clock is for accessing VIO GRF registers.
> 
> OK
> 
>> On RK3588/RK3576, the eDP 'hclk' is required as it is the parent clock
>> of 'pclk' in the AHB bus topology.
> 
> Heh, device takes pclk, so you do not need to take its parent.

Emm, my explanation may not have been clear enough. At the clock tree 
level, the hclk and pclk are two separate clocks, while pclk's parent 
clock is hclk in the NOC design, as illustrated below:
(Take the NOC design of RK3576 as example)

PD_VOP
   hclk_vop
     ├─ PD_VO1/hclk_vo1
     │    ├─ hclk_vo1_s (VO1 AHBS)
     │    └─ pclk_vo1_s (VO1 APB)
     └─ PD_VO0/hclk_vo0
          ├─ hclk_vo0_s (VO0 AHB)
          ├─ pclk_vo0   (VO0 AHBS)
          └─ pclk_vo0_s (VO0 APBS)

Then, the clock tree design is:

hclk_vo0_root (200M)
├─ hclk_spdifrx2_en
│    └─ hclk_spdifrx2 (200M)
├─ hclk_spdif2_en
│    └─ hclk_spdif2 (200M)
├─ hclk_sai6_8ch_en
│    └─ hclk_sai6_8ch (200M)
├─ hclk_hdcp0_en
│    └─ hclk_hdcp0 (200M)
├─ hclk_vo0_biu_en
│    └─ hclk_vo0_biu (200M)
└─ hclk_sai5_8ch_en
      └─ hclk_sai5_8ch (200M)

pclk_vo0_root (150M)
├─ pclk_hdmitx0_en
│    └─ pclk_hdmitx0 (150M)
├─ pclk_vo0_grf_en
│    └─ pclk_vo0_grf (150M)
├─ pclk_edp0_en
│    └─ pclk_edp0 (150M)
├─ pclk_dsihost0_en
│    └─ pclk_dsihost0 (150M)
├─ pclk_hdcp0_en
│    └─ pclk_hdcp0 (150M)
└─ pclk_vo0_biu_en
      └─ pclk_vo0_biu (150M)

Therefore, we need take 'hclk' as reference clock.

> 
>>
>>> If this device takes reference to grf, why does it also take grf clock?
>>> Devices MUST NOT take clocks on behalf of other devices, so please
>>> answer with a list of all clock inputs according to datasheet/manual.
>>>
>>
>> On earlier platforms, the GRF was not partitioned into separate
>> functional small GRF units as on newer designs. Therefore, the 'grf'
>> clock was designed as the clock dependency for all relevant modules.
>>
>> For RK3588/RK3576 eDP module, the list of all clock inputs is:
>>
>> CLK_EDP0_24M: Reference clock.
>> PCLK_EDP0: AHB clock.
>> HCLK_VO1/HCLK_VO0_ROOT: Video datapath clock.
> 

Best regards,
Damon


