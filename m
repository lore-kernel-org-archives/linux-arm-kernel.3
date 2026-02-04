Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C6DE9D3FF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 15:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROTeWjE3h18zCiCSW9Y5MPzGzRd9EY17RSwtaIsnUOc=; b=wFCa7o7dsB2kUKzItdBAuHrBaz
	nm/Oa+6FEh2zGG5ot+O4bVGeWvEL8uYrvRRp/JkNoBvlS1inuFg9EaK4MTeVwCSKa+He0SKBliSDS
	Mzq+G43u1ctRAbXYgHMXTREY4fpF/lEoJ/UED3rq8onTsbY2HcGEiQwLoq5feviVaqEg2etLl0+T0
	mjZR1MYRirMv1/RLhPclYBUoSYDdFsAAZG6Eg1FKt1BCVBZb4MjIc7xDcprzWOQIWRdQCrJHV9YFy
	yQcDQKRywwEEzK3qmOAcVJO0NAZEmtuA3DGxbwSt6my6yMpUjo4LrfIVMTDFv9K+Uu7NZ26AyslCq
	onJfAzBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vneeF-00000008e5t-3wOB;
	Wed, 04 Feb 2026 15:18:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vneeE-00000008e5i-2wk8;
	Wed, 04 Feb 2026 15:18:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A7DC600AA;
	Wed,  4 Feb 2026 15:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2AAC4CEF7;
	Wed,  4 Feb 2026 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770218308;
	bh=Szm3QfQ7X3rGQRtzylMpLb3hyGhSDTXlCFdPG6u0Zxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmM4w6y7cvT7G7CYPX5cNC5pjGLzQp3+GvqHRzVdTS/DSi5+z+en3IeUQkeyXXTB9
	 FqHye+/2TsHXMr7kVsBBwVIGJmFlXJbFfcuKOYF07iLFgFnO8mcVKS2aR1XxRvFIwX
	 IpaHzLRJ9K49A469JoTitXYDqi6JZsmCkNKlqTaIDM5xUMU+OkzRA/+Ey+bhUim+Nx
	 ivhW2HdLYJuWdLcDKk83Tbfb91YvsL2Yd4Re8fiq9xP6t4YwhzGsJaxY64u4c4hMZv
	 ipY9J5Ebz7idqQB6/WB2fY/u7a8ZXhQL5UDd77/aGB26zgw+toNWokd/eLTk/cBVvz
	 zJjpRiQg41Q1w==
Date: Wed, 4 Feb 2026 20:48:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH next v2] phy: google: fix build dependency for Google
 Tensor USB PHY
Message-ID: <aYNjQfXATNAx6reM@vaman>
References: <20260128-next-v2-1-624bdae8e6d0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-next-v2-1-624bdae8e6d0@google.com>
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

On 28-01-26, 21:22, Roy Luo wrote:
> The Google Tensor USB PHY driver uses the Type-C switch framework to
> handle orientation changes. However, the Kconfig did not specify a
> dependency on the TYPEC framework, leading to undefined reference
> errors when building for architectures or configurations where
> CONFIG_TYPEC is configured as a module while CONFIG_PHY_GOOGLE_USB
> is configured as built-in.
> 
> Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> required symbols are available during linking, and 'COMPILE_TEST'
> to expand test coverage.

Thanks for the fix, looking at three patches for this, I like Arnd's fix
better and have applied that now

-- 
~Vinod

