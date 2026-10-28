Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D5C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 01:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1p6p+nh9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkEja46x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DHS4IRcRkeGwthYM+/zX9QaAvmyaBpkm4EoH1u9SNX0=; b=1p6p+nh97lGxZ5
	0t3v+7LfGQZcX/UEmoyS1iJrUm1CS3A5VScez8TEYzIJ4TLweGv9wkJ6mPzmiKYdWvKRid4WnzDGh
	DV3HC8bSjhdFy3tTrWZdPt2B2w7ldschcPYlKfamtX6u80Fhd8Nd0NyIYtr6M0bmwT2iHCjZRUbkw
	Y2jf+iHRKG5srJKKixAQUC5FUEsKISahUiaSxDujp7vLaO7ggnuDwsGpZKMhMbQpy2LLLr/jGkvD5
	2UAk0ncTCgnBhzV+F+98w/d/Ruwiip1JU6xQq80BGNGS6QSUDjQ9iZpXQJna3JdVGsMp5KcVOQ0DN
	clxCwjBT8odxHY+Yh/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLswt-000000063z5-1a1K;
	Wed, 28 Oct 2026 01:59:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLswr-000000063yJ-1Hwy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 01:59:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so5280565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 18:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793152766; x=1793757566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHS4IRcRkeGwthYM+/zX9QaAvmyaBpkm4EoH1u9SNX0=;
        b=qkEja46x2MxzbVfVp3yhf3hhNKI1g6R9mJlP3Fu3MQs8z48o5HHZLF4pQ+8hon2Nb7
         T5HdtuOfraO3BSV2d+iUfmuZigVBMPtpbkFq90tZ7IgadHvE70thk2Tka+pGiGCDi6io
         JE/Pb8VoF6AeOiye/mmYBuimTg4oeWvH4aeOrNy6fL9CaHe7G6VJXOKF0WvcHxML16wb
         mhD9ydd4X259AbgkpvQQp2pycXs7qKa6u/MZ4kwJECG7Mps88NwWzGgVecpK4aagi2ho
         RcBtYuc4MVen2mX+TQavrD1f56pEU4Do8E8x6d4JCl284p5qbrh9jM45ZNAaNNgl1ywm
         OxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793152766; x=1793757566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DHS4IRcRkeGwthYM+/zX9QaAvmyaBpkm4EoH1u9SNX0=;
        b=D42+CBf+utIbs5lTTyGb+YGbXKoN9R83exqtL9M7+5TWB8gv9vQeSVIIcgYYOEdorn
         XN6shdkRnH/52Qh7TLuv0X71x9Z6KniHp6PzMcCixghJ9iVYFyRTxmLZ4Oq4P+Dg/tdw
         M4zJWHLkRwC6dneXcp4vOHXIgFp0JdoP/fZkYy5WziwP61KTq+q2U/E0QCNOCOYf5oOV
         cZB43S8tP2K3aD8aQaK/2NAnOtO/9sSJFh92LNE+ekmn4iMKjvWVHOO81vqDiSlh0b0W
         Oj9opMKKJybHVq5ZVyZiayg7n/7Vvc0FrjqBtOOUOEIHUYEuMZOFuy55wFrwgoMTnnDa
         6kgg==
X-Forwarded-Encrypted: i=1; AKwUvBzisM7Rsydk92pd6skg4mxHwZSghEJuRIVLxopCswxj+z+W0hZpxPoRapkX/+pZYsi5u6Ea1uDwJQ7uSYoGFb6q@lists.infradead.org
X-Gm-Message-State: AFq9FYLxOYRH/CEhcWrnSqJ54PlWg7Ejf7urarPprieaIzBaVA7uosls
	D3f1MQCsPZWeb2uU66l7Z8dKWFuBNGFdj3tDgy0gK1mGNKPeXZCswOZK
X-Gm-Gg: AYBFou3BAvGD4KjTSX4dUE+aJ+uWwBgrPnJSJWRfcZ74Qmgkkul0KDi/KOJ0PV2l8ix
	BUwiuPntJCj3uuR2n+P7UDwAUvj/cqK4NWA/WM0gaY/f6sSiex16JnjB9olc1yzA9nDWecrrKpc
	gmZXshevO7U9hHgNsMwbW+GK4Pu8mwZ1eYZUWGkiH50HRYmmdZmRc7xZOKR2T6HKj/hJWEEsGk0
	U6wQz3hsGi+92DPiRmhPRGC+4O42A8ujAVXESXB2R0tc3S/WlYxCKglP6kcChywvVqA4ff0XXaV
	jtrmFp2QoQ9BbpwUAhZVDM6ca092+awBSekHl3+8IusU9bw/hazSGV8A5gpdPJbZ0MGs4VGyOTy
	zjty/LlHKuRHZmmNN6WF0ioIBpKDcXtSHuaZDUewkCej+M4ygAyojYoomJxjOoqTlx/4VUwq1i/
	AK0oAZnid4zPF+e9U1zfQiSuG5tRPrSDwfYpUM7JFKpYSLwWZVloUtmeoHw47B/JhnFblBm/QRm
	7CYi7rna0hyxpk7g1VnrXW4TYtOygIm7Hb/JeVS34OQzHyjoxQ8cYfrs4Xs5rpB96EdYHh6tPG0
	x90JKAyPZaE5fsewmcW5sWIOyNnxz6ifCR95cqX8ngstlkT+Nss8r3hlhS/+Bt1SIiOxNf/fPwI
	f35AmivnSfb5KeYjaMiUBOZkWg1Zg8P+Sk+7T+cR7UYfJdJTh+tAvHmMnKq3o7UD8Q80=
