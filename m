Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2047EC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 22:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJODNHkVNzSlZjFD+IpMJkmTkkNIUPx/SKc2mpT8lXc=; b=V6g4uhIChcrftTVDtPJqA4dDRc
	Pa6672z39H836Qi8raejlWWYAi/fBmCE/ovZtnUbGdisqAIhCf8e7fMVUV5LwUf6A6xXLHOhjaQ0S
	8LBvRIQlcoyNO9t7yXEOEhX4n5oUkkavOrezSvkInxAcmkOZOWhgAx6T5zUTVF0jvu/xFTrPDEjCc
	M+3dmCH+QtCVqGd+C1PZxGbiI+kiV7BhhQl3krqMraGcQ1nrpsN/SQfp6UbhBuakwC1bPgny0Vdgk
	MOCTSdpozOdAhaNW+mukI7ycd/EtFYqNFZB+hVptyRKianM3gWH9DwBpcmA4xD8SW+ySVjfkvDOkx
	cZ9QxhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nae-00000002YtY-2b2T;
	Sat, 26 Apr 2025 22:01:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nMA-00000002XND-2Ryw;
	Sat, 26 Apr 2025 21:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=dJODNHkVNzSlZjFD+IpMJkmTkkNIUPx/SKc2mpT8lXc=; b=Olke1UOAx4j9BXfRb/lB3z7DVe
	jRanRcKezAxfhM4Tl5EFSTmdSDSAeFPeO7FjAbzpfIQJB8/UMJCaMrMlDqOcPaXD6EOPGyv561XJ5
	YPccqN212uYZMl4B9w78Y+ASsRjvPMOboNG1vZqh3kPt8XQRekExUvU0mhOZYNu445YfxqyGfDbZt
	h0hvcY6lI+/z8r8oLYHEp6sAkrCAfz6FBB3xYIXqUvd8N0Kic5sQnWAIw3/HjRhwmQ5oid0vo8EWz
	AAuS/9sxM27mYt+iOwQ8GL3Z5pYN2YA4CS3khfl4+IQb6Nikf/DIBZbaP1BiENLhmAjGjUITXMGAM
	+KGTALkA==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLq-0001OR-5D; Sat, 26 Apr 2025 23:46:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Dang Huynh <danct12@riseup.net>,
	Johan Jonker <jbx6244@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add vcc-supply to SPI flash on Pine64 devices + Rock 5B
Date: Sat, 26 Apr 2025 23:46:07 +0200
Message-ID: <174570395444.32969.7984320646555928039.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250425092601.56549-1-didi.debian@cknow.org>
References: <20250425092601.56549-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_144642_619815_D065158D 
X-CRM114-Status: UNSURE (   9.73  )
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


On Fri, 25 Apr 2025 10:44:40 +0200, Diederik de Haas wrote:
> The vcc-supply property was added to "jedec,spi-nor" binding in commit:
> e7f4e924f46d ("dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply")
> 
> which resulted in the following warning:
>   spi-nor spiN.0: supply vcc not found, using dummy regulator
> 
> Fix that by specifying the vcc-supply property.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3328-rock64
      commit: 4ed658ebd7b506d468c0e28b724390b31abe1875
[2/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-rockpro64
      commit: b630cf92dd49f6a4df06508969a2eeeba6fd946f
[3/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-pinetab2
      commit: 4754eea38f5df6ad03cd93a4fa800d017cc5be82
[4/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3588-rock-5b
      commit: 67beb6b123187eaddb954fa9b070932452246d29

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

