Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF39C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0bAkQOyC7ySP4aSiOXNy6NHkmyBymxWCMPSfCoh468=; b=u5hFHAIImTcE6o0EyR4gYQtR64
	3a0ryb0h8p0qEXKSqL/TVyQ0ywvRMB+aIRaRXJyrW7RFohRp2h5bZwEsQIKaUDA0E+X/6DCv8pbTg
	b5ky7b1ZjcCCAaO3Xmy0gQ8hN3bllJRKffrInS8Jl6tTShWTs7HT/fTlh6+4pIVwLOJhdUzFP6iI6
	/JhQPrT78UAsXF0OF586+bf5X3lRV6UHwvJO95uv+/hkcSgwB2Ep8k4ELBb2+NQ9ayr5awzlFh4tF
	IWq0KT2f8q23fXCtTw0vefj1ABWfqBUrjBqZ/TyUGxDocjVVnOYnbNBYUzf8bdUM+GEC+uUv+A+sE
	Vs2Hkanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Rq-00000006dtv-3kZH;
	Tue, 11 Mar 2025 18:35:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts46g-00000006aNq-0BVq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:13:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 968BB5C1031;
	Tue, 11 Mar 2025 18:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC861C4CEE9;
	Tue, 11 Mar 2025 18:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716813;
	bh=rdG4W23KcTWMvPIDmswMTtwiZrFfXZ2nz7V1UtXCIG8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=e7ii9Ki5c/a5sFPriRR26qTfgqFvMrxCxw6ZTDScyd8KG1fbu2YTy+s3gAzZjvKHC
	 qtUgdLOjEHxAnT/G7zpya8pJT/QjByTCQqHae7uh57ZnBnU7JCnxaXP9Pt/cvf82ql
	 lrl9eR86Jlma6H5Z3VKq/ejXlXR/rSTI9Ab70M41Uc1bZgkbzG6wnk16/A1O3IFTK4
	 SNJvXXyDvTTANusWeBcEWrL06ymhW+kZl7WkDqqkVw3CxGUatSvXCzg1PY6GjjYlOr
	 SVMW2dIjlhrogSbONz3im7cs0/u8I4b2Fo73ExMR8ZUUdQuPa72H8HVVoZKvp91cfx
	 Ezqo24W9nKw0A==
Message-ID: <135678b71cd2853fe55c5c5c6a6d3fcb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250309175147.6672-1-krzysztof.kozlowski@linaro.org>
References: <20250309175147.6672-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.15
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 11 Mar 2025 11:13:30 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_111334_134918_5DF08475 
X-CRM114-Status: GOOD (  12.96  )
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

Quoting Krzysztof Kozlowski (2025-03-09 10:51:47)
> Hi,
>=20
> New clk drivers for Samsung SoC.  This pull includes drivers which you
> commented later and pointed out few issues.  Pointed issues are in all Sa=
msung
> clk drivers and the ones here just copy existing patterns:
>=20
> 1. Headers: I fixed it for new and existing drivers and this pull request
> includes the fixes.
> 2. device_get_match_data(): I still wait for contributors response. If th=
ey do
> not respond, I will fix it for next cycle.
> 3. refdata and platform_driver_probe: I tried fixing it, but incomplete a=
nd
> need to investigate more.
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
sung-clk-6.15
>=20
> for you to fetch changes up to 017bbc922a09630579ff7b5b314fb186b8c0efcf:
>=20
>   clk: samsung: Drop unused clk.h and of.h headers (2025-03-07 16:01:22 +=
0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

