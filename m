Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336D5D0BB5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 05:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOsQKUwocz9twMccWuwSYpSa4JuUcL4zGkvCf3LMXxA=; b=T7ZbdY3aco8hV9wcijH2EpklaQ
	1PYd7dwSNMJT2EbA/0U302+xvPpa8paQrY6huxl1yfTIXWbnb/dPibi1Xie1ZduajHlAuVuqZCeo+
	uKKk0KM0B/sFdEEkFi6cgDsp5z/vBGm0ISNbSf6m06jGfKUyZ3PWcx2BM0KV4vstWgTTPJLjqEo3s
	8asVOLss2q410gf+cRv2xDIzcj2ESoEQFEKW1VFM6fhmzSJ9f8ccqwv5kgNSafuXWXx1j18hAdar2
	G7QAj74IAo0Iqe46Kbsx8xEA81CqsUg1jKyVCW9dxCDXptB73ZW86PSS+u9cxjvQ9YqkrQUQhjkpu
	4tl/xo/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qGS-0000000GmsZ-3i5c;
	Thu, 24 Oct 2024 05:20:04 +0000
Received: from [45.89.224.132] (helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qEt-0000000Gme8-0rOw;
	Thu, 24 Oct 2024 05:18:29 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9212812000A;
	Thu, 24 Oct 2024 08:18:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9212812000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1729747095;
	bh=tOsQKUwocz9twMccWuwSYpSa4JuUcL4zGkvCf3LMXxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=spTCXkqlI1dP+VeYhCbHR1pIAFEf4Q5SvCc734b1eCQTPSFYZ7HJo4K79NmFqXHtG
	 YVr6vwbJfFnALmC4+CRDqeBgns+R5SP9LAB8nZA5vH0n0YS1M77C/hzg18r8seXfg4
	 4Z3C2G+7zwd3IZfOOBLxJimrj/GfLLFwLlg1J6j0ALbVo2T5XxsWPwErgMrxmlbd1b
	 rFztFPop61N37lzZ5INih4rp/GDEFgSMuPJ7+7Kiyji0P+hrI2XNAy5mM4kTfoZexL
	 LE5czbawnkEYJXib7nj2AissDrxuL6aYwjmAM6JcuCQognkk1XXKoCOHJlJgU/FXH6
	 rLWIndptE2nrA==
Received: from smtp.sberdevices.ru (unknown [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 24 Oct 2024 08:18:15 +0300 (MSK)
Message-ID: <a1746933-1d8d-487f-af53-cbf4f850f925@salutedevices.com>
Date: Thu, 24 Oct 2024 08:18:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 0/5] Add A1 Soc audio clock controller driver
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, "Kevin
 Hilman" <khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
References: <20240913121152.817575-1-jan.dakinevich@salutedevices.com>
 <1jplnsjwir.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <1jplnsjwir.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.28.64.45]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188670 [Oct 23 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 40 0.3.40 cefee68357d12c80cb9cf2bdcf92256b1d238d22, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lore.kernel.org:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/10/24 04:49:00
X-KSMG-LinksScanning: Clean, bases: 2024/10/24 04:50:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/24 03:43:00 #26794388
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_221827_632435_1F6F780D 
X-CRM114-Status: GOOD (  15.39  )
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



On 10/22/24 12:51, Jerome Brunet wrote:
> On Fri 13 Sep 2024 at 15:11, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
> 
>> This series adds support for audio clock and reset controllers on A1 SoC family.
>>
> 
> Split the reset part out of the series (I'd suggest adding VAD reset
> support while at it). Also remove the DT patch, since it will depends on
> both patchset.
> 
> Drop the RFC tag, at v4 I think that phase is over.
> 

Jerome, thank you for review.

>> Dependency: [4]
>>
>> Changes v3 [3] -> v4
>>  - Use auxiliary reset device implemented in [4]
>>  - Split the driver into files
>>  - Use common with axg-audio yaml schema
>>  - Unify clock-names with axg-audio
>>
>> Changes v2 [2] -> v3
>>  - reset:
>>    * added auxiliary device
>>  - yaml:
>>    * added declaration of optional clocks
>>    * fixed names in example and another cosmetics
>>  - clocks:
>>    * reworked naming
>>    * stop using of "core" clock name
>>    * fixed wrong parenting
>>
>> Changes v1 [1] -> v2:
>>  - Detached from v1's series (patch 2, 3, 4, 25).
>>  - Reuse some of defines from axg-audio;
>>  - Split the controller into two memory regions.
>>
>> Links:
>>  [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/
>>  [2] https://lore.kernel.org/lkml/20240328010831.884487-1-jan.dakinevich@salutedevices.com/
>>  [3] https://lore.kernel.org/lkml/20240419125812.983409-1-jan.dakinevich@salutedevices.com/
>>  [4] https://lore.kernel.org/lkml/9a4377fe27d8eb940399e452b68fb5a6d678929f.camel@pengutronix.de/
>>
>> Jan Dakinevich (5):
>>   reset: amlogic: add support for A1 SoC in auxiliary reset driver
>>   clk: meson: axg: share the set of audio helper macro
>>   dt-bindings: clock: axg-audio: document A1 SoC audio clock controller
>>     driver
>>   clk: meson: a1: add the audio clock controller driver
>>   arm64: dts: meson: a1: add the audio clock controller
>>
>>  .../clock/amlogic,axg-audio-clkc.yaml         |   3 +
>>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  48 +++
>>  drivers/clk/meson/Kconfig                     |  14 +
>>  drivers/clk/meson/Makefile                    |   3 +
>>  drivers/clk/meson/a1-audio-clkc.c             | 359 ++++++++++++++++++
>>  drivers/clk/meson/a1-audio-drv.c              | 104 +++++
>>  drivers/clk/meson/a1-audio-vad-clkc.c         |  85 +++++
>>  drivers/clk/meson/a1-audio.h                  | 131 +++++++
>>  drivers/clk/meson/axg-audio.c                 | 138 +------
>>  drivers/clk/meson/meson-audio.h               | 143 +++++++
>>  drivers/reset/amlogic/reset-meson-aux.c       |   9 +
>>  .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++++
>>  .../reset/amlogic,meson-a1-audio-reset.h      |  29 ++
>>  13 files changed, 1051 insertions(+), 137 deletions(-)
>>  create mode 100644 drivers/clk/meson/a1-audio-clkc.c
>>  create mode 100644 drivers/clk/meson/a1-audio-drv.c
>>  create mode 100644 drivers/clk/meson/a1-audio-vad-clkc.c
>>  create mode 100644 drivers/clk/meson/a1-audio.h
>>  create mode 100644 drivers/clk/meson/meson-audio.h
>>  create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
> 

-- 
Best regards
Jan Dakinevich

