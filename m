Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0627CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXzJBfWuLaRRRmB8g56VCZKx4Zshc8g/V3FUewgzJSk=; b=yRZFGcaqR89g3PhbF9/HqVuWg7
	No0yU/l14nea7hek3HSKBZiRLqTu4VTHGXHI8hT9p44eDF+ow8WCs1btGD5cS5D4CoOCRmGJXDvwm
	A0GAcCgPso4SlgEKpCJ+GinBpkhjnp2B+ZpEd9TZdbS62uw3usA2xf0W2JeKt2dDCX8mPZVBv6UJv
	P83/YMGnY2XF2T6okvp9nbFrrq07OWvMIJe08n3eXpgomQ8Ag4YrRPpQKkCivmYRWDuY+DbF8wKyK
	aMoMqqYdrC0ig+F+t/NhwGWu75ftlgHOS7seILJu4WbvB8lRtefoddxFCmx8TGKqAbeWHjI2r5Gll
	DQYUEMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0idp-0000000Aqi8-1sCh;
	Mon, 22 Sep 2025 15:39:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0idn-0000000Aqh6-2Syt;
	Mon, 22 Sep 2025 15:39:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43C3943DF5;
	Mon, 22 Sep 2025 15:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AA6C4CEF0;
	Mon, 22 Sep 2025 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555587;
	bh=qt/kA1T4RthN749DKajewkWwaLQT643I7MIDs/gIiDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hepOYmLKgWTZe3sA+0k35M0JDFvGh1YEQQJvG9SdVSQBeGggS1L+vwe60eKpgRzp9
	 Ow51wtB7UOJH2aufzcHo8A+vt+3YhDitdTFZM/pOYMvxoX+/76eefa0UkLxqCFk71l
	 BstznjkApiY4iFQjX7uvQG0nPezJUs2CRSxPQ80Xm1sEe3kLppg3Dq6G9+B0roNUTj
	 R1Az3GTGwg1iViumE/Y6uzN9AbvgLOfVwgroLbc5umfFxGNwMgBAoLAyvCmCjV5UKR
	 73mwOTi7BhHrAaoDdO2FaaIbAqas0DI4mIdEzSG5WnC4rZu/tAAeUBdAcHRNLXkGIu
	 Xqvksm1yRYfUQ==
Date: Mon, 22 Sep 2025 10:39:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, linux-samsung-soc@vger.kernel.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: samsung,exynos-dwc3 add
 exynos8890 compatible
Message-ID: <175855558581.12939.8168520447983756833.robh@kernel.org>
References: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914141745.2627756-3-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914141745.2627756-3-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_083947_642099_8B5E1220 
X-CRM114-Status: UNSURE (   8.79  )
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


On Sun, 14 Sep 2025 17:17:43 +0300, Ivaylo Ivanov wrote:
> Add a compatible for the exynos8890-dwusb3 node. It features the same
> clocks and regulators as exynos7, so reuse its compatible.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


