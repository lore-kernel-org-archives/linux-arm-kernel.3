Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA26E668B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 19:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnT1LhAyVtqrUEmWipFHKfL/LLTql2Rg7FUq04Nl+Rs=; b=xEPwdt7na3j5277fU8xXqCI5cC
	qGh+8c75D7Ki+ZvK7yTFZnhNCLio1ROHweDq/R43tkMPQs4oGvXZFTJOt6ZKM2XmDceUcpkxJOgSq
	MF4qIDyc2ZOeKghwphZJ/6wdkVTXn8QMnP0Uhq6XUJUTi4TtJZkxUEbAaP6OcNzB9LP6Bssduz8Nw
	YihXjFazFn7rSHKyyEwDhpdC6eU4ap3zzVUpFhY8qvZb8yAjRcg+wHehjrlN8MMWHnYcB0y+vzZa4
	bJipYwR5jt9nOhvo2B68KaQG1k+WkPzUJtn7LiCSiQcrZ3jWBQ8RSzfXnWiw9GyEzZEviYsZludFE
	mFDy23Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX2Zc-0000000BqVH-4BWJ;
	Sat, 20 Dec 2025 19:25:05 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX2ZV-0000000BqTY-0vvO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 19:25:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dnT1
	LhAyVtqrUEmWipFHKfL/LLTql2Rg7FUq04Nl+Rs=; b=Jj64k9pziHjykH4xvBNB
	z3kQ3k4aMzQkzva6eEP7948vTFSOXvU5ILvMIj/XCTgpo3kbaaySFhs74K80kVAO
	HGX6G+RSKEk27ljAoyaNNlQTIJQJRKLrf2k6ZJFFwe6FjCevO4lErWOOFLnhuyHv
	9X0qrkrWAGDK+nocBH9cAX3g+Io5siX2JQJYDj2JcnOgM8rT/YrrxZhEUeubljIs
	Q9X0U+l0nisWHZxnMQbG0ki/2i1kVIoY7L3MD1H+M2MuJyImiWPwTa0GtngUK/l5
	pj4cdK64hMFHMPU6kUH64AMD9yqNrTqWijXu31FfLgmAcJNWs+MpwFFVOxISG2P2
	iQ==
Received: (qmail 3183234 invoked from network); 20 Dec 2025 20:24:50 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2025 20:24:50 +0100
X-UD-Smtp-Session: l3s3148p1@v8zIJWdGaL8ujnvT
Date: Sat, 20 Dec 2025 20:24:49 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
Message-ID: <aUb4AfDf8Ouh6vtD@shikoro>
References: <20251212203226.458694-8-robh@kernel.org>
 <aTytWyyZiYFnyauo@shikoro>
 <20251213010934353f1efe@mail.local>
 <0ec01064-2755-401a-b2c8-76ad6ce686af@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ec01064-2755-401a-b2c8-76ad6ce686af@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_112458_125918_98388F56 
X-CRM114-Status: UNSURE (   8.63  )
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


> > I don't think this will be missed by anyone. Unless you actually have
> > one of the boards, I would simply drop this.
> 
> +1

Okay, then


