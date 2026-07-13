Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A545CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXQnTwBPub3tZDUV3lE7n/0kdw8aNXe/OrgkdMgIWss=; b=ksJN6UWOuXxN5vOSfHXL6v4/D/
	xNDnJ8fSqIxWHcT8iN8FJLBxcUFNOCm2SUvq8d/yATOIr1rDzaFBRFu4v8zlnQDEGnBLSL+MUS8eh
	xNDTktq6GfUlYQlqQcqkXb0/2Kn2tGBNN7L5wPHe3RGTdPDXxNdPwCEf4nt3IDkNcpoFPR8SK+eNP
	BtkQq/BqdBxVgNLZtY0r3y7G+HcmUFIB9V4Gbd81H/1rDGszN/KgW2RZPyG//lThz58QO0i1AxmaB
	U717CB3hZqRkH5yHszbNttugw9lVDvr22GjGnStkdR/0BLl4w1f9oW55DZSKeggpiuh/oe9OQvX8w
	d0Bwv35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGNy-00000009KFD-146Q;
	Mon, 13 Jul 2026 13:07:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGNw-00000009KEl-1XD8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:07:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7C16437CE;
	Mon, 13 Jul 2026 13:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D30F1F00A3D;
	Mon, 13 Jul 2026 13:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948067;
	bh=kXQnTwBPub3tZDUV3lE7n/0kdw8aNXe/OrgkdMgIWss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M6WsI97x0WTAWfxR3KXWh9Utq+r9um1NRRAO4gUwOERZBkLePwAAszdV6RYGWd7RV
	 +GUZ6+s/4IFenPdHEgtOuSZaWu1zexnaqtBQ9rNpkPj4dQ/azMsiskt9R2rkXIpiwO
	 U9MSPRqaaVLtSVTffHNFxadDfVgQFogfJBZ6ikjx72rWfHBHJqQ9fXYnST9pD26a1L
	 aTKGHKrQB1MHm2r0WQdku6WYSh4P3NPyF3Asg0gLr7bRTHf996+1SxZ1Lm3W1y0TCJ
	 rBKyMAKxCMh5lgwcp/hkHlX8Jli69z+gP4qguXLv5HvPylT2D8Fv7p6S0uMmLx5WW+
	 NMAh5Kt/NVtFw==
Date: Mon, 13 Jul 2026 09:07:45 -0400
From: Eric Biggers <ebiggers@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: demiobenour@gmail.com, Russell King <linux@armlinux.org.uk>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
Message-ID: <20260713130745.GA2254@quark>
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <2026071312-uncover-refining-8cac@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026071312-uncover-refining-8cac@gregkh>
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

On Mon, Jul 13, 2026 at 06:47:07AM +0200, Greg KH wrote:
> On Sun, Jul 12, 2026 at 05:31:31PM -0400, Demi Marie Obenour via B4 Relay wrote:
> > From: Demi Marie Obenour <demiobenour@gmail.com>
> > 
> > This driver is harmful:
> > 
> > - It is much slower than the CPU [1] [2].
> > - It Has a history of bugs [2] [3].
> > - It does not have exclusive access to the hardware [4], causing races
> >   with the secure world.
> > - It register its implementations with too low a cra_priority for them
> >   to be actually used [5].
> > 
> > Therefore, disable it to ensure that nobody builds it into kernels they
> > intend to ship.
> > 
> > In the future, the driver will be used for processing restricted media
> > content.  However, the kernel does not currently support this.  Since
> > the driver will have future uses, allow building it if COMPILE_TEST is
> > enabled.
> 
> Why not just delete it now, and then bring it back when it is needed in
> the future?  Otherwise this will just trip up the static code checkers
> who will attempt to "fix" things in it.

That makes sense to me, but Qualcomm pushed back on deletion:
https://lore.kernel.org/linux-crypto/20260602-qcom-qce-broken-v1-1-a4ef756089e0@oss.qualcomm.com/

But I've still not seen any evidence that this driver is useful for
anything or has any users.  Even Qualcomm seems to be unwilling to make
such claims; they only claim that the IP is used (i.e., not in Linux)
and that new features are planned.

- Eric

