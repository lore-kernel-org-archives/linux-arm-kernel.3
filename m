Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6304CC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9WySju8gNe1rIx5TXt5dUVyvNo491eZ5wqE3A6V9/w=; b=gFuCTKmsbOgt6CuRxPtp29rlqc
	xYprLUTwSzTEnjR3gidIEOTfZ6Sq2uIUfIeBhCF0llsN9y43R0qTudpFhN4AuRcqv8W5zXewm0Ay6
	p/LNFlpa4mfIfDbxE5YnTPxUwAfaqDy4RBjCd5C2JZdXRXWtvsKphji8cCS1XbtpnBYdcGUOJOkKE
	0uvZTMbwl204QNAenB4WODDdXtJTLpReha30ZJ3hQiFtSlxe+Lm5NZqShwmyqh6W7vcTENreM9W5T
	dzCXyW19oMg3YZCTvWOvrucg27VzB2VFM1oeYsJYqmD2cSngeGuPIN5SZ9/S/u+dk2vYwrsBRJhjJ
	ppl7bdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlUC-00000002yjO-0qxv;
	Tue, 11 Feb 2025 08:19:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlSk-00000002y80-3Kgx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:17:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7012CA4014E;
	Tue, 11 Feb 2025 08:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DB8C4CEE6;
	Tue, 11 Feb 2025 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739261865;
	bh=Rhu162EIhM1z2w4T5glLEdRgvuphMT5lNfv79kXrgZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fi8qdzTNv5o5L6fULK5uB2A8iFz0rpLxfz9BzCcQbs++3URe8eKfSZyPMv0nGybMa
	 ENrEJh94hP0C8V+77xFjgzwwam64bLelN/HEgdamZ7MmlHYUAm3O3kQcww8Pp1vF89
	 gqBgHPMW6KrAG1RuvyYW1kI+4cLMj+KJaMVJ9vPNd1uZ4NGrI/PydQOtkzLiaNHOVz
	 p7EgbGECVZ+jfPckA1DTVPSavkJV0ih5VQbkcRIyVdV2Cv8KVvhXrOCxHv8NGaVVfL
	 8xd+tbRE8u9h4N1UeDwahSTZqxFm6Pc68LkMpMXcxuKvv0azhCbEsUAM6iR640mJE3
	 X2qJ4ZNQc4nmQ==
Date: Tue, 11 Feb 2025 09:17:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/3] dt-binding: clock: ast2700: modify soc0/1 clock
 define
Message-ID: <20250211-encouraging-free-aardwolf-0fabb1@krzk-bin>
References: <20250210085004.1898895-1-ryan_chen@aspeedtech.com>
 <20250210085004.1898895-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210085004.1898895-2-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_001746_893767_63CB3469 
X-CRM114-Status: GOOD (  12.24  )
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

On Mon, Feb 10, 2025 at 04:50:02PM +0800, Ryan Chen wrote:
> remove soc0 clock:

Why? Your commit msg must explain why. What is obvious from the diff,
isn't it?

>  SOC0_CLK_UART_DIV13
>  SOC0_CLK_HPLL_DIV_AHB
>  SOC0_CLK_MPLL_DIV_AHB
> add soc0 clock:
>  SOC0_CLK_AHBMUX
>  SOC0_CLK_MPHYSRC
>  SOC0_CLK_U2PHY_REFCLKSRC
> add soc1 clock:
>  SOC1_CLK_I3C
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  include/dt-bindings/clock/aspeed,ast2700-scu.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/aspeed,ast2700-scu.h b/include/dt-bindings/clock/aspeed,ast2700-scu.h
> index 63021af3caf5..c7389530629d 100644
> --- a/include/dt-bindings/clock/aspeed,ast2700-scu.h
> +++ b/include/dt-bindings/clock/aspeed,ast2700-scu.h
> @@ -13,18 +13,17 @@
>  #define SCU0_CLK_24M		1
>  #define SCU0_CLK_192M		2
>  #define SCU0_CLK_UART		3
> -#define SCU0_CLK_UART_DIV13	3

NAK, ABI break without any explanation.

>  #define SCU0_CLK_PSP		4
>  #define SCU0_CLK_HPLL		5
>  #define SCU0_CLK_HPLL_DIV2	6
>  #define SCU0_CLK_HPLL_DIV4	7
> -#define SCU0_CLK_HPLL_DIV_AHB	8
> +#define SCU0_CLK_AHBMUX		8

NAK, ABI break without any explanation.

Best regards,
Krzysztof


