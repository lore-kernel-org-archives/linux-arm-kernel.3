Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F2CC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 22:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOkdJ9BIhW7CEAYkZmo2pUOQFCIBoHZYKysMZy5gsdo=; b=zoVuET9T3YtevqMFp/W3wOBht3
	uVvE9qWGNV/UNVR3FaE1f3WwwaqwCUx/LIRJeHg0aCxqdknNomcBaEWh1oPF0iePrKzUa0S5wHLdt
	LYgVNafY474+MnyuzJyar2K15gNsp9nhyy24vyrNTx8MpKlozwk7d0sOqHcSCSkC9uSWo2Wj2y4jn
	Em9dFKK27TD9MTArM+SGcKaNThYRSxcqybdx8vpGm6TO4hdoMA/ipbtodPHhkWiAVkoClob4h/cOV
	+O9H3K/HTAr58UNBa3xZobJXU6ebH4ma91c26H4xk27Zg3yv2RLXeRXOEDcXnHE8UYwNapnoJaFh/
	a2ZPWXAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtYjm-0000000Cz54-0YZ0;
	Mon, 10 Aug 2026 22:44:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtYjk-0000000Cz4v-32Jm;
	Mon, 10 Aug 2026 22:44:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B00B43DA5;
	Mon, 10 Aug 2026 22:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AB11F000E9;
	Mon, 10 Aug 2026 22:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786401892;
	bh=KOkdJ9BIhW7CEAYkZmo2pUOQFCIBoHZYKysMZy5gsdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WnwgvrqRwNq2x/bxhu6M6wH2qcxd8xI8dq3yzelF0ZPCriLIYO9uyrxakrp3qr/h2
	 YsGij9lp0ZTPBWr6X4i7ckJtlqEfBRZoDJ2DnXgGBJEtjUnozgFX9/sdUri9Am7PyH
	 J1IwpTthoG9Oau9DDhUDcLbA1lU6l8MNTPR89odUHBiMAAtXB9zZzCYdo3AKc13ZiK
	 PGhPr+gyN07MK1xss7mtJDV71gYFIbd0/ew/Hd0Lt7v4SoEuK8BiuRYxFAaTlF5PKG
	 N/YGJKWgyeYPohjpOBs122rIHXVwCbVokX62M5Jh2P4sshIvLfHOrhmI2URYdlued2
	 JYobGVi2j8cSQ==
Date: Mon, 10 Aug 2026 16:44:50 -0600
From: Keith Busch <kbusch@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Apple NVMe fixes for macOS 15+ firmware / M4 support
Message-ID: <anpUYquvgliLp2N-@kbusch-mbp>
References: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
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

On Thu, Aug 06, 2026 at 05:27:32PM +0200, Sven Peter wrote:
> Hi,
> 
> This series fixes a bunch of bugs that were working fine with M1/M2 NVMe
> controllers with older firmware but are now starting to bite us.
> With macOS 15 a new firmware is installed for the controller and both
> XNU and the controller are a bit more strict now. This firmware is
> required once we add M4 support.
> 
> The first patch fixes a panic that can happen when the controller fails
> to initialize, which now happens for the first time with the new
> firmware. The other fixes then make it work again.

Thanks, applied to nvme-7.3.

