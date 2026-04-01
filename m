Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2673A1112240
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47sRE1kKCmZOZ4W4SDwR0gmUerxGrjYv2X9oj+Vbe6Y=; b=drH41q187bjHw/KaAY6eppEDod
	bdVv+zWolXBj0OXgBAJ85abQsGuwmY8O7tBEBtO+MEw8D+tWXgeH7nvtEHrc5WqFuPkPnzHxtW1HH
	yx8fXzys0+zfKVC2tsDc9FB4V9aIalILDXxjDbwjmuUpyg3rrxyes5XLB+Sqn8yG0PpNTBwIumvGP
	YhY/2cYLm/F893MiVgXmV6LvXlh43eA8pgsZY82yTxtogTvLp0TpaOmWxlqVhLA0E19gV0igd8jak
	yDlh0W+UM55rfIWWw1pWMnlW9Jtn661MnDYHlT5AXkk9kwuTPQCAvyXAACIaZEvsY//Ryfyrw+Ult
	x7s8IBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84ZR-0000000GOjF-1vYh;
	Wed, 01 Apr 2026 23:01:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84ZO-0000000GObV-01pz;
	Wed, 01 Apr 2026 23:01:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA4876013C;
	Wed,  1 Apr 2026 23:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D958C2BCAF;
	Wed,  1 Apr 2026 23:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084512;
	bh=pT3fRZPxRDVeDTtEQDcA2yLNaqBibDOYIX+RSrWx+6c=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=HRpEXoD2fr43/O8oOw7BnQpzbgNTTKt13/LphFJTmDRt47lowOmKMqgKZf1EyurLh
	 Juyq3az4nx5yhXVVvxFSJdSNxsPnvCX1bacVn+R/Jmh2EPFBr4GeyN1ixsPNSuja+V
	 anihbcyDwxdhN9WIZGh8PaJwUuNCmhyiJwXEU7hWFUTibJAvlIazUJgn843DWK+LGI
	 O1T6nSiSg4TQs4AxeLN1ZJ3qZgHsYA5GzbVZb3NUx6M0+ruc8u89MqSegxNn9U31Hd
	 w+NcF1ObZO/RQr5vxdbkjkOVjdZiSZm5f2Jx6x1F9jxOw71VfnqbMNFspMlm1WA+Gp
	 4iy9cUHXZaM8Q==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 30/33] docs: rust: general-information: use real
 example
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
In-Reply-To: <20260401114540.30108-31-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-31-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434472.73816.3192882539134262252.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=436; i=tamird@kernel.org;
 h=from:subject:message-id; bh=pT3fRZPxRDVeDTtEQDcA2yLNaqBibDOYIX+RSrWx+6c=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7suMfh24P7byakrnK9P/3ojrP6ZSp5QrCXjo8CCw
 9o5twyOdUxkYRDjYrAUU2RJFD20Nz319h7ZzHfHYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdAx1jBi5OAZjqBw8YGW48vTAjw4H39p+pqxu1q2Tn8sRedspSfinPbplbsohnQh8jQ7u/0YK
 3AitsZotJrb8kbcq9rPH1sbnSitv0m96lSW2J5QAA
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

On Wed, 01 Apr 2026 13:45:37 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Currently the example in the documentation shows a version-based name
> for the Kconfig example:
> 
>     RUSTC_VERSION_MIN_107900
> 
> The reason behind it was to possibly avoid repetition in case several
> features used the same minimum.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

