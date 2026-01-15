Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3D9D46605
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kDi0Nl3A+slky2xKqNT3JRyrF+r1xn6UkkHjegXuiw=; b=lYapWJeRXc33dnt2G+zJ3BfXtS
	lOka2+CPP6clIDX+h21kDci2Un1zoKL1UZc97sKnQZP4hEzwO35kyWi9PJmE6jG2MAxC+FKKieL34
	23RLOkqrr5kVtPhS/02in77BTlbBAUQfR5ACCsECnKcNJ30aHZ+Rek/S6cGHk3rgQ3lAJroF5sRcz
	sj+8Ao6Cbn3idgLVRcrNut1BsXO/DHWlGIRFPWcctzLs58lBeYzkNYhTveSjqzNoZAXP7Y2xVmW59
	GjdbMFyJPYeEl2ZZl+/NWMlpSMX4HReJ46kSEBhCn4+xHIY3vMJ87HKbiW+Yu6XUIhKkkRDeVWS8G
	qcvsJRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRM4-0000000Crw0-0Kyo;
	Thu, 15 Jan 2026 17:41:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRM2-0000000CrvC-0x1R;
	Thu, 15 Jan 2026 17:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+kDi0Nl3A+slky2xKqNT3JRyrF+r1xn6UkkHjegXuiw=; b=CbsUxWnatxSQjbieGBw08x9PxE
	oq3z3oR4bitdTyXDbS8VOFY86Uzf2NksTtTUqWX8gpKqAOMbTplPjvC+NFbsMw13y5o5XahFqPXmT
	QuDVSYVQukaQuaPwJoApwSiD3K4GXnX0SOwPlYf8Y9CHBF9BgGzCPp3+RECaCaqNvlkY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vgRLv-002xwl-OO; Thu, 15 Jan 2026 18:41:47 +0100
Date: Thu, 15 Jan 2026 18:41:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sayantan Nandy <sayantann11@gmail.com>
Cc: lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	sayantan.nandy@airoha.com, bread.hsu@airoha.com,
	kuldeep.malik@airoha.com, aniket.negi@airoha.com,
	rajeev.kumar@airoha.com
Subject: Re: [PATCH] net: airoha_eth: increase max mtu to 9220 for DSA jumbo
 frames
Message-ID: <e86cea28-1495-4b1a-83f1-3b0f1899b85f@lunn.ch>
References: <20260115084837.52307-1-sayantann11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115084837.52307-1-sayantann11@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_094154_263153_E33B7745 
X-CRM114-Status: UNSURE (   6.65  )
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

On Thu, Jan 15, 2026 at 02:18:37PM +0530, Sayantan Nandy wrote:
> The Industry standard for jumbo frame MTU is 9216 bytes. When using DSA
> sub-system, an extra 4 byte tag is added to each frame. To allow users
> to set the standard 9216-byte MTU via ifconfig,increase AIROHA_MAX_MTU
> to 9220 bytes (9216+4).

What does the hardware actually support? Is 9220 the real limit? 10K?
16K?

	Andrew

