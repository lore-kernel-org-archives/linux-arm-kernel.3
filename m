Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C89C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIjS9piUmE57cYRXDTfna1Rukyb5JMZSPthrMyRy+dI=; b=IeHrNeXkst21MUHkBkS3Ofy8+P
	pYsESjji6nSUiSW8yC7Rabu5z/r5RBoeePOlSUcB20jMwzcIHSeLKyGftp2Z9c120pFerCAKesM2u
	Wb3taZoWB6TWJToeiZ3FZzaLGISPkT+UQyv0zzTsXfIMu+B13AT1BHlnOqpMuqfvkrNXS/LP5RiTu
	INNceSve8/w1zkjaIM91MVWaBOcS+nFzjtxLDYUAl//ey12q1uzSo1r4LMnHBpM8ftVhqxZpSifjg
	vsbpRPtiURoXDzdLQXEhm2WG6WP4SZ8UAsVQZpSIDjzI7ZRdNBWWNklMXA1V5OSOFvKzBawXDl55t
	hTfU2ZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgoo-00000002AKF-09VT;
	Fri, 17 Jul 2026 11:33:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgom-00000002AJS-1RMQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 11:33:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92C0560A5E;
	Fri, 17 Jul 2026 11:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546FB1F00A3A;
	Fri, 17 Jul 2026 11:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784288003;
	bh=eIjS9piUmE57cYRXDTfna1Rukyb5JMZSPthrMyRy+dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iq42tPbOoZtO6nh+GKjVtUHfeIfHZK1bmON1BBNXij/itmb7LzRjjBIJY8GKdmjGP
	 1JUZugohNu6nNjBQ3aato7NA94Hnl1Fngrs2kPfUVZvhy5/RcJ/q+HaW0sxbVW5SWH
	 sb60zNG2UeU5cBwkdVxIJrxNQrz4rO88mC/vlk/zLOnm+uZ0JY+NoeqUn2ugpYXilx
	 vw5TXrxruuDeqeUtA8m/+nR4R2eIyXaEMGkeji5naXwDFnkHgRtqN0TrY05ZeiAg3l
	 P1wpDK2SXbmf9z22nXHLmBPsM6BXwmw/RJpng9h+X66d5J+c9Eil+Rs5SFgny6uA1C
	 1/oEcd/H4t+0g==
Date: Fri, 17 Jul 2026 12:33:17 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	maz@kernel.org, oupton@kernel.org, hch@infradead.org,
	jgg@nvidia.com
Subject: Re: [RFC PATCH v1 0/8] Arm Core Local Accelerator Driver
Message-ID: <aloS_T3LQvpHeZUV@willie-the-truck>
References: <20260717104759.123203-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717104759.123203-1-ryan.roberts@arm.com>
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

Hi Ryan,

I haven't bothered to look at the code (looks like Sashiko is having fun
with that), but I'm going to jump at this bit:

On Fri, Jul 17, 2026 at 11:47:44AM +0100, Ryan Roberts wrote:
> * User space availability: The kernel driver exposes the capabilities of the
>   hardware to user space. Arm plans to open source a user space driver, but does
>   not yet have any committed date. I'd like to understand if the availability of
>   this component will be a prerequisite for upstream acceptance of the kernel
>   driver; either way, I'm hoping we can at least progress with some discussion
>   in its absence.

From my perspective, I'm not particularly interested in having code in
the upstream kernel tree that we can't meaningfully exercise or benefit
from. I also think that the incentive for Arm to open source the
user-space driver practically disappears if we merge the kernel part
first. So, at the moment, this just looks like a burden to me, especially
as it appears to create a brand new, device-specific UAPI for what is
ostensibly a form of SVA - something which the community is actively
working on already.

Relatedly, is there a spec and/or fastmodel/qemu (sorry...) support for
this?

> I'm deliberately constraining the scope to bare-metal support for now.
> Virtualization is something we are considering (and have prototyped), but plan
> to post a separate RFC for that as follow-up, once we have agreement on
> direction for the bare-metal driver.

I'd actually like to see what the virtualisation part looks like first
because doing it as a bolt-on later feels like the wrong approach. The
structure you have at the moment is remarkably clean, given the
architectural/CPU interactions (this thing even apparently builds as a
module, nice!), but I'm unsure how far you can push the separation once
you need to start hacking at KVM. Maybe the MMU notifiers are enough,
but I can't tell.

Will

