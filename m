Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EC8D2D0E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 12:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6wLIbHjGML+CXswgwW/Xt2U0BDE9qW2xYplqySp5og=; b=Wl5wsl/aDdpSu0qRio6HD+1nA5
	mrA+EvX0rUOt45WTCPsvgukcXqGI0mi5JuLdwmDnNzzyksoEqYZrDZaa9zrTPMo/sbTArFBjKnNBt
	4NePeF2rAXhHJm66jXxQWyStLwvUXzpeZAQwFdjTXrVIBX5N506mQmbP1+f5r0nQD7leTTG0b1RdY
	8D5M8krJXcbXeaYICBBBUVAIE5Z0tE1l125GErU+0RZHdRe+kYGHl/xIGD16f8NOPguPSy4la+PpJ
	UR1uqyrxthTM/4QfFqPk8qce9fsAyQIIqHXRPtrdRduaLhzkdPaJIxcbiW6Q6PzA74cLMHNp/mrXG
	W8BbRGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdOL-000000074D5-328C;
	Tue, 13 Jan 2026 12:20:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdOJ-000000074Ch-1BLj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 12:20:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 378B0418C2;
	Tue, 13 Jan 2026 12:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C0DC116C6;
	Tue, 13 Jan 2026 12:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768306854;
	bh=uN66kPtEzqYLKuiXmvgrJrjnA4XtsNWaNAKycUAnaHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1c6VxYoVeXm4ht83Y/YkhrlIGLdnl0tdou479gE2jEgKmabSIqpYpBKFeazU5Z0s
	 KOHm8ePiEYK3Xi7QpnZKg/tI14CWmQyMbc2WL7pd0TExtw5Fe+UtrliKx64AxzG4Y4
	 MlKoD+WyVoxliE7DJje/OqacPCwbj+Y2v0CJ8s1XvJiHVtIrkFszHegRhjGrlzIU6A
	 JF7aUn7bW9kP53VBXcKdyplbrFKtzP33p30iykq8HbQ3gals2hfSyK0kRlqZoxDW5h
	 bqfIWZoXkX/soLfrs0bO/l6w08fXCRsPJshp9wu9ro4SLxo6KHMSsJlr6apf49l8wL
	 fjlEu6cg8/2+g==
Date: Tue, 13 Jan 2026 12:20:49 +0000
From: Lee Jones <lee@kernel.org>
To: michael.reeves077@gmail.com
Cc: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 0/2] Add Apple Silicon SMC power driver
Message-ID: <20260113122049.GH1902656@google.com>
References: <20260109-b4-macsmc-power-v2-0-93818f1e7d62@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109-b4-macsmc-power-v2-0-93818f1e7d62@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_042055_342092_80CE220B 
X-CRM114-Status: GOOD (  19.30  )
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

On Fri, 09 Jan 2026, Michael Reeves via B4 Relay wrote:

> This series adds a power supply driver for the Apple SMC found on
> Apple Silicon devices. This allows the kernel to report AC status,
> battery charging status, and power metrics, and modify the charging
> behaviour.
> 
> The first patch adds the driver itself, and the second patch wires it
> up to the MFD core.
> 
> The driver is based on an original out-of-tree implementation by
> Hector Martin. It has been refactored for upstream inclusion, 
> including support for newer SMC firmwares, devices without batteries,
> dynamic property detection and improved state management.
> 
> Tested on: Apple M3 (MacBook Air, J613)
> 
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
> Changes in v2:
> - Added Reviewed-by: Neal Gompa <neal@gompa.dev> to all patches.
> - Fixed Makefile alignment by using tabs for the macsmc-power entry.
> - Upgraded physical battery exhaustion log level to EMERG.
> - Downgraded software-triggered orderly poweroff log level to CRIT.
> - Added check for CHIS key to skip AC registration on desktop models.
> - Link to v1: https://lore.kernel.org/r/20260105-b4-macsmc-power-v1-0-62954c42a555@gmail.com
> 
> ---
> Michael Reeves (2):
>       power: supply: Add macsmc-power driver for Apple Silicon
>       mfd: macsmc: Wire up Apple SMC power driver
> 
>  MAINTAINERS                         |   1 +
>  drivers/mfd/macsmc.c                |   1 +
>  drivers/power/supply/Kconfig        |  11 +
>  drivers/power/supply/Makefile       |   1 +
>  drivers/power/supply/macsmc-power.c | 883 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 897 insertions(+)

Let me know when the Power driver has been merged and I'll take the MFD part.

-- 
Lee Jones [李琼斯]

