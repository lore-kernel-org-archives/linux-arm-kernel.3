Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FAD10F9302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zn6Tx+/yUqe1wFWE2jjPTR23b4f4dmxO8nkrQL8rqP8=; b=Xgd6HyIm8K1sfvCPDJfwalVbUI
	D2jSxyV74YykfExMgYZqO4sLc/H0vQ6ujQ51BGEQFald12lb4gbqA7swfyLk09rgNVNDBt+yQ8yem
	i12z85Ng3cRi7aVwjL9AupEi7csi33brOhtHQoLiCimdKWJDcN1eti77xBFL2o9IHlA5pL5CzM1IU
	tsN9VWS2qy8Nxtlc+/yEGZN2yCQ8rE3G4xn/9u9gErhPhd9ZGZ4OStO1g0YSFnz9ewssFmHMFiulB
	6srMfVAU1kA0UyAiarWEhaQnLGraGcqh5f5qF7T1OgSDE0bEo/v+QhGPiw996rMZtbUsbOC0GrH8U
	Ud9QXchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7hTo-0000000Dd9g-02Jd;
	Tue, 31 Mar 2026 22:22:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7hTl-0000000Dd8p-3hsT;
	Tue, 31 Mar 2026 22:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zn6Tx+/yUqe1wFWE2jjPTR23b4f4dmxO8nkrQL8rqP8=; b=of5TGQ3BY/0dYg1URKjyoESvBO
	WXTk2pPyPrMCkMK4+uqn8AKjLqJs0tgkgxpPvBGgmG5MvL0wqBRI5ixxaEtVHnDc/bd12kQHGXQ+D
	MGX+Am8QHsCVJuQhquqAC+qi0CdqFzDyrXoT+0Lt7rfGBHI3+6aboRx0JwiZ9G1eB97ifpZMm+xnM
	f8RVfU+U0xVnXNHFYnmWPqYoWRR+zOQdljjtbzkik/e7DVX+fuHOtaboo4Ew3XUSKagsTdcV4h8ZB
	eceTwq94vniZVWqvhCZ7fM9HLnXrcJFHjvSli50pym7lOwEdXDLMe+89t+86ZVto83iAdEjMlSOYF
	yZatu2Ow==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-media@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/4] arm64: dts: rockchip: Fix vdec register blocks order on RK3576/RK3588
Date: Wed,  1 Apr 2026 00:22:22 +0200
Message-ID: <177499572601.2230685.5329289608304242879.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_152233_944249_DDA76515 
X-CRM114-Status: GOOD (  11.91  )
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


On Wed, 04 Mar 2026 23:00:39 +0200, Cristian Ciocaltea wrote:
> When building device trees for the RK3576 based boards, DTC shows the
> following complaint:
> 
>   rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
> 
> The first two patches updates 'reg-names' property in rockchip,vdec
> binding to make it mandatory for RK3576 & RK3588, since this is what the
> driver expects, as well as to allow providing the register blocks
> following the address-based order and, consequently, ensure the video
> decoder unit address points to the primary register range.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: rockchip: Fix vdec register blocks order on RK3576
      commit: f8fa98aa23699b7019023cc7cd8bbb8d837f2d3b
[4/4] arm64: dts: rockchip: Update vdec register blocks order on RK3588
      commit: 6c4a6f7f19e69bedddee87bebd4f1f1c7411b820

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

