Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C1BC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 07:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFbII6pAmku5DuHLpuEiBX9JCqq/DNcVaCzQwtJ/QYM=; b=nb2LuKk1xDpaoLGFXgJAES0Yra
	CjpK/j/1u4EUndRNuEFFGCfED+C70MxSDkRPsXbXbcMAjDMXDwSu1D8SEUwfy69bOgHwfOy6kn8cn
	BfnRgE0b6IIyoPL9/ez5sOFoRbYFzunDdCNAI1DDhVKe9NHhl6lCYrus72rFUN6+dCXSmn+5iS/KC
	HtnX5tvdP+4Z21YKk3Yi8HzwpA1CshURjx1Td4Qkxa1EZAFOcadnKLrlbSlKyEWg9VyQWYCGWtkxX
	wTfad7PQ1Zq4L8JnqqNz9bitCs8HxF5RDN2bFcz0NRBx5n4zc/R2W6DedQE3DCqO+3eorQ/E1Q1pQ
	auEmfyeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txi9F-0000000AOOW-3Ueo;
	Thu, 27 Mar 2025 07:59:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txi6S-0000000AO2k-2zbO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 07:56:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 178525C5419;
	Thu, 27 Mar 2025 07:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAEEC4CEDD;
	Thu, 27 Mar 2025 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743062199;
	bh=9MOdzY1W+VK84uZ8tY1V+cmmJLQHaZQN4UG+HUI98rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=erB0l3R7EZDRT5tgRtDDgHuHvjoMgzFzVBPut/hNLKYULis63NkBUwQ8amwI1nSGY
	 H+IAjZDBV2smrpYpmatjq595O6QZIhurrBae0x9QY/tSlZr09+uipP32v+6rcJpBnx
	 uDqxnJkDADTBj+t0srgIwZQFsY/RD6LNfaACBx8+UXOrkbZ3I9RuzbYBr5gTWhWd3H
	 ZZyb+TYdSqBaryp4F7vmgk65ssy/xGwpZ6de7mO+AN3QRyizHBhAg+mEpGJBB8Ht7Z
	 NDrScMHw/vxq+NwIT2Ag9iiePE0AdMOiK3uZ4dkw/Ryz4U2EPxi9zRyaCEnIw3l73F
	 3ADvX2kN/vvLg==
Date: Thu, 27 Mar 2025 08:56:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: Re: [PATCH v5 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <20250327-beneficial-crouching-rottweiler-90d0e7@krzk-bin>
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
 <20250326-sets-bxs-4-64-patch-v1-v5-2-e4c46e8280a9@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-sets-bxs-4-64-patch-v1-v5-2-e4c46e8280a9@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_005640_792000_CF586486 
X-CRM114-Status: UNSURE (   7.63  )
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

On Wed, Mar 26, 2025 at 04:48:22PM +0000, Matt Coster wrote:
> Unlike AXE-1-16M, BXS-4-64 uses two power domains.
> 
> Like the existing AXE-1-16M integration, BXS-4-64 uses the single clock
> integration in the TI k3-j721s2.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


