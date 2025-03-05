Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB355C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlN/L4AefYvDeS0mxE9WdsKwZ74h8HubhxsXCuRQhvs=; b=LcKNAhJ7RlTBt9K2c5OpODu2Hl
	toavRIrUePMbUaPEx711QcqCfp2jd/B7qwSz55s9n/mAFNbIF1Ee7xA7KIXP4/qyp3G326MKuScId
	Io15XKYEffFArX5uG9P8aL+lnF9Yq3uH5D47RyCzWl9mgfaWAMOYxD4VvwLN7adSrxn0ggxYKl3yI
	sS4rVMExkOxnzJDgWd8kSI6amKondHmBJ9ctEuoiqJ4J+DtQwnwSdqzLx/4P0s+6cI5u8YPr0Xk2I
	mm8fmVwZglAAQfAHm5L+zeUTdlJ+R2IN+yYwibfYN9W0tyUSoXZYrh7i8Rf7mkn9A+TBbITKP6R56
	RgthxRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnTP-00000007wWn-2dgk;
	Wed, 05 Mar 2025 12:03:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplvA-00000007fai-1KaY;
	Wed, 05 Mar 2025 10:24:13 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223959039f4so76284275ad.3;
        Wed, 05 Mar 2025 02:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170251; x=1741775051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlN/L4AefYvDeS0mxE9WdsKwZ74h8HubhxsXCuRQhvs=;
        b=QizX7OvXrlQvqotaK9jUe4pbMEyY1+r0Xm8ZhWJFrhHnHC5ge+qAUHmjinRywRmdFd
         D87cCj39oJGCWGzM3yY5lCcveO7RWBao0vqvptB4YxBiiz86sxolFUVrMXKqgWe9vrnl
         RmRI2y1ALj19TaT+bYwrEGc1bxNR0V8NZj4gfN78I9qGD5CDo5lGFU5WaV4FXFNqO2+7
         TqtRyPR0AXuD0sedVcqq9CtmJHlwctj8Vy7DtYuz44CEn+bQ1BtdHQw7oP0CDzXf5yOw
         TVI/AGsKYgQTlsjDlQx6vy5kMWUM2jYlM2ILPTB0covzM86y7JP1zIeVgnb6AEdZLUh1
         j59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170251; x=1741775051;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vlN/L4AefYvDeS0mxE9WdsKwZ74h8HubhxsXCuRQhvs=;
        b=HGI2aqWxaEQ/+7xHRz3qP546xJr+bus0IDrCqRU0LZhQEbDZa0ywEYd6IbV0wy3rFP
         JS2S8KBy9eyYAPEeX5JDE7K69J34Cimm3Ob+2w9/7X92SRvUbyWdbzuiGjibMDGA5Z1X
         sIoR7MORSZxknuYuxXuvQBmGxlnK4ZXYuQH5jyhGyzeWvoBvDEXSROG8UJcL4TQJfKw6
         z/UdFmBF31ARaJyimEvIHLPuar2FAuq6x7urTxSs2DeYDSKHCH2oWu8AUg0G8ZYD/U9l
         AQgYsGxTZE2ioqpKKlP8W86k1KAGuWTF4AID0RH413RgxN7lCt3Me9zHsEiuxeGuyB43
         zrjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxFSd01nDvePmA5T9HjDGJo88tOIVtejO7qJITU6CHM98JaLHOnKz2Uoco98sTqIXPAii/vqBe3PcKKqn0jlee@lists.infradead.org, AJvYcCXl6+ksiv4oIwwwIfWpqp7eUZBEnRWA94MLiIDrw0K2/MkJYZcisYZ/jSgjEa4oOLw8D3qk2vmg8X26MLw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmByV0NagS+N5YIgh2QNBrs+nsAhqfCoJYWLzDVSFP1T8LNJXz
	MudZdjaJ2pUFF+7cjXGNAOd8Y1Afc7eexUiJMkJIzLNu0o7RUC69
X-Gm-Gg: ASbGnctGrCx1Ip200YgUTCxWsPMerKslehNH9SH9AvD7NVupZ0YqmZYIA/VMRr/tQpB
	yzaPPAuPR8uQVKFudm7DqG8lxqIlpvp301rT2rW09QqLMMM+ID+TLiKQ4txQsX2ZPPJ4JDJkG5k
	e9fQ3HOK8c3E6Tw3tKbhpeczfB/abdfbrHidWDX/XJQySNoU3kYQHtkFWBH/h0ub0FVcTt/wyTD
	gfDK2L6qhuXQt7kWqe2ozjBF9jMibWO/ycE3V/UWgw/h6jOXeOTZ/g1Tp4xwhnjJG3LiXtDMBx/
	bF2d30HSctyx026KA4v4e4P+gh8MVgvgxPWqJYwxOz8wIxp/aqinLLDM+fBA6ppQngKKlr9F/Y6
	wVFZbm1xdnmcUbGJMzvUr8qjJvI4=
