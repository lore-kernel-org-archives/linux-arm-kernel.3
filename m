Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2841112241
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 22:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+V5Ka3r292WrT7qbBQ57WkBT6siHTxZdBQpeoU8PGHs=; b=jv/zkqsoI/OaGeDMUsLBmB/njI
	Cnlfu8RwrzcBZJW8gN1pY0/EEcEpgMjnT1XR3uK3y/JNbg8kyc3wW2wgbma+F6DjekorKMHVn0EWt
	zCI7oT9vbKZayf7DvE20QdMuW2eB7FgZeF1TZmVMARAR8wT3t7jKPa18EmnFfSanGz0+YsODoUGwV
	yk2lJf/eI82nuNxyT7KDP5LtOrRAYPTEh+PoCN05VC0gwGp9qWM/Zp7jYQSScUgt47ArJN9TNgKOB
	VCqOSoVvhPCx8VlEeMOYiL4qB7VoKH48LQ7l5RrCckQPJ0d/++315TsmWRJy3vRN4YVYCvHhsqh/O
	B1w4pmVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84XA-0000000GLSx-1jrA;
	Wed, 01 Apr 2026 22:59:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84X8-0000000GLRY-4APn;
	Wed, 01 Apr 2026 22:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A9066183C;
	Wed,  1 Apr 2026 22:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65428C4CEF7;
	Wed,  1 Apr 2026 22:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084373;
	bh=Ii64UohOmGa9D7Nk9W6Cz5l63ShstMt6K7vL/J9HNQA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=b3ZOfAO/k2lp320CDk3qpRMJS05zjn/afZ2IotR/pNa9pvO8jqoTFabvaRGWwjSrV
	 afI1aMc6CVXX6wjn76mwbBs3jWHoWB3LvE9ieXeMM09JLcTdQD63xZobaCgRt9gagC
	 T4+ovLivvAMWeywP9DE1NWQs7WrRBwmmoXZrUEt5B5PWnxDjT8oCVPV8TvfZLgTpl/
	 qyNiZabsz4Rjnc4DvPKAAgyl6CvLkHjVG3I85YPHu/iRYNHBkH9j/Tt9G2bSzGkLyW
	 ZQ3WV8fVX2jKsNsVBk08tu1kHvyWkZOpJR2eMMt01r2FfBbmWwsZ6AI7/ziE33NiIW
	 O8pZatbWprVuA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 03/33] rust: simplify `RUSTC_VERSION` Kconfig
 conditions
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
In-Reply-To: <20260401114540.30108-4-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-4-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434434.73816.3787660440846251925.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=514; i=tamird@kernel.org;
 h=from:subject:message-id; bh=Ii64UohOmGa9D7Nk9W6Cz5l63ShstMt6K7vL/J9HNQA=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzt9md2tHTAj4WOoTNzX20a/Xhyf8/tK8zeF/6JL/
 mq6R/352zGRhUGMi8FSTJElUfTQ3vTU23tkM98dh5nDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10DHSMGbg4BWCq2TUZGWY/+B+slXnaqd07eMq5YFYnE9/e7BitD2eXLuc5Vr27/CHD/9DiPXc
 0reYKqWbbLrgwyXNO3X6Xowze0tyBEarPNty5xAoA
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

On Wed, 01 Apr 2026 13:45:10 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> With the Rust version bump in place, several Kconfig conditions based on
> `RUSTC_VERSION` are always true.
> 
> Thus simplify them.
> 
> The minimum supported major LLVM version by our new Rust minimum version
> is now LLVM 18, instead of LLVM 16. However, there are no possible
> cleanups for `RUSTC_LLVM_VERSION`.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

