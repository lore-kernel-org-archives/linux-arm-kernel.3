Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09AECA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCAoLYZlSrLohEk+mBrzJi43HvKosm2TxiN/tMhp9/s=; b=u6wJjx9QbRoDPcUEJQemClxo3n
	qFJrMbz/9gEKnGG4jFc6purwgUewHwRc19t2kujFE0+ymPohOwHtzNyvM4UC9cZYh3l1ucP5TpZP4
	TAbbK5prlcBtiVzVj6JBjuskld/fecTQfwFB02U88KxuSycCDyBqss3ZmyXCSrhccJ9ErOsijgysb
	Kmr1yr5JZw8bdm3aXnyuVKg5yKitr4+0lBvQ9SbRCWPU+JeL6dYauDAFe9fV4bne6tikYUs3oivRv
	lZddf3a56RyrXAAs1jeDji9VXNu7E2MU+CRmQN0Fy24YCRv8mqxW/DWWDiIC9jGz3N/jQuYqcfWit
	FCYwLxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2jk-00000000Z0Q-1Xup;
	Tue, 06 Oct 2026 10:49:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2jj-00000000Z0G-2y01
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:49:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D50686022A;
	Tue,  6 Oct 2026 10:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BCC1F000FF;
	Tue,  6 Oct 2026 10:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791283770;
	bh=ZCAoLYZlSrLohEk+mBrzJi43HvKosm2TxiN/tMhp9/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XXh1lGT4lAdzVzC9sthFc2IhYCZDwTBHi/HjnSx15D6rngrynGv8/GTL+2vYzATBj
	 Mv4G6fC5pB/jeydkk8H/HEDiA81zvt8TIx9t9NECy0iamrh54HTyIMos2/hRAb0yWm
	 Yw5FWLb0xbhztFALNihOtH+Al+Gy6WUWXYTS3hZRZ+mrrO5Jl0T3sUgv5R5Fl5mJhQ
	 jzkLsU4zFsmBUDiIty5971jNuCw/DfCxeBm7mUsg7eMNjj3axtZJWC3luDVWirguXG
	 ZTJ3Yj3lecQh55xMhSMGWVeJb52fpUl8XayiBmSMP9gxoUnQKviNPX8j7wisGaQziF
	 F2ieaPs5jadYw==
From: netdev-bot+sinfo@kernel.org
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v5 0/3] net: stmmac: Introduce hw queue priority offload
Date: Tue, 06 Oct 2026 10:49:29 +0000
Message-ID: <179128376932.2231598.7510820392039419594@kernel.org>
In-Reply-To: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
References: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

