Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97F5C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jKg7zPw7lKK/zV2TerSGH2lZsZENXJkv8MUeOswc3dg=; b=BREDmaFjen4tiAmHCiwxSIv8my
	6cHShN8rJMUkg2LN9DNvtr/m9nydU12Ee8yiXH1ioHS+rlNorLfUmgS76iLJBsYY8nW13x683bmy3
	9ZCOEpVRFQAmgSY0pMlzq7a3zo2XhXpqeBp3oa230Q8/6oJvHtjPzQ8fJN7D4ADrV5ImIAaCpyFe+
	sriu6ieR4Y8wI9181XrrDK6miFemLCFG2Z7PcxvQrU8vm7ZeNF+X2933ZOJEs4TS3JuEOpB7q8n8k
	pdNK/TxHlQ61E2jVUcINcK7gQIyDg3qwIAKZK5+AF0ZvtxL2SC2LPNVn4zcJsDCdeglmySnKffNU3
	NiFIai4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OAB-00000005ZKQ-36K3;
	Tue, 15 Sep 2026 08:05:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OAA-00000005ZJq-1Rnb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 08:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jKg7zPw7lKK/zV2TerSGH2lZsZENXJkv8MUeOswc3dg=; b=IQ2zdRYAJ900HaiNPdtecMoo1u
	nSkANnWrYxhFIbvN+TtA6xyU4vxGfB0ZIcqe+ZoTUWzz2PDwdpUJpIaEuBc60btONw5PTbg/OZU2P
	NXoY4ECckkDa1lHkzeybDvupuPwn9JIqbaQL6mOTz/sBKm/nChsW7JiNgK5h5Jm4vK252zGmnnsL4
	jM6WfNS0vG8kaG149yyJLSa0kb4e6odvJfRFL/9GNzHWuRR4nleqWpZ+hjHLU3ra3pg4DETgj0Ddg
	lihBIl+MVzHbeqqwiMWmQtV2sI8gWbPMT9wIOYKwICU0E25uaOaynGxLlkekQ2w0ng8jNj3QJdHGr
	UlrSBlxg==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6OA7-00000006PQ5-0Rsq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:05:09 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so2830225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459504; x=1790064304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jKg7zPw7lKK/zV2TerSGH2lZsZENXJkv8MUeOswc3dg=;
        b=l6JW17ZpsXsishBGnR7YhYQ6oR3+RHGXVv6yGp5VQsc8GFsS2fZk0vlINeA+NKxXxa
         VLYMYNu8NceB3zTLq92guyxAsKPYwzJMrM5qUO8TzNq5xkqTDm6C/OVMYthPWTRlVfI4
         Xh/kYa4SySyKzF2Nbl0l3L+joRa6ANRtrZQRV+rMk8JKImVSZ4QAc47VOBcbyQEcixWu
         NWi9dr8s5sRCXEC+MMKY69/QFV0iigzEICO+dVf+UmOMS1nvgf86O1/NIQ6m88/39tFa
         6yRjJmC1gu6VrWuu2dEoxNE8BM2Va+CdoInjcwcAHiOXS/gJPHqg9SKeAiLOUaswRE0K
         jHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459504; x=1790064304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jKg7zPw7lKK/zV2TerSGH2lZsZENXJkv8MUeOswc3dg=;
        b=dv8/Iyh22u4kR+NaskOddNUPOxry+3Uk5U9VC8DOYI4IKYTJhGZ6wA7zDUB03W+GdL
         6o7cI7XMTl0nNluFambbTDHbZlCmD4hp8nCZWEhnR8mnUDhivm1S7DULMsebWgsrzzVU
         dvw685nn8BRI2KEPcx06GFeAN3FnVrEqSYDrhBe6KbWycWizYb91Nxka0KjXnGzB0pMz
         7OqKxmMQjbq/zFUWSO2Yyd2gfSksNVWYo/gwekYQa3nqwQhB//clZDGSG768NIKl5C3A
         LzS9lVv3H7emFSkHnxoO6j0jIwQ2AYTupwrD24tJ7aG74awn/7Bv9sgU6TBHoQML7tzw
         hOGg==
X-Forwarded-Encrypted: i=1; AKwUvBxmZhxW36u3ulPg8dwMzAOJc1aDD8J0M+xEl73dXb0/EMdLLCfWPMfhO5SedZ32jCVj+GflGWRhROtiob5KOHAO@lists.infradead.org
X-Gm-Message-State: AFuF++ktVUrvxg+laKi7muryo76JacDvQA2/j7SGh0+VbGZbazjbkycN
	6d66ramy2ykMp4PVSxddWEvw2PWGxUmV0yG3HcCcUKzyV5rqVQah/DL5
X-Gm-Gg: AYBFou2+a8TGqErJhW9RYi3AE2mSaa3fKwyZb+W1Q33bwBChW692+Hdzu/mH7lCtMzk
	dlPoJdf/Zd93rIDso0uhMq07zsnqQ0dG7/QqPSDpKX9K0JLhzwqlk0ZoARjqT0L1xHuHcUjLt0G
	ekxImzhOZsg+cq1pOS5QCPZx4M9JoTe0uaSvzRYoX8Y+IiGxs48cATdGdL9OR9wtYHJ0o2YoP3o
	Io2+wlj5hN3+6lVsJmnZ5v3rjDDsofkFondcqmka1G1db+H7OKaHEwfMUYWmkHbSEhv9lQsVkeN
	6k0x2FmrIRtm6gOghpgYdxuaVFQRlm9Urp72692fHvGa8GG/o7GbDUzh0ZRfpxjSQ89j7KPPU7f
	77BxvApBQF138F4ojtCPybOnABYlN8GTcLVzbQNADr6KSVCvw2UYR7TYRceETHUo3syLWw4eWcd
	FgiVet8yiyq0ERqfeuUbcPtAsl7riQv4AE+FS+hiuw8f1BM37ml9FC2zZ5aAt51xl2tRVgloBPP
	3koqg==
X-Received: by 2002:a05:600c:138e:b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49e7d73329amr36502225e9.7.1789459503413;
        Tue, 15 Sep 2026 01:05:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v6 0/4] gpio: mmio: report the line direction on chips without direction registers
