Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476AAC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 01:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esfucYmTEFSwlf5zCgWM8xgihfKR7Xsmq3vqC01KotU=; b=1KBpFXrBT8y1B26YmgS/3lY8+H
	atQHmRuOU2TOMapu5wZ052GPwTxHj3rHEB6HeGsRbkXeJjpUapjCSeVLcqJVlbWUnv76od4mKpO0U
	Yy1lrR3Ujrp8VebcWCcj5EUh1/+O8JZBXtolUfje29yf5BPxt8lDV403hzXN+BeptaoRkpdCxRUGE
	lO3bKF5XjgHjYUP7bGRjjeoQvE2pf/heJotGMZj2lq++UOk6/grBvra7KD5YK3LqFNPJe92OQdfzw
	JKMf5H2lua6dtb2mloUOWsngqCp5Ei0gE4aLtRhLwjnq6qFcGXyZPIJVXNczwDB2ZqHt0dV34kHG9
	cHqNcJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjL0-0000000G1Ca-1EHN;
	Sat, 08 Mar 2025 01:50:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjDK-0000000G09C-1lg2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 01:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E63E6A455F5;
	Sat,  8 Mar 2025 01:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F5FC4CEE3;
	Sat,  8 Mar 2025 01:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398173;
	bh=6dXzCoSGh5WzYwUYwwUtLNNchEHyZWMT9t7hB0b5vr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=otmK/skvYd4It6dwexM+PP6cMHUGYuiOG/ZvaaH6IgAcYpp0YZhLN9tBuT4VaycYJ
	 TBbaePxJGVqsAShMrXJTs95ghYOPjMXS84jFde6XZk85G92ei0JVJW7kUWrlyO9nQm
	 XLVj3fR8jaPaBYJMLxxJ54N2hulUaEeR5AjmjL25waGrjgXAvn8UqA0/NpiafNb+q0
	 4qTQP6fq7HR2T07l/1Ovcvi7pTcFgAP0/gMX70Yci7TDjiECiwZJlwgcL82T7Xwzy9
	 eVBZlkcY/s/MuZl+uM+DXb96uanAmyeaL2syKBkIDrV+gSZuqnYq+6pFhkcKupLUKs
	 W4i+aa8mQA72w==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:22 +0200
Subject: [PATCH 04/10] dt-bindings: display/msm: qcom,sc7280-dpu: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-4-1d4c30f43822@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BgsqxgB1qUMlTQRoXlZNO7IqKII3A0xVwcx4U85mJbQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6B/tzXGWNrHLgibC5D4RA6kqoIdExjjOUNDv
 Q3y+8gwEZOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfwAKCRCLPIo+Aiko
 1TNPB/wK27ofImLoecwSAl0GQlgmtsAUmandEjkKhP7SPeQWC8hGc4aiL3iEGtFtos/zRKKNy+n
 GaHAiemJXrOIPewLN2kJTVi+cM4iTsKIEHevghT4II/c72BsznQJynQe43TwydBoXNkrIC0pIWk
 DmhUNHawOYVD/uqcinBYAhInxvebRyA0iqBtaj/oLPFFpljVnctz5kSFqaIQ1Q/eTlzsGcuC+vF
 f+rZEzw5r7T+UALosZtcQH6j4AzX+RAmjEhJwzgys2uO3m9lXn3ONYZBsCN5pEhw7DtCGeJLO10
 ZowXuHHuEiHvpspk/sBbgR+yKgxT66mq5dxBmtFv4etNCU2K
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_174254_637900_E5781F50 
X-CRM114-Status: UNSURE (   7.37  )
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

Describe DPU controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 6902795b4e2c249c2b543c1c5350f739a30553f2..df9ec15ad6c3ca1f77bebaab19ffa3adb985733d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -17,6 +17,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dpu
       - qcom,sc7280-dpu
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu

-- 
2.39.5


