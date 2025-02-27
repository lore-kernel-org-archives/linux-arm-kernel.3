Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6A3C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 06:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgyTSFeHFjA7K6c7bMlzYp5hJ4ivyZJhPS3wek+zZXw=; b=xC9AWCZziLCcdJe383OXnv5pLO
	h8tCvhb9pNXoBUGDGcam1VGKJPZdhqehheBifY89Fvz9BPpWKqLBR5+Hlqk55pQwrtlxQtuTubvWL
	Ep/RcB3EqR5ZX45O73d8YhheP3R+91Gf/ecXt+X5dyItUX0U+sGLfhMGUpGujExyZe7C6p3uNo511
	e6+syX+TF95CRaB4TtzlvqoDDfswnJO35O3gFaFeG7pe0TxfmbIP0x+hjmbEObZU2Prmsksp0p7Pr
	xN8NvfwyVbW4idv7/JGozv7ycNRRCbB/oBi1HKf4O2e/OtEgfRuU3Xxowox6Zi0+YYEgVvFvsbkTT
	AG9KNzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnXoT-00000006VL8-1cyQ;
	Thu, 27 Feb 2025 06:56:05 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnXmu-00000006V0U-3YDN;
	Thu, 27 Feb 2025 06:54:30 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fea65dcc3cso738873a91.0;
        Wed, 26 Feb 2025 22:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740639267; x=1741244067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgyTSFeHFjA7K6c7bMlzYp5hJ4ivyZJhPS3wek+zZXw=;
        b=NXonbuMikzx3TPZM7YNtalzQDNb6WlIT7hWG2LARSiYEUjeZUQylgamvrgTWP04EC+
         fgAxHXRY7kN/9Xh2YDWgZgPvElsO6M6ambiwYCpRokxtyE/eHYcPGgsQi5yGdXhSXr7i
         lIEt6hUmtgmBSY2pnMWcBnQHQIYXipXPYha10s8XadSQhS15gGSj6YmDAaoomWZhOZ99
         uAycEnw60PgyBrpQW+CkWxtO6MRTC7hZIp/NTTYXX9+OYxDjwZZlZYJFzEdQmaZKekoc
         R0eoxewbt/oWgL50E0a+Jp0ApZYT61LDNQTtCU15cgtz3ZZiFx2F2MzcQ8BxYFCv64Db
         BE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740639267; x=1741244067;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JgyTSFeHFjA7K6c7bMlzYp5hJ4ivyZJhPS3wek+zZXw=;
        b=RNpAyFHPzHsuWuPe/DyXQDisFTt3VDuVHUJ1eZwBqWnUVQTyLEeMHr6UeWan/P33FA
         h1DPr/7pf4hO72/ki1nYQkTA9x5747UqtpAn0h++JXY69NwI3ULpvp0ifMUMFoq9Pfg9
         FRRl5J27kR76yo3yNNIueBiukwqHGTZbUIHFxRpBjzI+zqjXc34idEc6tdQvqRs+EjoB
         sRDv5QscC/VeeMl8bIO++85p+vukPP+UyrKpEeJ1YeMoD6VKPcWnbxoEArWxe82uDkxL
         j2dNmFiEQrzka1kPIYhrtPRLDx7VuUN+IeLpMy7EiiK34pVasAu5Klb/wsFrKuLbUd2F
         /zqg==
X-Forwarded-Encrypted: i=1; AJvYcCXadQUgxBdr0Ax2/W9vLg4kM0Hh8c+wEdwYxgeyVIf1S87lBrfAC9BeiuOVs8OaoXYAh/t+dGYEpo2QiLY=@lists.infradead.org, AJvYcCXzd+Hw8uqvdEeAqv4jl2SHrTqLlVhxwK3mGtXROg4kh5OVcM01pF9SW4BJUNZrXOsCN4VR4D3e98qo1gxHORQD@lists.infradead.org
X-Gm-Message-State: AOJu0YysyCw3sLuG5wi5xST3s28jm7uxcZmdQu5u6wsfwwfyPgwAnet+
	PaSQEPhKA0TORS2xSiT7uXgIEG+NZqo1t+Qmg6nyG5upiC58/Hhq
