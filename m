Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC95BE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 23:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+urkUpEziJ6VGFyEzVJRfDwkJaAi9cOj6qlNU6psp/4=; b=iCcjQpPfXxplm0s8whwK8SYesN
	uYhI/DD7y69nvd+/3Kev9E3cFOmxTv4Uqh86Bj+UDbo/vQQE6G28mQ+mh9yxW1RnnX9QXunI2QibT
	BZWSzPSbhdNMHwWKdUuWTjtwF/UgVQ/zyRcPDB9froiRGsvk/ihSRe8MIPaB/vchFduXuJresEoEA
	5S2TqzbtNuhkFJsASzPBvNA0/zfvI8wuaZxUBj+jTuzMU9Dui4StjnVVxGhPZD9FxPRioUeF1Ggc1
	nGytPS8kNynIuK4xTJoG5l2uZAGoBkl9+xP4L5H2kvBduM4GJf5kgenrTQmmHUIa7v5hM0wLEmCg1
	b4snSK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1ts-0000000DYCC-3Q5W;
	Thu, 09 Jan 2025 23:25:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1rW-0000000DXrI-1VCV;
	Thu, 09 Jan 2025 23:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+urkUpEziJ6VGFyEzVJRfDwkJaAi9cOj6qlNU6psp/4=; b=EnC5q4z6sRMOkUBZDDHKMXXoCp
	8Z7mlaO2BUMFVrDAkC/YMHtjOX2FI5jl5ZH4PDMb+7xWu8DDypVKERDP55lTLIDzVve/L80zAOkHq
	mFk5X3dIcyMNpgfrgOq/XMOBGRvUqKQ0W6XeeNn6xGyFqYrqb7Af/Z0bKx9NryraaDBFj/YbMefRD
	8SYL9L6103DtkoIGcOWIcT6rHKK9uLjvt9M6Zta+IyYQzHbv5RgmsDJNFbSoyYMSV7oa2aGhAE7TG
	SwIHoeunzarMNmXZzN6cb6BWgUsSziAM20ltN5qxtlPbVVG8K/Kt+EPf+oIqHFlLE9uHBIWPL1JVG
	GqOCDbNg==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tW1rR-0005y7-KD; Fri, 10 Jan 2025 00:22:45 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: Enable Rockchip extensions for Synopsys DW HDMI QP
Date: Fri, 10 Jan 2025 00:22:34 +0100
Message-ID: <173646494622.2947053.12400284221846162505.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241202-dw-hdmi-qp-rk-defconfig-v1-1-38757fc053d0@collabora.com>
References: <20241202-dw-hdmi-qp-rk-defconfig-v1-1-38757fc053d0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_152250_391597_AE4909E6 
X-CRM114-Status: GOOD (  10.73  )
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


On Mon, 02 Dec 2024 22:00:57 +0200, Cristian Ciocaltea wrote:
> Enable Rockchip specific extensions for Synopsys DesignWare HDMI
> Quad-Pixel (QP) driver.  This is needed to provide HDMI output support
> for the boards based on RK3588 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable Rockchip extensions for Synopsys DW HDMI QP
      commit: 06835ccec2efb71d54a810265e8ef69b1011608e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

