Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FA5CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 00:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxibvxvu/Cmg6Eq92XlB74qBdioj7Q8C2YVkdkSXSSA=; b=uNtCGL9LOQTIt5gUd4JAaye5ZV
	p4Ad6+a+ceP4nnaY5a432NJy7+7I5YIZypYf2fnPpbihOWugqyyaupfLvsU9uorn0xxJNDqnqF2Fm
	73kFYH9IQ1NoYxaOKxt07A1QiTsRrtiQCxnyje+a6ZQe+aVlYj4swmVumvgKSlN1q6M2TBpkIpYAK
	y3PSQDT7L/TI09e0igGAIc8GNDmd9Z3Oo9pJ9mMPqbzp6jIX0UztKllJ4jMrX+7zWdFfZ/J1awXX7
	gIRjjDhcQvwodiJruOe5WKRUO0yWqlB14Dj7EuqlZcjiDKYQXXDnc0cNj1h9J8+1i365T8aMSlUy3
	EEJnFgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEd99-00000005BaO-1Pzc;
	Fri, 31 Oct 2025 00:37:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEd96-00000005BaI-1t9t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 00:37:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91661601AB;
	Fri, 31 Oct 2025 00:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AFCC4CEF1;
	Fri, 31 Oct 2025 00:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761871055;
	bh=UJ698Jno07nR5XfDleZ0Qe9g5aAp4wc2xXQE8LuHlcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y5fEdDxB627FZa/t8gM3Jz4LMui6/DhRxHay44Mqwc48NACf7ALmGzkGTlJzd+V7A
	 2EOr2EFFRGpJ/FTFId+4h0uMHQWzkPgWBY16YIKA2dsjuDOBcYq5xCrda9auLmoTpi
	 WKf98O3ORGsxYXShG/zX5gENvborpM+84Irk1joA8MRJfGMroq87lWRvJ79mmDiWA8
	 9BuoP8J4ULoqQeK452oqhEXL7CgxvkQRJnOPFukvxr8TsipvTUDvj+n5g3lmkxTL3K
	 5w7yMA/k/iuZ42Ckp6B9F/xchG0k8YWIFnR7YFDk9CClzymjFfPI8Y3tjhdLdRc3av
	 Jc6nMOTcWqipA==
Date: Thu, 30 Oct 2025 19:37:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: soc: samsung: exynos-pmu: allow
 mipi-phy subnode for Exynos7870 PMU
Message-ID: <176187105276.535345.11626627128189629348.robh@kernel.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
 <20251031-exynos7870-drm-dts-v4-1-c1f77fb16b87@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-exynos7870-drm-dts-v4-1-c1f77fb16b87@disroot.org>
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


On Fri, 31 Oct 2025 00:50:15 +0530, Kaustabh Chakraborty wrote:
> Exynos7870 PMU is already documented in schema. Add Exynos7870's PMU
> compatible to the list of nodes which allow a MIPI PHY driver.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


