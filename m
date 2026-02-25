Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4630F357DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHdWtwcSGCnySeLrzaB8W0fOyrDeMkyOiQKIlOWzO6A=; b=W/7AKdZYcIEdG4zSEKSFt02UN+
	mhQviJdYsOC6bHmOKh+d72cFdbCQggGDe1Q4lqlJb43bopIndjo5Ri4L2/bbWogTGxVe2xzyyCdkF
	ySM0+DZj5vQGyBjwsqkB8olQD1ghi/hP1IoByXxC4tF4DKKQpFzvhLGhh5BDWQqzYtBhgJ3FvyI2q
	uOfVRxDlJtlZ99s8tvjipbwEOwmmrPxg4D9+xSEb950ixGqHKp1C7pn+HbaoPGrIh1PjToV0PiDAX
	0FzWYQ2P0ECMa/fqf85xl4L/dhvE7f6mqFPRLpIlyWhgyBivZZsPlMsdOUNgae4OhfXL6V4RnzVzX
	D5o8VMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBvg-00000003kzN-2IEv;
	Wed, 25 Feb 2026 10:15:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBvf-00000003kz3-0kjC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 10:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HHdWtwcSGCnySeLrzaB8W0fOyrDeMkyOiQKIlOWzO6A=; b=Aczme403M4UyD8txZAehR0yTs6
	yobfp9nNiYrZA/OkjSBbxN42WYKNUmtXHt0XsB6wvVUtHQSbUvYlyhpjA/uTYWMG6ooIbzY40JLqc
	Ldla3u71KHRvi3ISNZwpj5UODLog7HAhA7zTii/DrPCrEG//nPo87EMOJOhgSvVfJjzpQlGX1ywdK
	kzkbIEL1S3gpebT858odm+XIUOpkS5GLf6Ll1BQxs3xV0/eUr+2EohEukz+hYMK7/sIhOySQR6r3O
	mYmp+C2Xl0NgwQ/KWlSjdJtwe54ySqEYEenIDQ+IDr/ExR24falsk2c74miiD7fhxl+LpSRuPyqYj
	agsSivGA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBvc-00000008m4R-0rja
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:15:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2220E43933;
	Wed, 25 Feb 2026 10:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5EEC19423;
	Wed, 25 Feb 2026 10:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772014532;
	bh=la5l3tmm9VgUaAKbSveODFwXjKNCLaluNNlPXBLN8HM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TWrjYKI9tt2sMnNPyFMBbpvE3NgZWgKknoOKEi67iRk5S2NxGftUPKohJHlBwCCnN
	 SJEquZYRQyCSL7WJ/gYD6jByRTuYhF6BxvXNbxEvQKnLeINU4xvGFDpYmuK/4tkUPQ
	 9PRMk6CxdQgtzc2soqUVeNFuwiYcIqtzlpYoyDz8zsDROUgGzvlFrmM97EaqbfvrrA
	 JkNGAQZZtH+4q7gox5Sxjig+e9OSJOf0sS44EUFqkOiNqUvD6g5PJRrF4wr9uKhKCS
	 6ibvy0IfEn7lbHjBuoyysL7Y+ZulICmk68KN+2sLIYg9GNY9wpeuWjBY6Zvdgdea04
	 nfNRdCS/V34zQ==
Date: Wed, 25 Feb 2026 10:15:27 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: fix interrupt coalescing
Message-ID: <aZ7Lv38VkVKNkxIs@horms.kernel.org>
References: <aZ1o2dmfpeiubCik@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ1o2dmfpeiubCik@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_101536_599276_26C440EA 
X-CRM114-Status: GOOD (  17.21  )
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

On Tue, Feb 24, 2026 at 09:01:13AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> While cleaning up the descriptor handling, I noticed that the accounting
> of transmit "packets" for interrupt coalescing was buggy in that it
> takes the difference of the two indexes into the circular list of
> transmit discriptors and merely subtracts one from the other without
> regard for the indexes wrapping.
> 
> This can result in a negative number or very large positive number
> which would have the effect of either reducing tx_q->tx_count_frames
> or making that very large.
> 
> Either way, the result is numerically incorrect, and could trigger
> interrupts or not trigger interrupts when required.
> 
> This series converts stmmac to use the circ_buf helpers, and then fixes
> this problem.
> 
> v2: move build fix to correct patch
> 
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 28 ++++++++---------------
>  1 file changed, 10 insertions(+), 18 deletions(-)

Thanks Russell.

For the series,

Reviewed-by: Simon Horman <horms@kernel.org>

