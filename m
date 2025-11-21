Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EEACFA459
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 00:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsdQVZDTYPb+WJU5W+qBd4HHdK8qY/Whv5lgvrY3/f4=; b=IF1UcGKEPeQohmcgrbcQ+roft9
	6tMlRCRuils+nBaCFcR1J7Ub2sk1m6iERZ3jmthMb96/yq/eyJh78804bNOk3Xbr1oigNVRvx74vT
	jLeJVLLo6jKSngZZWiunMp4YGgtsIWisFalB+SN01l9KSoxMaDIP+JGrZGdMom0RsAIHvkSZsxZXF
	uDxpWzDjKkh0tDpiLKhBFej23gIA3cYHziiHcItXeKhNWZsyBi2bL55gIgblX6uAKzJuB9+2k1wxv
	VaOLOwj4rFDoM8/ImbAhmxoyui5dFICxLpA2gI8oU8JG27iqW8ytv+NtDSH481sK7h4BQ2ALc9NHe
	aOsC7X3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMF0T-00000007bvi-0TiX;
	Fri, 21 Nov 2025 00:28:09 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMF0P-00000007bvD-2yDv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 00:28:07 +0000
Message-ID: <3b5d9df5-934d-4591-8827-6c9573a6f7ba@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1763684880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsdQVZDTYPb+WJU5W+qBd4HHdK8qY/Whv5lgvrY3/f4=;
	b=u0pinqtH5K5gMsYy6NyVpNY8dBuXeK5wBOcc2uf8rR1UgTk27xhJcC4Hj3lRoUnQHyyesm
	XtKuphT7jjVztBw5mmcMZ9nsEyPEge4LHLnbmkUQLmEipQwAeeARmAV3+Zv8F8MtMQR88H
	GNm3VkgBHJQ34FpknGh5YM4A8fMJNFGWMepFqY8hmb0xGyu7BY2z+T5AwQ2baE3G+EwjI5
	xuYD3tS3H1InSop+P0eI4NkXDdZy+A6VrV0ubA2Na1REKSrjDr+4HGe0jKa6mFVVoXOV5O
	5qXieNcr64wSjFk/5s5DFjfb8eXE5bpDolBEKQ9+bAtF9O9D8BpiY3XdQPnwqA==
Date: Thu, 20 Nov 2025 21:27:46 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_162806_270776_57DA2492 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

Hi,

On 11/12/25 10:55 AM, Bartosz Golaszewski wrote:
> ---
> Bartosz Golaszewski (10):
>        string: provide strends()
>        gpiolib: define GPIOD_FLAG_SHARED
>        gpiolib: implement low-level, shared GPIO support
>        gpio: shared-proxy: implement the shared GPIO proxy driver
>        gpiolib: support shared GPIOs in core subsystem code
>        gpio: provide gpiod_is_shared()
>        arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
>        ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
>        ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
>        regulator: make the subsystem aware of shared GPIOs

this seems to actually have caused a regression for me, audio does not 
initialize anymore on hamoa due to EBUSY since upgrading 
from next-20251114 to next-20251118 or next-20251120:

[   11.748781] platform 
6800000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 30
[   11.785864] wsa_macro 6aa0000.codec: using zero-initialized flat 
cache, this may cause unexpected behavior
[   11.796964] reset-gpio reset-gpio.0: error -EBUSY: Could not get 
reset gpios
[   11.796984] reset-gpio reset-gpio.0: probe with driver reset-gpio 
failed with error -16
[   11.894662] reset-gpio reset-gpio.1: error -EBUSY: Could not get 
reset gpios
[   11.894676] reset-gpio reset-gpio.1: probe with driver reset-gpio 
failed with error -16
[   12.006938] wcd938x_codec audio-codec: bound sdw:2:0:0217:010d:00:4 
(ops wcd_sdw_component_ops [snd_soc_wcd_common])
[   12.006964] wcd938x_codec audio-codec: bound sdw:3:0:0217:010d:00:3 
(ops wcd_sdw_component_ops [snd_soc_wcd_common])
[   15.424657] qcom-soundwire 6ab0000.soundwire: qcom_swrm_irq_handler: 
SWR CMD error, fifo status 0x4e00c00f, flushing fifo
[   21.994354] qcom-soundwire 6ab0000.soundwire: qcom_swrm_irq_handler: 
SWR CMD error, fifo status 0xe00c000, flushing fifo
[   21.996001] qcom-soundwire 6b10000.soundwire: qcom_swrm_irq_handler: 
SWR CMD error, fifo status 0x4e00c00f, flushing fifo
[   21.996239] platform sound: deferred probe pending: snd-x1e80100: WSA 
Playback: codec dai not found
[   21.996248] soundwire sdw:4:0:0217:0204:00:0: deferred probe pending: 
wsa884x-codec: Failed to get reset
[   21.996250] soundwire sdw:4:0:0217:0204:00:1: deferred probe pending: 
wsa884x-codec: Failed to get reset
[   21.996251] soundwire sdw:1:0:0217:0204:00:0: deferred probe pending: 
wsa884x-codec: Failed to get reset
[   21.996253] soundwire sdw:1:0:0217:0204:00:1: deferred probe pending: 
wsa884x-codec: Failed to get reset

gpio_shared_proxy, reset_gpio, pinctrl_sm8550_lpass_lpi are all built as 
modules and were autoloaded fine.

This is wsa884x (not wsa881x nor wsa883x), failing in 
devm_reset_control_get_optional_shared..


Thanks,
~val


