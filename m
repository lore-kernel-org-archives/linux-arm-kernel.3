Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3587FCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmWciJum1d8Cm20+rwLBib6VGIcB8DEUjk7c5Wgsxvg=; b=0m8sxaglUUxqryFy2hstNhJpws
	IS6l2NOSQSaEv0Sl1lgOmNnly4KoyMbDi0cssTgfA4eLxzjQN86zBxbFctCa65y0rC3s3Lq4A8AVs
	qtGT6sBNMmgJ2z2S7XOtPTT1o7sztWVAD8C2g6aR/BkGnVrj0rGAHuiEoXMgFPGDy5AQlal1byIg2
	vLl2HoACTVreNwcUWf+u0jO0qPwX35r+FKDUIaNCHmJsCRYui73K2MQmOSczUmoYhzqZdZgHGZ9z6
	/z9sGVWXrbwzEIM6Gs1bHusmRXIe5IsR2zgLwizDk5/I1bVvcpYqg2utbDa/y8MTJ2KNtO7LjxcW/
	zP9XGysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsk9-000000025vY-2FH1;
	Sun, 14 Sep 2025 19:50:37 +0000
Received: from mail-4323.protonmail.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsk7-000000025un-2Whp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757879433; x=1758138633;
	bh=YmWciJum1d8Cm20+rwLBib6VGIcB8DEUjk7c5Wgsxvg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qYJyRm39IK5nfZS/weMGruyH31R36VJnYAUzTq1wuEjJydtxs1b+ZHLGWuoiBNwkx
	 La93ojPel7QGy5fxEY+6Pn3mbRmRB6UZn44+AgUyNOn5b8m3ezTvJ4/FKOh7lGWuOD
	 MuQYqkrwDdAogVhwZiF6ZUeGqQbNSM/9URGCCyRfdjyn6hfdz8GrXze+LR0wiGVXB0
	 i5dJUeuj5Ju+uG/gWRqrWiEEWhO17Zjx9OBWAR15n9fnmdnMUDWzhjCYp+cy49k772
	 dUmbN7HYeg1p9R3OZ3rvNdIS7BHs73R2GlkVkAfYY+ZBSNaAv3L3S7UMu/ec2n5QDq
	 ds2DJfSVYCY4A==
Date: Sun, 14 Sep 2025 19:50:28 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos9610 compatible
Message-ID: <20250914-exynos9610-chipid-v1-1-ade99e09a23c@chimac.ro>
In-Reply-To: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
References: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: de8a89961de6cc79e2bc0de5d62b937bc3f0f78b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_125035_791999_27C7E786 
X-CRM114-Status: UNSURE (   6.76  )
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

Add a compatible for the "samsung,exynos9610-chipid" node, used by
Exynos9610 platforms.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid=
.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 383020450d780cab1f3a137dbb8286ef8ba21b31..55fd1cd59e4ea149b82d6d970e2=
ebc11064455ab 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -26,6 +26,7 @@ properties:
               - samsung,exynos2200-chipid
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
+              - samsung,exynos9610-chipid
               - samsung,exynos9810-chipid
               - samsung,exynos990-chipid
               - samsung,exynosautov9-chipid

--=20
2.47.3



