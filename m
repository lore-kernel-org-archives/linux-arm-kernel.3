Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FA9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pleTi5uJrnDXNSx8wWrYom9ue2MIKvUmJvxIIBEUS0k=; b=OF/WSWTLHXwJFG159684sHRLWK
	Af7IthRtXb+ym05vwDi8KuGJEKgoGYjN/tyB7HzeJdPZ6C8gLq2Yanya8X3L698YBT9SfcbMNivBc
	505s27sPSmJoldJ9GE0yPb3In4A9O9caAeSVxPVbfcBGg8SbHJQ/ToUxDk9DLjfhf+vrBQW+KuhTN
	GPPr2OEYfrUQgwEqpr/JqaclgC1ARRjY7axOrneJ0Uy+MkN09F97No7MxVn935YOVePoZ75RFPR7+
	YZvzTiMZRr+eTsDy+EggzSGiglM+q7Ltvz4wouAzwL3fpPruRTxpbLUaZSgPcBSp8bSgW053oxA9J
	4kUSTH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GOj-00000007tD8-1NVy;
	Tue, 22 Apr 2025 16:23:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E3R-00000007NUr-1GeN;
	Tue, 22 Apr 2025 13:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D4CBA4BAF1;
	Tue, 22 Apr 2025 13:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EF9C4CEE9;
	Tue, 22 Apr 2025 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745329972;
	bh=kQnL1xyATLdYheZxJC2HtpPYDmqM6al4GJOI2F2bQjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=liectbEXQohowLkL2nCrkrHkuA6T18ncpI9oHapCWd4Ry9/+hvLEcUlEKAKmoLN/Y
	 7RQQsJdYooya+riTynKLuEFW0qwkUcQxtJhfoA96CyyWoBzO0qaQ94Cc7HjSXngs1J
	 uVmKa2wpXDSXkDI4DgHn2FwyK/CASm6wH5PbuptHLWccG9VgSCy90y3zE/EW+Ue+bE
	 RQAKHiIi2e3sZKDVhY95VBu66KnNtGSC2QipjFlPffH2tzhkO41EvGIPvHkBlLTX1r
	 Ri2hFtcERzrXv10IVxNJgw9ohJX97dZ0IZTldp1GkzAtDfzjEaCPIS648Rm1tkv0xr
	 6+MATFw+TcPzA==
Date: Tue, 22 Apr 2025 08:52:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	FUKAUMI Naoki <naoki@radxa.com>, Conor Dooley <conor+dt@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add rk3588 evb2 board
Message-ID: <174532996962.1131838.7764666053549071176.robh@kernel.org>
References: <20250418014757.336-1-kernel@airkyi.com>
 <20250418014757.336-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418014757.336-2-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_065253_404565_4984EDE3 
X-CRM114-Status: UNSURE (   9.60  )
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


On Fri, 18 Apr 2025 09:47:56 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add devicetree binding for the rk3588 evb2 board.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


