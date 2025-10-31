Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EC0CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 22:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEa69CK3CTq5tuu64iEIaNtjdvD8PfZrn4NwDRYVVEE=; b=v00AQSxJth59XA1VQr+wAH2mI3
	H7K3nNHPmNM0T3oRscLBDqXLGYVgk4NRE0fqejzZl86d7AqlpXxdvq56UnjrmJLfk7tYS4UcDInSv
	/l49FiLCWxW4LSOVhdjVJ/HrD0Y5aenqMmTzIx4aDLOSeurh/8R5pi42F7jBzAZwq+tHXw8Iu3smu
	VxdCTTFwz3ua3PMoNEp2nCcvv2KKQUNvROIH/xccI47MbL3cFDvZcwK1iL68Nc9/dGoA0dh7O4gyQ
	/SAUtfUNwdYZCf24QaHrkGQzO1zJujkeUjd30WRXA/EjUaLfnv6j92G2n9XqACtJsnMrGRCuMx6yb
	1LuQgrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEy0B-00000006suj-2OHQ;
	Fri, 31 Oct 2025 22:53:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExzz-00000006spX-0Y2B;
	Fri, 31 Oct 2025 22:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=tEa69CK3CTq5tuu64iEIaNtjdvD8PfZrn4NwDRYVVEE=; b=K5j1YPLLAPK8LsJ15mP9RfnJ/y
	yNCYG+xKZ9qHW713h9oRYYDBbccv98h8OgqbYMmGcA1OmNOwu3jYUW0GCFUhP3flN6BPRv1upMntW
	HGRaTFqzhwEXjPiJEvOJvhb7DhJWJGsxGV/tOEGJgEbRdfTnhzl+u16TDTWhuoo6XKHSjjuio0OGh
	UaYh42F2VcruFlaf4r+m1LDHhj5RFHl+3DJyOFXI30I9Hyl73ygzkkSazlOr5JkYwlmiCOt+3VzLG
	ssTlZ6uFd5HwHXWZRqQ4xfjhoODXTv+xVlg61DyzrO2lkY9+1aSGbNoS94mnTsCbOibUgwfIGsg+/
	nEcZCRdw==;
Received: from i53875bca.versanet.de ([83.135.91.202] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vExzr-0004vM-52; Fri, 31 Oct 2025 23:53:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: include rk3399-base instead of rk3399 in rk3399-op1
Date: Fri, 31 Oct 2025 23:53:20 +0100
Message-ID: <176195118797.233084.5136305180547007153.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251029-rk3399-op1-include-v1-1-2472ee60e7f8@cherry.de>
References: <20251029-rk3399-op1-include-v1-1-2472ee60e7f8@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_155335_176829_D50D109C 
X-CRM114-Status: GOOD (  10.14  )
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


On Wed, 29 Oct 2025 14:50:59 +0100, Quentin Schulz wrote:
> In commit 296602b8e5f7 ("arm64: dts: rockchip: Move RK3399 OPPs to dtsi
> files for SoC variants"), everything shared between variants of RK3399
> was put into rk3399-base.dtsi and the rest in variant-specific DTSI,
> such as rk3399-t, rk3399-op1, rk3399, etc.
> Therefore, the variant-specific DTSI should include rk3399-base.dtsi and
> not another variant's DTSI.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: include rk3399-base instead of rk3399 in rk3399-op1
      commit: 08d70143e3033d267507deb98a5fd187df3e6640

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

