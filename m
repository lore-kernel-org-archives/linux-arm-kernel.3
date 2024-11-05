Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B930D12663
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNUS2QIhmAE42AnNeinKYIfbyEMM9dzTOfEqK/uMCaY=; b=BMlbRAFE0rR3gvZcpVVsHK0YCS
	wOBoaGGyU+aIJcjPtcEpERgcRuNgKA/0vtu7lhwcTNu49AinZKqj52XofhZOxDtQ/MEHGiyi2m6qr
	PYSk7dj4rcCEyl4EDM0ZM/E3YfDK5VmCFOlAxC0hbZ7K9TOwD4NsKCYkfVW9vCSXNcyGFsuPsevY9
	Cn6BR7my9azz+Y38K4sZiN+fFXYwXDoqwrH0ELMB4Sv3ErxT0kbqLnE+nlQR7ZrILr7EoxKNtMy3I
	/8NHF7nQBqRvKtYJ+N1jr9+O10sqiQ31ATsfuO6IYaRYklXiWrAzltZxH7v0ZE6DAQ/mMK1AAOPod
	XHepzKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FQv-0000000GQFP-1IgY;
	Tue, 05 Nov 2024 09:01:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FPD-0000000GQ2m-2spE;
	Tue, 05 Nov 2024 08:59:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 233A6A4297B;
	Tue,  5 Nov 2024 08:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3467CC4CECF;
	Tue,  5 Nov 2024 08:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730797157;
	bh=TecRWxjXwpw+WuZHTWmU9Bxq+5QkmQfUlgtvuq7O5Gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQm1pmYSOtMNp6aenuGRhpWvJqfuQF0lADrkq201hEFT59oGJ5VarcTEh3wr3p9Em
	 QTFuyDShhq06TAfmpJyGvVl8MLHC5mYn3ZjFravzRU9aJ6amJ88DonE9Ryxhznh+IG
	 ePeJpN8TQY0Cx7xwVfTstShHujYw35N46eCPwSizfagfyzv2Gt4lRHpi1NsOAEpuqV
	 CYwdqTSL7uo3JTgF4dbTcLnytnU8ZT5GsfDXCj3nDkpIpREj018CkYfDXKU92gkl+r
	 JPSD3pQvXdwiNEpAlMPyhlkwl29K+ea/ZHeUkYRcvy471X3cJtnxuRxOkSM3TwDXHI
	 kaef2ALee8Qgg==
Date: Tue, 5 Nov 2024 09:59:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quentin.schulz@cherry.de, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add Rockchip MIPI CSI/DSI PHY
 schema
Message-ID: <hyzfluc2v7j7zog5okgpf7eeramndrnb6nzdenpamwrf5gzdf3@kfx452yx7ryz>
References: <20241104111121.99274-1-heiko@sntech.de>
 <20241104111121.99274-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241104111121.99274-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_005919_809496_9E9C1D1D 
X-CRM114-Status: UNSURE (   9.86  )
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

On Mon, Nov 04, 2024 at 12:11:15PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Add dt-binding schema for the MIPI CSI/DSI PHY found on
> Rockchip RK3588 SoCs.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  .../phy/rockchip,rk3588-mipi-dcphy.yaml       | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


