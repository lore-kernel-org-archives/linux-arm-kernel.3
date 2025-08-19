Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7075CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsCUS3rsYKi5CY2dTjX0IB7+f27jQLr+S73Ad+dTesY=; b=jIY82uAFbYTxSrzdDXz3vKLgHA
	xzCe+OLkc12A85moUGjNUwTwppLB3hnWuMcG7qy9ThoTirCYrzMZDN4iMcnKM2y2k+cxLLvF2TVyy
	m49UvITkokwkSeESyjSzLcn/F6NPBdWtEAWO2XoKTgFSpe9imiL51KGRy2WTNDBJJh1A2wwFjXmF9
	A6xViIfbdOWfrjNWCyp7XTd/E92PwbFSnJdS0kVLDd6mdB1lMeAxL1JTlMihdDH3JydDndZkXjDcc
	jgkj1+Gxlm7/wDqc4TKXp1dkh/ck+dsERxAYip2ZhFZwCB55iAeJKZ3cSRxV6LpiUANr4vQZvKvAa
	B1h4JwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMoM-0000000Afsi-3ThP;
	Tue, 19 Aug 2025 13:55:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKOD-0000000AG27-1XcL;
	Tue, 19 Aug 2025 11:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755602427;
	bh=L8tNZa8rFAjIaVfhYUnPCfD9vH3EZUr5qfXZi344qpM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BvTH/O9NLxfQd2rkp0s0OxsNVlHxCwne83pic3+AH1jjGWltxmJhzts/BE6K/Uj4j
	 5KE799gb0YKREeZkqh2jpdpyR07wi2lgfEZxp/2Ix3R0GBiFK2L7jckPycchNCvvli
	 1BZkRaUVBybtE0pQR+CFvmqxMetyB/J/YbrhgK1YqdzUdbOIAvmIaRUEZ4qyF9Erjh
	 cJI95i/SYINRbBLLWjpsmZE1E/6Hp3jvlO90cMY2i8dmuHzoWZPuptYKx64BqjMsnS
	 6pYAztXE5++OTYC+52Uitnh6h6Q2FhHkkMKRieROWXQxj1GtjVaqDzrVEtYio/H78V
	 Ypjt8Z+hTYcrA==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4620F17E135D;
	Tue, 19 Aug 2025 13:20:27 +0200 (CEST)
Message-ID: <d4624c04-93c3-4db4-a45d-ed111901a5fc@collabora.com>
Date: Tue, 19 Aug 2025 14:20:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] phy: hdmi: Add HDMI 2.1 FRL configuration
 options
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com>
 <20250818-phy-hdptx-frl-v3-1-c79997d8bb2b@collabora.com>
 <3f857197-1cd1-4c18-88e9-e8c00d95af82@oss.qualcomm.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <3f857197-1cd1-4c18-88e9-e8c00d95af82@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_042029_562928_BEC3101D 
X-CRM114-Status: GOOD (  25.11  )
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

On 8/19/25 3:42 AM, Dmitry Baryshkov wrote:
> 
> 
> On 18/08/2025 21:59, Cristian Ciocaltea wrote:
>> The HDMI 2.1 specification introduced the Fixed Rate Link (FRL) mode,
>> aiming to replace the older Transition-Minimized Differential Signaling
>> (TMDS) mode used in previous HDMI versions to support much higher
>> bandwidths (up to 48 Gbps) for modern video and audio formats.
>>
>> FRL has been designed to support ultra high resolution formats at high
>> refresh rates like 8K@60Hz or 4K@120Hz, and eliminates the need for
>> dynamic bandwidth adjustments, which reduces latency.  It operates with
>> 3 or 4 lanes at different link rates: 3Gbps, 6Gbps, 8Gbps, 10Gbps or
>> 12Gbps.
>>
>> Add support for configuring the FRL mode for HDMI PHYs.
> 
> Could you please point out corresponding DRM patches? 
> They might be WIP or incomplete. I'd like to see how this works on the consumer side.

Sure, please check the top-most commits prefixed with [WIP-FRL] in [1].  In
particular, phy_set_mode_ext() is being called in [2].

>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>   include/linux/phy/phy-hdmi.h | 19 +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
>> index f0ec963c6e84f1b7728acafc824dff191c6b873d..83330d359e3ae345554f20429519da14506b8ab5 100644
>> --- a/include/linux/phy/phy-hdmi.h
>> +++ b/include/linux/phy/phy-hdmi.h
>> @@ -6,16 +6,31 @@
>>   #ifndef __PHY_HDMI_H_
>>   #define __PHY_HDMI_H_
>>   +#include <linux/types.h>
>> +
>> +enum phy_mode_hdmi {
>> +    PHY_MODE_HDMI_TMDS,
>> +    PHY_MODE_HDMI_FRL,
> 
> There is no unified approach for PHY submode names. Nevertheless I'd suggest something like PHY_HDMI_MODE_TMDS / _FRL. 
> It follows more closely the networking / USB submodes. An alternative might be to use PHY_SUBMODE_HDMI_TMDS / _FRL.

I'd go for PHY_HDMI_MODE_{TMDS|FRL} and I should probably also rename the
enum to phy_hdmi_mode.

> But it's really a nit and/or bikeschedding.

No worries, let's handle this.

>> +};
>> +
>>   /**
>>    * struct phy_configure_opts_hdmi - HDMI configuration set
>> - * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
>>    * @bpc: Bits per color channel.
>> + * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
>> + * @frl.rate_per_lane: HDMI FRL Rate per Lane in Gbps.
> 
> This works nicely until HDMI Forum adds an rate not being even Gbps. 
> Is there a reason for not using ULL and bps following the tmds_char_rate design?

This is for consistency with the related members of struct drm_hdmi_info:

    /** @max_frl_rate_per_lane: support fixed rate link */
    u8 max_frl_rate_per_lane;

    /** @max_lanes: supported by sink */
    u8 max_lanes;

>> + * @frl.lanes: HDMI FRL lanes count.
>>    *
>>    * This structure is used to represent the configuration state of a HDMI phy.
>>    */
>>   struct phy_configure_opts_hdmi {
>> -    unsigned long long tmds_char_rate;
>>       unsigned int bpc;
>> +    union {
>> +        unsigned long long tmds_char_rate;
>> +        struct {
>> +            u8 rate_per_lane;
>> +            u8 lanes;
>> +        } frl;
>> +    };
>>   };
>>     #endif /* __PHY_HDMI_H_ */
>>
> 

[1] https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-hdmi-frl
[2] https://gitlab.collabora.com/cristicc/linux-next/-/commit/86dd2cbbccdc71a3b5db87fdf876370dc3b6f2df#90498bf5e199fded685141134e7c623ef4f4411c_132_215 


