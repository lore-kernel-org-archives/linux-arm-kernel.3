Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7169606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p6vInFLA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SIsy9gn+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oC53DZWwYgEwPzoWhOOW+rI9blG5esMjqlTZQyYiaTo=; b=p6vInFLAdKvHs5
	6KB18YfrpBKGVMTQyoQ/Lgp9yJGU5YvLHtr/+DyuTh2dxJZUpsDszmNAW8wA2izx2xXjJJJEidekx
	xOzP34z5kl8ldEAXPkfAPt6SHx7BzLiZ1R4XycAzZkbhVuWfdhe0qPaZk3Fu5zzBtl9zgAGzrshz7
	45r011flZfglu2cdA7QP6+adk4iSBZdnDPyGCK2U53CR3nwCpV1T6uVMUrmm02G1aoOEMfCmSgw9d
	xEurczq73ZU2o8l4Zg3y62mH6e1XP7k9PAv3KdlPTF2tPDlHfI4QZj841sNOUC4D/kWjG8ImVlgxN
	7oa91jDcgMDd8gLkWDJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWFp-00000004grw-2s5S;
	Wed, 04 Nov 2026 08:21:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWFo-00000004grk-1tjp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:21:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D331A42D80;
	Wed,  4 Nov 2026 08:21:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=90.182.112.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793780515;
	b=n3pqtd+vyyyXsSIhYvEj9yRFbeJQkV9RcMxKPN6y+ck3G8ByC/jk9Sm1EvPS8ITKqepH
	 90s2GXhroDHXMbnZWYzz8ENGPQM3zVxOtog7meuxQIgqbWnit8I1hVK1IVKiephB44Rnu
	 URbVxCbeoSxCy/zkJwff1f1gF4G7zNDTJQW0Pmt3gFV/nSMwb27Z5e7jXrkD9IcvNod6z
	 aymSAczyed84rvXhZTUzRH12rHqwuRqIw9TGs9eZKVkhBTYM6hN0RkOatbXoUQj8oCeCc
	 8dLk+Wz7+WfhEVxIoWbEcKhDrsvb29ALFZGN2oP+qidjAHohGpZsask46xi2Uehv/EQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793780515;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oC53DZWwYgEwPzoWhOOW+rI9blG5esMjqlTZQyYiaTo=;
	b=voGAuOGCrW8IqH6PdJHkhEDDf69xHEmewA7Zt9VDsQEsfc/tkBxMlhi5P+Nk5sdfIu5h
	 YX9nqg6uXkskjOtLBKXql7obWSTd3h4NqHnBkBLKckLRLX9k4MyDfEp92hfaDb0oGt24T
	 mT5b5CYawDeNdw7uNu2iEZP8Z2d2ErjtXSqZw+ZUN2rz9p85I5K+ROTSrJN92RkCfmEnx
	 Z3ktGUSslA0Kpwox+VqovZTWjSN5P3VBwDIwhKpEmSRvG9oADD4WdvzWlKoDmnOYxvBQQ
	 GE+to5Pa4vXJhHgzSg1/LsC1I3z4zoTZ3wuRYbniOuDJcBD5svUpBlLxPfHwqKM5zPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=90.182.112.124
Received: from localhost (90-182-112-124.rcp.o2.cz [90.182.112.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPSA id 8E1421F00919;
	Wed,  4 Nov 2026 08:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793780515;
	bh=oC53DZWwYgEwPzoWhOOW+rI9blG5esMjqlTZQyYiaTo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SIsy9gn+qLBWR6bGwuamlupX1rUlZ0R66DblL1HeSB9cx9PjBXvqDY3nEdSf+z/B6
	 w3rrVMjYM2tfELKtZpdLQDWysqmT+gzbcQXw0K5Lj80OGcWNHGvgEho5IGuq47ICHu
	 DRJAAGcQwjkEUMGOgcKBID61rcwYUgFG/reCb0kNmyESrimrHBmMjIQTpyThMjvP2F
	 Yc4fjfOSk1IwPV6tNlgJhpGYyjNB/Slw0ayP7UZzZl/FQRAj4/QKHlbiW502TiztDa
	 yefpXtX7JT6E5qJ8LKidLwwq67s0NugQXFxOj6bhb78l3bo94bLtkn17fpcoToN1Pz
	 b1avreert1lkw==
Date: Wed, 4 Nov 2026 09:21:47 +0100
From: Joshua Crofts <crofts@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Fabrice Gasnier
 <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Andy Shevchenko
 <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 2/5] PM: runtime: Convert last_busy to atomic64_t
Message-ID: <20261104092147.00002abb@kernel.org>
In-Reply-To: <20261103141442.v2.2.I998d26c0d635b80496ad12daa33b8de602030eb6@changeid>
References: <20261103221717.3840215-1-briannorris@chromium.org>
	<20261103141442.v2.2.I998d26c0d635b80496ad12daa33b8de602030eb6@changeid>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue,  3 Nov 2026 14:14:40 -0800
Brian Norris <briannorris@chromium.org> wrote:

> I want to use the atomic64 compare/exchange helpers. There are no
> similar 32-bit-portable helpers for non-atomic64_t.

IMO starting a commit message with "I want to use" isn't
exactly great...

-- 
Kind regards,
Joshua Crofts

