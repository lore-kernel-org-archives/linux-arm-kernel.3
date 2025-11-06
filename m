Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3BCCCFA1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yCjsaoFkOvmC3WJaoawYLPivucq321KJsantBtPkYE=; b=Fi02MdaK8lYx1c4EeCnle4YXXh
	K/2YYIi6IKgzIVEg5W+ehbnd8gnUotl2KKAVmI3ZYkVSbrWrouDAfe+0ayIQyLJEfjo+8QkZmJnpD
	bg6pFNA7ktjgsrmKlJ2NgM9yIcTnnSJgmAi4F1hg7c9oEjkyEgZJrVVSQFIKqqNniwFK3pGjC6xkR
	hyX6yRPjq4cqVPlMmyO8i7iRs1jy4lI2GIrBaTv1mBd/zfST0ThwxgSQdpf2V2IFsn4hGbjjw9ryl
	JVCf2sYyPVaRsGX/rYI82krjnmBpmY0pkdzEgCfJcDSzVdVWZ9nzX/ocQ9F9mioEcgzWiSJU71M6t
	1tLWH0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpPR-0000000EjR1-0xWt;
	Thu, 06 Nov 2025 02:07:33 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpPL-0000000EjGr-3itw;
	Thu, 06 Nov 2025 02:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1762394817;
	bh=9yCjsaoFkOvmC3WJaoawYLPivucq321KJsantBtPkYE=;
	h=From:To:Subject:Date:Message-Id;
	b=dm555Ud/bmZKwapq4//dn1xIkHHF3D84kxzgaebaKQ1otml/PdW2NUY8xmywXeJfZ
	 cX+kBgd+Y3Tm45dJdTzAVWbBN7bLv+IWFoNZe2QAWvnO0rtOfdRVRBkP5JsFgbPN4U
	 J3dEuUWPzfFP/VyPkBil5FyHNtua3unIxxzao3fY=
X-QQ-mid: esmtpgz15t1762394815tba64791d
X-QQ-Originating-IP: xOTzFY12cbSb/MFbDxpiyuQb1pU09c+X3VAD/uHNlBU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 10:06:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6204674981207334838
From: Chaoyi Chen <kernel@airkyi.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 3/9] dt-bindings: display: rockchip,dw-mipi-dsi: Add compatible for rk3506
Date: Thu,  6 Nov 2025 10:06:26 +0800
Message-Id: <20251106020632.92-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OVdyvDaZFkszlfAdqQIKMczp6crbpwZOUDN0fThezjR5l+O+KepqWIxp
	FxALUlukqNb5b8wQc9j9AkcwCwwlMj7at9SeyILcZMaeufuKGya6TrpsktV2X2pZHiL8abr
	EdknnfdVLdrUFLzVgC8HvFJ/CNZ6zE8iVfiJGcymGm8hIHsjuH3E0JO+RhqJbFoGS8R3Zmt
	AT0Gz2etjHJuub2BRLc6UxEMHMls8i8g1cnH4BgKko7aF8yM7cXtmVk0VuI8BWhstg86nH5
	M3P7oKqpjnHCFB4NJOydDXCEWMqiLLkuvySUV+tWAD59zPXYZImSJMX4w6mwEpXWldQfv4f
	sHFVTpYtziLNbgM1bm5WLgn56yPqUMUDTic7vWsRk+vEfLux+4Jf6intW6hBbC19+UCzoOO
	g847JCXcKF++jNuGmmCRSabVL2Z3I4LyH8Pu+QJmdcxyWkU09b4wcs7UhZxsQMBes2e29dk
	Slc27aes+6Dyk0vOXhQM4c0go7kcL4//L20XW5dpbbBVDgF+WtxxEkGMk8w3oxGQkOO6NA6
	EDY6TU+4cXNTrMIU/3ugtEoA6yxCmijEHJRiqWFCdOQWkMISal5/IQoAV5X0cffY84OANY1
	28uxGhMHY1yhphZTm/Fpp7lpyDIAkNlzxHEIIYHMit+n2d26COPYCFHlrHp3FB7BizvnTRe
	FtVnFzZ92GkFBn0GWfduUxADOACppENEc0goQp+Y6CoYEnRjgZ/DznuypJ5V9LC+ETCa2AF
	yx/y42+fUwn2vp5GNqOqWxsZMQugJX9tbmF5tFjZiheIjdXzP8HB7a1xhAbAtc+T85czbem
	kcB7bK8DJBUU6Tf43Fjw4Y+t67KLuKPrHYmZODV1tHyB6gLRU8pJ8mIHHypUp2IFRm7tRV8
	SsQc/pRnjEKyPi2MOkecHm2vm3ZcT1mff9P+s+yJq9jbTy7p23JLCrGknAnYlOwjOzlVgCg
	JjdBbq+mZVfgUPqyAOwosxzd3A/NtD9tSTQdCwQFf1LI9dvEQKz8RF4cDz0Y7/M/JCb5jZL
	88/VNVKc70Rky5bVOlXBizoDmcd+g=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_180728_772462_D64B9F86 
X-CRM114-Status: UNSURE (   8.14  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Document a compatible string for the rk3506 mipi-dsi.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
index c59df3c1a3f7..d949750a3afd 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
@@ -73,6 +73,7 @@ allOf:
             enum:
               - rockchip,px30-mipi-dsi
               - rockchip,rk3128-mipi-dsi
+              - rockchip,rk3506-mipi-dsi
               - rockchip,rk3568-mipi-dsi
               - rockchip,rv1126-mipi-dsi
 
-- 
2.51.1


