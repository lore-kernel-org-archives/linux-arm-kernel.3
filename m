Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761E5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 16:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i88FTKyGGz+mzbjSPcu8zQE6yrUAnt8cMWvEwzzrOrA=; b=cgbNuCpwx3xDfSikwHuZN2jUTJ
	ve1ibwiXlBJO0mTwbmXPo42auhFPcuwzqA0sQpovtcuLPOl4WiLREGvqvr78PibJd6zB5uhMTE4EX
	s5D1Zl1wdfuvvxv4pqZlmQ3wMDVQGqbBLXqf1zOJ3u4K9Rw489n29HNEML9tq+7ADX86w53QAGD7J
	C7A32X5C5Js5HFmYGuxD+d+niJc0ANrOxSiOiIBYazGYAmOJc4KPGMFDDQdMZtXI2hjX2QXXMtrpG
	dLfvymoNOXjYnmycnqo9A267z/FG4TfBHA4AgnGj/L7r/45H2u+p4E/yibC+SKnjPREf8XSzPD59I
	GOnzHGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazt9-00000000P7A-0zlg;
	Sun, 13 Jul 2025 16:49:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazqh-00000000Oyq-3Sm1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 16:46:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6E707A4FA9B;
	Sun, 13 Jul 2025 16:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7AFC4CEE3;
	Sun, 13 Jul 2025 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752425205;
	bh=g9dw72VLQAWHJtOpKYtM+S8Zwnhwl7h+5NFfEjYDrqQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aibomoIfweVUJ+BsiFGbW6qx0uIYc+4LEEfwrcbsU7JrbTRWzotDUMYINttnxbphh
	 y6D9dtV4f0ih2NVJsKitVha8Hz1oi/DY0HXh98Ib95ROFT3tzXKTXuA94MJ/FzY9NO
	 KBgJX78nFkSfDzfi31kjOhPSdLfSkoAdlFOYL103wy1TckUury0IbsfnAegMsVmf2Z
	 GrdohLTPQaZn6o0PXQ1MYZ/+ibPII9OvRBg6LbZirMBWSfx5cdQT49BM90XQhXU7Bo
	 7otxujTO9Pu7enpx3TX6PKMqfa8ozXXl2MJQx1uwqaboVwZ6x5dHiTaM93I6XkFZ84
	 O0zRiry942M0g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250709191358.171004-2-krzysztof.kozlowski@linaro.org>
References: <20250709191358.171004-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Sun, 13 Jul 2025 09:46:44 -0700
Message-ID: <175242520461.1004940.5516510155875270578@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_094647_930206_4C0CC518 
X-CRM114-Status: UNSURE (   9.62  )
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

Quoting Krzysztof Kozlowski (2025-07-09 12:13:57)
> Hi,
>=20
> Clock drivers. The bindings were kept on separate branch, just in case, b=
ut
> eventually they were not shared outside.
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.17
>=20
> for you to fetch changes up to 2d539f31ab0eb3eb3bd9491b7dcd52dec7967e15:
>=20
>   clk: samsung: exynosautov920: add block hsi2 clock support (2025-06-12 =
17:28:11 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

