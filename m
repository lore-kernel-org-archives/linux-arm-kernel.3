Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DDEEB3624
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 17:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbIkpYLS9gbJFch6OaF8nYKkHDJKdsVHvQjZGTHSn/8=; b=Uv/fTsBFR5y2KQ5uxu/1I05wa5
	m6VbiiHHOMO8EnSnIDINxgIFwsU5NjVNFyoqyShyuiMBH68SubqpqypPnukp3YxsKzaDDqOSPpzLs
	8SBYORTGpB+tWSM5fJSkxxRmizotXMWL94XGbZOtnNMWP3W7ERZXdCQDiSIvLWafXOwovAQVUyO5Q
	I/JHylrxzDxmP8unK+TG8h5USUAg79LvnqRwGBe2GiIgTT/i3545a/n948Hs1/wzpTX3R6YpegWj/
	A5jjd4XuI8AZa1CNVFD35PCaxoxiUSP4YH7fNK0O8KZ1xlO5+F/sH8XqK5fcVir63PvrAZkY9gG0R
	TYnwn6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6zS-0000000DaEe-24Ft;
	Mon, 02 Mar 2026 17:23:30 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6zP-0000000DaEI-3xzQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 17:23:29 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so562095366b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 09:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772472206; x=1773077006; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TbIkpYLS9gbJFch6OaF8nYKkHDJKdsVHvQjZGTHSn/8=;
        b=F5tnC1uv6zkSUep29D12j29TWxFRtt/reFMQLttmHM0mqUz/rhERfZYL1IYoviqdMx
         C6Mka8GqbGqPC+Y2BXq2oFBzBWUVhdR4RzohXNu1Xby4xGaA/Uca8qDCi7QA8vMuIIsM
         Dydh8+09G38HK6l0VqIGro90P0BM5zAJKu3f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772472206; x=1773077006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbIkpYLS9gbJFch6OaF8nYKkHDJKdsVHvQjZGTHSn/8=;
        b=V6KOZg6CmmsPKKkubmrtjOfiq3evcBOk7IJ5m/D1DVVn1U2Nz4VbA4XEzDTFlC2kzU
         JdLiUN9AiEctOl2XBTmSTr3q1oYP/1KucOqM6jmy0MOCrZ60mIIbPVgwYwDqV4JXYC4a
         WvY8oYKVou0K74+WPjWA+5QN9FBahU6GgO4RQ5uDhKULBe2o6PoIjTWu2NX7jnVsh/sI
         J68Y2UVhb/wXu+rdxhvQSwK3p7HEpcEoAB+HyjFc1YlgIQQrTJDCKsZ1OiQy6M/BKUpW
         R2kLEvCXCGInqy3ecOWeq8d+c9MrziwSBCRONGT65KDczztt8umJrZVH1Cr6BjEXTyQX
         h8pg==
X-Forwarded-Encrypted: i=1; AJvYcCVMFPA6XjNZp9KD3cXMVK9BEHrUDW0lvCRM1VvcDU9eSx2wey/cngXEiCryXD5m9gcCPN/HVLfrMPUbdg4doM8w@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb8hMgGLGvAKB5rU4DMjBrs2506Fzq+B/7zLK5A+gtnH33O4v1
	Rb0gztDucXgLsBBXQ3zuLu65+UdWzTRYD+T2hODrmbSMD+sq1RvxOuDh2zJw1MHtQZldN2QFVHr
	WTS7doak6OQ==
X-Gm-Gg: ATEYQzwhE51iP8cRcL+EfMITfg1WOtU35tVbXcsAvhLj/7D4dko6vVpXuOC+s055zmO
	qvDqnO1DI+UySumzpNLsTV/qsXxG03z0i/t6trzlnx5vGykBI4hoclml2X6cAnBI8SFaJMXv7lK
	LjNQKljC8jYDs7d44N/CA1doHc4muOOxlAIauPa31meIrnJMBgGt5VdsP8eNOtuHQ8emfbRlEkE
	GxZ3KZ3E6j0J5MMYPylTMz58WKJEZque/zaC3PE+TSAtboF5Im2P38kC9da7DCWZCB4t5jgBbNH
	oNLEUuyUlhJwWbu8czifby7/eVuIj0+9i4KP+byfuMHIDbF3CvcSjpxPyJJKS88btnF0SavCsKA
	hz4pC8PQ4aKaVrbHsqmoJ69QV3AToaLXtNYtPnetKXTJPRYk0J2RkBvvJhpQPo6fn/i36GdYM5r
	XXlMXQlywl5PPdP4nZmX6sk6xUayptyqT5TsO7pWWAf1nIx13S85KSkGAsMh8hArRC4RCgdT0+
X-Received: by 2002:a17:907:3e0e:b0:b93:7255:2da with SMTP id a640c23a62f3a-b937659feb6mr866373866b.55.1772472205602;
        Mon, 02 Mar 2026 09:23:25 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab135casm475088266b.14.2026.03.02.09.23.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 09:23:25 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65f73225f45so7512528a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 09:23:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVcE4NI6ZBEEb2h0ZFV1SLfBqpMcPXTk3EGDzvENPRaF7xwa5jxOGcMgaZ63AUBBqlyZ9koAqJ2stItmfqnj/P@lists.infradead.org
X-Received: by 2002:a17:907:25c2:b0:b8e:7dcb:7f1b with SMTP id
 a640c23a62f3a-b93763af8f8mr867609766b.21.1772471885098; Mon, 02 Mar 2026
 09:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20260302132755.1475451-1-david.laight.linux@gmail.com> <20260302132755.1475451-5-david.laight.linux@gmail.com>
In-Reply-To: <20260302132755.1475451-5-david.laight.linux@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Mar 2026 09:17:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=whaR_ujJvWGTe_fZxg_d2YSORZWnXwHLa5Gao+x136pYA@mail.gmail.com>
X-Gm-Features: AaiRm52ly83FU0bUfVtu2Rv39h3JOZJTzcdxMzg3AYFviKySZcFGK5yhPqg6aWc
Message-ID: <CAHk-=whaR_ujJvWGTe_fZxg_d2YSORZWnXwHLa5Gao+x136pYA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] uaccess: Disable -Wshadow in __scoped_user_access()
To: david.laight.linux@gmail.com
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Andre Almeida <andrealmeid@igalia.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Heiko Carstens <hca@linux.ibm.com>, Jan Kara <jack@suse.cz>, 
	Julia Lawall <Julia.Lawall@inria.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
	Kees Cook <kees@kernel.org>, akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_092328_002031_2CB7C307 
X-CRM114-Status: GOOD (  13.25  )
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

On Mon, 2 Mar 2026 at 05:28, <david.laight.linux@gmail.com> wrote:
>
> From: David Laight <david.laight.linux@gmail.com>
>
> -Wshadow is enabled by W=2 builds and __scoped_user_access() quite
> deliberately creates a 'const' shadow of the 'user' address that
> references a 'guard page' when the application passes a kernel pointer.

This is too ugly to live.

There is no way that we should make an already unreadable macro even
worse just because somebody - incorrectly - thinks that W=2 matters.

No - what matters a whole lot more is keeping the kernel sources
readable (well, at least as readable as is possible).

Because W=2 is one of those "you get what you deserve" things.

             Linus

