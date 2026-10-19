Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C4ACCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+w0x88x62WR2aKPcJYxhOe6cmJp1j5dZTYnycYtTzE=; b=JpEieuSG1caqD3KODTIDhQ8gJp
	ZUOYOA6x8bX2ybHuRAOPZRm4MkMDaq9r8ZAz94MDZmIEc8ZVtNqnj1blzXMMEfO0R55vvuUnm8Ndn
	1TANOJ669WYi+0HBira6/uBb2tuk1B4mHs1XGR3ZGUuEIGDG9D61vk8jVj29fIKSuvKi60IKJIBLT
	PP6+ScSHwfvS3K78m1VKH7g53wAW4btqPdtOYIRxLQdt1lBo1Rhz1XXj+DyhcdThdD2yR4irJ8/aN
	ACs9VzhRyzL9/YIfM0jTfh8Vw6ODoYfIi6bA16v1jjgYiAQ5Ep283/oab0CVUzU2JMH+IaYEKl5u7
	BxfBwGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkXB-00000007Ahs-1tTa;
	Mon, 19 Oct 2026 10:24:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkX9-00000007Ah1-24EW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:23:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9F6F43F8D;
	Mon, 19 Oct 2026 10:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A338C2BCF4;
	Mon, 19 Oct 2026 10:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792405438;
	bh=79MZhhCXQ1ke9yCe71oKWUh+N4p0hkd2zF0XEJQJ+pg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=roVozEdsdR/mfYhWFfN4005bu+3Gk/eUw385761g6pDwyc/dEvpkY1m3t0P0Zo6MH
	 VB1E+YqqJhRmOxSt0MQHViOfXDmvXTvVpEo44Dlgku+7IfYi2vK66KFkk7TOnC95os
	 KDZrqHSJzTH1z3MtrxwT+PCr5klmWFGS2mVtv7ha3Uz7YcTK+pV0zTMEfZ2/dXuU9J
	 tU+cetHsFTeKe1cqxl14Aap0EF/SSHdNPhugc283kSoKcrNdZwaL1zoFnDrTNxILMN
	 c7PvIcacRBMRjbmdMOxv3XK8pjZXVieM5438FPMubYif5V9yB8Y4zURUqGHzjhUsUw
	 /uFgOxavriGPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59808CCF2DB;
	Mon, 19 Oct 2026 10:23:58 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Mon, 19 Oct 2026 11:23:47 +0100
Subject: [PATCH v2 1/5] dt-bindings: soc: samsung: exynos-sysreg: Add
 compatibles for Exynos5515
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-for-next-lucky7-v2-1-c4ecab4b1c4c@member.fsf.org>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
In-Reply-To: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=4oL1kbyIOn5Laa19Ql6u9Ld59HRQr9TKBpSn19UfVIc=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1e+6I3w1FSVR3pHV96vJjrdf6vqS75do8ONdZ
 /ogMgf4EQmJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatXvuhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+vmmw//UlaEcMchJ3JeAfAC1L2YemzwaOYxTB8
 tKyececJIGWdPq95WRDuXT0EPIZITyoqsZNK8dWIojjImtJd2j/5p3ShmX8KKrcB5fHNnTBg/rE
 TtDYp02luZqSbrYbnY0J7+EYTz2PhRQGFWNXJqMY2Fhyip+47Lr8v5p2+ooPkP4pqQIAQweNkGA
 YhQJFkg+jPc0hyHK3dm3/fKGxb8NBHgQLFWYrPY71OOmONN+HQ7ZmFMHn7hTR5j2xbB9dnMOr8G
 cI1q34kHefLl37k5WFHuOVpiHY4ARlVk14GSwDSx7aOjFE2WL7Sb9fPsIw7ptr1CM0q2TOxBWcE
 pVK6zzD6f8L9YiaNx2qoVfKepaxq9xCipYj2LYcBmfW8NFA5X3l5KCExKlX7r8gnls9Wi+h+9DM
 Midndsh20xRqhecTzmrMH3fbaLBDpzMyXnd9ojF1DRWxqYMbtSBcavh/XjK80N/tSRok4ZnAy4o
 LXcJexI1F3l+73TZj/2bLFmrEgHZD/IMVymlvaq/tIAQ9nAI3MwaJjprrGKHrFHWP5YFW9UMSJW
 AIbckNBSc1QS790HoPKpmszsIGhknaQPWMAMRno+NhWcqZlGWTPavkQT3USXP4zm0/GWsUu0e5M
 6VjDgWY28Gf74Wr6Kkm4ECIWR+h5/VrJDL8rV9u7auGinXL6N3vI=
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

Add Exynos5515 compatibles for the following sysreg controllers:
- top
- peri
- fsys

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index fcdb9ffd2644..c6731a3ea1c4 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -29,6 +29,9 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
+              - samsung,exynos5515-fsys-sysreg
+              - samsung,exynos5515-peri-sysreg
+              - samsung,exynos5515-top-sysreg
               - samsung,exynos7870-cam0-sysreg
               - samsung,exynos7870-disp-sysreg
               - samsung,exynos8895-fsys0-sysreg

-- 
2.54.0



