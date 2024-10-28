Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37272D33982
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kb4LdJWW6f8y1GhUSlZL6T9c+Ow9/VMDwR8sFapd1nA=; b=KXSfvGa8PNn6ru2xO3I1bIj1U/
	DTkVzHU5tqNzrof4jSOHky87tRwURFR0bIU16vdXpobT2+i9v0t26fXvFiZ3gx+C3byWLbKfiRShB
	lRwEFC/ZyhbFDeiRFsXT8uOtPjATV3z5ZFsk9Mg1DF7w0/9R1OaGGCxl/jd5E/b3QkZhdq8cKXxxl
	uDXaBnPTmZS8HAcSmBhqbVUGaV0eaimkmBs0Axnyb84W0JtGeusLuklxEkke39NIH92dF1maw5RVR
	4sDqYOjjXlS/MvPeJ2psDFp3vVDgh9b7r2a2u3KAGwG8ASxT9ROhvTg0L+mSZ8lUPCsPKNGc9bxjh
	gMRaeAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QNH-0000000B2Ol-1E3u;
	Mon, 28 Oct 2024 14:05:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QKX-0000000B1g0-3wuK;
	Mon, 28 Oct 2024 14:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730124166;
	bh=GARURTPO3rxpQXzZwj7FF8BdkvH2AjtCyCh0MqYT5vA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BPKqAkDEwKSvzgI+d7NCdISq1yOm+4PmPcY/g1FvCeseJW1LI6xksrH7ivDzwWxY5
	 sGqELxzRCfM4QwZcJkbonBxQkoQj/0zgG6NAKf4D5lL0u+4YE4Zr6yPVJkdfC0F3VL
	 nwDEgq5fKNXFTNu4mJ/ZslyE8VgdhNLc7PcFvjAgUFw94CbWQWUPZRceD9j4Y/mBkt
	 vfsLrVEOK56FqOR7pbYISoTvp5pHgDj4+zTYPHuwwWsxIRcL4FYFG93xlG0NR4USg7
	 wV0JoYWq/+kUZY0slHTCCObmYSLpNOygG0WBNM207xU/wdum4dvi5nzqxu21z5TPhL
	 l/sjPvx8i1Z4g==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 321DF17E3613;
	Mon, 28 Oct 2024 15:02:44 +0100 (CET)
Date: Mon, 28 Oct 2024 10:02:41 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Subject: Re: [PATCH RFC v2 0/5] Verify bias functionality for pinctrl_paris
 driver through new gpio test
Message-ID: <cda91b70-7179-49b5-9207-3fa3a1aaa4d5@notapiano>
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_070250_201523_ACCDEC36 
X-CRM114-Status: GOOD (  30.54  )
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

