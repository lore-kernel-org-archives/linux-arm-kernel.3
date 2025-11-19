Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54820CF2592
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItCPUU0KlJ2MPAvujZsTATcFN+KYfrSIhrWVlPFyffg=; b=UE48kcBmXkLoG5WpDLa8opPWbl
	to47XS3fsMtWL4StZ9c6iv2tmteCOR0tw78rgDJHvcv0RWy9uuGAqO5+dQTgkiaIkvWuLDkhyMR+f
	s/5dG+OaWxH9lGAzy2Zaw0N2IHugo7UXUQGFpyBWo/gYoSFxdBsiiwvXae6Enyevim+842sf2RZSU
	R8YOBsPJVnp95MvACf7y5aYOi101oo5qqi1kyxHAeOkH2GBBmDauOBAG3/mZJ0K7viASFI6DWqVt8
	qrHDqcDwA3FTrxAHcRYmy6M0oDayP4NzwIkrwV2cIUJEAFJL6qN22GYr5tGAd8nGUwl1J6T3YeTM/
	dOtGkiZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcoi-00000002jB3-2OS0;
	Wed, 19 Nov 2025 07:41:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcoh-00000002jAV-02ZB;
	Wed, 19 Nov 2025 07:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DCEF44367;
	Wed, 19 Nov 2025 07:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0AACC2BC87;
	Wed, 19 Nov 2025 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763538085;
	bh=4eY06maHYnT5lNFH0eB7O2jDfn5WCtik/H3E/nwjWRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TVVzonaeNJKYA8WlG3h55teuPs0ljF/sh6fJ5udPN8grARL4dDzlEQ6AYz2ftwH0o
	 90EuYBY4nJW9wB+6UtAaPZ91jtl/1crtg8fI99FHW3pLbh/cMQ2Qcym+/GYFK7ELHk
	 OBcvFjd/xzefm4YhjO9lMvmJpsDhSzdFkoLySc+cC6J24XHh8Dlo9xAPloiM3l+AqM
	 Ae9bajc2lxXC34Lct1q6x/18XcL8xLnP0SfVnv7UHEGGDz50lJkjpJob8bR6apiO9V
	 xg3me0g97S5O0XFqKIposd/p/tV20k5FBkMyzl035rsCF/YCOu68H2En1lcmWYTHAi
	 929a/i7XneDyA==
Date: Wed, 19 Nov 2025 08:41:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Henry Chen <henryc.chen@mediatek.com>, 
	Georgi Djakov <djakov@kernel.org>, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 01/13] dt-bindings: soc: mediatek: dvfsrc: Add support
 for MT8196
Message-ID: <20251119-alluring-jellyfish-of-chaos-4f5bd8@kuoka>
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
 <20251114-mt8196-dvfsrc-v1-1-b956d4631468@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114-mt8196-dvfsrc-v1-1-b956d4631468@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_234127_069201_19B8D8A7 
X-CRM114-Status: UNSURE (   9.33  )
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

On Fri, Nov 14, 2025 at 05:53:55PM +0100, Nicolas Frattaroli wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Add a compatible for the MediaTek MT8196 Chromebook SoC's
> DVFSRC hardware, introducing capability to communicate with it.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Incomplete DCO chain.

Best regards,
Krzysztof


