Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5BCCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7tiW1lLlQHK3c8uKDQKHKYSmxBluixy+3xVj6FtqBw=; b=3Y7DqiqHFytJbPO6GQj4Au7EaX
	iaaRK/hkH4okvVZjc0/XxB7JyHwxD9rqZLjh5wRODo6ebiQdU9gOzHTCuvJMh0g1wsnBB99Zk8Pwx
	de9UY30C7q/fHcEzL7/xiIVdFGw1g+V3AOE2YI5gGCfLNLO18AwHXYg7b19UonYNNTaNxq4Cm6kxD
	9btjIY5+G186TcyPgnN84H1rd6yAHLsVYP/BzNiZinhzR592MZk8vF+B/R/l/FhnEPY5emDYF3q9n
	n5JpjQAxIPuxW+fiNewllc+yHWz1cQ4+2FfPWI4O1/k6p7YhM0NgKQEJQLD2nqdIRt7Er+DVPanO9
	kKfQdUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GS9-00000002vuv-0GOs;
	Mon, 29 Sep 2025 16:10:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GS7-00000002vug-0qwS;
	Mon, 29 Sep 2025 16:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76382625EC;
	Mon, 29 Sep 2025 16:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5ABC4CEF4;
	Mon, 29 Sep 2025 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759162214;
	bh=VwMhtKXqp3LJwH0OUSm1EemiOWjyAmIPXaZUF2o60sw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PBhj9yc8jaOsTTukyhZ4zNItFdk5J8xaZApDb4/6SYHiICmDC/IuAqFxlhXNTJDKH
	 PVnBh8tl0KS/ONXvfe117/uz4HNw2WhXYxCHWkqqBmGMyCC7luKvuANlX36uIjPbHs
	 YiogN9tGiCrEkSLJ1CSINU9O4VnxTwbh9RmUrpiw/FzVLJPtNrFEczLYor4LdpSbHp
	 AOXHNb27OmXHcGfBaPIWKxq5YXMeJuhWNANXHBqS0EErebR7hNV0YohGMXPZXL95/x
	 iPYMZuZxvn9cx6do++dx6HV5KKwqhEXZa7/YM1L0iE4obi0Dv795/jMwslB+tqb7qu
	 vKOC+7QA79Kcw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBB1D39D0C1A;
	Mon, 29 Sep 2025 16:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v9] Bluetooth: mediatek: add gpio pin to reset bt
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <175916220774.1630000.3594430707404440573.git-patchwork-notify@kernel.org>
Date: Mon, 29 Sep 2025 16:10:07 +0000
References: <20250926101046.26559-1-ot_zhangchao.zhang@mediatek.com>
In-Reply-To: <20250926101046.26559-1-ot_zhangchao.zhang@mediatek.com>
To: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
Cc: marcel@holtmann.org, matthias.bgg@gmail.com, luiz.dentz@gmail.com,
 angelogioacchino.delregno@collabora.com, krzk@kernel.org,
 sean.wang@mediatek.com, deren.Wu@mediatek.com, chris.lu@mediatek.com,
 Hao.qin@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 26 Sep 2025 18:10:46 +0800 you wrote:
> Support the platform Bluetooth to be reset by hardware pin,
> when a Bluetooth exception occurs, attempt to reset the
> Bluetooth module using the hardware reset pin, as this
> method is generally more stable and reliable than a
> software reset. If the hardware reset pin is not specified
> in the device tree, fall back to the existing software
> reset mechanism to ensure backward compatibility.
> 
> [...]

Here is the summary with links:
  - [v9] Bluetooth: mediatek: add gpio pin to reset bt
    https://git.kernel.org/bluetooth/bluetooth-next/c/8fe90a5ad3d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



