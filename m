Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B897E106ACD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrgDY51XL8UxTK09uVYHl3UhjLR8SG7V5Y5sNTGKAHU=; b=E1u17jzlPxQomcPDqkoBqSrPTm
	SgpcN93lxcIfOgOb9wDPpBBsp3Et6f0OANEvUzGGnnFs5si1ML5kJGCkQVAkYkJIzwGjdJlaoWP/C
	8YfWaxqNQRpvL6h44e/wEZc1zYgi6YxGbvSY01E573emWy9QJGXSU2PVNQxsD6+8QoMxF4T3bNezU
	mdrgCeyYWFvMaEkK7M13FCBBQmSrWr581AzolbjEUvg2jMEDKKPrOvzuMfSANiC3+IUrCKfOj+K+T
	1UUs1M9Y/b8SmRQfA/DC650Q8DGtSYAw6fO7L0AKBliN8+JD7ZZRE6mWyVbqGfXNAMlHWLrg46mn+
	Y+7EyGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jm2-0000000Ei0Q-1oon;
	Thu, 12 Mar 2026 17:24:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jm0-0000000Ehzx-0lLl;
	Thu, 12 Mar 2026 17:24:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 570D960054;
	Thu, 12 Mar 2026 17:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D509C4CEF7;
	Thu, 12 Mar 2026 17:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336275;
	bh=jV2J+lJWy8MZOh2+4/7XvcTYDLO+BUIFkgtlrJ53xFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SzPgaMEPUJx4IdFv6/yhBYBUV6GUyrhGm2KB2QnNkDaectWkOkvzjyoJWHxOsCnIc
	 QFTsdXdV5Dt4HJzfv66bH/H4aODSffR/L5JlO/EN+ZMns/HLH+XWgDe3g4JWH4DVUP
	 LYMR8NYY3+huxOXzhL+T1EOXNoCjVPquO5HTPhCHyiUaxGB6/wTYAn+KX130SuoSS7
	 lnATL25Te7C4Cx6rLDSAs1XyvszOEFnhzHj2zXHau/kQo2orMHGW2mUeIetOmLngtq
	 4HVdmQibfBFXgXjYIVkjAJ+FwjLhPBzvpcw7jaR314fT2gMZP937UFWNR/7CJ7sOuq
	 emRHpI5OR1o2A==
Date: Thu, 12 Mar 2026 17:24:30 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: select QDMA block according
 LAN/WAN configuration
Message-ID: <20260312172430.GA1267298@kernel.org>
References: <20260310-airoha-qdma-lan-wan-mode-v1-1-64ec74dea872@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-airoha-qdma-lan-wan-mode-v1-1-64ec74dea872@kernel.org>
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

On Tue, Mar 10, 2026 at 03:46:53PM +0100, Lorenzo Bianconi wrote:
> Select the QDMA block used to send the traffic to host cpu according to
> LAN/WAN port confiugration:
> - QDMA0 is used for LAN devices
> - QDMA1 is used for WAN devices
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

Is this a bug fix?
If so, perhaps it is for net with a fixes tag.

And at any rate, could you add some description of the before and after
behaviour?

