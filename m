Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1985AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lB8AmE01x3pOGC49SN5Hh0rNVmozdHeSscMj7Yjuhf8=; b=wE+E0BWd2ipVBru5cU6A5qZ/DJ
	UyUCqoNBynUIrP4B9h9/VtXTlkSVDvvWGyl62HHgBhF74dPlQqtSB7wBqmGwtmX68rBwAAuO5pPa/
	q1bqmmn77S2qqxRBElmBbzjpVX7Vgx3aywY9ejAb/o4EW0M7U7lkLaqRKERMM0BtoKEpOyFGTDr/u
	42/xtTi69kTyIu3hseSJaQsWMUpkR8FRyn+JOh4AEL1AKdu0aQg3zuQFezZaGUcuyvTr2bAq5nNMa
	hQ3y9nlZOnsKmiPJk2wrediOKuT04t/Ok3YnzQQ7/o3qU1qxLOjs2bwpZHDvWZuej1YxrOUxB0EMA
	e9I6Auxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmWw-0000000D6wj-38Dc;
	Mon, 06 Jul 2026 16:50:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmWu-0000000D6wN-3cQF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:50:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 854C9412DE;
	Mon,  6 Jul 2026 16:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA7D1F000E9;
	Mon,  6 Jul 2026 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783356648;
	bh=lB8AmE01x3pOGC49SN5Hh0rNVmozdHeSscMj7Yjuhf8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fEJAH5pkQVrtrZmjpQE2/wRtQhEMgTf7Try6BxbnZobHx3bGmnXsGFOuqzlbpjfZP
	 25s10dXoVM3O6DHDX1cOl2CdKlJZ03SWMxxDcEfTRANMgGFwSbTZP1sxwjRovYdH5+
	 fd9/0JKD8okhGm8mSUiNGFrCaInZTVqa1IFajI42fblPvzHxq0l+mxmdjTwTIALeYo
	 6s0gqdPfEb7BP2kqjUZpZgt2M156iLmNIAUwtb09HYZe+arLHzLxvbdOhMnrGAI0P2
	 BR0RXTjP8ryIkr3+jaMmldXbJhkpjPn1nlRpegKpUuzUoLwIayUPihfZloDAFqHRBh
	 BXH8bpEHqsayg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Diogo Silva <diogompaissilva@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
References: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Remove dependency on DRM simple helpers
Message-Id: <178335664599.3964854.35900641652179943.b4-ty@kernel.org>
Date: Tue, 07 Jul 2026 00:50:45 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Tue, 23 Jun 2026 22:34:40 +0200, Diogo Silva wrote:
> Simple KMS helper are deprecated since they only add an intermediate
> layer between drivers and the atomic modesetting.
> This patch removes the dependency on drm simple helpers from sun4i
> DRM drivers.
> 
> 

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: Remove dependency on DRM simple helpers
      commit: 34d85c43b6cb3abec03d6f9d8128fb28a7e2bfdf

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


