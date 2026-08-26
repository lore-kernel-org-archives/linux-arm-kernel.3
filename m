Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED85C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 16:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLLt3K4z1vfGu/cyXpEk3vTTq8ZeQdIakdo5vqeP+RE=; b=fNVbkULJfM0cwRxL46TD0Nuqbo
	Z/W0gFjO8By1BSMqq21jLIWqfmMMxBz8HnJrm/K5pOFjDWBg2lDg6te9LIS6iVo/+U9D/scTaIEmG
	NMEnTggbzLsEqH3G5xr2bcTwtDZCo0WD/TUcwoOw4L/Sbno80DxijoGrdFFCrOfEmjkgZ8McoJ07v
	7YP4qyT3z5Waq+aR0Y/asaRkaIWim5t/7JBH/uMOUmqaZdtX9uXZaLVO8zTtHEcXHeoq9a1bgPsq7
	57r2gN24s0ncG/pMki7KW4CjAC9UiFaeNo56fNmaJg17UEAmcrBznl05FK/xtk0PKmI8yl38VCHxn
	KmWX59sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzGhV-00000002lku-0Xpl;
	Wed, 26 Aug 2026 16:42:09 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzGhS-00000002lk6-3kqf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 16:42:08 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49800c6a846so9457155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 09:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762525; x=1788367325;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLLt3K4z1vfGu/cyXpEk3vTTq8ZeQdIakdo5vqeP+RE=;
        b=jRt7K5tr/PexoRghRlWUkTih6KNn1ASRp5g0TzTsjaVJtdmFioiR3I7ckTkFq7Ic8M
         1lGAmPLFK8SF/Flo9w+cIK9w0FKNh0NHhjMbPLcspQfVXNCoMdprfoCDvgmHyc2R/rbZ
         Oj/842N8PoJ6b6mk0coh8m4ImdIiwYBKNXhgwcyG6amjPmRO7Zvl46Ay0//EnRbhdSos
         lXms/tk8Xq37aUKM0cCdHUm0IlsIel9f0uCZZcPp/599HzSW3g03gBicXAuC1ar6aZo+
         P0mWmPApqatad3A/T5sJwKW85TA27mc6mB6O0JgPDypw9YJvzx5n91K4DSPr21DuIwDj
         zE7g==
X-Forwarded-Encrypted: i=1; AHgh+RqfOa5FOAYK/xDCd1kFx6UmKnTiJlzZF+TCdUL5buO8M/WCO/+OaT5goPRZ4sHC8i9DgM/AxHRn8plsykQ3wHXy@lists.infradead.org
X-Gm-Message-State: AFuF++m8cd2QAyOBdIIvQxp48tGxpecZgYLFfLxOUXsOWvLZ8z3ojQF9
	tQ9gp9JLF4bCH0a1UBWvntqKAPyNjsPJjF2izi3qpStaTAaiFXU37b6W
X-Gm-Gg: AR+sD10IMBBWOI++dQflHPR29hN1UGEtEIwdxPQqn/Xk5mqKsvb5Z4XKDXaey9y16Gd
	TT6Rq460hreUC7+bNHf7/GtEm2ZAn+7TDyKaQBOCpyQ3PDq95a1b+ah+hCQTOuNfslNnxOFZ9iX
	54sILUnv+ZYetehEbQ5G/kNBJT4mmkst6QCJcLHVc4k6Hp1afDScsHSEa5d19YSzbCqDg1ZhRrm
	8GTClLOSOMPW3DXi+aAiKJwiEhHfWN8Gems/SCYmgy7pqoLA5kM7OGEObVmo5+4zmWPxy++22M1
	r2RkD2Bluhat/bDMQnmUxlL57kVTBDgJF+VlCW6yGcevTRlZOuztjCVU5dNCJ4+Xum1GvXWQldT
	8E/D3b+s8lT2IPxkkirsPFit5KJHJe/5/S1y7agomn8+2wL1rGLEZ0MhhXggcRuyk5fS8TWqxkq
	z8a65nmMtvlMFwV8JD12vdaeIV0EQBsiZhrCcVYmVTZrUvMEogT34VgfQjvRHxuzV1Kyl99P0yc
	cwIAAj1YPk9VAeTIrKz+w==
X-Received: by 2002:a05:600c:c10f:b0:49a:54a2:4b38 with SMTP id 5b1f17b1804b1-49a54a24b54mr43496915e9.7.1787762524764;
        Wed, 26 Aug 2026 09:42:04 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dcad9ddasm30366375e9.12.2026.08.26.09.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 09:42:04 -0700 (PDT)
Message-ID: <72db2062-e0ac-4c33-b1d1-d1fa5ae4bec8@linux.com>
Date: Wed, 26 Aug 2026 17:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
From: Lucas Tanure <tanure@linux.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
 <aoxjX3HabY0brgXk@redhat.com>
 <57d796bd-7a3c-46b9-bd65-d6860adbd355@linux.com>
Content-Language: en-US
In-Reply-To: <57d796bd-7a3c-46b9-bd65-d6860adbd355@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_094206_973605_7DD8F59D 
X-CRM114-Status: GOOD (  18.50  )
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

