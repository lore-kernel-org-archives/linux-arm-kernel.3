Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E90CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFUpSfQ8K42FekVk7jn2Yystije++zURvDYqbJ39kSQ=; b=qrlF9XUQCxqYCFV/dgIEpMdpKB
	pNk6agST9os1QexG1pzRIh9iIDSTBUnZDmgNt1YgUAXEHGFoVGaxxbt/1nD3YvKF5zQXwRzuaEzx9
	Gv7BRU93mChz2R1BXo20YS/2Yr1f3lfyko58NjF9ey8IoYmMcoU0rHeczwzJjt+AwYyJbCXTUnDtw
	m/SeHvPXdMoqBryoJh3dsxAQkWpU/5qUaSGdK4ZVmJQWMDVAr6NQACcOo+vYTJMO+hgsvUgR+pV9J
	JhtHOItQMZLXYQEQHhDeZSpMeuaK5x7WyM8CWH/7/BBwpR/cfrYAYg75pJWzxNnHC5ifWjUuABKfq
	dwADyjoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxsV-00000007UgI-14SS;
	Fri, 29 May 2026 14:07:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxsQ-00000007Ufs-1vL4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:07:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D5AC4022F;
	Fri, 29 May 2026 14:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F68E1F00893;
	Fri, 29 May 2026 14:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780063674;
	bh=xFUpSfQ8K42FekVk7jn2Yystije++zURvDYqbJ39kSQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Hdnelqg7x8Uz2I/M3nnicz1PmHSyGz4GHnKHUlE2ROqVqdjhp7ZEoH4BP4lIulr3K
	 1IWREuYKfsX1u5cb5AYNN1BVs5PkUq26ga/ZyWdgquBsw8eWCpv9d+TBsViAHeKHRg
	 jb7IhEQlzznMNYxToxdUyPis6Zem2Ej4PFTDtwS54o03LYT3UtI2dZovGeXi9h4BFH
	 sUnGt4tQWSVDLUT1l47pPANgDvrDHK/zyM7RhLKp8cA0iq+R6TobbUlAuR+60smVaF
	 90RKWKq9Q/c/3ZuG/GXr9xWIPgnBo2Dq3qfT5LEa00Rlntxcr5cSucvQKVov8QOhjr
	 USmLY3Dau+Hyg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Brian Masney <bmasney@redhat.com>, Peter Griffin <peter.griffin@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260529134454.2147446-1-arnd@kernel.org>
References: <20260529134454.2147446-1-arnd@kernel.org>
Subject: Re: [PATCH] firmware: samsung: acpm: remove compile-testing stubs
Message-Id: <178006367096.55906.16678510397337205828.b4-ty@b4>
Date: Fri, 29 May 2026 16:07:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_070754_520390_1411ADD6 
X-CRM114-Status: GOOD (  10.07  )
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


On Fri, 29 May 2026 15:43:31 +0200, Arnd Bergmann wrote:
> Sashiko reported an inconsistent use of NULL vs ERR_PTR()
> returns in the stub helpers in xynos-acpm-protocol.h.
> 
> Since this only happens on dead code for COMPILE_TEST=y, this is not
> really a bug though.  Having stub functions that return NULL is a common
> way to define optional interfaces, where callers still work when the
> feature is disabled, though this clearly does not work for acpm because
> some callers have a NULL pointer dereference when compile testing.
> 
> [...]

Applied, thanks!

[1/1] firmware: samsung: acpm: remove compile-testing stubs
      https://git.kernel.org/krzk/linux/c/7b661285aa7507eab79efff0a418445157db4141

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


