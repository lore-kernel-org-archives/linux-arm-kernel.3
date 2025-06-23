Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585B7C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKT+V0iEs0iuHc/eKxrla5u58/EzxIfdMOz04irhFjM=; b=dCNuR1ZfD8Uh+WkW36LVNXWV5P
	4KouC8CrscHApn4RszB6mDlRJEzCUssOnpdDeMhuH3Fr5/FJO8LSRFojwp/3+bh0BI5tUoEByTvLG
	hVQCAA2r6w8NgU2ItvW28WUyGn+6Mkt/1bEHrSQLd3Jdcy4FL0ordTccpCbT0ut/z4GLVuVTPGNDf
	WiBYnitsaCZmeB0Sux0IWpTWLB5C/juiAahuEcWy2311peUyDljG8XWkgnATwL6+YCm9QFmJ5pWPG
	G3DfQQLxyBdOaJevrkMJHsRIqxIZ2WzW853DeZpiN5n0ANOVxpvSGbT8rmMkE3DOJzsI5m9GjwHx9
	JiuHR3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcgI-000000021U0-0uNs;
	Mon, 23 Jun 2025 08:37:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcdw-0000000213B-1krV;
	Mon, 23 Jun 2025 08:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667705;
	bh=WgyOGh6KByq65pMFF30SHRqulkvAymZ2itS0WDt9a5g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cuj2HlN89tSEZvvGVZGHhqkOW70Aq9udWV1Df9Rq7vOaA3eRCxroBcZiN8BPmsbib
	 1EyF9RwgBdC5uQfcDgqizozK8j1mW9QWmd29UCPImPfHBemloT/aHcbkDg/eDUlHWR
	 ZbhbqyJF0OY6N19cLH0AevLacrYpMp1g/HDskTRISNb1xkCYuGRBwAPZz4zScyRZSP
	 FDshKbOKB7G4APlt2RRE28v0aOLIg9ok0Qire4uR3y+0YrscpvzTJ6VnuJ8cmARtgS
	 /gq/kwT2hiFZNdU/LIfzxUs3fdCWQ8Ur7Y3xG+ZNTuifRDMCjprhFtJrT7V/f5lEXe
	 OhCamWIc3rXVQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D211C17E0202;
	Mon, 23 Jun 2025 10:35:03 +0200 (CEST)
Message-ID: <8710877a-9032-4d27-99ac-891d5940f187@collabora.com>
Date: Mon, 23 Jun 2025 10:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] dt-bindings: timer: mediatek: add MT6572
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
 <20250620-mt6572-v1-3-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-3-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_013508_634362_69A0ADF8 
X-CRM114-Status: UNSURE (   6.48  )
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

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for timer on the MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


