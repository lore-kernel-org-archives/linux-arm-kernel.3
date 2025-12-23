Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7AAE6F091
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2m1nXDkMRbgyrNZ3fWvlis7fsd1EOi9IRHGFWYhTUl0=; b=CzUtOCl/9vsti1ez1XKmTHSsnT
	HegNx481+k0oMnHdHfJmoLgX/aaKwXhno12DvpPw//I4y4KOYJskhZFdTEtgvPi+lLeVE6vqf9sno
	J1/SU5zUJXnICYH/wCuwkijOvEEt/D5yo2c5vas6tjgXxGz0VViLJD2fO42+XCYyMJ5ptWZyl795w
	DE2+MJm6EX65kNsBrIY4h8GxoxB8x1zCHiPkP+gHz8OTOQo8g7oCOgwt53j5b6Hk1/ioDy3jyMUko
	EJWTNAaBW6GtNKYCc6lliiaOgwOmUzr1JdrKxInNtqeuV9L9bKzSxCPhNbDWE2Xe83zJ+whaXnQ7D
	aip/HR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2q9-0000000FZ0q-3VdD;
	Tue, 23 Dec 2025 13:54:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2q8-0000000FZ0k-40wc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 13:54:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64A9360123;
	Tue, 23 Dec 2025 13:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBEDC113D0;
	Tue, 23 Dec 2025 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766498056;
	bh=AiITmCreaKBX7HKqX2F5SX04cacgCiPL74DHqx+cHiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrmsdykTICzc1mqAHBjdG9SAc/oCv5sxGKGxwnXadPn1+LOy1LVhoMMzrBhhBkuDP
	 w2K07fAkYvb3vTL6xolLw35bpdOQqJAmGrdrEwXfdrobtJe8tibdsHa4nwC/pq9P01
	 ma2qh2+JsjFFIa5o3aZRLYbkNVhyEfQadnc+P41mkK60xosPQDc0Sptz3Mj2dwkopE
	 jRCW2U+pVv3Jkgfmi6+LzzJZkDzq6lvnXARy4IeKr+89d46c9FCsLBqnxIbP0m7vCQ
	 Kkkf5GPDTZxUkPZwNK6G3RvQHHut/6W6guZ9aCsNxLfbAKZ1jqx5wLKouSTNu7anUo
	 F1Ay4F91canbA==
Date: Tue, 23 Dec 2025 14:54:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
Message-ID: <20251223-ginger-worm-of-swiftness-a8fa05@quoll>
References: <20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com>
 <20251222-ventura2_initial_dts-v1-1-1f06166c78a3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-ventura2_initial_dts-v1-1-1f06166c78a3@gmail.com>
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

On Mon, Dec 22, 2025 at 03:45:43PM +0800, Kyle Hsieh wrote:
> Document the new compatibles used on Facebook ventura2.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


