Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0070C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 18:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Qu4A6OD2zaTbNT3/kRAQY/8VQdWHltMY2/4cAEg8R8=; b=KhUCh8wlcQsSKxNBYIBMr/JdUJ
	vlHPoqP9tItD+ow0qdyvtPMNqdbQCqOC9fXxXdYl95uDcf6KcLR4yIM4C2S0KtEPSh+7S8iyCW5LD
	dAnsy+WJk4AEzQ695UgydIa/SoGBjz5KIVnMm5eFgSLoOdoe8b9HpVE8OQgpHOn5lIwT4g8tTwDL1
	rekLephff/OAdsX+PyoK1gzSBVlSwttv/PwammJu0/2JH0Hs3p/NCr78QojR825jBEnOa/itsLmks
	9FVYaaXh7LuiBgs4qATpDwHAzLCwbsNKeGUCMIGskAkDBhAzLgvd7zdJ7Y+6h71y1VADcidFrUCNC
	bm7Coh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3fF5-0000000GF9j-3N9K;
	Sat, 12 Apr 2025 18:06:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3fDG-0000000GEz4-0pTU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 18:04:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C27DE4A117;
	Sat, 12 Apr 2025 18:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D236C4CEE8;
	Sat, 12 Apr 2025 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744481055;
	bh=1AuLxzGY9LPRhaoTY6q8rhIM2KkGfgI6Ff0WOXcz//s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PHJYj3GQNbgm4xygh+u8S9iVQVfEzlzcigjGe/iVMu2Tu+pjyDwM+UHTyctAKh2zx
	 1c4Nd+Wq6poK/9zA4vnjYJXFIDDgPR59dhic70wm8K60Hj7PPWG+P9gbitMUOq19NL
	 a7Xmb5Tny03fdbLtvJ8fYiOd9ZLf12VYgRVnyw2nTV1ZU7mf7+NAKYBm9dZd+5ceVk
	 yDdonrHRHxXO0dL2tH7s1GQq3Aj3RRGR+8IxJVVh0oBWxZ8cVI6FqOQSrowdL+MBD+
	 KA6m8FmxOE8Znh8NMkI4Xw8lEx5OyxpacrvcP0iIr2CrtcSmHKS5RXeoHNB0p3hFYj
	 PC26ATRx3lFBw==
Date: Sat, 12 Apr 2025 13:04:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: media: convert fsl-vdoa.txt to yaml
 format
Message-ID: <174448105342.1415739.9619142538994119426.robh@kernel.org>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411213601.3273670-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_110418_245929_6234AD3A 
X-CRM114-Status: UNSURE (   9.82  )
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


On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> Convert fsl-vdoa.txt to yaml format.
> 
> Additional changes:
> - Add irq.h and imx6qdl-clock.h in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/media/fsl,imx6q-vdoa.yaml        | 42 +++++++++++++++++++
>  .../devicetree/bindings/media/fsl-vdoa.txt    | 21 ----------
>  2 files changed, 42 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/fsl-vdoa.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


