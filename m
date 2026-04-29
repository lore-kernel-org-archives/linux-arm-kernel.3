Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D73EFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PlwOMJb59m0dV5l30jKmO5m42xoUBZhDmyraeHzGwo=; b=Yg3JhdZad5facsoKnaEWBTuvIA
	Y2eMyJR1GEsaJV1M0Xe7fOCcLix3WFjUpUYEcaDI/YMKdDVCEX6jfYGpaHaBp6SokqZVuRynsMAnq
	60ffCI2Lh94ScxmZWgTkOvDIl9FUWofyQgAXt59vp4ZLukAfMsSf5KvHeM4MNgy+26/6ikpsx22me
	AErPaHfjbQ1srmKRqzvhn4GpavxZlM5fO5w+cJAfTW45b1U16NsTofN37SzAmC4RCIDgWJ0q/6GfL
	F6z33r7x1UiJ5bk/WYikHhA1V2J8izIaawg7iJ4ZUJafM4N2YwvxwjXjVIeILbUtFOZ5N2VVmetgP
	Hg6AICaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvt3-00000002rko-0cAa;
	Wed, 29 Apr 2026 03:46:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvsw-00000002rjL-06Et
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:46:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAA7C42CC1;
	Wed, 29 Apr 2026 03:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5E8C2BCB4;
	Wed, 29 Apr 2026 03:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434409;
	bh=9PlwOMJb59m0dV5l30jKmO5m42xoUBZhDmyraeHzGwo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IAyb8qS/AcltzaJjzms3GU+9Sg2utIMY2EwiOYtHCTEIXAQKwGUo79vTkt006TVn+
	 xibvJKT3Fk2XMDGPbjWqQWKkEw5UZ31XQyEb8ftkFblhIxTjSyLFJSg9SPPOQh/9uB
	 JC/yB7IoH0GlspeA8j+aAMFjp1lU9aVjh9DzkhoDJmNPD+7z+eXanFJqdVKyRT/98m
	 X0sbbneSAtQRidAbMZeMADH4v/dguO62KJkK7y1BPzaBczGdvgLfxJMCQtbYluspgD
	 wp3gbDSyCay/fnx/CZ8RjHsWPHDWC5xDNq7Gw5VCEwUE6bAT1WkQF7DH6C8TR4Qdls
	 QZmzq0mFTCq4g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260428-upstream_pinctrl-v8-0-eb8ef9ab0498@aspeedtech.com>
References: <20260428-upstream_pinctrl-v8-0-eb8ef9ab0498@aspeedtech.com>
Subject: Re: [PATCH v8 0/3] pinctrl: aspeed: Add AST2700 SoC0 support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
Date: Tue, 28 Apr 2026 18:56:20 -0700
Message-ID: <177742778029.5403.7247019083523002317@localhost.localdomain>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_204650_086671_2404F2D3 
X-CRM114-Status: UNSURE (   9.03  )
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

Quoting Billy Tsai (2026-04-28 02:49:44)
> AST2700 is composed of two interconnected SoC instances, each providing
> its own pin control hardware. This series introduces bindings describing
> the AST2700 pinctrl architecture and adds pinctrl driver support for the
> SoC0 instance.
>=20
> The bindings document the AST2700 dual-SoC design and follow common
> pinctrl conventions, while the SoC0 driver implementation builds upon
> the existing ASPEED pinctrl infrastructure.
>=20
> ---

Why is this being Cc'ed to linux-clk? I'm hoping it's a manual typo and
not some sort of misconfiguration in ./scripts/get_maintainer.pl,
please?

