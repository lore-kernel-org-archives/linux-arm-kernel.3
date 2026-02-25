Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2596FD3774
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BcLNx9UMsyWZpet3moXoK3gAbQENZ+pY/k1fTbM/ox8=; b=mwnQCcY3calLk7lh5I03XWEpRJ
	D/ERrtTKISuzoMpkjlBJcaEwUBISJBjyCOG4K3HfUBpPJ+ZF8Q2rnp9+Eq5vXXzM678yYzesaGkOk
	09aP5vrd61FfXdRCUfQmyJaVNXU1RytRyDYrGQLIEnstoDUssxOFgjFJy3VEzaVfn9iv/deyotlzn
	Ahpy0dQPaSS8aeqDFB+UqKULLdwfhJ4NaeHMsOSYvNHz3A4Rhk/KEctBxUsYoUPPi4V7t/qwiir9D
	aOWqSSxj86QSDs2TBqUl4I23PADqoPBy+H50UsfTMllZnV8dzySHvfca8kwDwcRDH7YREcYAG6ETj
	8w5Sn3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIFr-00000004alS-06Ki;
	Wed, 25 Feb 2026 17:00:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIFo-00000004al7-1SZg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:00:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 719CD423D2;
	Wed, 25 Feb 2026 17:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDE4C116D0;
	Wed, 25 Feb 2026 17:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772038851;
	bh=PNi0/q4UjW5yMslxBn+SOhC+y5Dq6F9aivP5HpDL04s=;
	h=From:To:Cc:Subject:Date:From;
	b=bQXAnmwUUO4LEEFrLZyamQRoP73t0nSZoDD1T4nV/7Es3kXCzK0p9z9TPjuQYJchH
	 alKkgA5Sms82jlH2bGPfmd0A0WKIr6AAxnJKd03ev7/265PxpVpBQTrYIzmWHKmm3g
	 w+MRUPwbgzoj6nTovchwWBOxM2NuYP64xPgTlixg0EvmccIJIdykNwNKccYdncB2gd
	 MthZN+KjLruyCPN+tDh367gC8EXz2AdPtA8R8EsulxlDx3STY6gMe86YHg7MhBq4fs
	 DsZXlRmy+vEqpcmBK/kXdJrYy3DM21MrSceEGhESZrr6ao/Da9eoG6QplhxY9NpWfh
	 Q8mSv+jOOdx1Q==
Received: by wens.tw (Postfix, from userid 1000)
	id A68325FD2A; Thu, 26 Feb 2026 01:00:48 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: pine-h64: Enable USB 3.0 host
Date: Thu, 26 Feb 2026 01:00:44 +0800
Message-ID: <20260225170045.1707778-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_090052_427784_E951395B 
X-CRM114-Status: UNSURE (   9.80  )
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

On both Pine H64 models, there is one USB 3.0 host port directly
connected to the SoC. The VBUS is shared with the other USB 2.0 ports.
Unfortunately the DWC controller binding does not have a VBUS supply.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index fa7a765ee828..f2c453ed344a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -89,6 +89,10 @@ &de {
 	status = "okay";
 };
 
+&dwc3 {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -333,3 +337,7 @@ &usb2phy {
 	usb3_vbus-supply = <&reg_usb_vbus>;
 	status = "okay";
 };
+
+&usb3phy {
+	status = "okay";
+};
-- 
2.47.3


