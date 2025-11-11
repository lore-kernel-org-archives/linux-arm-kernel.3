Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE99CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=; b=deDbjwEXFuTSO6ZFJ6ZX/yx/VN
	7ZVXi1rUkfH+IXb+AowdssNxt6gu/RDJ7R7pa4Ecpawe0HL9bk50JgEEFC70WFXFb3lA4/Op3XfUL
	1tbzPPO0vkYnyl/ucFCTfSBB4Bw3Pz5IkKj8TBe9xpApmC1HjwVEvNsS/k/LivzlCEwDjhgC8S+Yp
	/bAMg3DG13fTNcNXemGW0pjMf023d4ejr1t6Fo4xS5uvs+BydgGf28CgqyUc3zGZLZZVZg3KsDGed
	m6gRJ6woZN0ZSjsmT6gTCusQzQDPUSHZH1bejrFOw+S8fgbwziB7S511Z6Z+BXKXQq2aw3TWAL6K0
	XJg4eZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlzL-0000000710X-1KIV;
	Tue, 11 Nov 2025 10:52:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlzK-000000070zC-0bCu;
	Tue, 11 Nov 2025 10:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=; b=N5f4kfhBItzFLs9w3KkYfvxi9O
	aA/wpQ9mtSgIsPnjsoJwrpw4Ns4rHOirNFNZklEAXgdipjPQaEbtaS2fNHG5dgoTD8P6J+pH/Ozkk
	GgO0Kyn2wrzsWoJU4bu/uIzJq2ycXVmKaPxClm+FhjlhnlOL3gDagwrIX9s55DY9TW+GsUYed/Kho
	DEEaZgotbdQBXl+OiXGSxXvLz+/HVfg6g+GaseS3irg49rUfIYhCLNiDg7uA13XgJujQ3N0D9GM/r
	kG+nTjmFG7ALfVudQ9rqklD44Aa64BJnkDunU6znXC579XKqeSJtdYpmsF8ujmP7EsXYHjQO8SMe6
	FFc0U+Sg==;
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl7a-0000000CxjE-1QBx;
	Tue, 11 Nov 2025 09:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1762858294;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=;
	h=From:To:Subject:Date:Message-Id;
	b=GuOEd/RzZKVauL9RE22Jun37P32CADUx8LslqLk68IcSmkIbcIKProj9OxzLUbfDV
	 kWfwbRlOdU2EyMtP3GRd8mH2yRptWPuSn3OKzv4PaswoEfvzX36OGeRaic7ac4xOTa
	 q/T864jm6PVFuZBpH5nUSkRfmqUIOdfB/IrobVWs=
X-QQ-mid: zesmtpsz9t1762858287t5941ed20
X-QQ-Originating-IP: oggRwoMydKBDH0LmcR8KzliYg47YhSd7rMeyclg9ztc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Nov 2025 18:51:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15062605320672791780
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 09/10] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Tue, 11 Nov 2025 18:50:39 +0800
Message-Id: <20251111105040.94-10-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251111105040.94-1-kernel@airkyi.com>
References: <20251111105040.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NJ8AO1QhldfJoDDr/XkLuMY1LVIRQJMBVyeMyuYgLts/HGgoS2B9NTnn
	piM5XnUclVMh5nhEnK8Tb09cQ6ZyqrEHBH9aOrqV/aEb+rVBs0F9MtcsbeJtWuWfgSvnc8I
	zyGlydbvwnQKn+01M1lYvAMB6cmocuIZG3oWp84rhMUB0Rvo8VCh2U1pFzt1nZ0KUntyGaD
	XMxWwSx2sRvjWgT+wA9n4TbbV6bxeIaVr/rxcNoN5/h01nxWcKb3jy1hTXVmjx6uUaoUfXA
	1GhCPd/BedyaozTr8D9QIpTt+rapaVGbr7eSK+bsORIAPPFDwPWMhLM4l8sRh0AnSG+3FH3
	m/IT4njcE51xd1ScnL8/ZvGr4PPeecqh1GN+JIjoZ1Qp6iockS95vnY2fiYAcTSXRPq7xQO
	AN0s+8WjNpl3aUD6+lamGmyjdilN2/Y+DgfFmKSQyjUOOqi+lXB03DZA7xyuzX1Bx4H2Q0b
	GYkWmvA6wVRf0mFcSYlx7PvZBBq9HU9ngBmHv02mTEkoekL2+1tbGdLPSp50fzkFJtd2q0G
	Pkg7rqKDv3h7lfDp6xkAP8YZH22WHh8tgcWXIBLFtX3xIyzrCVeRBt5YeM0se+0gI2dqroQ
	hf1ODcoWPxs2cIjH4aXD2o7e0dH6UL6grfgCjDUk5CUhc3yrA0wLxtmIpEzOBZXU4A8SbS0
	ED78B+yXgk6tKR0U7CT427A+4O/59pPeelGDYcOlKeXth27CrDkA572HESLHt23kvMwNTi4
	G9xpIqrLxe/HKBYqwU0DGIOOtu2jnbAz1LDf2pMm6az016tWdvlBaRi7QhL6ovqxnLJ99LP
	QYNwxrmflOpV8KyKqCMy3KnqbUv+pew0ajS/jdpgIrGM5C9tFl8SoD2fgGsSqaRP4CKPztZ
	2ZbGcRXI8ytCMKOj5e1MxdFLoUJkraCqrKjLS4gmK6RmFjoHy41V/I0b6rj+RZVqr7PvJ3x
	3iN16yJTpRk9ZRsldLZyYkf7dpendSO5RAl9qdogID2PG9bRInaeqjxMoZqHKMFgffQoYaa
	qfl/YwhQ==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_095707_043887_E5B3A6C9 
X-CRM114-Status: GOOD (  10.48  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Let's make the ports nodes of cdn_dp in the same style as the other
display interface, and match the style of ports's yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v5)

Changes in v4:
- Remove unnecessary #address/#size-cells

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 4dcceb9136b7..93b42820998f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -618,7 +618,11 @@ cdn_dp: dp@fec00000 {
 		status = "disabled";
 
 		ports {
-			dp_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp_in: port@0 {
+				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -632,6 +636,10 @@ dp_in_vopl: endpoint@1 {
 					remote-endpoint = <&vopl_out_dp>;
 				};
 			};
+
+			dp_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};
 
-- 
2.51.1


