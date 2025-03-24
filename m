Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DF0C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 17:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+yrNNCe+ysSwNnNOJNUVD3ntjupAPaYrUtleDnWFlQ=; b=Q4lWqBdaDRkgpNuFGnLsQyt4Ut
	DYk8tKFupW2eyp6rzKKMoQ+YjVJowQE5twMORsJyqgch3a+WEbsDbmMaR1XqJWmJEozqypZkkbNPp
	HFqKeaTsIya5GIoi0ATCZ3p8L6FmdPALvE1EenIBx9YG08PhIuPlBIx1oA3xSDcjuWMmo1qRg9G0L
	+/ic984b+W57t/3IjzD5N8LUmVc/c9P1U7fqZXOI6cJnDMBjZ+sHnh+/KHjtEIIhnKIcGuxykyDF2
	l0/dew5IfQOlzsDAiPnk0v9QxXB+P41FC4YWJ7hvQJVuLzP+Y8rPFdxFufwHO+3nTg3f6ES6j3av9
	5DvcP/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twlCk-00000003jgQ-29OX;
	Mon, 24 Mar 2025 17:03:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twlB1-00000003jPE-0Fsb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 17:01:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6DB505C62BB;
	Mon, 24 Mar 2025 16:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69D1C4CEDD;
	Mon, 24 Mar 2025 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742835686;
	bh=uWJNLYuWvKSvpsPRw892gm1JEBoBmwCB/Kop1T7r8K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dhxwBWqPsnqc/FF3Vh2Uq4XV7t5y8Ng7wB30cTge8lrbx9tO9gHSCqN3gBtdWPs03
	 EpxpBwBLmPm3ahwXAOUOplvw1bcj3RZyMZw1tFz6+dEnObr48te3KjBa52QkvhNTBp
	 MGEQ96c9nbqodOF5YsDbVx8YZepknuJjjkw5Mf5O5TtPEjUdeMZr8HvZ0cRsJuHzdv
	 udbLUFCDFV9rSFStSJMKni8cpM7WHPHrsL/H4cr4jyewMzPJK5DJJzsHqhYQg9olHH
	 9//4CbGTsTu/bB7IyIJcK88r5+O9BZheTpqmTHM5CP1UMBeASsvm0UdBBlg6DgtLBP
	 MZ8ngxjMamstQ==
Date: Mon, 24 Mar 2025 12:01:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>, kernel-team@android.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Will McVicker <willmcvicker@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/34] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Message-ID: <174283568389.583762.1651160249139720114.robh@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
 <20250323-s2mpg10-v1-2-d08943702707@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250323-s2mpg10-v1-2-d08943702707@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_100127_141340_77F9854F 
X-CRM114-Status: GOOD (  10.51  )
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


On Sun, 23 Mar 2025 22:39:18 +0000, André Draszik wrote:
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


