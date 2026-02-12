Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7E1EB4908
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE/Vgcr5t87Qqgh2SdUbZlChZkDHZolRdsQDXZm2gn4=; b=Q/FL6zx+UIaaMY2k7VubNKLzw8
	1WjqMMqpWGN8k3S7zJIuGICyKBXbKOGcjjmoRfzadsgElGEeuqOjHLMhMDv1f97m98oaTHNPTh4Wv
	kSbhCMI3CRQCl4w924C1yyaFQ2rttYSWAjd2cQvyy40e3gUtj3SRlOWFsEv4Eq3v8XRr8gPwdpEvm
	6VJuefVY8oM/OBKZdrQ5LQtPK1IIjz5dyqy/RBndk6Tv/O2GKenC3S7eH7X1BxmYVlRX4YnMo95jR
	sZpkkea4NiBQSvrtpWa+tlzTH2T1qqpraL1qYrbPTxlgp63/H2JoHpuGtGDduuOseDsDxE6TqbMr1
	egv6d+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV23-000000020fo-1JjD;
	Thu, 12 Feb 2026 11:38:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV22-000000020ff-1amF;
	Thu, 12 Feb 2026 11:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC46560018;
	Thu, 12 Feb 2026 11:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002DCC4CEF7;
	Thu, 12 Feb 2026 11:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896329;
	bh=arLUKyAHRvPe56Ev5yzgeEfNbshDPUKM/yENcqUmewA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAiJIWMdGwqixyrJbqFT6iGQSV666A7TSnXGkmn9TwCoBOj9gImpE8CoT0ZrfioaB
	 XPemdtpJWzXIq9NYJ0ytrpdk2aaEhIv5xv/BQFgveEH7Xdf1y76ruS8zII5FBUGP6X
	 /KQkTTLJUL7gijaMMvqteycmdQWUv8NTrDVZkEgu5ntFB9334aY9Sbt/cZRdakLDEY
	 sTjB8KZ0ZpDZu9ohUp1FDdYt9XsUyvGkcoE0OTKyAzSeTyRH7qv63wxjRnt0C/svuG
	 MyZkBFGumVgONzBdegjlb29GSgUArmloR6ol/iMaZxY06aO/HlaBLPmOqVUZybUMar
	 Zco8WyUKkPpDg==
Date: Thu, 12 Feb 2026 12:38:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] arm64: dts: mt8167: Add additional mmsys reset bits
Message-ID: <20260212-flawless-stirring-foxhound-c9fefc@quoll>
References: <cover.1770836189.git.l.scorcia@gmail.com>
 <6f803b6dd1f61728c17afadd2fe983e9fdc0c109.1770836190.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f803b6dd1f61728c17afadd2fe983e9fdc0c109.1770836190.git.l.scorcia@gmail.com>
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

On Wed, Feb 11, 2026 at 07:03:28PM +0000, Luca Leonardo Scorcia wrote:
> Some extra mmsys reset bits are defined in the Lenovo
> Smart Clock kernel sources - file cmdq_mdp.c
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  include/dt-bindings/reset/mt8167-resets.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8167-resets.h b/include/dt-bindings/reset/mt8167-resets.h
> index f77c2ca897cf..b379f8f023d5 100644
> --- a/include/dt-bindings/reset/mt8167-resets.h
> +++ b/include/dt-bindings/reset/mt8167-resets.h
> @@ -33,6 +33,15 @@
>  #define MT8167_TOPRGU_SW_RST_NUM		15
>  
>  /* MMSYS resets */
> +#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
> +#define MT8167_MMSYS_SW0_RST_B_SMI_LARB		1
> +#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
> +#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
> +#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
> +#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8

? You just added this file in other commit. Don't add half-baked
bindings/code, but complete at once.

Best regards,
Krzysztof


