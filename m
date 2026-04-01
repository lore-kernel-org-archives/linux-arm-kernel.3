Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68C41112242
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeE3o5NY7tU6Co9aT2IN5/RL0Yi3FkBzGM80E/lB6C4=; b=3mxC2ywy+vc0a/7kG4bRCKVK14
	BHhHPNZzKxteM77OAYJ6dQzp7DCu3MkRV7EiptcTRpaNpaqn/J4cBhQlWU7yMwRCMRlT8LiJnwUxW
	Cpm6Y96rntmJrXDFn0RsC/SjUaDu3DVSFe6qo2ZuZk88WeOPSISVA7EZ4STwQSuB4qD3Qf4p9Pmag
	q0BlXRr7WoNY4LCtN+h2g55BBO5x8P0w73tnBGxuiPB/xJqBO7FNlohtDKSGhDTM5L6EPENQF7smw
	0ADJXo9vifTyE+rnpaaMlaSkcOKXXodDYHCfXeDOkpFswo5kCIzI+Haz3QXErTR6vwtEgrxkP7TG+
	7yP//DOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Yu-0000000GNiM-0M1C;
	Wed, 01 Apr 2026 23:01:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Ys-0000000GNda-3YE8;
	Wed, 01 Apr 2026 23:01:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CBFA60120;
	Wed,  1 Apr 2026 23:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E7BC2BCAF;
	Wed,  1 Apr 2026 23:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084481;
	bh=6656iS8Z953zXAk/bn8KpSt1Oh4C8fXwc0OPqmLk+Wg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=RnZUWOirA715kbUPApG8z/29huJIEsdvuiYpn4e51BGl8Ih9SKFkc8mSpA7VTChiB
	 x9CVKCriNZkE9qjuaipqjo+nCQVG45LC+x9BJfMr26Ka2UW9mJ3orbH1f+2MVf8rKs
	 g5Zxd3sc+h9Awoqdt/jrZcCCNplpoC8xYVYMJ5lSdUcmrwD+FiH36uWGgU4rjiWVNO
	 ugNNPXvHlZzVsQ58hUHNyoop8UyO3R2aa7bYcrnxq//E7woWnwm2eFwJwJ/08jWKAM
	 uYP7EZaf1nmiAP00xNPx4xm9mZO8bt0go7da8uTuzQNPOnpLq+/734ONfHKrXmysCf
	 jJVgMm6it7WKw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 24/33] docs: rust: quick-start: update minimum Ubuntu
 version
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
In-Reply-To: <20260401114540.30108-25-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-25-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434466.73816.13717819961434434560.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=430; i=tamird@kernel.org;
 h=from:subject:message-id; bh=6656iS8Z953zXAk/bn8KpSt1Oh4C8fXwc0OPqmLk+Wg=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7vYT5udIq//NWh3249c6Zw3aa2uE1ildkhcKim49
 Glpsf7MjoksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFMtfoaRYYZs6f3+qpndGzVXCi3h9u8KjP8wX+SNtVZRiJHZvG0PrRn+yr6UuBJ
 UWq+RY6pw/fwCn9/Xfx5LiJtkZDJlt7jYZ7ZpfAA=
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

On Wed, 01 Apr 2026 13:45:31 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Ubuntu 25.04 is out of support [1], and Ubuntu 25.10 is the latest
> supported one.
> 
> Moreover, Ubuntu 25.10 is the first that provides a recent enough Rust
> given the minimum bump -- they provide 1.85.1 [2].
> 
> Thus update it.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

