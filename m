Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97529C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 14:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MgyyWkA5i2Vr6V9aqMW1egG4E2do05O0GG3l1r8Mow=; b=wFykuV+XYstY8qQ09HOXc0fVB7
	wrbIoBkZYie6YYuQlc+gw2DtWIhCQbqNv3kwSirVik5RTNpYFSIP1lmw4ZfVH4cSIovbzsNMk0bUn
	FTvFFlj/NaqU/TSftv268f9yyriwBdh2OQcSojzw2kXmYPEOQDyyWSuh+MbhyGyY2qpujWWMlgJVT
	DCZnFWnI6aA9dYGwXGlWwuNHt6NbFROjAIEf+o0CiJ64/FgxI4LLPBCCXggVQN/bbhPVn0hpXWR0I
	A6Bjv8bho0owasZVEDIxKKHfxWrXsV/XBpGSbRI8I57E47H5y65vxDRLYgVRBnSLs6GRNNxrxqnyM
	7NJQjUMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8av-0000000D9Ca-3pYM;
	Wed, 30 Apr 2025 14:39:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8Xm-0000000D8X4-0DYB;
	Wed, 30 Apr 2025 14:36:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE8804A11E;
	Wed, 30 Apr 2025 14:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE11C4CEE7;
	Wed, 30 Apr 2025 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746023772;
	bh=cKXS0wbgFsKYhv80O7ouzrBxO3wfwf4oihtTeXawYtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WauwNMWtUTHe5HHI+QLThurQGREbcqLfHQ18UpVLclxxxtRUkcfqba7LkFfVysHzF
	 gquw22zFkR4sVoxAjTyUvBDLHEjw/hk2vAnDzHuTQ3yGeuINGQXCkEbDkJcl9uCoNB
	 SIFrgAKrVUQasWkw7hHuyeJP57p1SUs7vnJBG9BZfQ1ygHpKJMI1AV2lf77VEH7qNL
	 93U+RVM9TpRi0UZil/z6y7vppSaydNgyMwUWOH1heAH9QW2b5qofbWydsKh/IXeC48
	 I+4K9y08oLBLT1oUP+qDnBH3GFRTfdjnHTXJOJac4o7Nr+3rOTcqH93G85uveDmGJ7
	 7et0ESu527O2Q==
Date: Wed, 30 Apr 2025 09:36:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>, linux-rockchip@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>, Andrew Lunn <andrew@lunn.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add rk3399 industry
 evaluation board
Message-ID: <174602375195.3396795.11425847299435773154.robh@kernel.org>
References: <20250430074848.539-1-kernel@airkyi.com>
 <20250430074848.539-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430074848.539-2-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_073614_107258_F23B145B 
X-CRM114-Status: GOOD (  12.12  )
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


On Wed, 30 Apr 2025 15:48:47 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add devicetree binding for the rk3399 industry evaluation board.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> (no changes since v1)
> 
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>




