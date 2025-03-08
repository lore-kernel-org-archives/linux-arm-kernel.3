Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3E7C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 01:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iI1lIiNo/S1ssXNvIewoJQXQP5Uz6sIlOyZ4fcFAkMw=; b=N+wLCHS8HcBtBEmHlCbzuPAwZV
	4YKuZN+QvYavjsSz0kQnmUw6QE1O90EJQ7ptyXa7vrWwsMoglvVGt8QxH1lGbOHHaiV7149Ax9/cM
	FaO+GKp364qJEJ9jsL2huJyjZXdiOokeeraEpgWq+l1168/stXZPEt+Tz0eFBy8aTg+GKLWSrh7OE
	TAOmWLy53FaHsAjtqA59qNtQ+8Qey/7Nrbuz5hcfoS+br2uRFjBrwvTspmtVMzF7Zm8CjooZ8p8vm
	YW+JkzUjZp0BG4C7PhCoSNBo80UIz/WiGy++Vx0T6pDt/eSkkj6SY0jpiVMtDpoU8A5pWyQDTQmB7
	rOLrYvYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjHn-0000000G0ur-3ZGY;
	Sat, 08 Mar 2025 01:47:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjD9-0000000G046-09rX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 01:42:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8154AA44E90;
	Sat,  8 Mar 2025 01:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE66C4CEEB;
	Sat,  8 Mar 2025 01:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398161;
	bh=iPx+WBr8fx06alijfcgISN/safqfJBFq2eNoYJhSkxU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=El6ZpBzOyzWZCj0RW6VimlAEF7mrsiyeWpB3Rzv5IWd9EOpHiI3FipKsUq9gOZcrE
	 Hn/r8ehPE/7aMkD32LW9Zk5CyOucPviqex7xRQVadMEJq1nSiqWDvivtNSO+/q6jjt
	 eBUqRiT+jXeFFl143NERRs3piVejvXRxHgn7sSrtCkE7WkdxkNM0u9Ae+ONWjNqkeW
	 hpHQpBLf42aQYkf0HP2u3XO7FpE6ph0qvGB0SBR+NOws9+f5sPHMJj4V9SqymAJfby
	 qcInQhQQs0xFAEIeqxg68Cz/f3R3lRX3LFPVxYr73nCRuZWCGkgJ0a3F0SdqZFxsur
	 7h0WEQQSDKH2Q==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:20 +0200
Subject: [PATCH 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-2-1d4c30f43822@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rDGcZM2rvCdHm9sgR4lxUwNRWngl4FDx86wKfG6c6y4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6B/fQpJRnRqw1lfiMDhDsGG68sdQHMwYIMns
 lOOOgdvQi+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfwAKCRCLPIo+Aiko
 1SSOB/957aAJj2pRGjifVA6cDUWmwLG9wagizLPR/EPxJNgs6Ac4VDq0h6zGKp5oOB8YXuh3D9w
 gadAix7f31u0NniYOnkt6SV5szfhK49WwP69B8/Jzpa6nd5SGjpT4KU3x4P83BgvY+/MUCh3lga
 uVNRpoEgXtq0YjnjovDmvzO5Q4UNfs9Yp1E0Ki+bm1wxyu2gP20Ezt0JZvVK2nHQIDCL4fJ6JGa
 foLQ9e/GOmJS6myKW/gBy1kZgLIJboSsADqwFdu1wcpDTnvjDKuLIaDsogMvazlYqutGO4VFnEm
 F0QtKO6Y+np3gtFP4CUmRq9WpPra866+TKVo8kNquHq84ZOC
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_174243_253399_4B9B5F2C 
X-CRM114-Status: UNSURE (   7.80  )
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

Describe MIPI DSI controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..a3e05e34bf14dd5802fc538ca8b69846384f8742 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,msm8996-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,qcm2290-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
@@ -314,6 +315,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm845-dsi-ctrl

-- 
2.39.5


