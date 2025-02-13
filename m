Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50263C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1k0W6HQuiCrM1gRvlEOD0XvLHJtHwffVjueck6bqas=; b=nwJJvIwDF+hYXgZZP9QkDNMjQv
	hG9jo47wz+LgLdyGvTsCKk+xmhzl7AuunZXmZuKjWSZs3BIIGkQ84qsoslpFJMQWTzWFzGZcnNkRC
	kYkQ85CQO9yCLyAax6Iw7TcC1vG79iD3VT4ng4wqqKRSrGtEhdkfpkXEyIz1cA8e/bfUDDUIUgyeg
	VeRdosn5VgcmRjqAOxEM8B42c+q6KnCfR5BgSzZ2hOqcSK8JccqPaE2drNGt8+0+g0MJsZQj0sDf9
	Kf2FkuemXExh1mf9lLWkWdtD20XKUEqSoZAqZ/VROX5FORtJL8l5SDlfEEmEx4vuDPqLzALo4hAwh
	TZXCWYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUmg-0000000AJLB-3gT4;
	Thu, 13 Feb 2025 08:41:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUef-0000000AHuH-0Go8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:33:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBAD05C4C2E;
	Thu, 13 Feb 2025 08:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491ABC4CED1;
	Thu, 13 Feb 2025 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739435584;
	bh=YOSaO++vZECCzgrxinsAUHhdT47ujngvImrmv9gLGZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYqnhrUzZ9GFpo5aMrXJl+nqINN01UnWMEJwAFEjqjMQFP1n6p1DNIPTekioQUG3E
	 SON/lfdY/8eu3eyZRK4vnc4f1WEac9FO+f/hMSgHRzyvXaPlSZjpsXcLVZawPWtHkU
	 9+bqrFL63FQ+JZi6EcUROpJw7cU9d9I0r2c1ybwTdqGXoftcUEGRQqFSnIj0P0NQgQ
	 Q/BnSX3ANLT14/aO7PIbU54mkc0G2HJzAsgaYroCsMUZlhk3E+UTlJ4cE1e4cQjqk+
	 iXuXOCV/Q3933x/8CyzfbpXXIfUolN84Syfvi6jIBUisc8NKaVj5XhfjW15KA3TGl/
	 anjYXMdlEcaVQ==
Date: Thu, 13 Feb 2025 09:33:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	andi.shyti@kernel.org, igor.belwon@mentallysanemainliners.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: i2c: exynos5: add
 samsung,exynos990-hsi2c compatible
Message-ID: <20250213-innocent-nimble-trout-0b7dea@krzk-bin>
References: <20250212004824.1011-1-wachiturroxd150@gmail.com>
 <20250212004824.1011-3-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212004824.1011-3-wachiturroxd150@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_003305_158346_172DFA06 
X-CRM114-Status: UNSURE (   8.25  )
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

On Wed, Feb 12, 2025 at 12:48:22AM +0000, Denzeel Oliva wrote:
> Add samsung,exynos990-hsi2c dedicated compatible
> for representing I2C of Exynos990 SoC.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


