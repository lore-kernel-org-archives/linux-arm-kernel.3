Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81284C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oni6Vg/P5vrta2IB3oW5wSxiUtRzniW6mGMAbb3BO4k=; b=q/u+Qkxb2gSpZ+hBJRQybFr0L8
	Ag/G8sm7pKamTrcMLswirYfkxLEoK6j+k8I2SG6KFCY2fCkx108nOhetojjJHkbf90HrmbY0wh8Pc
	tYQ0Z961C8QIR+tqAgdQ6S2FOMsbAsJnhqH3zmXKorJFzUcKaSooVuOCg3yOlYv41s0mL+ykJ+iX9
	HKMyTBbbK0CuZ+ArZHNsHNponntH4tddTfXFi0yp+guqY7b8H34sYIBfrpX/G9DPV1i8EY+EYqVdp
	6LBeKT3xgs+oVyRuTh8lzg3ZfbjlnDMTlpBe/qsmYJs7lAp4XxmWzul1kw+3QI44kYbcp87k54Y3J
	h2Wo1Y9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8GC-00000008j9I-3mAz;
	Wed, 29 Jul 2026 17:40:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8GA-00000008j8L-2MSs;
	Wed, 29 Jul 2026 17:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oni6Vg/P5vrta2IB3oW5wSxiUtRzniW6mGMAbb3BO4k=; b=p1Tj4hZhhbsTbQ7P0KwTEHfvl/
	VIz7RJgrRgUlLH05WVNOKnz5xNkHhuuUqlJYtUi/AzSzk9/x92PxZP5kFuHv8VV9DfmMMvTTbY1rZ
	4eH/7Kcls1PKgsDzKZeOQDyIr3kmjV5IMKjW2BkryFrUdUiG/WJiewcojCSSf2mlaqQm0mDiiITlj
	YmrEHX6UuNkvdhMSPqSNldp8eNNI5SA/UvSWqju34pfM/p4xWPZxsvnBZPRka3/JbSzgIx+Jq4xQ0
	tVkbbRN2pKi1i4Xkk/M4qRdJHyIc7za19AjhNJb/GdFMfr4wwXRjFpsISCWDDJ5CEE3xKTv1dxdjm
	vSv3pggg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pufan Jin <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
Date: Wed, 29 Jul 2026 19:39:52 +0200
Message-ID: <178534678977.563748.16244548635154085260.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_0DA92AE62C08A802ACC4FE9E47A0192C8E05@qq.com>
References: <tencent_0DA92AE62C08A802ACC4FE9E47A0192C8E05@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_104002_633282_D1421AC3 
X-CRM114-Status: UNSURE (   8.08  )
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


On Fri, 17 Jul 2026 00:36:31 +0800, Pufan Jin wrote:
> Add compatible string for the EmbedFire LubanCat 4 single board
> computer based on the Rockchip RK3588S SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
      commit: 181a06fe549d0b2a805eb112c0f7494bdbeefecf
[2/2] arm64: dts: rockchip: Add EmbedFire LubanCat 4 board
      commit: 6d9430d58714909071853c0949cdc93756aa3ad4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

