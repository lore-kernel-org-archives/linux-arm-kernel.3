Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82018CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7McbWVv24hbVXXWdY7e/Mz3sweQWrmbU/20janHkOY=; b=e+VYB/DV4TmeOp2GJL11kTxcUX
	XAQwP2nif1/TIwx9cN75mUEPL4gtgq+1ROevs76W0SMpGVOrS+/XuywcyZIMde8QgxnsYnm2ay+qu
	kSjbo8UZ/5c45ElQcK4n6AUw8E7oATkxkW8K9M2CQY2skS5r9Nfl9PX2+Yulw1961T0Rh7CQYKico
	ActQmJV0UNQzgCrxZdV4tj2t/CEtI3FwqnN/Eiy+cIN3hmcyhvWTnhplw/Dky0WqRJyTnOyjU3i1B
	YQ7BkOZMAslzv5l93y1CQtxXMJpfH6ezUdQxTZo+iYt/OShxE9Y4ky8uK3Ao+Q7f4rWtGn7uXPtKo
	09VRvheg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEFu-00000008Xb0-1ZTK;
	Thu, 01 Oct 2026 10:43:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEFt-00000008XaO-15ej
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 10:43:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2A884124D;
	Thu,  1 Oct 2026 10:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693A41F00898;
	Thu,  1 Oct 2026 10:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790851392;
	bh=F7McbWVv24hbVXXWdY7e/Mz3sweQWrmbU/20janHkOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bWAVjI8ZtQTE9fpxT8l9TrbHTRD752W6t9b99PGB5bWzCiNRxC6ddJKm7nKEM38b0
	 x86U2VjnL0roddtgg/xHKsrQobjN2n9tyHzDwF/DFxSU89KA95KGt633uQjc2ZTsnU
	 cPTlBTN/d06dDqfUqktPeIENTFqqIdgJtqSHq2kWzNmOrI0mGqvaG1tbJAIx4WSBuj
	 q2YeHdSTmJyQ9E/iccCclzSjvCwGY6/JEkjd3S/Ow4WYV3xwT2TCUQvCg5xelAfzv1
	 RvFifjUDfQYsD87lfnJKjNN6AfBf6SOsRhK9/QhL5WCPtlzN4ORu7VcyMmfei+hcDX
	 hmzN9AE+94akg==
Date: Thu, 1 Oct 2026 12:43:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Renesas driver updates for v7.4
Message-ID: <20261001-responsible-acoustic-capuchin-23bfbf@quoll>
References: <cover.1789722868.git.geert+renesas@glider.be>
 <cover.1789722872.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1789722872.git.geert+renesas@glider.be>
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

On Fri, Sep 18, 2026 at 11:37:04AM +0200, Geert Uytterhoeven wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.4-tag1
> 
> for you to fetch changes up to 10eeafc3e90ebbe6627a7d471b86af889d7b07e5:
> 
>   soc: renesas: rcar-rst: Add support for RZ/G2M v3.0 (2026-09-07 10:53:31 +0200)
> 
> ----------------------------------------------------------------
> Renesas driver updates for v7.4
> 
>   - Register the SYSC power sequencer on RZ/G2L,
>   - Add hwspinlock support for R-Car V4H, V4M, and X5H,
>   - Add initial support for RZ/G2M v3.0,
>   - Miscellaneous fixes and improvements.
> 
> Thanks for pulling!

Thanks, applied

Best regards,
Krzysztof


