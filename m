Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0C7CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 03:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oC2HSGABae+E+AaNQbmJTtlkMR5x7reMHu9iRIfpc4s=; b=fwoWHldeckOPT2tZbWpd38RXyK
	s+YDu2Q0vcTdRVFbZpTBe1LWM9RuMEnvnpEfpO/yfHFM3YYL6jkeH+qpg/rnZPYwGkh9ai6eef8Qo
	13vLQvxBNrZt6MPYc5qIKyFngjMbyisTx2tHsZSmNWHTKQYI5qM+8NFse3WuAvEle3PX4X9sE0KY0
	3y+0493BARtkn2LHpxN43mR2wcdP8W6jeo1MECITq8lJREO77OALQ/iP7SC+elGt9uDxbpIThtutJ
	q0yWbYSlguKv1VJ/L5hoKMi6sXTICDDNWq6xT7FbMJxv7tOkSayEZoagaZ/BTIfTSVUZP38F8V9Ou
	FFdqLV3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2A-00000004WMW-38dP;
	Thu, 30 Apr 2026 03:25:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII28-00000004WKb-02tR;
	Thu, 30 Apr 2026 03:25:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABA5B4447A;
	Thu, 30 Apr 2026 03:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEFFC2BCB9;
	Thu, 30 Apr 2026 03:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519545;
	bh=Ut5G69bc29PiPzWoT/741NVv5Kk/lOmdOdb5wKBmZHY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V5dcZx5w6ZsNbkLQRDMzB2RWL/aoneaFsqWWBCOjQU9YtIWRYDD+T+yLL0c1uuBhY
	 qEq09wxP51HP2ucG5VcbFYEWu1xwrI3mLVWalChYNFLQKJVV2/uPNO5bNsVTmGtBYW
	 y+MFexZXsUKBzIR9VcaG11CGAPdXCh5mrQ4ITyVmu2dzJeTpqYPZZKRQaFN8mTUumj
	 qe1015WQ5bGNHETaFFAMkfQbXS+479tE5rufj5GTm7FfEY/F/wwiBzlApZyMLXQ7Xj
	 eN4jVc9crSFreUj8YqywmtdyQ9MC4GHMaLaL9pIVAuwmWk3hGgC+ZxtKtJbApg/ERF
	 YZVQLUUCYw1Pw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id DA1FF3809A07;
	Thu, 30 Apr 2026 03:25:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751950055.2274119.12088060080551439561.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:00 +0000
References: <20260405235309.418950-1-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: linux-riscv@lists.infradead.org, nathan@kernel.org, nsc@kernel.org,
 dakr@kernel.org, a.hindborg@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 acourbot@nvidia.com, airlied@gmail.com, simona@ffwll.ch,
 brendan.higgins@linux.dev, david@davidgow.net, gregkh@linuxfoundation.org,
 arve@android.com, tkjos@android.com, christian@brauner.io,
 cmllamas@google.com, aliceryhl@google.com, corbet@lwn.net, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, lorenzo.stoakes@oracle.com, vbabka@kernel.org,
 Liam.Howlett@oracle.com, urezki@gmail.com, linux-block@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alex@ghiti.fr,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 raemoar63@gmail.com, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202548_085415_16F5B0BF 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Miguel Ojeda <ojeda@kernel.org>:

On Mon,  6 Apr 2026 01:52:36 +0200 you wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
> 
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).
> 
> [...]

