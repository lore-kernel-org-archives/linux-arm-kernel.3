Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144EDC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 19:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=; b=nnbacZVEvmH6+OBZrriJN+kQvw
	ESSFKSPoN4y8WoCki0BeFD0Eve9+OMShzZkcaGArLKswtvfg9xG0osdr96u9GhPR8gPFH0dGomZDO
	dM2hvtTPW7KDm1Km70ewP21+kyOskwiObpKJIHN1oRo9RhJH8+fXoLvWQC6ZWBqI7z1x7qiH56TPk
	gTzsDr/gn1TqDIIoaSK9NkoVRt5wbMcYgpWgDNzeTiQM5ivkV30a3RqdNfOWFqFdRyOn1CPJHzfT/
	fKeAEgWjW1PZG3xXHEcAST0ThgV082hzUm3X+levHT1HPZtIqxhs1xBep+a1lhyDwnl8uzqOhVsZy
	dYQtDenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ye0-00000007qQU-2B8q;
	Tue, 15 Sep 2026 19:16:40 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ydx-00000007qPn-3rUi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 19:16:39 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so94908e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 12:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789499796; x=1790104596; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=gmziVn2BKogI46/RLiEecScsI2ijKfjYQ8o2ivQChwKvJzJ0zWHEbR4kNL2QI8ZH1M
         A91r1WThV7Z1DeE2gshPEkpWRgUSOVMtxZj2tgOkAu44Z/bAtpbP2CF1mpUkrRCj3vdV
         8Se/q12PqGHnyI6PHQgB2Pd3/AAYVPJZP6r6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499796; x=1790104596;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=UDVfvXLORRqyQJ8Tn5bYoN29cuR1eRz/cRUaOV7d+eFmyyHEDBn8reRg/0AgXX0cMb
         1FBWP6t8EeV1qO/l9aEZ5VY24M44BZ6J2Gx01/J9gGXV/b+GpKIpjaBBird4FrQePBOL
         Ifchz0MCagZb1ONWbTJEko4SbznzC28RKbluewdADk0Wd4x4UI75zuLj8immhYFwAxKD
         dA2wdZcYdviqI1EGKG3162pDONxtZ6tyrjrpKIzqGivHLA7eqoqrShVEMUHLxcSKVfxD
         xg6Mh5Y1V06ppo0Fuf5IVenS8A6RLtMAyhBBEyJovgB7a56djAa+B9I5vJ684hVJEvnc
         kPNg==
X-Forwarded-Encrypted: i=1; AKwUvBwpab0KC7Ykgp4KKLc0vMgamKJAs9y9s8jTQVrcLButsqPEtQnvTYhYT0EiRIez3pl6r1O5wBZHfp9mo4uYWcm+@lists.infradead.org
X-Gm-Message-State: AFuF++mY2Gz5BAgW8htIr8s4TRwoeiRL1wN/jsHPtT95ggFBEGJO46d+
	Q8kJkhfXEDHRPvFu6sfUJQCFZYGseRUk0ZylZTGkgR1ZcjFWOEo0UhW6nYJPL3GMyi8/CT6dIPo
	4BZBO9/4K9BuU
X-Gm-Gg: AYBFou00Dn8VoBspQVirSn/FGg2UUq6mCBpdmQxlr+Ef/eDIVuxDsb/8AbdxPudu7wC
	bldpPn5wDQhvCMIHPD5io7aLJvs9Eo3dWXRFzEzjnbokY5hhoDG8v//XMIirNB4Nqj8HtD0KKGb
	YJuRRaZCOUb7GC2dpxK9dvwDa9jMPYIty4eLt/v0WKcpXbjaGfTzCuFA8tKRmi38T5stuw/UFWc
	NFHnuzWaOfR/FR+f0rGQQkk5zwcspkMejEK2d7tay8vqwhrz9XjtvaRxcIUzHYCCDrAx7T7Yp8Q
	xcaZhdy6lEiH8uGDIQbN8mwHqQ+O4OLpFl+S9VKRToeE4rmu0V3Trr/ajDOizYMbLdCyZUbaIkD
	D6HN/wupTiEus5f3rH5cPn3Nbky6QiURmeQst5TK5Eq3sivSGRAc/4D7HrAYDYZrVGPftbcRkN1
	+D5a+/YpJcCBGjCF6KjRS3GbFGl7J8YJrN7330qQxXJv9/2O/CoYV+CHqmfTKFTP7LBR2ewc7rd
	/u37OK0l1xpsuszIc3MAocnJmVT/wjMYrhVTfHLa9beGD6foQ==
X-Received: by 2002:a05:6512:b8f:b0:5ae:b7ce:9ca5 with SMTP id 2adb3069b0e04-5b8ae6aefc2mr4909217e87.18.1789499795928;
        Tue, 15 Sep 2026 12:16:35 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5dafedf96sm1276171fa.41.2026.09.15.12.16.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:16:35 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b7aso108700e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 12:16:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxMGvqPPNmip7A/hGcyiSJDidUBDJ7Z3UxiAgNVC40lvLPSr8f1EM2rGsr3rvZDqHHCSpeiZNf5lxLJl2VjcDA+@lists.infradead.org
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29b839a057mr1176039766b.2.1789499355710; Tue, 15 Sep 2026
 12:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
In-Reply-To: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 12:08:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Gm-Features: AcwNN1VCm0LMG7z3Jned014oJh6WBcf4uOx0OBk98_hrtHKbrhcQiMMJ_A-fmB0
Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_121637_982638_A29E66B4 
X-CRM114-Status: GOOD (  18.07  )
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

On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
>
> Is this mainly about stuff like "we installed a file descriptor and
> then the following put_user() failed"? Because if so, I think a nicer
> fix would be to have a policy of "if userspace provides unwritable
> memory to a syscall, just keep going and pretend the access worked",
> and maybe have a sysctl that kills the process when this happens to
> emphasize that userspace should not be doing this.

We've done that before, where we just ignore put_user() errors and the
user gets whatever the user gets.

It is maybe not optimal, but it's fine. You can find quite a lot of
unchecked put_user() calls with a pattern like

        git grep '^[[:space:]]*put_user(.*);'

and some of them are in core code - see the two in kernel/fork.c, for example.

One of them says "if userspace has not set up a proper pointer then
tough luck". The other one doesn't even bother with a comment.

The scheduler has two cases too, although one of them is admittedly
for another error case.

So yes, saying "if you pass bogus arguments, you get what you get" is
a valid model. It's perhaps not the *preferred* model, but it's not
wrong.

It *would* be wrong to take code that already has error handling and
remove the error handling, though.

                  Linus

