Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACD8EB3644
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 23:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44cMeGZr/l5eYry48qvh4fYrPN4/ezc2BGolvQEwZcg=; b=XF0dOg52HaJAzPZn4x6tAnsvN3
	LBAn/xKS1vnWb5q/AXcwF9ROmTKk8FsS8iZq7fbVuZLSpVFhLqO/zd0zUrfzl/VlCdYjR0M1c+vxR
	4ujt9BwFmNpxdon4FI92A71lwAWA/KSh6OuduWExry3pPO19mFMlmY9/evVkDLejIfIfSxBy3rNpf
	RJa9+5+ArJCXuhtdJCZWN9BZrKCBWDm7rdti7RW3lILwxBd5n42caILEIfkps3GosbjNUTsn1hVxk
	xqwY9px6u5uhdweuPDU5+ClitzAyXoasO6yCW7fLemA5ccH7ZuKlsVblXj1i2oOm5+qPcSXY7hz/B
	hX6Yh6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxD4n-0000000EEUq-46j5;
	Mon, 02 Mar 2026 23:53:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxD4k-0000000EEU7-13fb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 23:53:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 918DE434EE;
	Mon,  2 Mar 2026 23:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB98C19423;
	Mon,  2 Mar 2026 23:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772495601;
	bh=44cMeGZr/l5eYry48qvh4fYrPN4/ezc2BGolvQEwZcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOD83Aq93vDhuSJZC6nInxhLwfcgbL1UQJR7sGFh7xp8XQFbyiN4RNNlhWX3PffNO
	 s1W8+SJksbF8P/9tteHUOkLR8syoaongW5t7IFwOu4bWAlS8G8YL4eIFKKS5G9somd
	 3eYp9zNhudI3RUjvasFNKuy7Nm4ygXLH6KKBs0+7VHhqEE2guVQrXZO9cH+IiRjPyY
	 CyeOLmjGZm9IE6Bj3qFNeSgFfAVCK7ADrP9Nr6I6ypMyjERKzoEtXttAYOepNwbzFF
	 Y48Kfv7x1MNIt+6BJNsivtW0YRDvrSEP/LLRNYcOABEyYh+oxqE0wA9acepL7BjAnq
	 gFgt3cfiAqgcw==
Date: Mon, 2 Mar 2026 15:53:13 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: testmgr - Add test vectors for
 authenc(hmac(md5),cbc(des))
Message-ID: <20260302235313.GD20209@quark>
References: <20260207145113.375192-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207145113.375192-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_155322_309176_F06074F3 
X-CRM114-Status: UNSURE (   9.54  )
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

On Sat, Feb 07, 2026 at 03:51:03PM +0100, Aleksander Jan Bajkowski wrote:
> Test vector was generated using a software implementation and then double
> checked on Mediatek MT7981 (safexcel) and NXP P2020 (talitos). Both
> platforms pass self-tests.

It would be better to just remove the support for these obsolete
algorithms from the drivers that support them.

- Eric

