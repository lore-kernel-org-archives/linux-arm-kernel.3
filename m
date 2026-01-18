Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D12C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 10:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djacek+PzgljqUNpxKG/4FqVUvzF3crvBXQh2ZcVR6U=; b=MBKzKc6Co2xRLMiUD5UGg3gWCd
	LlD7GJH8A2i1HNL84KOPSryhuynjXX6l/P6JVeVBzh/pImOd0hDO5Nlmb8PbIebn0jJWiOGoSTmJ1
	Wsudnwrf0X36WttDQGAQHUOfNIcT2Ap1a8bLaLXEfL5P2q5Q/YcDiw6PoH6Va9iR9nTpamM01hbiq
	+Z736H237qsI8p8JYNBV9ZoTQJwVbydjqnSGwNUJelBSyo98mQwEx1UG81lT+kWBwRtfKAmjuLCEz
	1ODxaL8TeNI9eKAH5s2/T2Wz3JWH5XaXwOGjMMntKu/9j8HnbXYeuWLodI4PQCaPSNplrGp79TxW8
	lO6RFNIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPuZ-0000000HJte-0J0C;
	Sun, 18 Jan 2026 10:21:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPuW-0000000HJsV-2ju3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 10:21:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AF6441A0A;
	Sun, 18 Jan 2026 10:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FAAC116D0;
	Sun, 18 Jan 2026 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768731692;
	bh=MJ/WTcCQVn5ZPmWc0MlqQHQO30rxkRLjFAJjMF+vpdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C42Pc/2aoxnPfLZTVaspSQ7sLfoI1nqCfz6LUamigZ16zFYqwXA1PVYgn/d2zOdJR
	 sNFTCRvgAZ7RqnaAv4K9N7UXYtPr06+ejcItBIWazrTmPMBawvzxlTS5ACy1lznj2b
	 o3TsceRQIptk+OXVwrJtbYpVRrHIkkUzPvKqLcmA1pI6aCRni6HyHcld3vZYChZZq6
	 c2m8/dXXSmzCh7EZ9/Y8lylwTOo2rTE/JqXmiuMxEifR6DpLxme5sPu5y/taerBP1m
	 lAlkDe+cZ725rC5OqU2zl8lO4dA4AbMmHxmc2CEdI0B+LLlTdqKfKtKru32m1fFfKs
	 RMK6O5cJ5N9lQ==
Date: Sun, 18 Jan 2026 11:21:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, bmc-sw@aspeedtech.com
Subject: Re: [PATCH 4/5] dt-bindings: gpio: aspeed,sgpio: Support ast2700
Message-ID: <20260118-cunning-robin-of-greatness-4c735a@quoll>
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
 <20260117-upstream_sgpio-v1-4-850ef3ffb680@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117-upstream_sgpio-v1-4-850ef3ffb680@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_022132_716431_359C18AB 
X-CRM114-Status: UNSURE (   9.59  )
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

On Sat, Jan 17, 2026 at 07:17:11PM +0800, Billy Tsai wrote:
> The AST2700 is the 7th generation SoC from Aspeed, featuring two SGPIO
> master controllers: both with 256 serial inputs and outputs.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


