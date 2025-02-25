Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F012CC19777
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNXWRytIBbFeyPrIFkAaBq4o0JbNSGPn9DG6QfsZ6tE=; b=k9lov1gD+d/Jec5d4sYtCL7+zF
	9nWfelMRxcszHxZ1L/V6v6HKaNxlSV+NBXi0OkiElxeG4ewp9qHwSgLQUx5r7BwsEArn/Ydhgw75F
	AYlbWUsH63QNkRUHydBWXjTwRZKt3pmlqTH8A4RzxYmHs7aQH2oLkCtYLsARfcPuu3OTprtTfzK5W
	sUU0W9moYc6TFJdTKQ1e4aRIlf7PsWzRO9+MoQbIq/+ak3KjCV5tKXcVsjMGCyrkNtbuAbbFx53AR
	12+4HISZX/16vCVxEml41YhlsGRH6oHJIgAmqr7JDQaHztwLz0tYjubYph7m/Vi42CplKP0SBz/jW
	4/Jez5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyZQ-00000000Zzb-09UX;
	Tue, 25 Feb 2025 17:18:12 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyMd-00000000X9v-06P5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:05:00 +0000
DKIM-Signature: a=rsa-sha256; b=My/Ik8yQXNApV1SCoUvMv/++qdBQ8pG74OekpLZgHMUC2V6KGYr7n+RXw8f9YulbQoIer0bWzY3zdFfJoGYplwqTPwzY4AStkYxHa1jLoy8NBOPpPLg+WV2EhqhRUYE5R+im1U7PK7W9QrTZyxlt8OXrv+Jht1n4IlGt65cCazMxgfZdnDLJmm0cMboMztI89zXmf5VW2ItrnnJC0pblrCWWUuCA1GOWTd/Bd4Wlyf0o1Hqe34ROXaFejQdDjTCFzdaft/MP7DURmLJqBMd6iy49F7knj1RO7K/Z4Pi5qDDoZSApJfIXLR5y7UUT3zKP5p9ycmv2wxawE9/VwrqNqw==; s=purelymail2; d=tidylabs.net; v=1; bh=DNXWRytIBbFeyPrIFkAaBq4o0JbNSGPn9DG6QfsZ6tE=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=v2j+qGVgbCn4uxsEoPb+dkK1Eg89ymYijpb+93nCXlovjwyJ4TUQFDZOIxS4m9cmpSXKLKqeYGKglZSJwyf7nasa+QHw2ojpNbgRDfGCld3dLsQYcKIpOibih4K8lKIMVhIFAFYYaI2c51scKP5WJOKy51O6zgbzsnHSekWBvFC/wecleZF/I1pT+Z8SiB3T5pUOjtRQ2oKzvAXPLIRh84aUVvCyWL0dyZvMNsvNqXA3Kp0HO6pNGWflDt076pUAO8B9MQNkPSOI6wXDcc3S7VFA2mpIIF+QDHh40VnMyG64lxBPuQXsH7Iy1Tdjeg4057gy979ZmAl81bL8flGY2A==; s=purelymail2; d=purelymail.com; v=1; bh=DNXWRytIBbFeyPrIFkAaBq4o0JbNSGPn9DG6QfsZ6tE=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 81901:11097:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 594455725;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 25 Feb 2025 17:04:31 +0000 (UTC)
From: Justin Klaassen <justin@tidylabs.net>
To: Tianling Shen <cnsztl@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Justin Klaassen <justin@tidylabs.net>,
	stable@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: fix u2phy1_host status for NanoPi R4S
Date: Tue, 25 Feb 2025 17:03:58 +0000
Message-ID: <20250225170420.3898-1-justin@tidylabs.net>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <48c705e65cc8e8d4716b41a4a87170e3@manjaro.org>
References: <48c705e65cc8e8d4716b41a4a87170e3@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_090459_191318_67E08E3B 
X-CRM114-Status: GOOD (  11.22  )
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

The u2phy1_host should always have the same status as usb_host1_ehci
and usb_host1_ohci, otherwise the EHCI and OHCI drivers may be
initialized for a disabled usb port.

Per the NanoPi R4S schematic, the phy-supply for u2phy1_host is set to
the vdd_5v regulator.

Fixes: db792e9adbf8 ("rockchip: rk3399: Add support for FriendlyARM NanoPi =
R4S")
Cc: stable@vger.kernel.org
Signed-off-by: Justin Klaassen <justin@tidylabs.net>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
---
v1 -> v2: Updated commit message, added Fixes: and Cc: stable tags

 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi b/arch/arm=
64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
index b1c9bd0e63ef..8d94d9f91a5c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
@@ -115,7 +115,7 @@ &u2phy0_host {
 };
=20
 &u2phy1_host {
-=09status =3D "disabled";
+=09phy-supply =3D <&vdd_5v>;
 };
=20
 &uart0 {
--=20
2.47.1


