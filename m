Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFA4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJfT3al64j89KUZlTband3H4GOH/hk+OuA8dIFJ1TmA=; b=WpIOI7wSosZI5gCiq+j4tgUSn+
	BrpPZr07Oa6o/oV0K5P+wXnw28w5w04fkZ0cYjne8a/iOCS5Q/Bs4lax9MB6xio24T3f5HzGGaSSn
	BVGkInc5e1H8J9qxcWQKIqOEgcoAztODeuAZkCQGBP+B81SVLrHhB73lnyV+xLXhzt2wYyOYMqEbD
	F/7ADFisxF4uUgzQsy2xNClOMWr3X3X6d+iLwcaam2/me0+F0DazNU89gepTmcFpmXdQsJfu11xHf
	uer+4VVGRhORTvOZ4/S7/E23wNCXpnW19DOu8XG8Yh0+X3czJ1zQ96FUQ0brwO0lJVo8lt7yinKf7
	qVdpwzbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpPQ-0000000EjPg-1Vkp;
	Thu, 06 Nov 2025 02:07:32 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpPL-0000000EjGt-3FCO;
	Thu, 06 Nov 2025 02:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1762394821;
	bh=aJfT3al64j89KUZlTband3H4GOH/hk+OuA8dIFJ1TmA=;
	h=From:To:Subject:Date:Message-Id;
	b=YAMzm5Vf+xNv1ToAgP0q47eMYraDXkm6A3a9ioofICo8SCGt9j5uUilHhvT07OmRG
	 NnTATt+M59f891jAHtyrGQv81KTp4wmEfK1OdSykiAnzWCbB+ZOYLN4+0UtlnOdp58
	 KJHSTvD9QsnOxAkKIcY6uRHqylZu7Y4reQ4DF0n0=
X-QQ-mid: esmtpgz15t1762394819t768674e9
X-QQ-Originating-IP: UM6wceQl0W0g/3PA4zWPUeXO1m1KWpgObbxmmmz1aKA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 10:06:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5131190821667047602
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
Subject: [PATCH 4/9] dt-bindings: display: rockchip,vop: Add compatible for rk3506
Date: Thu,  6 Nov 2025 10:06:27 +0800
Message-Id: <20251106020632.92-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MvWsgqCEECOfPYMVn5vCz4J74sJwC9vSpGLaeFiiVJlMZZiS7ytL3P0S
	BqKWhHrwxo1dhdAPR6Tr1Xz9LkRE8uMEQlyawBS5p5MF3dlA+jwurBcCCR/BkzCafsGg6x8
	K0LdYkgv29hvyTAW8txi4iSNAhw8DE4Yq3ccD1MzpuWUwsxE9KV62cBy2LnZoZfc1YZkJnK
	7Fs7fcVGK/oCB8nTOBL+SKvJsk8CmM+Zt3e/xxKQS8Ku3K/mNfwVTsRda74tSkyK0MTvJaY
	0qW0jZ9lX/ux1L8G0nn12NmbmCbLJ/CaUWTg4XR4Llij+k14wvTiDHnosSmYDkI5WnGJkzE
	k6o2e+oCKfvuh+ckXWTbDPSOr+jJbThJuawuwN3VKaJep95Gc7Btyr6n9LjM1es4v1xwpSe
	Jb8H8hxX30Jwy7M2iQaPB/Lv1B39L4sr8XiEo+FMaRaozLQBikxyRURHp7qpUSkJ1nfr5RK
	/mQZ/2n7EJiJErx6xtWWSijyO7dQ2Pshcxq7GiF1419HXZLOR46QnRlAeu2kbNRXNcQ5Mbb
	y2odrpb4nQI3a1KCHn2fROx/1zDpPq6jThXUN3o0HGKDr1VSOWmBAEP7gl7qnlnKRh21ASR
	kYR0rHhizWbU20N0zEQtSGufVI2R9Lf5DbxrlSIeTc9NAplJlo68PgqKBU8TPc/dkAhSg6C
	wR0qRrdtDQ4pGuBvfjTHNBdGibTj/b+K17Cg/V9nGKh8xF2eEXJXKONc5u5IAY5HU7LlxYf
	8+Zi3gxZiThF+CTKF0BkVD9npkf/PXkhwdi/ztbGOmVKuU9HFulEChLW8WiFK5wsJXzcrTd
	Lr0jXUGpAvicGcpGjLchZ4UQ3a38XIrvr/Qn3VkdyKCY3uO4UawOQVeP6bdiRJi6f7j46qW
	3mARXa0aEWVs9j65bnIsLmC8ACXJr+4WZTsxsaEVBooxXcP+YrHd+p9e/MSYnnBu69UrGBn
	hpW5knfqzNOHqnhdxv9gsdvmOM2jUXshJ9iAHu598Z+gpHqx5XDxJkRnHkD5JZ1EGdJY+lZ
	xD3IqmvZ5uG/QRtf/8U9edwBmFnwk=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_180728_212280_C7ABA26E 
X-CRM114-Status: UNSURE (   7.57  )
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

The rk3506 VOP has adopted a new implementation.
Add a new compatible string for it.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../devicetree/bindings/display/rockchip/rockchip-vop.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
index 8b5f58103dda..fdf4b1109da2 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
@@ -31,6 +31,7 @@ properties:
       - rockchip,rk3368-vop
       - rockchip,rk3399-vop-big
       - rockchip,rk3399-vop-lit
+      - rockchip,rk3506-vop
       - rockchip,rv1126-vop
 
   reg:
-- 
2.51.1


