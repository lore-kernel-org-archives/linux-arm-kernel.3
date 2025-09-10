Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90279CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDDiGOmmQZYB6005wkHuOt/kxo0S+y6ltHphRdeZ5Ew=; b=wXoxNKoup++d7ZKsI3k9GJr5Fu
	Qfd8W+sOauy7h3RURmmGX/11ycAOyYSA8XGib2HmvErqU7weEwAz77f4m9++ybFlFijtSQrpUqRJL
	kYf2cXD6jDYaOsF0byuh/m3/ipqQE68+gslNHdIA+g5K/xIM/3+NEqm9HupNOdYFPC2bh8mh9YDbX
	vg0RT7SGN0mdb2eeBwBk8BSIvvO5f9CHmZBekOu59oNS8ggooFP8n6ZODxsmaSWEI1xr+y6xiz0nT
	PCyT2CSUzx9b45MeBQcNdzM2Rpe+wplZHztHoKKKuWg8LNtCAlQMzFs/WPjpQGLJaljlnMlMrCBYd
	R5juM5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAel-0000000BgUx-3XS2;
	Wed, 10 Sep 2025 02:33:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAek-0000000BgUL-0w4o;
	Wed, 10 Sep 2025 02:33:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7C1944889;
	Wed, 10 Sep 2025 02:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8169BC4CEF4;
	Wed, 10 Sep 2025 02:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757471637;
	bh=NyQYty60WG79Ajy9YjwZu9E6f2nEyB4rPacOiU0exWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tL2iQTK7/qoJqZPfXtGtfD+boglUsVkU1PN/sLlQnbaC6+bBW2/XOzSmXAHKMmy1N
	 Y17/ertrfN/z7mlVbt1yBWIKc28ZOv9g5Kt1rNcenjRau06OI3RtHZqhHJYJgsEHSx
	 Cxw7YAeKNXA0bNFZZVQM8CypEwVDk34dSMqMT9hrNu5Cw/yJBzH28kkrAT9CLJqgM1
	 vzOwTKZe1POUVmIkBZyxLYV7q+0TVGzT5E6uG7ttNCcP8Vwo5Zf+AWi2ehEWMwfiNf
	 T5ofNzGCJViHFPzrfVVCYxgka3MYOXrFppQveQsgH0hCa1ytO31N5VE8dSp1DrxUfr
	 U1K3jxqSEAfvw==
Date: Tue, 9 Sep 2025 21:33:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org,
	Aswath Govindraju <a-govindraju@ti.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v6 1/9] dt-bindings: phy: ti,tcan104x-can: Document NXP
 TJA105X/1048
Message-ID: <175747163614.3662311.16406999049647270497.robh@kernel.org>
References: <20250909-can-v6-0-1cc30715224c@nxp.com>
 <20250909-can-v6-1-1cc30715224c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-can-v6-1-1cc30715224c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_193358_285786_CB274EF0 
X-CRM114-Status: GOOD (  10.22  )
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


On Tue, 09 Sep 2025 13:40:11 +0800, Peng Fan wrote:
> The TJA1048 is a dual high-speed CAN transceiver with sleep mode supported
> and no EN pin.
> 
> The TJA1051 is a high-speed CAN transceiver with slient mode supported,
> but only TJA1051T/E has EN pin. To make it simple, make enable-gpios as
> optional for TJA1051.
> 
> The TJA1057 is a high-speed CAN transceiver with slient mode supported
> and no EN pin.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/phy/ti,tcan104x-can.yaml   | 69 +++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


