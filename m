Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C209FC9EF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRgKyyhbEWqr/6bjFaB4ow3H8vyPbAgzEH+jU02Xkzo=; b=2dAyxUryG/UOlf6TjoJVwax9ev
	hVQb5gXPKMEjlEpz9Bld8+YRbafPqATliZNuFrOF2xjjfaxbjLe7Vl5AB7IMvTZe1JGdw9a39z2ri
	mGq6mzmiQ8UOEhRSm2jJ8dCiisGw7cW4upSB+YRuOHSFvvMldDT+t1fFAvPtJdMqoRuzEJe07Q4Ra
	fJYsHZljAmTEtmZmmfMbkDC8GqMxhu/D9L9mRt+URbs1nddvzWRQ9j4oCbaV3jKyWm+XZCokFdfDY
	UcTcNd8S2YUN+Xk8eXgyVpPwvWv+NsM2+uyqpdxgG/2LZ9cBd55FOmtculCtVf/YhFFZ4MGJrP30X
	nod3lVGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypoO-00000005A17-2t1A;
	Sat, 07 Mar 2026 11:27:12 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypoK-00000005A0m-3mfN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 11:27:11 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 989692B43E;
	Sat,  7 Mar 2026 12:27:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1772882820;
	bh=yRgKyyhbEWqr/6bjFaB4ow3H8vyPbAgzEH+jU02Xkzo=;
	h=Received:From:To:Subject;
	b=wc3ITaBIXBBQVjJLnLaJJId+HLREhnMQXGDhJGDlqTaiq0AzmXrGPZW84uqMpt7YC
	 Iim2V2QG92VsEQcbTHb0nZrhZOgEODKAZaMpccQbLh3MB4TB6dL9S1WaQ9hDxukR2u
	 NRErMCD8wW2PVOi18ThwOCWI0xn+KAExZJ7mROCluHhOum0RfeKFPl6U6aw8Yd3Kck
	 mwUZ65ll0QpaUxQu0YJZRPeTvo3llkl3LDwbnHhFP2RyvDfIdt00XQgL92UadL0URB
	 KH5F2yV/nzg6F6g96Kf0kZ58viovlEmr85FBMn2Fon0XAdi1rdSW+YCmHpu78B3JSG
	 pImqoSvSS7eyQ==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 49E077F86A; Sat, 07 Mar 2026 12:27:00 +0100 (CET)
Date: Sat, 7 Mar 2026 12:27:00 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: Enable configurations for Toradex
 Aquila AM69
Message-ID: <aawLhIyRHfbcSYrj@gaggiata.pivistrello.it>
References: <20260306153130.102972-1-francesco@dolcini.it>
 <4d016247-7060-48cc-ac86-1103df6a9b08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d016247-7060-48cc-ac86-1103df6a9b08@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_032709_849819_E1B71D27 
X-CRM114-Status: UNSURE (   9.17  )
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

Removed soc mailing list

Hello Krzysztof,

On Sat, Mar 07, 2026 at 11:12:34AM +0100, Krzysztof Kozlowski wrote:
> Please follow standard defconfig submission rules, so as explained in
> maintainer soc profile - not sending directly to soc@. How did you even
> get that email address?

I was just fooled by get_maintainer.pl, and I did a mistake crafting the
recipient list manually.

Considering that the right people/list received this email (the TI SOC maintainers)
I assume there is no need to resend it, correct me if I am wrong.

Francesco


