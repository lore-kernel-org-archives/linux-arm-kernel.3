Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37749CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 01:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1fdyORPeXwVnM0sOVGVQvdONUxVTJ8NIxo91EPGSlk=; b=K4Hg5/jycI9VuijsJo1B4fdG/0
	bRX/fgcJ82CVR6RvN1HAwbxcu2y7riCzU18cGYiGDpY7JxoQc5NYFbe7UqvKuVZ+pdoX5Q+/2GnIR
	KNQewJaZjj4DGqApsAiEcaI9TiSMqB3UqLcYfKsTGYIFboisDkHQ8ADvoHCTAfRzytQwukdUhToUr
	j+kOf1NRxa9MfSKKuxeToj0uf9wKrXJYf7QEZvZ9akMemHAdprcj9CKcdiljFZVKCk3aUOo+7L9IK
	tYW31DZjRiS16eH/IPKr/spaiv+jys1i12lna51q9behFAgTbNMvzH/ysNH6Bk26vOY6wXRf4otk4
	npNHDOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSlud-00000006bef-0nqW;
	Fri, 29 May 2026 01:21:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSlua-00000006beG-1QBy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 01:21:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6D1541B01;
	Fri, 29 May 2026 01:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B975B1F000E9;
	Fri, 29 May 2026 01:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780017678;
	bh=B1fdyORPeXwVnM0sOVGVQvdONUxVTJ8NIxo91EPGSlk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=BRRkDF6C3Y/8wKPLSY2UI6GE4UPn+NNGrXIEkvw9z4hhbDF0brwaep0U5uRv4IMZM
	 mYChWO7smrWL8eyDT1Ai/DTGyOmykyRusloWJbGrkk5Fr+lpRoPxCS1t9Rtpo2kmXJ
	 BLOAaHtC12BAYr7hhR+3w5U/cAl8x3iagRp9tMgOmAoG3FwhQqz5QbRuxWtN+x5qFe
	 VRkJYgfhNCCU9dpeTGinUSCKRdDGg5iFVNWVzsTi7YVi9kt96WYlkdtETYKMfOKXCH
	 1m07QTybfBKso3cSnUM4S6ZujoEVcNMK5Ey2ZO7DcV9OH4xuheZUKTbM1oDN+MiseV
	 hTFdkj7bp5eOQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260524184701.16599-2-krzk@kernel.org>
References: <20260524184701.16599-2-krzk@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: fixes for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 28 May 2026 18:21:16 -0700
Message-ID: <178001767699.5961.8049719569121972475@lazor>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_182120_394817_0D6F611C 
X-CRM114-Status: UNSURE (   9.21  )
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

Quoting Krzysztof Kozlowski (2026-05-24 11:47:02)
> Hi Stephen and Michael,
>=20
> Just one fix for current cycle.
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-fixes-7.1
>=20
> for you to fetch changes up to 78ee734b36284d82454e87a92094fdb926985b47:
>=20
>   clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs =
(2026-05-14 18:48:05 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.

