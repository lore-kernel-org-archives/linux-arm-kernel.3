Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B502E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLQtj3Z+YBvoe66gPP5jwG3nfGAR0rbHbfqZsmiV4Zk=; b=00Fmm5vKhU1f7eollImMtVyRbK
	G//83dNSTBHWjVlso9x/mQA00TX77WB0vBYXi9pBvya171OtXFEPXii/kJBufk9ADOpSb+khtevb1
	ybp6M46gTvL2E4t2FtZMe8LxvbhfXfY4F1Z4NbV5e+Y6QG9+af6QBGlq2vefIR8nN6WNufrjDx0dk
	9MHnyRN6IpK+4UwL30u6AFrqDZC/+xW02Ml5zrKjzY3Aw6H/XSW4xojVqH2jZXrGzQ8GCmpgaz7VZ
	HvWJAAZF5ttHJNxGA2/UB/yq7uYRio4vrC3Ndqp/NMbdxci7Mz/CHSWYi7ZULWsjBnATUppF6LLjt
	UmzNHkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbzV-0000000ESu9-33n7;
	Tue, 17 Dec 2024 18:08:17 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbcU-0000000EOWE-33rn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:44:31 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so7809374e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 09:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734457468; x=1735062268; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLQtj3Z+YBvoe66gPP5jwG3nfGAR0rbHbfqZsmiV4Zk=;
        b=fHoOwrAmp0ucWHGK4OgEvVHkYYDmr5qmXQH7oOYkPp6mJhxx89fUpmcyX10vLbI7+y
         dZTjuLAeacd1VJV+GYNqi6uTLiI4kTF+G3eYvZNNnIVjVIQ9WAtVd/f2EDVkM8xiOyCY
         QwHIWnARYdwE/JtXXNBjYhiBJ9O/I/4doH8xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734457468; x=1735062268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLQtj3Z+YBvoe66gPP5jwG3nfGAR0rbHbfqZsmiV4Zk=;
        b=gSut1O0gin5+H7D7jA50tQKUEPNCcQVUzsOPNIJD77aYzbHVVePLi6sZgKh9gCvYWN
         lbpZTiIX1L+2IPH6F9IIDa8hu7GmzwcYVfi+E0RV5yWqNYh6R05mw4qEmo3wztaLyWNt
         ITS/6CsqRZgnitt4jZ9tCVHHn9Ln2f/2ErwzUCJz5fJ4VSWdXHYcvlDVEfIfulKfOgVZ
         Zd2Ap4yVSGsNj7awPhIuKMAWDjy2J50OQ2rnoM2cuVRvDHf5YDuWGPG7Xb8xMMHoSYBP
         WhpsAMMPtz6+guGcY57r2yOlxURGNViUAZQqiDfZ2aKHmgmI5kNiNqz9Ifqp8LbWfVva
         meLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw2K+brdlBFb6V0e4vDtsfu3TK6IJSjVUMu6Zh70a8V6AEW7deO52EIWRe6fBu9n1FqgDeiW0bGLx6QyRvCKNq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Wt1vSr9SF2yFq7vk8V8laHBNljfB9jKwI2NtD6fwbS5nrE60
	JpCfm6kui829A7/C/+wRjFSBmeXzjE8jZqpzU6SItJWl0JT2RKUl9/5QQmv6iIEMIKLVrkAHrKG
	sVg==
X-Gm-Gg: ASbGncu2886bNdCxigmz5HuT5JkPxmrIbST/eLqGe86oG7uKAl7EuVRvsvzLfOmVCj1
	xHhistgDZ8pTjT2g382w7f7bERhjsPJ0o6MBImYiZ/sNsIS6cCpLB51qyH/g3KiJ92jIVZ8oCZp
	tgLuh9DFeGOwoNWxH+oqSF0H6vf6ondhnmdtOgYxyq9sQWEzAa8Z/dNOhbVbnnWKh5cdsi/fl3K
	Z1uLMneYiDhek/HZCkfiTxWLn/rccwLftccH70BT0Bs0M8Ar0s6jE3RvwZqLT7Ty29rk0Vj9W9X
	7Vbz2MxPMwhglLRUTYBBIAnW
