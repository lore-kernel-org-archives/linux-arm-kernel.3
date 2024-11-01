Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4A8E6B27C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ql376oc4wnaREcGn5krPx7lcPHscqZvo3JrbE7OYvGc=; b=MSjmmeIjV9fVrsBdMEIl9704tG
	hyvih3iTFju76GHcReqR30pfbclKaGKp4VN2W+6wcN1zuNWH/UogWlvOCWQ+wXngpV7CvIoxuRHhD
	nXmvis6syvdzYNClMz5PLLZyb5EVyuoI3vkeCoCWYBmvgtdrk50qGK7f/5nyJDVot+pqnASPEdHD1
	i0FH6nEqWRSDi7aLpzsq3fRN1BHNtePqZuienl1WqiPsLFl0D9TBbqV98nw9snI0VtXO4VDOkyUub
	eg0qLJCwxIUzuF9tzuecRjKYH2KnDmBcT6ls7i5HUtFuIdIo2WIYtNPOerd0peaFkeNiqWfj2T4p6
	ccvuupTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rm4-00000007BdK-1KiZ;
	Fri, 01 Nov 2024 13:33:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rkO-00000007BFp-02Pc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ql376oc4wnaREcGn5krPx7lcPHscqZvo3JrbE7OYvGc=; b=uSoDTAZ/cIqasDwVtIG+CgRyvi
	viyfU4jVibbVCiECNT+PYWBrfx6BtAIbKed4/gdLYcACo2wsegoX2Q7yizHq+37NvkZUQZBQKbL5d
	LducaW7+attn4I75C/XMCl0SEubk0RtCMp/Y2ugT4hceF0VngTf7QqY3zRPuOJdBxCdI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t6rk3-00Bso8-HF; Fri, 01 Nov 2024 14:31:07 +0100
Date: Fri, 1 Nov 2024 14:31:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lftan.linux@gmail.com
Subject: Re: code From d0f446931dfee7afa9f6ce5b1ac032e4dfa98460 Mon Sep 17
 00:00:00 2001
Message-ID: <38e4fc09-7c88-448b-b9e8-f9a082f1dcf0@lunn.ch>
References: <20241101082336.1552084-1-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101082336.1552084-1-leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_063128_073585_2E021EC4 
X-CRM114-Status: GOOD (  13.08  )
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

On Fri, Nov 01, 2024 at 04:23:33PM +0800, Ley Foon Tan wrote:
> This patch series fixes the bugs in the dwmac4 drivers:
> 
> Patch #1: Fix incorrect _SHIFT and _MASK for MTL_OP_MODE_RTC_* macros.
> Patch #2: Fix bit mask off operation for MTL_OP_MODE_*_MASK.
> Patch #3: Fix Receive Watchdog Timeout (RWT) interrupt handling.
> 
> Changes since v1:
> - Updated CC list from get_maintainers.pl.
> - Removed Fixes tag.

It looks to me that the first two patches really are fixes? The last
patch is just a statistics counter, so probably not a fix?

If this is correct, please spit these into two series. The first two
should target net, and have Fixes: tags. The last patch should target
net-next, and does not need a Fixes: tag.

> - Add more description in cover letter.

The Subject: like of the cover letter could be better.

	Andrew

