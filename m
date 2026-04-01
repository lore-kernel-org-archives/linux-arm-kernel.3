Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BAE1112240
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AK8wWC3ZzbQrO2r8eyS5eSs5Ohc+KRwGQNCkBfs+pkk=; b=kb7pBDjjirBjSsjdUYfqwFqjmr
	NscxbJPqi3xxRbTfbyn8MkuNIGCo1qBWQlz4DPaFwAZN4KIlrEavvPgZ5iAIKkF3W6sL8dfqqdD6N
	M8jU+FYLGDVGbLe4c9Rim/+Qzl3TgbjGJi20goh1pUnOanQbIP2eMbwhP7GwZWRmdUoOXGSP3gjx3
	TP6W2tuXgbPiCE8Iaoxi5xP40SjizpfYYfubfdKh3eOqv+raNuVqf9ztVI5kTPKpi9HT4NMGRfG6Z
	hSQx75Lw/RXvVGi9toFS5btEVj3QvGh+1d+oX3+W/Hx+XttBK813pwR2a80vsB3Nszta31NlW+1gA
	R+ioApSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84ZM-0000000GOaB-28hA;
	Wed, 01 Apr 2026 23:01:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84ZI-0000000GORz-3Wy1;
	Wed, 01 Apr 2026 23:01:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A56A06013E;
	Wed,  1 Apr 2026 23:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846E1C116C6;
	Wed,  1 Apr 2026 23:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084507;
	bh=EHz4n5YTSN6LWX8eGfRMr5/Bcb1koBvR3pe++ElzTzY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Qd+wRJd3wir6TeK3EAz5gzl2NHC2qbwNimuevll/SRy4V4IoVSdIPJ/4HIkcpVXiG
	 GtFfzJ0Uj6ddY9J5/w6tj9QSfgXupx/UhHog42BcNvzDhUgr5spzGF1QfWVaUZH+fb
	 iF5k9s/ftekDdHeJsmoNNIvFYVjAEC4x1SXaEzy3EaO/cC9QWPOuxMq1vA1eNHEtRS
	 +Y+i6OT6GC5jocuqRICw6v3JGQnV5THSARnBCOWMrYgtgZCxzfaKzcO9IWLOzr+reU
	 u60yz8JAUjGkHwq1N23g+F4zbOlB149p/HY9HjKqGTpPtUqsCuPwugHxQp0kDHY9I6
	 FGWcAxJITh2Ug==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 29/33] docs: rust: general-information: simplify
 Kconfig example
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
In-Reply-To: <20260401114540.30108-30-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-30-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434471.73816.15753382261308172951.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=412; i=tamird@kernel.org;
 h=from:subject:message-id; bh=EHz4n5YTSN6LWX8eGfRMr5/Bcb1koBvR3pe++ElzTzY=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7ver/2//ckbsVnLfatPrvglsc9eXG7+eRe/fdsr7
 t1q97Gf3DGRhUGMi8FSTJElUfTQ3vTU23tkM98dh5nDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10DHSMGbg4BWCqOfUYGRYmxl4TfflIb2K2ycHjlVO+/Z6+c57fBwNzU4O9vCKKM+8y/LPI/Sc
 h4bDDddL1t1ukjFU25JvonNtgcyE3XqZH4qBrCBMA
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

On Wed, 01 Apr 2026 13:45:36 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> There is no need to use `def_bool y if <expr>` -- one can simply write
> `def_bool <expr>`.
> 
> In fact, the simpler form is how we actually use them in practice in
> `init/Kconfig`.
> 
> Thus simplify the example.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

