Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A7A1112243
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqQcTvNUQ2AKRTjj6isrBxzdmhfADGZQTOmZJu03FBc=; b=0dwjAYUqMqfeWy5nVzcU+wmQ9w
	CjcWGo4k6zNmHEPPLDYTZ8gCt3XZacSMn/9h1bmKRxcHlBI84wvnWf4MjC2zVo+Mf+AiSWPL3Jn7v
	Sx8DV/T89xiUZn59IFId6FILco2BTEdAxns4p3nVIiEjJKNxJioZBG0MzM9eYRDPwVWvolvqjni/M
	fft2/ugDJlZp+BI/DLGdTDqEJWWyF2RoifDWMX5rv40834ZzQnY3riRFuA2y3SkqXL9s6B4Xkr1iq
	Hd/S7GIiSv15WPWO6jJ90B6D36pfnluGs4VSednOfT4gkv0l7hq4BNmwQ4ieR1+ffuzVYMTJSBCn8
	ZJPZWghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84YB-0000000GMUr-0wJD;
	Wed, 01 Apr 2026 23:00:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Y3-0000000GMLs-1hOE;
	Wed, 01 Apr 2026 23:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C78161344;
	Wed,  1 Apr 2026 23:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AE7C116C6;
	Wed,  1 Apr 2026 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084430;
	bh=07RYmc68kwWSWXlQHk2byVEKgYJe5lGIx1f5DfAeNR8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=oQYA3r0dixjm9P3ZtxnbQd5Qm7hyROO+WINura1cRHdUPhRA7R3yadcP3RfFPj8/C
	 VxdVfpNuao1M98yeOweVob0wX7hSjpdZnAkdUUSMxxZHq7/Ho4aEEbvHXx2NzbMw+r
	 ngeKEPtWKPoglM5x3QXxyZd2FilyiQMxvUqGET4JqdEgDwemFUKon6+OPpCVN3k1st
	 YYX9c0Fz4JJUjLgctF+IxiuBaFUIVSWCpmCHfBib/EzS1ySslb1waFcGTPEvkZu72B
	 Sc69/XHEhnunRgcEBsXdBvhB/7Bfax8vnWVBXIMvKmUoDyhqrFUDNM1BZwqGd5tGym
	 78v5bJAkafldQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 14/33] rust: bump `bindgen` minimum supported version
 to 0.71.1 (Debian Trixie)
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
In-Reply-To: <20260401114540.30108-15-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-15-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434452.73816.1986421844891352038.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=455; i=tamird@kernel.org;
 h=from:subject:message-id; bh=07RYmc68kwWSWXlQHk2byVEKgYJe5lGIx1f5DfAeNR8=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzuHGq5eNNeDNfy/YX5tXUT8+rxFB1c9WKVtk9V+6
 59d8PcNHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKZa8zDDP/WDMQ2dy+9seaB/Ozs88+d6jkCrt8I5tjybTXZznZ2vacHw38l5SlM
 qh5u4yn6brzm9hmd1kk5d3H3k2ad/9kWHPKKX8gMA
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

On Wed, 01 Apr 2026 13:45:21 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's `bindgen` versions as our minimum
> supported version.
> 
> Debian Trixie was released with `bindgen` 0.71.1, which it still uses
> to this day [2].
> 
> [...]

Acked-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

