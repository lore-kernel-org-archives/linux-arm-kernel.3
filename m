Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E43C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmIFpvKBtlFq1UGImL8pL/HWh0NByFJ1h0VyPgNnnrQ=; b=uJ+SvWNRKp+FldCXOOW3w3IpXx
	Zq8lhke1X6KUF/qROL2QDUaObsTIh1JW29tpan2sKD9DgzcB3bUA4JNP0HzqpgqoCzr5uszwsxSKk
	JpL5v6JcnkvoSc3D+lgH9FChV/mi0N7Vql0SP/OSQUCTGB8A9FA9YlzzGefvzcMZMXNFz4h1icNVP
	3KKugjg9T1U2g1yFcDd6oulQWofS/pa83aEebIVHDscv5q21xMBxtULUuVxqtTMFg2fEMLtOonosh
	6kc8LRruRUo3M53IlIf5nbKffXxWCKR/yBNfS6cRlelMUWKEoMpLWrOQs6vIPtLDphVp40U8/9hSB
	unSt1lLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dft-0000000BKJT-0CFK;
	Fri, 04 Apr 2025 09:49:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dak-0000000BJDB-0I7Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 09:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 126BA60010;
	Fri,  4 Apr 2025 09:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4043C4CEE9;
	Fri,  4 Apr 2025 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743759841;
	bh=Ouj5fvu1/IuVsQLww+KunF2lTe4LwrsEfuVusZqS/4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5dFvF6r/s1AJ6hFL+aw4Ex7sENHxJ6k6kIgb5sBiOYL3xA3jhGC3NJ8OxIuXZZnW
	 RpSXUw/Rk4nETU45AgDdijUtX3eUTyhT38iZw4UUEKtrkCvqWyXKXlYRQELppibbSW
	 aqmNSAemtrf7dv1zs+eP2liT8CfBLR7vXWnifih4wg8ZcQlGzHinDVRk2mNEcD7Kwe
	 Wv/SI4ut5tpL676jhsaE56Iohz6o9FivcpRb1zvjSeYUidJSzVP3bxgIpFqGkSK84H
	 gL8vCdkNvSiDyhY0cjRVM+u4OyedpKnf3SQ762ijYBWJjK5inDs9NkvzM4sFwTHMt5
	 daFzb90pEmd4g==
Date: Fri, 4 Apr 2025 10:43:54 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <20250404094354.GG43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

On Thu, 03 Apr 2025, André Draszik wrote:

> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).

Okay, review complete.

If I didn't comment on a patch, it means I didn't see any issues with it.

However, saying that, it doesn't mean I won't spot something next time.  :)

-- 
Lee Jones [李琼斯]

