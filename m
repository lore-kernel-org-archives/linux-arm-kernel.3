Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A202BD149EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 20:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j/pb4zCNm+lJNIusOb/N5Ltp99Mkki63C1Jb6pYb0YQ=; b=vxdHeYzNpNw2p3
	S7qFf1KYzwvoisShgm/jqlLXejlT0zaVQBZiHZAXzAYzVGFCBe6OZ4tkX3mp7/zqNySRG9KNOQN5w
	1i1r3fMfVvR62GRu4TrJ/ALJb5XWgWM1Z/JShF05dbzfaPbOStIjOG+dQBQieRGpIpMf+p31YeH93
	53XWAPFrwD8gBho1AKRGIEPIVm3sPkCeVz1J6nwCyY8bUE5P/jOTG3u7LY258yDNffwhGziqBP3UW
	YAdIlKd+hXhjOGNnms1ktO7oR7Mqv6Orkn9yLIMLTKtQv2WM5GPNtWg/DFgn9q5SNA/MvhjzKsHFV
	i4ADgJaf6FeqzJeWV9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Qcx-000000054Zs-00Oo;
	Fri, 25 Oct 2024 20:09:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QGw-000000052Gl-3JCu;
	Fri, 25 Oct 2024 19:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=j/pb4zCNm+lJNIusOb/N5Ltp99Mkki63C1Jb6pYb0YQ=; b=iKHr5wF953HhZ6puAN5apk8Vwl
	/RQW4NfJWsb+lX+enQk2n/6Yy0qAqpzDzAdAdEa4MB0g7K8M5zSRvJGqYnksojQFRXt5WsFR5qdcP
	WqmqkeSkFRZvkTpQ15Csyiq7pAh8RKEQb1cBptb60rfmq9pGHEqWdYp9kiwJOkr3RmRnTEhAAdVLL
	N4YFMD9GHWaJOETnMX7Cww426+rKJU2qZXqlF4v8Rwc0LGDKJh/7JruOzoDsxcSot94soDFBYX/vF
	tbCOzhhPv2tmVh8d/BIIYorltVnOZdW3asReqfQnl8r5GzwDngfKngWml+Fv9m7NtpFv/Vb85pn6y
	4R8ILHIA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QGH-000000093VI-28Tk;
	Fri, 25 Oct 2024 19:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729885568;
	bh=a1xD5U+KJRHHHihCSOYqaYazM7sD048UvQTjfIB42Gs=;
	h=From:Subject:Date:To:Cc:From;
	b=BgYrs3ekdOayxKEFAUcDI91I69Pms2obdaqO60iGnJ+8ccKCq+VqafhPQliizIHv2
	 4/Om4Yu589ezyURJsJqv4HmTZmRQ0bIRkLyXIhhWdsZvV7fbdVJK7xLUuQ9DnEZlG6
	 R/ZjygaS8Y0NGtodknIvfvg+Mhfzj4hq3SORioMWnx3ykaCuGIS2ZP2AK93ttOPA5A
	 wF0Gv6sKFJ+hkGAfHQbzI0xcI5VktsE4SCHngYoRNgToH3lCXZGihUZ/kV/9QUsrdd
	 T3jufgDRuN2iiogTP0S2o7IqebXyfot3eEEngGO0DIeZbEfA4ZBgCuMeKUEw3xT9Ji
	 x6O8hHrJY1O6g==
Received: from [192.168.1.54] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85DC217E3704;
	Fri, 25 Oct 2024 21:46:06 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH RFC v2 0/5] Verify bias functionality for pinctrl_paris
 driver through new gpio test
Date: Fri, 25 Oct 2024 15:45:35 -0400
Message-Id: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF/1G2cC/4WNTQrCMBCFr1JmbSSpNlJXguAB3EoX6ThpB9tOS
 UpRSu9uKO5dPHg/8L0FIgWmCOdsgUAzR5YhhXyXAbZuaEjxM2XIdX7UpbbqFanzE8VJNSOLipR
 MEsrguVGWirq2J43GFZAYYyDP743/gPvtClUqW46ThM/2OZtt+uHLP/jZKK2MddoWzuMBzQWl6
 1wtwe1ReqjWdf0C88Dq29MAAAA=
X-Change-ID: 20240906-kselftest-gpio-set-get-config-6e5bb670c1a5
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 kernelci@lists.linux.dev, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_204632_337385_DF6824CD 
X-CRM114-Status: GOOD (  15.46  )
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