X-Google-Smtp-Source: AGHT+IGsFQfHQjvkNE241Y4wnmDmNDBQSHQivxyIM52U3bSLm+KCunMmDVV2E0sVtyiSSMpJSKWLRA==
X-Received: by 2002:a17:902:d2c1:b0:220:fb23:48df with SMTP id d9443c01a7336-223f1cf320amr40589935ad.36.1741170250886;
        Wed, 05 Mar 2025 02:24:10 -0800 (PST)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d4e9fsm110731105ad.28.2025.03.05.02.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:24:10 -0800 (PST)
Date: Wed, 05 Mar 2025 19:24:03 +0900 (JST)
Message-Id: <20250305.192403.996225631653343672.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tangyouling@loongson.cn,
 hejinyang@loongson.cn, yangtiezhu@loongson.cn, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v3 5/5] rust: Add warn_on and warn_on_once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Z8gOkeJ8o2pMCwGu@google.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
	<20250213135759.190006-6-fujita.tomonori@gmail.com>
	<Z8gOkeJ8o2pMCwGu@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_022412_366500_75CFD66A 
X-CRM114-Status: GOOD (  21.94  )
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

On Wed, 5 Mar 2025 08:42:57 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Thu, Feb 13, 2025 at 10:57:59PM +0900, FUJITA Tomonori wrote:
>> Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
>> macros doesn't work so this uses the assembly code exported by the C
>> side via ARCH_WARN_ASM macro. Like the static branch code, this
>> generates the assembly code for rust at compile time by using the C
>> preprocessor.
>> 
>> file()! macro doesn't work for the Rust inline assembly in the same
>> way as __FILE__ for the C inline assembly. So the code to handle a
>> file name is different from the C assembly code (similar to the
>> arm64/loongarch assembly).
> 
> Nit: Should be file!() not file()!.

Ops, thanks.

Actually, the above comment is obsolete. With your solution in the
previous mail, I can remove the asm code for the file name. I'll
remove the comment.


>> diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
>> index 6ba39a178f30..f1d7f4225332 100644
>> --- a/rust/kernel/.gitignore
>> +++ b/rust/kernel/.gitignore
>> @@ -1,3 +1,5 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  
>>  /generated_arch_static_branch_asm.rs
>> +/generated_arch_warn_asm.rs
>> +/generated_arch_reachable_asm.rs
>> \ No newline at end of file
> 
> There should be a newline.

Ah, I'll fix.

>> +++ b/rust/kernel/bug.rs
>> @@ -0,0 +1,100 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +// Copyright (C) 2024 FUJITA Tomonori
> 
> 2025?

I'll add.

>> +#[macro_export]
>> +#[doc(hidden)]
>> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
>> +macro_rules! warn_flags {
>> +    ($flags:expr) => {
>> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
>> +        // SAFETY: Just an FFI call.
>> +        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
>> +        unsafe {
>> +            $crate::asm!(concat!(
>> +                "/* {size} */",
>> +                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
>> +                "111:\t .string ", "\"", file!(), "\"\n",
>> +                ".popsection\n",
>> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
>> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
>> +            line = const line!(),
>> +            flags = const FLAGS,
>> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
>> +            );
>> +        }
>> +        // SAFETY: Just an FFI call.
>> +        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
>> +        unsafe {
>> +            $crate::asm!(
>> +            concat!(
>> +                "/* {size} */",
>> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
>> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
>> +            flags = const FLAGS,
>> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
>> +            );
>> +        }
> 
> I generally prefer to have the cfgs on the macro rather in its
> expansion. That avoids emitting a lot of code that is not actually used.

You prefer the following?

#[cfg(all(CONFIG_BUG, CONFIG_DEBUG_BUGVERBOSE, not(CONFIG_UML)))]
macro_rules! warn_flags {
...
}

#[cfg(all(CONFIG_BUG, not(CONFIG_DEBUG_BUGVERBOSE), not(CONFIG_UML)))]
macro_rules! warn_flags {
...
}

>> +#[doc(hidden)]
>> +#[macro_export]
>> +macro_rules! bugflag_taint {
>> +    ($taint:expr) => {
>> +        $taint << 8
>> +    };
>> +}
> 
> This could just be a const fn.

Yeah, would a const fn be preferable?

>> +/// Report a warning only once.
>> +#[macro_export]
>> +macro_rules! warn_on_once {
>> +    ($cond:expr) => {
>> +        if $cond {
>> +            $crate::warn_flags!(
>> +                $crate::bindings::BUGFLAG_ONCE
>> +                    | $crate::bugflag_taint!($crate::bindings::TAINT_WARN)
> 
> Or maybe a constant?
> 
> const WARN_ON_ONCE_FLAGS: u32 = bindings::BUGFLAG_ONCE | (bindings::TAINT_WARN << 8);

Ok, but you prefer "<< 8" than using const fn bugflag_taint()?

> $crate::warn_flags!($crate::bug::WARN_ON_ONCE_FLAGS);

