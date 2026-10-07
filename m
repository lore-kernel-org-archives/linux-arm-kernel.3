Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBF3CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 17:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLfXra5Jo90UbwTBsB9NGQ3f0bIBVXsiTTgt1LOnb6s=; b=EJUcpLSW6AihfoqRUTrGQfuz71
	xJFCj80p+MGLiQsewZIMp9CYWIjQu/rMxOLebITB2QibRulgxGng9ce2M3c7I222CiD0uuy8GEe22
	lOra+o/yOD8BRq5yng9k7dmepjjmBN2VlhhKiV6G7EzT76TU6lHO7+S1rGTRwDrabL1MgZhTEidb7
	HYQmMoX4W4qzFkKhQ/Jy85B7xaXJ39FGq7YEc/IDSZ4XmuZjH4Xec2CqqDlu+vEiq7361qxTQnXZZ
	HZioeJHeVLj7Gf6ayEzxEGXY0XpK/xgO+GQRPrmbeFQQV6vUvzitZ3d5oRXWyUkXSWuYdMRrTVguy
	m88dVMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVfc-00000002op9-1NlY;
	Wed, 07 Oct 2026 17:43:12 +0000
Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVfY-00000002ooO-22tL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 17:43:10 +0000
Received: from L30177.local (unknown [78.242.246.191])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1B23B780505;
	Wed,  7 Oct 2026 19:42:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1791394985;
	bh=pLfXra5Jo90UbwTBsB9NGQ3f0bIBVXsiTTgt1LOnb6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGySEcTvLGf1K4n+0/B5s8ni5lHAHsIVa8gSTFnQpWZoKM2Bu0g3wom+bNh55IjmH
	 i3PPKg+dy5xd6+1NpM3E2cpVDUw7jxHsi86+3I3Ipez3E42KgssjqmXE5ggf2IBwvu
	 D4D+vWa/TKg2wKFm61IQrLQlpjkyaPhpFiaqCdcr4e0dMNf0Dcp85Cmnx3KrSQf3HQ
	 fjLB1VzTmpLeK47WFQPOivfQRUetQLqfl66Wm7NIplwAIzhv5SDwPPFlcC6I6GtZzB
	 1IIiMLM0TzkX0nZiYEvyWYDozke9WLCWoqoOAW8zqR4uX1xZ/lH0AdZqaWIemBeQKg
	 4F+zBWY+mrDLA==
Date: Wed, 7 Oct 2026 19:42:45 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Carlos Song <carlos.song@nxp.com>,
	Haobin Jiang <lemonoutput@foxmail.com>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
Message-ID: <asaElUqBu5ht6amB@L30177.local>
References: <20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr>
 <apcYp0Zc7CrJMiOh@lizhi-Precision-Tower-5810>
 <aqO9SMvI89rqoEGb@L23803.iliad.fr>
 <arMUxCW5ZTzLT3VN@L30177.local>
 <arw0mVbacAXv_1H7@L30177.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arw0mVbacAXv_1H7@L30177.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_104308_709355_79BA3060 
X-CRM114-Status: UNSURE (   6.64  )
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

Hi Andi,

Sorry for the noise and resending again: with v7.3-rc7 due this Sunday if
I am correct, could you take this patch into i2c/i2c-next for v7.4 ?

It carries Carlos Song's Acked-by and Frank Li's Reviewed-by and it
still applies cleanly on today's i2c/i2c-next.

Haobin Jiang's "i2c: imx: honour I2C_M_IGNORE_NAK" v3 still depends on it.

If anything needs to change, tell me and I will send a v3 right away.

Best regards,

