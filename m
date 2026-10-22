Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8240A606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=blkwneYb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nN+JA6RE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6/5wXgO+LxtHjUK045USqfI3dlUW80LCQmKUkVA8okc=; b=blkwneYbdNCXG5
	2ds8Jvu+DnOt971Xt2onCc9Nj3OSgg+zGUsnQ6XnzUr+H9nC4UR7HaKSUaM89Rwx/VqxKT8ZnD4ta
	6vT9CyweHLJTgU0ocSA7AzpVQRQWmd3l9OyrdSk7ug2V1GoBhHH2PEGNmqwpo3zdsyG3mFkZtJSOU
	+3X84TqCx5k1Wa34Z41032HoJThacwHPAI48SW0Nwz7FFoNKnRnPXYec6RdEf+BqudNYZlGdIg4aI
	JLywO98gzyFSHUjd40d/rVLUVOaGf67UJ045UXuShIYU6+uHn3shKWrRYxM3WPHrmUuDZ5HoTVYOh
	sY+E9dP7cpPplh5L++ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsJF-0000000E6xC-1voP;
	Thu, 22 Oct 2026 12:54:17 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsJD-0000000E6vg-3dpS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:54:17 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-87137a8f4a6so230924b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673655; x=1793278455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/5wXgO+LxtHjUK045USqfI3dlUW80LCQmKUkVA8okc=;
        b=nN+JA6REeMuzACcWa+sA7fGvIT0sCA2w82a2Z8PHB0nX3wjYTd465eeHGXSSutzcZR
         uNLI2+aUamvV2nvJV+E9HEZPnN6soTa+J5weoFcWtYuAiWVU2iRAwufGi8hCF1h7Md9p
         zTo2PSyNSuPbE2q9LQ5fZysTld1Tbk61pEW0qJ6VrNGZZP6KiDSgibZn9b/dPJg/ATRj
         d/dg72LVsVTxvdrtHcnpbfuKVwGRnVLrgHK/zwjYpMeXtT48SV/irUQavNr3elSBjVR/
         NycyybEOvxzriXVuTyk87vGKNtVpSQXG8tb8hQ4KsRiZvRLKWAfg9kk1g4hEvaubQ4TG
         aJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673655; x=1793278455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/5wXgO+LxtHjUK045USqfI3dlUW80LCQmKUkVA8okc=;
        b=JhkNR0JisdzIHAxzLvwjd4bxDHbmTfZqE5O1tz/m5nZhevR90ragPL5ZGtjMHQN4gT
         8Oiksb4SSHS96pfYu0MwDlD1vAtjrFA7vmJujdzwg0WJ2LXlYgbYXLexJRWsrELknEXI
         /TCYqAm7fUMJt1B80nH+7O66npScBUhY04Ql+DnPszFS7KD8nXpIqGIPebMzpf0OQlFb
         hpWxFU+BGdktTIapWr9A9fSEDAFTJsBZO7+3dRhLiMWb60Hmd7stKZP60VX1smQT7ZTD
         wXDB6be4STT8N8lAnVzsIswAY2udETJsMGfGCHMgpkOqKFHLdlI+3EmwGixZj95rSbvA
         O+yw==
X-Forwarded-Encrypted: i=1; AKwUvBxRx2DDxI7btV2Lh9NJWNbwKNErwVwDMyqx1Uo2vCvRxcCsF/cINgJzUJCeq51t51s6bGXpogg+Xftu1ANvuSqo@lists.infradead.org
X-Gm-Message-State: AFq9FYJAZsgcOysZx6IfFW272DYV4fowYuLAjcI/G1WxGfTz/SCNQsVb
	kMp9VPz+F0fAsV/xZzHZ3R6OfBbDzXxOLLgAxU7Blh4FbTsdICWHdqwi
X-Gm-Gg: AYBFou2zcGiIHFgFAP8uIJ2B/lBVDVu3h4TaF4OHNAZHIcVL9PX5NqNTF/+fOwLeIRK
	QI1BysgO8tta85ZGYKMtFIyTxVOqpdUehL8HwnIBoQ5TUurDqA36HXKyUYaQHKBd1kQWZ77Jhyu
	0T54MXae+N0YurDzt8jP4UUI2jyolNL/OecMhn/rRXQASbggm7OWJif5fCCswAoH4N3AFz6az2a
	FmeneCFIQRxTxvj5cZu7W+uoV14ncRAN6yEFq0Y35evorFR9PbUBnSjhNxedjnM8phjhCWafUpr
	NOdmUA39ElZtxYoafuy3pgwf6nKaWGpNs7s2h89GMmBbKvUAwSgxsthh4UW9t7clO2+NeZvR8Xl
	Vq8DPOwthPk0xtJU3sW54v3PBt8/aKYhBqhslmvz8rOHhphnyy84I7JtXWkzhh5otxo8DTfCOcR
	5YG+Y2iEEz+vx3umK5sEz+ej2FNKjqPUnP+Vj5XoeTn3DRm1omztKwsj9V1IEPMb62/b3nRvAcZ
	NsTfFX3Wo4Z0kCCjpPx0v7+VXTFWRgEbW3NJaosJWdxmopFlAHkS559n0Q=
X-Received: by 2002:a17:902:c94d:b0:2df:8ab7:fe3a with SMTP id d9443c01a7336-2ea43d9222dmr65190615ad.4.1792673654906;
        Thu, 22 Oct 2026 05:54:14 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b435243sm23704165ad.31.2026.10.22.05.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:54:14 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: rockchip: Add ArmSoM Sige7s board
Date: Thu, 22 Oct 2026 20:52:54 +0800
Message-ID: <20261022125339.82746-4-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022125339.82746-1-liujianfeng1994@gmail.com>
References: <20261022125339.82746-1-liujianfeng1994@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_055415_912053_3B6AA902 
X-CRM114-Status: GOOD (  15.66  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ArmSoM Sige7s shares its hardware design with the CoolPi 4B.

Add a board DTS that includes the shared CoolPi 4B description and
provides the ArmSoM model and board compatible. Retain coolpi,pi-4b
as a fallback compatible and register the new DTB in the Makefile.

Link: https://docs.armsom.org/armsom-sige7s

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 arch/arm64/boot/dts/rockchip/Makefile                  |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 442d322a20cf7..c8a5a88a0e46a 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -231,6 +231,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-vicharak-axon.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-vicharak-vaaman2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-youyeetoo-yy3588.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-armsom-sige7s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-coolpi-4b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-gameforce-ace.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts b/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
new file mode 100644
index 0000000000000..f17f0d632b1d1
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588s-coolpi-4b.dtsi"
+
+/ {
+	model = "ArmSoM Sige7s";
+	compatible = "armsom,sige7s", "coolpi,pi-4b", "rockchip,rk3588s";
+};
-- 
2.47.3


