Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF453C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 16:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xh4KzMUFpTj8qOebhQWdsAIU8pmtZ3z7e4KeEKEYSgw=; b=0PQV/oJJZiyBtjZemxcpiDWbaC
	491ZCNI8t9ZONwETOdgF19nCxAfVgJlk7kzI7SrKNA3Ct5paFR9V3DMNc6UiL2xaq/JAGpwZZuCEM
	2xtrzZE8eHevTfvC0IEJZ1xnRhkEnvN0aBzV8F3HDK0sQXCSiUoUAxjNCdboXjtvcHaSWxnd+nmAP
	WeJkYPPdGvsWvj/RNRQBMCJl10MU5JvP7BE85EqGlM6bFRa3JS3nj0Br5nUWlA32rZgtLO2cWKaLd
	bvy3jg9col7kkfZz/0L7Gkesu3BhJtuili1yG/uqp3HKDQLZ6iOVWGY3u5QtbmPUCO/SKh32rgFEV
	ebqDp/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAs5Q-0000000Gcjr-1opQ;
	Sun, 27 Sep 2026 16:50:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAs5P-0000000Gcjl-0i9b
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 16:50:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6169160052;
	Sun, 27 Sep 2026 16:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5D81F000FF;
	Sun, 27 Sep 2026 16:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790527846;
	bh=xh4KzMUFpTj8qOebhQWdsAIU8pmtZ3z7e4KeEKEYSgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g09DHE8lTWfUZq2Qm6MoveJcrsrICkGKJ4Y4TmvPsp0pIpjTZlNyUv8NP/S9MDtac
	 aeliovvMLSurJRMDWqtFO0/cfWumaZl0cmHgtvV51OCR1UJWYahkLKqJ4u7aeiTulJ
	 4PEvrHhAbYUItiG0fJk3V2wcF9zXuOOwdF08nAcJp70/gopo27XjwH7LUsUMdYgWjw
	 q/ifnlvtSTEwwQggl9WzhB1r+hTdbwDvEhPOvdOCgaBR41z74a7z5g6EKux5fzyDOV
	 aP8UaU8fGNEu7ySD8iWcaiRukpdZxg3xIeytw5CU9UQMBAF7bmVlJtCX5y3M0Kxy5N
	 mBfUivAbSpa4A==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: apple: rtkit-crashlog: Add AArch32 IOP state parsing
Date: Sun, 27 Sep 2026 18:50:29 +0200
Message-ID: <179052779403.16295.253181744749057325.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
References: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sat, 19 Sep 2026 00:47:02 +0800, Nick Chan wrote:
> Some RTKit coprocessors runs on AArch32 CPUs. When they crash, a 'CrgA'
> crashlog section may be reported containing their architectural state.
> 
> It is useful to get it so as to figure out what the firmware was doing,
> add a decoder for them.
> 
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/drivers-7.4), thanks!

[1/2] soc: apple: rtkit-crashlog: rename 'Crg8' section from regs to aarch64
      https://github.com/AsahiLinux/linux/commit/1a2ae085282a
[2/2] soc: apple: rtkit-crashlog: Add support for AArch32 state 'CrgA' section
      https://github.com/AsahiLinux/linux/commit/4edbfa916dbf

Best regards,
-- 
Sven Peter <sven@kernel.org>


