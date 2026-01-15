Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B761D44C45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENCWiGGqg/HOgAYc9vqc+Mkj//5ervkgsHwJnWSbdqk=; b=g9VzKa3KQWZvcQ/pq2pUE9CeQb
	oA7wLVeE7CUzgvyos/9YE2SmVxEAeBnKy4u1j07mvqDQw4JKQ3r3iB2z2VlWsfZCrnsskucvyvWMz
	IzhxnCfuBd5YresKx3EmunMV15jbiiBlonq0jJxp1NKV/LY5H04QKW8tkGxscritrsoJzxNGoicJv
	peKNetZU4JZCFr6PpNJZWjGJVQ/bQ53IMwxppDD+Uk6fohNYwaw+ZNtJcT/VUpzDYBIezSZHqeMdx
	8XPUr4C0BnNZpWcEUUx2ENerOHQGZvcaFTA9ghkv4EsdO+iHSrOSf9gT2QHia+YZ6tjH3Bczm15l+
	8TwDgShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgN5f-0000000CNvk-2M77;
	Thu, 15 Jan 2026 13:08:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgN5d-0000000CNuo-2aMF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:08:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDA7343EB9;
	Thu, 15 Jan 2026 13:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6D1C116D0;
	Thu, 15 Jan 2026 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768482520;
	bh=K6EEfThDgFoVz5SQnhnkLFC3/QUNL+Ra62DoR6oxqvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQCF4ub0YiS14vrLxj2j2Z1uZId8j0b4EjNBWtTqwX8flIuK4yK45HUAo7macB9Py
	 U7nEKnro7eDPL4n1iBlG4Chfw7Wptujq6pmfnX8wqoeHR8qm55BoNZPiPudRcgOhz8
	 ZZ0vPnOQyqp9z1m4kSvE+JrCxXjUm4Zw9DUvQdoNQ9/XJ/8ToAZHbNVVDRPgs5GFMK
	 dFL2g8KXy5kAztWq7icViW4fiZhuvS2qRLSlIIr/xcbq6g0pgIC8+Cq7UJTDAqoQK5
	 V1+52A6URZ+j9aUh1vkNgE1AA1tpxZbMAlbuGMz+2L3OXQUvBoE6m4+51i6LprGpMS
	 6r1J5aU2Miavg==
Date: Thu, 15 Jan 2026 13:08:36 +0000
From: Will Deacon <will@kernel.org>
To: junan <junan76@163.com>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: kconfig: Make STRICT_KERNEL_RWX visable.
Message-ID: <aWjm1Fr7vH4iLBFc@willie-the-truck>
References: <20260114013859.498148-2-junan76@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114013859.498148-2-junan76@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_050841_673966_321D6C82 
X-CRM114-Status: GOOD (  10.65  )
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

On Wed, Jan 14, 2026 at 09:38:42AM +0800, junan wrote:
> Make "STRICT_KERNEL_RWX" visable to menuconfig on arm64 platform.
> 
> I can not set breakpoints when using kgdb/kdb on arm64, the document
> says "STRICT_KERNEL_RWX" should be "n", but it's not visable in
> menuconfig and the default value is "y".

Does it help if you pass rodata=off on the cmdline instead?

Will

