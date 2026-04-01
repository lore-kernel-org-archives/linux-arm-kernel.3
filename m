Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1156D35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NeP3MH2AtPdcWLmckwtGvj7Vmo/dD7G6Ej9iUZzn4s=; b=jF2LGicu1YyJWbGzUQwea/z1JX
	wjK/BGHGtkqNPb5FozHCrk1iijB+MG2O0Prpzy8JZil+YzuPJzOwlpGW9fJ25uJG5V6MyS8dXo2tx
	XuK6YoUZfLCb9vnpjGf6A4QtPA6jQPzaQogzLSDFzj5HX+eKmwDXZ2M+/46o9Do2kQoEDHuEGacHw
	SnTF5ygOdTsHP2BH5VaBJiPDI9AWCBn8MUqF9PzH7lw5DnBwQ4HEOdEv9qyfvxb7Pb8WDTzcRFVie
	iQfMulr7PJG493QfuI6Z7X6vQJNhuhuYkH0kUNyXy93DU/IQqW5fKyKKWIqHPHjZA4nsrtMA4TbxF
	IP0hx3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u3m-0000000EhMn-2Z9g;
	Wed, 01 Apr 2026 11:48:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u3l-0000000EhLM-426L;
	Wed, 01 Apr 2026 11:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4NeP3MH2AtPdcWLmckwtGvj7Vmo/dD7G6Ej9iUZzn4s=; b=eTaOF1B/kuhy8mnrUoNfuE2sB+
	3Rb12mUTZaC09BRVY/897T+cqGp/+6TOaIg0V5wRdB+7viNhNCGd6TbV+3XE8DCXtIdWVtPs9e4/X
	aLH3/6aCOSffpuVoM6jESCuGbz79sj5w2puV/Ct8oZkxY4KG++YrJgXW2qlbWR8LEGA+v0xklKnpA
	mjge4+hvVVbcXsZT9LErJT5Xhf4s3XCXWHmMvsQeC3nfxDzhjKfUbVx8iXZe77THBVVELgZYLMrrQ
	TwnEo8O+qSya1Ph3AWPgDWAz9Si0b7t1Ijqmc0Y8w05RfPWInnK44aRVLgFlR1Ukyb93KaS7t40eX
	R6XW/Sbg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u3f-00000000Ehd-1m0Y;
	Wed, 01 Apr 2026 11:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48326408F5;
	Wed,  1 Apr 2026 11:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04AFC4CEF7;
	Wed,  1 Apr 2026 11:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044105;
	bh=oCOOGcyyszcaXC31455V0be0QqdPMZoxWheuEK3ZCSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GoxIk+02vJe18xjAgrD81txVK4wtRlTfUWrhHLGDRSQiV+me/fjnLC+7phHDlesuL
	 J7Hq1xhTdOPfCfF8DlMkdOt8rrbVHMirjmXItItYHfBPD25cX4fMo/GBYwdrbRu7fZ
	 0AkU4tct54K8WMu16YFOTGOQcGE3qx2fKQnsmkDzl/vyf61S0QPF9vcb0C1gkRPnMR
	 e+5uOE14VQelGq2Cq0xHw4LUMkQ9WlkXANUH0HKCMdNXt3l1xPhuNuUmuYpg9lJb/A
	 TRD5Link8UuZH9tLBuJ6KDPuIvaQ52PV5omvSLGJvk5BLHki1ajJnBJ5vuJsGi1ltQ
	 c73r0TDlYXWnA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO comment
Date: Wed,  1 Apr 2026 13:45:19 +0200
Message-ID: <20260401114540.30108-13-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_124827_917946_E990A7F5 
X-CRM114-Status: UNSURE (   9.67  )
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

`feature(extract_if)` was stabilized in Rust 1.87.0 [1].

Thus update the comment to reflect that.

Alternatively, we could use it unstably already.

Link: https://github.com/rust-lang/rust/pull/137109 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/macros/kunit.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 6be880d634e2..6f6d746b8dbb 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -87,7 +87,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
             continue;
         };
 
-        // TODO: Replace below with `extract_if` when MSRV is bumped above 1.85.
+        // TODO: Replace with `extract_if` when MSRV is >= 1.87.0.
         let before_len = f.attrs.len();
         f.attrs.retain(|attr| !attr.path().is_ident("test"));
         if f.attrs.len() == before_len {
-- 
2.53.0


