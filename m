Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8466E606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wurxz56/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VBAD7cdN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=; b=wurxz56/KqRUOMhZF0aIm4dKl+
	Ny4XzoNQDnug68J/WMaBkce9OzQh2oJAZEK0d5WdNQwTNeIQosgf+X8b0v3LbSo2FSTyP9sDeevHa
	+jZOHxdz3OKkaS1B5AZ84xtRzdGWF7CT1QLundRkWGSJ6yt2i/fM29CF0mvpSxIEa2oaR2lici3xH
	o5VMZw4uSmAOHVQFqlrXRNVgC2HcZKYHNNMTC4XfPUTJ1AEMzu/C3pXJ3E9/nhaq4sCSGJmZKARhl
	74XQilegGGSUNMcO0BiWKKS+BjqTwaLt9s1PkBet6PjmulxQn+M1+AIWNpOCVOXcG4KYrs1RW+zo/
	CbB4YalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDHn-0000000AJO9-1JAi;
	Tue, 20 Oct 2026 17:06:03 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDHk-0000000AJM7-1bQC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 17:06:02 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8a376759900so7167857b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 10:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792515959; cv=none;
        d=google.com; s=arc-20260327;
        b=bcg4XIRYtZMC5OSt/AUZo/ukDfnXtVsJT+cENcF7uidOdB534jFRIslD9zb92PDwvB
         VYD3VHUqhL41xbJvnfbwNpPaIvAhFTzfFLIFWFiGxrK/K/M9vB+61j+0Wum/yYyqOIvt
         37a4BTcFSerm9MYUCjZi2ONMH4zZPfwom9bFHtKiXO9nuM8TiyW5TzDbtjwSXar2/IM7
         DnCDOp6tEtQffNzwDEirQF5PeqahxE5t6V1GvMJskjtENlvWTeSGGsi+mBnTcwZnkxtB
         8dewnUobbYqwtt6pM1/wsZkDisF9fzXAzv1Ew6mEdt8fjw50t4M2OmtOJ1YO3OPbonoO
         8syg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
        fh=5FA6pyAtm8dHovOMTaw78bh3GQDB1rnvyCcvO/RRZPY=;
        b=a12ywUoF3l9+ozIO00ro8lvXn+wB8QXBi8LGjEAZMI0B5XT2y2qVlKknrdFGNZqLrI
         TGEp60i9xuS0C2F1WVN5s4cOGJHIo27HWtDsTHyF9rnl6Egno0Zhrg9vooA97EHdjtep
         Pe3Oy7UjkFfRb1BHroK9ST4enFjl5Ghh6w2UZlM8sWUcSwpLJsZUItqsFCBsYnnOC3PL
         iE77PgSUaQCakhIGC6bBcVdya4NaM4qjoNSRBuP31SV15vCJsp1oO2xC0XoczvurBhGg
         O4BkhhpF8eP8BTKlKzuB52CnSu4vb0kP9DQMO3+acJD+iv2jvtkZThoZJmmdTiZShBKy
         QjJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515959; x=1793120759; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
        b=VBAD7cdNrQdiJk1HJF3fZpnUeOQ3SKU4eOQWHlpi90Nhyq7XOOOhgt/7pSI0YZOpyO
         z19ZxvxoVFr1d1t90pIXAlVpiwIYjTE7r6DRJOw1vkdNlihjrnW2oHdP2q2pE7SHl6fV
         MBbf/rfHO+xu1XoB6iLajEduBzKCAS+P5mNA+02ArpTB7vpU62wjzLGzdo+Mn8UaAqrg
         pT1I4jfwe8BlPao7OPl7M4a+Zu396Av2ff0cME6ZxwuWsNEKAfHKnDQXgF1YdAwN0JjD
         NaKjm1GOQshTqFoZxIXeiLf+ZkTnfY7tTn5+2BpoXBdEZqSNt9btwtPgoxEGTZnMn+w8
         MMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515959; x=1793120759;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
        b=cuT8PKR5xAzJaAfC8+OtJ5vu6kbRmrVVVyTD6rg4Fj/d28GcblGCyOMlisox7z1C5+
         mFnUTeSpVlifZMTBfnGz9NSD4CX5dAbddZKO+JUqjRhV8i5UpOYqkIKCnKOjcKoAw685
         93OoCpnkCp1VFrw/B1Swe9BMlGuAWVQQy/K9FEGOhrWw47VXQh1lHiCM/hY2IM+NFArF
         Xgd2TQImi4fPODJSwBEezif7G44k4PYQFBxdTsPI/Hj3lzEzE1ABvltt3xPsem0H+slA
         XWBIbsdPw/m7GUjACxcniLdeEh3US5bvTIp23GjeEtVvWaj2j9dbw48IqHqk0hjaOXPS
         40dg==
