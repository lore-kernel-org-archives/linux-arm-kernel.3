Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D87E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77AplkoSGCxoTa1YkDUJlVHZqj2RtqiABDMyhY8HDtE=; b=IwaopYL7rXNWc3ZQ5GYlW1akHu
	VtBKjQI5peX2g7RNodPGU9yLA1g8pfVVCyfQLXJvzTTbckqt2HL8jPEbPIFbaNQbL4Apu02AZLk0B
	Va80nuYJ/LxdlnxD677ngOUokvEP4tWBRZ4PyVUoVK5p/od3AVFsLFFOiC0pFLuH3sFi96FuecF2t
	lm4AKIh9CiqxY1+goIkr7aAbZ3QvjSCKTz/sMQguyScxgtjjZSM+jUgXbIK6DxlnDsEnSZxuoMYOa
	7hBa6o5dqqKX2pp3e6YkM1E2HAAW28QhhYikfe33UJpNKH5hQgmCzu/gV/eWQipzD4Obb0md7HHQB
	Y9aFpiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQWdC-0000000EDEA-3ZXb;
	Wed, 25 Dec 2024 19:01:18 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQWbw-0000000ED5Z-3EhO;
	Wed, 25 Dec 2024 19:00:05 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DA1BE100004;
	Wed, 25 Dec 2024 21:59:50 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DA1BE100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1735153190;
	bh=77AplkoSGCxoTa1YkDUJlVHZqj2RtqiABDMyhY8HDtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=SkYsd/lBBBshTX1D8P5pOKUu03fMbligVrL9aP8uV2FYgPqxq8GF3wvnCgMQamiuV
	 SylXfpKuJ4N8qcSCMd5KmWpONJWgCToRO0E+i3YqbbrJ848wjADpm0BTbLLPNu4MtO
	 JF9ivBrh/JvxEQSunmHIuMYxs6//Y89V/0+9mLMox/rAF6pduCPV/zb6R7VOGBbwqt
	 u0NCHfCcTypM0n1lJ+wlwbEUT3lj9scbR3s+WkQgmtbBltM089sPtrCemHoX2Yl4Qq
	 0AGeiWeFSinucUFi+TThX3vaKg9BU+8MDnnDp9yvdoIeS56H7e7gw78BpZoGxYaEvz
	 q7jeTtW22vUFw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 25 Dec 2024 21:59:50 +0300 (MSK)
Message-ID: <55de8bd9-7fbd-460b-b6d1-3b4b9e288f2c@salutedevices.com>
Date: Wed, 25 Dec 2024 21:59:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] iio: adc: meson: consistently use bool/enum in
 struct meson_sar_adc_param
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<neil.armstrong@linaro.org>, <lars@metafoo.de>, <jic23@kernel.org>,
	<linux-amlogic@lists.infradead.org>, "kernel@salutedevices.com"
	<kernel@salutedevices.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Zelong
 Dong <zelong.dong@amlogic.com>
References: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
 <20240323231309.415425-3-martin.blumenstingl@googlemail.com>
 <37cb9bc9-88c0-4e2b-8f46-0f67b91bc5be@salutedevices.com>
 <CAFBinCBxsv92t_B_T3vBDJJ1K5BwUbV=as6sy-KyQYz+2jur2g@mail.gmail.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <CAFBinCBxsv92t_B_T3vBDJJ1K5BwUbV=as6sy-KyQYz+2jur2g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.28.128.238]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190063 [Dec 25 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;lore.kernel.org:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;github.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/12/25 17:49:00
X-KSMG-LinksScanning: Clean, bases: 2024/12/25 17:49:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/12/25 17:59:00 #26917053
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_110003_100589_C7091A77 
X-CRM114-Status: GOOD (  21.93  )
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

Hello Martin

On 12/24/24 17:37, Martin Blumenstingl wrote:
> Hi George,
> 
> On Tue, Mar 26, 2024 at 1:41 AM George Stark <gnstark@salutedevices.com> wrote:
> [...]
>>>    enum meson_sar_adc_avg_mode {
>>>        NO_AVERAGING = 0x0,
>>>        MEAN_AVERAGING = 0x1,
>>> @@ -321,13 +326,13 @@ struct meson_sar_adc_param {
>>>        u8                                      temperature_trimming_bits;
>>>        unsigned int                            temperature_multiplier;
>>>        unsigned int                            temperature_divider;
>>> -     u8                                      disable_ring_counter;
>>> +     bool                                    disable_ring_counter;
>>>        bool                                    has_reg11;
>>>        bool                                    has_vref_select;
>>> -     u8                                      vref_select;
>>> -     u8                                      cmv_select;
>>> -     u8                                      adc_eoc;
>>
>>
>> The reason to choose u8 type over bool was that those are not actually
>> bool values but direct values of hw register bits. We have little
>> information about real meaning of these bits so it won't help much to
>> add bool layer and keep real values in the init code instead of param
>> section (adc_eoc, cmv_select).
>> bool disable_ring_counter will look deceptive too because it doesn't
>> say whether disable ring_counter or not (we always disable it) but
>> how to disable it (write 0 or 1)
> Do you have any contact at Amlogic that can help explain the purpose
> of these bits?

I remember I was digging thru vendor kernel and uboot code to understand 
the meaning of those bits when prepared my adc patches. I'll check it 
again about these and bellow bits and will let you know if I find 
anything worthwhile.

> I tried reaching out to my contact off-list but did not get any answers.
> 
> I also have more questions about the SARADC IP block on the GXLX SoC.
> We (Christian and I) have a patch prepared to fix audio (or rather the
> MPLL clocks) on the GXLX SoC (see [0]). Unfortunately there seems to
> be nobody that's answering me with enough info so we can upstream that
> patch.
> 
> So if you have any contact or insights into datasheets - please check
> and see if you can provide information so we can improve the naming of
> these bits and hopefully get GXLX SoC support fixed.
> 
> Also +Cc Xingyu Chen and Zelong Dong - I found your names in
> downstream patches to the SARADC driver [1].
> 
> 
> Thank you and best regards,
> Martin
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20240604055431.3313961-2-christianshewitt@gmail.com/
> [1] https://github.com/khadas/linux/commit/13321d23231a7a4d08f4fefebcef11b379475a37

-- 
Best regards
George

