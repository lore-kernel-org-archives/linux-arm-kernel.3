Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E49CF2594
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXVLJYEaAXOzPJEHER3W5GJLAHrPhXS/YFxHQS++C7Y=; b=tMYHdwkQIlZRkUNTrRpxjJQSEp
	iL/NW1faFgqFWAsTDJwyhWW8ncQtCx/dM5WcWsWu6bVxFJ1eUAxO+B1JiQG2Cmq2tvJOJUvWvdr4P
	3xPPd2DZO+oX4NG1UK/nfYbNNUDvzMEHdmKF4pIx7WuhSgJgTUFbb2TtuoVlTkdzrj5nDAlqfaZYs
	bzK7lSbUMiQWjIX7YrOizz1v0ylWmtCtWDW1mw9uoeEBAmLL1jwguJN/ZEub5dMHV5LZU9mV4Ew0Y
	/rvaCEVDLXbBRKjfO9fdAsh+6/sAUETMVUvmU6+Ytg5Oh9SlRSE8MbCKfJV43EOmeqnSPc5r5TvYh
	ieCEg88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcru-00000002jRp-2uam;
	Wed, 19 Nov 2025 07:44:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcrr-00000002jRW-3XEl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 07:44:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67B0F43FB5;
	Wed, 19 Nov 2025 07:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71060C2BCB4;
	Wed, 19 Nov 2025 07:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763538283;
	bh=P4X5R1xAaEUx6GYW9HO6udKC8PmwrPn1P0IPKvae+wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTkEzMZe/upeKCy7Qhq6hsvHddhyCrVVeI60L0OdUXAQLmKIt6FvyPddM4/VIhQX0
	 fpUJULOAQzKlSNzk6xBRBPuTpCopeaTH21/rKTG7+omk7qI0oQzW42+2fUPRIl6VGp
	 pHR4IfWDtu0SHVghoKd1BOSpeUY+45XYuLP+hj17b8kHzuDqqnMAqeCEQCmS5FY/6f
	 456eESZkhE7FLT04yGJpswLH8xqxWbBeWnF7EcRvJyFuM+Y1SyJPC3jxYN8DvsIkij
	 x7soGhtP2M56WGKrF0BdwkHjVEeFvylz59ltHHOIRr5GZBG4zummh7Dn4wGaECoLOy
	 PTPdFCLikRpKg==
Date: Wed, 19 Nov 2025 08:44:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, Frank.Li@nxp.com, hongxing.zhu@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: imx95: add PCIE and USB PHY clk
Message-ID: <20251119-encouraging-cooperative-tortoise-b22df8@kuoka>
References: <20251118074055.2523766-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118074055.2523766-1-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_234443_903997_C694C392 
X-CRM114-Status: UNSURE (   8.89  )
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

On Tue, Nov 18, 2025 at 03:40:52PM +0800, Xu Yang wrote:
> Add two clock definition in HSIOMIX.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  include/dt-bindings/clock/nxp,imx95-clock.h | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


