Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40462FF5104
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 16:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiEgo1uV9rgDDFa9W+HA7wyCNOgnxgyokuO5J5L+aoE=; b=2pRTsK5w7kyPZMIAtE5LhoMgu6
	CTU0NMLws2YtZd2VDKh+rh03QFvUCdnGkywCci1Ed97CLOSdUqKxHJMsXVhwrLfSqu05JRIqqCCxN
	sHhQciqKx36swkNUDyjtXboYumvISHJ/zgEEVKDW3j/qbhAxCI1ZqQHpQXAtCcBXkYOfu6obwTjKu
	nUAmqTInLURSs27YmgDEA72ucc9YJqoah+Snv6FzY0/mAY8Zvq0WzOyxWFuYPBNwvD0aWQ+mLhVrg
	ClquHA1WWdbFDX80tcLhYY0j6w7PhRq0U39bR+0Scbt/kwfIGTZeyL9iD2VEjkAARxuVzVesbNgYi
	gjdeQVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8yn-00000006lhJ-0m1X;
	Tue, 07 Apr 2026 16:08:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8ym-00000006lh0-0xRE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 16:08:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8F07600AC;
	Tue,  7 Apr 2026 16:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F02C116C6;
	Tue,  7 Apr 2026 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578119;
	bh=xYShYm9bxMjZrtIyKYredjisEXJj/O09esRnvDocgB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YOsSgzOAeLNh05Vesqd3XGDprBYHhayV2cKaUDAK75bko6lqaAreMFyFCUz3lXm45
	 CbZ/v9quohodNaZDDQ8dwlFKC8j9ZdwPGV1CGpHNynsLl0qvyvsG1CFVETvirIQX5B
	 rAFd8Z3uX1SyWG7XM9OG/ZjmxUHgbgydlnOwvyUVT79/GcfiYKzpvCCnOAwyrzE6xk
	 3dJTi+BA6Jlmo/UFv50ZAOzWd7U8qrNhydC7de9KJEaScj2u3Yb3NAK4VtC/0Mxj6S
	 rgO+bsMGh0Qt0XB1QU3MZmjDbVUPCCAUSPge8yk4RsCrTtbG7ms5vgZbYdQEuBJ2Sb
	 a3ZwcVNwQYhtQ==
Date: Tue, 7 Apr 2026 11:08:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, devicetree@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org,
	Mark Kettenis <kettenis@openbsd.org>, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-watchdog@vger.kernel.org,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	Neal Gompa <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/9] dt-bindings: pinctrl: apple,pinctrl: Add t8122
 compatible
Message-ID: <177557811572.2663241.13106736229238286122.robh@kernel.org>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-5-5842e1e393a8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-5-5842e1e393a8@jannau.net>
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


On Fri, 20 Mar 2026 13:23:23 +0100, Janne Grunau wrote:
> The pin controller on the Apple silicon t8122 (M3) SoC is compatible
> with the existing driver. Add "apple,t8122-pinctrl" as SoC specific
> compatible under "apple,t8103-pinctrl" used by the driver.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


