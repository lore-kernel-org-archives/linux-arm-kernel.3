Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29944606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NHIL7p/v;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NC2geHqM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hnciNhzCIFFFTFntH0TjJcAKfFSp6CpEmLiyL6W618c=; b=NHIL7p/vMUIpM8EQrpYQYt7KcN
	UFnaA3ytEzacudBRoNQrAoEO56YCVhjNiUn2pP0YGiXDEPuI3LTBX0n2chJtLIclomafV0ZUKWDAG
	huT8RWWdDNchrMtxcKo+QuKGA/lhSMS4AHhPgKEivi4j9Sm2PkuvjJuqc1cMBZRtA8x2Mqy84rhDU
	4eyLRli3E0psB+bD+Dri+CaUAMrgvJZ2h55yr3er4KsuC6nXTS+3FfiEkgW/tlL2H3igYL0DIcDDL
	xSVi7Qb7nVNYMVySj5B0xa7lFDPe7yMmTQ8cOoJ/Isw08nis2/4xvl6W1hMFCA3Uj/lyIolJwzsS0
	uPRPF1gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWf-0000000Evww-2Q9K;
	Sun, 01 Nov 2026 21:55:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWd-0000000Evvk-2lB8;
	Sun, 01 Nov 2026 21:55:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E47416025A;
	Sun,  1 Nov 2026 21:55:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570138;
	b=pj32qUfPnkkTSff59QAQk1vOQEA8mPHdtwuEej0zp5WO8U2OeIw2WfT4YR95cBao+Xz7
	 q5abBam3EwRipfwSjw29nLSZ5dQJUYjJaoqWFZrx3F7w5d7wyOnUCLhhtUQZHMs1MWOxI
	 VscexF+UMPgB0571izUvP84bITLGgZyqU0sQUCzeTqtCml/u9+EYsp4Z+AGMymXG8u4lV
	 GYm3V4f8KxmlGH/lHNaxbpNMLfhZuPmppbukjCx7fOXnsnPjyBnvDRJlQrTQPxs972zwc
	 j8WkJmT/ehUoF8FibOq9wdfDmJQBrAM6t+wLra1I2ubYdVso6IctyY0yjQnKlNxhb7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570138;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hnciNhzCIFFFTFntH0TjJcAKfFSp6CpEmLiyL6W618c=;
	b=OeHRs9CRpI76AaxxO0/ow8L1RbTXceLNz13462wTC2x1/GGeC33lkGQ2faYQKw6RH6EV
	 KwN5uDVTWE8n5lve95oaMpCXLPCiQevjTqbg+4XhicmzxB+uBc03An0ASGb/GpYq1zbcY
	 XVA/f2cNl1AfpYuBWkn1WSRyYiLp3hzO7gBiXbe/9hHoUypMNjyMvCtzEsH24hCupbZup
	 tS/c7BjTPocvJ8c+0/5QuIqVEJC41IzalUc3e0K2Js4agMeAzLT4wMoRy31HH9pRLaC2B
	 5HJulPJaSdgZLV2HsCgVRkEyheMvLJx1ua8ZxIoHE+hJO0f9kPTYf/YwankXshr37Kw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F7E01F00A02;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570138;
	bh=hnciNhzCIFFFTFntH0TjJcAKfFSp6CpEmLiyL6W618c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NC2geHqMyMtMfJ9IZIppOhU1RkZK2snRbkk86OQouAceCwobSETkdq1czvSz11VYd
	 eZ7lS2PiMnk8/Rvo3Rl7jWwBNGGdFWxln8NVaRQYSi3ZwtcHfGSL6Ml4PDZUjW0ZdN
	 SAWC9B5vbUGaLpxvUjl6I8CZgB7t0Y/LeSLRPn1W/nJluPkm++hB8b4DHWM7Q0u1QO
	 5LliaS6XhwZGjMcxwg3hyUObhdAuSlilOWrCf6i+854hS+ev5Yya03Y7+R/ccLWtsf
	 f1rtytF9QdwqG7E5W4LGgk3DVd/7aoCoLXc1LpJKfInSiTAB2cHl7aJKltpLkoD/yG
	 W8lU6NjVxLwWg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 07B9246298;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:21 +0100
Subject: [PATCH v2 3/9] arm64: dts: rockchip: rk3588s-nanopi: add voltage
 iio-hwmon device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-nanopi-m6-improvements-v2-3-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=1215;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=i3iFfPZU2WxhmVkZIvHfCb/RWokszUBojNZ0FW7VOk8=;
 b=JAvL53JzX0I1Co7WG0zOaUTjrPTQOUaDG95NzjcESdHDMOwSkxQryZOqgWBmeDx7xOTKh5m5e
 bX6ZfYnqHzZAD8o7okqHFzemxxCmaYRL3PzHRddYkxARSLGIng9PElg
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The NanoPi 6 series have a resistor divider on the main input supply to
support voltage measurements. Hook this up as a hwmon device so it is
possible to monitor the voltage.

Output from sensors on NanoPi-M6:
vdd_usbc_iio_hwmon-isa-0000
Adapter: ISA adapter
in1:     19.80 V

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 8c77ee71ebf85..a47677926a59b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -95,6 +95,19 @@ vcc5v0_host_20: regulator-vcc5v0-host-20 {
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&vcc5v0_sys>;
 	};
+
+	vdiv_vdd_usbc: voltage-divider-vdd-usbc {
+		compatible = "voltage-divider";
+		#io-channel-cells = <1>;
+		io-channels = <&saradc 2>;
+		output-ohms = <10000>;
+		full-ohms = <110000>;
+	};
+
+	vdd-usbc-iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&vdiv_vdd_usbc 0>;
+	};
 };
 
 &combphy0_ps {

-- 
2.56.0



