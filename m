Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B884CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRTse20S+VZcDuNGARAfbzTrofVPj+RJ4dQjmaTu/j4=; b=bLwaaMNXUw3bJA54y2AM041Xpr
	Te+KWYGhwIOaKf/PcE36AIk4CPJkRuDKpNjdfuM/AMS9do+9WDP0a7pXLhcf/fiewv+qY+GX0SavD
	JNJ8bzHpStRiLhaNTf9uKKeqXii1ItcfrvFO4QqTJhJbwMXarvAvO6GPYHsBUWe5oYN0Ges/01+w9
	JsHl3ytNoEbTxFqau96y/R8TKf8GaG7v8SlhxUbiGJ5viLEQP5DqbirkBS45YMSnYv9MR/xZfDyLN
	0hUebC97u+y8KrdnCIbd/TWP+gxhL5rmEtGs9H1ihU5QFPa7D88xO+MCqXmOywZWheJvz+y17l9IM
	fDsVq0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts45D-00000006ZzR-1Crq;
	Tue, 11 Mar 2025 18:12:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3pC-00000006WxM-3ALv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 17:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E5F02A460CC;
	Tue, 11 Mar 2025 17:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824D7C4CEE9;
	Tue, 11 Mar 2025 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715729;
	bh=Rz9lyXxmaf/uzAfEKbd8SJdVtz9OIb9oURg/10eXquA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i/HOHbgcZA3W7kQIsdjRhP5xRNu+hCUGvVBJX1Sx3YkUfVUaOgAw8KduexfZqjDU6
	 DTpOus9iGsjyLbU2y3v9ILC/c6Wdf1/b3gtmAtq93p8SSrpT07a+x5mH0PeY18meYL
	 qt4I38BV1GBRSCzq1Hy4xIMJA2duFRCgT2HdR+dqXUzV46k7gjFeTyolEGoNNpvMte
	 K4gnp7Pi3gMMPSOXg89PxozYI+xWzS44J10/QNOWQhoAZKUH+zpHrNEv6KryLqGocp
	 UBEq1ys/HMh6UlTaGj2Y34eHSfNqdusRzhz1JmM8Xi+3u9dmInC+9NvvVMOr7ZvbDR
	 GfgOLuyV1gDCg==
Message-ID: <3436f5e74321461507801ce5a405396b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250309175154.6701-1-krzysztof.kozlowski@linaro.org>
References: <20250309175154.6701-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: Fixes for v6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 11 Mar 2025 10:55:27 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_105530_861587_26771DB4 
X-CRM114-Status: UNSURE (   8.43  )
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

Quoting Krzysztof Kozlowski (2025-03-09 10:51:53)
> Hi,
>=20
> Fixes for current RC.
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-fixes-6.14
>=20
> for you to fetch changes up to 53517a70873c7a91675f7244768aad5006cc45de:
>=20
>   clk: samsung: update PLL locktime for PLL142XX used on FSD platform (20=
25-03-05 20:13:25 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

