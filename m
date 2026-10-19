Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B543CCF2E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+bP/OkQMM+P7mmo4+YcOuYgmu150zcrcZNTQBcMfBY=; b=OPc/Re5ebtARLgWORIsb3UYRFM
	3fRF2HkFmIDp94byzk2ZMU/PobjkiEoZDEhbO8RxGwPxnhYYQb+8FyZOMGMl6opRL5CAp6dBB94wo
	Yijk4qBUT3grg7E5h58NY5WHihmi8BoV7CNdTNmGgPqaadxpYFQ19VFp3LZFNkpwmVbBTEE6bt5HJ
	6rRS6WOj4/xAr2+mVul41IrSeeFMBJvPUnmSfl+7Nw4ciyvdU+dc8YdfZ6lKouwQNhtwhgQWv7Je5
	hDoucus65mAKxtQKyvSN7IjI249Urn1JC5wWxFXf/9EVN+NgwS+Ej02ugLKA1cT3cYfQlqcx7hUW0
	Is0U1Vkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoYS-00000007lGl-31cY;
	Mon, 19 Oct 2026 14:41:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoYR-00000007lFp-0AZa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:41:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A0B16025F;
	Mon, 19 Oct 2026 14:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2F24C2BCF7;
	Mon, 19 Oct 2026 14:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792420894;
	bh=D8zB/kA+w2k1XCoyZlUlZ9QcLmAIr0JRLjRxo3NOqfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l5XvKq5QUX1pxWdINb0dR4gs6zOowd29x8d+RulSClRBhDv8hH8B/GNY/kkMTGYs1
	 IPkVLU4q4CMvPO9EEPH92z1G1cSeGjtggBHO9zn+dy8+51z8meM6TRHIP4s9XiZr1T
	 BqRbmg5zj05InDnU2E2aJs/2Q/Z8tfEkuLpFpOUHJQ2f8aFPXAgD+hN0RPLR9vcyG9
	 3PbmXUQepAi0S6PLdR+XswghkYqk6I5E8pVGBze+tcmiWxSYYGllvNQp+WQem9HfcX
	 0sQTAO0L4J6sxGaDCo74jcTZwjGP7BGhyvcKTj8/D4e8xoUWy6xPjx294BEMvlX38O
	 8pW4nCZhUWgFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9E3CCF2E6;
	Mon, 19 Oct 2026 14:41:33 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Mon, 19 Oct 2026 15:41:31 +0100
Subject: [PATCH 2/3] dt-bindings: pinctrl: samsung: add
 exynos5515-wakeup-eint compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-for-next-lucky7-pinctrl-v1-2-0f77e94c70bc@member.fsf.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=q5YBELZSChcm5N+9fv9roR9m2IQnUyRk2ttRDDQKDEc=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1iwajzFWg0aVeVqU+vV1FOodxeEllVHtW/OFH
 4mNd2Jlj++JAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatYsGhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+uaEBAAskBR84nnZ+fZUkuAU68wmG506UQBr2n
 3L2REb/7wvEQwpeyxuVH0eTvrWlytBIRzRVLQdTnRqIP0GpD5epet53OLL1NOLM/c5fvS5Hkclx
 /2FjEVtmtVAPZaLWpwEQUmnMob2SVxMKr01Pu8xo2onFrHKT6TrkwH5cd8rQpBbGX+1XTddx20o
 7UxfziSl6+rebTl3o6sq/rWBYHH2WVZ3M2M41MS5S2tuRTq15AQpAPMGzcbR4gfBYh314jmQX7f
 9L+LAxhCTJKISzUQGHJBsHBmQ0caaaqXClGffewEmxSM74EFZB3ogtLOpR5Gvk6yeaODnF0wfZx
 3kFJYZhWpmNHxSSVwZ3X0Fb20v6RQ99k5SCLtsQvrQVRafgIG3ApT4bCgxTR2WAqQxBhYXoaNi6
 bbZ2sBH8kbMHGk/1GkJw4Hi54jwU/DSaW+eDTPMqZoy+y2rvai2S+oxf4P8suKQeg3npJ34fKg/
 O3hsqEr6G8oyoop7bpRMt+P8/1cORxpjfORzqCXBZ+PuQ42sz3b/UDB1jmmP3+W4f9yEgBN05+K
 JZ/lR/Qsjhxxoe0LhVT1r6o8HZoW63uMYgh+WcMc98PWfZmtdLcy7nVuVYgkhh+F07TJ+HLH9oN
 ZBqCDnyvCvkle9iaxgOjDhkr6KQxpyeETjzSpQE5G+hfHxnQmxkE=
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

Add the pinctrl wakeup compatible for the Exynos5515 SoC. It is
register-compatible with Exynos850, so document it as such.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 802911e23aff..d5200b04a1dd 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -49,6 +49,7 @@ properties:
           - enum:
               - google,gs101-wakeup-eint
               - samsung,exynos2200-wakeup-eint
+              - samsung,exynos5515-wakeup-eint
               - samsung,exynos9610-wakeup-eint
               - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint

-- 
2.54.0



