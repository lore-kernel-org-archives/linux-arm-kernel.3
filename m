Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC43C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2lJrxd6Nalv5HaaLi6junqwG40jgWm/nMzs4KqBY7I=; b=DRlARU5CN+ueX+CEIbvUOFa0pC
	u8Gi4fRLRWo8ixXQuTq5jN6xrIqesXI7sqZ3dKtKFAVPc7xQuhJMRzVULbxCBxMrCaDZLfJfmj4wk
	RCT7O2IRaj4i8/lJTKdfD3bhZDlyXCJKeFJ8Eec3EF+vpw4j/C0wmLQkLlr7mxHSJG8lrAFx6wjy+
	JbhhmYy4NKV5htLF8gGTmyvtQurrOzUBYVI9v9LQPqy47wx7M/ySVkvqPA6q60SEp+yDsTQULcWEu
	zpYci/TT/HEARWk3qN21IqD1QnN7G8s12PcljBu/FFXRgcIVeTut289C4yDsAl3IJyxhp2+fElQJx
	pFA3E0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeh0-0000000CpzS-0Gtt;
	Wed, 22 Jul 2026 21:41:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeg8-0000000CpgY-3nJX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:40:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5896360A5C;
	Wed, 22 Jul 2026 21:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2FB1F000E9;
	Wed, 22 Jul 2026 21:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756436;
	bh=f2lJrxd6Nalv5HaaLi6junqwG40jgWm/nMzs4KqBY7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cqz3AHG/3zxrLwgmIt62MI6W81hxeTRQPhpZ62H88J9s4PPpiFGh4SfJEKKMyGcE6
	 2aOLp9vh73RETxFhy8B/wpU36T7h0vHNTfMOHkoi2SvfLZNdVCB5gku1vTzKXfIHHF
	 RvVc5x3IXEEKpBeq2mnStE0j4ZPmJC4IubgWfcugTs7dbrg8PWY+6zHdeIXYw8MYAG
	 G0yGIcwfDXhONtFMWnFHLVxdsJ6g+BQbi3aoB5RJCVD2qujv7EbAGZ8a+3Q56UCBMO
	 wRmMcZyos6Vv1gvireLo4hIdYOdhhuov2kq0lXfwAYXy6kf6f/6sYH+Zjv6OYS1pQT
	 74Wilj937zIEQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] virt: arm-cca-guest: Drop unused assignment of platform_device_id driver data
Date: Wed, 22 Jul 2026 22:39:33 +0100
Message-ID: <178475158624.1080735.3587711943339470959.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1420ce71c3be5056a384be9c733f5df3277bf61a.1781690829.git.u.kleine-koenig@baylibre.com>
References: <1420ce71c3be5056a384be9c733f5df3277bf61a.1781690829.git.u.kleine-koenig@baylibre.com>
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

On Wed, 17 Jun 2026 12:28:26 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly sets the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop this
> unused assignment.
> 
> While touching this array use a named initializer for .name.
> 
> 
> [...]

Applied to arm64 (for-next/coco), thanks!

[1/1] virt: arm-cca-guest: Drop unused assignment of platform_device_id driver data
      https://git.kernel.org/arm64/c/ecc2e046869e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

