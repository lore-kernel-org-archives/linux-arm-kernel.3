Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976FEC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7c7vhpEup6VOBqUns/9puAzJgpwqbpDNftz2EG8wb4E=; b=w+k7JJOz0oNCviqQT4gEcstWmO
	wjiKg6UQkp0UK+7+Mm0fXYQaPZ9JFS5ne19bjClkbzfv3hb3YMCK/afiQ+vj5c1MDMaxh3uC2e3c7
	/vdPieCX47SgppDlSN/P72jnjE8gU/0l/wtWfhtnVtQBDR4buuGY1Cketg21MUkHnne5+anePOIYn
	CQx63QCGOV4YZUaFP97VDlnsboYQFB8+QPB29WunXZCDjNgizkTwDmUjGoGVkDLp+R02R7EhHjXVk
	jYgLOI+qYzKpN6gfW4JaicGAzOaboh2J7CRcowcjtsywgE16fl5ZznKwKP1YsO01YsP8gC2o9nqgb
	k7XAuFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCTX-0000000Fzsj-02BG;
	Fri, 24 Jul 2026 09:45:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCTV-0000000FzsM-2Vfo;
	Fri, 24 Jul 2026 09:45:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C1E48600AA;
	Fri, 24 Jul 2026 09:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA911F000E9;
	Fri, 24 Jul 2026 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784886348;
	bh=7c7vhpEup6VOBqUns/9puAzJgpwqbpDNftz2EG8wb4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gmuDKJ7enNtUDQnzQgyDysKdjMH+51EhGpEr9b3ytIpOX17Xw30CpgWE49QGdlz32
	 7L8Cqx4J6yGMDRZhmuVVjSm9mcURmnuw4RW4gttNiN8j/024TB9J/JKCSpL4jo2SY4
	 GWakn7GXkvigsMzpkMysBY9JIgAjd+JQDV+a/brI6fgLo9OKBW8k1o/kBdwkzBRd4u
	 8fOrVrXB9/CXAgqMccyk9PtI9DgnRC+oyxy4pAyagej6yJDuf04avvqL71bdfJEvx2
	 +aib/ZDACXT5O6RPsmQgQH21DB3C9VzkmWDtysFxmWPWhqSJNbaYiQVgd/KbyVC3lZ
	 Tohy/JYo6ej0Q==
Date: Fri, 24 Jul 2026 11:45:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 support per-direction phys
Message-ID: <20260724-incredible-colorful-trogon-9df033@quoll>
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
 <20260721-dcphy-rx-v1-v1-1-4fc83c0ccac9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-dcphy-rx-v1-v1-1-4fc83c0ccac9@gmail.com>
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

On Tue, Jul 21, 2026 at 06:35:19PM +0800, Jason Yang wrote:
>    clocks:
>      maxItems: 2
> @@ -82,6 +92,6 @@ examples:
>                   <&cru SRST_S_MIPI_DCPHY0>;
>          reset-names = "m_phy", "apb", "grf", "s_phy";
>          rockchip,grf = <&mipidcphy0_grf>;
> -        #phy-cells = <1>;
> +        #phy-cells = <2>;
>        };
>      };
> diff --git a/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h b/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h
> new file mode 100644
> index 000000000000..60f6630f58b3
> --- /dev/null
> +++ b/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h

Filename must follow compatible or binding filename, so this is
rockchip,rk3588-mipi-dcphy.h for example.

Best regards,
Krzysztof


