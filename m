Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171E0C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 06:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCvlCH6G6hLi7/+gEcb5Pr8BYZkvcHnMDP/PheZZ+p8=; b=FvUsXQhpJvkJXUOfsDB/h7HQvu
	c2zqozzVJ7iEwOfgYAmBv6jBKHnrr7v2wmgDDDdVNQuubT+vifAi1PSEJq8ZVM7bfDLvAIoRH87e0
	c/c8ONqeMtU4Vco++np0T9wmE4PSolsK8k/x8Fkkhzgd0uVznBpexfNwAJBUu19IfKCFHoRfHfxel
	GP6so0sy22WCbTxkuyrP8COlPO3CDhgB80GAl8ZLn3UEF15KTIlFNZafKOpqm9dgqijF0kS1yuvVB
	8kmf2C4R3F/ctd3uagmkCF4YR3YjrOVpVBeESIkwVesg+zrLja807BbMvBEiqDFUEbeOOp2iTQhYW
	S6RjxNRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu26g-0000000FU9l-3rCp;
	Wed, 12 Aug 2026 06:06:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu26f-0000000FU9b-2cWd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 06:06:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E65443AA7;
	Wed, 12 Aug 2026 06:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C9B1F00A3A;
	Wed, 12 Aug 2026 06:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786514787;
	bh=kCvlCH6G6hLi7/+gEcb5Pr8BYZkvcHnMDP/PheZZ+p8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=Rc5RsEcS+HSaDGPeWT2EOmCf5uMhb0+Gw5gtGTo9ulVSoqWSoIcyZLXoKtVMAzgXd
	 OdfQPfsPJnqQRyde20g+7gnC1MSLqErxayupPWJkmXGxUweJrgEEib34VuE0offnIB
	 YMT2mTjj4lTyI9Ju9O7bKuaWyg9see5+X6wksX4ssVf5KsbG0kN27/cBd8bA52li1U
	 L2KWzeddKJYeoCERHZuUMft+xBtFmTNXwfDltnMtKRFZ1zuyp+bNA70mO1uEmFIgU0
	 oOcfhT3mHJEcKi9DcjJ/PNmjr+jVZQeL0KUL9oTTBDTBuYdRUxcI2cwfFqr052Utpi
	 JW6FX/UaAwhnA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260806082130.165665-2-krzk@kernel.org>
References: <20260806082130.165665-2-krzk@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 11 Aug 2026 23:06:25 -0700
Message-ID: <178651478560.5862.9382305183926307170@lazor>
User-Agent: alot/0.12
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

Quoting Krzysztof Kozlowski (2026-08-06 01:21:30)
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-7.3
>=20
> for you to fetch changes up to 6d32ae6403694035896cbf0436088fca4c6a35f1:
>=20
>   clk: samsung: pll: use kzalloc_flex (2026-07-18 18:21:13 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

