Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CB7CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDj6gS4OjZY9NgNkD6w0ldsCWYoDbjvu507jRBI+Goo=; b=PbHWZo+TRz0I/N9kV7NJ00E1cZ
	U6g/NASxaDD0Az1V/N0iWXdoio9RdEWMKQMS+HsBJIOESLSYOScsMGNeeM97GSRMJag4vf8s7EAd+
	sRDdLTrnZ10DLOkCPbETySqusxEinFwlGxG50ujH3NJaAiEldSKt2U6TV1ACzIDkcQjI/lWocrWrs
	fzG39VbeAJ0RmJwnKtSp3pXj2dQW8WlrcNf3mSo+tmAdnzqT+Z56P9sWHfmmEXFtGGMJegkcNUkMJ
	Kuz0e1nvVwJ93RwmWy195YXUIww/4SRzDbxDczqN6I5JzMZdNTzecm9xYyVlLPFJbw6MrKeWvzGrs
	BfH+MsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0igr-0000000Armz-1XCo;
	Mon, 22 Sep 2025 15:42:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0igo-0000000Arla-2AUF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 15:42:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B0BB4500C;
	Mon, 22 Sep 2025 15:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09444C116B1;
	Mon, 22 Sep 2025 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555774;
	bh=DtPB7vfAnTG/7K/fZ6mIHFQTPh+w/VV+8h+Wu3y3m9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IaTfLh17dpRXzYzcDIQb1yD0zsY8wX+grH2gOJaS5RpZTgg03VKqiShxI2d7klVRS
	 v9limkgRECyhwuN5cVr6j8Hf8IJJbx/44WWKXjzGnLbcaKd6ZmvXHevim2hj8z5xmv
	 0yc4y3OuE94StLQrALV9F00iFHMItOcjydxvSCb+FLjSnfJhMwsmK1wzpSYyTXK2kN
	 aRlZd37t5sstUZmhu8FxmENPjO4mgYxROkys9EVHALvd4CCTsIp0cbLWGYpBewR8Ja
	 FcS2wrKlwHF5sApduJAA7uBT1XGOUDUIkRFPt6Tiial/6NQIibr8TxVACTsQKm0Wgg
	 v4p+rg/hU7NPA==
Date: Mon, 22 Sep 2025 10:42:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: samsung: Add
 exynos9610-wakeup-eint node
Message-ID: <175855577061.34473.4077205637098992576.robh@kernel.org>
References: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
 <20250914-exynos9610-pinctrl-v1-2-90eda0c8fa03@chimac.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914-exynos9610-pinctrl-v1-2-90eda0c8fa03@chimac.ro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_084254_577736_D4D58B79 
X-CRM114-Status: GOOD (  10.46  )
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


On Sun, 14 Sep 2025 19:34:37 +0000, Alexandru Chimac wrote:
> Add a dedicated compatible for the exynos9610-wakeup-eint node,
> which is compatbile with Exynos850's implementation (and the
> Exynos7 fallback).
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


