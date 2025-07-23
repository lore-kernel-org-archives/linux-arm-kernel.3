Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF872C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 06:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTJIJErGkkgE26dleTTxRjWov2b7YHYQZlVlu/+KP64=; b=Wd0NohvO1AatjMnJN3JlH8Rvmw
	Q0KAyC7HEATNko+sBE3xZMcSWX45AMqp/f3sglCivoRM778ULup3fiSWuw2gT9fIAXvDMTrhu+DmY
	ZBdL065rqsfpeJDHdXySOuVYu7zklnwBAo+O/soQv5Te6WDPw3Z24SJG8SrSIjHUcH60S/QOViDgK
	MLNsIbj9cETsi0BnNzavBViWQf6H3rt6MqaPxWCr724JlfIQZF0zVhZLukjiSw1YvIRwX7L6sKejL
	k86rreG/vSMqeB3hluCEW+ru6j9Sd1tETnQc9dh7r8aEQxkSbuSCA7+bK8v6BRsd0wcxtFK5mnpjI
	kyiC//OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueSt8-000000047z3-2Yb0;
	Wed, 23 Jul 2025 06:23:38 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueSqc-000000047h1-0Pg8;
	Wed, 23 Jul 2025 06:21:05 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b3bad2f99f5so526361a12.1;
        Tue, 22 Jul 2025 23:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753251661; x=1753856461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTJIJErGkkgE26dleTTxRjWov2b7YHYQZlVlu/+KP64=;
        b=KRhymsbm4XjC22BenB7Zea7iDxjJN01/o2JsDtz1H72ibNyUQF/iNLU+SDFo97GR1e
         sM9dv2pYmHVah7f96HT2w/AWYGBlgWajWPqiID+gfAQr34dF/pS/Wv6VxaZ5yIvbd+6i
         0EZw+D+Qi572TGdXJJh6Aj2NCr3TnqQp7WWRTKCZzANAkgPwMA/kSMm86rZNoP9pRPzE
         8OCta4dqyjZsBHbJdfX8FCP4hf0dXEzWuJUoeEOLlMrdrGxClBEoUHsrx+ty/Bru8/I4
         lRsepJ45cJim2g3QEEWmPrS1bnKAPcBRAww82u/7rvQRgD+Om8090ZaYoeLBsbP8NXt9
         RhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753251661; x=1753856461;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uTJIJErGkkgE26dleTTxRjWov2b7YHYQZlVlu/+KP64=;
        b=gm+9c0YqFhZglG8rZJ3KXtZnLbrMTpE0xOkz7Ufr5L/z86uWwl6HavUKUCWPGkZ8WT
         dq7q5EcmLx0T7+brIchxkczAWVwEAtJOwJKl3gAaJmpjfcvWVe8tZasYVjZGoIrLkIGs
         vu0yLEt42W2UJBl36XfKLMzLlRv9KCNbhn3k5XbeRkj2MKGdjWVJrnZlPTLDIxOv/GqC
         jr5cD1rw8gG8SEczAMDecRWsTWO+UVEgp78TAIVwSGXEVLnmwPKUhaiLFS6b4EX0za5X
         Btcp0A8L4l20IGXyQd2Hrunp8QEl13k3ZW6RKenh6D3Mz9eaSFS3wUKfYTY1VlQJO7dL
         VJpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/rmoPCYMr2InZOEbxlN11B12OnZ1T3S6ItxHGkUBgyAgXzjGMSdL17qLY1PqJjkNSwYBu/2j4v1TX284=@lists.infradead.org, AJvYcCVZ19pejEAp9fUL88CMaAYyZC2ekmVnw3U6ku4VwpcOKpYz3ImFKp86NRp9JnLeMPp6iuoCnwt2W6gBMEq9hk0p@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb/gRDTkbfIOZ22IHolJHqV/fD1U04Zg/eagz1E14HSj8sGnvt
	glHmq0WR7SZzkH7HVIMMsPJJTMLObG+k+0SqR5HV+OFiP3ogpGU+lHwA
