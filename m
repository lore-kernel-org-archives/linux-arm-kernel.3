Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2272DC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjDSkCSM3qYfz2nGxn/oaPiPuB4TEUHr7hVjYbL9OVQ=; b=xUSrjzMxcdVLKdjrjinNTwAZS+
	MBnV+dG/U1YjYjCnUtRyb5NvHJoO+hFqwPEtAdI5LIaHSy3CDAPdCkAEvIT0Crn2KjHpNQCI92Mb6
	WiojDCV/5QEYKpvcHKz6LX6dLEWESOKHL20DWBpOaz9n+H26IOCW35qDSTuyZQHSob4tvlfT2wHUX
	xPLA6PPvYGKvtHYZ67T/hLOJtyy45OIn8dX2s0yEwRrBStMW6d9ovk7hB5C/cdFRjzFxyPM3oRuK4
	XazgocRb4hvhqXSy8BbPuFGFJgrh4/rGlKb3dZ1CfF8GI9SQUL6DQK/1FJ0GhC/dntzFxhLBSfMkh
	ER4YUNUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4Vn-00000004sdu-0MJR;
	Tue, 08 Jul 2025 09:21:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3vX-00000004mf0-3Dqk;
	Tue, 08 Jul 2025 08:43:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DE0345CC1;
	Tue,  8 Jul 2025 08:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE8EC4CEED;
	Tue,  8 Jul 2025 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751964225;
	bh=XnfttrWEHe9q4N1bxzzh3vjDPTGsPFpGOyNYE/K49pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPmTO5aFIFLjqOh7tg97OaCnmDMoqxPqty7JR7vY+QIPi1heUnuB1cYzrZb9OFGJ8
	 Z890jZfXhnB23DRu56LputxbzbKStacAZEM2nqgm+/wNWBNltcDlQP7mfvRcA1Kadn
	 m4MGQP+fqCft+qa1fdVLqiROEofKJvWjEgGXWET3/+99RTEO0exRyRC92kmSp/PLmC
	 sKF5FvgnaGk8L+pP67xf3G2gF1LH1VkfnacNvNq7eMc5g4W9BNkstPNY1aMfqHMRn/
	 ybEevmxx/fFwhbC9demd4yDstaF7ivr8ajkLGe+LSVpaPIbag20TUugcw/8jUJGygi
	 9XLmn3X7Q9aPQ==
Date: Tue, 8 Jul 2025 10:43:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zexin Wang <ot_zexin.wang@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: mediatek: Add support for
 MT8189
Message-ID: <20250708-aspiring-evasive-orangutan-fa7b74@krzk-bin>
References: <20250627094431.11772-1-ot_zexin.wang@mediatek.com>
 <20250627094431.11772-3-ot_zexin.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627094431.11772-3-ot_zexin.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_014347_924247_00AB6FAD 
X-CRM114-Status: GOOD (  14.83  )
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

On Fri, Jun 27, 2025 at 05:44:20PM +0800, Zexin Wang wrote:
> Add compatible string for watchdog on MT8189 SoC.
> 
> Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 8d2520241e37..ad69bd28ac9e 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -29,6 +29,7 @@ properties:
>            - mediatek,mt8183-wdt
>            - mediatek,mt8186-wdt
>            - mediatek,mt8188-wdt
> +          - mediatek,mt8189-wdt

So it is compatible with previous variant. Express it and drop driver
patch. Your commit msg should already say that - describe the hardware.
Now your commit msg basically duplicates patch and subject so it is 100%
redundant.

Best regards,
Krzysztof


