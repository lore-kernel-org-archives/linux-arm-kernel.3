Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0999BCCF2D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 20:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6VTzkNz3lljWq1ttScTRs6n3O7AGKj08rTBFz2E/vc=; b=zAXXDGLRr/jSfOLuGwiv7OAzBP
	gxyBMmXpNoWTYMh9edrG5d/hQ2T489XHSPjFBsaRHAv+Cn5a9Lm5tOGjoRiDwrYxLNj1VQdRzi3dj
	XKlh8rQ2AsBZNgaUc1K2ZsMCo9TmCnAATRZzacxAIVZd0B4/O8k5w6Ym/m4vXlnJzJnwnwAu7Mcx4
	3ogu9P1nDntHX/C37s+hT9RIYaQW/StmrtchilQ3+qg5DBgqxtApGLM8l++9uz5o1Kh82BnSGOgb9
	ZgsvBNVs0RkD3Kpu6FouCTpOKtq0u+WazRTh8CZkCRz7AVnYrjtK9XdZI0JZVMtkSA3CvcXQD17DB
	Fa+mGEhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAZN-00000005BqD-0sOR;
	Sat, 17 Oct 2026 19:59:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAZM-00000005BpI-0Pk5;
	Sat, 17 Oct 2026 19:59:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5401460D77;
	Sat, 17 Oct 2026 19:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6071F000C6;
	Sat, 17 Oct 2026 19:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792267191;
	bh=Z6VTzkNz3lljWq1ttScTRs6n3O7AGKj08rTBFz2E/vc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I3Z9AJwlEDJ3hEEbUpZgPu5mDx2UniT1FMTwNIrV39TPl9YB6mBOTcmdvOM5PoEty
	 Gd8bfKrIsLNYecEDsEAppsAtEI46+IT4e7W22nenqied6QoTTucs1S957XqdHSw2Jp
	 tfoLwogxvnc9NZXpyZTNyYoycrnxC68k/sn7DNKPJKKS6lX2RHiCh2ggQLDH+uv5Tw
	 Y8ZyebOlJUb9gwApXPZyVAIaLsIUoSPmRRyGJ8BGyAp5hRUoy8A9stJ7WMTxPFwoG6
	 JGDaXfEm7wNrE+gUjqSkD2VY9/EehNAWh1j13G5ueXQB043L7AGAe6EIg4YSy/neh3
	 KhmpHW/QN+9Xw==
Received: by venus (Postfix, from userid 1000)
	id E5332182303; Sat, 17 Oct 2026 21:59:47 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Sat, 17 Oct 2026 21:59:30 +0200
Subject: [PATCH v2 1/4] dt-bindings: connector: Add DP AltMode VDO
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-dp-altmode-dt-defines-v2-1-7ab3d93553dd@collabora.com>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3086;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DdeBUOCYvUk0SPwWOcib78tj6lKNiGNHfOqgeC+j5L4=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBq09Oy99LFXrodoWSUSElKdFj7JV5R+WhvMznjr
 0MlWUnuiI+JAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCatPTsgAKCRDY7tfzyDv6
 mrMdD/9+HvJ6ObmxML/8/RtfTM84m2rQCM5E6/R/Ld0ZEWuHbER6ldNPo9wkIjrxoaAKTG2S7y5
 nuSH+2p8bvyNiBwYSXEQhP0MHUDDzPPceuX1wvrC9n9yNieBCd8N2grQbImRxvJs8jVvMvMKD9+
 OKfMq3RZWDpjBx4FlK+6Blp1sgYuTINewZ58Gpg1CqT1nEojJXiKY3JP+OTWVcD+R4j2DKrtHrq
 8flld79PIHY9PM0aVPdAAdCrkGq5S+oRJGfadQ7pbXPEZKM7aSL83RUc0l1ojU9iRTFZjGR5Stk
 b39hRBuU/Gq5SKVe6R7h5Nf4KP81ga6fr7lRB8wTbHL4aiplpa5VzsGxDAFKgn8S0I5sL3wFr/N
 pxr2uVdqLAuVjXPlFCzgcAQxnlWdM7TaOaMK4MMfCpfYJos3jg8L4bCik5q5wYFHo0rFIfWvhe7
 bwGdhdLFPC3xwpunNDQdp+GNYeXCACUbSo9riyP1AvQwNav6wMceQmLNP6GHXutLhfrecjMAt4L
 hb8o/c38BitSnqWW7Wc3hgOnzK9Gz66wmAWeCXfE+xloEtWV45ZRy4CpSASogTA1BHxLdhWQGo3
 LxpufGx5QeseQlvJ2mqfAlVS4zVStFaZ6j/AJAiF1I+Oyorb6goyMI6bcYd1aA7TKKQ13xi5Ue5
 6FOD58lIg/lebew==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

