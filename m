Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D732C5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 19:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYtufi31esdthh9skm50DsS40oKA05LQqbajS7Trxzs=; b=Z7Gc2e3cKrvcPCRg8oRq3hQFjQ
	XCEeKNjS1vUf61Pc6c3YZMDlljiMQ+LOF26dJhrCh14fQnretuXgdCNhflFi4OxEhD5Az/rd85Z3J
	dQz1uygJTFU4rKOOENFNuT9YixPMvFDNcTU8I+gGaZ8A3hz3T61HN+ukCUesL66jMejunZC4zRqVy
	HGJx4dvybnFcHchc+sXWYZRMPogpJB1rNy7MCu4M44u+Hu4eJpcLk3xj9BlbML14tH0+Ixey4PFKm
	h3FzuMalpdtXbHAyHW3nxqm7N7hAWpc4W+Lxxje8BQtZlmSxp4p+2OXjXtvgM5v2dA+fE0/SXab5F
	mbFu4Oyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3I7-00000006jbZ-2dCW;
	Mon, 17 Aug 2026 19:46:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3I5-00000006ja0-0SR3;
	Mon, 17 Aug 2026 19:46:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E78C60A69;
	Mon, 17 Aug 2026 19:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AC11F000E9;
	Mon, 17 Aug 2026 19:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786995996;
	bh=jYtufi31esdthh9skm50DsS40oKA05LQqbajS7Trxzs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=EXE9SNbuoc/FVdgBY3XEwncT9Oe1hlZbedIMw2pfqDCgd+yI5VThgL3nQEqLF8z2O
	 6BQeLZvK9w3M+2GJ8Zf2jN31swsywkBchOlK8KLCYSQ0vDSenuRGA858WO+hQHoXbG
	 ROq8+MWxb4TfjQljoc1JMennkP8rOmRFld9dszNEAAs4TAJY9FAZp9YI//aVyHWgx+
	 q2x9NjTIM6mbK2he4cFc00s2cgvDB2I2ESU9OCi9lX5x7z5xQW6858PD/5jv2hqPal
	 +jxMTenqk3m5yC48AXZp8iPP+BrpIQqNBK934knQNQKweJ0gZ4NcEZFXsNGz3x5Hf9
	 9v/dW25V+jnrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939C13926262;
	Mon, 17 Aug 2026 19:45:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: npu: load the firmware without the
 sysfs
 fallback
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178699594816.1691257.16349624064991937172.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2026 19:45:48 +0000
References: <20260811181717.19339-1-sochnev.v.74@gmail.com>
In-Reply-To: <20260811181717.19339-1-sochnev.v.74@gmail.com>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 11 Aug 2026 19:16:59 +0100 you wrote:
> airoha_npu_load_firmware() maps a missing firmware file to -EPROBE_DEFER
> so that the NPU can be brought up once the rootfs carrying /lib/firmware
> has been mounted. That mapping holds only as long as request_firmware()
> reports -ENOENT.
> 
> It does not when the sysfs fallback is in play. With
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK set, or with the fallback armed at
> runtime through /proc/sys/kernel/firmware_config/force_sysfs_fallback,
> request_firmware() hands the request to a userspace helper, waits out the
> full loading_timeout and returns -ETIMEDOUT. The -ENOENT test no longer
> matches, dev_err_probe() turns the result into a hard failure, and the
> NPU is left unbound after stalling the boot for 60 seconds:
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: npu: load the firmware without the sysfs fallback
    https://git.kernel.org/netdev/net-next/c/a085e68b1390

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



