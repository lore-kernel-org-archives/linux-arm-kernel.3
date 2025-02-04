Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3275BC02197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 13:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQ7QHhQ5j8uBGH7tf/y/8q1GDUAXoviwXi3oLdnAwuA=; b=PoH1eJdRwvUlDAWlyYQ6tWbgC6
	eB/KBsj0XGAsmT+tYA1yE5ESeKsBi7MTvFLPUXpxO+XFpIgj++DLGx11cFukHajmWtf5gk041SsQl
	pKK0LdN7ilpjFQh5SIyops5mn7QkhMpfr5BN/2+/oU7h425hNnXP06sJyCENqs+XcnYb0Cc+BHy7z
	vW+JKcCuzlHTWRlJBf72Rio6Zjw/wrdoLJkttS26/O6bLpwgeRr547KbteZk/akO9omCMdODYVfIa
	PHqcLhtGDGQ/nIC2ePtkdq7IRO04+1kolzMdCjz6yrPaaaABY4uOv70/dYXhe++NUaQ/YcBm4LTVj
	etoZ4mlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIkf-00000000VSu-0Sye;
	Tue, 04 Feb 2025 13:14:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIfy-00000000UlU-1zMV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 13:09:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95F02A425E1;
	Tue,  4 Feb 2025 13:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2777DC4CEE4;
	Tue,  4 Feb 2025 13:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738674553;
	bh=81yxeQHIqctxrmIw0097ymR1VtG8MmRAEDohct0rFB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rc0Irqc87feCcYBNiLn1AoCdwoCaFkVPOEzl6pdv9ju8cYFcny1ZdWJ+gPd0qXTCj
	 M40vuICWOYD9mpH6b/IX059uQYb9wHwhgV6w5GHztiX9HFS8k3+2ps/zOM3fB7J1wa
	 vfviLXU6J0fTSH/m8e6Klmkj3wPxX2x6+JuaUVxevmJgxcOKG0sd+6Vl/7Wi+yC1J4
	 jCQScnSeeGBr+SSkTG1u+Jiq92Qfy745TH62QXDuAyi9B+hJ82oZ99mHDohc1mfCyQ
	 hj+DkAuwfkx/E5rpsfdxGnEaay4YE0Aqp33lJ7jVxtlX1ZvOSu3145gLiWTkGzy74r
	 GAhzn7tp17obw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/hwcap: Remove stray references to SF8MMx
Date: Tue,  4 Feb 2025 13:09:03 +0000
Message-Id: <173867209875.3989677.12528563395797509995.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250203-arm64-remove-sf8mmx-v1-1-6f1da3dbff82@kernel.org>
References: <20250203-arm64-remove-sf8mmx-v1-1-6f1da3dbff82@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_050914_576619_7024D7CC 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
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

On Mon, 03 Feb 2025 20:11:04 +0000, Mark Brown wrote:
> Due to SME currently being disabled when removing the SF8MMx support it
> wasn't noticed that there were some stray references in the hwcap table,
> delete them.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/hwcap: Remove stray references to SF8MMx
      https://git.kernel.org/arm64/c/21fed7c223e2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

