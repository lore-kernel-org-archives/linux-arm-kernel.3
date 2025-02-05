Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524DAC02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 10:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEufu8hWZ6Rxv1eekVoQ44oXDQZLEM7FdVUPjV3pf+M=; b=3J+BiT5uLeHWOpKM4IMY5+G64I
	nT+O/wMPzE0T3eHjoavMXtF2gUJF4pCgR1jxfaOHGuxRKXuQLVg1oez5q1THaGp2+BZAvXEchAxJx
	zYKk5j73056zVmOan1KgwDskFlms9VQ5vAbRa0Hx5Y2PgP/4M7dvuWD6fTgOXQmypv1BOI7pjzXw9
	ZmvZJkXLJRI51KZbsSu9NovShTaQjBE00k7xIizdBNrfRJ2/gwDtS+lvaYGBQBiGrXuF2GvhnFiXZ
	IwOGclVqAnh8vD2LdN/FoGlXJw8s2ypThCfPVzAw8O0Pv4871paVrbl2G+IU9JtHznbpYeDaCA/U7
	gYSm3SXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcVn-00000002r8Q-2SuX;
	Wed, 05 Feb 2025 10:20:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcIa-00000002oWE-1Tyl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 10:06:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F087A43349;
	Wed,  5 Feb 2025 10:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB690C4CEE3;
	Wed,  5 Feb 2025 10:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738749983;
	bh=xydcuhIIgDpdVxy+ffJwelTXPHmUbPvOcxb5Zn8Ku6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SknuGw8yos3o86s1k+IMQ9+z6lVrxRWX1vLmInZfaPjeIzMaexJpzePuA14+NyoGj
	 64PXDpjAPeHrhjb00NiRjzhH+2OM6eeMvlvD8DMJ/BppfvJjlW8PM/aTNGr+9VdYa/
	 RDrxdG1JPFVXcPJHbMM1m9o+vvwev9wMuqGscAJzQDA66PEkHcqDeUQshQnQLvk0Zg
	 WfckE7mCj6/zgXHJjcOscqZkKoBsBwNHPzR5vvQvS9YygNeobzqscMKbR6OBZoPLO5
	 obyFyZtp0qLoshc3NUFWaWWB65JgwQKmkCJh1oNp/MWKm+5sWzP+VdxreBZIS4APuC
	 fxBnbfJfzClmQ==
Date: Wed, 5 Feb 2025 11:06:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: net: smsc,lan9115: Ensure all
 properties are defined
Message-ID: <20250205-voracious-tacky-penguin-facbf0@krzk-bin>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
 <20250203-dt-lan9115-fix-v1-4-eb35389a7365@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-dt-lan9115-fix-v1-4-eb35389a7365@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_020624_452589_52C022F5 
X-CRM114-Status: GOOD (  11.83  )
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

On Mon, Feb 03, 2025 at 03:29:16PM -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add a reference to
> mc-peripheral-props.yaml which has the additional properties used, and
> fix this constraint.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Please ack and I'll take the series.
> ---
>  Documentation/devicetree/bindings/net/smsc,lan9115.yaml | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


