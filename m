Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5288C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 23:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2W8RdEs8ElUG61A2Vr7LdSd4N8lCsVrQU9K5HgnJu08=; b=FbkUOwftIr4xFf8NSpmQ0+9JjH
	3RGB+pi0b0Vb362Lad8q4+q+8gPrO9YJm6cFAfC29zJ7tpk7/6O43ZP2fKlN6Li0SUNWIBEzPKoSV
	HWATAeSDwI91nL9mjZ9V7DMnFrUxr5bRB4b593b3o2ei6rNIlMh1JI67S1pcTTZciUuAGK4jcDPGc
	lL4szqAR2D4/sGzV08Nj6gQEOEkpPe5XS6UV29RjQeKTmzi8zIQySe3q7np++yFF8R7qHCb0HbWNY
	fbkiiApui4UyHLd6U5ZngHW/jjhFRmRCrjkqRJgKUgYa2yz7WptELJ4HoyAxqPCdGZi0ZPLjtNjKx
	B+YUBN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlzHN-00000009JhQ-3tz5;
	Sat, 22 Feb 2025 23:51:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlzER-00000009InC-2NIs;
	Sat, 22 Feb 2025 23:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2W8RdEs8ElUG61A2Vr7LdSd4N8lCsVrQU9K5HgnJu08=; b=Vh4T+BhrZcM4wUvwISldHAJcPj
	Yijqv51k5NaV1lcWAhkq9lzmwj9IBdqapcmP/KC1B6N3wA/WThYIb8k/wBzO78Ww/c1J+makNzbsm
	rQa0mcVRl4g2HtBSpgP6MIDA00JKq4QD7Yb3NkG/Lg7IPN8JZ23LrwZMXSrBdB3jthno1DFmdZlsf
	RZDzRbnDfsNC4Sptm4HiyNhUsIGeGQMy/kx1ssBnJZiHqhBdFU7QH0snbVJH45jCyIs7u4QFy+VNs
	fT4HjJKb+ibmN0G/0UYnbjHf7c4NuCNI6bpwl6L4F9f4lO1XICs8UlP4jeywg2lZxB0GoMnHb2x4S
	mvgd379w==;
Received: from i53875a10.versanet.de ([83.135.90.16] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tlzEO-0004TL-8G; Sun, 23 Feb 2025 00:48:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 0/9] arm64: dts: rockchip: align and reorganize Theobroma DTS(I)
Date: Sun, 23 Feb 2025 00:48:17 +0100
Message-ID: <174026756681.3008209.14237088050946268747.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
References: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_154827_623178_0E99A4E7 
X-CRM114-Status: GOOD (  15.58  )
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


On Tue, 18 Feb 2025 12:49:11 +0100, Quentin Schulz wrote:
> We have three SoMs that can use Haikou as their carrierboard so it'd be
> nice to have consistency across SoMs on what's enabled by default. To
> that end, Tiger Haikou now has UART5 enabled and Puma Haikou now has the
> EEPROM found on Haikou specified.
> 
> Additionally, some devices were configured or enabled in the wrong
> places (either SoM DTSI when they needed to be configured in
> carrierboard DTS or vice-versa). This moves things around to better
> match actual HW definition and make it easier to reuse the SoM DTSI
> without having to undo carrierboard-specific changes. While at it,
> disable devices/buses exposed on connectors which do not have overlays.
> They need to be enabled in the appropriate overlays whenever they will
> be added.
> 
> [...]

Applied, thanks!

[1/9] arm64: dts: rockchip: enable UART5 on RK3588 Tiger Haikou
[2/9] arm64: dts: rockchip: move DDC bus from Haikou carrierboard to RK3399 Puma DTSI
[3/9] arm64: dts: rockchip: move I2C6 from Haikou carrierboard to Puma DTSI
[4/9] arm64: dts: rockchip: disable I2C6 on Puma DTSI
[5/9] arm64: dts: rockchip: enable I2S0 in Haikou carrierboard, not Puma DTSI
[6/9] arm64: dts: rockchip: add EEPROM found on RK3399 Puma Haikou
[7/9] arm64: dts: rockchip: enable Ethernet in Haikou carrierboard, not Puma DTSI
[8/9] arm64: dts: rockchip: enable I2C3 in Haikou carrierboard, not Ringneck DTSI
[9/9] arm64: dts: rockchip: disable I2C2 bus by default on RK3588 Tiger

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