X-Gm-Gg: ASbGncux+oMsytUjqgHJXs3ePQo1IJl2DtqXVpeqTQU8Y9WCZhLJuyqcv7MA2MoUNnW
	z2slyqlFg0pi6t3qcZmPlUXW55VPUDr3mStdzTsFaJbea4MzaL3GOF+h/uYF1jyJ+f29MQcL8gI
	qp7WkHPzoMBkWpI6YlySvYyn6gd6aYSWu06OzlsY600LrGcuj8it3GNN2QbLGwJWns2RPwVKLcZ
	vZ7Ip2HMwDOUOjGE3KxSeL4Buz29u8LFIfjnRszGPMaAEgOAMmjWPEvVMhJbinGGiv3W5DEi2T7
	qZiSKeJ1C2jnymGGR0LQ7nsMJqi3RDXORogvj+miITsKk8wC48w6X32e0B+BoiA2eQWXv6+d2O9
	+E7oc6iagpmnNFAXXxKHojNOWJk8oxa1N6/MZ5WqltvKLt6GoZY5qGJK5Zf+rVel+HrASFq68fy
	V/O66WT5vxldw=
X-Google-Smtp-Source: AGHT+IGCxo7rpM1rfk9awKmH6T4kvUglH+Vv6jkf+KqhCJfICKASDS6UxOL8YDc9W4DbQD/ruOaxfA==
X-Received: by 2002:a05:6a21:1fc3:b0:225:ba92:447d with SMTP id adf61e73a8af0-23d48dbeaf4mr3003123637.9.1753251660919;
        Tue, 22 Jul 2025 23:21:00 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb67901csm8977248b3a.100.2025.07.22.23.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 23:21:00 -0700 (PDT)
Date: Wed, 23 Jul 2025 15:20:42 +0900 (JST)
Message-Id: <20250723.152042.1300024463910400.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
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
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH v6 0/4] rust: Add bug/warn abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72=Hr5rg7tYta8aUoxt8hOPjR2ik5_-xMWZwacr63=-7KA@mail.gmail.com>
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
	<CANiq72=Hr5rg7tYta8aUoxt8hOPjR2ik5_-xMWZwacr63=-7KA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_232102_147071_1D8B18E1 
X-CRM114-Status: GOOD (  27.99  )
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

On Wed, 23 Jul 2025 02:48:20 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

>> This patchset adds warn_on macro with the bug/warn abstraction that
>> utilizes the kernel's BUG/WARN feature via assembly.
> 
> Ok, let's move forward with this.
> 
> I took a look at the first three patches and compared the expanded
> output for the existing macros, to make sure we (hopefully) don't
> break anything else.

Thanks a lot!

> It seems OK, I only noticed a removed newline. Was that intentional?

The patch for arm64? I tried to minimize changes to the original code
so not intentional.

> There was also a bad parameter name, but that was not hurting anything
> since it was unused.
> 
> (For the x86 one could be closer removing a couple spaces, but it
> should not matter and other x86 files format it that way, so I didn't
> change it. I also noticed unexpected spaces used for aligning the
> macro, but it turned out it was in the original already, so I left it
> also unchanged.)

Yeah, I followed the original code style.

> Then I found a few more bits on the last patch.
> 
> Tomo, could you please double-check you are OK with all the changes,
> and please run the tests you did back then on `rust-next` again for
> all arches, given it has been a while since you posted it (plus I did
> a few changes on top, after all)? I would appreciate it, thanks in
> advance!

I've just tested rust-next. Looks like all arches (x86, riscv, and
arm64) works as expected.

> To be clear, I didn't re-check every single thing/combination, but
> hopefully what I caught helps. Since there are no users anyway (of the
> last patch) right now, it should be fairly safe.
> 
> Applied to `rust-next` -- thanks everyone!
> 
>     [ Fixed typo in macro parameter name. - Miguel ]
> 
>     [ Remove ending newline in `ARCH_WARN_ASM` content to be closer to the
>       original. - Miguel ]
> 
>     [ Avoid evaluating the condition twice (a good idea in general,
>       but it also matches the C side). Simplify with `as_char_ptr()`
>       to avoid a cast. Cast to `ffi` integer types for
>       `warn_slowpath_fmt`. Avoid cast for `null()`. - Miguel ]
> 

All the changes look good.

Thanks!

