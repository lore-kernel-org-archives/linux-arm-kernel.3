Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC4A1112243
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyNaH02CnZyFNUKVFX1brra6By+KY4BKdZIZZIN9sTw=; b=eVhP20CqkA4VDpDyWxU/ggOscG
	6ePwhLckgkvSaLyeA8N6HmjGeKxQusq2qjg11fVAfrEpkpepxo2VmiVHTHTBoowOgamd67DGaTEzq
	vj5zqfH4g6y51WnpsDxvPZWefF8KmQ61qDh5diaciefDltWQHMHmJA8KazK6adZMJ6Iz7hqiP9O6I
	Icu10I88KUBGLqvxZIkdscMUSVIUeq24dzh+u0kqO39LAW8+a+7ZOf55YKaqjlI0aPw2EU++3inXb
	8F0A6lEyLhTLGQYOkfsFx9drcc9DfpyZYHxKmrS8vFF1TmqREVD+BcTCpY3JV9WTvXQKkFmB7wxTv
	y33SwNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Ym-0000000GNTc-0pe2;
	Wed, 01 Apr 2026 23:01:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Yi-0000000GNM5-2y7l;
	Wed, 01 Apr 2026 23:01:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0B4E60120;
	Wed,  1 Apr 2026 23:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCE5C2BCB0;
	Wed,  1 Apr 2026 23:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084471;
	bh=7aVFywT+2Lk7MGqcezyZUKBY2qrMkQyNxl1L8RiG6qg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=lad2ZbTz2k+awmv51HvNm9F33ppVCdijDwDOK72BmP33a2sU2k9c2p9ikdqzeKTMf
	 WOt5XDYCZpQlIm+TEbMSrTD8IZMPHeGLi+C+CFNIX5nXLxOp4k0ZNSBtHmtWZ2G+Bf
	 BwZa4C0avT287UqzFaKmOW0lx8m1X5t+TMnRXYyO3GU6eHReK4LeeR8uy8FBVMU7td
	 vE1n1OfYYghytWvzfMDuGHMyHVmjUuvHq8WwwISMwWTEQjOrbDvMZrOcpcha7TexI0
	 RcKEKnUVJ4aCjlCVvZWbTeTakQMO0dGlBMaINHSOui2za/YHQHuGqSTkp6ftZRzVmM
	 34iMXnAEqXEtQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 22/33] docs: rust: quick-start: openSUSE provides
 `rust-src` package nowadays
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
In-Reply-To: <20260401114540.30108-23-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-23-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434463.73816.5322398252343055827.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=335; i=tamird@kernel.org;
 h=from:subject:message-id; bh=7aVFywT+2Lk7MGqcezyZUKBY2qrMkQyNxl1L8RiG6qg=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7t4T27++UF+3krL5Fpu+U1fRLZydWldbK7Y7X3Tm
 zmRw9eqYyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFQvnMjwV2BF2OdjYg17Tzx9Lld4dPLawPp/ur9P7OVO/HQzzXXVz5cM/yvU5gW
 8re5a3mIq12EnwKtTUu99bha3pVI488GHJ2I/sAEA
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

On Wed, 01 Apr 2026 13:45:29 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Both openSUSE Tumbleweed and Slowroll provide the `rust-src` package
> nowadays [1].
> 
> Thus remove the version-specific one from the Quick Start guide.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

