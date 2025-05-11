Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64B3C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 17:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeoAHDIH23gFXGyKcKHI7nDG1fKj5EZdsLV0fsLEv9Y=; b=3F1EKHt+5c9MnDCwV+xwKeTrYJ
	4WF6x+op9xRKVapGCUnhJCXqtgW8JJymVyR4En01APfWAynrqFUGSNzHIoAI3/1hOxZ/zb9QjBfcj
	Cvv8eIfQeFWXF7JfIeYDmVo8Q5PY2MQs+erKXhdzzztqLvue8P1WiWam8bW6d3r1cVHPxZ5WFy6b5
	1DMxOKuWAodqa3se00kEOPSaB3bK9LYRQxx6NkfaX9dGO9H+UTQ7tYhoBRUGb0UFMbwwtrz/t6PeO
	0xb8h5dLypu0Pxp4DiZSbAgemAeZzddHBa1Wuli1tQiF3y1h4HKTm5YoESXz/rWLZJ8zsorZTs7IW
	EN761qyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEA9s-00000007ZdT-0zOQ;
	Sun, 11 May 2025 17:08:12 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9tX-00000007YRV-33St
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 16:51:21 +0000
Date: Sun, 11 May 2025 12:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746982277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SeoAHDIH23gFXGyKcKHI7nDG1fKj5EZdsLV0fsLEv9Y=;
	b=wgL3cOypWMiXkr9it1pxC/4m9VSuGKQURmq2hX4dI9imvGcAa+rZft30xDqz7Uvuctg6aw
	iSXHNE1QQcYQ7qQ0jJ05KEvtUsQcqtUGne6LjZFNr1BpbuGZ/4/3he38YxPL3u6eAQTXU7
	7SWBd4GpKwuayuXzWonj6gESUbJ6+Dno/VHdlSIGnrmbtzqUa21VYWohtCYgNWMgLIDqH1
	nC1CtYQ2QGWPh+BkYFhGwYr0NZrH/RxikGTCnefEoNwrUPEFzCigkafaBQuTMfpe/WrtIH
	P4QzBQ2UagN1QTDpbrQcoyQuZ7IxtE4LMsWkcuPwzi6vr5CFC+cUX/F24YUSXQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 05/10] mfd: Add Apple Silicon System Management
 Controller
Message-ID: <aCDVgI4_LtE6OfO-@blossom>
References: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
 <20250511-smc-6-15-v5-5-f5980bdb18bd@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511-smc-6-15-v5-5-f5980bdb18bd@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_095119_924584_FE35DF06 
X-CRM114-Status: UNSURE (   5.93  )
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

> +struct apple_smc_key_info {
> +	u8 size;
> +	u32 type_code;
> +	u8 flags;
> +};

This still has the padding problem from v4. With that fixed,

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

