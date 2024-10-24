Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4B3D0BB71
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qQWxtU6GqzgrbCaUsvRleEvRl4Zs3up4/mkoq8kfWc=; b=P6rGs7JKYhaa8yTJ82OdK/mGlJ
	LqNAd8DjVDqSUKWS5WKvwG434DrhQq7Fxk+c7PSanaWDAzJbOATZAJoYAYccdP1fnPRIYb19rtXO9
	1EnOurVZsDHjOHVXSniBamDgQpSVmDuJMGK66OJMmEK69AalVRK9JRhb7rtQwg2UHYtdN9+FKOPb+
	OWpaO+yPlVnNeT5azODEg4ZX1hIWflhXqpGnTpcrrCd6T9Ys+XCEUGy69AwjWY9/nfGOW815KzXCg
	BEUOmnXS5zw0RQPYrGqeUD+hNaqprP1isPvmJXSc3lbuk+9ITjmNSq7XcOoPtPKl3oPtUHbmcZ0tj
	vcHf1Urg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tIJ-0000000HJ1m-0xvI;
	Thu, 24 Oct 2024 08:34:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tFA-0000000HI5Y-0YOu;
	Thu, 24 Oct 2024 08:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5qQWxtU6GqzgrbCaUsvRleEvRl4Zs3up4/mkoq8kfWc=; b=EzLIN82D8z0dZajYuP09a2o727
	P926hnzmqmrfZ1W4hKprfKNELKb74TYB+HS8BcmiMFahoht3ZghH1EWi7YnaItkugb7Ucsok3s9/y
	uBZ56WubQdJ7orTam5pyMaF/O5JS23axhM/80SfKQvpSEk4F5nyQkIHzrEAHVBNA+932t9Pdi0MoV
	xhwx3MvZtWI7s+1QPRLfTMZYOyNI0KQRzNqsc5zDX6c1FxhYAn/h54QD3c3lRZ3cvX8yvI795tC7v
	0nUAB00CxtvTVEYDps2eDi7tzKdRi7fum0WPyei6p4hc5HvhiPmmnDA4GNXPohB8XdJcwyjYv0kvL
	fZ9LBlcQ==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t3tF6-0002iS-Tp; Thu, 24 Oct 2024 10:30:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HDMI0 on rk3588-nanopc-t6
Date: Thu, 24 Oct 2024 10:30:48 +0200
Message-ID: <172975863600.1671562.9741515053746960937.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023080605.623125-1-marcin.juszkiewicz@linaro.org>
References: <20241023080605.623125-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_013056_187905_A1A5E341 
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

On Wed, 23 Oct 2024 10:06:04 +0200, Marcin Juszkiewicz wrote:
> Add the necessary DT changes to enable HDMI0 on FriendlyELEC NanoPC-T6.
> Tested on LTS variant of the board but this part is the same on both.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI0 on rk3588-nanopc-t6
      commit: c3c9cd8f65f7f833de95dd70aa17393afa58f50b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

