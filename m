Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D018C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 01:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/pbztPjdQHKv/p+SRlEXm0xnFrX/hGa5O2GeSxePGU=; b=3ULUtORLLUZOhcMNTvhtu/P2yk
	ucCGTUH8EpoZxY3lTQbOiJc3x0VIKhuuV+LAfShnD5s2zGFNHd51h6JWcFB21e91Qa8fnnJvfxuQV
	xwTJmKejuBH04YBYvCTjKCGOVWwujFeiDjOsHMS9z+b70KlW7ccLmCMf8+uim+rvKz7Z5EuXYlN95
	TXIclJ8lT9hC8k4QUHOGEZxHXpdD15GmF92cHOoxwmfb9zA9+I6cAobDU1U0/jyxAMQ++rwGOsXbP
	ZEkUxTHQqWtQ4zL0b74fIJIo/lBRJJCpzbsAgyAKZ83D4fZ1621kRyBET4qBt62g8vRuUPzHYVrF0
	S1HGRQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjGD-0000000G0me-0So7;
	Sat, 08 Mar 2025 01:45:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjD6-0000000G03D-03Re
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 01:42:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A7905C661F;
	Sat,  8 Mar 2025 01:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75FFC4CEED;
	Sat,  8 Mar 2025 01:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398155;
	bh=5hWJtl0bbFBeYtO0tEd4eEDLjlvjsXOMVv/w4vcQqSs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pmsl+QWuYcfHXCLMH9ZyF/fZKnctpG011XtInd86CbOmleTeoGexB/I/uNZfBfVOi
	 uCedBF3+K36az7pZ2k8kxkqd6rZ+zT5iLvyvhH7Y6MObbhJasz6t+NAwXh/OkbM6rq
	 0+3l8E7zMZwx2H3MkW+xWPTU3Zb52TJVQSjm0Th7WIW6pkabRCHqIzfPNnbS8gAGsx
	 sj2e5r5tJGI1AIkeithbErEE8ugz+qZ9Cn1ea5S+yg+Mm51jSn3oojPVK0O7sMW+cj
	 3xiTRRSXxkxg4b2kxtv+bvNuGNGbB/ha9cF6Wd/3iRZ1OSX+vL4poJ5RKvMFXVOb5A
	 k6lyjszMaG16Q==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:19 +0200
Subject: [PATCH 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-1-1d4c30f43822@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=883;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ACdmjYmshapneuIqWrn19zGGrSmaveZcBX5lcfEgHW8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6B+bI8+Wn/W3nwtSqCnoIReC3di5Id0PJg4f
 sU5YOYJqvqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfgAKCRCLPIo+Aiko
 1TXwCAChR5vuCAEudmiTE+lhAXH7j22cWADUqnSu1Z0cDDyBH67GZhFTX/Zh61+onFk0hMYw4M3
 +tJYPJ1giq8/Y8E/8EGS+3UTQ8op8Qx6SH8PRHz69gn2GvKuGoHUBfu80Lczpf+Hp5nWJaKNo89
 8sO27klWACmew8HJtlT4HUvHXloT4nEYRDVnMUI59tJIAeupKYxcrG80d7cOT/s6Nc96gslew4R
 5jsSwR/HCSp2ZRHKFwZvBZYAa3h7e7yaizcuJZISWm99YaaPlmNqGEvIc1jB42ryovl3pc9Y98B
 wZ7O8AdcP5So2QW236a+ZwiV2oTeGmS0UZxMg3quRJjqYKlX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_174240_171212_42AAF598 
X-CRM114-Status: UNSURE (   7.54  )
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

Describe DisplayPort controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..246bbb509bea18bed32e3a442d0926a24498c960 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
+              - qcom,sar2130p-dp
               - qcom,sm6350-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp

-- 
2.39.5


