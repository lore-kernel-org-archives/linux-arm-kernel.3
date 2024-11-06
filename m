Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BE0D40D08
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 00:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54KCy2+tWwmG7kdeIDPKVXvI/FDoFS+eIN7Y1DoFMCA=; b=TJKPGEyw1qHqD2RZ9Gck/L2YOj
	degYOEQ5fxKGKSPiNzajERHgZDSg3zYh/mQ0JD4AfGr6EpBsB1XVSdkqaWVEFtOE8LIVsPNsTqkqQ
	JrnaaORZGgQB539Dz1IkPnaWIU28BUE8i12oD1PGCAlRNmNAi2OUI5ivcD8mdwWMxvj8znPGqhw8G
	S0S3AWwoII/Ty8Aq4SnSnzgg21Bq8fcz7LS4RgpX/WPQll3ZsyUb3ZgBdWoj+8vvKOlOPOAKO8eZP
	0G7hIXz4fU7tx0MF04gJkOm0CwDfKAKiANa67bBHIul2NBBBDEOHNtqoMByg1hhtXGIHq4JverjH0
	DS/9i2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8UBg-00000001EHA-1pOe;
	Wed, 06 Nov 2024 00:46:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8U9y-00000001E8T-1fOh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 00:44:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C54E5C57A1;
	Wed,  6 Nov 2024 00:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A5DC4CECF;
	Wed,  6 Nov 2024 00:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730853872;
	bh=0IQzgFC4tYrsOmjeRzELhBNSRrs0Hh0neabXRQN73iQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EgO4amoc8V59tRojC1uZBTXkNJJFTGrZ71vwpRv4+8O3kVGiEml9X3tqOjoN4xNBt
	 CQIxSyduB1K3W9M8WNuzQxDejDS5zPjNdAraYy/1dR0Ia5jVBECwoEKeYH7KGWP+6J
	 qhjuhy5kotKJQuW8eYHw6D6WT4GKVWVrQGW8iMgtyLL30rvn2VA/TrUlOUOHeYD8/k
	 rqkh03yJD4lfU1SgqzNyVrQF0gDNiOCOF2jKcLDmzU92KXlfiKIjNr8YqLb12oqQK1
	 r1rRtXNuDWkpiHi7YTCaPCXx4XQmTKp6LOJ2KX+xo7JJNr/0u9IymGQq98qU/CE91R
	 np43H2J0k83Lg==
Message-ID: <b5e47bf3229f3145cb705cfe83951d99.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241104075037.13323-1-krzysztof.kozlowski@linaro.org>
References: <20241104075037.13323-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.13
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 05 Nov 2024 16:44:30 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_164434_519331_84BC87DB 
X-CRM114-Status: UNSURE (   7.09  )
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

Quoting Krzysztof Kozlowski (2024-11-03 23:50:36)
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>=20
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.13
>=20
> for you to fetch changes up to 9174fac3b302a853b78c78f2f5ad11462b0c54b0:
>=20
>   clk: samsung: Introduce Exynos8895 clock driver (2024-10-26 14:00:12 +0=
200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

