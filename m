Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356EBC4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Exwl0AsGwf6M6S13oTNWhmNyTBsKTiqZ5UEvnNJspo=; b=HKL9qPX05NmYUh+mbwAlLftHiQ
	nAgSaC6ywJqjbeJEw55UInnPBI8MbfjB6mTuO2wwK9hCMekS8qxpu8SsVfzNl3AefCygPNSWrMiR5
	z9ixH8qu9nQjh2n3rZ8bQqzIIEJBQCAH+02FLJjMh48l0+3F7lU7S402CEh1BTYA7lhHRYJSfME06
	s0zTw+2Y6x4XMJ8bv/ggik4609VjOw++bMo+iJ7p1TJ/gGDfyCzZP4DzYFKQNGcnCGG/4bSuBQ52h
	Amn90xAv/qjNsYJiDK7YsgUO2AJDt8caSK/jLE/rV09cMimtxp+0O28Zy9/LbwuMFj5SS7CXL+klm
	7e32NfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZgZ-0000000CJq4-1CcN;
	Wed, 22 Jul 2026 16:20:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZgY-0000000CJpx-2hzM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:20:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 130FA40DA9;
	Wed, 22 Jul 2026 16:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830351F000E9;
	Wed, 22 Jul 2026 16:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784737242;
	bh=1Exwl0AsGwf6M6S13oTNWhmNyTBsKTiqZ5UEvnNJspo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XFRfUPABWpzjJ7fOkBcKIqJ4BWV+1eBvjFuNRgixzas8vrIhpRievAN+vHwpRM9tG
	 RfgbtQd3Bu08Vv4/ka0sxj+j+psYSiVNox2dCK5uXC0oJ9L0nM1Wugrpi2YutCqSSJ
	 doFwvVXvqg4TrXdU67FEBE4Srxo8uJxwCynncGWgDm3/dcCbqqKcMm/EYDiZGB3yK+
	 C9PNJNsepyuoWb1EeN+6hxnUwxSL9HVeLYQ5rxr1STHBu8xDsWO1te4hVGdz9rQZyU
	 BTKfcGrAOtxZYe3xH5y6ZHcdKjWy3P3bkSvEIke5NKhzbRYmnBHnHRRXrJklq7l99l
	 yuquli/u/mWbw==
Date: Wed, 22 Jul 2026 16:20:40 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
Message-ID: <20260722162040.GC2794619@google.com>
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <alnlaCXmoLRAlr96@gondor.apana.org.au>
 <20260721082501.6128-1-bartosz.golaszewski@oss.qualcomm.com>
 <c826b73d-6307-4237-a065-b7a8487350ce@gmail.com>
 <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
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

On Wed, Jul 22, 2026 at 01:33:51AM -0700, Bartosz Golaszewski wrote:
> > Also, what can the current driver do that cannot be done better using
> > software crypto?  I understand that you have future plans to add more
> > features to the driver, but those are not relevant to this discussion.
> >
> 
> We can offload crypto operations to the QCE saving CPU cycles but more
> importantly, the QCE provides HW based isolation which some vendors care
> about.

Do you have any concrete proof of anyone using this with a specific
Linux kernel feature and actually getting a benefit from it?

Just for some additional context, I've been on the Android team for many
years and have worked with lots of companies shipping Android devices
with Qualcomm SoCs.  I also upstreamed the support for the
Qualcomm Inline Crypto Engine (ICE)
(https://lore.kernel.org/all/20200710072013.177481-6-ebiggers@kernel.org/
https://lore.kernel.org/linux-mmc/20210126001456.382989-9-ebiggers@kernel.org/),
which is what people actually use and isn't the same as QCE.

The only times the Linux QCE driver has ever come up is when someone
used it accidentally and it destroyed their performance (due to the
20-60x slower performance than the CPU) or caused a filesystem hang.

These issues get reported to me -- sometimes even from Qualcomm
themselves!  It's kind of annoying.

(Fortunately it's also quite rare, since the vast majority of people
just ignore QCE and don't make the mistake of using it in Linux.)

As far as I can tell, what actually works and what people actually use
in Linux on Qualcomm SoCs is:

- The Qualcomm Inline Crypto Engine (ICE) for storage encryption

- The ARMv8 Crypto Extensions everywhere else, e.g. dm-verity

> These are future plans, yes. But right now we do have active users of this
> IP

Just because it may be used by the Arm secure world doesn't mean it is
useful in Linux.

- Eric