Date: Tue, 15 Sep 2026 10:04:57 +0200
Message-ID: <20260915080501.329424-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_090507_320403_80E081AE 
X-CRM114-Status: GOOD (  28.25  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Bartosz, Linus,

this replaces the gpiolib guard patch [1], along the lines Bartosz
suggested there: instead of teaching gpiod_get_direction() to stay quiet
when a chip has no get_direction(), give gpio-mmio one and let the pin
controller tell it what the pad does.

The user is the Vybrid GPIO block (gpio-vf610, a generic mmio chip with
GPIO_GENERIC_PINCTRL_BACKEND and no direction registers, the direction
lives in the iomuxc pad as the OBE bit). Today a gpiod_get_direction()
there trips the WARN in gpiolib; on gpio/for-next the i2c core does it
on every boot of a Colibri VF61/VF50, asking for the SDA line's
direction before bus recovery.

Patch 1 is new in v6, after Haibo's review: the CONFIG_PINCTRL=n stubs
of pinctrl_gpio_get_config() and pinctrl_gpio_set_config() return 0
today, success for a configuration nobody read or applied. They now
return -ENOTSUPP, which is what a chip without pin ranges already gets
from gpiochip_generic_config() with pinctrl enabled.

Patch 2 is the pinctrl-imx side. Bartosz asked whether the raw register
coming back from pin_config_get() is a bug in pinctrl-imx: it is, the
callback never looked at which parameter was requested. It now answers
PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_INPUT_ENABLE on SoCs that say
where those bits live (Vybrid: OBE bit 1, IBE bit 0) and -ENOTSUPP for
everything else, the SCU based SoCs included; the debugfs dump, the only
raw-register user, reads the register through its own helper. The set
callback stays raw, as the fsl,pins binding requires. Converting the
driver fully to generic pinconf is a bigger job than this fix needs.

Patch 3 is what Linus asked for on v3: an optional get_config() in
struct gpio_chip and gpiochip_generic_get_config() as its pin control
backed implementation, the mirror of gpiochip_generic_config(). The
packed parameter goes in, its bare argument comes out, as with
pinctrl_gpio_get_config(). No consumer API.

Patch 4 keeps the direction in gpio-mmio's existing shadow and installs
the shadow-reading get_direction() for the "pinctrl backend, no
direction registers" combination. The pad is asked once, from request(),
in process context, through gc->get_config(), so it is safe for the
gpiochip_lock_as_irq() path that calls get_direction() under the irq
descriptor lock.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next, with
DEBUG_ATOMIC_SLEEP and PROVE_LOCKING enabled: no backtraces, and
/sys/kernel/debug/gpio shows the same direction for every requested line
as 6.18 does (the hogs, the SD card detect input, the USB VBUS regulator
output). On a test-only pad handed to userspace, a line driven as an
output and released reports "out" to the next as-is request, an edge
request on it is still accepted and turns it back into an input, and
both match the OBE bit in the pinconf debugfs dump. Lines the pin
controller cannot answer for keep the input default gpiolib assumed
before, so nothing that worked before is affected. The initial direction
scan in gpiochip_add_data_with_key() runs before the pin ranges exist
and still guesses; only requested lines get the real answer. The
pinconf-pins and pinconf-groups debugfs dumps are the same as on 6.18.
Patch 2, unchanged since v5, was also booted on a Verdin iMX8MP
(6.12.107) with the same debugfs comparison. The CONFIG_PINCTRL=n side
was compile tested (GPIOLIB, gpio-mmio, gpio-by-pinctrl, gpio-aspeed),
and the Vybrid configuration built with W=1.

On trees: Linus offered to take patch 2 through pinctrl, and patch 1 is
pinctrl as well. Patch 4 gives wrong answers without patch 2 (an
undecoded pad register would seed every requested line as an output), so
I would rather the two pinctrl patches land first or in the same cycle
as the two gpio patches, whichever way you two prefer to split it.

Linus's Reviewed-by on patch 3 was given on v5; the only change since is
the dropped #else branch Haibo asked for, so I kept the tag. Please say
if it should not carry over.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Changes in v6:
- new patch 1: the CONFIG_PINCTRL=n stubs return -ENOTSUPP instead of
  claiming success (Haibo Chen)
- patch 3: gpiochip_generic_get_config() loses its own #else branch and
  mirrors gpiochip_generic_config() exactly (Haibo Chen)
- patch 4: commit message notes that dir_unreadable is now also set for
  a pinctrl-backed chip without direction registers (Haibo Chen), and
  states the dependency on patch 2
- patches 2 and 4: collected Haibo Chen's Reviewed-by
- patches 2 and 3: collected Linus Walleij's Reviewed-by
- patch 4: the backtrace count in the commit message is what today's
  gpio/for-next produces (one, from the i2c core), not the 21 of the
  earlier base
- rebased on gpio/for-next

Changes in v5 (patch numbers as in v6):
- patch 3: the get_config() documentation said the answer comes back
  packed; it is the bare argument, like pinctrl_gpio_get_config() returns
  (Sashiko review). Text only, no code change.

Changes in v4:
- new patch 3: get_config() in struct gpio_chip and
  gpiochip_generic_get_config() (Linus)
- patch 4: seed the shadow through gc->get_config(), no pinctrl call
  and no CONFIG_PINCTRL check in gpio-mmio (Linus)
- patch 2: drop the npins check, pin_request() already rejects a pin
  the controller does not have

Changes in v3:
- patch 2: return -ENOTSUPP for the SCU based SoCs instead of letting
  the firmware call hand back the raw pad value (Sashiko review)
- patch 2: -EINVAL for a pin the device tree never configured, -ENOTSUPP
  only for unsupported parameters and SoCs
- patch 2, 4: drop two comments that only restated the code

Changes in v2:
- patch 2: decode the requested parameter instead of returning the raw
  register; debugfs group dump reads the register through its own helper
- patch 4: keep the direction in the gpio-mmio shadow, ask pinctrl once
  from request() instead of from get_direction()

Mehmet Fide (4):
  pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpiolib: add get_config() and gpiochip_generic_get_config()
  gpio: mmio: track the direction of chips without direction registers

 Documentation/driver-api/gpio/driver.rst  |  7 +++
 drivers/gpio/gpio-mmio.c                  | 60 +++++++++++++++++++++--
 drivers/gpio/gpiolib.c                    | 21 ++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c   | 54 ++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 include/linux/gpio/driver.h               |  9 ++++
 include/linux/pinctrl/consumer.h          |  4 +-
 8 files changed, 151 insertions(+), 10 deletions(-)


base-commit: 7257c35db0fdb4fb02d857a8197a16afa84d92c0
-- 
2.55.0


