Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941F0C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMiaqD94kI7dtRkqpkD3e9YCQHxoqKFCvlexTfR2F8g=; b=K8Juvus53a7kT4d8/5+Yn85hKU
	9rUsm2zFjF3gP5QlVhNyd2YhTjczArTgu7jZxvJZzar/6liz7/njW4VkAMfwHplN8iJexcSrz9gur
	+Rg5G5F++2ui0WJoyvrD1ZIntnPYAcfi7tRxrT3jnqd0J2OYwYq6SXZXYoAsA5GsMgwMWiHpYhTi+
	iwsWYc6uRboXhK3NnoRfoUWn3VHLekJOjbVfxS9sOBirDZrr38RNbxIitV8dkEcsZhW+wvitOw5/u
	hMww7PG7NWNc3QH8psIsRa8A0AZxJE4d+nktPe2cmUsQ1fJ9rmsXDPth+Z4zMimbDwags/O33W6zI
	VKHVnHSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEswa-0000000D0eK-2gLv;
	Tue, 13 May 2025 16:57:28 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsbw-0000000Cx1g-4AKn;
	Tue, 13 May 2025 16:36:11 +0000
X-QQ-mid: esmtpgz12t1747154125tace0e82e
X-QQ-Originating-IP: irLgkyjuJOT7lIbfJFFjJhR4H1BuzcVGXYnvBLH7KwM=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 May 2025 00:35:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17771367300780483269
EX-QQ-RecipientCnt: 11
From: Hsun Lai <i@chainsx.cn>
To: Fred Bloggs <f.blogs@napier.co.nz>
Cc: Hsun Lai <i@chainsx.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 2/3] dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
Date: Wed, 14 May 2025 00:35:13 +0800
Message-Id: <20250513163515.177472-3-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513163515.177472-1-i@chainsx.cn>
References: <20250513163515.177472-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NvH2zBBgt3uTqoyUDzUCf8W9dMvYPcJ4TcQUUoUpHrpMnvn0iJjd++0K
	gsVnHN2mWDrMvWlLYDWjXk5xV9d+ifahyeosUBETbQC8GG/55VtIjYn31WXIGcwTDHgRvyR
	YR+nA2brDudTSy0cLq2Z7yfex/6IG+Ej7vQ5h4l2mOnaSaDbprtRFkb5a/MCGD0ZhkQdR45
	pkU6l17OYmXZX7LGere2JwvY4f4HQEu9ypuzGIjbHJ9PdkAd2W/sra9UIR8YNMo3Pt9eyhB
	Q6Izw4zrzQ65ETYh3Ylysu8fjXkRMgDKKPd+RA1IwSMa2mBJu2DXFlNw4WMBLgLE1hYRD2g
	Ljb8diE7Wfnnb/n4YWoTsr/JB1WdWUwqTBKmW2xbXvTFUxx867+TGl7QhHkfCDFyzIl+58v
	gud4sSOJN3A/xsnsotL1B8MELiuIrJpOjnMTjCSv8X+UKHHtC3VINJzdT15VId5GN3MLMUr
	vpjuUrbVkC8ohV9TYc6p8rSmH+JcqKvGouLhjtRB/AxiMmgrPzfJs4mazs3p7S9nWuXXnhQ
	jO0ZjvxR8o5aKkeCQXvtY1kYVa9OXLWjDzOI7hNxsNzMMCwqMFof056nL1hIUVw1habRXX9
	wtBcgEXcmDBAkWKmhpImVMzMCl1HEoCmpg0bzo7RoxSOkuP6Ii8CawSi963zIIn4LkePs/n
	TANp0SC6QX76v+Ai7KccIAt+0SThX4eiBa5UwLuV8IFptRd11S4GfsVi1suCPATTLVzRLwn
	S2qGwvxuXdhtXfgypU5rXfuIoXEZP8K6M6mOu5iCTWYbrva03Bc7jg7ca2kFuJxQBB9W4yM
	kFTbsl9klBqeiCH20eicTb1vmr+gESpOcjqusovqjg2dp8xvXJNZFR5Q7+Hmr2A/UYDWh4T
	Yutgh/ESPRCHoR6tQcomDfpnt2KVrX+6hd4nZJLuXO5Ij7jEDmHRT16O0qeGzv8+AtU6QFU
	h9qORHqXNPMQiiaIaNSXVY+9cGLo8VE+hux3d5sKwgV35noT/qZUxBxvp+/VXWw99UyGDZ5
	RH214eiA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_093609_429663_756CD585 
X-CRM114-Status: UNSURE (   7.98  )
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

This patch adds device tree binding support for
Sakura Pi RK3308B, with compatibility for the
Rockchip RK3308 SoC.

Link: https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

Signed-off-by: Hsun Lai <i@chainsx.cn>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 115c3ca43..c64adc0d0 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1109,6 +1109,11 @@ properties:
           - const: rockchip,rk3588-toybrick-x0
           - const: rockchip,rk3588
 
+      - description: Sakura Pi RK3308B
+        items:
+          - const: sakurapi,rk3308-sakurapi-rk3308b
+          - const: rockchip,rk3308
+
       - description: Sinovoip RK3308 Banana Pi P2 Pro
         items:
           - const: sinovoip,rk3308-bpi-p2pro
-- 
2.34.1


