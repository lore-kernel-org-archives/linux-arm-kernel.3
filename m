Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00044F3ED5C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 23:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5zSK/3k7CGhmioDVOY10i27hSasM9EETH2dk4Elatw=; b=jEZKySpwICHA1R3hz56g+cy4la
	+KgFK25Yuc1FtfVKfuJp3IvwvNt+ANVrNHhkjP2VMrZ9yKPkT3PjKZKGYMWZl0cFKOM/E1voScr8n
	hMlzGnUevudIWGgDivJg9sqhGZhn1nKDyhkMMip0GzLKxIFiUA5WcRdPta4OYVUgPESyT9hD9XLaL
	6fPvMLUQfUb2DDnOnTB6xzGnfNKuu897uRzMor8SSkZHrnPvkwX34CTBS1IarZ3Em5ulh02c0D2fQ
	Yn+ct2XvvsVb5RclnWiPSrRp9iWfePvC6p16tbnn+9CzGzBohSPjv9Xu1bPpJVvqByLNrH9zqfydd
	bL07oCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBhjV-0000000DsPz-1UaH;
	Sat, 11 Apr 2026 23:27:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBhjS-0000000DsPd-1G9i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 23:27:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6087C43CD8;
	Sat, 11 Apr 2026 23:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2048BC116C6;
	Sat, 11 Apr 2026 23:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775950037;
	bh=LXHkZxih1G2uTel5Anfkx7VPplnJc6y3RzsjrAFOjk8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=X0VJ5rh5Q72yvEaU/sDf20IVA1nppYAPQ34nBsLxWHl7GutpmyhSaU1N0U6wDAufD
	 GkNpVQr1+z+MwrS9h1D4fDyZFOJPcw59wHqMJZbeK+H+lXhjcOP7MAUVZ9Y+0IfbhP
	 LqyfQfCPJAL8kem4pJr4SLnLLtoiCa3TjfsbBmlKN3OfMkupyd9BXrdvlhj4UR830h
	 zJkDKg+asS0/83IswP9A9CNbid396PhHTygO6eY3OxyEgV7ujjVUGl8oi2HUJQdix4
	 gkkv3r6adHb4hPWnLsxHsQ1QrN6nIS2/vurdFAA1d99hHn7qFE+aYorsytc3JQR1gD
	 TkVOJGt7RWuqw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409122504.71017-2-krzk@kernel.org>
References: <20260409122504.71017-2-krzk@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 11 Apr 2026 16:27:15 -0700
Message-ID: <177595003527.5403.10199735016466496186@lazor>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_162718_358897_26EF0B1F 
X-CRM114-Status: UNSURE (   6.46  )
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

Quoting Krzysztof Kozlowski (2026-04-09 05:25:03)
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-7.1
>=20
> for you to fetch changes up to e57c36bc1a3e459239ead492ebce731a88a264b1:
>=20
>   clk: samsung: exynos850: Add APM-to-AP mailbox clock (2026-03-24 13:43:=
19 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

