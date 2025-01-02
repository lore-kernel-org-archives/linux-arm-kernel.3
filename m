Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8028E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 21:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yr79FsTu9hjxEghMsSETxUj/E345WSppgqicSJRadX4=; b=MAUfmPhIBi5B7K8MJnBjpRAogm
	61kdZsHzNR5XvrWE7UFl3syyhx0NpfZWyGLR9U56WdJzIDpCIK3CNU5B3J3KDL9HkdDSL5WxaV1h8
	YYb2g/8TqTu6PA/PxOJ1TANsxY3CJ40t0s2sXKq2JvGeSeXtT6Ji55a44L6UIkfPkNqGcPfIPebqx
	JqkFFvad79NRJ5l2/UeKK5BpFj1H1m0YVrRSt2nPH5QkUbi/XrRsVNMSuXJx/Y2pz8CjPOG3iy2TS
	aftwRB9Zgsfb6QH3H+qZIqGigw4s082/3R55/+eO4OfV8ltF/JPvuh6UANXuoKgfDQxKqR2PCg6xX
	BQmjRGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSiZ-0000000BVE7-22Gc;
	Thu, 02 Jan 2025 21:26:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSh3-0000000BUyg-0jFC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 21:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63E3CA41571;
	Thu,  2 Jan 2025 21:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381AEC4CED0;
	Thu,  2 Jan 2025 21:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735853123;
	bh=C7YvJI+LRX99ZvSR/QdEs5wQX3nlcDWIY1IzztElFaw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TavFKDdUK83JGvt8Jlclh+USHp1iPYjJ/7eO8nvN6yUua5m28qt2jx7m8ErgCt3ru
	 5jsoueII4K+e2Bm2vupTPp1lfOM26cX3IJ8sgQsfOKdjI7WcyTcsOiaS453s5+sifd
	 0LNVzouNOZpxb9TqQtmlP13WLwxMBRU9l2mMYc2ffmvVlYNFOnGBixwocdzEOj8B7/
	 Q5B8JFn71+PIeoc2oFeyuHXUuXZsbL+cu4Wvwyuqp3zBCiURobwVqFUwqeVXGjBoDX
	 fVAWgvFk2E6tlW5OYQ6D0VcBpqicdiTXkczyodH3x8opD8XPEv4t6yl3uOqzFMYCnQ
	 9fKsIK+xOuslQ==
Message-ID: <59579b370f7b9bebf45da98b57ff016d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241231131953.134834-1-krzysztof.kozlowski@linaro.org>
References: <20241231131953.134834-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 02 Jan 2025 13:25:21 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_132525_281208_FE5877F1 
X-CRM114-Status: UNSURE (   7.16  )
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

Quoting Krzysztof Kozlowski (2024-12-31 05:19:53)
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>=20
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.14
>=20
> for you to fetch changes up to bdd03ebf721f70df1458a720b25998a489f63297:
>=20
>   clk: samsung: Introduce Exynos990 clock controller driver (2024-12-14 1=
1:39:02 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

