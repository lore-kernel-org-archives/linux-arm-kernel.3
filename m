Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3CCE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 02:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsE/qLp1r1cYwebJHElCIF0bGbly3qD0u8NDaoMjbcA=; b=pijHBwTXsJ9Ajiw3T2GvORhCpY
	thvfw/eM9GGngH0rhCg8tfUD+APM00ZdoISVAjb15GKVHGPGYi+FzcsBLcANK9D35D/+JeeTuK5g7
	WLSMuVvZXJXqughWLsGM+F8iLljgnT80jA3tbSZ8kAwcuDovNOVhPGNahuyYTcr/vB2CqBw056yK+
	qzF531gcvuLVUCNMfnyKniI3Y/iSrgVU7h/a5hhjqL4McQ6rkvnzlb9VGvYhE+c7Wdtu6GJJxFWtZ
	xMhZpunTZ8rlzCCS2UKEe8fu3j7aHh+YR10ZLD8hOuDY+LB8XLNwpgUYXhWlFs74/NqD42pdu+3+J
	I8x/HB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS57m-00000004HdW-3zAd;
	Mon, 30 Dec 2024 02:03:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS56b-00000004HWV-33fj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 02:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7C5EFA40112;
	Mon, 30 Dec 2024 02:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E2CC4CED1;
	Mon, 30 Dec 2024 02:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735524123;
	bh=cIMTaIWQP22lxD4w5uccVrK9JiGvXC+KewwIKgur0rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=er9idcRMKTuWjY7CD9Wyph32phBi9WA1SFSNm464Ymm3sma/+JT+nq+qf930FaesG
	 Szb2t4DretQKxdMWAFvgj1tj763ANNrmwBetymVK/3UUN0qQ/YTsdOUBe/FgnlDHFj
	 +E+THvdowcaM0191QLokZ3V8k4NZB95TPtLO0eVEdeKPWa9QATkkOIgh3DInGKDFS0
	 1fhjSFdJzjhe+DjJAto4IZtrpwZ7+KuVXWMeDlLZE5855zWfQqj+dNpDtTHXQZKZCS
	 dm4uPHUlCHltARa7rAeFZxGJr2Dg42dQXiD4NmB/93x5mkfdVjPMRofZD1RmjKMe0L
	 FGokCUhIRZA8w==
Date: Mon, 30 Dec 2024 03:01:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] i2c: exynos5: Add support for Exynos8895 SoC
Message-ID: <awtro3dlxmdhwfjr4kjtzurn24fmrvxvdnwzkesn7vca3c7yvd@ixkp2v4bmhmt>
References: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_180205_845780_BF7914AA 
X-CRM114-Status: UNSURE (   6.23  )
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

Hi Ivaylo,

> Ivaylo Ivanov (2):
>   dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
>   i2c: exynos5: Add support for Exynos8895 SoC

merged to i2c/i2c-host.

Thanks,
Andi

