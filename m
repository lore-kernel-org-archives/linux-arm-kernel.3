Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD8BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8JIB6d7R5kKl6+damfWRxYdrapnjk0INN1HmKYI0wY=; b=rEVQY2dc0gg+L+xVNlMa+ltgC0
	t83I6YqtlLZ2EROstLLqZ8CFNj0Z1e/7ZDuTBwf6hjkZH0muhxlTTW413YYcpmeaDSphypnZw1OC/
	ucuRAjd+wqJeisteyBw8ZY7ti5HYnVNYqnmd6ef82iG2KVBkIviWFXGhkKgKwtqP1eTRGSqKNPwXh
	lAsJWwgga3pGsGuOURAvDK6ryzrcwkU2f8GRVTf3qkdeV1s6HvwHV4UYuip5XTiRyRTsDYrpH62Et
	mHbcG1iv8aLhYJA8/tSe0md9UsLxR5GNnqfBXJjxSAMqy36zjgJ9yyGOtdZa3zbPq7Fu9Z0rjvVeE
	YMZRcuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3Pp-00000006fng-3DCF;
	Thu, 06 Feb 2025 15:03:41 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3OR-00000006fZ0-0KBC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:02:16 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-21f4666364bso3938065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 07:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738854134; x=1739458934; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r8JIB6d7R5kKl6+damfWRxYdrapnjk0INN1HmKYI0wY=;
        b=poIQTJV1hwm73TT9o2TtBKzbh9zgvpt13fFSimPL1ROCZRr46/AJGqRDHdon97xAH/
         zEt9hY2VfZQSJ628qz5uPKu9LetM4NOqEJtDorKzzQ3X3jeQf3zBaf4VoHP8wdWSlDIL
         dlrDDrRfNggmNc/kwZ6Q7lsFgbAfIX1a/vYrteJ5obI9AM+PO4HEI31IZd5kJjuLAP3l
         GZJYYc5G8Lr99C6MiV9IP99e4bo8EJKNsUDuN3VVTp/X7RAAOc+QA8by12eRsv7boIMH
         Pc8BHpAnILJ27DZGw8cf/NsRzqfhtYWHWD9259CIPR7XKuplNccgmU0q8uWzt9q8b870
         /PYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854134; x=1739458934;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r8JIB6d7R5kKl6+damfWRxYdrapnjk0INN1HmKYI0wY=;
        b=L0ivaEiG7MJrmNCXOK2V8yQw7lu98sL6Put7UflwPCw7mUYjoeyJqLnypfxezIS+R4
         Si9pT1P3XqwiHwxlwdqT1OEPx1fTpf8HvE6eJHGeQHOMHi/Eaf0i2Hc/uQ0pZ7pYCb6o
         dxnlaeLimtqlEwAMCw2goFcYyEhzfjh9asf0AxWWLyCwqIjVl3exm3sDugKh+6ZabVwr
         02Oe6Pkl/gXaLCWBGY/WR0NYZcruj/SPz9Ve1d6LZmHd3ahVrheXPaE6k0l5lgy9CaZ8
         CmdFps7lrBaD0EPDgrz6vuYLT0rEB8uWfLSi5Kx+RVtGLAEGfmUSXyxtLAp8i+61F/Yy
         LSUw==
X-Forwarded-Encrypted: i=1; AJvYcCWdWvvvurIKFN3Wnlsr6Ob93T9jg7QPfSbl+iui2zB7rolndhlM2ucQdphk270xNKRlE616+5PNKVwWDU8/UTcX@lists.infradead.org
X-Gm-Message-State: AOJu0YxXwujHQg2p0gM8HDDNp4QrgRbBbdn4iGdjTbZyJvWWphosZ09d
	rNtaYFysWrcc65I33ROsLmIpmHCF+D7WL9rQTBsqr2EZJ02WjkW0hbaFr+2HnxcNxcEseggzyg=
	=
X-Google-Smtp-Source: AGHT+IE/pkwOkH9gpTz/SBuNLKZB4tv6JFu6biVE5oxwhrNUKnmXYncr6SL+F14kZKDgOV7jBcW5hq8JMQ==
X-Received: from pgbfq3.prod.google.com ([2002:a05:6a02:2983:b0:ad5:bda:6aef])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d481:b0:21f:3abc:b9fc
 with SMTP id d9443c01a7336-21f3abcbac0mr21818855ad.6.1738854133684; Thu, 06
 Feb 2025 07:02:13 -0800 (PST)
Date: Thu,  6 Feb 2025 15:02:12 +0000
In-Reply-To: <mb61pwme55kuw.fsf@kernel.org>
Mime-Version: 1.0
References: <mb61pwme55kuw.fsf@kernel.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250206150212.2485132-1-wnliu@google.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
From: Weinan Liu <wnliu@google.com>
To: puranjay@kernel.org
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, 
	live-patching@vger.kernel.org, mark.rutland@arm.com, peterz@infradead.org, 
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org, 
	wnliu@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_070215_117497_F202250A 
