Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF00CFA45C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=317ozkGF2ePsZFQjj7g1v9n2S3nza7PDVgUM31Jb4qk=; b=e7DSflKUjsgKPwKuguh+MXLhAK
	Oe8uGuxv1c6X6KL3+sNum0AwXDZVOKQl3ZkN8vnpXad6d05lZIA2RONPohX6riSX4xPKNsBQu7JVl
	r7C20yS14MuHb4ui8aGQMkIFWPUggMhGmweDFNKQjt108XD3sG8ASrfNuh3FEoPqa9J1S+/YclpR4
	ExV/3OsqhiBxcYRqeHuvjTMVh+qPFTO+nZ1z0aYhsewURg6lYosEmXAI0YChbuBVA6JZA+HtG2K4A
	UrJzhZ8/vqxACN6YrqnIwmbbYwLgMvv+mbBAAtMuoQ3c17mFLDZLB6x0mt5y/Janqu5+gTu2j4G1X
	EIAuaTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3g8J-0000000FXqS-3HUg;
	Wed, 23 Oct 2024 18:30:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ePI-0000000FCDE-2Dz5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=317ozkGF2ePsZFQjj7g1v9n2S3nza7PDVgUM31Jb4qk=; b=ItS+QvSy673K8vKyBxM3pUve6r
	rOptS9fDNJGx9WWyphHp40Y9qeKjlQy3o82laLI+bdaRzOCyas4xddJvtyvCJQmqJtufJscyTcuX5
	kzXtG89K0RQXOzlSXqQV9vmwfKUA034AmYHuEbODH1hCIl7Jw054HaXhfiFV93do8RkfD8UMyqpsm
	MJCciBGN7XS1NnpoAePK56UiIUKy/l/GNRE1mpiQ1V+Oxfpzu+dYkCCDDqTWqWaKpw4XFKRYlAmNU
	YXsi0Yc+MqObZwSkUx4vLzQpOuFBQ+I19ViC0x/uoPW/QGPLJVaI8R+S++inUgpuM3eeLSE44/4Z2
	8G5frLqw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ePF-00000008SqX-0nY6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:40:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1183A40243;
	Wed, 23 Oct 2024 16:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CF8C4CEC6;
	Wed, 23 Oct 2024 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729701619;
	bh=EaGnaP7igIMuIpgZ7RhMmhMiAYISKgyP9cmiZwCDk0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+Y50mUDAN4zL4uMUG5gygzWU+9fdZ713E7sh50ZMFris2r7nDp8q3F0p19D3VXXJ
	 s2Sot94dwvug37Md3VXLDmkrYwaKMod4LxKe3dr46bGhLkGkh+grWjUvW+giCyy4UI
	 LrlAjVpV7bXkwgWBKyn1irNHrVb9YCx5u/zx5k5UP1xFrLxXKTeKZTXrtiIQ6UEgPA
	 PiW+5B7vEQ7Q4XLr+0fdNVk+h+68iBrJkhd11ntiJChjsz67qCLc3/BdGAide2prdL
	 Ghojpg5rd5+i28+AiUnF2lO5UUEtqxaUk1Rh3iALaty4jaPSKUD3GA6QzpWlLR/M78
	 7XoLB2aIZHSxw==
Date: Wed, 23 Oct 2024 17:40:15 +0100
From: Will Deacon <will@kernel.org>
To: "Liao, Chang" <liaochang1@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>, catalin.marinas@arm.com,
	ptosi@google.com, oliver.upton@linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Return early when break handler is found on
 linked-list
Message-ID: <20241023164014.GE29251@willie-the-truck>
References: <20240827110046.3209679-1-liaochang1@huawei.com>
 <Zs3LnYkXL5sg2yBH@J2N7QTR9R3.cambridge.arm.com>
 <f9357dff-1f08-42ce-b6c2-93b3a2d9336f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9357dff-1f08-42ce-b6c2-93b3a2d9336f@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_174022_026788_31AF4D52 
X-CRM114-Status: GOOD (  11.97  )
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

On Wed, Oct 23, 2024 at 09:52:27AM +0800, Liao, Chang wrote:
> Kindly ping.
> 
> I'd like to get your input on the next step. Should I send a v2 patch
> that only removes the WARN_ON() as Will suggested? Or should I push
> forward the refactoring of calling BRK hook [1].

If you have the bandwidth to tackle Mark's refactoring idea, then please
feel free to send a series. Otherwise, I'm happy to merge the v2. We
could even do both.

Will

