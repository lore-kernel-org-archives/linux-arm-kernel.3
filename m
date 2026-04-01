Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541391112245
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p34P/N0htXMWyNgHvxgRP8tCusw1WyPfl4g4grmCwBM=; b=Cp97rIvtCf6+419xJbsU9ZZcbc
	n5qDCJmeKjHqBnFNxsSmrJlFMTuSWdtAy6KPC8IaCEs2cvnpMtpDIuQ5jltYXoG5YFvA/L67Uo7IY
	2namih83y8kR+WPNasFQfDX4fGdEqEwwnGZKXKfmCw1CRuFxfgvmkgHV6+MjI5NjslNpf1vryehgR
	dNGej5GJiTkIjq2ZzWIO77WUHmUgb69qx5d/bMVxM7GtENFb1NSY82CZrdulIgPgiki+s3XnCc/th
	CLgdjSDx5YRJxx5DdTC2b685jYRZ+EWH34lW/bxPaxRm2FAPJAYKYAMMSN50L8zwtgAY9EAZMf4Ei
	pSWppSRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84ZG-0000000GOOw-3D0i;
	Wed, 01 Apr 2026 23:01:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84ZD-0000000GOI1-38cY;
	Wed, 01 Apr 2026 23:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C2E660120;
	Wed,  1 Apr 2026 23:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE51C2BC9E;
	Wed,  1 Apr 2026 23:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084502;
	bh=Gkp7xZZSJnjNLA6k6/JP5dygiZIRCC7PAi3ux8OxhkE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=jfQkTaxfpKSFrtjDj4wnczInb5geAhQ2NuZC4j8sza8AlCVkY9hHmgdzVVY0yxijN
	 7EW6reI1bW+030I9qVO1zAZWx+TBGJpZq2WXPsyX988sOHkUOfvE5JFqjeS8LLGJDJ
	 sMBtfvAC1aWjcgdjQO4wCkz4llResctlvtQSOUTi/MQ4UERmNSZUez0osJLGfMr5EI
	 g24ohqM/3TlB/6le+jylXy3Co/4SrRTbHn7b+3FMiRVhLd0rshwI3jTt8Lnp+iaIbO
	 9TnizhTMXYNZRHkHYFSXlyA//fjj8hUx35vtyH7WnPpvnb2KJI9CQVhdR8cuHVfGAZ
	 Dx6iv3k7KPbJQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 28/33] docs: rust: quick-start: remove GDB/Binutils
 mention
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
In-Reply-To: <20260401114540.30108-29-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-29-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434470.73816.10527840819544688551.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=721; i=tamird@kernel.org;
 h=from:subject:message-id; bh=Gkp7xZZSJnjNLA6k6/JP5dygiZIRCC7PAi3ux8OxhkE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7vWLzx8ca7ltK/c1jLRjOeETCKjKi1llmeceLZaM
 Eeobu+HjoksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFOt8ZDhn3G/2qInK/N5PgTvrNczbGrWTNn6eB5rvFXwgfbkN2m7pjD84fjhu3e
 73acXMn2zzllc+jYhUfrXFuEdU8Ny5T+nLj53iwkA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
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

On Wed, 01 Apr 2026 13:45:35 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> The versions provided nowadays by even a distribution like Debian Stable
> (and Debian Old Stable) are newer than those mentioned [1].
> 
> Thus remove the workaround.
> 
> Note that the minimum binutils version in the kernel is still 2.30, so
> one could argue part of the note is still relevant, but it is unlikely
> a kernel developer using such an old binutils is enabling Rust on a
> modern kernel, especially when using distribution toolchains, e.g. the
> Rust minimum version is not satisfied by Debian Old Stable.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

