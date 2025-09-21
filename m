Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B882CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 06:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApRgFexhIIRqd72E6q57XNJe8kKRAWFtMfy8BGTnIvg=; b=qT/kFsGoe8eALoDb+aChIgFSzP
	4YYhQ/i3cnLIiqzLUai6cjqWeWnKbdBDw75p5pcb+4Qo4GEkoXdf1B3qSk7F/n7w5nzSWbtFYsydP
	3QdsBFhKtoQ+Vb5AP28hkBAMLXno0FjtKYMyNlJt4VjLwVwyk+7YE4xC6JXkuVjjtrM2WEzRLJGKj
	p7Sky8aVlpSzZ2DHDt5kdra4ZUykxesFW9ytbv2NJOHvQsbKnppL2TMxFtT+QcQfgiG0dg6mZwtFZ
	ri4cR5Ckikdsc/BcSydeLDd53hm/gMIg6vOlGH+BRlrO2MQJruWAYHrL3mDsgLdguoc7JWAX5yG9/
	JpGwOl+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Dky-00000006pgk-396F;
	Sun, 21 Sep 2025 06:41:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Dkw-00000006pfS-1ptg;
	Sun, 21 Sep 2025 06:41:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BAC8860194;
	Sun, 21 Sep 2025 06:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62D1CC19424;
	Sun, 21 Sep 2025 06:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758436864;
	bh=dhfVENO/WdXQWcs+avMXF1VtV3LhiSDOc0FjGu56Qg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fCJeVOV5E78GMpfSrDO+5SqmPknC/76XDxsnmTWMnjuVEyyUu1z+1VgJ0KdQ/cpe8
	 4o2lXwEz07iTrNlgBGAwOMxCakgPm0Gyvp09HJ+FYE0sGGMuneWLr0LGdhiPWqqBmf
	 Fp139ZSHzC1zzvEl6HnqQd3LSbkBwDF8L7YN522VOGb0Gm9LWLOY6hbsLvlqQRsOwk
	 W7z828sGYDz3atd/ac2b99rVS7FsxCLNoQUEqelQYwZDyVNghp5//oQglWYfmOpN7j
	 B45V2TWLbG2uqL2iDMrMtse87ySt/14OYFAYJdvX/bfO4qBifRFNr3pgg7uX3sjT7+
	 rljFKI9g8fvwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA22CAC5A8;
	Sun, 21 Sep 2025 06:41:04 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sat, 20 Sep 2025 23:41:06 -0700
Subject: [PATCH 4/5] arm64: dts: rk3399-pinephone-pro: Add mount-matrix for
 magnetometer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-ppp_light_accel_mag_vol-down-v1-4-c8bbcd3e2e94@gmail.com>
References: <20250920-ppp_light_accel_mag_vol-down-v1-0-c8bbcd3e2e94@gmail.com>
In-Reply-To: <20250920-ppp_light_accel_mag_vol-down-v1-0-c8bbcd3e2e94@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 "Leonardo G. Trombetta" <lgtrombetta@gmx.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758436863; l=1257;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=FMbYYcUYILGIS56uTIKITyMJkrSy2nzqxC8XrG3nFVA=;
 b=A72tkwED7UWPX7kbrO2yP0e9d/2nV8pTFRVsiT0EQ+eXujO1omM2FspnmfGQfI+4intgbDxxY
 6RIoKoA/V7/CGN2DyaGKghgFZoy/C0EPnEMmKTpIuTo+On3q7kSNuR/
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
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
Reply-To: guptarud@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Leonardo G. Trombetta" <lgtrombetta@gmx.com>

After experimenting with the magnetometer on the Pinephone Pro I found
out the mount-matrix currently reported by the AF8133J driver is just
the identity matrix (no rotation), which is wrong. It would seem to me
that there is currently no `mount-matrix` info and that's why the driver
reports a trivial answer. As far as I can tell from my tests, a 90
degree clockwise rotation in the XY plane would align it properly.

Signed-off-by: Leonardo G. Trombetta <lgtrombetta@gmx.com>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 8ff64004b0a6e3b472077516ab360c29852d7c9f..9442ca4c9ae47d639ed6139c370bacf1bffa65b6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -561,6 +561,11 @@ af8133j: compass@1c {
 		reset-gpios = <&gpio1 RK_PA1 GPIO_ACTIVE_LOW>;
 		avdd-supply = <&vcc_3v0>;
 		dvdd-supply = <&vcc_1v8>;
+
+		mount-matrix =
+			"0", "1", "0",
+			"-1", "0", "0",
+			"0", "0", "1";
 	};
 };
 

-- 
2.51.0



