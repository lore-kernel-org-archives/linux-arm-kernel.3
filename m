Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1ADB1094469
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 10:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wykzu+6xT93IcxOk/c/OYiUHQuODHm7jFyIJmovcjM0=; b=bIchdltRnDnYSYFlRTtUfgzhXo
	YmdoduaAQe2Wf/UQaTmYjbBlk9/rt55Z5xA3XE0e1l9p/eZ46kD+/M/D0Usb6qL2eBb3N9XVbbl91
	R2v+yxNvZFtmAsVOQ/yKz/wsAAnZTv02BcrS332GVBqHH+VBJsciMUKPE56gJRKSdohvtjLC1aWTQ
	Sc7ArtkuarstoAK5v5ch49Qb4rZbMzI0s+TeSl50Is3bP6DS5l0ajRhCGho1R9Ry45djZNsXOwJdP
	+CzEWwM3hceI53vsOHyPGcXKVaDHiN7jh8k298q5hopE4+tlD2325h+Pd+pFoNKXJLctZlR+fYZOG
	Pq2HIhiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tqg-0000000EMyq-3R4E;
	Sat, 21 Mar 2026 10:46:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tqg-0000000EMyi-0AYj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 10:46:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2831F60054;
	Sat, 21 Mar 2026 10:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7520CC19421;
	Sat, 21 Mar 2026 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774089988;
	bh=Wykzu+6xT93IcxOk/c/OYiUHQuODHm7jFyIJmovcjM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3NjxvTueCzmrpQrkmbYHtcpthJO5rlzzz7hFft+4t7szbJFtaO/FNqo3MjelNDuw
	 aWoqj37nG+5y+2ip5jRLQddvY9PhqeVhGu1Yeb3QbH0dO49uDIYnt4tV9otvDyysHp
	 m3BHn6kHja+lrTHxQx6KYbYmz8/Od5JLHGApthOLOHoRG9YO45bG2qae6Lpd/ihB89
	 T+/SCDn3hAhl1O7YgrigF8GdYYNnV9I+mExF3r+RQRx7rwJPZRJ3KXCpwpD3dug3Cv
	 esouKziMDg38lO4DIK9l+7EWqXG0d/QrdxotbXxZMUERTt2SbSW+4+ud6EVzSqhro9
	 FGL2f3uDYGdHQ==
Date: Sat, 21 Mar 2026 11:46:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Message-ID: <20260321-first-exuberant-angelfish-bd9ca8@quoll>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
 <20260320-exynos850-ap2apm-mailbox-v1-3-983eb3f296fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-3-983eb3f296fc@linaro.org>
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

On Fri, Mar 20, 2026 at 09:15:15PM +0000, Alexey Klimov wrote:
> Document support for a mailbox present on Exynos850-based platforms.

Here you explain the hardware, e.g. that they are not compatible.

> While at this, convert the compatibles selection to enum.

This part is redundant and obvious, can you do it without any sort of
conversion? Not really.

Best regards,
Krzysztof