X-Google-Smtp-Source: AGHT+IHgkMEqN/14nR/Ldc1tryW9vODY/EArdP6YimytlV83uX2pGcNBu9htcGVuSF9VZ8LqetK6Ug==
X-Received: by 2002:a05:6512:2342:b0:540:353a:df90 with SMTP id 2adb3069b0e04-540916d73eemr5690424e87.43.1734457467748;
        Tue, 17 Dec 2024 09:44:27 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9abdsm1220359e87.68.2024.12.17.09.44.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 09:44:25 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso67423761fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 09:44:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXynZ5x4uW5cBL6iaorqFf3iSsYan3QdwbV2t2R1B/tp1TpC6WHfJ4K1wil0ZmtcQlzI+HAWx8Jg+AUfKQe/FBo@lists.infradead.org
X-Received: by 2002:a05:651c:2108:b0:302:3de5:b039 with SMTP id
 38308e7fff4ca-30254566a55mr66069711fa.8.1734457465327; Tue, 17 Dec 2024
 09:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
 <CAODwPW_c+Ycu_zhiDOKN-fH2FEWf2pxr+FcugpqEjLX-nVjQrg@mail.gmail.com>
 <CAD=FV=UHBA7zXZEw3K6TRpZEN-ApOkmymhRCOkz7h+yrAkR_Dw@mail.gmail.com> <CAODwPW8s4GhWGuZMUbWVNLYw_EVJe=EeMDacy1hxDLmnthwoFg@mail.gmail.com>
In-Reply-To: <CAODwPW8s4GhWGuZMUbWVNLYw_EVJe=EeMDacy1hxDLmnthwoFg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Dec 2024 09:44:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X61y+RmbWCiZut_HHVS4jPdv_ZB8F+_Hs0R-1aKHdK4w@mail.gmail.com>
X-Gm-Features: AbW1kvbAgvCz7vA_yFdhIVykkakAa4L6Lz2IE9DR-f5ZjOd70MgEn8kxRtbYbd0
Message-ID: <CAD=FV=X61y+RmbWCiZut_HHVS4jPdv_ZB8F+_Hs0R-1aKHdK4w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Julius Werner <jwerner@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	Roxana Bradescu <roxabee@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_094430_787720_415C9003 
X-CRM114-Status: GOOD (  52.10  )
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

Hi,

On Tue, Dec 17, 2024 at 5:25=E2=80=AFAM Julius Werner <jwerner@chromium.org=
> wrote:
>
> > > - Refactor max_bhb_k in spectre_bhb_loop_affected() to be a global
> > > instead, which starts out as zero, is updated by
> > > spectre_bhb_loop_affected(), and is directly read by
> > > spectre_bhb_patch_loop_iter() (could probably remove the `scope`
> > > argument from spectre_bhb_loop_affected() then).
> >
> > Refactoring "max_bhb_k" would be a general cleanup and not related to
> > anything else here, right?
> >
> > ...but the function is_spectre_bhb_affected() is called from
> > "cpu_errata.c" and has a scope. Can we guarantee that it's always
> > "SCOPE_LOCAL_CPU"? I tried reading through the code and it's
> > _probably_ SCOPE_LOCAL_CPU most of the time, but it doesn't seem worth
> > it to add an assumption here for a small cleanup.
> >
> > I'm not going to do this, though I will move "max_bhb_k" to be a
> > global for the suggestion below.
>
> If you make max_bhb_k a global, then whether you change all
> `spectre_bhb_loop_affected(SCOPE_SYSTEM)` calls to read the global
> directly or whether you keep it such that
> `spectre_bhb_loop_affected()` simply returns that global for
> SCOPE_SYSTEM makes no difference. I just think reading the global
> directly would look a bit cleaner. Calling a function that's called
> "...affected()" when you're really just trying to find out the K-value
> feels a bit odd.
>
> For is_spectre_bhb_affected(), I was assuming the change below where
> you combine all the `return true` paths, so the scope question
> wouldn't matter there.