X-Gm-Message-State: AFq9FYJRvhKm4r6Wk1UBJd/mXXXVy3sRE57IFF1dcQ9uT5g4cIX4+PW7
	/S0/azr+M5L1DQ8G/bvt3lN+GX6oJk21IASxdvZSGy3aih9NTNoxVm7WiDd1lBdPaUxHY1jNCgW
	+uSUDUes6eWfDx5z/pnvrcJIJVbX4kcI=
X-Gm-Gg: AYBFou2ggHwKCYvIZDeThIptjkVSaSxAPi94L7zCYfnf3VJ0m6My1OeQiHAjWVo2DJ0
	uq4lQxsxY5qNEJRy8vY+R0vjV15F6G5L66+sZrNXCty79Gzpgi3tRij3qCph1AlbLCZkP6viIDo
	6dIKABnAyjHZCfpKTXM4AnrBViMDqHRbphYssd+x34sF3jVSxzpZmpzFcTUHvar6vrujR3fY4IK
	fibeh61MRl0THciHmnHh0y0jhAkeeKei4AYcybbA5NBX91tDFpbTktg3fTLBVpK/Q6dEYb2gDFC
	81ZANWoxHQCPrB8tYk3jgb07bhmt4dIvb4I0d2YDnWDZligxV8A7Hg==
X-Received: by 2002:a05:690c:6087:b0:8b0:da84:d1c1 with SMTP id
 00721157ae682-8b0f1f1a89fmr64960787b3.0.1792515958898; Tue, 20 Oct 2026
 10:05:58 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 13:05:58 -0400
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 13:05:57 -0400
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261019-bug-word-at-a-time-zeropad-kasan-v1-2-f21a3ed6a477@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-2-f21a3ed6a477@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 13:05:57 -0400
X-Gm-Features: AclHuK_DtrU2XCq8YwSMY07NqOt7wGt-hW6PGZPkgwrcRUr2dimhQIUPQ6PwL98
Message-ID: <CAPAsAGz89aKUHzm6U9PQZfkGq-GnWsm8AYHeo5+4u34LHk4uZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kasan/test: cover load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_100600_431619_816A9FB3 
X-CRM114-Status: GOOD (  10.60  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qiliang Yuan <odys.yuan@gmail.com> writes:

> On architectures with CONFIG_DCACHE_WORD_ACCESS, load_unaligned_zeropad()
> does the word loads of the dcache name compare and of path name
> hashing.
>
> None of the KASAN test cases reads memory through it, so nothing
> noticed that KASAN did not check these loads at all.
>
> Add a case that reads a freed object through load_unaligned_zeropad()
> and expects a report. Skip it with hardware tag-based KASAN, since
> arm64 turns tag checking off for this load:
>
>   kasan_load_unaligned_zeropad, x86_64, generic KASAN
>   without "word-at-a-time: check the first byte in
>   load_unaligned_zeropad()"                                 FAILED
>   with it                                                   PASSED
>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

