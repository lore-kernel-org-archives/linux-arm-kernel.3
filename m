Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045ADC28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 01:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pHIvtUTS5Y91JapcANrwI5yotuNOR8MJbgr9WSuED4=; b=qgmEMYblfyF8oVXiNPu02HSKl5
	zQJANDT6C/BWgSeE48bL4KsgAYNs7K/HiHgJFro94j9l36BT0lqtEzLxkw7t+Uqd+BTt8fu+OynsK
	8IcQEuFm/+IRZlAbUu2tp33LfHDFCIgNBMRM3BBV+hziZBkEGLZWHZOgJ5qjXvfqBO/W1/9ntt5Ys
	jBSSEOidhJN5Pj3opo7oUJU29/NnJDUf3ysUMCoV2N4Z5GjpWZiwf4bpsSTmc8dQHCrr4zvH7cdm/
	v8FWlFYXPKlOxZf0vV7jGzjfmk2fbhtAk5nRMavEmvs5v459sFUxtKxyslz7bVe6s4iIxKRAYYOrw
	N02si4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjJP-0000000G15c-23uZ;
	Sat, 08 Mar 2025 01:49:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjDE-0000000G06f-0oGV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 01:42:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE40A5C661E;
	Sat,  8 Mar 2025 01:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C5AC4CEE8;
	Sat,  8 Mar 2025 01:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398167;
	bh=8XBXBagKLZU02BZTCbyYSWDs7g51/WZF2wIxyboks8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NrzYtW2YaPgG88BSMLcj2ypezAXBFLlKiUIm3j9n4nZNT2JSwUB0pFcJZALq3YRYk
	 FRYQIKB541q/XIuzayOlld5S/flpquYYAkBG4v0ZbT3XzmhfLQf/5kdXpfuiCOD0fH
	 CURmXFjU+GqKlikhsGVlD6nbKzu5XnAO6YOhSkpKJfWILVmosp1nMeKrA23snOCrdq
	 FjBAwtevWtQEzFXOshp2EX2EOukhOxpDIkHEWfxxWWYx6KJEsnini/mFJYKD18f5it
	 SstIOMvnwV58CY47TGUnIN8sW7Ig0SPIVQp2EbqstAxTiV0oU2p3eYeXLrkdTKKZRs
	 K/82V06EwmiYg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:21 +0200
Subject: [PATCH 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-3-1d4c30f43822@linaro.org>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
In-Reply-To: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ewz4mf+BJciAJgxQYRY8QHAfbvsLqEfizb9EYwvy3iU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6B/8QvGT0I58bWL8/CWKhSUTHk77FvMas4u8
 Pymrw7zPEiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfwAKCRCLPIo+Aiko
 1b70B/41hJerK6Kc5l4OX8X+HjPetK3Vc9wlLVOOKKZ7VXzUWGn5JFUVW21/Cy+UkWwOmHoxrVm
 lvSzUWPl6BR4gxpcRUUUwIlvolsVbvtV5KknxRh7f6OTvNGst3POwq8idX2XCi6ZuYJx+GWWOTJ
 WdrUxGOUrSWJp8bEt4yVprFbcoAWiQWOWQml0WX7jt5z+w8j/31zlPDFUkhJNegEVvmPhi8+oHb
 +pCdC/JnvpyRDBbktIqHHQYh47ofyk0Jv8PtnA5lQKWTWovTjKtl9Bqu3wz4Heidxpzt5EtNmae
 3m5xjnoB9W58mv0kDjuf8N+sTLpYWWEOozhH+dkOjWHdZG64
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_174248_317073_8BB467E0 
X-CRM114-Status: UNSURE (   7.45  )
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..f79be422b8892484216b407f7385789764c2de1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm

-- 
2.39.5


