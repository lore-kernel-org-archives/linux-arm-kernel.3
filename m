Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FD8606D80B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 05:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ebmjmde3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJ2d6y9y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1FAAzk1F3U0dWRjx+bbNnt5XzEZZ95SXINPdQt5c6fc=; b=Ebmjmde3LSpepxyWhNWfr8/xgc
	1j1Fn2FyDEaGTI9BHbixVYbdwjSvDvRnT/XcCyX7gKHxs0Xb5OQgIwf5uLQQWM3iFfL21DcXHefED
	PQ8TMLyH6rSi0kW59GgAtcOosfQg4MchykwJnR+qGW7Jz+2vK/HJAonfW/GstFcdngyHOS6rmmyKE
	qbLcR3QrWSNiADDtEUVUsKcBfCBx6XnGK9uQm/ATIn09HK+75/9AiaYiouHJKSDiRngUAbgxR3yVQ
	pZgLDFw1KV2YZ2xBAE4hOwPl6JyKn7bSRAf10S49Ki0VUitfSWNj3mp3Kr6kFMrDF1PWxHvGYGVOU
	hH7GjeRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTxN-00000004MoW-1qRs;
	Wed, 04 Nov 2026 05:54:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTxK-00000004MnU-2U38;
	Wed, 04 Nov 2026 05:54:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 594AF43E89;
	Wed,  4 Nov 2026 05:54:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793771682;
	b=eEn0CgkKYtBRwifLClqc43HfbK3kuomsnnvaT1Dp4DKPojAECybaZC5CAb+Pp7dVL0Qi
	 /hQ92jT35ogazJcxtYs4JFQeX3sjp5F/nQmhqZbtuCX9zzvJhnF3GHrqpYusQdGxJ54Gw
	 jDMz9udhhDmW5K2za8MyTRdm7Hx57PklIseHh4DAIYJUaOVUsPX80+u5CtF9qVOivIowR
	 L39+B5CxRMMDcMm0k446VrMu0JxdUpKCo0Dgj5KM27a5jfqBmTXJ1pypkp9bck6SrXsT4
	 1SFMekttZXuEdkgRNoPTKpnzLHk9N95rRkqKFJfgEdtgSCsmuiL0AjoQ2Q3w7kXXllQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793771682;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1FAAzk1F3U0dWRjx+bbNnt5XzEZZ95SXINPdQt5c6fc=;
	b=GwbxZi0UmRkiRboMPT8km7qje0au2LY0K2+TS/NAOMCxLfjvCkeZ2h00VhJBcOxc6SRN
	 iuUibXT3YgM3D6bP5sm0cv1fYPA/pFrSVI1pvUYVt85uM+p6CDsr9Aox8oorWWrIoyA5C
	 NmkIS0I/F9LrY3kSqmvCCAVjLorabzUQ+SGntqZdBUEri9C3EXDT09Pp2vclsIeeRvAl3
	 bj0krtYADR2EvxY3SYwXN0+4iVY8pskX5dFVIHRkSBmhWcgkl8zkghBiDLArfk1ddx8el
	 ywMCQjBpv/jOdx+YuZcE6cDvcz4g8SffcM6YCvaWVeTh7DZjfTCb4zdBdVB+ux1ELVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61F0B1F00A02;
	Wed,  4 Nov 2026 05:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793771682;
	bh=1FAAzk1F3U0dWRjx+bbNnt5XzEZZ95SXINPdQt5c6fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WJ2d6y9yLhOaKfuEqArN6bHOZlXp92EcfAOrkJgce+KUB3LHt3vrO8BOhdImo9ffm
	 8p81Q7a5BlJiGPTdmnRLPeVCZIJ5oa11gxwo4vQRh6z8h/wF7+937F/a1PL48rJF53
	 Y2KgovR2fkavbwrRaGyfsmb44i7MmJX/MSHWP6/ugfRLiCzvD43ptM1HJzpSsoqSpz
	 0B+b3Kv7lorV3vl3Z3aPPdrBwt0J2szFM0h546AtPq4YiVsfCH3Bs81osd4GcmVEGp
	 52cDvYRvBWXoVe8yLthXnXFddu0GBOz0jXyaeyK8YrLKkWO5/heinDhzGrwRD0d7XG
	 Dzdhmw0PRcHzA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E38B746CA7;
	Wed,  4 Nov 2026 05:54:40 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Wed, 04 Nov 2026 05:54:39 +0000
Subject: [PATCH RFC 3/3] arm64: dts: amlogic: meson-sm1-odroid-hc4:
 Describe which RTC wakes the board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-b4-alarmtimer-rtc-priority-v1-3-e996681b8086@iav.lv>
References: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv>
In-Reply-To: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=mClFISqM3EXGiotFJ5We6p4d5yRWASHPRbsQrzuZFOs=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmvTsx/0t9Y1JBm47ouRblE/XLWtge6bdG3Losv+Wh4L
 pJL8zNrRykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZhIZgTD/8ignF9Lcg6ff/Tn
 uLWIQK3C5sgd/0+fVFv3eVPx2Z8LFr9mZJg6pzb9+qJk69ZdWuLpSS9anldfmTjZ56rb5sZdl+2
 OL+cFAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

The board has two RTCs with an alarm. The pcf8563 interrupt line goes
to GPIOX_5, so once that interrupt is described [1], its alarm wakes the
board from s2idle but not from deep sleep. meson-vrtc is a register the
SoC firmware reads when the application processors suspend, so it wakes
the board from deep sleep only, and only with a BL301 that handles its
alarm.

List the states per RTC, so that alarmtimer programs the pcf8563 for
s2idle and meson-vrtc for deep sleep.

Link: https://lore.kernel.org/r/20261020-hc4-rtc-alarm-irq-v1-1-b2b8c68d54f5@iav.lv [1]
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index 3ece30a0a1ff..935dd31572cb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -106,6 +106,7 @@ rtc: rtc@51 {
 		compatible = "nxp,pcf8563";
 		reg = <0x51>;
 		wakeup-source;
+		linux,wakeup-states = "s2idle";
 	};
 };
 
@@ -142,3 +143,7 @@ &usb {
 	phys = <&usb2_phy0>, <&usb2_phy1>;
 	phy-names = "usb2-phy0", "usb2-phy1";
 };
+
+&vrtc {
+	linux,wakeup-states = "deep";
+};

-- 
2.43.0



