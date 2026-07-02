Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B525CC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68umrRJwjcSl0SyHmvSITSEjDGeABNfJiVRzgwyCTsw=; b=gWyV1RgeofOPn6mklgfuU70zDa
	Tdf2GmATzw4pUAzEUL+xgRjR1+0ctuztoC8jmUMy6NTHGS0L19fFgecwLYOcqOP5S/iK9taYezP5m
	rYV0dboZfriLoDbhDRNKHMqIMLLuKd99mrhGNJflhupSptGJZtQH47004YnjSUsJAnTDffQjtjISV
	0+OGP3cjniuYNQV63bTQoEXvsNMACaqBXrgatPtDSNADo1OceVf9iXIyyyTgY7CyPwkuzeVrm2+7R
	5F06iyj06BJBnMDL8uwHyaal1lKn7iu596Vd38+RYZ3LOMQnBwe7VjChnywiEaAjIHQ9gElD8Am0S
	muOLkRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfI4g-00000004age-4AyZ;
	Thu, 02 Jul 2026 14:07:31 +0000
Received: from out203-205-221-235.mail.qq.com ([203.205.221.235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfI4e-00000004afA-1i9F;
	Thu, 02 Jul 2026 14:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783001246; bh=68umrRJwjcSl0SyHmvSITSEjDGeABNfJiVRzgwyCTsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=le88ryaITlbvOvp8ujEE3d1I6zilgHtpx/0cHQt74gp+V1c1Qv3WtucayYsbMfyGH
	 pwLiUTG7YzkvJczv1I71B1itLfY0VvL/HCv87mWNLJNSxk1Jq/6ZzRz8IfxTPBIKkK
	 xmEGE9DLg93OfHqSCqUfa0ZMa9TE2pNkCuzqXJTk=
Received: from localhost.localdomain ([218.4.149.66])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 1D09A800; Thu, 02 Jul 2026 22:07:16 +0800
X-QQ-mid: xmsmtpt1783001239tb38rpwa1
Message-ID: <tencent_3B2B6003D1DE4FB7A984665A062581766405@qq.com>
X-QQ-XMAILINFO: Nb+v+bm9wQoUq/DtgdEc2I6YSo1drC1SRiyFXoRlMe3SZ7e9S1Q7m64zPQrKNh
	 zfpmuPrQiI8OZMGlgvYnz2a5ECWNVj+ivr5ZYWZ+jZ18XHRpc9M8RiiOh+weZ/DEi9KX8FYa6HY7
	 BcJso5jkk4gr4Z4mp9bMZg10L4I42xhIOw0I+c8OvlJisgTeSLJbwzQT9FWCoxQhFcUKTBKT7dAj
	 3SRkxL9a256tr0130WsEJGmlpAv/wzIBMjQunth+rDCrOn5173vbRrxvMVexx4jcgy+4GgGbFOCR
	 K0Y9lHud2/G5noA5lL/HnSyOmHOtdcZeDE1q2hzlUHMtzCL5/DcZt5VcE+AGnmoECT9PAu9C2YBq
	 Qeqhp1UYVSkjwRWjGtg8w9NyxhMYDxFhnL9Y1LPifGwgnkjs37QGGNnO2tiYxKa2+/wodq8QDipp
	 S+JkojC4NngqzDsUwclJsYh7zS4MD2R5UDizIG4DNmblSNDXb40QYrlxzbWBgTXikikUdjqgPMJ2
	 F5BtoLOH6FYx+7jEDc0pFgN4QEsRyo7j6uv9A1JtsQyf5lzk4QuoDgPXDWvm0SFRMdl3o/x8vK5O
	 Fie1jpl7h87MRn/27Dh4rvRYbrGEwYNC1JzwlI9uGhpGqERjnaUp/NbxIFjSa5eBDIQ73u0UPMe+
	 iVi8XKRKhla30f3zmTLw1ChdOIHZkxvx+JuKZjbb7HPhEsO1g/j0TR1EndxqYLmU8m1fqURR2jb3
	 Eaf6ZHl2eH+D5IhyDwhjQCSXBUS1/CTyCtTCkyC6aj+3oLy17c/eTR1vnD99uy1XvKJoEO8DWKuP
	 NSmBSSAYxW4J/4JVtrHFE1kD1bTLAm6x0LotZI3CN7XDyJQ8HEt1au/Hr+oF7hEglYQoj1hfOT9v
	 9vwNNYNtYPK+xwBWBPdR8b0QUU39ob3paKWqeNgu2d705K0nDt/akqWTzhjezGpOFYpoxQOziEl4
	 8sthCSyceMKdfjmRMgsthVcpTpQlPbJWemDhzvQbd2tH17ZxJJ4HRaDyDyiUgSaTVGb7jxk3v7rL
	 tKHiEsn823HEO4/RD0TKXN3WaRggs=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: 1579567540@qq.com
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can <linux-can@vger.kernel.org>
Cc: Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	kernel <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-rockchip <linux-rockchip@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Cunhao Lu <1579567540@qq.com>
Subject: [PATCH v2 1/4] dt-bindings: can: rockchip: add rk3588 CAN-FD compatible
Date: Thu,  2 Jul 2026 22:06:51 +0800
X-OQ-MSGID: <20260702140654.2961561-2-1579567540@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702140654.2961561-1-1579567540@qq.com>
References: <20260702140654.2961561-1-1579567540@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_070728_796135_BB04BEA6 
X-CRM114-Status: GOOD (  13.80  )
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

From: Cunhao Lu <1579567540@qq.com>

RK3588 integrates a Rockchip CAN-FD controller variant that is not
fully compatible with RK3568v2. The RX FIFO count register field is
encoded in bits 7:5 on RK3588, while RK3568v2 uses bits 6:4.

Add a dedicated rockchip,rk3588-canfd compatible to describe this
variant. Do not use rockchip,rk3568v2-canfd as a fallback, because that
would describe a register layout that does not match the hardware.

Changes in v2:
- Use enum for the single-compatible entries, as suggested by Krzysztof.
- Reword the commit message to explain the hardware difference instead
  of referring to Linux driver match data.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 .../devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
index a077c0330013..81e2b6dfeb02 100644
--- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
@@ -16,7 +16,9 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: rockchip,rk3568v2-canfd
+      - enum:
+          - rockchip,rk3568v2-canfd
+          - rockchip,rk3588-canfd
       - items:
           - const: rockchip,rk3568v3-canfd
           - const: rockchip,rk3568v2-canfd
-- 
2.34.1


