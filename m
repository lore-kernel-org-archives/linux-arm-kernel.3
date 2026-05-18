Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F357CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2n0G2+Jazj7BtyrJBZLOCheDF0NMvvyn9XJCPYHCN0=; b=UlJ3ASAJRWg2we/w1R0WDAnS1G
	C4LWAfZMJgogaXasDEMT9nVVrKsRLD1CpP7typ1VCKpI9VIVrAtu8kgGqr5z1c5uKajDxKrK7tF1d
	pFnLSx+tijgdbwHngeIb/NTT2xszbhVvlyT0apmS3af4b+McsoXKsUZm2gEr244rd0b4gUQ6oNsoN
	Lx4/2S3SyQGLeFg5AUP7GKrswzd/f9OkGh8+Fd/Cksrsz7PjegGf/ieMJivYPSyvp/21z74zt3Qqb
	VNFJ6tZOirEXpS4axKiir/RuvKueImeye/GwbyhPK/OVHZmSRTXgjw1ee+87NXTvREbIaEIRqPpoz
	xfHwLW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOw31-0000000FPbv-47MX;
	Mon, 18 May 2026 11:22:12 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOw30-0000000FPbK-0F4Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779103322;
	bh=w2n0G2+Jazj7BtyrJBZLOCheDF0NMvvyn9XJCPYHCN0=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=myqoaJPzPyi+al1ubYSV7anQy9yZQTl1plzyC4g+tWiGfye3dcGdVLplqjgQJ73NO
	 qXaY1nm0hrrXiVov2hXCCZYBLMZa0LY11XCaVutXw0bCkmNwizNfInjC5d9ythy+4+
	 coIQVM5ddaRgAmttQpeKxosnh1Ub4ijCFfhhBSEAdFx/2jAbbHMjl2xnFAEBh7ayxB
	 18LWYKqiio2Ug5Jdk5VWe+q/zusQiUta4iwjmoSoElSxROC97srr4qI9pZ2Bt3f7GX
	 p0Cvo1uBUfOP7kGNCab0sRT4ettc/oU71nbxM5GvJkwA8Fa9TTzaUNKaS+UUTU5FTG
	 2lc06OwsWtWsg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 67FB76054D;
	Mon, 18 May 2026 19:22:02 +0800 (AWST)
Message-ID: <88d92981e89a9c6c62b6ddc2fa4af51dcc32c276.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/1] ARM: dts: aspeed: santabarbara: Add system
 monitoring GPIOs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 20:52:02 +0930
In-Reply-To: <20260421130344.2751662-2-fredchen.openbmc@gmail.com>
References: <20260421130344.2751662-1-fredchen.openbmc@gmail.com>
	 <20260421130344.2751662-2-fredchen.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_042210_354590_16CB9701 
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

Hi Fred,

On Tue, 2026-04-21 at 21:03 +0800, Fred Chen wrote:
> Add several GPIO expanders to the Santabarbara platform, with ioexp0
> (0x20) configured to aggregate interrupt signals from downstream
> expanders to optimize sideband pin usage.

Can you provide a bit more context? Is this the result of a broader
design change? Or is it a case of adding descriptions of hardware that
was already present in the design?

Andrew

