Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C9DCCF2E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VGVxw703OxUtr56IczmXP66ou7VnTSuoj3yV9sgxC0=; b=wL0IJrDieXzq036PItVQbIIeIP
	XoZSLu+tyFcz+4ED6/3gx964K+RmcnVlO7lf15NZ+V7cnSHkJsBUZRdVnEMEerjZlsWVOcliqTXLm
	itjH9tRBFRB2U6BH417WZHu8XjxbanrMGI2F9So4mNXxjxNpL8ORizDmR2RKfex5kLPFDQMUexgaM
	gOVmm7VP4mB3lFhXB65tnTrWPcklHJr35g0qMDSx9MIsX+6kYcMQhjXSj0yKpIV9vJ6eDvdzo+sx/
	o0kj6QFgPElXCZn5+GkPPFF6tiYnrFHwjt/G+hID8HngKaNSIJ8B5EKjyVwRetGJwXHJ6p8KSLoTP
	a4tsXl6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoYT-00000007lGz-033q;
	Mon, 19 Oct 2026 14:41:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoYR-00000007lFn-0K40
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:41:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39C876021C;
	Mon, 19 Oct 2026 14:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8AA6C2BCFC;
	Mon, 19 Oct 2026 14:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792420893;
	bh=qvOt3HHxIE5wGuN+4BoB73etZ0LxLru+TeLnprWKzoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WMH6LPND7hWkslGEk9fPiBeXtEzk4LJTsyCzcXXHm9vJw1UGHFJpLTB7uBoBtuDnC
	 HDF6eAatvtPuKH6Mwy/jzJP0Pv/VGjJZGcdtUAdHp+OmzHtHq5l+hUy9B5OEHWd2mz
	 nwtbUC23wqhShacE3WmuFUKLxSUvvVjqj2Wuj4SLYROZrTFTNjad3fRx6UE8fcxh7y
	 14KS2lkKZd4nbq+ns30LA/xDZYGAbpyxjTOtMg0818XhBKmPgPOpFXw2MY5HSm1Jb7
	 Ng4m6aZGgxP+V/dcv6ono0S6bSJqJhsofJB0QqTqYndU/AalbLqlr0vakGwnHPu0PM
	 7u3vv0Zua6RcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94A7CCF2E7;
	Mon, 19 Oct 2026 14:41:33 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Mon, 19 Oct 2026 15:41:30 +0100
Subject: [PATCH 1/3] dt-bindings: pinctrl: samsung: Add compatible for
 Exynos5515
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-for-next-lucky7-pinctrl-v1-1-0f77e94c70bc@member.fsf.org>
References: <20261019-for-next-lucky7-pinctrl-v1-0-0f77e94c70bc@member.fsf.org>
In-Reply-To: <20261019-for-next-lucky7-pinctrl-v1-0-0f77e94c70bc@member.fsf.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=844;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=wcMJv5MC9TAqtq4PfS0HwwKmDAbPXKFvyCt4uDAd3gs=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1iwalT3DrmyIqPYLP3Z7S5COD3XtGVEIvxELp
 cCUWs70fYSJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatYsGhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+u50hAAlqJrRNdYR/IhdgDR2Z4JKrlPojiSFZF
 r4kSl4JfDqKJeVBbydVc+TRfP3AiSN/jpBtieHLGjPMSuCE+2/r0zSa5LSetSGq72tBEo8fE0DR
 /4xc+peLKdp/oJjZxpbDS3Yoi0VUITPhjzy6zW6aGjfV4CtYYpCoN/TR6k2VK9fYAxkVKx4hqmV
 2Mrr4xla3sowMZ2zMsZasqg1leusJ8kLDcTuMKiSWiU8fRW7gGRiqYqNOrK5zsHZtRvK7j10IEE
 5P7c4sUjaTnV87ecrHA/JQLw/OAcvVdUKgjPGlXMzQbyU2PmV2m/dCu8LkupnMyuCOk8ObY3Far
 prfwgZytOvlxXX2SnfquLe2ydvj8N65Q0PJpWPNU27ns8KGTmfzEkv2gLt/VWkXamO/EtDJITal
 U8Pil1ONY0bdbgSlmPr0LcLWFZ6uUyihnS/dFAyzdnXUFNLnSt5QZNJdkzKP4FgZE0MmwBVkE3d
 bG1czf3R99cmTjopp/VScbDKxv/N41mUtZdJIV/YhqEvql3/CxRTO3Lrl5fDoshV41e99wHKpvW
 m2hF3agqVs3Zl0STBww2u5WbTlrx0t1BT5hpCt44YrQJei32adFTbsQCoyuEKm9uqGiMif5ye98
 H7qqtq1Ts774mlTeE7w7N0qOQ6PiSeryjdrDUPCQgQaQTzhTamFo=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Aiden Isik <aidenisik@member.fsf.org>

Document the Exynos5515 pinctrl compatible string.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 1feb6a6fc690..7e49ca7b560a 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -49,6 +49,7 @@ properties:
       - samsung,exynos5410-pinctrl
       - samsung,exynos5420-pinctrl
       - samsung,exynos5433-pinctrl
+      - samsung,exynos5515-pinctrl
       - samsung,exynos7-pinctrl
       - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl

-- 
2.54.0



