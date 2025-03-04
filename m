Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0993CC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlkC1H6GlfM4Hx4kB9R2XcBn/wEpCBfNZPYyj4bbtvs=; b=MDI8kwioLxMgLJpcttiVYFRMdD
	3HDX3Mibms9GvsRIg3g2LpbeCbWk2DiTv4QBwPcTkSZHZJu2jIMoShr0vkyB0fEJoZR/bKj7Wk4XJ
	1lV5AkpQJQxv2INUUnvHywkOBP+WlpXC7sfFpchV8o5XKQRpDo8vz66IfgEM7sWWjTqeT7JA+qIa5
	6zt0YitgV2mkUnvq9vnxnoNx+oUbUXF1pqUKxXRZbvMo3A67aGMEnbiZcTf+L6wu72ZzZsBdJPw1h
	4tLITooq4o2aCtzrPet/bOofHrLfceKB644GELeUpBvQsirHCUC/PEqo1v/d5IcHgziztrmsEjwn3
	6b8XNtNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6N-00000004Z4F-1GWO;
	Tue, 04 Mar 2025 12:10:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQey-00000004RVr-1pKO;
	Tue, 04 Mar 2025 11:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LlkC1H6GlfM4Hx4kB9R2XcBn/wEpCBfNZPYyj4bbtvs=; b=1EiI6HaYvFggifFfi7bvm1wBKs
	6jLTW7PCJ7Oi2vW1Zf0AkcO74u/pGgwoED+2iUf225BS+ONodX0g1SV8YxrqrvwKSY8WMt6GozH1P
	Za4o+/iMmwj1Qw0wEj3pBbdIVFk7WC75pXwxpBQKIeCxbOo7uNOEimr07UiHkNUuq8vtnDXZIHZDN
	Pr+YjXaNZplYLFekBRhJMCkqBDIcsBz0Ou9tzeI5JAV3Zp0NwfswqRUul9gGRcVAKdO09RvtvpUQX
	VU6vKqFSwGb4C/efsUkU3OGme/KjRaIgYizLWDGK2QbngJTBqg+e4qWORjjtanbcZYqPjG2+8qE1f
	tsLW+eyQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpQer-0002qO-Nc; Tue, 04 Mar 2025 12:41:57 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: Yao Zi <ziyao@disroot.org>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 1/4] dt-bindings: iio: adc: Add rockchip,rk3528-saradc variant
Date: Tue, 04 Mar 2025 12:41:56 +0100
Message-ID: <3748393.44csPzL39Z@diego>
In-Reply-To: <20250227184058.2964204-2-jonas@kwiboo.se>
References: <20250227184058.2964204-1-jonas@kwiboo.se>
 <20250227184058.2964204-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_034204_494781_E5AA6D31 
X-CRM114-Status: GOOD (  10.11  )
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

Am Donnerstag, 27. Februar 2025, 19:40:50 MEZ schrieb Jonas Karlman:
> The Successive Approximation ADC (SARADC) in RK3528 uses the v2
> controller and support:
> - 10-bit resolution
> - Up to 1MS/s sampling rate
> - 4 single-ended input channels
> - Current consumption: 0.5mA @ 1MS/s
> 
> Add a rockchip,rk3562-saradc compatible string for the 4 channels of
> 10-bit resolution supported by SARADC in RK3528.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



