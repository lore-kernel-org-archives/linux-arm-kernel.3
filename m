Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E18C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXbtyO2evVmvgM8gyhrjK6Fi34PwNkE2+mYarlke5II=; b=0xtKHERbLvdlACbRIONbPdxpCG
	EGEqGZyCHPwPIe5lfLIsWAEtFr0CKC8vQuXQeoPSOoyaX/bTNuhmTbB/FOBOxoSv8wVzN1A8kzu1N
	7WzNkAUggdzWFicmr2aZ+uTYeKEA0OrLN0tWj0Rf5B0e3sN433jXCtsOjdiEPSJQg5MZYYP5TfKBE
	OgH5LlmnDeLeW1DQOw7PUYb/TcmVyKCsSo4X68eCIEwfGql90XIAgedP5jQr8A3FjpBNWjjIR1kc3
	enV6rAWvPqK51zkxJt3/ZF5VW1jD79BQclHdMT8GjX/ElNH481cCZ//vacXCh0KF56ZVTZWYxckEW
	c/61R4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEtZ-0000000Feqj-1E7O;
	Fri, 27 Jun 2025 19:37:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEWs-0000000Fbl2-0EDy;
	Fri, 27 Jun 2025 19:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC0A961434;
	Fri, 27 Jun 2025 19:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435DBC4CEE3;
	Fri, 27 Jun 2025 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751051668;
	bh=teaBeVflJzwLOgj3pdIrQdVRadg6BKthTGhmskdlwsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvOLcJSUDs8C+EDyCzAd5mujAXx45vTaw8vqXSBkMBe7Yx7JShtKAC3SJ3gq1HdY+
	 M5fL+Ur+1zJTXSlXS6XfrQjXXQr3Zf6pRW7RoP/DvzykSkkBQS1zmEKzHY7L3Mle0X
	 nPTSZAI+iO26sQHHHojDxTNeLX+pVvBTFZSwbSSckYyYriChQOE+cenPtv5me4bptr
	 OOenA6HcDmb31Qn2aqyzoVIr1GLirr0MT+ClCVcwRxyqBGGAQpr2zdN+7ASeuxMzOW
	 R4rdc9giMbTikNt6pv7jfA6YLZBHWI9UOF5ZR3FuYtn1upsJs8BFmrjUtpU3lacNDZ
	 zBpRh7FuKYWbQ==
Date: Fri, 27 Jun 2025 14:14:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jagan Teki <jagan@amarulasolutions.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	Vinod Koul <vkoul@kernel.org>,
	Collabora Kernel Team <kernel@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/5] dt-bindings: soc: rockchip: add rk3588 csidphy grf
 syscon
Message-ID: <175105166709.4025295.58399620161615591.robh@kernel.org>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-1-84eb3b2a736c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-rk3588-csi-dphy-v1-1-84eb3b2a736c@collabora.com>
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


On Tue, 17 Jun 2025 10:54:42 +0200, Michael Riesch wrote:
> Add CSIDPHY GRF syscon compatible for the Rockchip RK3588.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


