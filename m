Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386B0FF510C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ax+/mZmm3dkXApO7k4Orn2R/UndDoRiRdxX/74rK9nk=; b=3u7vIaN+WWWAoYmiVQQvvysXzF
	WbNiTpLwsHehGv0+zQN9tf7FUT8l6tJAyFHdFnGpjRoNfuGXTLr6Kh2wrPTFyFM2OiSYsQfaxvb0v
	jJy5UBGKF2Hn/gBLMGjnNBHOUo9bE1JTaW5qrhVMOqUSIuIeb2JjUwenx2XcueUw7juSmZBcb7qfg
	KIv/elUbpECYuhaZgRIROmzciM6ZPBULT+NnfOJwkEdHmKb/9l6OZp/enXTK6J4FkWK5qPt17dRZi
	9el0gImZQohQtCRZK3Bk0pU2TcfaaK+fat6FiLS8DKqY5pHEYnMLatH5QEAbhhpE4qSWRjB+4Hol4
	m462oKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8yF-00000006lUV-0Mhv;
	Tue, 07 Apr 2026 16:08:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8yD-00000006lTi-1VcS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 16:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D4CC60123;
	Tue,  7 Apr 2026 16:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C76C116C6;
	Tue,  7 Apr 2026 16:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578084;
	bh=8trqOvymtySKFHxGiIFzGhJy6W6b/leyLuH7GdE85NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DED6xyp8G2cygWWTVjdVo3Xj1yqlt4lpXXCHuiVr7MI7Wvtr0AeXaEfphlZCY2LKO
	 +ZWxjNvBZ/UcoHoGLfLwJpu++uAEMkpwWF5y+59b00Zrk7gJIMn7zQbpShgemHm1qD
	 OHJ47FEE+njXpJQfZavqb4aAWrJINz5bkF+RAcc/4Q0a+t7W88Df9NRe39rV3eCOfb
	 3pRIpVQvw2kgxFt07QzkK8JAFvb4Sdi6O0R8jAr+6NJFoctlooF/7o3u3MqGX85Tid
	 2T84BiCzh2J/521wLLSnL5vcGzs1uqpUkqU/qICKf7i2hSIAq9exH89fdL/Op6Yc7R
	 A31DLJ2Ks9hqg==
Date: Tue, 7 Apr 2026 11:08:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>, asahi@lists.linux.dev,
	linux-watchdog@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 3/9] dt-bindings: power: apple,pmgr-pwrstate: Add t8122
 compatible
Message-ID: <177557808164.2662432.8266259969992444267.robh@kernel.org>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-3-5842e1e393a8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-3-5842e1e393a8@jannau.net>
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


On Fri, 20 Mar 2026 13:23:21 +0100, Janne Grunau wrote:
> The device power state management of the PMGR blocks on Apple's t8122
> SoC (M3) is compatible with the existing driver.
> Add "apple,t8122-pmgr-pwrstate" as SoC specific compatible under the
> existing "apple,t8103-pmgr-pwrstate" used by the driver.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


