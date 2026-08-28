Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF264C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 11:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/xTvUBCO2k4E+UxHv38QIkDWIckSKvofM9kynm9134=; b=uOcKkux9W8vaYRX+Dk+9/3WqQs
	q8RfL44SV+oN+PdQn7wViS/AU0MqPp/1WgMAJ+VIIld7MhNrMuaAqOc3sxZ4/vjhnj3zD73Eq+Rnh
	+DOST9sooLCJGvVZXUUgKDW7xe4iDdl4zR/tq2sAYLt/mEuSlUqr5jzFitZME1na487bkMH5VM9Z0
	bNYJO+Fh5bQ6ucu/pgPzHFvnElzYD3L/2/XywRTjz3cmGiPx9UYSKeN1k6GhVC+vA61DbyTCuOjbW
	U9mQpVYJ2sLkeul1GNnFGjTIhe+jbyBQ2arnF+s5/W2l5I0RxRMT7DkZC6qAbCgvHqXRDeAwqEi2t
	8fpxcB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv2f-00000005g6x-1SCF;
	Fri, 28 Aug 2026 11:46:41 +0000
Received: from out-96.mta0.migadu.com ([2001:41d0:1004:224b::60] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv2B-00000005fm0-37Zu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 11:46:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=BpRbhcfD3eD4hwtFOUCZCY+oZfkOOf6n1IZQcrr6kRM=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917569; v=1; x=1788522369;
 b=M0LXgUrimLoHl4mthzCHn68oHHEoJpzW17GS+4Y7K36pgYhhzduGEjwSy+1qpHQY7Tb3K8BI
 uhse3lRKtZ6mAFhem1jGqzI4RpbPelQ3HaP78qgbTMH8boaXa5PmJ1SQomGV+m0R0RmAfg9N+Ep
 1um6zy/hsLc6i+7s3rvw8Vepgh2lqnICaMttF8INaemSp7k3kbxIwx6VoZAHZFc+vvdzGgBMJ26
 qbUwc4Lop61E3ejTOV78hEztaXqiKoU7JBwn9UIpFa8fAE/4Or31eG0AzCgw+Wzrs8DUZ8pYnY8
 nLDyx8uq6lg3fPTD4fqOJlUtcREqiHiwwpsQrMizzgtKQ==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5e7500bbdfa4c39b;
	Fri, 28 Aug 2026 11:46:09 +0000
X-Mizu-Trace-ID: 5e7500bbdfa4c39b
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 7/7] arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS
Date: Fri, 28 Aug 2026 13:43:07 +0200
Message-ID: <20260828114530.1315798-8-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_044614_792471_11085BC1 
X-CRM114-Status: UNSURE (   7.90  )
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

Several USB nodes were enabled/configured on the NanoPC-T6 LTS first. Then
those same nodes were enabled/configured in the NanoPC-T6 dtsi file, but
the ones in the LTS dts file were not removed, so do that now.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6-lts.dts  | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
index ff855064be08..0ee67ee24f3c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
@@ -38,23 +38,6 @@ usb20_host_pwren: usb20-host-pwren {
 	};
 };
 
-&u2phy1 {
-	status = "okay";
-};
-
-&u2phy1_otg {
-	status = "okay";
-};
-
 &u2phy2_host {
 	phy-supply = <&vcc5v0_usb20_host>;
 };
-
-&usbdp_phy1 {
-	status = "okay";
-};
-
-&usb_host1_xhci {
-	dr_mode = "host";
-	status = "okay";
-};
-- 
2.55.0


