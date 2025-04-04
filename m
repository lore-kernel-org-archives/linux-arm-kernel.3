Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E681EC36014
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++TCjv915iBIQoPpStKpBquKs+Hqi13HB7uA8GAmQf8=; b=G5wP9q3brUH44Kf9L2KNekEjDU
	8iyn/jvPEp+gMhJcNF4ZUKqzc+nqCdNAubn3VciydnVsODuvjxQD70ywkH4l5EHnRDMo/K4fiS131
	Ftes9XJiEmu5bWmuR8wxTUtqpxEgeq35YBHSPM73/DNnI3hdpaxVG0B5cYrGBHgGeO1sKPfscJ3rv
	dpwx/H27YWhjr8zkWCmevBtBM9038gDcGIxPtsqElOFj6wQjNPq92+acnJs5jbjbOo4YKpD7qVT0E
	hVvxsC8UHmJ6kNXzp46pEqxNPwMkl88Y2Cg1cJ0blqfYIshq8eXuOdxp0sAZs7yy0/3zEuOaYPVtI
	Bm52F8jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0j8p-0000000CBu4-2lY4;
	Fri, 04 Apr 2025 15:39:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0j76-0000000CBdr-17YC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 15:37:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E04FA478E3;
	Fri,  4 Apr 2025 15:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F912C4CEDD;
	Fri,  4 Apr 2025 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743781067;
	bh=b60wnFizxMmhI0COYrDpyiTi94lDj4qxo701d2BiSm4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UWtabXTLT+24bfGqZ5EeXDhVHuXGs/LK04FoJ9qUQrZu1OiTwohIqIRJ8KwF6Vnf1
	 Pay1EGARE24eKF8kvl4WhOsiDzdJjuhqvrFrL5GUrWYW/Pijs0zNKdMFnGGJOewOXm
	 6hRe93TLnvF9yQIp0VzJGCStzT+Rvk74FQtG/W0aKpcIPedbPol496sxTBahOc7zZm
	 ikR9a8jhLYdI2rbgoLXqsd8Ul2R6cmDdI94lZTQSDAxmihaokfK6YhGIhnHs2bB1dW
	 An4IH5Rg2gIFNZqVCY9G1AnW+c85t4U8T+9crIrxQLnIjOB8CCY7IrUOzYMk/2fC2i
	 Mip79xEU8gpWg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Artur Weber <aweber.kernel@gmail.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20250316-bcm59054-v7-4-4281126be1b8@gmail.com>
References: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
 <20250316-bcm59054-v7-4-4281126be1b8@gmail.com>
Subject: Re: (subset) [PATCH v7 04/10] mfd: bcm590xx: Drop unused "id"
 member of bcm590xx MFD struct
Message-Id: <174378106397.416874.14204933362434396940.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 16:37:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_083748_365331_3524F37C 
X-CRM114-Status: UNSURE (   7.15  )
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

On Sun, 16 Mar 2025 19:18:52 +0100, Artur Weber wrote:
> The "id" member of the bcm590xx struct is unused and will be confusing
> once we add an actual PMU ID storage value. Drop it; a replacement
> will be introduced in a future commit.
> 
> 

Applied, thanks!

[04/10] mfd: bcm590xx: Drop unused "id" member of bcm590xx MFD struct
        commit: 22f718d8e3a22abb30eb896b4630b9698429475e

--
Lee Jones [李琼斯]