X-Gm-Gg: ASbGncs5PtyC+DoTHLoL1kwJeEadlYGIrVhFaHLis9/pMv0YgpQIWjx9vMf3XrJd9HQ
	L5cLsuDeyl7beA65iSkFoKD7fyQHL3sIlCCVPsEmYBf4vdrSsn3GvA2OXS3tMXx4/63PesFzTf+
	UczvRTOr35IqD0psB40PNwM2nvCPDKtVDjvLy22ltR3kBj11SqldYanzENdb0UeLVZ2XKMD4fPJ
	kCYW2me8BsjPSYEcDhdK6CSQiErKgUsh57XTI6fPustnGebbIqD1LTzORdKvPqBQXj6IGelDFUc
	CC9H4Yio8OWvnY49LlzLCPLg28MKVaAQuxcpfuym6vMmgoZpSFOcCmqxndDng7kLEaDvF++uaqF
	9uqH9QK0=
X-Google-Smtp-Source: AGHT+IGjuaF9lCedEwwvhGXZ/MFEnt3SPMlo5RufsTcV9FkuM7vYd2x/lrwZ+ktjsfsepkbI2prS3A==
X-Received: by 2002:a17:90a:d802:b0:2fe:8c22:48b0 with SMTP id 98e67ed59e1d1-2fe8c22614fmr7028655a91.15.1740639267130;
        Wed, 26 Feb 2025 22:54:27 -0800 (PST)
Received: from localhost (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f972esm7386905ad.58.2025.02.26.22.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 22:54:26 -0800 (PST)
Date: Thu, 27 Feb 2025 15:54:17 +0900 (JST)
Message-Id: <20250227.155417.1610168537890385926.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
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
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, aliceryhl@google.com,
 tmgross@umich.edu
Subject: Re: [PATCH v3 0/5] rust: Add bug/warn abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <8734g0v6ke.fsf@kernel.org>
References: <yy_ESUuchCjlaGIJHzCPAcP_d9ucSD0CGXaoZNNkY7BmN5Ch1J8avsA9QpKO5LkTjlGpu99jl8NrFl5NFSQXuw==@protonmail.internalid>
	<20250213135759.190006-1-fujita.tomonori@gmail.com>
	<8734g0v6ke.fsf@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_225428_889387_14DD70FA 
X-CRM114-Status: GOOD (  10.70  )
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

On Wed, 26 Feb 2025 20:39:45 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> How does this series compare/overlap with [1] ?
> 
> [1] https://lore.kernel.org/all/20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io/

No overlap. Each solves a different problem. Both are necessary.

This patchset enables Rust code to call C's BUG/WARN properly.

Currently, Rust's BUG() is a simple wrapper for C's BUG()
(rust/helpers/bug.c). I added BUG() to rnull's init() and got the
following:

# insmod /root/rnull_mod.ko
rnull_mod: Rust null_blk loaded
------------[ cut here ]------------
kernel BUG at rust/helpers/bug.c:7!
Oops: invalid opcode: 0000 [#1] SMP
CPU: 0 UID: 0 PID: 31 Comm: insmod Not tainted 6.14.0-rc1+ #103
RIP: 0010:rust_helper_BUG+0x8/0x10
(snip)

This is NOT debug information that we expect. The problem is that
BUG/WARN feature (lib/bug.c) can only be used from assembly.

This patchset includes only warn() but with bug() implementation on
top of this patchset, I got:

# insmod /root/rnull_mod.ko
rnull_mod: Rust null_blk loaded
------------[ cut here ]------------
WARNING: CPU: 0 PID: 31 at /home/fujita/git/linux-rust/drivers/block/rnull.rs:46 _RNvXCsafUg3oOYix8_5rnullNtB2_13NullBlkModu]
Modules linked in: rnull_mod(+)
CPU: 0 UID: 0 PID: 31 Comm: insmod Not tainted 6.14.0-rc1+ #104
RIP: 0010:_RNvXCsafUg3oOYix8_5rnullNtB2_13NullBlkModuleNtCsaYBeKL739Xz_6kernel13InPlaceModule4init+0x71/0x4f0 [rnull_mod]


The [1] patchset adds an abstraciton for include/linux/once_lite.h,
'call a function once' feature, with pr_*_once() implementation.

pr_*_once() just calls printk() once. Unlike BUG/WARN, no debug
information (call place, registers, stack trace, etc).


The only connection between two patchset is that WARN_ONCE() can be
built on top of both like the C side.

