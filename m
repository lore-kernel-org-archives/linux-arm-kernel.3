Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62865EC01A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 08:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7sLiwhoVXpTk/aVRfpLSAb5QwlvL/VqB3G80sqReiU=; b=olZAP4TmxMAIUor4pFWO7dFYHf
	vUsUkIm4ENSAU939oXzV3YGD1KwieBjt03CF4NZPMfjGtcZqDJ4oFCmg1bnaK11E5jit/MFxqp+nv
	Lz+Z55LtkRlH3lpk4AWN9BV+BolsaMmHdHcghObdtEFSL8SIxPyUaS+z1TUwKKkNtHk/16YTri89H
	eHNochCMEl9eDcJYYI34WR4ARvgvKKAJgH4MWgb5khVgU+2/sNW2ludFbjtXAxsGYPizUDXtBuSP2
	78yVM/PJUX3YxKr+Y7BoSUbKUNWaqlymZZsVvy74EqzxCj3gSgyH1Ec4U4ymX1Rjswy6TWFrtO/HJ
	nRva11MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4aym-0000000GJHI-0rwx;
	Mon, 23 Mar 2026 08:49:44 +0000
Received: from mail-m21473.qiye.163.com ([117.135.214.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4aye-0000000GJBO-2idA;
	Mon, 23 Mar 2026 08:49:40 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37ee42d36;
	Mon, 23 Mar 2026 16:49:17 +0800 (GMT+08:00)
Message-ID: <6bf2b3c9-4af0-4c3a-a34f-ebe881d4827b@rock-chips.com>
Date: Mon, 23 Mar 2026 16:49:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
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
Content-Language: en-US
In-Reply-To: <20260320-amusing-magnetic-harrier-20cc40@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d19e2599003a3kunm591f097f5835d6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhpNHlYYQkNMGBhCTk8dTR1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=g2PMVctni+Tmi1H13vX7/jpuctiAQOf9jIaWSgTfnOYJqHwPB9HoWdBuyJLBQ6dIQ8CEIuDajcV//mZDKrb1T3pFZBYBR0LVLWovKpqvDMWK6z/LFlUVxrCoPINCdPXEbMd+SONHAoVmxQ7HG9fdGKjnUPgqgmfBZ5D8KucIOO4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Z7sLiwhoVXpTk/aVRfpLSAb5QwlvL/VqB3G80sqReiU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_014938_710898_4C531E5D 
X-CRM114-Status: GOOD (  15.68  )
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

On 3/20/2026 5:19 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 19, 2026 at 06:40:23PM +0800, Damon Ding wrote:
>> The RK3588 eDP controller needs the video datapath clock "hclk" to work
>> well. Previously, it works without explicitly adding this clock because
>> the 'rockchip,vo-grf = <&vo1_grf>' property implicitly enables HCLK_VO1.
>>
>> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../bindings/display/rockchip/rockchip,analogix-dp.yaml       | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index d99b23b88cc5..d2bc8636b626 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> @@ -26,7 +26,9 @@ properties:
>>       items:
>>         - const: dp
>>         - const: pclk
>> -      - const: grf
>> +      - enum:
>> +          - grf
>> +          - hclk
> 
> You just told me it is the same clock, no? I asked that and you
> confirmed? Or you replied with an answer not relevant to the question?
> 

Aha, I may have misunderstood your earlier advice as meaning that since 
the RK3576 and RK3588 platforms share the same design, their clock 
dependencies should also be identical.

The 'grf' clock and 'hclk' clock are different.
On RK3399, the GRF clock is for accessing VIO GRF registers.
On RK3588/RK3576, the eDP 'hclk' is required as it is the parent clock 
of 'pclk' in the AHB bus topology.

> If this device takes reference to grf, why does it also take grf clock?
> Devices MUST NOT take clocks on behalf of other devices, so please
> answer with a list of all clock inputs according to datasheet/manual.
> 

On earlier platforms, the GRF was not partitioned into separate 
functional small GRF units as on newer designs. Therefore, the 'grf' 
clock was designed as the clock dependency for all relevant modules.

For RK3588/RK3576 eDP module, the list of all clock inputs is:

CLK_EDP0_24M: Reference clock.
PCLK_EDP0: AHB clock.
HCLK_VO1/HCLK_VO0_ROOT: Video datapath clock.

It would be better to add above comments as the descriptions of these 
clocks in yaml.

Best regards,
Damon

