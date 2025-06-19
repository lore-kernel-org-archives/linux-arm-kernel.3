Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31638C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKincwA05ZxweoMeUklxZHYyUecsuKPd9x1q+OONCGw=; b=0cPXqoMe+SVHFNk03HHvvbCpz2
	wfvQnhKBLQFSKIbh4KX+EpVG/q9ViLeMzJWebe1aX+aA2UBsMhMyJvpWUTFnMPDMLYTypzNEtAbce
	2D1yHy+Za4xtxwyHn2CyFGT4bmM5lMZHmfHeaO1wkJptrfoDEBrGEV2i3rUtJdnpwChUMitDdo5tr
	1+yrjxhanQlOm4QT7AK6GqUE2b1PbJ/44zH3sxcN0ue1ADIFIBVzXG8FOUISzq+VEeuJluvvW9pxE
	rSS1cXzMp0rYQs8ocWgqkZN5RHCkSEIEUAx90b6q6vnU6M43zH8qS6bCRtsuaU6oFUc17RjOGrwc3
	ptUziKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRt-0000000DS44-2RUJ;
	Thu, 19 Jun 2025 15:45:09 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDS5-0000000CsFi-3F6B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iKincwA05ZxweoMeUklxZHYyUecsuKPd9x1q+OONCGw=; b=gnMZLThv43dnhLW6D3i8zHegva
	aR4FXcTt8RGeQ3ikGzjC5M8yg1WbUIFlyQFyBIX4M/KXb3TKTpPyW0HmKE02ThZquorgeo3MMYy2f
	5q2cn3YpWTe04TwaiggfPTOv3EOWSmvNtaVucxvVj2y7V6xPa7v+0tVIce/eLt+lIOVFGEY+kmFeF
	9I4lPxs8E1AB3220opYIPmJ2/CSyh96OicCc0VTkQP4YcRKlMa8+o/jYSoKT9EDnWUL/H5eVM8HKQ
	5B+yQNVge1Y+Jj8Tm6E/eTUhPAbLl5ovnZZmjtCbD+mUvRLjQZN4Bg/JUwQLiCNsIwPky6CTTz9Q/
	dQUY9olw==;
Date: Thu, 19 Jun 2025 13:28:29 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Paul Barker <paul.barker@sancloud.com>, Marc Murphy
 <marc.murphy@sancloud.com>, Jason Kridner <jkridner@gmail.com>, Andrew
 Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/7] arm: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <20250619132829.76abfedb@akair>
In-Reply-To: <20250619101334.5b67741c@kmaincent-XPS-13-7390>
References: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
	<20250617-bbg-v4-2-827cbd606db6@bootlin.com>
	<7hzfe4ok9c.fsf@baylibre.com>
	<20250619101334.5b67741c@kmaincent-XPS-13-7390>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_042905_821064_DB65FA8D 
X-CRM114-Status: GOOD (  10.45  )
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

Am Thu, 19 Jun 2025 10:13:34 +0200
schrieb Kory Maincent <kory.maincent@bootlin.com>:

[...]
> I am wondering if I will separate my patch series, the cleaning part raises
> lots of push back.
> 
I think this is a good idea, it is usually a good thing to always clean
things up when you bring in something new, but if it becomes the main
work, it is a bit difficult. The /s/tps@/@pmic/ should be done now.
That is unquestioned.

Regards,
Andreas

