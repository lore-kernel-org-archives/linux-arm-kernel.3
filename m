Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D730CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGik1thLDIWu+rUs+0ZfZjo/C0bB3KuUWWNKGA0+Bxw=; b=CpX8ZckAYLFMFY9ENcucDiChhX
	5aZKjD/wheO9ZDJ3mC/Fy6xmjQ47G4qzUlc6/yJA8iC27bkgboa/ivHXQ/TPwTEGQuKX0pxLX6G7R
	Gi0IbJjXoo5D/3D9ZFIwnQAyGvWqv5FnWfeUjz9QttOfmM5CfB2/kS7VWnoU9bPKNOCxDwFul2gU7
	qO1qsSmX7RfroDWHN80yO8x08S1hyfgNEg5LkhyKXhnkfcExU8wpBrZXny3WT+/QVUqbqJrgVkh4A
	zZt4eGJRPhL2I/u0K+XEJeoAyYKsfS1PuLcARs3/njWbOa0HX/T6BT4/SmdIz1SPciP+YL+64pGoL
	rTlGTJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTS4-00000002pox-3WGi;
	Tue, 29 Sep 2026 08:44:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTS4-00000002pom-0Iq9;
	Tue, 29 Sep 2026 08:44:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A084F406B6;
	Tue, 29 Sep 2026 08:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551FA1F0089A;
	Tue, 29 Sep 2026 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671479;
	bh=HGik1thLDIWu+rUs+0ZfZjo/C0bB3KuUWWNKGA0+Bxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m/lYIjMfw0C9EC3gduvBdvwV8OaknPDCHJaHAPcj7d+oyM1KFslpZLrgXPDQ3Py9F
	 q/h9BNzvB8I8FAWA4gb4IM6weh92WMcTixeibBeOLCjLnwREHCeODIY1ziXJY5s/Ee
	 OnsSC15sbrZ9BXYIC56KE7pLZO3N35AAlklq0HwQwVwk+T8TFGngTO9zmQzw8U7Dvb
	 m0qCJVaBCsMPOwde348kB7Sk866VTL4oukxYRxTBIPiXpR7ZoG6u+RWb1xip8fNqNs
	 86UJe0JqfckjTPXhV/dcrDfUzbdjD2aBnyFVKZvksjWAMCkOOYf21e6FR7c9txy4go
	 aX4Ls8qvhIkyA==
Date: Tue, 29 Sep 2026 10:44:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: reset: mediatek: add MT7629 TOPRGU
 reset indices
Message-ID: <20260929-spiffy-harrier-of-snow-b78e7b@quoll>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>
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

On Sat, Sep 26, 2026 at 07:13:59PM +0800, Chuanhong Guo wrote:
> Define all seven reset IDs documented in the MT7629 TOPRGU SWSYSRST
> register: INFRA, ETHDMA, DDRPHY, INFRA_AO, CONN, APMIXED and CONN_MCU.
> Use their register bit positions as reset IDs.

If so, I say you don't need bindings then... but fine except:

> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  include/dt-bindings/reset/mt7629-resets.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt7629-resets.h b/include/dt-bindings/reset/mt7629-resets.h
> index 6bb85734f68d..828919eee298 100644
> --- a/include/dt-bindings/reset/mt7629-resets.h
> +++ b/include/dt-bindings/reset/mt7629-resets.h
> @@ -53,6 +53,15 @@
>  #define MT7629_PCIE0_USER_RST			30
>  #define MT7629_PCIE0_PIPE_RST			31
>  
> +/* TOPRGU resets */

Didn't new bindings switch to continues indexes?

> +#define MT7629_TOPRGU_INFRA_SW_RST		0
> +#define MT7629_TOPRGU_ETHDMA_SW_RST		1
> +#define MT7629_TOPRGU_DDRPHY_SW_RST		6
> +#define MT7629_TOPRGU_INFRA_AO_SW_RST		8

Best regards,
Krzysztof


