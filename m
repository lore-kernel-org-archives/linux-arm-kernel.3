Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F1EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD2LJFJGXEdRpmSox4q/uV0HO8PU2xpziePM7lpo020=; b=CMCBisqvoviRH74b4Hp+FJJXv0
	ukCmnDmlrM7EwaAg8X72fZabD/RGqzoinaTLJdbx0EGt9+vZy5M5HHhFkCkiGaanAFAZKo/t4b6Jb
	VtJIpQOMkenD+jLWgt6KUPbKD+dKA03J3d3ZYohiJmdfHFm4hn3ygqQ1v7E/1aLHtcsASOxcZYMMp
	4ehKUVnK8WLho2ysQMAlblIaes+pK1wk2JRF1Fit+ve03kkYeS8wBbeXJ1PN0rbgXoI1PHJrrRLpr
	uHXP5lCvhfjMTWA2B1j/oBKlTx9dKSTM0aLFrTDsXbDl6y+rIaQvq7SNdST8lLw9dPnunL0CpDqQh
	pppWzw/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuJv-00000005seo-13hO;
	Mon, 17 Aug 2026 10:11:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuJt-00000005seP-3zuA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:11:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5816243FF0;
	Mon, 17 Aug 2026 10:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F48DC2BCFD;
	Mon, 17 Aug 2026 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786961513;
	bh=/TB6SF3H4ZNKQZQfem2xpHooLxhbf6fX78+sfpapzYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TCXqjMEySB5huZfieGgW6FSwySCrO4iuefCZZot7QLSW+wDge1ukX3axSIH+obLxI
	 2sNv5IC1T4BTRW73ubbSb1fypn2yYGSykZtgVjTujoDW7aGMS31PkjM7Xo4XmTJuXI
	 NjrkfiwRtRbRqS7hCFrgJMmcLqbmKA4zDKXfhAQy0elbO5mfQakjcIdTT23ogaUZDi
	 8Cw8jxsTy0pX5FORx5OP4Bguu4SjNPQe7Nmo1pHOWfRgSP4jn7KGd1YbDGogtz9S6g
	 r5kiJsspyzdjDeduKO9bHQZsf7vF1owLxiKSLLy2nw39jkUSM0UpL2auHOK3DPK7jn
	 A0sHwuUzcrgjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB04C5DF7A;
	Mon, 17 Aug 2026 10:11:53 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Mon, 17 Aug 2026 11:11:46 +0100
Subject: [PATCH 2/2] soc: samsung: exynos-chipid: Add exynos5515 SoC
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-for-next-lucky7-chipid-v1-2-eb2908705c0d@member.fsf.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=4onVHAcKrIX3AThzDNrMPzjm8bkKJ6d7i9OkgFxnui0=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqgt5jjXi6Ca6VVlGxDztOxUyWZvUX3u4J5Ehk6
 PXLoLz195KJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoLeYwAKCRBJJwGyxHrX
 6/t1D/9XbqUBfGopw1OhVfelGWacYdVcNcYQn/yhhtEBjjnHZRKHvtbgKHwp7lIyxE2zllPgiTu
 vVbID5c/vaScNWJ3R8Ch+CcOb3Tkl9cFVov747b4IwlhPcnW5T0uBsuGgwGR4fGbn/M1JQI70Ex
 BBFFIGEtKlNj/RTt7EBztztU5U3Rf4K25Ha8DwNQG7j642vi4kYrH9W0VhmB0dI5fVPShv2AmCj
 /k31Fl5UgNOPiwUoEOehtbRo93fSXPsJc92IoVex2Ty9Klrfs77z/QgSao+XOk0opC1DrOHgfv8
 A7cFxmP5XZwVGHKyalpfhA6niO/kZal9mIZl4e9PucH8KPMB0ojXGcqCd28yx/5VN5n0XOtwwXL
 SUXGCuWei4PFiWwrsFi6+yAv3TP0ZaBx05NXq8LwW2DpDSD7JFQdhikarievkdar4X4NOAFKCEc
 DYlVylvT1rZMRkw+t4Y3vgNFoAOUfQZikKQVzPWfODlHx8MrXmvqsIZq9SVw4bEwN05nfReguhT
 pwzZ+ZIlFijHzVxHkSvOg90q4fW0hszIrr8RX/IBFKvP3YSxv6aO2fvZXNQF7KVZQ6zaHjGjSqL
 +/46N/KKXlvcqGa9mQm3JMyCzVMPfAOFyQ2FEQwU65RR2/llZ2+3WAZtCVvgr9CgwOPORswxbVr
 2NRfZIYGHGJku0Q==
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

Add exynos5515 information to the soc_ids table.
The chipid for exynos5515 is "0xE5515000".

Signed-off-by: Aiden Isik <aidenisik+git@member.fsf.org>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 6ef9751e2509..506a0bcdfe30 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -64,6 +64,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS8890", 0xE8890000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS2200", 0xE9925000 },
+	{ "EXYNOS5515", 0xE5515000 },
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },

-- 
2.54.0



