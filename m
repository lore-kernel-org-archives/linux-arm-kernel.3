Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24098CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9SQTqrBOVctis2CGVfZ3Pf9Ziye0iOOUfIC0e8jglg=; b=o4zoKaVaujs+aGA/Qf3qjNXPgG
	mApO+JuyddSxeAyzTuhZTsB7iXaHjL1wCx5baQigrRlIMrlIkSIWR/XyLx5f77Y9R6L46EuiL4rM1
	LfkOmB7NYY6IE7nJ+cEwUqClcK2R/MIbDBIJ7qstadqmln7uhdyn7QUwKpH4ctouL99L2F/Tq2lBs
	Wm9V6AC+IsTScLzJsKvrgylymhiRRWAG9D2vsJ7UHTB7S7EjknGmPoneIQXTJHigMA56z2vx0kJxc
	2xrZOmcDso9HBwtXViB1sf+743duH6O0KLhyz8t7V6QOAXnySUZRB9jvosaHlV1V9GKMGmn04vRVO
	j1OtNnZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBwk-000000055rX-2bXH;
	Mon, 15 Sep 2025 16:20:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBwi-000000055r6-1IvE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 16:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB7F441A35;
	Mon, 15 Sep 2025 16:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C939C4CEF1;
	Mon, 15 Sep 2025 16:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757953251;
	bh=yO0OtTf4tibabKMaQbj6as/6p1x2/RbPqYkzFHJWeRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1eEEi3P8Oal2RdCJlQQLkn9HUmgO/RjO0pcyhVlEhHUE45Tcg2bB9KCEl3guO60w
	 80hTMQPzrAZ7I3DIB2hxaR6V1PjuGALE3T/QBVWxYvnnTsVmuuBBoyOboNqd2EMKwZ
	 8N9V7w+/YSi52aErC4s5/CEEYCP+9naxq9YD2ZqqkPi9cGrwD72xSgpSbLvrc3s1p3
	 kxDqrfodmlF4cPwsQy3FWVBkK1xyRpwTO7VzsYHjzELlF9eV2j5fTzyukBtEUpxorN
	 EJAyL5RQJJyv1UEgD/7sfw2yAmaXpdGzCimPxze2Y3cYwFD+PFx7CsZbreqgtJVuxi
	 F4JzAtnmzr2Rg==
Date: Mon, 15 Sep 2025 11:20:44 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 00/12] Curve25519 cleanup
Message-ID: <20250915162044.GD1993@quark>
References: <20250906213523.84915-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906213523.84915-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_092052_368619_E8EB7F23 
X-CRM114-Status: GOOD (  13.93  )
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

On Sat, Sep 06, 2025 at 02:35:11PM -0700, Eric Biggers wrote:
> This series is targeting libcrypto-next.  It can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git curve25519-v2
> 
> This series removes the unused crypto_kpp support for Curve25519,
> migrates curve25519-selftest to a KUnit test suite, and reorganizes the
> generic and arch-optimized Curve25519 code to all be located in
> lib/crypto/ and built into a single libcurve25519 module.
> 
> Changed from v1:
> - Split kpp removal into multiple patches
> - Don't select CRYPTO_LIB_CURVE25519_GENERIC from KUnit test
> - Removed unnecessary parameter from hpre_ecc_clear_ctx()
> - Removed unnecessary 'return' from arm curve25519_base_arch()
> - Updated file comment in lib/crypto/curve25519.c
> - Made kconfig help text for KUnit test more consistent with other tests
> - Used initializer in test_curve25519()
> - Removed unnecessary newlines from messages in test_curve25519()
> - Use NSEC_PER_SEC instead of literal 1000000000
> - Added an Acked-by

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

Reviews and acks would still be appreciated, of course.

- Eric

