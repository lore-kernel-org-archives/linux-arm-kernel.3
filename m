Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D60C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOMiR1W/GUxwJ4AST7wnuw2bGsxmJ1OowzKsFQ2gXso=; b=PUFCgPEYATtMujU5w/3cLomO0A
	QMQVH5A6F+V0lWv1q5+8p92bXUt9oi2yCNvYqn9M5feoUero8/Q+1AUzv7QEaHiGWxcoHzsb56/4C
	huauZNnAw95MtDG39kmb1UvarA99zLgPYBm1GIySU1QIQZ3e89rkPVOLZezsvwquyxpOhE061ChcW
	/ylSYr+5+YKZWWSpM122NpWe/HIC6158DhY2xretAac7cuTrjsa17Usmen8UQ3BcVKQxiW8v84J29
	EiK2OkXxcDQEo1iFfH1aGvu23rLqeghwJBVrykPZGWjZxNOVBAGC3sh0xPENB81Zq7KSDTcqRGDEA
	+JaPyX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn00T-000000011xm-1U8G;
	Tue, 25 Feb 2025 18:50:13 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzkd-00000000xPa-0ASm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 18:33:52 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0F7DD25BD1;
	Tue, 25 Feb 2025 19:33:46 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1dBkHBe77xL; Tue, 25 Feb 2025 19:33:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740508425; bh=jp2yqcBPM39tFvgEgMaZVXnw5dMZyLhqY44ScHtv4kI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Gz7hXkKS3jutX5YjgNDJO4KQrSMImH+3D36rkzBlUXN+V1hPOJ/N+0jeRMp7zfsDJ
	 dIBskGdwmi5QlUyROcGfw0wkXVbbqiqPZS+ygjU5Jh0B65LAkIcPirxmmfFvY7Q/Rd
	 FoooKXLh4nZWOd67DLkv0G4yzsj7iZ191SxyznPM/+JvAzpaplfxRmQORp1W/ZAiKb
	 NZ9OHL2uQPtu6ExZDIsHA5dHPXN+DCXYR1Wl98Y5tzBHN6e4L5Li/MqHREja1yUjEO
	 3keH+PLviQgImqUcaCzSBJi6jMr/O43QUzhJ5ItTzl30yWgo8XrK4mrGR3srg67PY+
	 v9H//aE7zPWTA==
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 00:03:45 +0530
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH v3 5/5] clk: samsung: add exynos7870 CLKOUT support
In-Reply-To: <5670d992-71f4-4791-94ff-4fadc1fb5993@kernel.org>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-5-0d1e415e9e3a@disroot.org>
 <20250219-discerning-affable-chital-1fdff4@krzk-bin>
 <e2ebd4503100ddbbe8d7e21290329e38@disroot.org>
 <5670d992-71f4-4791-94ff-4fadc1fb5993@kernel.org>
Message-ID: <b45362334fc448bce3ef069f34349eb6@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_103351_218417_B0811912 
X-CRM114-Status: GOOD (  11.75  )
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

On 2025-02-25 00:43, Krzysztof Kozlowski wrote:
>>> Do you use clkout, BTW?
>> 
>> Using the clocks defined by clkout? No. I added it as downstream
>> had it too. And the devices work fine without it. If you want me
>> to remove this patch and send the PMU patch to its respective
>> series I'll do that then (unless you object or suggest something
>> else).
> 
> clkout is a testing tool and I doubt you can use it on a phone - finding
> the actual clkout pins to connect the oscilloscope is tricky.

Ah, then it's of no apparent use. I guess it'd be better to remove it
now. If required, it can be added back later.

