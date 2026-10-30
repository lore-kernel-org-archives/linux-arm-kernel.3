Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21BC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 20:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wReXJ7jz;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVUBXlHh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HeL+KPss/XWXAKPl/eTROBTm4k2yu734wKYuHO19n+Y=; b=wReXJ7jzbrDfRVwryIFfeBhRFa
	45d3pW2tUsG62hjKxRGRPpJ03tU7sThGpyjbo2Y31yacsjLwAa0Xcw2CxpjwzgAchqv0hjFb5jYz1
	uBxfDJS2DdWBG1iq+UPK7PsPa54gmvifi6yoP1XeLx642DUO9krUfzCluLnyHioS3dB1Ie8UilhJo
	Zvwn2HgSDmFWXNy+0MbYmNQ43JFIM88/r1TnfIqCIufdZIDBddFX40GDejMPJZIlejcLxKSiUCCjE
	gGzcGvDTvRw1HUVPzekN5+Rlo755tMr4nPl2DPjvb9LsqJUEZSs9BnB4HB/EFXrW2Iz8qwz/1xmf6
	OVIax9Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtJD-0000000CXzL-35Fx;
	Fri, 30 Oct 2026 20:34:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtIl-0000000CXgl-1a8h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 20:34:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 396C160617;
	Fri, 30 Oct 2026 20:34:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793392453;
	b=fo2NFwDiZnK7fLMXD1rKdrdHFfEAnvJ1rXw7SxWD6L8Bde0v3XDXzZ5NE9b3up/7lawq
	 iMeHND6/r7X5xHvoMdSMfuI1cqNJAzdggm7hX5POCuanODWqEhxpzJD1WSp5P/yd//sIp
	 ovCfLgWjQ5mu4F0h2c/yk9OsU0Ix7iUQJC8vHOAgrp5gVDrkc7KEJA1LJ3tD3F61RYnZ6
	 lUY7X/CGp2esRzHZZiWdEhhvJsPFnasqS5F1yyyeKal3KLwovJUu4gGjDgI1ngqkkRoM5
	 OWwULk0VXwVJTCaAaB2S0m4g5UynNe7Fxi/qfpTT0cMRhPCo42OucxiHccDyiblWBzw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793392453;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HeL+KPss/XWXAKPl/eTROBTm4k2yu734wKYuHO19n+Y=;
	b=Afmk8rIwfL4+TbCYwTmQBqXcvhJBBHdRhl5BFgOumkf5TdSkTq7x6MNEh9APd5lcoJJ9
	 AJOQzS7iCUg47QOs9WipwvyNdP7gJbf4RcRNzppVhTWQMVVhnUGwKaUoNzCycLzPwZWsC
	 P1xt4oj7KmXhoM0/Q94nwDEhPQXkRT0t5/xOCOPC4QC4vt85382vkfuyT+qf5ZS099d8i
	 QHoOFw3RigSVIHpLeVPasu4h9MILsTqhcEZrvVeOesaAlnQ3eQBwBOrgWmsqdVSayL4tl
	 AaWvqUScNLGdgeTSvFOpOGiwiS1bSyj0++tJP+HAqWCS0ehvWJaEI1i1ncfSP0O4KSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 448771F00A18;
	Fri, 30 Oct 2026 20:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793392453;
	bh=HeL+KPss/XWXAKPl/eTROBTm4k2yu734wKYuHO19n+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YVUBXlHhA4Yf0UXTlcLhw6vM+ZxYNYW3WMQwUOALUIrzhiaJxnfSMc8zHLw76k3bH
	 cNqGQpPs9nvCfaDKs6xEz1QwEwIaubCIOBpBfCg1Wt8zOz6Rk1UL/QLP9ZXnw1omnm
	 Qj1pWK9ZwJ7l+AMLhY9FvWavDB/6ANuzuwQipfa/25kpFlZJaWR9EyAFYdLiDxiMqO
	 ZX5xzzODwfduSMb+smZ/+7R1PBC6DnWAWd5fhoYV49ExISZb6Q5R7IQjMDuV4o9dvN
	 PD5fIz6C7km/sGe72BW52CD6u4h/4CCNkp0qzcuzs/CS/tH5ycw3WiKEK8tgqZg9kA
	 sxFSyBHeyeGOA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B131344283;
	Fri, 30 Oct 2026 20:34:11 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Fri, 30 Oct 2026 20:33:57 +0000
Subject: [PATCH v3 2/5] dt-bindings: soc: samsung: exynos-pmu: Add
 Exynos5515 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261030-for-next-lucky7-v3-2-81e02272ce69@member.fsf.org>
References: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
In-Reply-To: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=u5w9oDBuV+q/JxmEewB9ecAjYkFIvHtUgbXKYE3snfg=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq5P9BWj3cp07eny7nWeYelC5iwoGlylEEAbuTD
 jG3RYJC+xSJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCauT/QRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+tHVg/+M1rsIcz0uUNK/8caEG3ZIfganwEVCQ/
 ufqay8FMzfjgwt5TkdJoAwDFfyj7KpfPHGtW7hLE//0EAhIyWCkw/yYWqliLSUGNoJzRFODEG/M
 WkxRu4eSum8WFC02NxTmkw+0KcBsV5FiIe+WZKkPT6FVr5aNukxAAVMnwIK+P4IE7P3RoHUwXtY
 kIZE5FP0WSckxgoz/9l96VUVF8sesk/QVR/PyeTYq5wkjxLXjJwqzL8ZsECrft0ah5V3vcf41XJ
 MBo95k0+GigXF14NBr4xarZRfrSStoYa7WvwFzNgsJlKqS3YoUGnrAqAIq/eCGee7NNA9OKo9LZ
 J2ASn84vHf/RhwwDduRDu2HMApjdbIWp8j1zUErwzCVuzad9urxaczGNhatcw64h5n8WndkDEAF
 YJVopq6IP4Bh2ZJ4FCQsa3k5q0iX/Bf3KUc/IK4V5aB8uDeN6fho9zVXaBHwU6neFeN9Ift/fNm
 I6Ely7lNsz64JZchDj/NFyc09KSIMVQQSSLD9hGOQir4EYYH5neY3Nc/IqQ46BXQoz3VCHtr81G
 uJTnbbZ8/Ej8kkvRqY2IWr2MTkj1pOzOFE5bhIOC7VQN9fIp+y3l6Egf6pEn0LS67IuvZbBu1s7
 R0ziopYG9tWdYrQw7hGnknX/s7UzheDB9y9l/1+WceR5ooJMz7WI=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Aiden Isik <aidenisik@member.fsf.org>

Add exynos5515-pmu compatible to the device tree bindings documentation.
Use the samsung,exynos7-pmu compatible, as it works the same for Exynos7
and Exynos5515.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5bd39876e3b3..1a0d9de79696 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - axis,artpec9-pmu
               - samsung,exynos2200-pmu
+              - samsung,exynos5515-pmu
               - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
               - samsung,exynos8890-pmu

-- 
2.54.0



