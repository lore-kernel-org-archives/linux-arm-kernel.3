Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBE4CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts5h3IHCDEKKAMXIYSoviL8gJUqbyWU6ahWqxo/LgAY=; b=0+THzuqlUWldmUjIbV3VN3k9Jo
	Hmn6HKopR5jKy/CjrT+1ovYqy1EiO1X8LBbohh4Mm+gFqhQiAaApefEzSoXlMbTILvNp0y2EDcWDk
	0On9ZzyXwCDT0zoIy7/k2a2FarAu2KiXoGYkgoC/lAJ3RP9SQA4AOt0b4XiAsLNinwsLmRs+nw80v
	bfQxhg4+awmIvqUojpqEQDGazCWe4Rp+B+8sSDcdgujBhyFJw4saq2tBg29ToYFB06VXpD/GDFWkl
	5sRohhP2lAiBumaJe7YzgF2ZPBsvLd8YgzrGUKFG79ihz27kY7O5jyzTfdItEmPfiSCV8KNkDWXLx
	q93GzFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0igA-0000000ArTr-1gn9;
	Mon, 22 Sep 2025 15:42:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ig8-0000000ArTe-2o70
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 15:42:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E351B601FD;
	Mon, 22 Sep 2025 15:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BC9C4CEF0;
	Mon, 22 Sep 2025 15:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555731;
	bh=S4ZKCw/ZbiWOG5I66sB8OoE++es1UH6MK7wMJa/tgLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMToxKmXaCISE/T+s9Eq3Yk5gsGavS0cFVMAoLoMFl1bHaDJa75ges1tsrcvZ6Sxa
	 5xQ1sZllwcgBGs3BYQ+n32tS3pLQodI6SOjZbubVim6nASW6vC8hEXBfDMvBDWTMK8
	 6uPzh+9z1WVflTkR9tj2/raYa2GonGYwqhE62acPaA4IAYU60nT9Nb4M0MYmVpYyDa
	 fzStI8ztrzM3tQWu88XHKuxhz0FH64yZJajpEF4KUa+ljlBe3oi3tTrJF2P7u9U908
	 EoreqsRMSNBVTMrrXg8BMVmHO+Nze9jZr0J0AUPTP5J90ku/dmrReVU7paOaX+Eb0T
	 G0xuw3AUGig1w==
Date: Mon, 22 Sep 2025 10:42:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: samsung: Add
 exynos9610-pinctrl compatible
Message-ID: <175855573003.31769.17417715794632247649.robh@kernel.org>
References: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
 <20250914-exynos9610-pinctrl-v1-1-90eda0c8fa03@chimac.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914-exynos9610-pinctrl-v1-1-90eda0c8fa03@chimac.ro>
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


On Sun, 14 Sep 2025 19:34:26 +0000, Alexandru Chimac wrote:
> Document pin controller support on Exynos9610-series SoCs.
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


