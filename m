Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C406C71157
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 01:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecJCHyXQWtvYtWnqPa5n/BlodDAEwF7Ss3bcPwxT4oc=; b=2tRRq2eA2yDsOHXoL9fIZS8/cN
	GDUJbw63YPaFy5cnGh4YT69Lt61yD42PWRro1ialGFOQc9NdztTbl8KZ+Ei26jwp472OFkmTC5Lui
	6DBJwPiy3WgT3jmbWJuqVrcI4ReVKZiEcTLXxTHxjUtOa39k8x36c7ihDontx+4wR1tQBCRJCejod
	69giSd6vr+IqoE5hGVs6O9jDEoNwfqFCT98+geM5mmCy32vUTgwiGU5b9e3a4Sdycvdci6cgM1io/
	PygT2cGSawGLisjOHkbcL+4Zg5LUQz/v64UXWW0JSsFvzQ1iNwPBFFqYo8XRtPrpvHxJcyFZobqRS
	bFWD8dNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4GA-0000000BlLl-3bcF;
	Thu, 19 Jun 2025 01:40:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4Dy-0000000BlA5-47W7;
	Thu, 19 Jun 2025 01:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62B576116E;
	Thu, 19 Jun 2025 01:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7B5C4CEE7;
	Thu, 19 Jun 2025 01:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297074;
	bh=ecJCHyXQWtvYtWnqPa5n/BlodDAEwF7Ss3bcPwxT4oc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=THYebIHUEplET6ir/Wr6WdVuvILyv57hFEKH5hqn7/8jjeEDrnKD6eFKT+YUKlDC2
	 ySKksmohmjqmAE3ce4ijj9204IHshJH/JpadZ5KLa31Utj4GIX298Y08s2WmojlWfV
	 GgI0k8+mA264ka6nppGywQBMMH0oKnJmYk9imhirlvgJj0NdLRLICT2xx0SRpinQ/g
	 LblsauHMp9mnq69uyJjb/eYxJguSmx7bvQ1OPBmPycAu+kQPWM/OaaeJoGqiopqmvY
	 84QaANBEJ4avD3So1fVyQHUU8h6J9MQutWyaf0ocMx6oNaU+Nt8D7wfihXsl4lqrMs
	 Alsc4oSHue4/g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521004625.1791913-1-robh@kernel.org>
References: <20250521004625.1791913-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert brcm,bcm2835-cprman to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Rob Herring (Arm) <robh@kernel.org>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>
Date: Wed, 18 Jun 2025 18:37:52 -0700
Message-ID: <175029707294.4372.5366260558187845088@lazor>
User-Agent: alot/0.11
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

Quoting Rob Herring (Arm) (2025-05-20 17:46:24)
> Convert the Broadcom BCM2835 CPRMAN clock binding to DT schema format.
> It's a straight forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

