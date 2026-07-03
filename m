Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59223C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vz7yzuowqwsGsfyfQvMihkNn4ZFIprdXXMLcR6PYob8=; b=g0OVFvMWyJlgsjf6S1Vl2ukPku
	4nCI+ZiKBd1M5yLM0CFMA6xZb8swAKiY2YIYwZfCfJaddgBYSRFzumnvHq3XSV8p1ck8vCfzskDeF
	BmGP/0QDdMZtZRvG3nIUON/PWB5kyK4FY/AgbtP0kcWD8Tf+9xIZO0CTiSurubOlw4dqrfcz6JOTQ
	d3Pw94i/XaOhsl65pbYiyRTzFQErMc7xXBNo8nQd9tQFKfC1O5TeHgSWt9NPH5WgSKeAbsV3ehfTE
	oG77XNGY/Y5u5WBNOgkLR+hqqQNKecL+eT1/liIJDMSrw67AMO95nk7LXsrhDNK1tfsZwhB3YLWJ2
	C+odL3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYqO-00000006K1P-0227;
	Fri, 03 Jul 2026 08:01:52 +0000
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYqJ-00000006Jw3-3KSB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783065702; bh=Vz7yzuowqwsGsfyfQvMihkNn4ZFIprdXXMLcR6PYob8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ezFfDmOfiJ4ou7W/U2hJb+ouJrYJEzl81BgrYZEFvrlZucZ+8tdZPeHP2URykxA71
	 sftmATKtWYuEZ2D5Y7JvrAHeEE+OgasDPuT5JoJg6x5Aspq/WhkOiHwL31tqueXRid
	 x2y8Z0yhj19WD/KyJh7ZrIByI5C/CYEDmubnQN2I=
Received: from ubuntu2204.localdomain ([218.4.149.66])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 6622C6D; Fri, 03 Jul 2026 16:01:38 +0800
X-QQ-mid: xmsmtpt1783065700tirs5w4cp
Message-ID: <tencent_EF20BAF99D37B9D3B0C9FC254C8FAC04680A@qq.com>
X-QQ-XMAILINFO: MZm6DsGys3GE89fBSYkiG8al5cm8bYe//WOFdA61HGbH735gchRTefnf6nayMC
	 Mh3xrcox3ACW8m/rWFmIBnvBMGrYQ7UePS/AHnbzg3wfCqQshQgr8CC0gwmEBzLCdnuAPSLZVNtS
	 R/FkC8G+8LEBOjqsMwcCj2db0EdX1MbIQNGjZck5qT9wSWJahd5tKP+cmma5AqkUV15blviwsSbL
	 rz+9ukG+EVNvr9npjeJ56rAiufXtxDuTjzvr/8JAPt5OfAQnhTalo57P1QfKQ94sgOWG2i652Icx
	 vS5jCCjJex7SoCB1170J8Bw48erJISRcc2DkZvKxo2MJUCWrvPTIUtwx/IXmInqXZwdCnufU0vuh
	 CkY5M+J9uSp/3IwpBP5VmlQzvTcSEzSDSf0YBkv3FF5V8f1xhUHD3FwwX+gO6gQJbV8zGJ48xfPg
	 kHp99FqgaBpKSAj4f6DarQ/4ur2ebPt0gl0YxfVHgVOr46VSqyf7ZHCu/Hp8umFVsZ39t97lx0jR
	 4QvstLpzTlP8mbzGSgRmK+upQJ24E+AySgzueqpKtmmamF74dyRl28impuztFRj3A6YqewAXObxD
	 4XDJdjhjcUJ36nQW0ZjAyH7+JBm2lp6J4ZkInQjXEHHdxis2+GJoLZZr7KiVZdXlnaGvScYWvTsV
	 1sYMS2SSLz7Htfmb6A/hKxmitM9aX8LsJK8fZt1DGkE72zc7lsS393whDLMXll0/TaREaQNiO2Qf
	 /oauuOfmFYaK3Wv1kYlQXUGwuj/CRHL65Qhq2sEGv+k22/YqhcT9IY4pOCWMM9+o9x8NlQMmaRA4
	 4rAWutInWQh4X4/QKDTrdePoEplVcWdzt7Dy4OXC1O++OX0Yx71ut7g24jwVb8uX+mvQNuE77w/B
	 15X+mwqJrt92kWBoxDzVFqZQwxAth4FNk4JIZt2jTNcj24MX35gysPKTNdDCwqkSG2bOsrGQcS9s
	 ge/GbDRjTB72leZvnl0hb7PrH0xHiDYi6q0zjKG+XgU9b1xd6K9tv56CAK6FvmQX64vubgMUVghg
	 dIVUZYKz/ZlZcFWeAs6eUq1nb6urT8/vKr8h7cW6/aRRdhAgAv7LFjuQBsM1rRlUnmM5YA7mi8Z/
	 Grr5tWCAA3J44cKVJ0YsGr591GkdJWPwAaUQIPUi7hpLyGawiiei9MxkhryLw5YUI3yO08WZ6OjN
	 ksWRE=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Cunhao Lu <1579567540@qq.com>
Date: Fri, 03 Jul 2026 16:01:26 +0800
Subject: [PATCH v4 1/4] dt-bindings: can: rockchip: add rk3588 CAN-FD
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260703-master-v4-1-47d40bbf5fda@qq.com>
References: <20260703-master-v4-0-47d40bbf5fda@qq.com>
In-Reply-To: <20260703-master-v4-0-47d40bbf5fda@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Cunhao Lu <1579567540@qq.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_010148_538172_11CEDA95 
X-CRM114-Status: GOOD (  12.58  )
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

RK3588 integrates a Rockchip CAN-FD controller variant that is not
fully compatible with RK3568v2. The RX FIFO count register field is
encoded in bits 7:5 on RK3588, while RK3568v2 uses bits 6:4.

Add a dedicated rockchip,rk3588-canfd compatible to describe this
variant. Do not use rockchip,rk3568v2-canfd as a fallback, because that
would describe a register layout that does not match the hardware.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v3 -> v4:
- Collect Krzysztof's Acked-by tag.
v2 -> v3:
- Move the Changelog below ---
- Collect Heiko's Reviewed-by tag
v1 -> v2:
- Use enum for the single-compatible entries, as suggested by Krzysztof.
- Reword the commit message to explain the hardware difference instead
  of referring to Linux driver match data.
---
 .../devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml          | 4 +++-
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


