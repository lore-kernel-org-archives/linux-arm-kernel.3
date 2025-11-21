Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCADCFC281
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 21:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7K5QipkCiICQ6wLA6hxymQHzzTkw8i1yUZ1XeIR6LY=; b=VSK0Al/Jj6oiGPEpS+QmxNSC5G
	QryOwOZfAlC8a1qJOCeqgta/xhUeW8w08axELsdTmi9Hi1VfVrbx+1K+4XMuHVe0ZZ0xBJtvuQF/0
	iyMDkRHziKv42U+id3Kphv7JO2DqtspTkSJYGnhlD8Q7zSTBfk8/k1NH2u/KaaZzjGwfjCdQsdE/I
	3SPfKk/5Iq32CY1A9GYnUzw5AeA5ZZp6c0AKOp4Tpd4AvM1SU2FRml/n7PY6w/hKFH7v7fPGIm9Ot
	35I1W9EYGZyXBxRr3jBSIEYaR8q7fj2may9/YQ3HDGiOC81SOqPwI0ajMNW8ULxmKl5i33+NDUZ2x
	arHQ2F2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMYwu-000000090PE-46kR;
	Fri, 21 Nov 2025 21:45:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMYwn-000000090Mq-0Enb;
	Fri, 21 Nov 2025 21:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=U7K5QipkCiICQ6wLA6hxymQHzzTkw8i1yUZ1XeIR6LY=; b=kOyknaDKzRsUna5Zg7Qh8lKTUx
	Mz9piXO2bvyfVL3UVqEBe8CeCUVpSJHmAnYT6alvkC2ddK3EzjUavhX9s+AJLflVIHBmI8EBFweCF
	VcSeyJ9v/uTOh2+uGQCkxOgSL3M/qS9r3S4kc9SGoZiUVtynS2laB1+bXT5CxZenCvBS5RQ1HDR0/
	LskLUkK7j0PfYv2e0JXBHPhJLmjlrXLvb2WV/i7lOS8e696Pp+EZgKOD26Bff6e1VtgCPIgKDpspb
	uc38oVZVgodqPW0OVcvsRMHcTsc1sqqtttt9QunIvogPtrvc+D0t+Ml46zbETmjtR1BH9ICuElwm+
	Q+eWREDA==;
Received: from [213.192.12.196] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vMYwd-0001Qh-CK; Fri, 21 Nov 2025 22:45:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable i2c2 on Orange Pi 3B
Date: Fri, 21 Nov 2025 22:45:28 +0100
Message-ID: <176376151909.52478.6656930123388084668.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251120-orangepi3-enable-i2c2-v1-1-2e023a74012a@rootcommit.com>
References: <20251120-orangepi3-enable-i2c2-v1-1-2e023a74012a@rootcommit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_134541_119763_4BBC1CCA 
X-CRM114-Status: GOOD (  10.91  )
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


On Thu, 20 Nov 2025 19:00:34 +0000, Michael Opdenacker wrote:
> Enable the "i2c2" bus on header pins 3 (I2C_SDA_M1)
> and 5 (I2C2_SCL_M1) of the Orange Pi 3B board.
> 
> As documented on http://www.orangepi.org/img/pi3b/0719-pi3b-19.png,
> such pins are the only ones offering I2C functionality
> without conflicting with other SoC blocks.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable i2c2 on Orange Pi 3B
      commit: b92c4eae75468d5b7ad49fc0d1de76a7f0fa0bdb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

