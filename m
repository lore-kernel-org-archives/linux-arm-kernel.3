Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B436606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HwEdEHjO;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RRUo1WkU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ikDdtShoooMkULgvirxHE2XAnR30Kk/84OcnCY3ATGU=; b=HwEdEHjOeYxY9QmObs74OO8bvC
	LkpKgALGInzpS1qXZNccIgizmPG19ophEbD4b0C4bZcaqhIOaFfTU5DhZg4JhvsUMrmL1ya0TiLGu
	5zpXhYWTgOSvww6X1f+PHzfv1qAmBu+5pX19uv0tDtHEHdREUwdL/NPlE2MHOwhqVoiTjZzOx+LqY
	0LCnErUiV+6JqZ4s3BiRQWeeGkSMbJprnZD6FNE+WxT3I1Kt73EnjbZ/gIdTQzNCcLJ7PixW0gScr
	XacGe1ZSnXBtWWqCwJOY2kvlXe4j+VM3C8A5zJdvl9WCNfedaZmD4+s2tm5J6Yluh+MvQO0T/BcI1
	FDSJIlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWg-0000000Evxi-1mNe;
	Sun, 01 Nov 2026 21:55:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWd-0000000Evvo-4Am4;
	Sun, 01 Nov 2026 21:55:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73D7643ED8;
	Sun,  1 Nov 2026 21:55:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570139;
	b=wtlWP7LPdAPcGxYe3wa+CEEnhbi6yDalQMyds/Du7dPd8iOLu/zx+PV2tqXtbAmZB4YV
	 GjLh93UgyUIoF44Pw9sK7DN++CUAjQWlD1NALGDnWOAlq7AV893Encsrds0XBZkBuihns
	 5m6p9R3dZgk0po0q/hfbduVA5kuqwVzwgMvR1YdUFh6KZSE8N5nl0dgtqdv21Hkv9MAxH
	 jeV5LX0eEk2Iy2wlxuwdOz0F4sG3PAcwRHoPcvN8kzffsgCSEK4dnuzIbpypltB1MN8/h
	 0XKfFnAtCG8RnyUfqG5YGQ70W47AjnhNfwn6jfLIUbSpd6LcQ89xfh4oHFSRiNqfg1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570139;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ikDdtShoooMkULgvirxHE2XAnR30Kk/84OcnCY3ATGU=;
	b=fobu7NQGc6Sp0yLAuqdA2RDI7VxPoW6PmgxXlXsyiX3UUq7FfIDjm23ZZjFihabl3rP0
	 mPq6040FaRuQ0uxyGlOJmdJ1xmzW76WxjfIv152tSMENrKZyqYCfb+cabxQd3aMPQ6sFO
	 cn37agfH6PUtUtflnlW3b66WjKiaiW85idkhERv6z6lizRgHmqi96ysnNqKam2TKgpL0J
	 zrKljwaAhnN/8ExMHtwnvhoXMY3L0S/luw7VYTDbEQqpRPizfULmLHongOmB/+ZDD5YfM
	 5uwNBpk6OiVsUcWYX2VXqB6KbQywaeKxHkkVhLvxGsAE7kNTpLHWdkPfhzXjgYizCIQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACFC51F00A16;
	Sun,  1 Nov 2026 21:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570139;
	bh=ikDdtShoooMkULgvirxHE2XAnR30Kk/84OcnCY3ATGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RRUo1WkUi3gaN+mvkQvIKHTTI+RzzUy5uioUQ6KrB28B/U5LT1Kb1JuljqHxtDtrX
	 UG8cog1FySvJA7Qhdtxu67a99gR8j7Z7VS9akmjBndtRvJBIRuWan3w5uPu46CCN6M
	 OQbq7Cc6iE6Eo5RqDiksHFz8bfxuVB0csTmV/VrKJ+V401z6pX9x21j3aaXDn6+Fme
	 MEfPajfFOMT1N3AlH1XhpRPlJfT6oMds9iqOE/yCxsHerF7+f/EiRZ+mMUvFxFQBAU
	 Okygzwv21KCJ99/abCA5owWAMrPepHdUiXzjzfUXRYM5S5UGk4ODSKt7WyHWuBK6PX
	 7mvhQ83nIQjpA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 30226462A4;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:24 +0100
Subject: [PATCH v2 6/9] arm64: dts: rockchip: rk3588s-nanopi: rename usb
 host power pin
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-nanopi-m6-improvements-v2-6-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=1219;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=CflUJdIxsWjoqVlMu/6/MIyqLpRBfOQA+mPJNxxQcPE=;
 b=KjeqjJSow57CVCI8aelfifw5cndUKU7bXvhqttUKf+NoTCbNEUQZ3RSESyXKIFyR/aO9CeAQS
 +MX1CrhBOwcCXrx0BDICFCzG8wV0kAQ5MVAc+SAN7m38mh86sVPxlFw
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

usb_host_pwren matches the signal name in the schematics, which
simplifies cross-referencing. In M6/M6V2 this pin was renamed to
usb20_host_pwren.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 1d37862edb5b5..56264ff3b409d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -79,7 +79,7 @@ vcc5v0_host_20: regulator-vcc5v0-host-20 {
 		enable-active-high;
 		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_host20_en>;
+		pinctrl-0 = <&usb_host_pwren>;
 		regulator-name = "vcc5v0_host_20";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -340,7 +340,7 @@ sdmmc_pwren: sdmmc-pwren {
 	};
 
 	usb {
-		vcc5v0_host20_en: vcc5v0-host20-en {
+		usb_host_pwren: usb-host-pwren { /* usb20_host_pwren on M6 */
 			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.56.0



