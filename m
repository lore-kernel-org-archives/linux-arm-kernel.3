Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009A3C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAQwTMxJrdyHL3I8Pf5y0dbT9yvLueulFvkIgfXWEC4=; b=qAIaQK5FbmrKD/yBW2evGpzfyM
	obm4JrXEwUuZ05qbKJQTTI0NLySxszL3S1XhmRYXVj6rJ6epKFfkh4febVT4th9roFl2ZqDtjZUZ3
	wVDo5KyrWpUb1pnPz+VHtmNNbM6O8AwR7KoAtv/zHlvf2F5lONtLD9B6AofO57Qelv3VOWcRtRLEo
	AutaUnUWtSn/Fjn8x0u2MkHkTJHMvK2hZcdnO5ZZJxAXdGi7svbYxL4X1rX/6NI5HG5sMbtNxnHEP
	qcrnGByxa3ifOLJYOKibbbswbBoV1YPNXAu1TnxBVYPxkNozVoyobX+P4xjdno/hj7g0jySB6jQ9X
	cLFgHOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJeU-00000004rzg-3x57;
	Thu, 02 Jul 2026 15:48:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJeR-00000004rwN-17lB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:48:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD9CD601CA;
	Thu,  2 Jul 2026 15:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3F81F000E9;
	Thu,  2 Jul 2026 15:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007310;
	bh=mAQwTMxJrdyHL3I8Pf5y0dbT9yvLueulFvkIgfXWEC4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Sm8LBoU5UzyMOGMClgbU25/yaSAVQnr+SPK5ZoSJWoW7nWqHNYu1jY8B1PW9pbkEO
	 hfP18jSg35VBxcgoiKKT3Pd8ZypIQaWN5eXgBGRK8dwegjU8vC9aF9yn9uN1ldBPJo
	 tw2jFd9WND9nRfLMZTOIiEXGYjjrBTqOeeBXJEdrPgNEWJ+jjwDDBNhAFPZ7H1Khaa
	 TiI5A7QAbaGa3YEw/RXYv+lE0fp6S4Uqmua2VQYkzHGBLwrKY7M8cYZ6XCEy32ENBt
	 PxY6Ggb9W9I+4kdjmCndsaSiCHMO+BR+9pnn+hKI51xY8pJ7rK0zDnn4684YiaaA3Y
	 BvWZrViYiS6hQ==
From: Lee Jones <lee@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulfh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-sound@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org>
References: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org>
Subject: Re: (subset) [PATCH] mfd: db8500-prcmu: Fold dbx500 header into
 db8500
Message-Id: <178300730531.2216044.15808904000613354673.b4-ty@b4>
Date: Thu, 02 Jul 2026 16:48:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Fri, 19 Jun 2026 22:27:10 +0200, Linus Walleij wrote:
> Move the DBx500 PRCMU definitions into the DB8500 PRCMU
> header and delete the wrapper header.
> 
> Convert users of simple PRCMU wrappers to call the DB8500 helpers
> directly.
> 
> The dbx500-prcmu.h header was the result of an earlier attempt to
> abstract several DBx5x SoC PRCMU units to use the same abstract
> header. They are deleted from the kernel and this is not just
> causing maintenance burden and build errors.
> 
> [...]

Applied, thanks!

[1/1] mfd: db8500-prcmu: Fold dbx500 header into db8500
      commit: 6fd345e209284bc939693989bb7144133a8e93fd

--
Lee Jones [李琼斯]


