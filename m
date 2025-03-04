Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293B9C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7BcUa5tXuPI+9vyDPPd0uTPj0O1MIEgTcdt4y8X5tU=; b=pO5Gb6MZKuLFyKIm4TzU1mDqeW
	8ImE/oTLQABEfGbt1vdyofDuI0yQMrtsIRcoKvofCOxjM9uCQlQYSU3CwSAkxw8oCtS/0sjp7oaFc
	MpGtJRr6aYIUYJOuj1q4aazrrHIw1sggBBzsMogykTzPri5uXmVaACfodhEl2bERtJub+QNcWyUth
	kBtnbpvZfR76AgJa1IS21Nm9/xdCkLEkyrCqNoUEPQlaee94kxFsy1b29aD0+wmLAp+1qFnXUOKP3
	ulUYIzxv9fDDnzkQJLRL0dCdb2qSuCcYN2iMyPs5z8rbZ2t/nOtWZR+uMxi3pc6TZs9ZGXQNZT+zJ
	5XxUlJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6a-00000004ZRr-30mn;
	Tue, 04 Mar 2025 12:10:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQoT-00000004T30-1HDn;
	Tue, 04 Mar 2025 11:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A7BcUa5tXuPI+9vyDPPd0uTPj0O1MIEgTcdt4y8X5tU=; b=QPJ6gZNrDg+cxTW7LNvXVCBkBa
	vVVjUmrpV/aKqbXivqMrAWRgJM95syI/HRd9sZvfpQu/kC/1Ip6QQ+esHqoXHeXNSYTUcXyUmmgTZ
	p283gRFz7GFEkUcHG8QO2fHVnWFTkvkZyfhh6s7RojemqbYNuA7oqEBua0v3O2mraeXydfyi/1K7k
	zWk/eFlMzDvZcBbXeTxqu2RpovRA/0JOUPrtm8bTg7lzvVUc68ueOWe9J8NR6K64XYhymSePYXUdW
	6I/ysTA70vUeGAJeTkkWPCR8yrR6YkyTQwTlfD3ro1qKFv/aqwDA0g205iPenC6GoXSxnCRjBQeFQ
	GCCktRBg==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpQoO-0002uG-3k; Tue, 04 Mar 2025 12:51:48 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 2/4] iio: adc: rockchip_saradc: Add support for RK3528
Date: Tue, 04 Mar 2025 12:51:47 +0100
Message-ID: <11022969.nUPlyArG6x@diego>
In-Reply-To: <20250227184058.2964204-3-jonas@kwiboo.se>
References: <20250227184058.2964204-1-jonas@kwiboo.se>
 <20250227184058.2964204-3-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_035153_345259_B66177B1 
X-CRM114-Status: GOOD (  10.52  )
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

Am Donnerstag, 27. Februar 2025, 19:40:51 MEZ schrieb Jonas Karlman:
> The Successive Approximation ADC (SARADC) in RK3528 uses the v2
> controller and support:
> - 10-bit resolution
> - Up to 1MS/s sampling rate
> - 4 single-ended input channels
> - Current consumption: 0.5mA @ 1MS/s
> 
> Add support for the 4 channels of 10-bit resolution supported by SARADC
> in RK3528.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




