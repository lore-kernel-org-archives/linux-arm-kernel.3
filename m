Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0831112243
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X09WtvhFSSqOeSQEuWQYN+k62tv4Q9cQ4taf1juK8yk=; b=mxdzVlCsbEes0sQITKAPShqv2K
	JqKmpMBRALBWTCD74BOjJbSjwIZPUeRP2oQYBOT/OxEXI5+WRoVgtqaKWEzAWo7j6/i/ESmfpc2zM
	bcaETDO6EJe1ERCBTH0fW9EJiVrTt1POOcon7rd1nuBzlAPQKFXAeGK3/vKZ5pa3mMZxTwxfapqXJ
	zXceyBjMdp0Ky1/zXhVCvjZdvP7/5+iT8a67SGL2qC8y2aK1EFxVw+mH6jfNHKfijPJAXDa4ptARQ
	vOcDco/QfbTPk2ct4Ihq9fNJ8BWQVSbDQdovLCAQ9u+sfcadH18A6MYXFBD2I/QC9zaZgwPW8v9NZ
	ndvBADxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Yb-0000000GN6R-1ye7;
	Wed, 01 Apr 2026 23:01:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84YX-0000000GMxu-1nQS;
	Wed, 01 Apr 2026 23:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=X09WtvhFSSqOeSQEuWQYN+k62tv4Q9cQ4taf1juK8yk=; b=IlDMzqm/DXLOI77FITCszX8hM2
	ailWoHpgkxzxA+3SeG/7MZMZamGFBJfR3EuwF7pNXSO+hZoBhkPLykXgXzhc0sBGJOG8uNOuYFl1U
	k4t7L+gTV2jZ95XoSE6R785rTZshK3Draqhu6mLGJYWQ7kY41FbvGHkdNn5F9QuPqkj+t43rS2x7d
	Mj6Z6e9QVmHUbz7kOfPlNGo5o1TDgkvon1aUXNAzNghh74Rf4KKH7vk/VgGlnZ4a17JRgpye3jWaN
	eE6Zi6OaxlYfI4yp9+cd1XVH2AM8yDGXfIqhK+MKe8ul5xL6ifWymiiy0Oi7vNsRTcqf4uDgzjGzn
	V1y/eM/A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84YU-00000001R99-0wu0;
	Wed, 01 Apr 2026 23:01:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D76CC43B01;
	Wed,  1 Apr 2026 23:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D392CC116C6;
	Wed,  1 Apr 2026 23:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084455;
	bh=GCJ+m0qU3OWvf8YGC9WUklASENVhEYDK1UFFBlA2558=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=VGUfyfMiDFro7/uFCZk7gIzpuLEFoMi414OG2wChlCCGtsxshR5yceynwR439I/vO
	 cAl7uJM6Ctf8MVwxaNpGL9jj+iwgQVBFL49YsIP/nIwL4X+3x3fJ0lXA2W8UM8AQFm
	 z9k4Ltwvlw8Osrik0sYvSd33MJoCmf+05cT6M5pG0Fw6RdgHESMnM/gk4TspBo49N0
	 PZmExtBPw6ZankuYb+RIkJv4/yr0ckhVKDxfZzQhr4KxaC73FUgIv/J26zkojU/cAj
	 rh1oIOQ0Mg3ZueCrfGcYBdWyLquc3npSfNBy+qf/cLrOMq2r2xqkgn4POnjnU7EJl0
	 CnPA7eivQYrVA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 19/33] rust: kbuild: remove "`try` keyword" workaround
 for `bindgen` < 0.59.2
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
In-Reply-To: <20260401114540.30108-20-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-20-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434457.73816.12576716090516353619.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=350; i=tamird@kernel.org;
 h=from:subject:message-id; bh=GCJ+m0qU3OWvf8YGC9WUklASENVhEYDK1UFFBlA2558=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7tUrk+ZNCF5VrPNBh+HGPO3C9fF8vX4Tsq3TLtdm
 Rj/2y2zYyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFTvMWZkOBj9QMm5dl7nVb7Nr2x17v/R/lv1oiHh1xmtr6/c+r49ucDI8LHy+h6
 fJo+udQoGOWb2SqWM/zfdcX3JsPPAk2yWlW8ZGAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_000058_645573_8E8E32C4 
X-CRM114-Status: UNSURE (   7.04  )
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

On Wed, 01 Apr 2026 13:45:26 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> There is a workaround that has not been needed, even already after commit
> 08ab786556ff ("rust: bindgen: upgrade to 0.65.1"), but it does not hurt.
> 
> Thus remove it.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

