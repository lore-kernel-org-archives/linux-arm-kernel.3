Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27A4CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k31zVVbNicpwi9YDlhFvR6Wyco71XCVxmV3/xYq3pxI=; b=XU/HPd78oUEIINBOq6CwmyeG4O
	P9sSviuZcFgbRr6fcjXkFZ7V6xFkye6r3EeYZv46F/OgUY7zzwllLv6y/yyAikXeRRCeWh09IXHMe
	thRZLMp2CmQJVP/A8H2PfxL6raGBXYOnG7Tn1kc8Tl+D3OERAVb9I8W7IVyrlhx1fWrdGfdbM8giK
	uJRTX2C8rjaoR7a8i+c4vnj/UL2U4aTZG+a3P1l9qfNHkRSwTSXWgmaes1AMpf6GrhbhbE+ZFIxYX
	2ZM5f1J5FyrxH4TnzFFbiKx8DM90pL+PQc3NQWesMRVQN+DnMrHPyM9PNQhHE/ackUJ8qFshwwwVN
	fhz+x5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbsT-00000004DmA-2Mi4;
	Tue, 29 Sep 2026 17:44:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbsS-00000004Dlg-3FKI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 17:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k31zVVbNicpwi9YDlhFvR6Wyco71XCVxmV3/xYq3pxI=; b=LZWxB/uns4TnAs0LD7+Xpmf7iq
	GGWikZSlz52AHROpcubNPOF4IGDzHFPEdA2NKhghI5mR7oc3iz5qD/JyO84N5Hd6BuCziY8rViPLe
	JxTBbOE5y1lYld5cdJOW/gXD2o5DVRx58BawjRy0vedDqjjGHD6oX1HkNIVzLPBR9JO8xTLd1m60w
	CUWX+ShO6cfOW/WlNdylrCQUYFsyhLhJ9D4Ubwc3VqpudrUQAG9k8EJZshbhejTzPwnV18zk759N7
	hynMCKb8RotvDF5lASx6MuAtH1jhVK39f6FNBqUhBzi5H/LT9F6WZKsLztw3+F3KwbZNkIMjf5aHm
	zG8zOhvw==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBbsP-00000002uvk-1VKC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:44:27 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912df756so35116835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790703864; x=1791308664; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k31zVVbNicpwi9YDlhFvR6Wyco71XCVxmV3/xYq3pxI=;
        b=oLXJSKDC4O6iHyT8nZl71L+iyIbQkaGxOdIFZe+mto/VuLLK64j5xF1uOfivQ0hSzH
         t0UNfktoSpVq8pKmzixgeUuNBebDSwTHrgeCJfnZ1Vv9c5In+MnQXbQ2AGicE3CbBz1U
         k+Q47zUbXnlytQSo2OJRZ0r+Ef6Au3dV+fWuTOmnMyiujvcJbvSY2vSDodWBah3uZCSe
         2gEVa31nXfe9R5kU0JEENzR/gaFB3amLik0OHRGl+5YIAF1SkHzGGAtaw4Wt5CVcCapf
         6RWg7KQU22GPBgs8WQBw0tEZPZ7byS+cXkd6xaryLaJCkjAJqa8qui+7I51OzZ0jWIRD
         VzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703864; x=1791308664;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k31zVVbNicpwi9YDlhFvR6Wyco71XCVxmV3/xYq3pxI=;
        b=0J82m7vP+/NS41mkdANZGuqQxWGF4cIcaPBeCwR9xx4ufFXM73cnwrTq29tQPfCt8T
         SdJzCmxbfjx0tDG5iFQLIV8XZM+OmpqZAHUgpzo4E2nh9RMl9XOTNpZD/vixLOhIRPRv
         /XuzLK+kZ1l5VNgWyeN+EcOwqso6eOGJfiq9j8lgcobpM9hrlQnQNhn5myP2XVZxWW0n
         dMDzjnfLv8wC91v2DfwgxuSDc+F24NH60IK0qddI5bJ+rV5tAphKKj/Ed4LWvo7wPhGt
         0XTfmJtR5qh6kLK0ivIhJM4mQGJoBI1Dok1p9XjP/MB9h+p9qR3XjqhUK+7X1iOufB0/
         fHcQ==
