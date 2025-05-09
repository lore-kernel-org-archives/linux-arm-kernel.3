Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B466AC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXv/1Pc8OWbXCPDlOeZAHvbc1QwE4W+b0VOnpBCj3ZA=; b=Mj9rPAWTSRDpNwr1xWKe+WVApH
	1FqBc9Fmrk4IdBpoO0+Tba9fC/MwPf3z/KEMDfjVC6StVN8GgemZURee+jWrRlF1tXnlsHRZjoW16
	bW1PTtrRMgtNHlTRwaFnRt9M2rKcMWyLKBQT6ghHdakMf2NBufV6iVjd+LInthLuho4Uj6Qk00IbU
	ifH5yp9v7YU9bz+KuTWo7Zy/hKh/1MOhDVDosprxXDHj6oLlWdt2W37Q7IpdVrB8fsv85Qx8kE1ii
	+AdJqn0+yiynJRKgkDeBSf2xTpWRbiFxJgbS8qINpK+tYC/NtjNL0eUjLITwGtqbQVuiM9vk0w+kH
	wB4yIJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJk-00000004ocp-0EcJ;
	Fri, 09 May 2025 20:27:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDS9U-00000004WwA-0YBg;
	Fri, 09 May 2025 18:08:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6AA7EA4B8E5;
	Fri,  9 May 2025 18:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1875C4CEE4;
	Fri,  9 May 2025 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746814131;
	bh=pMapIl7fyKZCEmOFy48K78SJeKImJHx0SaMo77sU6qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXCtVqX5LZO8X6YmLwmFZZl4CpQw3KLsJR8dUo7wr5hesGyyRh9yFelKyutWIE97O
	 M+6a6dAtO7KQynPTDZRE0mzhrN70P+e6JcLFHxxl8JTONqLbw47BXR7rHDVP8Zh+pz
	 BuZA0nhji9xGc1bIZ1CPdc9bOOcdqOgoOq9pZ4YmHK6JYxB4R3YHaj89iwIqw5K3Zh
	 Alc6NNLx56jaOI/Iuvax/C1uluhQQobo3InDz2XinFSa9VK47KuFw9IID8WPP2BWG9
	 UAN91JlIr7djQpl6kYiWGB2cy8Qm+5OhQaZxMpcgxd/fjmOeFBsNKTVs1o3GNKuud3
	 Y6Jb/KGOADtKw==
Date: Fri, 9 May 2025 13:08:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 03/13] ASoC: dt-bindings: mt8173-afe-pcm: Allow
 specifying reserved memory region
Message-ID: <174681412863.3875813.695297684123812813.robh@kernel.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-4-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_110852_234918_F2039C81 
X-CRM114-Status: GOOD (  11.97  )
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


On Thu, 24 Apr 2025 18:24:57 +0800, Chen-Yu Tsai wrote:
> It is desirable to reserve memory for the audio frontend.
> 
> Allow the "memory-region" property, to be used to point to a reserved
> memory region.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