Ah, right. OK.


> > > - Change the `return false` into `return true` at the end of
> > > is_spectre_bhb_affected (in fact, you can probably take out some of
> > > the other calls that result in returning true as well then)
> >
> > I'm not sure you can take out the other calls. Specifically, both
> > spectre_bhb_loop_affected() and is_spectre_bhb_fw_affected() _need_ to
> > be called for each CPU so that they update static globals, right?
> > Maybe we could get rid of the call to supports_clearbhb(), but that
> > _would_ change things in ways that are not obvious. Specifically I
> > could believe that someone could have backported "clear BHB" to their
> > core but their core is otherwise listed as "loop affected". That would
> > affect "max_bhb_k". Maybe (?) it doesn't matter in this case, but I'd
> > rather not mess with it unless someone really wants me to and is sure
> > it's safe.
>
> Yes, but spectre_bhb_enable_mitigation() already calls all those
> functions on its own again anyway, so I'm pretty sure the "must be
> called once for each CPU" part of spectre_bhb_loop_affected() is
> covered by that. (Besides, it would be really awful if they had made a
> function whose name starts with is_... have critical side-effects that
> break things when it doesn't get called.)

The existing predicates already do change globals before my patch and
changing that is outside of the scope of what I'm willing to entertain
with my patchset

Given that I'm not going to change the way the existing predicates
work, if I move the "fallback" setting `max_bhb_k` to 32 to
spectre_bhb_enable_mitigation() then when we set `max_bhb_k` becomes
inconsistent between recognized and unrecognized CPUs. One gets set in
the predicate and one doesn't. Even if it works, this inconsistency
feels like bad design to me. Also, setting `max_bhb_k` to the max at
the end of is_spectre_bhb_affected() would perhaps _help_ someone
realize that the predicate has side effects because they'd see it in
the function itself and not have to dig down.

I would also say that having `max_bhb_k` get set in an inconsistent
place opens us up for bugs in the future. Even if it works today, I
imagine someone could change things in the future such that
spectre_bhb_enable_mitigation() reads `max_bhb_k` and essentially
caches it (maybe it constructs an instruction based on it). If that
happened things could be subtly broken for the "unrecognized CPU" case
because the first CPU would "cache" the value without it having been
called on all CPUs.

In case you can't tell, I'm still not convinced and will plan to keep
setting `max_bhb_k =3D 32` in is_spectre_bhb_affected().


> > > - In spectre_bhb_enable_mitigations(), at the end of the long if-else
> > > chain, put a last else block that prints your WARN_ONCE(), sets the
> > > max_bhb_k global to 32, and then does the same stuff that the `if
> > > (spectre_bhb_loop_affected())` block would have installed (maybe
> > > factoring that out into a helper function called from both cases).
> >
> > ...or just reorder it so that the spectre_bhb_loop_affected() code is
> > last and it can be the "else". Then I can WARN_ONCE() if
> > spectre_bhb_loop_affected(). ...or I could just do the WARN_ONCE()
> > when I get to the end of is_spectre_bhb_affected() and set "max_bhb_k"
> > to 32 there. I'd actually rather do that so that "max_bhb_k" is
> > consistently set after is_spectre_bhb_affected() is called on all
> > cores regardless of whether or not some cores are unknown.
>
> Yeah, you can reorder the loops too. I don't feel like moving this
> into is_spectre_bhb_affected() would be a good idea. Functions with a
> predicate name like that really shouldn't have such side effects.
> Besides, I think is_spectre_bhb_affected() is probably called more
> often per CPU, both once from spectre_bhb_enable_mitigation() and by
> whatever calls the `matches` pointer in the cpu_errata struct.
> spectre_bhb_enable_mitigation() seems to be the function that's called
> once for each CPU on boot to install the correct mitigation, so that
> feels like the best spot to put the fallback logic to me.

As per above, while I agree that having predicate functions w/ side
effects is not ideal, that predates my patch series and I'd rather
things work consistently.

-Doug

