Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7BA606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XZrrvOBq;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=AxH+hKLI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhY/buZq8qZcY3rN3OPgKMgzFsab5qOuy5WLXWX8or8=; b=XZrrvOBqn/T9ISfqv7GnPFocVT
	jEh9giJbBu94j/9t8WtV2k2UIek4BwSIbY/GACRgXo0b53m9NmkGzzQJHWS4YabY1uvfH7IUEf5Y1
	4E7fb2xp0pK07YTMHmyc24n9bQDkUy4uxXUPgJVb+NCN32PlkPLyER49Zn975o2ChNIGkWjYhO1/q
	LaVaGY9jy6UffcFkisQEkWL62rjNGexq0SKW8xWQ+MxAfNLSueBCAbpl6tGozrd0ePHz2nz6pXKyE
	2zJ3wJ4pkDgxF1hULjSDoJ5W6GIt8/d0/55fmumTh5nGPgo+qwmhoLqcFNrC9AbQtQq47n39XkdLg
	vVvi5Itw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7Ie-00000009SoV-389e;
	Tue, 20 Oct 2026 10:42:32 +0000
Received: from mail-43167.protonmail.ch ([185.70.43.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7Ib-00000009Smt-3aYQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 10:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792492947; x=1792752147;
	bh=FhY/buZq8qZcY3rN3OPgKMgzFsab5qOuy5WLXWX8or8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AxH+hKLIiEwKeOct9itNuDm1mwkpIA49KP6dHfhgR4qvK7aGgnAoyYcZ1e9+g3nb/
	 Zd52f0e924wL9/zFDreFCy2XInTxhjHTga5GMA+gRkOrt6aWjKc+QPeKmLd1b+ipLW
	 h6U7zTCrV51FhMl9UiWhgyGtHu6XNSXo61+lznKaXme+ywjiokhby4+xeC3QTCFz3S
	 jxW1WI9WoN417GtYMesAsEe90nhCABDasRBgkHAmDTsRm4DZaPVrAcWeWHP+dm9cjU
	 L/BBumpf4P7rY5M0NlHJnJ36uMmaWjnu8kITSnBgv6Re2RiSEDIjIEVI78l82IHtDM
	 l4u44QDwyahhA==
Date: Tue, 20 Oct 2026 10:42:21 +0000
To: Aiden Isik <aidenisik@protonmail.com>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Aiden Isik <aidenisik@member.fsf.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos: add initial support for Samsung Galaxy Watch FE
Message-ID: <5CDdVVnZEwA25WkRzHJtuO-Tw47UZGTEFrZ9SBbQ2ax1bG9_OUemLDoX5C-TzyFyS5WxuFauKFU11QGk08RM0_Nn_3HGrglq0AR7wr8IggU=@protonmail.com>
In-Reply-To: <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org> <20261020-eminent-juicy-woodlouse-c3fd24@quoll> <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 72be47aef9cb2283fc2490f8c7ce36d8a972c2ee
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_034230_611810_2F08F364 
X-CRM114-Status: GOOD (  10.01  )
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

> Is it a wording issue? I don't depend on actual driver code in the DTS,
> only bindings for the hardware they drive, so maybe I could make
> that more clear?

To elaborate on this, I listed that as a dependency because that patch adds
the compatible string for the watchdog timer, and I was also under the
impression that drivers must be already in-tree before a DTS patch which
uses the hardware the drivers support can be applied (otherwise you
would be merging a DTS of which parts do not work as the prerequisite
drivers are not in the kernel).

Is this not the case?

Kind regards,
- Aiden Isik


