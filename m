Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F82FC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3jx9mZP84zW4GKnneObG67nUX/ojN2RZWPwZ8uHvVk=; b=Rpn8hpA3A0VO4gAGzLvtRMfxAd
	R1E1oIY+xQUZcI8jACNcTWG38NrTsPMCBlUWqcf3yK1d20N3kjPaT/SXP12QOsXqroo1K7GA4NwTA
	aur3J3XdM1E4fM7fQhAIgCp4hJc7q6ryhXuITe8XEQSpVnPmfj7uRfyDvPuso62AEbhxKR4qYP8gf
	Pt+qYw4WyFdbnMJBtsgZSKLrjg7wU1xmTL6WviqGKrUs9pTpDph1oQD+i0XLWwlelsG/sk6dWTI6e
	hc0tadYpU5LifOAy+2VxwuYCEWSNoTMpX4U9g4tjOG2MCJRNta/rlo/tCJePRN38YZbxUFZ9hi6RC
	gNrqlXqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxQZ-000000067Af-1LP0;
	Wed, 02 Apr 2025 12:42:43 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxGZ-000000065K5-1SxX;
	Wed, 02 Apr 2025 12:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=g3jx9
	mZP84zW4GKnneObG67nUX/ojN2RZWPwZ8uHvVk=; b=k5MNf0c0yOQ3sb37A0N3O
	v5SekZwbRQDWEyzuVS8p8n/70pO3xrDjvdOBJOIKUjwqu4DCQ5KJDsTFDi5JBDgz
	wOck6gWjtbCpBzXqGkjTW+25I5SRYSXy9LXF4UgBf3GCVY3EA9PKZTcrftg9JxW6
	08pn4WtwXXq+o0QUga2UqU=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnd405Lu1nJwOJBA--.36321S8;
	Wed, 02 Apr 2025 20:32:03 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 6/7] Revert "ARM: dts: rockchip: drop grf reference from rk3036 hdmi"
Date: Wed,  2 Apr 2025 20:31:40 +0800
Message-ID: <20250402123150.238234-7-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402123150.238234-1-andyshrk@163.com>
References: <20250402123150.238234-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgDnd405Lu1nJwOJBA--.36321S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry5Kr43uFW8Ary3Kw15Arb_yoWkWFX_tF
	yIg3W5Ka1FkrWYqry8tw4UGwsFywn5GFWrJw1rJr4UGwnYqF4DuFs5GayxAr15Gay2grZ3
	WFZ5Xa1Yyw13WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0aYLDUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gUjXmftK+o5lQABsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_053223_779028_22E54E05 
X-CRM114-Status: UNSURE (   8.50  )
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

From: Andy Yan <andy.yan@rock-chips.com>

This reverts commit 1580ccb6ed9dc76b8ff3e2d8912e8215c8b0fa6d.

The HSYNC/VSYNC polarity of rk3036 HDMI are controlled by GRF.
Without the polarity configuration in GRF, it can be observed from
the HDMI protocol analyzer that the H/V front/back timing output
by RK3036 HDMI are currently not in line with the specifications.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v2)

Changes in v2:
- First included in this series

 arch/arm/boot/dts/rockchip/rk3036.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3036.dtsi b/arch/arm/boot/dts/rockchip/rk3036.dtsi
index 22685cd23a708..95ae815ba56d3 100644
--- a/arch/arm/boot/dts/rockchip/rk3036.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3036.dtsi
@@ -405,6 +405,7 @@ hdmi: hdmi@20034000 {
 		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_HDMI>, <&cru SCLK_LCDC>;
 		clock-names = "pclk", "ref";
+		rockchip,grf = <&grf>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hdmi_ctl>;
 		#sound-dai-cells = <0>;
-- 
2.43.0