On Fri, Oct 25, 2024 at 03:45:35PM -0400, Nícolas F. R. A. Prado wrote:
> This series was motivated by the regression fixed by 166bf8af9122
> ("pinctrl: mediatek: common-v2: Fix broken bias-disable for
> PULL_PU_PD_RSEL_TYPE"). A bug was introduced in the pinctrl_paris driver
> which prevented certain pins from having their bias configured.
> 
> Running this test on the mt8195-tomato platform with the test plan
> included below[1] shows the test passing with the fix applied, but failing
> without the fix:
> 
> With fix:
>   $ ./gpio-setget-config.py
>   TAP version 13
>   # Using test plan file: ./google,tomato.yaml
>   1..3
>   ok 1 pinctrl_paris.34.pull-up
>   ok 2 pinctrl_paris.34.pull-down
>   ok 3 pinctrl_paris.34.disabled
>   # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Without fix:
>   $ ./gpio-setget-config.py
>   TAP version 13
>   # Using test plan file: ./google,tomato.yaml
>   1..3
>   # Bias doesn't match: Expected pull-up, read pull-down.
>   not ok 1 pinctrl_paris.34.pull-up
>   ok 2 pinctrl_paris.34.pull-down
>   # Bias doesn't match: Expected disabled, read pull-down.
>   not ok 3 pinctrl_paris.34.disabled
>   # Totals: pass:1 fail:2 xfail:0 xpass:0 skip:0 error:0
> 
> In order to achieve this, the first three patches expose bias
> configuration through the GPIO API in the MediaTek pinctrl drivers,
> notably, pinctrl_paris, patch 4 extends the gpio-mockup-cdev utility for
> use by patch 5, and patch 5 introduces a new GPIO kselftest that takes a
> test plan in YAML, which can be tailored per-platform to specify the
> configurations to test, and sets and gets back each pin configuration to
> verify that they match and thus that the driver is behaving as expected.
> 
> Since the GPIO uAPI only allows setting the pin configuration, getting
> it back is done through pinconf-pins in the pinctrl debugfs folder.
> 
> The test currently only verifies bias but it would be easy to extend to
> verify other pin configurations.
> 
> The test plan YAML file can be customized for each use-case and is
> platform-dependant. For that reason, only an example is included in
> patch 3 and the user is supposed to provide their test plan. That said,
> the aim is to collect test plans for ease of use at [2].
> 
> [1] This is the test plan used for mt8195-tomato:
> 
> - label: "pinctrl_paris"
>   tests:
>   # Pin 34 has type MTK_PULL_PU_PD_RSEL_TYPE and is unused.
>   # Setting bias to MTK_PULL_PU_PD_RSEL_TYPE pins was fixed by
>   # 166bf8af9122 ("pinctrl: mediatek: common-v2: Fix broken bias-disable for PULL_PU_PD_RSEL_TYPE")
>   - pin: 34
>     bias: "pull-up"
>   - pin: 34
>     bias: "pull-down"
>   - pin: 34
>     bias: "disabled"
> 
> [2] https://github.com/kernelci/platform-test-parameters
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Changes in v2:
> - Added patches 2 and 3 enabling the extra GPIO pin configurations on
>   the other mediatek drivers: pinctrl-moore and pinctrl-mtk-common
> - Tweaked function name in patch 1:
>   mtk_pinconf_set -> mtk_paris_pin_config_set,
>   to make it clear it is not a pinconf_ops
> - Adjusted commit message to make it clear the current support is
>   limited to pins supported by the EINT controller
> - Link to v1: https://lore.kernel.org/r/20240909-kselftest-gpio-set-get-config-v1-0-16a065afc3c1@collabora.com
> 
> ---
> Nícolas F. R. A. Prado (5):
>       pinctrl: mediatek: paris: Expose more configurations to GPIO set_config
>       pinctrl: mediatek: moore: Expose more configurations to GPIO set_config
>       pinctrl: mediatek: common: Expose more configurations to GPIO set_config

I forgot to mention that I don't have hardware that uses the moore or the common
drivers, so I'm not able to runtime test patches 2 and 3. So help with that is
appreciated.

Thanks,
Nícolas

>       selftest: gpio: Add wait flag to gpio-mockup-cdev
>       selftest: gpio: Add a new set-get config test
> 
>  drivers/pinctrl/mediatek/pinctrl-moore.c           | 283 +++++++++++----------
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |  48 ++--
>  drivers/pinctrl/mediatek/pinctrl-paris.c           |  26 +-
>  tools/testing/selftests/gpio/Makefile              |   2 +-
>  tools/testing/selftests/gpio/gpio-mockup-cdev.c    |  14 +-
>  .../gpio-set-get-config-example-test-plan.yaml     |  15 ++
>  .../testing/selftests/gpio/gpio-set-get-config.py  | 183 +++++++++++++
>  7 files changed, 395 insertions(+), 176 deletions(-)
> ---
> base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
> change-id: 20240906-kselftest-gpio-set-get-config-6e5bb670c1a5
> 
> Best regards,
> -- 
> Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