Here is the summary with links:
  - [v2,01/33] rust: kbuild: remove `--remap-path-prefix` workarounds
    https://git.kernel.org/riscv/c/c8cbe2fc22e4
  - [v2,02/33] rust: kbuild: remove "`try` keyword" workaround for `bindgen` < 0.59.2
    https://git.kernel.org/riscv/c/518b9ad2fab3
  - [v2,03/33] rust: kbuild: remove unneeded old `allow`s for generated layout tests
    https://git.kernel.org/riscv/c/92cc022f044f
  - [v2,04/33] gpu: nova-core: bindings: remove unneeded `cfg_attr`
    https://git.kernel.org/riscv/c/341c51ee3293
  - [v2,05/33] rust: bump Rust minimum supported version to 1.85.0 (Debian Trixie)
    https://git.kernel.org/riscv/c/f32fb9c58a5b
  - [v2,06/33] rust: bump Clippy's MSRV and clean `incompatible_msrv` allows
    https://git.kernel.org/riscv/c/b6cfba436623
  - [v2,07/33] rust: allow globally `clippy::incompatible_msrv`
    https://git.kernel.org/riscv/c/7ed188605e1d
  - [v2,08/33] rust: simplify `RUSTC_VERSION` Kconfig conditions
    https://git.kernel.org/riscv/c/b28711ac98e8
  - [v2,09/33] rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and simplify code
    https://git.kernel.org/riscv/c/9b398d056543
  - [v2,10/33] rust: remove `RUSTC_HAS_COERCE_POINTEE` and simplify code
    https://git.kernel.org/riscv/c/4ab22c543f18
  - [v2,11/33] rust: kbuild: remove skipping of `-Wrustdoc::unescaped_backticks`
    https://git.kernel.org/riscv/c/0f6e1e0705f0
  - [v2,12/33] rust: kbuild: remove `feature(...)`s that are now stable
    https://git.kernel.org/riscv/c/d1aa40daa777
  - [v2,13/33] rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
    https://git.kernel.org/riscv/c/f309a6edda53
  - [v2,14/33] rust: alloc: simplify with `NonNull::add()` now that it is stable
    https://git.kernel.org/riscv/c/161dd7b51e96
  - [v2,15/33] rust: macros: simplify code using `feature(extract_if)`
    https://git.kernel.org/riscv/c/42ec980024f0
  - [v2,16/33] rust: block: update `const_refs_to_static` MSRV TODO comment
    https://git.kernel.org/riscv/c/961b72d45ae4
  - [v2,17/33] rust: bump `bindgen` minimum supported version to 0.71.1 (Debian Trixie)
    https://git.kernel.org/riscv/c/c3a00a3f31ff
  - [v2,18/33] rust: rust_is_available: remove warning for `bindgen` 0.66.[01]
    https://git.kernel.org/riscv/c/41cfbb4295cf
  - [v2,19/33] rust: rust_is_available: remove warning for `bindgen` < 0.69.5 && libclang >= 19.1
    https://git.kernel.org/riscv/c/ae64324ad5c1
  - [v2,20/33] rust: kbuild: update `bindgen --rust-target` version and replace comment
    https://git.kernel.org/riscv/c/276ed30c558e
  - [v2,21/33] rust: kbuild: remove "dummy parameter" workaround for `bindgen` < 0.71.1
    https://git.kernel.org/riscv/c/93553d9922b0
  - [v2,22/33] docs: rust: quick-start: openSUSE provides `rust-src` package nowadays
    https://git.kernel.org/riscv/c/53c9647c0a48
  - [v2,23/33] docs: rust: quick-start: update Ubuntu versioned packages
    https://git.kernel.org/riscv/c/982e1aa6de73
  - [v2,24/33] docs: rust: quick-start: update minimum Ubuntu version
    https://git.kernel.org/riscv/c/6767147cb941
  - [v2,25/33] docs: rust: quick-start: add Ubuntu 26.04 LTS and remove subsection title
    https://git.kernel.org/riscv/c/780f847e1419
  - [v2,26/33] docs: rust: quick-start: remove Gentoo "testing" note
    https://git.kernel.org/riscv/c/99c672426aed
  - [v2,27/33] docs: rust: quick-start: remove Nix "unstable channel" note
    https://git.kernel.org/riscv/c/b69a14650009
  - [v2,28/33] docs: rust: quick-start: remove GDB/Binutils mention
    https://git.kernel.org/riscv/c/a4392ed1c8b9
  - [v2,29/33] docs: rust: general-information: simplify Kconfig example
    https://git.kernel.org/riscv/c/9375ea727d7e
  - [v2,30/33] docs: rust: general-information: use real example
    https://git.kernel.org/riscv/c/86c5d1c6740c
  - [v2,31/33] rust: declare cfi_encoding for lru_status
    https://git.kernel.org/riscv/c/9e5946de3a38
  - [v2,32/33] rust: kbuild: support global per-version flags
    https://git.kernel.org/riscv/c/b2aa1535ecdd
  - [v2,33/33] rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0
    https://git.kernel.org/riscv/c/2e2f8b5a0656

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



