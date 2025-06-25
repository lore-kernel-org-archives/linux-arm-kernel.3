Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906ABC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vs/BpRvqo3RSUOfPZTsHUBa9sgSnrh22rc/am0XRDfE=; b=lZuRTDJyBF7+JGDx3Y8Bt8WWIO
	tvs9fw+P49ADbqhc1NF+QDEseEMvRY/sJ4g2TLjPsJtkHYu2XnGzN2o/UgNqAW8QbH0bVMVctmCGi
	HWfWA8cWv4qN98MNr2IsZa56dEKSeFMj558BBLxguL9EVho3KU2V9nRbBcJHf6GULf6GnyShbCNrC
	xesfbtIfgcD4v50SccoQVQRTG3x7KHODztoPpycoe6zvdwqHJsHUcMLsVAETQhJbcztWrSUBYaG7I
	pwdtrzwl/Pvil04cOtrxwLAKu9aBfRSB86eAVf0o1M7SvzGZQtH+Bij6mVVAtMwv/Ee5kW7LmoRYH
	LZKXGRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWrp-00000009tCm-29Lk;
	Wed, 25 Jun 2025 20:37:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWUw-00000009oms-0DyL;
	Wed, 25 Jun 2025 20:13:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06EFB61424;
	Wed, 25 Jun 2025 20:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973C9C4CEEA;
	Wed, 25 Jun 2025 20:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750882412;
	bh=vTsBed0/2n4hgLLsMZJbBT7tPunlaecDCOUWKSB9iKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMWvYaVQPQyDYChTBCCtpkl2eJ1Y0z1/MwmTrHjVb4rGwihuNQoL74YUppu391Gxa
	 NYHED/Whl6jW+MdrNSkfFrN7M+k0swslAPnJzGPQKYsopX3SDhOBqEXJXqOJ4nptuh
	 GdZu5s/sefBWOZo1oYBlmzB6K1Ye9veNHSIJJzhsXyRG2cGTk45obyrvLL8Vqls+XT
	 siiXLstk1eP6kYUk9t1EFs+z1yNAkL/6mFncVYrzACwMO+nwqvDhpb9D5eed6O+t0g
	 3IVPM18af1RzFtGWr3jMUncGIneZ3CRsTVYxGIKZH9/OLppVixB74ZiOjvMCx42NSB
	 hwt1vQ1+WB79w==
Date: Wed, 25 Jun 2025 15:13:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org,
	matthias.bgg@gmail.com, daniel.lezcano@linaro.org,
	linux-mediatek@lists.infradead.org, qii.wang@mediatek.com,
	kernel@collabora.com, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jirislaby@kernel.org, gregkh@linuxfoundation.org,
	andi.shyti@kernel.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de
Subject: Re: [PATCH 2/3] dt-bindings: serial: mediatek,uart: Add compatible
 for MT8196
Message-ID: <175088241131.2135556.8017034319394467736.robh@kernel.org>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
 <20250611110800.458164-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611110800.458164-3-angelogioacchino.delregno@collabora.com>
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


On Wed, 11 Jun 2025 13:07:59 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek MT8196 Chromebook SoC,
> which UART IPs are fully compatible with MT6577.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


