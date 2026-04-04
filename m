Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FD9D7308D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYTaNq4cYWAC+bc6StNwgdGg+6+eETWODvrAw0ynyc0=; b=WqMg14qJPAiNhaDEN9NVOm/u2n
	evsvX/c4VioacJvWdEKNnKv61NA2bWiRLufPLo1fjb3Ah4SmMvduh5ExjzDACCMHMIsHBFyJaAt10
	6gzy2EsJ8Atpy/EoBD9oRm/er6e/575EBZq3IjQQcM0c8K1BhQNkTJ3d85lB7vtAW284Eg8MVmmup
	k9Os9BqMaZxwXA4VR1ruD5x0CSmlU8iJd8ZK5l/yxKnTQBKQXZwwOt3mpr+ijhGtiFIw00M1qOqEz
	Rxc2e/y6iWdbvrlPDxVbG+tR86Z+5+jQykTVg2xF3urVO15dFbYofjC3zWkyL8WoedjN86U0x6oaW
	zkh3V98g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w91cK-00000003VZD-3Lhu;
	Sat, 04 Apr 2026 14:04:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w91cI-00000003VZ7-3Xmg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 14:04:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1CA560123;
	Sat,  4 Apr 2026 14:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201F8C19421;
	Sat,  4 Apr 2026 14:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775311489;
	bh=xSSi5iDK6MGLdEKxP7Zro1E9EL+1Wdut6RHhjODWhro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHvpKitYNgn4WqU/hPey29AVvIOK0oV70Ldssw75PHRGFtnvtKLjSsstATMjv+VlL
	 vG1zkKyLvdVIQHyfSxPYEPSVLg4Ys6wPBKGrUuW9ysa64Rv5MwjIGSBYXwvkO5ZcEC
	 T7/OkFmivCWrIUxMp60lAiWDtblPwY+nNF/Sd7oAIo9XZjcK+ZIECei238RIuXP8BG
	 nbwjJ6AGUU9lB6X8WUbjaidSGnr235pN6aJzKliUFxkmFP2Px+CJ/KIgmFudRK77G2
	 ywAySQTyPfwTjKQFrmjfWiFjLJ038KZfD+o7bTpxNCVAhwCrkyYPD/gySDe9JwEMM+
	 MYxV3JDejbUbQ==
Date: Sat, 4 Apr 2026 16:04:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/7] ARM: tegra: Device tree changes for v7.1-rc1
Message-ID: <20260404-hospitable-colorful-swine-f5d6a7@quoll>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-4-thierry.reding@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329151045.1443133-4-thierry.reding@kernel.org>
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

On Sun, Mar 29, 2026 at 05:10:41PM +0200, Thierry Reding wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm-dt
> 
> for you to fetch changes up to ce74a6c6d88ba9ee29a6b99ac97ffcded577c85d:
> 
>   ARM: tegra: paz00: Configure WiFi rfkill switch through device tree (2026-03-28 00:56:36 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> ARM: tegra: Device tree changes for v7.1-rc1
> 
> Various improvements for Tegra114 boards, as well as some legacy cleanup
> for PAZ00 and Transformers devices.
> 

Thanks, applied

Best regards,
Krzysztof


