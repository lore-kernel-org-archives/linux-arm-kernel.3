Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59726CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BASQsGTAf4/JG9/5xVbsFJZDHdyR3Pn4iHMnd9rEmIs=; b=ks6P2h1Trt4uN7EnxlSVQ4D6TD
	C6reryrDBfxDt8s3VudNMNocrkFvkUXbH1Ot0hCjwkJeIEKPm8JjHvDpFS/5PaZGcFHPz4aEiCt8R
	/46f5ms5M7hHgEHgbGmeA9e6H8OD5kj9CkZIHjbE/0lSgpJ3b061q+dWlVXgMTDfUQG024Ui6yAaq
	JnjULkKsEL5h1rBmAbYWvNJoWCkEXFdBQuHKFaAEwlvNu2hAYbZH95l/SHEGwftggBB3QUjMUBi3+
	tdixgcX9xiUitQgkbxwOjvIvqE10pXjmPDxTBhVLIfUfjT4edZEWZTiZMYbCcUm03NwC3TaP50gp8
	QLm+Fk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCD7B-00000008N7Y-3k7r;
	Thu, 01 Oct 2026 09:30:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCD7A-00000008N7B-1H9f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:30:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0D6243D50;
	Thu,  1 Oct 2026 09:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828801F000FF;
	Thu,  1 Oct 2026 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790847007;
	bh=BASQsGTAf4/JG9/5xVbsFJZDHdyR3Pn4iHMnd9rEmIs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=beL2mUp3MEQ2SzIRzIxpVDe+gwf84TxZZF2/q4ZJhsXxRStFUo2sf00kxm14aW2fc
	 wCLoPiLmoFP5ul0zQ4PWi6YF9J8NJC2JAfCh+QxnMqlbCB4+eSReVi10xn7OKz/WyW
	 B00rKffEBAU0s2rSxqB94G6cYdsZsg8z2m/PUz/ttzrKerG2k9+aekBCUkzuddBDJq
	 HiL/lpfti1LjKXNPSE8vkvgBlThE+JMgpi/cZ4Z2G/MTET03dlKD7/bdoMHF8wmaNs
	 SeSOiDf/CT92Hj58gMn1aP46I16SVziqckkAaXAsZHIZvYpxuDaIYFThx9tyASoWY7
	 bud/bWcOg3fxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773E1380DBD7;
	Thu,  1 Oct 2026 09:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] net: axienet: allow instantiation without
 a
 device tree
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179084700627.2358019.13742661894584329814.git-patchwork-notify@kernel.org>
Date: Thu, 01 Oct 2026 09:30:06 +0000
References: <20260928074256.462345-1-maimon.sagi@gmail.com>
In-Reply-To: <20260928074256.462345-1-maimon.sagi@gmail.com>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 vadim.fedorenko@linux.dev, richardcochran@gmail.com
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 28 Sep 2026 10:42:54 +0300 you wrote:
> The ADVA TimeCard X2 is a PCIe timing card driven by ptp_ocp.  Its FPGA
> contains an AXI Ethernet MAC with an AXI DMA engine.  The plan discussed
> on netdev [1] is for ptp_ocp to register the MAC as a child platform
> device described by a software node, so that this driver runs it rather
> than a copy in ptp_ocp; Vadim Fedorenko agreed that a platform device is
> the way to go.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: axienet: use device_property and fwnode APIs for probe-time config
    https://git.kernel.org/netdev/net-next/c/f5185ec79dac
  - [net-next,v2,2/2] net: axienet: add a MODULE_ALIAS for platform instantiation
    https://git.kernel.org/netdev/net-next/c/418149559ef3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



