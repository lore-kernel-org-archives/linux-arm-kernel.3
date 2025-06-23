Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8F2C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 08:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6dytGOT4dmF1lEUoP1fMW1tNejx8UKxC6eLzzb7UPo=; b=zbF5bUKFS1HHS8XDFEHK4un1W3
	LskHGmkO6R2fqPx5grpBPLfOCXvCpM5Tybl06pwGvgVvJ0ivH4OclcmcBa8/r8ECiW4IGBb1hAOTA
	GVM3W+uQbb+Gs+VlqAf8TFMUxhMyu7JRxuqSAgNyg/e7PzjKzHZOAdSgMtDA2nXCjVgxX+JEptrKD
	Y5IbqrVeZNgirJAIbyhM/G3W2g4dY8w1thW/aIxg9fMsDNeK272hwDGjJ3DL2FkN1SGeo21vh8gzt
	3T/3bAFdnnNpVYHKw3GyBPCYx5+ISipyfY6Oo0vk9H8jxT5X1iMd+CCyilU5EyQRR2znaL/PYUtHv
	VmTN+0Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcnB-000000022az-1iW5;
	Mon, 23 Jun 2025 08:44:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcdz-00000002147-1NuN;
	Mon, 23 Jun 2025 08:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667709;
	bh=35i94WQPeCQMWaQEOF+6oteQPVu3yuDJq4zvDX2DSKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cgBalYUoaAz+rwdk95p5gTmgaJPASLpd6yzel1ek4h2zrXaBTW980IpLM+rEEnq9d
	 orgAF14zmcpZ/WHYedyv2OZrP2h0sieF339FpARklvdVoLW4+Q+ZT9Px/9HjPT/K9Q
	 sWPIE/aeTLpYsulMmm5JnPmqN0mrJyFmQ1ypluEBKlKPZGAY8l9/UoJB/OQUhuc1E9
	 ztcnTt/dner+0C3KhloZuOuJssHjd8cdkuWRweKRBN8JJbXvMgm9XVZiLOa3mg2ZKJ
	 sePSWI2TZAtXVtPTG1S8S2i1711g6+dmNTTwoS54KZnx246KcnRxOXAsgTErxg5VnZ
	 JLPeudnHUu4fw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F03FC17E017D;
	Mon, 23 Jun 2025 10:35:08 +0200 (CEST)
Message-ID: <28085813-5b29-48af-8e54-5bef41ff659e@collabora.com>
Date: Mon, 23 Jun 2025 10:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: add MT6572
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
 <20250620-mt6572-v1-2-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-2-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_013511_544459_9097A33F 
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
> Add a compatible string for sysirq on the MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



