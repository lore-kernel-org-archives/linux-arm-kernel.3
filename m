Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6F8C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RB23hZVWmfW7dEWLdxiwSUVQ97nDs6C+WmIGSBZy4Y=; b=011ZXX8MjH+PgN8v6ra3qcm1LL
	RSJLs0Bw0aTlKezXSneY5KOz4zXbmHI2ORHD7oRkC+3H67vUCMk6Jzv4PENBA186nk3PKGS/f2bJ9
	LiBksqWIo69bmDZrlKwp1OLUcQ6ATfrNWRsYKzfahfYkQ4vVuGQpLqMcv5KuBA3uPyTg6J4mxKGKf
	W+xvgEwb2jsk8tMwhGF6D4mIRrc2EGClTBk5x5l4gpdum6zqbFDoJnM/VPhoc0HBETQOCTYNdivbT
	IX1Be9ybhGOQFkmQYUGfmufQrs5QgE0s0KZBFOZaxL2LgNp8jvleHlON3pKMAqROwHOnN3RJBFgZJ
	duvZfZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUj1-0000000FwDc-1JGF;
	Thu, 01 May 2025 14:17:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUh6-0000000FvnX-2eRI;
	Thu, 01 May 2025 14:15:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D73F15C0651;
	Thu,  1 May 2025 14:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD36C4CEED;
	Thu,  1 May 2025 14:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746108919;
	bh=9RB23hZVWmfW7dEWLdxiwSUVQ97nDs6C+WmIGSBZy4Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V/ssFVqdk49GRBYhcetFY4I6sWyAdoddxjRPmVg0ojYMJWkzsBnDeFDtcYmW5Ko/s
	 YTWWfno5dVEnnUY/dJFSWxmGDGbSDF92Ep1olgts5v4enUpN7O+Rts1OqjOERLSi/8
	 4U9KGguVNdbcxZI0iyrNndvAUoNo/DVkyK+vkA6oJNrVFOvWV54qu/l85KQ+IGx/In
	 B8IaDy/A+Fv+ZPB0gxfss9pOeufaG2ZW75g+YEIuLzp/d+hSeNZgAFawPmiQgL+LWV
	 TImnJD39L/speGNK6ZSq4Fzud02QQP1gJm/Zjk8vXEXOjFu9U9E2lkXbaNNYH/t8Uz
	 N7qKusmJETVbg==
Date: Thu, 1 May 2025 07:15:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net v4] net: airoha: Add missing filed to ppe_mbox_data
 struct
Message-ID: <20250501071518.50c92e8c@kernel.org>
In-Reply-To: <20250429-airoha-en7581-fix-ppe_mbox_data-v4-1-d2a8b901dad0@kernel.org>
References: <20250429-airoha-en7581-fix-ppe_mbox_data-v4-1-d2a8b901dad0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_071520_718170_D0937A04 
X-CRM114-Status: UNSURE (   5.79  )
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

On Tue, 29 Apr 2025 16:17:41 +0200 Lorenzo Bianconi wrote:
> Moreover, add __packed attribute to ppe_mbox_data struct definition and
> make the fw layout padding explicit in init_info struct.

Why? everything looks naturally packed now :(
__packed also forces the compiler to assume the data is unaligned AFAIU.
The recommended way to ensure the compiler doesn't insert padding is
to do a compile time assert.