On 26/08/2026 10:55, Lucas Tanure wrote:
> On 24/08/2026 16:29, Brian Masney wrote:
>> Hi Lucas,
>>
>> On Sun, Aug 23, 2026 at 04:40:42PM +0100, Lucas Tanure wrote:
>>> While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / 
>>> T7), I am
>>> hitting intermittent system instability, storage loss, and memory 
>>> corruption
>>> during boot, unless I append clk_ignore_unused to the kernel command 
>>> line.
>>>
>>> Because the failure is intermittent, I am running 100-reboot test 
>>> campaigns
>>> to bisect the remaining clocks and isolate which clocks are critical and
>>> cannot be safely disabled.
>>>
>>> As testing takes significant time over serial console, I wanted to 
>>> check if
>>> Amlogic or the maintainers could shed light on this:
>>>
>>> Are there specific T7 clocks or hardware domains that must remain
>>> critical/protected even without an explicit in-kernel consumer?
>>>
>>> Current clocks being disabled that don't kill the board on a test run:
>>>
>>> [    0.380313] clk: Disabling unused clocks
>>> [    0.380413] clk: Disabled unused clock: rtc_dualdiv
>>> [    0.380718] clk: Disabled unused clock: rtc_duandiv_in
>>> [    0.381377] clk: Unprepared unused clock: a73_div16
>>> [    0.381972] clk: Unprepared unused clock: cpu_div16
>>> [    0.382605] clk: Unprepared unused clock: f50m
>>> [    0.383174] clk: Unprepared unused clock: fixed_pll_dco
>>> [    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
>>> [    0.384416] clk: Unprepared unused clock: sys1_pll_osc
>>> [    0.385056] clk: Unprepared unused clock: earc_osc
>>> [    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
>>> [    0.386323] clk: Unprepared unused clock: eth_pll_osc
>>> [    0.386961] clk: Unprepared unused clock: pcie_osc
>>> [    0.387548] clk: Unprepared unused clock: mclk_pll_osc
>>> [    0.388187] clk: Unprepared unused clock: usb_pll1_osc
>>> [    0.388826] clk: Unprepared unused clock: usb_pll0_osc
>>> [    0.389465] clk: Unprepared unused clock: tcon_pll_osc
>>> [    0.390105] clk: Unprepared unused clock: top_pll_osc
>>> [    0.390738] clk: Unprepared unused clock: aud_pll_osc
>>> [    0.391361] clk: Unprepared unused clock: ddr_pll_osc
>>>
>>> I am not forcing any clock to be disabled; I am forcing all clocks to 
>>> stay
>>> on and letting them be disabled if unused one by one.
>>>
>>> Any guidance or hints on required platform clocks would be greatly
>>> appreciated.
>>
>> I have an outstanding series that disables unused clocks via the
>> sync_state callback:
>>
>> https://lore.kernel.org/linux-clk/20260626-clk-sync-state- 
>> v1-0-4156d8196dc8@redhat.com/
>>
>> Be sure to not have clk_ignore_unused in your kernel command line.
>>
>> I suggest comparing the list of which clocks are disabled with that
>> series against your list of clocks above.
> Thanks for the input, it did not solve the issue. I am going to produce 
> the list with a diff in disabled clocks with and without our change, but
> it did not solve the issue.
>>
>> Brian
>>
> 
With Brian's patches, VIM4 does not turn off 4 clocks:

t7_sys_sd_emmc_b
t7_sys_sd_emmc_c
sd_emmc_b
sd_emmc_c

This is expected since I'm trying to run from an SD card. However, even 
with these four clocks kept enabled, the board still hangs.

Complete list with all clocks being disabled after Brians patches:
[    1.002247] clk: Disabled unused clock: t7_sys_pwm_ao_gh
[    1.002898] clk: Disabled unused clock: t7_sys_pwm_ao_ef
[    1.003560] clk: Disabled unused clock: t7_sys_pwm_ao_cd
[    1.004220] clk: Disabled unused clock: t7_sys_pwm_ao_ab
[    1.004972] clk: Disabled unused clock: t7_sys_pwm_ef
[    1.005509] clk: Disabled unused clock: t7_sys_pwm_cd
[    1.006211] clk: Disabled unused clock: t7_sys_pwm_ab
[    1.006766] clk: Disabled unused clock: t7_sys_ts_hevc
[    1.007434] clk: Disabled unused clock: t7_sys_ts_vpu
[    1.008033] clk: Disabled unused clock: t7_sys_ts_nna
[    1.008741] clk: Disabled unused clock: t7_sys_ts_gpu
[    1.009294] clk: Disabled unused clock: t7_sys_sar_adc
[    1.009929] clk: Disabled unused clock: t7_sys_vpu_intr
[    1.010609] clk: Disabled unused clock: t7_sys_dspb
[    1.011186] clk: Disabled unused clock: t7_sys_dspa
[    1.011792] clk: Disabled unused clock: t7_sys_a73pclk_apb
[    1.012554] clk: Disabled unused clock: t7_sys_pclk_sys_apb
[    1.013213] clk: Disabled unused clock: t7_sys_rsa
[    1.013811] clk: Disabled unused clock: t7_sys_mipi_isp_pclk
[    1.014529] clk: Disabled unused clock: t7_sys_mmc_apb
[    1.015107] clk: Disabled unused clock: t7_sys_hdmirx_pclk
[    1.015819] clk: Disabled unused clock: t7_sys_i2c_s_a
[    1.016429] clk: Disabled unused clock: t7_sys_hdmitx_apb
[    1.017109] clk: Disabled unused clock: t7_sys_i2c_m_f
[    1.017740] clk: Disabled unused clock: t7_sys_i2c_m_e
[    1.018379] clk: Disabled unused clock: t7_sys_i2c_m_d
[    1.019018] clk: Disabled unused clock: t7_sys_i2c_m_c
[    1.019657] clk: Disabled unused clock: t7_sys_i2c_m_b
[    1.020296] clk: Disabled unused clock: t7_sys_i2c_m_a
[    1.020940] clk: Disabled unused clock: t7_sys_i2c_ao_b
[    1.021585] clk: Disabled unused clock: t7_sys_i2c_ao_a
[    1.022236] clk: Disabled unused clock: t7_sys_pcie_phy
[    1.022885] clk: Disabled unused clock: t7_sys_usb
[    1.023482] clk: Disabled unused clock: t7_sys_pcie
[    1.024088] clk: Disabled unused clock: t7_sys_spicc1
[    1.024723] clk: Disabled unused clock: t7_sys_spicc0
[    1.025345] clk: Disabled unused clock: t7_sys_g2d
[    1.025940] clk: Disabled unused clock: t7_sys_spicc5
[    1.026569] clk: Disabled unused clock: t7_sys_ts_a53
[    1.027197] clk: Disabled unused clock: t7_sys_ts_a73
[    1.027825] clk: Disabled unused clock: t7_sys_spicc4
[    1.028454] clk: Disabled unused clock: t7_sys_spicc3
[    1.029085] clk: Disabled unused clock: t7_sys_spicc2
[    1.029710] clk: Disabled unused clock: t7_sys_aififo
[    1.030339] clk: Disabled unused clock: t7_sys_uart_f
[    1.030967] clk: Disabled unused clock: t7_sys_uart_e
[    1.031595] clk: Disabled unused clock: t7_sys_uart_d
[    1.032224] clk: Disabled unused clock: t7_sys_uart_c
[    1.032857] clk: Disabled unused clock: t7_sys_uart_b
[    1.033482] clk: Disabled unused clock: t7_sys_eth
[    1.034077] clk: Disabled unused clock: t7_sys_audio
[    1.034694] clk: Disabled unused clock: t7_sys_ir_ctrl
[    1.035333] clk: Disabled unused clock: t7_sys_msr_clk
[    1.035972] clk: Disabled unused clock: t7_sys_spifc
[    1.036596] clk: Disabled unused clock: t7_sys_acodec
[    1.037218] clk: Disabled unused clock: t7_sys_smartcard
[    1.037880] clk: Disabled unused clock: t7_sys_am2axi2
[    1.038518] clk: Disabled unused clock: t7_sys_am2axi1
[    1.039157] clk: Disabled unused clock: t7_sys_am2axi0
[    1.039796] clk: Disabled unused clock: t7_sys_ampipe_eth
[    1.040468] clk: Disabled unused clock: t7_sys_ampipe_nand
[    1.041155] clk: Disabled unused clock: t7_sys_deswarp
[    1.041790] clk: Disabled unused clock: t7_sys_gdc
[    1.042385] clk: Disabled unused clock: t7_sys_cec
[    1.042981] clk: Disabled unused clock: t7_sys_aucpu
[    1.043600] clk: Disabled unused clock: t7_sys_aocpu
[    1.044217] clk: Disabled unused clock: t7_sys_mali
[    1.044830] clk: Disabled unused clock: t7_sys_ethphy
[    1.045451] clk: Disabled unused clock: t7_sys_mipi_dsi_b
[    1.046123] clk: Disabled unused clock: t7_sys_mipi_dsi_a
[    1.046795] clk: Disabled unused clock: t7_sys_dos
[    1.047390] clk: Disabled unused clock: t7_sys_ddr
[    1.047991] clk: Disabled unused clock: pwm_ao_g
[    1.048565] clk: Disabled unused clock: pwm_ao_f
[    1.049135] clk: Disabled unused clock: pwm_ao_e
[    1.049709] clk: Disabled unused clock: pwm_ao_d
[    1.050283] clk: Disabled unused clock: pwm_ao_b
[    1.050857] clk: Disabled unused clock: pwm_ao_a
[    1.051454] clk: Disabled unused clock: rtc_dualdiv
[    1.052038] clk: Disabled unused clock: rtc_duandiv_in

Also with the patches the disable happens 0.5 second later, from 0.5 
seconds after the boot to 1 second after the boot.

I am still investigating what is missing a consumer or what should be 
labeled critical.

thanks
Lucas Tanure



