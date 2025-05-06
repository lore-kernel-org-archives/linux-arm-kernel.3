Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D59C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKC2khlAazUVxyWHCYK9xgOisMhzHm9hfPKcjuBzexI=; b=qIvYa9qmsrBIKuzaoMFRjv5gH7
	p4kQlRr+gGINJxOKnl+VLGHLDqk/q8knzo4RJXKTlIlOJJx2+3weANWKmxTOsoFsAVTZsjc502tdD
	U46bsDrNen4Z3S0UyRmMAGm9wKS7NepNNnqz6oJGHNiFCnQ75Mz9MA8T3W+juLjGojc+I0XSsw2o3
	6Pdt/s0aXhR2tgKm/aKAC1/MMo1VXfVawiZhT1cQHi981xLPKi98RzXrw+Ukftulxp6+vHW269ttE
	ZcPI0F/cXuwmq7yGqTZQ+R8TV9q81rZWryk1dmqtepuHxMap0L5hNk0l/rdB8JPb69EHZUEHizg5k
	+ZykKdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEgR-0000000BOYX-3U0d;
	Tue, 06 May 2025 09:33:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDt8-0000000BCeq-478d;
	Tue, 06 May 2025 08:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520973;
	bh=HVSA/f8ngYKv2PGABAW8NreyMXgo8DAkmUqwnuGJrdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kRXBSD6BUCQpEaVubdqqssc+hVFKNSOZ0y/3crIK1bXqEB0WBTM4ccJwRlyhoEAFH
	 bj8e+Xlkx+nssA5+QVPwajqJgq7HO7olKoclX4qkPHkk97PpCM0KulGhTwSTjSHr6v
	 wHKQ0AGKd2aURwfQWqwJNSqCIy+LlbB1PC4wkZ66Tp5G61y61jYryBP7eULVdy1+g9
	 1TM3D4+uKXHOt6/GUOjp6xWEp36RvmLA3SnLrTB5PZDf4TWUL++9ony48/kIylRjmk
	 iizUHOLtG2WtXImGOOb0d9WD5XRj6Hs9yStZgQhGn0wjsHRkglCvVyY1V4Z/YBBOyd
	 W7yJe2bY2KhNA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A85A817E153A;
	Tue,  6 May 2025 10:42:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250502-mtk-genio-510-700-fix-bt-detection-v2-1-870aa2145480@collabora.com>
References: <20250502-mtk-genio-510-700-fix-bt-detection-v2-1-870aa2145480@collabora.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8390-genio-common: Set
 ssusb2 default dual role mode to host
Message-Id: <174652097261.119919.932042428704090741.b4-ty@collabora.com>
Date: Tue, 06 May 2025 10:42:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_014255_165408_8A2791B8 
X-CRM114-Status: GOOD (  13.92  )
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

On Fri, 02 May 2025 15:17:19 +0200, Louis-Alexis Eyraud wrote:
> On the Mediatek Genio 510-EVK and 700-EVK boards, ssusb2 controller is
> one but has two ports: one is routed to the M.2 slot, the other is on
> the RPi header who does support full OTG.
> Since Mediatek Genio 700-EVK USB support was added, dual role mode
> property is set to otg for ssusb2. This config prevents the M.2
> Wifi/Bluetooth module, present on those boards and exposing Bluetooth
> as an USB device to be properly detected at startup as the default role
> is device.
> To keep the OTG functionality and make the M.2 module be detected at
> the same time, add role-switch-default-mode property set to host and
> also fix the polarity of GPIO associated to the USB connector, so the
> ssusb2 controller role is properly set to host when the other port is
> unused.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8390-genio-common: Set ssusb2 default dual role mode to host
      commit: f9167f15dd4e70b124023a2f7ba2b09401b3b6ff

Cheers,
Angelo



