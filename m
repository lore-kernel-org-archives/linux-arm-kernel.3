Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ADBFA3755
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 22:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ezZ9mM385EXZuF1meXZ80vdGksSt5h7S+r+YXpZKaw=; b=l6qb7vpVC1hSLqbkP26FXJ5ED3
	qO/KWRB3Xj3SpPbLtP5NBEaUOYiMSDUlJKJV3NArrdnwOIScQnTkXgjhDPQ61bYWBV/Iz0aw21TvM
	LDy+gfY+S6ppqxlTyMCGjpXTCB9gyphGU6TksiLhZ1d6WPMVkc4zvs7sbUYMljFqHpiSzkhCWGevh
	B4pW4rPorS9L5qMXQQLzm0mh3S2pfAb5QVIQigEVuhqDBQZlHvWwJQYzzm7rEgiOUIy9rHIUgJ3+C
	uvISFvtK78OYb02sXjbIV1bsUCTcGjIbXstEfB3xeMifBWQ5nQb0baysFQXhlACjlGJplvCakNWWL
	AT082gGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbnYa-00000008kss-0wC8;
	Fri, 02 Jan 2026 22:23:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbnYY-00000008ksG-1Tu2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 22:23:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95B3E4012B;
	Fri,  2 Jan 2026 22:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBA7C116C6;
	Fri,  2 Jan 2026 22:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767392617;
	bh=uzQyOyokFsE6aLeCdVWXJuUpnoo7D0b+1LEL1vfIjXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNyIdUD4CJS9cYLvocEgJxn+Xw8qnh+4+dOb62w3XxLXxfevtHNgkrTAULkSvU2EU
	 E25zaOTcVxIWXafJEfMmR42O5rc0rQ+6b6Nvi4o3PzpNbbv9+6V/3rCMHC5rl52rDH
	 smiwXFilSlIu/eAGht6RF/cXP44pDiaeJ3mGWsmUKhYrcauFBANFUGM9udIzHJR7j4
	 0K7P4x84NdfKtugFzeGNVEtpvzIt+tl0N0HrkLIaoWBbtvZYc7HKptDkJshYJJqpb4
	 tbWlNvIIKY1irizfcfVqd8x79fLiMq50kkOtse6SiqFG3ftHkbaP1qBNUf725lutuG
	 DhFx3aXsQI88Q==
Date: Fri, 2 Jan 2026 16:23:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [PATCH 1/5] dt-bindings: mfd: nxp: Add NXP LPC32xx System
 Control Block
Message-ID: <176739261569.281828.199653070024602694.robh@kernel.org>
References: <20251231215754.2222308-1-vz@mleia.com>
 <20251231215754.2222308-2-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231215754.2222308-2-vz@mleia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_142338_417845_4B7F1A2E 
X-CRM114-Status: GOOD (  10.54  )
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


On Wed, 31 Dec 2025 23:57:50 +0200, Vladimir Zapolskiy wrote:
> NXP LPC32xx SoC series contains a System Control Block, which serves for
> a multitude of purposes including clock and power management, DMA muxing,
> storing SoC unique ID etc.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
>  .../bindings/mfd/nxp,lpc3220-scb.yaml         | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,lpc3220-scb.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


