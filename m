Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0CBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTK5vbC3TgoZKGU9XsR0Yk2tB0Mt8Wo/Pgvr0V4+WYM=; b=ZEqiWt7mHgAhWQNeVo/ZrtTtz3
	Mzd5HtWuQQWPsN/D26pyCoYUA50Ri35PP7U3UdwIdWbxDJt7wz+sit6dU6ESwTyJg/vP8xNUrDWvB
	NfUm3vfJN2sscfUl5cf2USQUZWmjQ/ExXRFmMctIcH54GcSZVZstibKRz+dMviMBHPBJTUSBEZIvj
	qTBhBtgs7C2ahLUhU4w4nRWsGVuHQ1AiqP8Nkd/lMOhWmksQMILl3Hg7izBdK2cw0ky7XOUoEY0T1
	t3kN94gJb3NeZNYr4+nuauxjljqKMXFK/8mtIPt28XsQ2xw+/KLrpjESmp9dW1ZUKhT+Q4lKPqxm6
	9KACPIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Ns-00000008i41-3FFw;
	Mon, 18 Aug 2025 21:27:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5CJ-00000008SuH-3JCX;
	Mon, 18 Aug 2025 19:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755544030;
	bh=J1eZ5XRnn37Z4WoTM1MwkW3Lzx55zP9wT2RCCr2Fek8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T+dOXorp7h6JkyqQNCAl3wEg59iUtraI+4nqQcP3GDoxAF3zAW30U5hEipVY1cJz2
	 GB4gEqSAP56qRrL7xutGFdR8R2KprrgSO3seOvQcdalMuWf85dsu0ztLYBA5HCt3pm
	 sX+/mLif1mvrChQziqoWg1zmUnZN4h37RqrtBNszwrlj/CCmtyAKXyBlV41JgeUOSt
	 ik1yYwVSu/NYdZhXp0abqJkJOhq8dp0rME4YI9c4grLdXUK7RkEuLPcXcs/grHHScQ
	 GGR97OJCKcu9w3hyVtXNKBnJit1C4i8rUoqep8gidfZQ+2IPPxxnOjlny0zoAxJADS
	 hoIDakPN2mOyw==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D485E17E04C0;
	Mon, 18 Aug 2025 21:07:09 +0200 (CEST)
Message-ID: <a3632629-188f-4645-a8b9-825075684194@collabora.com>
Date: Mon, 18 Aug 2025 22:07:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] phy: hdmi: Add HDMI 2.1 FRL configuration
 options
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com>
 <20250805-phy-hdptx-frl-v2-1-d118bd4b6e0b@collabora.com>
 <3d796f6c-d1d0-4499-8e63-bd37bfcc7c3a@oss.qualcomm.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <3d796f6c-d1d0-4499-8e63-bd37bfcc7c3a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_120711_979123_78F0D804 
X-CRM114-Status: GOOD (  18.83  )
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

Hi Dmitry,

On 8/16/25 1:23 AM, Dmitry Baryshkov wrote:
> On 05/08/2025 14:56, Cristian Ciocaltea wrote:
>> Add support for configuring the Fixed Rate Link (FRL) mode for HDMI
>> PHYs.
>>
>> For improved clarity, also rename existing HDMI mode to HDMI_TMDS.
>> Since this mode is currently not being used explicitly, no further
>> changes are needed.
> 
> 
> I'd say, this need some explanation, especially for those who don't have access 
> to the HDMI standard. Please mention that FRL is an alternative to the traditional TMDS mode, etc.

Done in v3 [1].

> 
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>   include/linux/phy/phy-hdmi.h | 14 ++++++++++++--
>>   include/linux/phy/phy.h      |  3 ++-
>>   2 files changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
>> index f0ec963c6e84f1b7728acafc824dff191c6b873d..0b26472d8defcc9ded142d4283e29861dc2b3746 100644
>> --- a/include/linux/phy/phy-hdmi.h
>> +++ b/include/linux/phy/phy-hdmi.h
>> @@ -6,16 +6,26 @@
>>   #ifndef __PHY_HDMI_H_
>>   #define __PHY_HDMI_H_
>>   +#include <linux/types.h>
>> +
>>   /**
>>    * struct phy_configure_opts_hdmi - HDMI configuration set
>> - * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
>>    * @bpc: Bits per color channel.
>> + * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
>> + * @frl.rate_per_lane: HDMI FRL Rate per Lane in Gbps.
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
>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>> index 13add0c2c40721fe9ca3f0350d13c035cd25af45..04c84c1dbd6dac55fd04c54203cff4f9d939d970 100644
>> --- a/include/linux/phy/phy.h
>> +++ b/include/linux/phy/phy.h
>> @@ -44,7 +44,8 @@ enum phy_mode {
>>       PHY_MODE_SATA,
>>       PHY_MODE_LVDS,
>>       PHY_MODE_DP,
>> -    PHY_MODE_HDMI,
>> +    PHY_MODE_HDMI_TMDS,
>> +    PHY_MODE_HDMI_FRL,
> 
> I'd maybe suggest keeping PHY_MODE_HDMI and having two submodes: one for TMDS (default), one for FRL.

Also done in v3 [1].

Thank you for the review!

Regards,
Cristian

> 
>>   };
>>     enum phy_media {
>>

[1] https://lore.kernel.org/all/20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com/