From: Sebastian Reichel <sebastian.reichel@collabora.com>

The typical USB-C DisplayPort AltMode capabilities for a down facing
port (i.e. sending out video data) looks like this:

altmodes {
	displayport {
		svid = /bits/ 16 <0xff01>;
		vdo = <0x00001c46>;
	};
};

Improve the readability by adding defines for the numbers, so that
the above instead looks like this:

altmodes {
	displayport {
		svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
		vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
			      DP_CAP_UHBR_13_5_UNSUPPORTED,
			      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
			      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
			      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
	};
};

The generated DT binary will stay unchanged.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/dt-bindings/usb/pd.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
index 1e64a1f563f9..6cea6165fc0f 100644
--- a/include/dt-bindings/usb/pd.h
+++ b/include/dt-bindings/usb/pd.h
@@ -483,6 +483,64 @@
 	 | ((vbm) & 0x3) << 15 | (curr) << 14 | ((vbi) & 0x3f) << 7	\
 	 | ((gi) & 0x3f) << 1 | (ct))
 
+/*
+ * Displayport AltMode VDO
+ * -----------------------
+ * <30>    :: DPAM version
+ * <29:28> :: Cable type
+ * <26>    :: UHBR 13.5 support
+ * <23:16> :: UFP Pin assignment
+ * <15:8>  :: DFP Pin assignment
+ * <7>     :: USB
+ * <6>     :: Receptacle
+ * <5:2>   :: Signalling
+ * <1:0>   :: Capabilities
+ */
+#define DP_CAP_UFP_D			1
+#define DP_CAP_DFP_D			2
+#define DP_CAP_DFP_D_AND_UFP_D		3
+
+#define DP_CAP_SIGNALLING_HBR3		1
+#define DP_CAP_SIGNALLING_UHBR10	2
+#define DP_CAP_SIGNALLING_UHBR20	3
+
+#define DP_CAP_PLUG			0
+#define DP_CAP_RECEPTACLE		1
+
+#define DP_CAP_USB2_USED		0
+#define DP_CAP_USB2_UNUSED		1
+
+#define DP_PIN_ASSIGN_A			0x01 /* Not supported after v1.0b */
+#define DP_PIN_ASSIGN_B			0x02 /* Not supported after v1.0b */
+#define DP_PIN_ASSIGN_C			0x04
+#define DP_PIN_ASSIGN_D			0x08
+#define DP_PIN_ASSIGN_E			0x10
+#define DP_PIN_ASSIGN_F			0x20 /* Not supported after v1.0b */
+
+#define DP_PIN_UFP_NONE		0x00
+#define DP_PIN_DFP_C_D_E	(DP_PIN_ASSIGN_C | \
+				DP_PIN_ASSIGN_D | \
+				DP_PIN_ASSIGN_E)
+
+#define DP_CAP_UHBR_13_5_UNSUPPORTED	0
+#define DP_CAP_UHBR_13_5_SUPPORTED	1
+
+#define DP_CAP_CABLE_TYPE_PASSIVE	0
+#define DP_CAP_CABLE_TYPE_RE_TIMER	1
+#define DP_CAP_CABLE_TYPE_RE_DRIVER	2
+#define DP_CAP_CABLE_TYPE_OPTICAL	3
+
+#define DP_CAP_DPAM_V2_0		0
+#define DP_CAP_DPAM_V2_1		1
+
+#define VDO_DP(dpam, cable, uhbr, ufp_pins, dfp_pins, usb, rcpt, sig, caps)	\
+	(((dpam) & 1) << 30 | ((cable) & 3) << 28 | ((uhbr) & 1) << 26		\
+	 | ((ufp_pins) & 0xff) << 16 | ((dfp_pins) & 0xff) << 8			\
+	 | ((usb) & 1) << 7 | ((rcpt) & 1) << 6 | ((sig) & 0xf) << 2		\
+	 | ((caps) & 3))
+
+#define USB_SVID_DP_ALTMODE		0xff01
+
 /*
  * Sink Load Characteristics
  * -------------------------

-- 
2.53.0


