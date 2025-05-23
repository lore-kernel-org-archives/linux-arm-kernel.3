Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3883C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79s/icVsiY8Ko2RVtcahqgEQcdOzHFxHzgCmFXIv5aI=; b=GCsyROyOfkJcCdEJGzDEf0orHj
	ckFEwg8WrO/EfZlGo9xQdN4RnLxSihxsAwMu/4H8sKivjrxODnQ7yzvwuUdpwQUqTc0hfJ8Fyn6d+
	5hB0KFHCV/O5xUSu7Lc/ghGp3/Ev3zZsssuitmRIaBNh/QLen66SBDeNElyRms2fnpSMzBoOj6u5B
	KhbqQ+7UKxiySCkTlWlum8vnwJcmgNIWN4Fwz2OZeupwv/6lGPmrwoK1+vFC75MWvhTEAMv9396po
	e1B2Pz0dQFlbAzFaR/7O2BbQUmY1eNA70cGMK/Y758pRS7KtAc5lTKAw8ghYtNAEAM8XTMPNkFzvm
	ytWcJE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYQH-00000004pk0-2uc7;
	Fri, 23 May 2025 19:51:17 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYOC-00000004pYf-2mCE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 19:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=79s/icVsiY8Ko2RVtcahqgEQcdOzHFxHzgCmFXIv5aI=; b=5tDMPeRSETnCwMg+Jva9n8WhSV
	CWNIYJARGmPJfBxQoD91e+uasPEHbfFbSK5BdvfaxAhzMi2AomecNQyveoPcRW7VyTK8k3b5TugeQ
	ogpt/xVdTGJ25sLL9b4FTeqfFcK1cctM2+ZqyAk/GZqZosAAmKlNFDJ7K6bgYTxpfpChjySbO1XTq
	n3ds/yqjVcc2IqoSkQkucXNr4HNV8M9zi/ETROgS0QSLKQIStY7gwkKvU6hmzBhtsAru41N0FujaJ
	D0YvwDuz6xpooNLroQXso75kp6ajlv2xmyRDHNwJuEcYNkN+mpAMW/InTvG02EZ48UUkMNP27Y/wB
	q5KhwA0Q==;
Date: Fri, 23 May 2025 21:48:54 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm: omap2plus_defconfig: Enable TPS65219 regulator
Message-ID: <20250523214854.3acced3c@akair>
In-Reply-To: <20250523-bbg-v1-2-ef4a9e57eeee@bootlin.com>
References: <20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com>
	<20250523-bbg-v1-2-ef4a9e57eeee@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_124908_703962_3FA09217 
X-CRM114-Status: UNSURE (   7.64  )
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

Am Fri, 23 May 2025 17:57:43 +0200
schrieb Kory Maincent <kory.maincent@bootlin.com>:

> Enable the TPS65219 regulator in the defconfig, as the TPS65214
> variant is used by the newly introduced BeagleBoard Green Eco board.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

