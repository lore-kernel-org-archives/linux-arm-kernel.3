Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE46C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 19:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsptZbQhOlg/intxC6fpqHAtDQX96QcSH9zQlBzbV0E=; b=MAHn7wmvs4SJpOY4Wdsk5o0IXr
	g9cmQl9uMx01vWTp3/KcLwEyajH2Nrt2MIyTJaNxA8Djih1j4qkJwY/alxbunnRXCCW19+WooTKPL
	qf8Mhf1mNAGKXrTAtuSakIsCuKZQuLVsnvp1Lfe/XN5/5DxdnGmtyilA+HG9FECEZ7BjByF6W9FKt
	b/39PftQmixOh2dzBI6YjEEu1GtTklm5AsUZditBUoTH0Wtpqn/JCDOBzooyHhIdCApA9c8vGoJC1
	HK325iOZi9Is9YKXIQto/TooGK6Gu5LfdSmRQqItGyWJVsasMF7WxW/N/YaQ5w2ZDOxKOmFZBRquE
	TNq+zwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1zs-0000000GS0E-12E0;
	Mon, 03 Feb 2025 19:20:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1uo-0000000GQEs-2KBn;
	Mon, 03 Feb 2025 19:15:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 168875C6791;
	Mon,  3 Feb 2025 19:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC92C4CED2;
	Mon,  3 Feb 2025 19:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610125;
	bh=BDPM7u1CRvEI1Kn3lZuF8kskwCiEX3Kitywmg+8MwZU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hYhm3W1QYCkDsN1crFMcC5vC3MonK+qkCAOz+WwdhOVUHZ0HLjZTQAsg3tl7o9s8H
	 BU+bqi9jyOYbxwC9ei76Mq8ptcXqsd5SOh/+8og70lDYJL3RqtnPerGIZTHCANkamQ
	 Yckq82B8xZnfo+4rNvq7hQkLnKU+EQGYkdYhQiJAOqj4uCdhBQcjpFfp1P/bTDp3Yi
	 HOV2GGByqpfdPESu++AwzdFyQr0pmhKP6IC3N45Oo9VeJUx9wz3qUds6G2jzdwYpTR
	 CH+85Ld4snwX3gUvih7vhRHBGwI6rZla+uTR8mjJBtjlPBw44r3zYQ1Yg3dnH2nSQb
	 8qk8l0+zUOkqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB437380AA67;
	Mon,  3 Feb 2025 19:15:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/12] pm: Introduce devm_pm_set_wake_irq
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861015275.3409359.13632354633861115390.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:52 +0000
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com>
In-Reply-To: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-riscv@lists.infradead.org, rafael@kernel.org, len.brown@intel.com,
 pavel@ucw.cz, gregkh@linuxfoundation.org, dmitry.torokhov@gmail.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linus.walleij@linaro.org,
 conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 peng.fan@nxp.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111526_678753_461EA3D0 
X-CRM114-Status: GOOD (  10.32  )
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Rafael J. Wysocki <rafael.j.wysocki@intel.com>:

On Fri, 03 Jan 2025 16:41:12 +0800 you wrote:
> This was a retry to address [1][2], to let common code handle
> dev_pm_clear_wake_irq. Then no need to call dev_pm_clear_wake_irq
> in each driver.remove() hook and error handling path.
> 
> In this patchset, I include input and rtc patches to show the usage
> to avoid introducing an API without users. There are still
> other places using dev_pm_clear_wake_irq. If this patchset is
> good for you, I could start to clean up other drivers such as mmc and
> etc.
> 
> [...]

Here is the summary with links:
  - [v2,01/12] PM: sleep: wakeirq: Introduce device-managed variant of dev_pm_set_wake_irq
    https://git.kernel.org/riscv/c/fd8318a32573
  - [v2,02/12] input: keyboard: ep93xx_keypad: Use devm_pm_set_wake_irq
    (no matching commit)
  - [v2,03/12] input: keyboard: omap4_keypad: Use devm_pm_set_wake_irq
    (no matching commit)
  - [v2,04/12] input: misc: nxp-bbnsm-pwrkey: Use resource managed API to simplify code
    (no matching commit)
  - [v2,05/12] input: touchscreen: ti_am335x_tsc: Use resource managed API to simplify code
    (no matching commit)
  - [v2,06/12] rtc: stm32: Use resource managed API to simplify code
    (no matching commit)
  - [v2,07/12] rtc: nxp-bbnsm: Use resource managed API to simplify code
    (no matching commit)
  - [v2,08/12] rtc: ds1343: Use devm_pm_set_wake_irq
    (no matching commit)
  - [v2,09/12] rtc: pm8xxx: Use devm_pm_set_wake_irq
    (no matching commit)
  - [v2,10/12] rtc: ab8500: Use resource managed API to simplify code
    (no matching commit)
  - [v2,11/12] rtc: mpfs: Use devm_pm_set_wake_irq
    (no matching commit)
  - [v2,12/12] rtc: pl031: Use resource managed API to simplify code
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



