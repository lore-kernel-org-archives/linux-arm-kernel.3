Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A442FD5A6EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 07:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbhcOJgLkps+UeGh/efFie97r6G3L7a5fAfWJSpEoLs=; b=mejzPZSDdBuinjND0yoNjkxeW9
	M2yOe95J0kn+EwQRt2G+eSInjvLW817LDHTtiZ5vWHDG1MhS0q2oPsM14Voh/aA1TjSd6X+ZU+Kd1
	ZhESJZklmC8av/lkFK0azKN/D2ELGCxuhbK7yn+od/t8eHa0p9vwRCaEUyo0CWYmYAM3+8DCZKfnJ
	QRSapDJzQbhA758l/riFL+zFLM042jV4K3ETBHXpGBcucW/p9zbYRT65udhwnXPIarLWZ8IrKsWfh
	PLzTOagwXZaCPtJuwGlLX62oyff+ganvp6BJpoyawxrvlAJNj/cMZ7iKC+6sK+ijCYNnjXsKoMNr+
	pdV5M+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFpao-00000009nk2-1LzL;
	Tue, 26 Nov 2024 07:02:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFpZp-00000009nb6-3UQg;
	Tue, 26 Nov 2024 07:01:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF5795C5CD2;
	Tue, 26 Nov 2024 07:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00088C4CECF;
	Tue, 26 Nov 2024 07:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732604496;
	bh=pnZXHU+pm2FOHMliUsr0+YCgaJf05DWVG2lDNbNCuig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cB1i18XR6w6irbGEd1ZTKwH7OIigDPHYg8Kq7GONOGgjSvHx9ED5Uy5IZAIVXiewU
	 iT/FmiBEtqg27QvoY4/voafulDNNa8hgpMeram6kKnl8Lgzzn73f7ifqI3rWv6Qolc
	 r77J9ny+nyejUCgpl54W+wInTm2eFv52l2qPXRXLytmXeq2F2cBp6xP0+VdQeZ+0TF
	 NV3ms8WC66GumGf9xreRBkZrL2++LEctZTHQeRtj9KQX6S5fjLLeRAgypIRbJ07VE0
	 j8Gzqk3LJXCV1ue+0StVHe5JtQ3U7guTatPqjINO7GlQ1Qr5rzBCZdqAmEzuBpfNyX
	 2m+H9dmOlgNAA==
Date: Tue, 26 Nov 2024 08:01:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, 
	aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com, 
	dmitry.baryshkov@linaro.org
Subject: Re: [DO NOT MERGE PATCH v4 15/19] dt-bindings: firmware: imx: Add
 SCU controlled display pixel link nodes
Message-ID: <6rijytubyumhgvhlvzx3dtyfncknizs3iz7arhno2mjottyu33@subihom7khzl>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-16-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125093316.2357162-16-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_230137_911729_1DE02516 
X-CRM114-Status: UNSURE (   6.86  )
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

On Mon, Nov 25, 2024 at 05:33:12PM +0800, Liu Ying wrote:
> Document SCU controlled display pixel link child nodes.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4:
> * No change.
> 
> v3:
> * No change.
> 
> v2:
> * New patch as needed by display controller subsystem device tree.

DO NOT MERGE means also do not review?

Your cover letter does not explain what you want here, except not
merging. Why posting things which should not be merged, without context?

I'll ignore this patch for now.

Best regards,
Krzysztof