X-CRM114-Status: GOOD (  23.27  )
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

> After some debugging this is what I found:
> 
> devtmpfsd() calls devtmpfs_work_loop() which is marked '__noreturn' and has an
> infinite loop. The compiler puts the `bl` to devtmpfs_work_loop() as the the
> last instruction in devtmpfsd() and therefore on entry to devtmpfs_work_loop(),
> LR points to an instruction beyond devtmpfsd() and this consfuses the unwinder.
> 
> ffff800080d9a070 <devtmpfsd>:
> ffff800080d9a070:       d503201f        nop
> ffff800080d9a074:       d503201f        nop
> ffff800080d9a078:       d503233f        paciasp
> ffff800080d9a07c:       a9be7bfd        stp     x29, x30, [sp, #-32]!
> ffff800080d9a080:       910003fd        mov     x29, sp
> ffff800080d9a084:       f9000bf3        str     x19, [sp, #16]
> ffff800080d9a088:       943378e8        bl      ffff800081a78428 <devtmpfs_setup>
> ffff800080d9a08c:       90006ca1        adrp    x1, ffff800081b2e000 <unique_processor_ids+0x3758>
> ffff800080d9a090:       2a0003f3        mov     w19, w0
> ffff800080d9a094:       912de021        add     x1, x1, #0xb78
> ffff800080d9a098:       91002020        add     x0, x1, #0x8
> ffff800080d9a09c:       97cd2a43        bl      ffff8000800e49a8 <complete>
> ffff800080d9a0a0:       340000d3        cbz     w19, ffff800080d9a0b8 <devtmpfsd+0x48>
> ffff800080d9a0a4:       2a1303e0        mov     w0, w19
> ffff800080d9a0a8:       f9400bf3        ldr     x19, [sp, #16]
> ffff800080d9a0ac:       a8c27bfd        ldp     x29, x30, [sp], #32
> ffff800080d9a0b0:       d50323bf        autiasp
> ffff800080d9a0b4:       d65f03c0        ret
> ffff800080d9a0b8:       97f06526        bl      ffff8000809b3550 <devtmpfs_work_loop>
> ffff800080d9a0bc:       00000000        udf     #0
> ffff800080d9a0c0:       d503201f        nop
> ffff800080d9a0c4:       d503201f        nop
> 
> find_fde() got pc=0xffff800080d9a0bc which is not in [sfde_func_start_address, sfde_func_size)
> 
> output for readelf --sframe for devtmpfsd()
> 
> func idx [51825]: pc = 0xffff800080d9a070, size = 76 bytes
>     STARTPC           CFA       FP        RA
>     ffff800080d9a070  sp+0      u         u
>     ffff800080d9a07c  sp+0      u         u[s]
>     ffff800080d9a080  sp+32     c-32      c-24[s]
>     ffff800080d9a0b0  sp+0      u         u[s]
>     ffff800080d9a0b4  sp+0      u         u
>     ffff800080d9a0b8  sp+32     c-32      c-24[s]
> 
> The unwinder and all the related infra is assuming that the return address
> will be part of a valid function which is not the case here.
> 
> I am not sure which component needs to be fixed here, but the following
> patch(which is a hack) fixes the issue by considering the return address as
> part of the function descriptor entry.
> 
> -- 8< --
> 
> diff --git a/kernel/sframe_lookup.c b/kernel/sframe_lookup.c
> index 846f1da95..28bec5064 100644
> --- a/kernel/sframe_lookup.c
> +++ b/kernel/sframe_lookup.c
> @@ -82,7 +82,7 @@ static struct sframe_fde *find_fde(const struct sframe_table *tbl, unsigned long
>         if (f >= tbl->sfhdr_p->num_fdes || f < 0)
>                 return NULL;
>         fdep = tbl->fde_p + f;
> -       if (ip < fdep->start_addr || ip >= fdep->start_addr + fdep->size)
> +       if (ip < fdep->start_addr || ip > fdep->start_addr + fdep->size)
>                 return NULL;
> 
>         return fdep;
> @@ -106,7 +106,7 @@ static int find_fre(const struct sframe_table *tbl, unsigned long pc,
>         else
>                 ip_off = (int32_t)(pc - (unsigned long)tbl->sfhdr_p) - fdep->start_addr;
> 
> -       if (ip_off < 0 || ip_off >= fdep->size)
> +       if (ip_off < 0 || ip_off > fdep->size)
>                 return -EINVAL;
> 
>         /*
> 
> -- >8 --
> 
> Thanks,
> Puranjay

Thank you for reporting this issue.
I just found out that Josh also intentionally uses '>' instead of '>=' for the same reason
https://lore.kernel.org/lkml/20250122225257.h64ftfnorofe7cb4@jpoimboe/T/#m6d70a20ed9f5b3bbe5b24b24b8c5dcc603a79101

QQ, do we need to care the stacktrace after '__noreturn' function?

