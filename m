Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0E0C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKzu8RjWZEgyd8a+CN2IRY8vbc88izh+3sb0xy1PShY=; b=s3nP077w8jmW65BcHeb5w957Xw
	HCKkb/cPmDLdWy4QTYS3B3YbOrA8qVytIu8BI/jFt5sLEbe/BAz9jakLZaTRxZ0PeE+XNOcbLkrVD
	d4v0YXfsXNjKZPh0/mh+3tOaZRt1XyMFNYRFoevOrDP/3l/dooORVpK0lETKmyWxh5W/VKjS07/uP
	AAakkuEDR6FMtGjOGB4x5Ib5/6UOwZ1Z7xyYu0mCvz/dmuQuB+/dDrVzC6IaNvFoovD59nm3bDWaF
	qAXwDbmJM7FYM4IjqHbN1mh5yC0kB/NAA5f/OSH320uWs4jCKcWvWg++GQmSzce2HP8mXsdecqkmp
	fJRi9C3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DFv-0000000535w-0CWn;
	Tue, 08 Apr 2025 18:01:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Cj7-00000004ycb-3Hvy;
	Tue, 08 Apr 2025 17:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 346E0A42B70;
	Tue,  8 Apr 2025 17:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C45CC4CEE5;
	Tue,  8 Apr 2025 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744133228;
	bh=aLx0mUhM3Bq/zV6SJmFIXECD9k2eFzF4YueLPJkyMII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unmgh+wxykjk9tR3YGgjNWRwY6ElejEHHU19KaQ8LEQI9JCTmcilRpLInBUaSzsw1
	 9kXAr58nGziKPUoa6ojX7Xo13s8sBUuOuo9CaESB03aKbim61OQX82m0m2xGWoG9VE
	 V5dqs9W2QuNRo2VktvYdu82zP6nXH8a5OAyqQ+so/auKaUGNf6osms70qvPd0qbmuw
	 7Nnk2xaG1yjD6uJK+t9h4xXDxgRKZFV2ckV3m3Pn3f117fHmmF//cLTR0GYrhueWJ4
	 f6saZ3+ro9C2gdKLf4fcqZgOcpVLyCDa8pal9JobmMFFdvwpjd6Qdd65+F7Xkhub99
	 CERiMnXgXtjGQ==
Date: Tue, 8 Apr 2025 12:27:07 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
	kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: rockchip: increase max amount
 of device functions
Message-ID: <20250408172707.GA2283098-robh@kernel.org>
References: <20250408-rk3576-pwm-v1-0-a49286c2ca8e@collabora.com>
 <20250408-rk3576-pwm-v1-1-a49286c2ca8e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-rk3576-pwm-v1-1-a49286c2ca8e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_102709_889044_F821A663 
X-CRM114-Status: GOOD (  10.47  )
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

On Tue, Apr 08, 2025 at 02:32:13PM +0200, Nicolas Frattaroli wrote:
> With the introduction of the RK3576, the maximum device function ID used
> increased to 14, as anyone can easily verify for themselves with:
> 
>   rg -g '*-pinctrl.dtsi' '<\d+\s+RK_P..\s+(?<func>\d+)\s.*>;$' --trim \
>   -NI -r '$func' arch/arm64/boot/dts/rockchip/ | sort -g | uniq
> 
> Unfortunately, this wasn't caught by dt-validate as those pins are
> omit-if-no-ref and we had no reference to them in any tree so far.

Sounds like we need a way to disable that for validation. We'd need a 
dtc flag to ignore that and then set that flag for CHECK_DTBS.

Rob

