Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D01CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4FODcYWpseCqjax8d4JOFw59bZ8Jp9P+f5Sb20HMuE=; b=oB10CwvwyUNfNVK7mpQKxWB+qp
	FWAGizvMUbcXSb0hxWTIatphVX6u9A9P2ga3RIhbRL2+ZqKnb7H06IvUcLyZvDDn23E31Kq8jr6NA
	9GUuyRsvu5+eIOFxxJVqu+F9Kz7+fXdwRerpj7ctPpJX+gcHcfzykcN74faE8b/SPDN8yWZJqOWSv
	itvPGvbLAXj4UA4yi23w13tMEtK+9k/7lb32o64LYWnOPTkyGt40srSsD35VXLa+UjBVqhKSMBgE+
	WKrwv61bWnFlCP6OtFULHBEG/ukQookBkEuuW639XV7oH+t/YbSL8yziLgQ1znfsA4wY0ENJrB71J
	mD0jNbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMeN-0000000Cqrb-0wsd;
	Mon, 11 May 2026 09:10:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMeL-0000000CqrU-2ojd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 09:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m4FODcYWpseCqjax8d4JOFw59bZ8Jp9P+f5Sb20HMuE=; b=M6S0HtoHtUi35DH8HYR1QH5Brf
	BJOzvfv5tSma3p3oXwWKuQ134mngAMVXrYZ+ekFS5iaPSPs5751NY8vO6rqvVXHcBXJYOIkajWOrl
	igN3miHfWpLpMMpqFdc6886acPNp1nmtiDlC77Px+3+xv07LfQK/RGKp2+3ymPS7/y8MBDoP4TeTi
	CHpXB+f82j1zuxbflVy1rJXx0d8muBzuWtwtRHKC3zZKqN7W+wuMRlrbpw96Y0lCZdC+E6pZo/GPK
	5plAUOc2Z+2ep/BOnBpenIkjLSR6lDOjdLTGaf2tusDw8+ChBZaAa5idc74U2z9lw7Ds+4ZQllRps
	rR9gepYQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMeA-0000000B7vj-3Ri7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:09:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8472C432E3;
	Mon, 11 May 2026 09:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FA0C2BCB0;
	Mon, 11 May 2026 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778490589;
	bh=pnPO1CrEA1FQe9xDcrN7whB/TUmM3QUmKYvPyURJ78I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=smQLFT2ynutYERKsr/eFczsT1AiyS7PWL5ILAAOFi2DcdHRZyLGrvLSD5pYCnf33V
	 sh2YmSuGMr9hdnPr3W33ycWcAsCKgjbqIPscyZdEDtTJU6E6HweTvyN9eYJY/sJE26
	 OeJULwcO2tzROWxtiv/fuX3wvKdiWXW//6IU2NQDWnTQ/ifVv5gGl4hlzpd0EBFtQ2
	 RG4sJ83xAsShCOsz4b2VDDECW2Ru/xIV8lJ97Sd9WRdqUoKwqRdoTePBPeetnQy/iw
	 o8RP8Y55fGLUC+ucvaqRElII6akzSkrVYHFbzMhe43L39ddHGN2ibhiH1+9UT3PxwB
	 gSEqVcG+6uawQ==
Date: Mon, 11 May 2026 18:09:43 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Christian Schrrefl <chrisi.schrefl@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
Message-ID: <20260511090943.GA1029560@ax162>
References: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
 <agGRnHVTLiwobb9W@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agGRnHVTLiwobb9W@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_100956_924693_B22F18F1 
X-CRM114-Status: GOOD (  22.17  )
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

On Mon, May 11, 2026 at 08:21:48AM +0000, Alice Ryhl wrote:
> On Mon, May 11, 2026 at 05:02:44PM +0900, Nathan Chancellor wrote:
> > When KASAN is enabled, such as with allmodconfig, the build fails when
> > building the Rust code with:
> > 
> >   error: kernel-address sanitizer is not supported for this target
> > 
> >   error: aborting due to 1 previous error
> > 
> >   make[4]: *** [rust/Makefile:654: rust/core.o] Error 1
> > 
> > The arm-unknown-linux-gnueabi target does not support KASAN, so avoid
> > saying Rust is supported when it is enabled.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
> > Link: https://github.com/Rust-for-Linux/linux/issues/1234
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> I would probably suggest moving the conditions out to a separate
> RUSTC_SUPPORTS_ARM config option similar to what I did in commit
> d077242d68a3 ("rust: support for shadow call stack sanitizer").
> 
> This way it will be simpler to adjust this logic when the target obtains
> support for this sanitizer.

Sure, I kept it simple for backporting purposes but I don't mind
breaking out the dependencies into their own symbol, even though it
feels like that could be done when support for the sanitizer is
re-enabled, which would truly mirror what you did. No strong opinion
though, so I will send a v2 after giving some time for other comments.

> Also, we may need the same change for CONFIG_CFI too.

I think the dependencies of HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
prevent RUST from being selected when CFI is enabled for ARM, so I don't
think there is a problem there.

-- 
Cheers,
Nathan

