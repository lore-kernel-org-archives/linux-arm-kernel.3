Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8296C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 22:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHkhRJYTchCNAdEzeKGcXfwAdOy7hPjIUKzMHhwgWeI=; b=Rr/hvRmzV0Qu5f+WmFmy4toUUW
	NVkds0vxGGuT5fnjyvCh7wPxq1zAdpQRJOR3or4mkawRJxbfnL8wT0kMUuM4c+PQXDbAlwIppfkJK
	wuMnRYV2unjMvnT6EEu0QQAkQWFUVds/xeKlqsVYNzm3Q+G69qytovrhPcAtI/mKjqHE3ugMVWqLV
	FRs3k0MSUva4jhdEpUDGgD0QX+OsgiUALitNFFTmGM6T9TFMST2pp8+tH1o09onkeJKu9uYf7uXR4
	TQ3ZIMtm1V1ZciODX7KqFW6B+5n0M1MYV8U1MJUDDGMouV+EQ4zfnREVG/Mu7OuZtCY7zV6/AdLve
	e9znVaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Mat-0000000Eyw3-1Eg1;
	Fri, 11 Apr 2025 22:11:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3MZ4-0000000EyjV-1aTA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 22:09:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 339EF44C63;
	Fri, 11 Apr 2025 22:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0520C4CEE2;
	Fri, 11 Apr 2025 22:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744409374;
	bh=Byg3i0eZbtP/In/Aj0I+oKXhsMDzcEgDbY0YIhV8r+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMFYkL0LKvNK2w+z2sZ1p17BsWfbfIfkxr3WtJ54QZLpoyUcqmM++BWYpI9nEo9Hv
	 FE9As9Fw8klcPXx2SMIZwzsRbAA4FtnAwAdgU0WLl6fyKqPMhXgrrNSYFMfLGI5eN4
	 l9Mhkc52q7OrnkwcpMam3+H/MwjVrocEI3izuRROpbnluXojnFFxy2cY01oVv7xx/g
	 pcxb3muTrFI2XLQ/qfdkDn6BAN6FbEeD7y9uLdsPhgR0s1NrG+Iv/XP5ZN/rcbcweo
	 XOrTle2e7I8vpaWqUuGJRZxw4xOsnhzOQBVzheg/plohI74an5fFtxlBxGX9VNUPV8
	 QzfI5ptEFaN6A==
Date: Fri, 11 Apr 2025 17:09:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH RESEND v5 1/5] dt-bindings: arm: samsung: add compatibles
 for exynos7870 devices
Message-ID: <174440935531.1983.12373348885945734243.robh@kernel.org>
References: <20250411-exynos7870-v5-0-fa297a7ce41a@disroot.org>
 <20250411-exynos7870-v5-1-fa297a7ce41a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-exynos7870-v5-1-fa297a7ce41a@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_150934_435379_2D019E9B 
X-CRM114-Status: UNSURE (   8.67  )
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


On Fri, 11 Apr 2025 22:32:15 +0530, Kaustabh Chakraborty wrote:
> Document the compatible string for Exynos7870 - "samsung,exynos7870".
> 
> The following devices are also added:
>  - Galaxy A2 Core       ("samsung,a2corelte")
>  - Galaxy J6            ("samsung,j6lte")
>  - Galaxy J7 Prime      ("samsung,on7xelte")
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


