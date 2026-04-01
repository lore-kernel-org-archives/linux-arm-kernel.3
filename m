Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AC91112242
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ICEHfr7jh2gyGpsPbfQ3IyiJ+7yZl3qgU05PRwJ7RE=; b=qFKIRReJvMnoAx3nbnOFpZbCzi
	29R0jI6kfHBENRVcSdKvWLDAWXCIwpu2oNlwa8GbmEVLKHCGEcysuWn4+ASnSqUmzObjnQBBxzjd3
	42UiUasnmXFHW0nf0uuOV06f6+Wu8aPYfbJ9vHSHpvZrzT2EaNAnFzND+yaHEWCfXczJIRbVS0E7N
	E1IUH0tYrqHUgR/RAe8yzqmsePYT0E5EhvXx7zcbq9PDRLi1pYB5/dAx9ojQFjs4keTPRgIfA9R7v
	89OklXQkhMnksoH7D1CS7bEbALKlWQ2Pki5+HEERXrL35e3LWqfjsRWDiWE5zO9f1UPxgAu2MdwUl
	I7irQiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Yf-0000000GNFY-0Kla;
	Wed, 01 Apr 2026 23:01:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Yd-0000000GN9v-2Bf6;
	Wed, 01 Apr 2026 23:01:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F3C36184C;
	Wed,  1 Apr 2026 23:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B37C2BC9E;
	Wed,  1 Apr 2026 23:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084466;
	bh=LzgaJ83Rv9pU4dQmi5pVMrmBrHvBC5e78go2tjHZcUw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=nUrzfe8NhDQtpCvFinZVfgnt+tjQMOtFRIGAge4DLGYxrMoQoEQ86XmqX8MSuc5Ud
	 txs3xwHIDwocyZXQNb8jfz80mh53Jd3wusB05jFNLe2fZYgGPLD3nUtGFreumspUTm
	 IAjMDmuiHUSjuwSg00b5B+WSMN62p00RXD9mocBhaqNA3Z+o7B4jWYwGDTUpQeGfbU
	 PfL9deFZ1hdxZ037QHqHZwJAwprww4p/wwBhY1w9e1tRkHHwxiuYOLMQPqidV4AVLZ
	 uqzeLbgTQ+ENe3R61hPcesdN9JHCGklBcMT6RDuu6hjy6GsrjpcDvSx2HJMRbK4sqB
	 EqCJGUn9bUPPg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 21/33] gpu: nova-core: bindings: remove unneeded
 `cfg_attr`
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
In-Reply-To: <20260401114540.30108-22-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-22-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434461.73816.5410904852576871478.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=497; i=tamird@kernel.org;
 h=from:subject:message-id; bh=LzgaJ83Rv9pU4dQmi5pVMrmBrHvBC5e78go2tjHZcUw=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7tI1RtVf7/3VF2vMEx1i8aDGZv9ug9+b7OYN+Fqj
 7LpjPMnOiayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEz10/cM/yP3ruBYcveqWSf7c9aSQN+rd7vL/k1+czI4vmvCx2fH6/IYGQ4vurz
 s3Km+wk3Xq9Kzd2z6cj3qyOaHxU6TS+sf5DBwT2AAAA==
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

On Wed, 01 Apr 2026 13:45:28 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> These were likely copied from the `bindings` and `uapi` crates, but are
> unneeded since there are no `cfg(test)`s in the bindings.
> 
> In addition, the issue that triggered the addition in those crates
> originally is also fixed in `bindgen` (please see the previous commit).
> 
> Thus remove them.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

