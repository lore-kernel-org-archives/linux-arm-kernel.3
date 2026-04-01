Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CCB10F6FDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 22:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycjkIWDNkLRP9o7uYN0k5oMtUxpxJcfzGktSWdIlTk8=; b=mM8t2dcY/0tf4LAj0OltiZObdU
	grhY973kcaHi62YndChUVKylBzs707Bsi5McDWR7miilXXCwgZqhiHqRhT8esHGeo/CulxsAktqES
	XHMurNX9Rm2r0pzsqQoOUJy74FHfhqlSEW908aA2Kw4ocAtRC7lH76i3tPabndp2hnQOQCTz5Ssjc
	zQ9cAq1QRuesitNvfol7Oer70H2XIOyVlim67dV5BEZdPLkksdWirW8Pw3UekChaV6N5cG443hS5a
	RX9tgVeQsIuzuFYHxsfgXH8R2MOsK7AV9dmLDQAO+pB049Df8WaonnubxPhzzIUqORPdY3fU6PrWE
	s1DHPanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84X6-0000000GLQO-08bh;
	Wed, 01 Apr 2026 22:59:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84X3-0000000GLPb-27NN;
	Wed, 01 Apr 2026 22:59:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43AFC417AD;
	Wed,  1 Apr 2026 22:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4809DC2BCB5;
	Wed,  1 Apr 2026 22:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084368;
	bh=ARB27mkqWy48zHjSpe5c7mSg7apze9vr4gstNm/P1dA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=dSX2Jo1vUk8hHc6gSekzst2vH2DiO7wZ6u4beWxHN6DVag1hSDpfVxZig8BZqa+bD
	 wHlv9NAlTPwhU/5YXo2CA8Ei6wNqOZ8/nLpYVgOOdYcm1zfBUsWRfpaiKCY4Jps1RG
	 9i6RxukwkTR2YCbr57la6zwGNhonLkn99aq1wPZ7VT2QoMnVwAYowp/1fMO51Re26E
	 TABn3IhQMybvZV8qPytb8kneaw1xNx7b9VeBd7g0EgaLXlXLh82c3onZzwa+NlPG3W
	 hcibdBWYOWEOw90C6j681RTs8g0W7sezYjGQ9+EbN7MxFHn/Bvu+yavZFPq3imqpQK
	 KUt5j6UWP96ig==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 02/33] rust: bump Clippy's MSRV and clean
 `incompatible_msrv` allows
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
In-Reply-To: <20260401114540.30108-3-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-3-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434433.73816.8766024986606345244.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=403; i=tamird@kernel.org;
 h=from:subject:message-id; bh=ARB27mkqWy48zHjSpe5c7mSg7apze9vr4gstNm/P1dA=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzsxPz5uG3k8Tj7ir4KoUcXix9PWt0Ys/8uk0vf3x
 vEzkUmfOiayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEx1UTTD/1L+44y5J4+waIo3pf15Py11ZY+jryrPC2mWBK/kjy84KxgZ2qzvZ/h
 m3M2+YXO9YNu6hUv38i1xFF8vziQ+Vem3T/xmNgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_155929_588953_519C1085 
X-CRM114-Status: UNSURE (   7.16  )
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

On Wed, 01 Apr 2026 13:45:09 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Following the Rust compiler bump, we can now update Clippy's MSRV we
> set in the configuration, which will improve the diagnostics it generates.
> 
> Thus do so and clean a few of the `allow`s that are not needed anymore.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

