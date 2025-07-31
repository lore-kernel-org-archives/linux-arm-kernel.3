Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64438C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWnE0BuMLT8kWS1iBNxdI5fCsX3JKkXaj3S/LVk43S8=; b=ViBVYahBUTp5c0pJ3uei7yj5qO
	zIkz8newo86fgKvBexfbCGGzEjhoAX9Vo6EjSxvY7o3eAdjrfzAPJtOA5FfDRVSF+kOEQDNRmECfM
	LCfr7Z5Z0v0Wn6acWQt/J8/8GUAUHjMwUq/owQZPFye/oojIMVnYGiNPMVLvXhpJQO44j3AgjDXOA
	AY8WpXcbneUl9m8bfmd+AC0fbNFJZC9J+jk5Ya4Rj44RImSc71CVaAoyK/rhLSxOaTQKHiiDqkOiK
	Zcxg3qv2RfMzJy30zWilMRC+205OOkXd+uBEizOpQ+wq4Gxao9NrRYx9YhO/eQv5SnmgY3J1FXs2F
	qjnmHyUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWTH-000000046Yl-2afK;
	Thu, 31 Jul 2025 16:49:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWQh-000000046P0-0PxC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 16:46:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B99B25C62A5;
	Thu, 31 Jul 2025 16:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DF4C4CEEF;
	Thu, 31 Jul 2025 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753980413;
	bh=nWnE0BuMLT8kWS1iBNxdI5fCsX3JKkXaj3S/LVk43S8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sPXGXw+scJs3C7UZI/DA7MkT8ZN7ufgUcQDo6OoT3wd0tG1XIxdEmW42mDTr2FwvB
	 +g2toyhn+m4aah5rzF3VTaYgwwnfqkAUadACT2JKaGyZoyNkSAengCkwSnWhj089yJ
	 KRLUQFV8aP3CfE6SS5dlWSxgtaAwf2DyO0uuJvY5Mg9t6FgEUvQEqLETVtBmGG4LVE
	 FAy5pKc8Lv2IS284454L5lY1pw78sQaMjs1qNnoExK+AbO43poml56YaYA2ZT0WZJ/
	 0uveNgKYd+S2bTIiBTMYW7opEXNGfiiklXc3bTfggoVvJOq11Kxa0M3sB9m6ZRGo0h
	 oQmOrF2fr/Qag==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1a72e672995ef6cd186f8ff18a91bb8b72d86554.camel@linaro.org>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org> <20250730145100.GA6782@google.com> <1a72e672995ef6cd186f8ff18a91bb8b72d86554.camel@linaro.org>
Subject: Re: [PATCH v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>
Date: Thu, 31 Jul 2025 09:46:51 -0700
Message-ID: <175398041189.3513.13629420060562627196@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_094655_176889_6D14FBA6 
X-CRM114-Status: GOOD (  18.69  )
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

Quoting Andr=C3=A9 Draszik (2025-07-31 03:20:56)
> On Wed, 2025-07-30 at 15:51 +0100, Lee Jones wrote:
> > On Wed, 30 Jul 2025, Andr=C3=A9 Draszik wrote:
> >=20
> > > Original cover letter further down.
> > >=20
> > > This is a resend of two patches from the original series that haven't
> > > been merged yet. That series was merged except for the attached two
> > > patches here. Other than rebasing against next-20250729 there are no
> > > changes to them.
> > >=20
> > > Lee, I think Stephen's intention was to get these two merged via the
> > > MFD tree please.
> >=20
> > Although I have no issue with this, it does seem a little odd now that
> > the set consists of only Clk patches.=C2=A0 Let me know what you / Step=
hen
> > decide.
>=20
> Thanks Lee.
>=20
> I simply went by Stephen's ACK, which to me implies he wanted it merged
> via a different tree (mfd). I guess at this stage it doesn't matter anymo=
re,
> since all the core changes are in already.
>=20

I'll pick it up after the merge window closes.

