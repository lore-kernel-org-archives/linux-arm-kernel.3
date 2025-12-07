Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6BAD2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Dec 2025 21:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGSQe1hNsxMo5+ScV6iLISXRl05Eazg/0vp+AcPBWAU=; b=EkUw1efZUxUh2W2KkEnCRkQ7IE
	zcyxS1EsHhvZSFdv/6z3tK43N1IvOHvDp3Hz5mLHHvoLfzsWby7bLUuxpdF7net4nDlodkIN7a6I/
	dAXGIguCPudJoIxJluOIuRi7gd0h49zjiFXYtq++D1Moc2OREqrl6H7SEZWzDS/YEGz4O0e5mM8v/
	xDGW6mv5QthhjvBDoRGcnFIr22bfco7HPs7TQdMNwa56CoNs8NwPxURzP1YCb3ITMFXY9OSZkWBBA
	8BAjqcZiIAPFxWLlA05Ksx98ZuYkBBRgf84uOxnr6qBbD85BSG4qmz9aO+ZYBul/u0f9OAADREoib
	ijMo1ADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSMdf-0000000CGg4-3Yad;
	Sun, 07 Dec 2025 21:49:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSMdc-0000000CGfh-2q6d;
	Sun, 07 Dec 2025 21:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765144188;
	bh=lGSQe1hNsxMo5+ScV6iLISXRl05Eazg/0vp+AcPBWAU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=pdUqK692dyAKExY3DbNbaZvv7Pm2+t+AqoZEq0PA/mClXJcL3QQzTNkQB2HtzbfcH
	 sTa/vsNpxrYRPCg9gqsvnLBvP1UysBAhngjHkP5buh9AWHSf+9OQv15xQdmzxDHvDj
	 k2C/LifvtXqkkgugseDbwVBPaY6XIegQSfiRJ1LU0reaA874SCeg1G1j4y2cNXssDZ
	 osMzxiu7UjTtMMY+7y0V+ZI59Dmste15jlvC2I2xVbJEUZvC0d/XI8UHm0aP+8jvFF
	 hld1ijpqHtkd7ebQO2pBrJUZUl/2fLO298anicdYQ03Vm40e6kTlt0f8AftfWh4RGD
	 I2fdeHtihzeeQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA34F17E1146;
	Sun,  7 Dec 2025 22:49:47 +0100 (CET)
Message-ID: <156efe34-93f6-4055-864c-29706088e63c@collabora.com>
Date: Sun, 7 Dec 2025 23:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add HDMI 2.0 support to DW HDMI QP TX
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
Content-Language: en-US
In-Reply-To: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_134952_897919_2BE3ED02 
X-CRM114-Status: UNSURE (   6.91  )
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

On 12/3/25 8:27 PM, Cristian Ciocaltea wrote:
> This patch series provides the missing support for high TMDS clock ratio
> and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
> display modes on RK3576 & RK3588 SoCs.

Please also try the following PHY patch if you encounter issues while testing
1080p@120Hz with 10-bit RGB:

https://lore.kernel.org/all/20251204-phy-hdptx-pll-fix-v1-1-d94fd6cfd59b@collabora.com/

