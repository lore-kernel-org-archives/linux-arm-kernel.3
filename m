Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FFCC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu34+zFoKzPnsBxzOP3xmQaAhLNWOJnKnJ7RCQeFDyE=; b=Xy6qkkWdOY6cR56k8XrK7eBezZ
	g+K5jGxavnDVLYnA8nwwUDVD9Y5QkrRJ7MUSh83UrEWRZiy8L8lEmZF61qZEXpP9bajbXYpPofBuX
	jqMGMHLLZu6/wXmsm2zcVFWkCRwTtYPNPEcWIm7lil6QRFYuwwfHAEqyZrN0nKnUzB7a9gX0ngbVI
	cAezJS7jQtrmRUtn7k6RepNjkGHK16wlpJ4Vd5AoJU/4NtWsl9sYeUyzOWa+P28PE4r+7tTKO8IiB
	PPGimeIGyWnRDi9Fx9M5vgGnMro8hSdjnqQy8TWFLOTkZkLCtBxvQDDqOAvPAtuwUNqfb1bPC8NBc
	U3EfZ7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdfZ-000000060Kt-33kW;
	Tue, 01 Jul 2025 16:17:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbyd-00000005hu4-0gwf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98EAD61443;
	Tue,  1 Jul 2025 14:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D76C4CEED;
	Tue,  1 Jul 2025 14:28:49 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: pi: use 'targets' instead of extra-y in Makefile
Date: Tue,  1 Jul 2025 15:28:47 +0100
Message-Id: <175138012160.1964245.3629792221898551115.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602180937.528459-1-masahiroy@kernel.org>
References: <20250602180937.528459-1-masahiroy@kernel.org>
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

On Tue, 03 Jun 2025 03:09:35 +0900, Masahiro Yamada wrote:
> %.pi.o files are built as prerequisites of other objects.
> There is no need to use extra-y, which is planned for deprecation.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: pi: use 'targets' instead of extra-y in Makefile
      https://git.kernel.org/arm64/c/6853acd39998

-- 
Catalin