X-Forwarded-Encrypted: i=1; AKwUvByrCLlQaWOfWESnU/SRiFWtzAbkemqPXJuTeTh9X2ojVVVxrZwABOYV+ArnO3XU77pN66e/CKm76NgklY8UkTi2@lists.infradead.org
X-Gm-Message-State: AFuF++kFmk/nQvYj/1P36fF/WCh+p3ANtO6VQvo9Jm/mEpDH3xf696Vz
	XT3wktVn1E/cDvlrrMch0zPq7kPH4HizfnGuqAumlm341azvlp47Lkkf
X-Gm-Gg: AYBFou3BZCqW2XSXOfRWLODqZloKFNMaEyuyJsuHudz+xLBDARqn89OTNxuK774tQPh
	h0izrHdxpffnV6o/9VbUWKuek7nxWq29H/w+TAGNsXoC5EIx8YzUOkFh3I8dxmO1i9q+wKdgOc1
	zax/iGTlunPjAoatk9X0ESdaBJb82s6USYmV17UZJ22iDerBNBzgX7oOCdMHUJxOHHEtZNX+hqC
	+zUpH5jEhfdYeh7blnI1IGqHov+t8Pgsctpt6iW6AZLjkQakE5jcHJC2TpRXeAZFfoWZem8/sra
	8iRLQg8ZzZUj7/MSAL6ecFBPRgyiagSf+AzCrsh+UEMM1TgM4MNQ7JnpG8TePQAim2u/PPeYDW7
	BmWVdRkd519XFmzD2XJDa32CqfD060dZ85Dmg9tCoodRwwnpEnQq00ySptZpma2CLAmZRbI1/XB
	R0mEGXmjWPMdRWzFm8PS2xkLwagpTddWEDe/ZkB13uoeUXr/Mvovn/yHggFfeV1uB/l3wLRrtNG
	+OtPZYd/WpliW4wW1LSoDpa34/he0vAuno=
X-Received: by 2002:a05:600c:4e12:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fe66b6e0emr305056015e9.14.1790703863276;
        Tue, 29 Sep 2026 10:44:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfae123sm103285395e9.13.2026.09.29.10.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:44:22 -0700 (PDT)
Date: Tue, 29 Sep 2026 18:44:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Andreas Schwab
 <schwab@linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260929184415.1920fe91@pumpkin>
In-Reply-To: <20260929165939.GA1890629@ax162>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
	<87zex4ic68.fsf@linux-m68k.org>
	<20260926121927.GA1486962@ax162>
	<are7cfMIHZZn6jLz@zx2c4.com>
	<20260927080225.37534e7c@pumpkin>
	<20260929165939.GA1890629@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_184425_614160_E90251A2 
X-CRM114-Status: GOOD (  25.32  )
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

On Tue, 29 Sep 2026 18:59:39 +0200
Nathan Chancellor <nathan@kernel.org> wrote:

> On Sun, Sep 27, 2026 at 08:02:25AM +0100, David Laight wrote:
> > On Sat, 26 Sep 2026 14:32:49 +0200
> > "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:  
> > > Do we even need to return a value at all? Might as well just make the
> > > function two lines:
> > > 
> > > +       for (char *d = dst; size--;)
> > > +               *d++ = value;  
> > 
> > Wouldn't it be better to add a barrier() or similar in there to
> > stop the compiler playing unwanted games>  
> 
> Wouldn't that just result in the same code generation issue that Jason
> pointed out on my v1?
> 
>   https://lore.kernel.org/aquyVkdYceiWdckX@zx2c4.com/

I missed that one going past....
You only get 'rep stosq' because the compiler first converts it to memset(). 

> Maybe that doesn't matter because modern compilers have better options?

A lot of cpu will run the 'rep stosq' very slowly (it has a big fixed cost).

At a guess the loop is 3 clocks (possibly 2; but that usually needs
you to use negative offsets from the end - and gcc doesn't like that).
That is comparable to a mispredicted branch (and you might get two of them).
It still might actually be faster than the 'rep stosq' version!

I suspect the fastest code is to unroll the loop.
	xor %eax, %eax
	movl %eax, 12(%rbx)
	movq %rax, 16(%rbx)
	movq %rax, 24(%rbx)
	movq %rax, 32(%rbx)
	movq %rax, 40(%rbx)
	movq %rax, 48(%rbx)
	movq %rax, 56(%rbx)
8 clocks on old cpu, 4 on newer ones.
But more likely to be limited be I-cache reads.

If you are going to use 'rep stos' then you might as well write
13 32bit words.

David


