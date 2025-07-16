Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3521C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 10:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaSLRSR7PsWy5QBK19SsO/3GNokqaUxQOGR3J6Jzpog=; b=gOH7cRoabQOVcbEe1LNGuNVaZx
	ETqAU6rS3pJH14Uc0ha6b4xEeQiKCqpv1j/qfy5z4638ePH1i733eJ6iIs6a1Il9uHlOtnGWmU5HQ
	7j8BjnDL7l6XlOsTQHbTwgYp9OLKspjPKuHW3CtKO0+9xoQK+dYgnLpCtt1jP247Q4PN9pwIUjrl3
	Dsn5iRFLBSsiMByDZkDxglBB3zyuOKGIXZMakoYHOnV4om/yleA8y1KvdZMOiIWk2lUiuijNwIN7f
	2p9aCK97FtOVrv4RFHUQbAiIv3qOX9XQnBeQ/Y6G1qleimGK0emZcRDERCCUwE1Xl9tEc44BHyLxJ
	Pk3RFF3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzb9-00000007SOJ-0XrW;
	Wed, 16 Jul 2025 10:42:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzBi-00000007ODl-056G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 10:16:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A741614A3;
	Wed, 16 Jul 2025 10:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3065AC4CEF8;
	Wed, 16 Jul 2025 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752660993;
	bh=cQs4higQlQowoSKCM7Isl3s4PaeYFVRruljsBLP1HDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KHgFBKztX2Q4ZjIwOtpy/vTndl7SrxkMgfbHiKe0FlDuUYB+zcQXPEdsRt1LsdjMM
	 WaeNrqRrAKWzL4cboljUqBXK90MNNcfe03TmnPiUtoLMP7m08z7x/JEjuLqAUQwPFU
	 8HK5b+mFmJO7KwpmtrS6oJMLJPkeYrMsElETVJHfohYFeKn5V/CijN9v5CPFjdxCqU
	 pvpIZhshU852fuVf/UKQK6xuWh3vtdfUGd29QRw1r0YfQOOqjqdmabCb3/mYbylnwE
	 clfaE12wWGCHY1PyrV0/bKYFaDpijGH0WUwCzmaqfRjdQp1tKGLGx4LhJTQ7rqh0Pb
	 rT/XnJtm+vn+A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 16 Jul 2025 12:16:08 +0200
Subject: [PATCH v2 2/4] dt-bindings: arm: qcom: Remove sdm845-cheza
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-topic-goodnight_cheza-v2-2-6fa8d3261813@oss.qualcomm.com>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752660979; l=1029;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=nq0+bsZbM420uHM2NT9JW+kPINx3ak+QhA1FtvXfz1Q=;
 b=jU+IMw+wqXeEhyXyH/QhYhB6yg96qgYt37MGudhjssp+9f4QLTBnrYkrErYfjCCLYF6pJI00A
 5idYQfQ4d3HCBcgUT5bVncSCFWTKE+aozVLKkpGm9xfmfSw2e8G4xjT
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Cheza was a prototype board, used mainly by the ChromeOS folks.

Almost no working devices are known to exist, and the small amount of
remaining ones are not in use anymore.

Remove the compatible strings reserved for it, as, quite frankly, Cheza
is no more.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b35565808ed27cd8354b9a342545c4a98ed6..387725fb5420e37a802fa16b5ac5b9c60bfc5b22 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -976,9 +976,6 @@ properties:
 
       - items:
           - enum:
-              - google,cheza
-              - google,cheza-rev1
-              - google,cheza-rev2
               - lenovo,yoga-c630
               - lg,judyln
               - lg,judyp

-- 
2.50.1


