Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB00E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9x8R9Nad1sl617vyrJg+pSgvX5VsNjUzqA1cicuWaQ=; b=cBAIdUZMEecSbXbQuHKiRyR8oF
	XX1xUU0FbqkY991xdSuT2L7e9Gp1ch9tNSA5w8kDOMh5c6OXC0ch6iMulz1i5WnK2pAiSsEMZNKZR
	h5GhhKAHP6vJz8+KcXVe0Gmn+anNRyXqhgznShXegi/wrnTu19hQOYC5gQGOFuczlwH5yRNmWa+Gv
	TM7N5fUISBxnwYJ7F8ZM9G6uo0t3YMSzViteVK5/QHq6Q6c0oqMOhXFrsT04T+Le4MvjvRFFXx0Pq
	nKvbuyQRT/dEJje/36K0fpIP2BgQa4flpp7wzl83/e4l0jAJC91a8zK1OBUOSK+6LTnQTEjQPyebn
	jjK9/kgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIk02-0000000BjqQ-0xtX;
	Wed, 04 Dec 2024 07:40:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjz1-0000000Bjja-0yav;
	Wed, 04 Dec 2024 07:39:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA7D45C60F0;
	Wed,  4 Dec 2024 07:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D646C4CED1;
	Wed,  4 Dec 2024 07:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733297978;
	bh=OZXyxFp5uWXU4+gtNDcxN94xsKibQqokm4SOMt4Xt5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lyg8RjUGEl2gykO3cMw2tW7YE9qGqj3QwcLCyiSYGF8nZakDz4PXSmeILOTBxhian
	 nTYR9rhzSDSt5uTlCPM/pP6n2XiPQMn8tB3oPMAZic+P4gyILBUzUZHMElyT9qmUUW
	 hJr8S2Twk6DORz+F+XqCe3Tf3OvXY0txcULPWNW/vANxL5EnEg/d07W2hGt3b860ID
	 VqFKGOqt+kTmlRbvkxxdBmdzlG3YNEEW72B/Rj9oU5lb5apCGLOAsLqMLZhyOiggX0
	 w050em0y8RPkWSFtU6v/tfkAD5eG2er6wPX5c5Q1agAQ7GVKYLrt951bkKGLd7WSQZ
	 3fEA8Rr7Rvpqg==
Date: Wed, 4 Dec 2024 08:39:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quentin.schulz@cherry.de, 
	sebastian.reichel@collabora.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dse@thaumatec.com, Heiko Stuebner <heiko.stuebner@cherry.de>, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: Add Rockchip MIPI C-/D-PHY
 schema
Message-ID: <mdlcm57lway2wqwh7tp6bj6mi3nlwuaeadbsmgx3h6kcfdisq5@76ikce4yqfs4>
References: <20241203164934.1500616-1-heiko@sntech.de>
 <20241203164934.1500616-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203164934.1500616-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_233939_311307_9D3B36B5 
X-CRM114-Status: UNSURE (   8.25  )
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

On Tue, Dec 03, 2024 at 05:49:31PM +0100, Heiko Stuebner wrote:
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3576-mipi-dcphy
> +      - rockchip,rk3588-mipi-dcphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1
> +    description: |
> +      Argument is mode to operate in. Supported modes are:
> +        - PHY_TYPE_DPHY
> +        - PHY_TYPE_CPHY
> +      See include/dt-bindings/phy/phy.h for constants.


That's the only difference from version I gave review. It is approved
style of passing phy type/mode, so adding this is not valid reason to
drop my review tag and request re-review.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


