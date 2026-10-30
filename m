Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DAB606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 20:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yXEMuwqF;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmIcvfgw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=soIhMh1dJ9HVRlujdDktbU1BG+4MBhLl+PUVrnyOGB0=; b=yXEMuwqFZIPWNBXq1/GPocSFOP
	t96L3N/+GOvwRSKI53egdAtbqngsC3fuzwFTjh2YybQPk1VNvvLTAQ/HcIXIHLzWKhgve5TPRGCJz
	pVUu+10LwnO4uXabBQ1G0hnOGASUbVz/05xCPplWGqHWw3Dk/duLKVkAGxkWQoHl1IFMcAqqJyOTI
	jAOXObW19egm0ebwk8JiCRSzRdXm65HQIVYFfUicOtsaneFCKcIx/KGBL9WSfpoEGMJrH9pCO3UgU
	4Zs4zwvccM6gzfLDzBF2Vn+B5mXmtxyU2Am/hULpYyXKl7bONEt7uZ8/76FgIU3aSbk9XTmOpBYk5
	U9Y6PqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtIl-0000000CXgw-0dy2;
	Fri, 30 Oct 2026 20:34:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtIk-0000000CXgG-0O4E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 20:34:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E8D0741FD3;
	Fri, 30 Oct 2026 20:34:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793392452;
	b=NFzbHwRF//zl2Xyj1HSwPKvAuFp8RKnz6GgaRrghHcha0ISS3eTiQWl+5gowbVXz+YLv
	 DPyTBZadBHOyFU59m+8u5KaDkuUk1DUPtqZ6O2v7Z3Uu4lvwFtZdxikH0wZf+a/8dWcj8
	 HOT10ULRdLIPO+ttBt3XxD2oQDGRL8FfX4GxT+S4pECGwPqHaM99ZRSsEci52UHMkjDQL
	 Lri4oHhGxcxnKB0R9radglTXySug4rxINeeLHPe6SNo3iCsXnGdcCShnyWAv5oDg1Hxfk
	 8lpsj4iyXJW55m5Lz/ibbjMB4q370TFgUFd/RWfNM0l4uj8GCpy236EPL2kaX01RkIA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793392452;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=soIhMh1dJ9HVRlujdDktbU1BG+4MBhLl+PUVrnyOGB0=;
	b=Omy9BHE1zrFC6arZhYGHOA+mP+AVMEePu/pPUtgNaXns/B6cVcikWyDeULt3KIxAnm6E
	 TZVteDysp9O2FJdBV0v17lw2B/GIAMML/Oew/f5hC0gFF9ivAk+AbokwmWwjiEmL8igRj
	 qH3XjAthMAbOWhNlhr19FhxDPnyB9NJCFvWuShsya3gmSEhmU0LO0C+rCGgsnHyT8Y2LQ
	 Km07/9aJICQc2scrPE3oExyaq+W6qmpBQsanLAna0fe/pb3tHUhShNw8B1//+McGdl3NM
	 k617gUSazI54wsCJwt4+Jo6q10LQUG0oRnZLNkKn/nsKqBjXo0KcShahNzTNatNB/dQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4455E1F00A17;
	Fri, 30 Oct 2026 20:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793392452;
	bh=soIhMh1dJ9HVRlujdDktbU1BG+4MBhLl+PUVrnyOGB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EmIcvfgwXeHxHmykw8dAguK01MfyJSqWqDPAllGKxY6xTE7hTfmFcHPYpJ4Xel/fk
	 VR9UHe4X+Ryp14f2LJYvJWOnPlgMffFICwocBeHlohvaLPj8o2GDAD+sDsGGiiL2Ln
	 qo1u+8TCoi0o3abJm9lBNQx6KC8tAqeMtkfZ1c56Jc70q/dIctlr9OA6Ts5kbnxIps
	 5nLHCx7wJvdUfRPxljGB0AGBpP+MBuBMnEHGgXDteLEX76X5cZWIuF7P5TZCNMSOXK
	 ZZhGSJGTYV4qruC9fhMZrFhbnTL5WHUZzOQXrmeT0Lmi/E9iyLnfXGR2LDmrQpdZdc
	 93QJw1PRqMrog==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A59D04425E;
	Fri, 30 Oct 2026 20:34:11 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Fri, 30 Oct 2026 20:33:56 +0000
Subject: [PATCH v3 1/5] dt-bindings: soc: samsung: exynos-sysreg: Add
 compatibles for Exynos5515
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261030-for-next-lucky7-v3-1-81e02272ce69@member.fsf.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=QtI7rR1JE5JZ0IsGeNkyOHtQG1QoQSmhMzQKfhBONkY=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq5P9BRwnhwKnh1lcLA8zegpISzuoxVtpp5hFSk
 J2zaklXBzqJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCauT/QRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+sUcw/+KAI+HUyt1z+19ZMIG5gRCEjE44sucKH
 KNHTSOx64D+bNnnirR/IWS6DGiL4OCtHgBLgaaYoTu2rcjjPkARscI3n1BFNH3qknQNcNVLPagG
 JEdMikMNvIjTYc0+RKLMTV4hOAKGxNdk5ycDH5P/d0aWZNi4LZzS9DeC/ID+KJg5TyYWBhZv1hM
 mzi+Jq65JmDFFAcZ0hKi+hS7gJHMgzP9ewAwwRQor464RYTR66m/eGMbXCSKNJc+HgY+ErFpXH/
 lTk3aD6t4CdFYYN+SxUKbtbJqZydCMmEZVWBAoFn7VfD7loooEx6BknS65WU0cT1HeeD8J/J//e
 bRgPFtQm0bQgKesqdoccbIxtlW+Kl9w0tuR1tXn/BxCpL6dZ+QH9gGbK0eSMxx/1atIHAQAPL14
 HheUfUJM5JsInrfZyVBtGqDXlF1IPkJv+Y6912ZctsOSkCejwHcJ72MSe+Wc7nO5kZivxgc02Et
 86RTXf9QUjRMUWwQQ3cb9QXpxVGsiOJ9nLE9cvXU0CgGaAhGhTdseWBH78WC9vVhk6MUbHTm2va
 S289sjykEYRGVGW6Qxkcle8PBMO6/LulZ6ijDXmCpedKRWsfu7JPYBhDD4N/1EMvqpVAEN/WNEf
 iD+X7Wg83J2zPnp5nq5rKGNiCrr4sTqk6Qo6OQaCioJNT+st9uk0=
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

Add Exynos5515 compatibles for the following sysreg controllers:
- top
- peri
- fsys

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index fcdb9ffd2644..9e698d065820 100644
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
@@ -100,6 +103,8 @@ allOf:
               - google,gs101-misc-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
+              - samsung,exynos5515-fsys-sysreg
+              - samsung,exynos5515-peri-sysreg
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg

-- 
2.54.0



