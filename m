Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F590C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PY6/IoVgQ16Cw22E5PprBamYSvDbhdS7hIzFZTBQSKI=; b=ITnQ49If2O6MI8fIJ3R+m/M4P+
	KptE1xEC0Uz+YnpICoZMeWJyuund5GoamkGzQDq6USiMxZCYTsPGBTHDa4Q3ZZcaiB8+7m5iHYcIh
	p40LTmRo+D9aHfRekICQQ8ZvskPaBn3Y5mSplq+YjTYzhg3PkDdKkZFwu9PL+KlUOfow6y8sspSmT
	LIwLHiIy//FErkmKYSEorL70wQ8kTAKnr2ewCmv8MjS7FcjQeHnqwTQwt810vANfhjvQpwHJOBcbA
	EeqavOgYTmQufXgv9BE+8IDfJm+ANSgOWauFCwzjP/rYhFmy3LZmpO+3NjvyRMZxpfdklMEbn044Q
	Si++bmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuJv-00000005sej-0giF;
	Mon, 17 Aug 2026 10:11:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuJt-00000005seO-3Zan
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:11:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4846143F64;
	Mon, 17 Aug 2026 10:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2439DC4AF0B;
	Mon, 17 Aug 2026 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786961513;
	bh=4BT3wReVud7paq/C8AM2mroK6B+4UOxeIb3XhjRWBcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qo3M9ShsjTqWnHo0rmC2ac0d7qMrZwQyCqolAMmhBFUBHJuBZTMayzr+YwiXRuAqQ
	 uyAk+8hHWmwsCXXyB8OSV0ZvL32ZFs8SIyDHkgBvr4gz+LkIjFBZileKKmocSgpLLz
	 RNQGAfacn4Vcc3Eb2hWBMZD/2JSqwokpOCSK8zKMsvFDxUDPdfhWezYCPm1wig4V/N
	 fBtqeea6Eb54e59E8GktOMep9ztNVWerMEh2Gngj+YET3Qc44HWiH0Nq22dwDTnAIJ
	 XKc6byiJe+F1zRaY0KGd99rAnFZZwaRBPxAB6iyQ6qlOmU5gBxohh5a523TI3wkIc2
	 4ftbiDStqvDpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7AFC5DF66;
	Mon, 17 Aug 2026 10:11:52 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Mon, 17 Aug 2026 11:11:45 +0100
Subject: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 exynos5515 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-for-next-lucky7-chipid-v1-1-eb2908705c0d@member.fsf.org>
References: <20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org>
In-Reply-To: <20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=hUaCkbXQ1RBFtTTvTYjy4eDCVoUbzRmKtjuVRA9mUXM=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqgt5jkx/YJfij00M3AsajFuiiQufxxlNIUhO5B
 2rogze8zYOJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoLeYwAKCRBJJwGyxHrX
 6yxQD/9adPT9ewJaf9AkH/g44DwUGM2J5G3jZvfUYpOKlwE5WLJkZM6/TEGquCQWv2+E8oUva35
 sXNRq/rIWbH83P1kdbqyXjwjJO86Aum8y7X8nAvKzUsTNxYWVRfgXdXKLV+e7oOOYHVYhmshnIV
 MIXYYs5l8upc/b0sGSNai4/A6Rn0NNwz0dI6j3ryUVuIDUi3JpZAihohBgP2xDzhhFcBGiGZDen
 wNjXEObLkUZQKigmtrWeLKimlM86U07wvU2sKMbuOQEi7ganK9xLBDDqy5v5gQHNVa98HpVqF+h
 6q8UOX8kcpbI8LHJucFM4DjMr86G/9CuzcBqagPvNbSDvl/yavcVr4v0mbjZRkW9yNiS7oeBTi5
 hhhgHqPnWyLl0fKI+9Jw7eDbm+9LdvFwI2i91V6nOo8Vy/KCrheoh0PMjiqZ12FqKaVSQnXbkgy
 5BfdbH6fvCXxvcTnPz5P6Zi6VfgN8hLTGCrE5E8W+Iy7FzFwfy135cPrJn9ki/JqF9MbXpDNh6X
 kRJ5qHhKXlw4GldST5EsEjkdwF6sGa0vcA/tv+BxA1zkiJZ4yH0LFpwLBh49xcPD2y8T32Xfy6L
 fIAOt+XgRPzIfLJ/1Z6iuMEYV/rm/ZiLi17HdVH9YcHhOTtbXQEkgIyOEXAVmDAi9enueEcnZEH
 H9US7yyj+77mlPg==
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

Add "samsung,exynos5515-chipid" compatible string to binding document.
Use the "samsung,exynos850-chipid" compatible, as it is the same on that
SoC as exynos5515.

Signed-off-by: Aiden Isik <aidenisik+git@member.fsf.org>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index b9cdfe52b62f..619faf33214b 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos2200-chipid
+              - samsung,exynos5515-chipid
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
               - samsung,exynos9610-chipid

-- 
2.54.0



