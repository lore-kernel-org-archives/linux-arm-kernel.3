Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B5CC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDm7QW0rn9XZYnJEu24QamC+F1DeuEX/7Bdg1ShaJn8=; b=akN7ZQJS+G8/ALd/+ei1gZmrmt
	AM54NBhipCbQxwConOeq4jkcz7NsqnqcHJ/J0p/7jOXhPHNsPgltukAo0OYRd7sXHUkaDQuLfzHOE
	Ku7exqMEoev0Wn5lXDtcnBBuhLhGnww+m5oaj3jffMXhkPXzaK2QfaZdHGkBQGSLEhWdAjk6ZXkNj
	1+HV3UOFC6o/tGXk0X660T4JJwx5xCNbMIzf1epDNnRXpoAy7KQGzgHdz/HLc8IzUxLWAcGcni4Vv
	6HP87sgMDfZ/WykA1sO+iMb+yNgvXwlLwW9sFc5YmyaJx2qROHADu8DJ98/9FWMa4rpLxNYkXtE2k
	sNb+DDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDoS-00000002fuH-30Ij;
	Tue, 22 Jul 2025 14:17:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDBZ-00000002ZJ0-0gQT;
	Tue, 22 Jul 2025 13:37:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F33060209;
	Tue, 22 Jul 2025 13:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB47C4CEF1;
	Tue, 22 Jul 2025 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753191456;
	bh=rI+1S1kmO3QI9TmwvrHiGuc2Jv3Xex+oryrpyYJLimg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VrCNr7TdjDJGqXP1DsaR6hIoBd4m2fdsKaGsIv0aSPeiwe71UTgxu0dA0DxTDWk7E
	 Fh7WL2+eKjgaqA/2p+nY+7cvcpJSjcbDMG4Dx/aqKU72SNf4/PIZ7JqxWe7a4SPlC6
	 MsXwO98fHc1XSJ5ZdFDz7zUXY2vMDboh57SwUvOxGTocgrtD5zR4dvxyUM/NcsN2Ar
	 4oVLhDepkThAe5CA4V3MZNaIi3LhIA1flPX4hYT9HdZTiRKKuOr22x06jH3/hoas3q
	 GggWp1mcqJ7kwrCcIa2tax2VmFoYemhEsg4G9UImygq+8UhN1veAZa74188YyQ4Xkp
	 XwBRoh/3q4bKA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d69c9d7@disroot.org>
References: <20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d69c9d7@disroot.org>
Subject: Re: [PATCH v2] phy: exynos-mipi-video: correct cam0 sysreg
 property name for exynos7870
Message-Id: <175319145333.114152.12348662786862068642.b4-ty@kernel.org>
Date: Tue, 22 Jul 2025 19:07:33 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Thu, 10 Jul 2025 16:42:48 +0530, Kaustabh Chakraborty wrote:
> Fix the cam0 sysreg property name (samsung,cam0-sysreg), which has been
> erroneously declared as samsung,cam-sysreg. This follows the same name
> used in Exynos5433 PHY.
> 
> 

Applied, thanks!

[1/1] phy: exynos-mipi-video: correct cam0 sysreg property name for exynos7870
      commit: f31ac39c037a77a87e210b0f6d86fdefe8fc7258

Best regards,
-- 
~Vinod



