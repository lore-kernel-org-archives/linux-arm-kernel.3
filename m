Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177621112240
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iv1BPbU3qTs7d3Z0PctBZ3AH7iBcwH+dz1mS7ab2h94=; b=ZVli1Xjw8YTYILbuShKqheu/qb
	Hiln1I4VQHjyL8VTDzwzZGCWoGQaAb9vBudI7YN7V6zjJ31WjDY9gtyWHG5Wu+SZQgETIObAHzvV4
	CY0usNzSip3X44gRnNHRbmH6l+XTofZl7s6iRTJDfek/O5ZVTxqZoT3urTaS1O8kLhvIRls3tmDNH
	CZ/Y+3AIQWa00acjpGERLx4YA+ZMz7Ix8NRkyNcUyMcYvoavfnQLsaE6Oj8vy/rBSdNGxKuJ67lO0
	cMEroq+tjpgPMhcEIMd7WJ1wpxQmJGQE5QR2t8AwtWLUr1UK+qxH+na2BXQX1CEU8PVwTs0tD7vBO
	AS9sCHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Y7-0000000GMPY-02aM;
	Wed, 01 Apr 2026 23:00:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Xs-0000000GMEe-3Uo6;
	Wed, 01 Apr 2026 23:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36F3344385;
	Wed,  1 Apr 2026 23:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8FAC2BC9E;
	Wed,  1 Apr 2026 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084420;
	bh=mVg6WY7C1fvXHAbLZBkR9DIEo/9TufTw8UKTpB/DRsA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=t6cIwTonIQqv6/0lOH/xY8JcUQFMyUNQbNR6FUyE+Z76Ku/+2iF8YghHEMBgFfr4N
	 yjr5KSSGH7iI3B8LIOdR7bGwxKBBtfzu8YOJ48mgOUV3t19tvb4iQAfpqvemEbeP2O
	 eegFgVh8eC3mlphv7vkwrZVTUaeR03H3J5OiJvRcJ0TVYfYEObKvRC9Ygx6E1DGx8X
	 wZ4tHeJeOURHotjXZZ2KlD87ya+KWAG74tOthti8DyfXCNoylDP/2q6t/2cth+bRzn
	 1b9ODoXF2Z7nXbZxtZZkzxHxnKZLlJD7CSj6Fk5xBR04GSur2yZyVHuyzA4KOTYV70
	 XZw98YIcLql/w==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO
 comment
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
In-Reply-To: <20260401114540.30108-13-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-13-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434448.73816.3909694795109888546.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=431; i=tamird@kernel.org;
 h=from:subject:message-id; bh=mVg6WY7C1fvXHAbLZBkR9DIEo/9TufTw8UKTpB/DRsA=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFztvWC+6zePID9NFF5pd8r78FdQ1rL7NGHF122szL
 /WVLLqxHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKb6WyjD/6glGpZvRXvYxNjUg4vT+1YybT56SeUW57tfxgKHAwLldzP8U5UI2HB
 q0oc/y2r3cH/m9PV2zd55JaGLlbHJ2CPk6H9ZFgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_160020_995346_C65901EC 
X-CRM114-Status: UNSURE (   7.27  )
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

On Wed, 01 Apr 2026 13:45:19 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> `feature(extract_if)` was stabilized in Rust 1.87.0 [1].
> 
> Thus update the comment to reflect that.
> 
> Alternatively, we could use it unstably already.

Perhaps the TODO could mention this alternative. Would probably make a
good first issue.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

