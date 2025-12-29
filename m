Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FA7D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrxtWAvskIXEXOytpuCW2heED14C9wnzaFnhAG9367E=; b=S10b1LneW5qFKJWt98yoXuE7QI
	DDj4edFMSI7i9Orgfhp3SLa8MAfxvRd7HunzL4iQZjh3uiC5p5K8UZzm/MnG0kTHHtH8OBSu41gfZ
	e9VrmtdmxQz2/Jzl766zwsgPFUreeajC0v/LODyuJacVxBfrOI2ckGewKFnbgrF7Gc4UwXURavIFo
	Bg8JJZmvExnbehFjc/oxxjwK5CM22asVKLu81L8nZ6ijGgogFhrsFIPgaut7Kds7lCBUpWCVfkbp3
	AQb6024l2TKzj7h/jV1re8qzBqsZuNoPkrxCd95976aEkC9TtQp1oZuodR1Q2qGlX3J+FvuVM5Hxv
	KK7Nc3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBEe-00000003c6s-1WVy;
	Mon, 29 Dec 2025 11:16:24 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBEb-00000003c5h-3Wl7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 11:16:23 +0000
Date: Mon, 29 Dec 2025 12:16:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767006975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrxtWAvskIXEXOytpuCW2heED14C9wnzaFnhAG9367E=;
	b=r8KzYJ5bEowxdJbLkhurTBahFKSRzCJcrY+pd6G93rM60EpAKQGFgxwsryBuJgnZzAZOvz
	Lk+QtaoexSJmwtY0mAWM7XYsyb0m+EgaYczQV2cRjSEydZEAw9mFHHTW/BhkTZDGkmJhrn
	jV72e+Nio96+S4+91af8YAmuUDADXDetiOPA9dJ/+mk4twGUwTdp1jUqIOWdevY9gX8yKw
	xeB2nOdRH1W8OCv5Fhq3Giylu7QJOc/yUAkBmmesWOv1X4zfJHg2ngP9lUmS4ROH2Ls6bH
	wXyRZ+qZEzki3ZMpBg+agDD/nHajasJsisNWELr5rkkvb7JAdUxYyrtANS1ftg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767006975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrxtWAvskIXEXOytpuCW2heED14C9wnzaFnhAG9367E=;
	b=ndtR8WFz8e6Y+5Zjym/Gu8UtAX3CH415PgrHRPcuFZW17vYEua9C7xIY0ToRrLfwhzZ9iu
	GNlnVLcqI+ZLwnBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Tom Rini <trini@konsulko.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>, Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/6] kbuild: Support a MAKE_FIT_FLAGS environment
 variable
Message-ID: <20251229121440-55a7d82a-6fd9-4875-9399-ab6b3ab05740@linutronix.de>
References: <20251227142200.2241198-1-sjg@chromium.org>
 <20251227142200.2241198-5-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251227142200.2241198-5-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_031622_076901_C3535C27 
X-CRM114-Status: UNSURE (   9.58  )
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

On Sat, Dec 27, 2025 at 07:21:48AM -0700, Simon Glass wrote:
> In some cases it is useful to be able to pass additional flags to the
> make_fit.py script. For example, since ramdisks are typically large,
> passing -E to use external data can be helpful.
> 
> Add a new MAKE_FIT_FLAGS variable for this.

The new variable's name is a bit inconsistent with the other ones.
I would have used `FIT_EXTRA_ARGUMENTS` or such.

> Signed-off-by: Simon Glass <sjg@chromium.org>

In any case:
Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

