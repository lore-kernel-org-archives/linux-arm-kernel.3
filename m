Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5B2C02197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iXWBGuKTd2slFjVosbshOt0ZTPb8WN08TOpsYXSsfI=; b=XjdmEWfStjS15QChoJVSt0/72r
	fEeJ4cchwqhxI3VspKrjBOXhLQMzIkcKZn3mpWWuIxIRtswjjgHDf/JeFzFuX0lX5nbd4t0QHE5WW
	gXuj1ehWRBb1prP8rQmH27Cy24ln3ixiX5L+h47tTRnCzYC/x9ZhBhGXKn/XB80xXYysz2vH/z6uR
	ZpsjHLOeUgxKB7+Y5NVb+4mJu51xEgHtKgZpWBQenUy2bjtyOzkaRpZQDyYkoBsLhX+gIvYVchRrD
	4y9Hq3m2Q7Z6c6yYoeQg7uJt7mde8gEZQODwcHFHykOlslgRzVhD+mTnZP4Zw2eEcSEPjXww7D2VR
	VqL7yeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfalp-00000002a6e-0PI7;
	Wed, 05 Feb 2025 08:28:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfakT-00000002Zwd-0PCA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 08:27:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA9785C5418;
	Wed,  5 Feb 2025 08:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E18C4CED1;
	Wed,  5 Feb 2025 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744024;
	bh=fYIY2EVBNOIAb8SVUkw/eXZE0aOWEkEiJNpdJo4l7fY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLmmQolWDqSbEZsNHmMnGiosQPzZspePvQTDKKov2RufVKPNlM7hclKPtyYnGR+9C
	 xGSYj8rNGJd8Sz/lf996VNRwMgn7Ydd11CUQ6cdkIIOc1vew3OeU72GrI7v//TvXsC
	 oaUthW3V0ZKNP8qsibVWEw4lql/e8oznkipVd26Z65LRT5m1ZJ/tM4GKBD7/BZ7/Ad
	 nIhAwTyvTaquLZPluDntegKrEw6F3pKR1hYfqQ8GBqlLDuf+jFe4Wuwex77xBsdtHO
	 9msIzeHDQ2nsnzAFOEQe7Ad//ZpgM/A6op+sSk+jAFvvwEeTmhjU+o0VHSuVo79iUw
	 d2ZgRpUB0norw==
Date: Wed, 5 Feb 2025 09:27:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: samsung,s3c2410: add
 exynos7870-i2c compatible
Message-ID: <20250205-whimsical-industrious-vicugna-3edbda@krzk-bin>
References: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
 <20250204-exynos7870-i2c-v1-1-63d67871ab7e@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-i2c-v1-1-63d67871ab7e@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_002705_182011_E55C619F 
X-CRM114-Status: UNSURE (   8.78  )
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

On Tue, Feb 04, 2025 at 02:03:32AM +0530, Kaustabh Chakraborty wrote:
> Exynos7870's (non-HS) I2C controllers are entirely compatible with
> samsung,s3c2440-i2c. Document Exynos7870's compatible string
> appropriately.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


