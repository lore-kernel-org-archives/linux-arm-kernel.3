Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25684F46C48
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 14:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3Gu+YDTUukNRmTFhOIJ7noDOCk1VkFhzyDhva8GTx0=; b=qA2Jp9qjA64JxP6NShNsSJtuy8
	n6AWYJXQj+KSctkGoi6NUmbjnzeJ8LFYsxT0E87IYgH+79MsMaG57906ru1C94vCvi9sLzF46NdTV
	aIXxERbksi+4sRYkozd04yE5LX9BxFEWbkWEOEs1vc/W01L6JXDrO8b2XID5uLy8AuuKb7z5ViUNx
	pumA3S/SUVBVkr/hHq10SbWF/M3NwIZwcYTmFyhd/ARifLDLyxj+zGBoEUlR7sugkRFp0WyBAoLfF
	5slxkEPJFQ92JaqNm0D794EeM2m2hG/pT1jrJtb4+r0/TzXm/ogSWnbXMLTa5L701/c2QWjQe7oB0
	L+coKzNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9kx1-00000005Biq-2HNL;
	Mon, 06 Apr 2026 14:29:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9kwz-00000005Bhp-2OOQ;
	Mon, 06 Apr 2026 14:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0FCD60123;
	Mon,  6 Apr 2026 14:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2070BC4CEF7;
	Mon,  6 Apr 2026 14:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485752;
	bh=HnyXrN8Ze7oWN5RU90Xg4dEPZvkzNdPtLR2J7oWKONc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=lwTzkeF2x01R3fvgfnFiK7WfggVTtKgdI5PqAS3VuDqpIEjjdug3qWS7vtmd2KSdV
	 oTrDkT9uQ1/xp613yCRhmPXrgauzZR0SgdLw4cgb2Er+qKxCTR1UB18MekNP57ce2d
	 Dq+NCKPaveS/azu5fgX/lqg7329U84tez02UUqDJPJCyN8pddAgwpNDLQ0IkSpW1Jz
	 PtO3C6UpQrHPaXGREoTIC5FN/oFA5HuOyD8AMahOMQs/0AlImyQbF6YnkNDQHi8ivV
	 onmaDI0oyY05cOCK9W8+TufsXgVJdXN34et90aGjxYMba+57r4m5OtP1bI9SzohIux
	 tfdhwuQhJ5scQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 07/33] rust: allow globally
 `clippy::incompatible_msrv`
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
In-Reply-To: <20260405235309.418950-8-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-8-ojeda@kernel.org>
Date: Mon, 06 Apr 2026 10:28:56 -0400
Message-Id: <177548573697.95472.13544191227699996309.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=648; i=tamird@kernel.org;
 h=from:subject:message-id; bh=HnyXrN8Ze7oWN5RU90Xg4dEPZvkzNdPtLR2J7oWKONc=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJmXD+szR8md2/bwyZ1F0fYvj7t/r54Rzbf5hV3T8oV7h
 Q3jI+P3d0xkYRDjYrAUU2RJFD20Nz319h7ZzHfHYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdAx1jBi5OAZjqWT8Y/lmwJW9eJT3XMkOlYcLcExldDysMMzaVTNBntZYMfuz17zPD/3gXC6d
 lAllJAu0+OzxTQy8apMZvPH53ovG7oKmxvzfv4QUA
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

On Mon, 06 Apr 2026 01:52:43 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> diff --git a/Makefile b/Makefile
> index a63684c36d60..78f5ee173eda 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -486,6 +486,7 @@ export rust_common_flags := --edition=2021 \
>  			    -Wclippy::as_underscore \
>  			    -Wclippy::cast_lossless \
>  			    -Wclippy::ignored_unit_patterns \
> +			    -Aclippy::incompatible_msrv \

Could you add a reference to the upstream bug report [0] here?

Link: https://github.com/rust-lang/rust-clippy/issues/14425 [0]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

