Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA152E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 08:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhAU5q4ho4ai9vViz1htLbI605GUz/8x9gnsiiLjqiM=; b=4jZmSPFfFvhzIjll8Uxvw5IxWN
	jwxMOGrDz3//CYBWPbBLZr4FVflz2Hgs99OPXQ0ME7c5/0bwRf61sud3ZIOmr5431bWfSeyx8HixJ
	OCdOMO5NaMl8iE+QBpB83atp9T6t9Z3IMf7J/5RcVfoghS1SuQWEUWXp4RCllyQxqJL1uNqJWur7t
	OR0M9i7VJrhG8v7Ue80p1OALtgKJH4iywJD76LedZZW9OnX0+n6GL3tz5hwogdTvVgTBlXy6H1vMb
	vaYHE67HIJEEibN0bV2O8hMwn2vdpkE0fln/+u2aXVX6COE9zEf4R4GOBNJ6rGDWROlooZwnHApTM
	k+aoQEJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcsg-0000000CRi1-1VFl;
	Fri, 03 Jan 2025 08:18:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcrV-0000000CRZd-2bDy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 08:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A4E9A40384;
	Fri,  3 Jan 2025 08:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78A8C4CECE;
	Fri,  3 Jan 2025 08:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735892212;
	bh=SFo7wVrTHmj2UT3fAXhWBAIUsSWCM90v+/nOeVIUeSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVyE2FXeKIqw0aVRh+ZKehBwyrJKwPmP02t6A6WWXOwkuyITLvqoC1k4NlpwfbjXE
	 eVGNwwvhUDrBB80aj5wkl2Y9BTNFv6iGN4Sq/XTKxqsYX7S8l5Zuz8U96CxyqkvZI1
	 WaJJ2bIEUe4B6g7EjxPDBoulDllr/zvsh2v3OQytxtr3vbX/V4GyKT2myn01nLg9pP
	 d5lnzAB4PtZOMPLxojj424wfkzDrwbZAKpvRptd+CX1icrEZYN1rGpg5D572WfmJVJ
	 EFpSPl3JqbyclIpvBU73MBlvkcjJXTiEoF5Dz/nbdl6YOdIzL8AP2rQSqeMPF5Zort
	 j+p9RA8/vzAaQ==
Date: Fri, 3 Jan 2025 09:16:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: samsung: exynos-sysreg: add
 sysreg compatibles for exynos8895
Message-ID: <r7yfnqeikyasfg3f7ivbjfq3fkgeingxffhxynbf5p2kyrcxx5@xl3brusctse3>
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
 <20250102204015.222653-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250102204015.222653-2-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_001653_727888_5F3C22C7 
X-CRM114-Status: UNSURE (   9.61  )
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

On Thu, Jan 02, 2025 at 10:40:13PM +0200, Ivaylo Ivanov wrote:
> Exynos8895 has four different SYSREG controllers, add dedicated
> compatibles for them to the documentation. They also require clocks.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I closed my tree for v6.14-rc1, so I will take the patches after merge
window.

Best regards,
Krzysztof


