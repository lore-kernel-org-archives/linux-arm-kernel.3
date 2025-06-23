Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3245FC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyg4JDkti2EmTKDViGhcBskGFppznr6v8D0JUGXEDaA=; b=gcYb4/2TUjLIYHizUKpYW8M0Za
	cjwDfAzdtwIHZ+25gcV4Fj/iwVr2GvmpfYX3l5liqVKw3iwYVcP8I1jp6v1ExJuPOiyWWlUE2HLIm
	WdLKeh0uKjVI3kj7zSxS9Lk+RGf9RNs3fEjR/Y/dNltAci+4Hy/uNEXAml4DKa/kHGFdLQItbmb2n
	8s7PWHVPt3kVKfx69f0fO1p100qLB9PhMrgzRNtjr8LqX6IVDM/ga85aNGvINeAfPrJtr+UwkOQVx
	HSDdUHtIOHywFTpde4qATrNhTjWWt0j54y1VpTS3whUWIA7wnu52qh3Y0OqMK8YvLcArzs5NIMGi3
	cYCstqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTckt-000000022CM-19d2;
	Mon, 23 Jun 2025 08:42:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcdx-0000000213D-18Qb;
	Mon, 23 Jun 2025 08:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667707;
	bh=AdZQo7KUXRvps+IrCJbIJguh27l3FFVuyIGfWdEa30Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D4CMFtbLJCn4Uko6KbzQZCht5t+T3uefiOtpfzYRRj7HVMUQHb3jJTJE5l7qaTRFj
	 J95Uk7eb2j8m3AgZ02/fzfNQ6RFf/j9b2bi5/NYNqL+NSByPkWjoRTmvJmQdLjh+8x
	 wQccxV/oR3C8a9sqpTUpKM9a8jzHlaxrlwnSdqbVvS6EOzgu7L6dauaapkFDKi1Xos
	 vhmVBERm5w2WhAGDRVkNQZ8+AztWiHMhn6MC2a8eUQTTeSoCbQ8DVFTUwLLXBbKZQh
	 tdWVb6z53IWa8XuReH9D6Aa7fEV1KTLKi0OrkqlDw8pGOIOS3kIkCdBqaGm04FcH9A
	 Han9/fwFTEeHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E633217E0109;
	Mon, 23 Jun 2025 10:35:06 +0200 (CEST)
Message-ID: <4c2249b2-5e05-4471-a624-0f012ee3f1af@collabora.com>
Date: Mon, 23 Jun 2025 10:35:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] dt-bindings: arm: mediatek: add boards based on the
 MT6572 SoC
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
 <20250620-mt6572-v1-6-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-6-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_013509_457902_0031B94F 
X-CRM114-Status: UNSURE (   6.99  )
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
> Add entries for the JTY D101 tablet and the Lenovo A369i smartphone.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



