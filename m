Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A38C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7CKmsvauDc0q8NWP+HLO/2UN2L/FIYQsPE5ctif+Wxg=; b=JsvvToMIZY8X6AarCJyEEXSAYh
	LiybuDI4VRdZRJ4ws68WxnCy2Vhy7E3WpBlATw/vHC3jkKpOxMT4+TjdRZGHbn5VJ3raPCHrfBPn9
	5796ExemfaIeX3LbNSoc0mVaimBoidSRmWbHKXJ/OqkEGn/Sgu3euwBMU+oe3LafTqa+BUemdusw9
	IRTkzNmDciN5rwaP0vbMruX/3+bV2yzf1KTHKwhmz2z4TYCixhNJ+z6hXCR9gheAuPjJmbjE88Eyz
	74Pe5vzNVA1ALnwseq4knRfNw2WMg+d9wSv12EELWzkcqnflGR+Y5stgd1IIl3PTDWgXCJkvP1PJ0
	qPLAgGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESVW-00000009PxH-0i8k;
	Mon, 12 May 2025 12:43:46 +0000
Received: from out203-205-221-242.mail.qq.com ([203.205.221.242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERyB-00000009LY8-41yD;
	Mon, 12 May 2025 12:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1747051756;
	bh=7CKmsvauDc0q8NWP+HLO/2UN2L/FIYQsPE5ctif+Wxg=;
	h=From:To:Cc:Subject:Date;
	b=exc1w/gKAtWJ3sSvZ4M6YZAjrmmbjTHWuV0nB8bMCfBOmwtJD8H0fd2hcrdI7EIJX
	 5NbNwwQx8TM1v3+SoouQpYTgtGzYki28esxMswjYMXfPGjfZgW9X4Eq3iaugXA1BFU
	 9sV/68RNFx0HIZwxrGPNHeTz2du7ukFijm7eox+4=
Received: from localhost.localdomain ([116.249.112.84])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 2359703F; Mon, 12 May 2025 20:08:53 +0800
X-QQ-mid: xmsmtpt1747051733tj987rezy
Message-ID: <tencent_5236EB88E1BF1243C286A768AC4B24391905@qq.com>
X-QQ-XMAILINFO: MmPNY57tR1XnXYXlfrFDWzpe97pRfIDW0PFyQw7LDr1JC8m5UvghYLPZRLn8OW
	 nJZEo4XDeN1rtphaQmE09D5/UWynH8zQczD0OaC/Tn/rnMIwMrjSaVk+03SYRXdcpaw0X5yWzoGQ
	 Oxs50Zpx4/5B7Hi/HHKeKU8J1VgjO9YL6kSk3wuAZEjNMuckHwTwCEhMSfE4XYeEMn1cgYks9O6o
	 qoB+1ORIkqEHv/pJIOc//xsqHm6nHzhtJxER0rNc7UIxqami6bkny9cYT+gkqN4eJgmRrP6L/9b5
	 9dg8wJW3/rmfuztfAC+Cel+p8lSty7PXlrgC0zMHgFfvwQ3KaudtuCNoFhVS9gmKLekyNo7uDQgC
	 K8w2i9jAvCmhbP0p9mv7plAmW6wetw49aoy+wbYMpR0Vj/o/yKuknhHMQXWzPbUQ8X5f11nzxNRt
	 wF8uZOhrA/wR3t0bu3BN0TNmkwMIWazahDS/OitozRc1nZ6r0fvbAW1eo9phW3iEaaGtOzH5FbTn
	 sm9u6bKyQL4HoSwJXkR5IB54ZofjcldGBi0L9XLN4LiQ2Hm8yB+0LuyBHPkbNxS6HLtgSiJ6CLug
	 DMgSfix6PrgjSaiHx9RiZ2nT5sxzPx4xvuCngvkOAcMdBmh2WobjKlcUX4ZkVlAgk+80eAtXazTA
	 tS38IxV5qX3+3pb1FM7QfbFDpLMG4G20SjVc1MtPROCzgROjmB23PQLif57hQh9oxVwVg+o9DeVk
	 RpEBY+lT7U9wLBYeT+1ENFJRULEFwycGu2qqCrwOmd+x12Tp+1OoBJFQ7aRN8J10nwUTdFO6SlxN
	 RmiTsKgM3OBu/uA4TfNOYUJ+l6ciXSlT/6oq/Ag//SR2mM66qdjgJdwuv+DL8VqyTvOu/LMDc1nu
	 zfGOMBEFu4LShLS7sHSVuIkTc7xJKFuTukWNehJxbOK4878QR0jBesHW/IcmFHZzqMyndknyIheZ
	 tf71rrnHCCZIAzFQ56ScjWiWd/hMPj+krdAR+y6DEv0QUR4DJJfU7qyTwHXVjI1eaXedXTJYyEvF
	 ZgguMeySC/I2bRv7DHZvYsCqOu0mc=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: chainsx@foxmail.com
To: f.blogs@napier.co.nz
Cc: chainsx@foxmail.com,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Mon, 12 May 2025 20:08:49 +0800
X-OQ-MSGID: <20250512120849.312547-1-chainsx@foxmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_050920_312461_737678E7 
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

From: Hsun Lai <chainsx@foxmail.com>

This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.

Link: https://wiki.t-firefly.com/en/Station-M3/index.html

Signed-off-by: Hsun Lai <chainsx@foxmail.com>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290..13d5dcbc7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -258,6 +258,11 @@ properties:
           - const: firefly,rk3566-roc-pc
           - const: rockchip,rk3566
 
+      - description: Firefly Station M3
+        items:
+          - const: firefly,rk3588s-roc-pc
+          - const: rockchip,rk3588s
+
       - description: Firefly Station P2
         items:
           - const: firefly,rk3568-roc-pc
-- 
2.34.1


