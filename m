Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79431112240
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXoWjhNWX61pwwnJ+eYjEPWLqscltSWXSgxA/o26Q0Y=; b=It+UBuvc7ZbylI3VVUF+nueJvI
	4gf1U7eCjTWF6f0AkDVDPV8J4h1gyl3t+qI3JjbFGBNmBmQUa5xhzucHpeeAcT6hRUXI4r3IAYNpb
	Gakm2Ex1JYmxNxsQZ5anh8ZF+tR3coTns4z0adsqdKB7Ov4RWBfyxcBH/GvsrYu6SMBVKP+tIcFRU
	qQIxUg+yXbvf7wPy1pF2jNAIQB5hc0jzu8ypEoAwq3seo/IywfRldWNgFLbmhKiYLJPYj4pwcd0Af
	HDRnQvuOijr2YtO7p1iJTIj5HdWoo1YE/jUVMsveWn2xoxPLyMAKEaxBnPzahijCUOt6GvTylYgiR
	aoOyjedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Yc-0000000GN8w-2fR4;
	Wed, 01 Apr 2026 23:01:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84YY-0000000GN0T-1jZx;
	Wed, 01 Apr 2026 23:01:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E5FA6184D;
	Wed,  1 Apr 2026 23:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C13C2BCAF;
	Wed,  1 Apr 2026 23:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084461;
	bh=1OJuineu8PClHjPsG3fYTbGnqTeEga0zV2kTfSmawb4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=dTmUdMFxsYkxPmis09F9SPtnKde28cmwByv3QEYGqto19XeOKoBzECtJ/lACxN34o
	 88cXDP+3MbErZiAQc5mmtQiNg1UibFr5dZcsHtaVz7SACwXHa0Hz4qkUtgQ6Yj+mPJ
	 na3+ajNfZzKUWCzK7omgbHWSsEQLkWDQzNS0oDSRq40Fkh/Q3f8cakwVWBCC/hkOMN
	 lFx1nv4C5gF/8FZsKBZaRqQIaPHAqv/Ph8wIC9QGk4mAiJWsfqXJc5ra05aJUvmSG2
	 HkdNeJ7zsD0cgvxHfL7v26+nTHRtEd/OY/QYivMFyvEYSqf6Eastw5n6akb7nFjP3+
	 hpnbteA57SHZA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 20/33] rust: kbuild: remove unneeded old `allow`s for
 generated layout tests
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
In-Reply-To: <20260401114540.30108-21-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-21-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434460.73816.4231801886718165891.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=536; i=tamird@kernel.org;
 h=from:subject:message-id; bh=1OJuineu8PClHjPsG3fYTbGnqTeEga0zV2kTfSmawb4=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7v8ELVZvm0Ot+b2nHSn4DXRbVG6lwIVBPeIfpVdF
 WNTtDGsYyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFTPOM7I8CSkokjo+uZ/i/c/aufXnXUv/2TrD5PYeo0MiXjP+Nj5kxgZ3u/emnr
 vtdKxsy1q5tqh4RX8Ap/yk8PKcre53zn59dIRPgA=
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

On Wed, 01 Apr 2026 13:45:27 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> The issue that required `allow`s for `cfg(test)` code generated by
> `bindgen` for layout testing was fixed back in `bindgen` 0.60.0 [1],
> so it could have been removed even before the version bump, but it does
> not hurt.

How about ordering this, the previous patch, and the next patch ahead of
the version bump to avoid the need to mention it here?

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