X-Received: by 2002:a05:600c:19c8:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4a967201e9dmr16334615e9.27.1793152766074;
        Tue, 27 Oct 2026 18:59:26 -0700 (PDT)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a976010ca7sm10831475e9.1.2026.10.27.18.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:59:25 -0700 (PDT)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com
Cc: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	manivannan.sadhasivam@oss.qualcomm.com,
	bhelgaas@google.com,
	robh@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	iav@iav.lv
Subject: Re: [PATCH v3] PCI: rockchip: Don't lengthen PERST# when power is already valid
Date: Wed, 28 Oct 2026 01:59:23 +0000
Message-ID: <20261028015923.2436122-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cf541723-eb4c-4ba6-92c5-33baafc20e7c@rock-chips.com>
References: <20261028005603.2399220-1-ehbello@gmail.com> <cf541723-eb4c-4ba6-92c5-33baafc20e7c@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_185929_341609_A2990AC3 
X-CRM114-Status: GOOD (  28.87  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 09:34:04 +0800, Shawn Lin wrote:

First, an apology for the noise: a v4 went out seven minutes after your mail
and crossed it. It answers an unrelated review comment about T_PERST-CLK and
does nothing about the points you raise, so please do not spend time on it:

  https://lore.kernel.org/all/20261028014116.2432425-1-ehbello@gmail.com/

I was respinning too quickly. The next version will wait for this thread to
settle rather than landing on top of it.

> The assumptions here rely on a very weak constraint. If some designs
> don't define the 12V and 3.3V regulators in the device tree, but those
> rails actually do power down along with the rest of the system during
> suspend, then upon resume the reset wait will be skipped entirely. I'm
> worried this could cause regressions.

You are right, and it is worse than that. vpcie1v8 and vpcie0v9 come from
devm_regulator_get(), not the _optional() variant, so when they are absent
from DT the core substitutes a dummy rather than failing, and
_regulator_is_enabled() returns 1 for a dummy:

	/* If we don't know then assume that the regulator is always on */
	if (!rdev->desc->ops->is_enabled)
		return 1;

Combined with my IS_ERR() checks treating an absent optional supply as
satisfied, rockchip_pcie_supplies_enabled() is unconditionally true on a
board that describes none of the four rails. The wait would then be skipped
on every such board, on resume included. That is a regression and the patch
should not go in as it stands.

The underlying mistake is that regulator_is_enabled() reports the present
state, not for how long it has held. Probe can bridge that gap: the system
has been running for seconds by then and this driver has not touched the
rails yet, so a rail that reads enabled has been enabled since boot -- and
that holds for a dummy too, since a dummy means nobody is switching it.
Resume cannot bridge it at all: the rail may have dropped and come back
microseconds ago, possibly below the regulator core's visibility.

So the next version drops the resume hunk and sets supplies_pre_enabled to
false there explicitly, leaving the full wait in place on resume. The change
then only touches probe, where the inference is sound. That also removes the
one hunk I had no measurement for: it came out of an automated review of v1,
not from hardware.

> Intuitively, one would expect that a short reset period prevents the
> endpoint from recovering fully, that seems more plausible than the
> opposite. [...] Therefore, the actual observation that a longer reset
> causes failure is highly counterintuitive.

Agreed, it is counterintuitive, and I cannot explain the endpoint's
internals -- only what it does. What I can rule out is the reading your "as
long as the reset is clean" suggests, that something else happening during
the wait is the real cause. Link training is enabled just before the sleep,
so the root port spends those 100 ms training against a device held in
reset, which looked like the obvious suspect. Moving the wait to before the
link-training enable, keeping the pulse just as long, still failed 0 of 15
boots. It is the duration, not what the controller does during it.

The v3 table is one kernel with two module parameters, one sleeping before
the PERST# assertion and one in place of the msleep, and the host driver
rebound to re-run probe, so nothing varies between rows except where the
delay sits. A rebind reproduces the cold-boot failure identically, which I
checked before trusting it.

> Furthermore, even with the same power supply design, different endpoints
> may behave differently. What if a particular device requires a longer
> reset pulse to work reliably? How would we handle that?

The only floor the spec gives is T_PERST, 100 us of active PERST#, and v4
started guaranteeing that explicitly with an fsleep() rather than relying on
the 100 ms. Beyond that there is no required minimum to preserve.

And the short pulse is not new behaviour: from the driver's introduction
until c47f90be4c89 in v6.11-rc1 there was no wait before the de-assert at
all, so the pulse was only as long as the register writes in between took.
That is what every endpoint on this driver saw for years. The 100 ms pulse
is the recent change, and it is what broke this one. If some device turns
out to need longer, that seems like a quirk for that device rather than a
reason to keep a default that regressed another.

Thanks for the review -- the regulator point in particular is one I would
not have found.

