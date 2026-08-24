Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6FCC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 05:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPYHB14yRGrkL6FsbljVADpzKAdVSzClNWD119Unhuo=; b=dLRN+zOAsycAGRLSvo/0UVK/52
	Df3lD0bV0uzSGzZOrkrJ/5odiXfeOwGf1unwdYKR2nhsIkucxTR544VA1eeGISIrKAs4fCLzrSs+z
	fe5+4a6/vQpQqwTWRYQ7gmtcO+njN/ck1U3s2v/HFjxGhboXd/6GF08BhdyRDUwff7l3L+7ziEA7L
	f1zJ9n04xS5cFFfIrXDKxlGM9N/EkG11Bk7NTNc9z2l5p9Qi2u9udnsQ8QYlACxdlVVPAY1i7SQ1p
	p9lWXmUmJTFHpqEmaLFIfKackKH9FpfSpyzhp6jus9Ju6hLwrhdXv9ntBYOremXRs5wXcV6vVIt4D
	faE3Cltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyMxT-0000000FveZ-1w7r;
	Mon, 24 Aug 2026 05:10:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyMxS-0000000FveR-1B8X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 05:10:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27837600C8;
	Mon, 24 Aug 2026 05:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5427D1F000E9;
	Mon, 24 Aug 2026 05:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787548252;
	bh=bPYHB14yRGrkL6FsbljVADpzKAdVSzClNWD119Unhuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HSQ2RtQIm4l5t1bmXrtJY3EyQoLgzUp9eLOp4AXv4hFX00A/e7WJgfxzQdxJ4ozKo
	 +PnPDXufMWw4eHFG3+fmyPlOXKF2GqoVypk2wNj4ukuDcwpQbbgT/t45JOVVrOZGq9
	 E+YAIcE/XWVmO1sSokCqpNyWX0Cmra7ssHghmPrc=
Date: Mon, 24 Aug 2026 07:10:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chhabilal Dangal <yogeshdangal66@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk, rafael@kernel.org, pavel@kernel.org,
	lenb@kernel.org, dakr@kernel.org
Subject: Re: [PATCH] treewide: Fix typos in comments
Message-ID: <2026082428-stadium-coconut-057c@gregkh>
References: <20260824033107.347011-1-yogeshdangal66@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824033107.347011-1-yogeshdangal66@gmail.com>
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

On Mon, Aug 24, 2026 at 09:16:07AM +0545, Chhabilal Dangal wrote:
> Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
> ---
>  arch/arm/kernel/cpuidle.c      | 2 +-
>  drivers/base/power/clock_ops.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Please break patches up into one-per-subsystem, and provide a valid
changelog text.

thanks,

greg k-h

