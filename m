Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8367CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 03:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0unPjz1cJ93yjgAY9yZznA7O6OIZojvod7lEeNwG/k=; b=GV9a5ofwxJeeOd5eCtqSCsEny7
	2A/MtEBJPlq9uWifpjr7AjV2ZGq3oHpQmJqCI8/nSogBQuc1fYSQbAsQLCZRLde+3uK8gcl9NCbJM
	UfzAN6C57eCaPnhPux5z4xjHHDBZ7KJ9VwB3qTPUdkNlH1XFUHtFtcfpKcaeP7Nbe1lHlciJkZjZr
	G1RBOtJsDrjBpBipVmGLAe1V/AfsGlGH8M8xpDHsiCk8/7siyYheHTTKesMoPEBHoyzNU/EfjrJoO
	DvtcgE5YCkSDf5NOvRVY4dq8DmCSa8sLW8pCMbk3t5nhgy43JT2WOug+B62Mk+qpBwizgUm7wjX0g
	sG4D2/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkoG-0000000BVfc-2fo8;
	Fri, 14 Nov 2025 03:49:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkoF-0000000BVfP-2yAk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 03:49:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C131B6012A;
	Fri, 14 Nov 2025 03:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6EFC4CEF5;
	Fri, 14 Nov 2025 03:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763092154;
	bh=ehOt0d3Y8WEVeEy/LYTyszW35k4ORWoBCUm7F1SdGXM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=F9PB6Af33v6Wx8/utgZdOFV8kA8AsnHCy/zh+AmKC5LXPhvR7zG5gJ8LyyxxCv9MO
	 fHpSvtZXPDf2iqpR6NDiCNeD3DGtvYa7NAv3pGBPOt/rW/G+YcBibyGO0u+EPWLiu0
	 buX05zJOI66stYizhsGqAUyNzueKIncnyevFxyUyZbeOh2er99QBPPLu2KhADql5jh
	 /3Ov8/hjNVz3RzxAiWgkpJr7Zctk4i56igaPkUrrwAg9c3uUE1vKnMi3skbtrUMvKj
	 xAcyI69+exms3nfKsgJ+Jo7Dh3gBdba8k/9JO6j5X2W66igYpbh1rLCWUhpl1i9Pa1
	 93EaWipQdsQjQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110121344.120785-7-krzysztof.kozlowski@linaro.org>
References: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org> <20251110121344.120785-7-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL 3/4] samsung: drivers for v6.19
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 13 Nov 2025 19:49:11 -0800
Message-ID: <176309215194.11952.10938476100582043995@lazor>
User-Agent: alot/0.11
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

Quoting Krzysztof Kozlowski (2025-11-10 04:13:41)
> Hi,
>=20
> Topic branch for Samsung firmware and clock drivers.
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-drivers-firmware-clk-6.19
>=20
> for you to fetch changes up to 6837c006d4e72d6add451411bcf407e0dea4ad25:
>=20
>   firmware: exynos-acpm: add empty method to allow compile test (2025-10-=
22 07:49:38 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

