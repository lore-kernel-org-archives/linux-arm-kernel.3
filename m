Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FF9E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2515bvtu+bjH4j/MSYP8q5xmCklzbCbhwNRzvXsKLs=; b=bcqoiLFlme+8EA6q6CU0yTYSwA
	7fgALYQMqzq3XuirltZM/rBeYd4NL2+jhGhawUqga2WQbYtm4QWEw87f3HPmNV4VtJJEcqNkfzy2G
	5tVtY13UNHpyQY3/3ze6IbWDQ+brFlM6lJRZs0fhnST2Sdfsc5bCazrxuxXV7YoXwugHwLYMAOSck
	LqlnmOJebIt9weBQmjabviezUP4Fn/XGvwNC1NVNVL72ltWxw0/GfpuKDQ3RNksx5G9oQP+BBESCg
	OpTUfgJLdKENptkw64QBdtnB53G7UwAmfFWPno63pDhSKPpraNSeDFJiV6S+qkTzDSmGiWEgHvqxn
	Frvu0N8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR6AZ-0000000HQsp-3nkq;
	Fri, 27 Dec 2024 08:58:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR68a-0000000HQXo-086n;
	Fri, 27 Dec 2024 08:56:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7CFDAA41395;
	Fri, 27 Dec 2024 08:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4441FC4CED0;
	Fri, 27 Dec 2024 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735289763;
	bh=bUCK5MKJ+rZPzsvb6rQdvPZgK8diuXQSd1E+oQQ1EPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdGotcxFGxaQwRtqRJMgy/G5NuvFm+yByE4wjsYbW+d/s6sAxe2GdR5ZnLkuL7utR
	 MmyAAZBZulCevbJibz5AlksDeM3Cp7VuOV06ZPOHvDT4uEdg46uB3xRWzeTzh5p7/r
	 tUjnMNZJ3pfL9sJuRnBn60DV1RdycB90asTSkIdOWeui1CbMDvKM9wpTjtmmDj456c
	 N0z73862Ax4psGr291h7xQofNqbNLUiudy4BDcmKM4sNSzrL5M7NzfDFMr4AXsgwki
	 cmhh2efOQkCUbWRZ/tee/8Y/ggUa6jIOtyI4WfRu3qADO2YZnnEc0tJT0SGtgvLt33
	 jAamby2KGMGvw==
Date: Fri, 27 Dec 2024 09:55:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, cristian.ciocaltea@collabora.com, 
	detlev.casanova@collabora.com, krzk+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] dt-bindings: phy: add rk3576 hdptx phy
Message-ID: <hh3zowf257dwwp3uo7al5l5ql7hewy7j5rzjqdt3eqvd653mdj@4tgjm6zdsuyi>
References: <20241224091919.267698-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224091919.267698-1-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_005604_143048_95442BDF 
X-CRM114-Status: GOOD (  11.18  )
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

On Tue, Dec 24, 2024 at 05:19:13PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The HDPTX PHY on rk3576 is compatible with it on
> rk3588.
> 
> Add compatible for it.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  .../devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Also: where are any users of this binding?

We don't take bindings without *UPSTREAM* users.

Best regards,
Krzysztof


