Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAB4CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lc2ORPwqKTi2nBgDXsg30z7ShSPySa+iqCWV8PfjKCU=; b=dQ2UO/eiVNCxcRSKrjq88LTaBH
	czisMFPS8qaUzvuv4vsH4l4E60KuhmhbH/okvbukkuL35VYI2GyzGMxOq+u8HEKR89gj6zJ95yQzs
	mTksRBwvqoL5h0L/T4uHYxWb7d4x3LdExq8jpgKM/pzCgD49YMsH5+tgh/ysTuq0LZD3OZtD9UZiz
	nqBOhYotGS0QnZXx5lBZUehYq8e0Sfei3pnKGk3NWMqrUu/euXFbO9B3aSugcDTg+Vm0LmTwomQ+p
	1XBcKNwxVRsI+9EjqJfx3ALARD6+lQOgzpZJTntYWhJwgoi0C1iix83bz6efl8fJWNI13l7S1v9W+
	xeCM+NAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ7F-0000000HEic-0j0U;
	Tue, 02 Sep 2025 12:28:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNDR-0000000GKdP-2GQy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0695D41AEE;
	Tue,  2 Sep 2025 09:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAACC4CEF8;
	Tue,  2 Sep 2025 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756804932;
	bh=rM31RXJJr6DeW9yhEfdBtfaLiZoooERixCvWjFfrTO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFs5QbbhMSDnCPFllEOadz1HJ5RLmSZgvrHM6+FBoqxAKE3DC++1XAnYAVcL0q8+u
	 YEG9fDdTvAkqAPxUggQQ44F7UB2vwgVH2ZyBfGgVPK0IzBqoUJlVviInMT91Gysrrk
	 zBSX58E0phh6b8KfF0XLCW8JoKPo7exvSLev/rMUT1yj8ddl3VQrTuLITvCTYW9ASR
	 J1AQ6qYEJ9DdrHu5SbO2SMPhIuA3ZhIA0keW/g6sxCtkCqAyIS99YcDWDu06I6x0Oc
	 hxHqeA09d6STD4rN5IGYrm2PkP7XoPlsU0ZT5WvlVq8a4q/vZrI789crFGmkw8+9kz
	 94L3haWzPupMg==
Date: Tue, 2 Sep 2025 11:22:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] spi: atmel,quadspi: Document sam9x7 QSPI
Message-ID: <20250902-bulky-chachalaca-of-superiority-d5caaf@kuoka>
References: <20250902-microchip-qspi-v1-0-37af59a0406a@microchip.com>
 <20250902-microchip-qspi-v1-1-37af59a0406a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902-microchip-qspi-v1-1-37af59a0406a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_022213_595046_DB041098 
X-CRM114-Status: UNSURE (   9.88  )
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

On Tue, Sep 02, 2025 at 11:22:18AM +0530, Dharma Balasubiramani wrote:
> Document the sam9x75 quad spi that supports interface to serial memories
> operating in
> 
> - Single-bit SPI, Dual SPI, Quad SPI and Octal SPI
> - Single Data Rate or Double Data Rate modes

And I forgot - wrong subject prefixes.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof


