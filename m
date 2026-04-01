Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30DF1112240
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiGMEOE10qQ9vknsbOwQy03tUHPZwbwAyZUE+fcYgvM=; b=ql/j830OGzKRWd0HoLJBzPSh8Z
	/ZH3OXqFCglcy3kbp37NvyaDtCbnzq1VF9LuK7AV9N5Nuh4Gf8boEYSURU8W4AZcYDD8EBRkQ5EG2
	bU2+j0nGwXfT3jrtVOLjUNzVVJ8kFueh0CwD/byzRBk9HxSSgbD7qLyFtD+7qE+XOb7i6iuADew7N
	WuKhLBvAXlwTOXv9sounGE21kXmTI3+afmiR4HZPENkYa0ZbSkVUEDgbSJMUXS6OSndnE9sYZ398h
	6KqSFSPU3NQghMcP4hwU5R0jrgEWx9JuhAvRmdAw8No5Lap/8461xij4OYJPZUZtJcw8Hw72ARj6b
	0H8AnzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84ZC-0000000GOHZ-3fcr;
	Wed, 01 Apr 2026 23:01:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Z8-0000000GOAt-1VEb;
	Wed, 01 Apr 2026 23:01:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 764D26013C;
	Wed,  1 Apr 2026 23:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F05C4CEF7;
	Wed,  1 Apr 2026 23:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084497;
	bh=RA9AY2T7mVYiT1QmYiaR63Kmx/C/myQ45rJJ7MBbsDY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=b+P4xKOIyko3WWJnIYJ8bI4W3dAIUeSADYc1CtoxAYohAjbtUpCM+F8kOdFfxZKKO
	 sKtCiL0N0/I/hhMG9tSPK8eLcdclKVmFAmqphjjRs64lczzUsYFXLSrVx0o1ANBjbA
	 PbMgmXdW64lIPpiSS5apdOGrwLFbf/sdj3jK8v79AsQQCqhZ2+UDs0xMKHbB0T+jVZ
	 pLDv1Ey/utUtJq7DWrEa9I+r+fSckCS2v9ym/rg/yPSw1uFXr+JGyOalgAFUoFqwVa
	 S22IWI21qZsPP3SimeuLhGqA1ycVVG1dgW1QmvLjJyIAme4x0KlKjOt7MTnABWpVyd
	 ShLMS1qUDPGYA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 27/33] docs: rust: quick-start: remove Nix "unstable
 channel" note
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
In-Reply-To: <20260401114540.30108-28-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-28-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434469.73816.1901858850945168226.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=352; i=tamird@kernel.org;
 h=from:subject:message-id; bh=RA9AY2T7mVYiT1QmYiaR63Kmx/C/myQ45rJJ7MBbsDY=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7vyr5hm9V0/abVJ2uNHjxWjGhKvpydNmi2seGWam
 OiVJj31joksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFMdHsXwP2Dt4lu9uvlf/ENv7+GrKJzyWPj4JL1Td13lw681ME/a6svIMGHtDbW
 Hc6vi0/gEvt/n71IVU5sz7WhmpbvD//JX+9XesAIA
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

On Wed, 01 Apr 2026 13:45:34 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Nix does not need the "unstable channel" note, since its packages are
> recent enough even in the stable channel [1][2].
> 
> Thus remove it to simplify the documentation.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

