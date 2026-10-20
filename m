Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA52606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SMnaQ5Kl;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Zpsirt15
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/aZgrm7dgCOsexbLaT4aECuHA6/h9us0ehoDpa7RA0=; b=SMnaQ5Kl5BjIhn+R256P0dJRuZ
	l1uGAo42QPFUM/0r0s4mgh/IRS/6T/k0Q3R9VbyKHUtWXKuemmIyVycp61oD9OpdoJjKj2hIUlESu
	Y2T2Ur/RoJ/ydS2rsVSFkjcyJiGY1CwqcTjNaqucVKiundO5nemTX1V7R5fgI67RZwZtfxAqeaxaS
	A4+DlU873uuJXY4b1GbmQT5WZy/weMsVWChCkirnUqkQmmM/0wocxQrJ6uYKKOnLm+o0vNtaIZvdR
	Vf73TDTWLzxXCRxa6DDy/w6PAMLHdyYPrzJ9UGaVSfMAzE9WUJ/hwnU9PI1o4Z0qVpu7XSlLyPYD9
	SU2OyzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Op-00000009isB-0ThG;
	Tue, 20 Oct 2026 12:57:03 +0000
Received: from mail-24429.protonmail.ch ([109.224.244.29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Om-00000009irl-0Fjb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 12:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792501014; x=1792760214;
	bh=w/aZgrm7dgCOsexbLaT4aECuHA6/h9us0ehoDpa7RA0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Zpsirt15KyfTrH31JaJcCMcTT7NRbu+8WsdQXGrljWHUk0wPUCmI+c7cfUXvxOLhD
	 ixLe55UCsM4AFHDxmvTpzIGdgLqeHTj7imPf8z7gq7Nsf4belrgBT2AIn+J7yc6hHB
	 Wd8Re/jFOvMKNKZjNEHJ808PA7qPR8ho9KcIw2Yo1ydoPwLkMH1ENkD2SOWhR5Rtys
	 /TMt30ne/rsY6s8/Im9uMZ/m2pF2ou+2sfLvlxzu088vi6yWciHQRckpmg7VcE467F
	 93osPHsNTTzNc+nWK3Tz/4poHFsBafCwUnjp0HpKFyyFzp8kpa8ZTSFq7UmmYOJGM1
	 hOUNOmYp6DNLw==
Date: Tue, 20 Oct 2026 12:56:48 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos: add initial support for Samsung Galaxy Watch FE
Message-ID: <s4UILXDPoM5J79laZ-Kd-LqQhFFKEy6vh8axrHJUAQ2EP4R1HOmcCyV0xtu_LhKfTBHk49bkb3E9qD44d7LoeRAuIA8wzfEjPrF-sJ2xFnE=@protonmail.com>
In-Reply-To: <e4af2bce-7bfa-463b-927c-9641d74e0e8e@kernel.org>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org> <20261020-eminent-juicy-woodlouse-c3fd24@quoll> <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com> <5CDdVVnZEwA25WkRzHJtuO-Tw47UZGTEFrZ9SBbQ2ax1bG9_OUemLDoX5C-TzyFyS5WxuFauKFU11QGk08RM0_Nn_3HGrglq0AR7wr8IggU=@protonmail.com> <e4af2bce-7bfa-463b-927c-9641d74e0e8e@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: b772592dfa4fb31ed61ac52e603a69298ce5b717
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_055700_257661_9EE0AEAA 
X-CRM114-Status: UNSURE (   5.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> That was never the case. See maintainer soc profiles.

Thanks. I have now read maintainer-soc.rst, and will drop the watchdog node
until its compatible is fully in-tree.

Thanks for your patience with my patchsets.

Kind regards,
- Aiden Isik