This series was motivated by the regression fixed by 166bf8af9122
("pinctrl: mediatek: common-v2: Fix broken bias-disable for
PULL_PU_PD_RSEL_TYPE"). A bug was introduced in the pinctrl_paris driver
which prevented certain pins from having their bias configured.

Running this test on the mt8195-tomato platform with the test plan
included below[1] shows the test passing with the fix applied, but failing
without the fix:

With fix:
  $ ./gpio-setget-config.py
  TAP version 13
  # Using test plan file: ./google,tomato.yaml
  1..3
  ok 1 pinctrl_paris.34.pull-up
  ok 2 pinctrl_paris.34.pull-down
  ok 3 pinctrl_paris.34.disabled
  # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0

Without fix:
  $ ./gpio-setget-config.py
  TAP version 13
  # Using test plan file: ./google,tomato.yaml
  1..3
  # Bias doesn't match: Expected pull-up, read pull-down.
  not ok 1 pinctrl_paris.34.pull-up
  ok 2 pinctrl_paris.34.pull-down
  # Bias doesn't match: Expected disabled, read pull-down.
  not ok 3 pinctrl_paris.34.disabled
  # Totals: pass:1 fail:2 xfail:0 xpass:0 skip:0 error:0

In order to achieve this, the first three patches expose bias
configuration through the GPIO API in the MediaTek pinctrl drivers,
notably, pinctrl_paris, patch 4 extends the gpio-mockup-cdev utility for
use by patch 5, and patch 5 introduces a new GPIO kselftest that takes a
test plan in YAML, which can be tailored per-platform to specify the
configurations to test, and sets and gets back each pin configuration to
verify that they match and thus that the driver is behaving as expected.

Since the GPIO uAPI only allows setting the pin configuration, getting
it back is done through pinconf-pins in the pinctrl debugfs folder.

The test currently only verifies bias but it would be easy to extend to
verify other pin configurations.

The test plan YAML file can be customized for each use-case and is
platform-dependant. For that reason, only an example is included in
patch 3 and the user is supposed to provide their test plan. That said,
the aim is to collect test plans for ease of use at [2].

[1] This is the test plan used for mt8195-tomato:

- label: "pinctrl_paris"
  tests:
  # Pin 34 has type MTK_PULL_PU_PD_RSEL_TYPE and is unused.
  # Setting bias to MTK_PULL_PU_PD_RSEL_TYPE pins was fixed by
  # 166bf8af9122 ("pinctrl: mediatek: common-v2: Fix broken bias-disable for PULL_PU_PD_RSEL_TYPE")
  - pin: 34
    bias: "pull-up"
  - pin: 34
    bias: "pull-down"
  - pin: 34
    bias: "disabled"

[2] https://github.com/kernelci/platform-test-parameters

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Added patches 2 and 3 enabling the extra GPIO pin configurations on
  the other mediatek drivers: pinctrl-moore and pinctrl-mtk-common
- Tweaked function name in patch 1:
  mtk_pinconf_set -> mtk_paris_pin_config_set,
  to make it clear it is not a pinconf_ops
- Adjusted commit message to make it clear the current support is
  limited to pins supported by the EINT controller
- Link to v1: https://lore.kernel.org/r/20240909-kselftest-gpio-set-get-config-v1-0-16a065afc3c1@collabora.com

---
Nícolas F. R. A. Prado (5):
      pinctrl: mediatek: paris: Expose more configurations to GPIO set_config
      pinctrl: mediatek: moore: Expose more configurations to GPIO set_config
      pinctrl: mediatek: common: Expose more configurations to GPIO set_config
      selftest: gpio: Add wait flag to gpio-mockup-cdev
      selftest: gpio: Add a new set-get config test

 drivers/pinctrl/mediatek/pinctrl-moore.c           | 283 +++++++++++----------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |  48 ++--
 drivers/pinctrl/mediatek/pinctrl-paris.c           |  26 +-
 tools/testing/selftests/gpio/Makefile              |   2 +-
 tools/testing/selftests/gpio/gpio-mockup-cdev.c    |  14 +-
 .../gpio-set-get-config-example-test-plan.yaml     |  15 ++
 .../testing/selftests/gpio/gpio-set-get-config.py  | 183 +++++++++++++
 7 files changed, 395 insertions(+), 176 deletions(-)
---
base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
change-id: 20240906-kselftest-gpio-set-get-config-6e5bb670c1a5

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


