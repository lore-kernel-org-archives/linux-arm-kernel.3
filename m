Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABCAE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 15:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nG8WRDsS3aQLEGs7GtSj1/lBtlITADxa8Usay8tA1ek=; b=p0fLrDiym18rTW1dVg22IlyjVW
	HVu9C01gmCVuFi00A/56kGe/rs+Q2frSSCID7MTKARSr+Q1MYl9atqTPqEqdsGB4jCwWssq8cZzLq
	xvq28hlGTffUeJ+KkRr5gOzKiyZzO27WUF/SaRVYgEFwUvF2w2XIroRwtWHggmOAYHlxvTLAlM5IU
	/4G/MPtJ9+fHEf4RzESGRuB8tVfHGy1U4ZhsAPzZugkESzH5tDdCTX+SSLvWSh4rSU7rF9apbvSGD
	QL2AluueD+vRX08g0ILC2nqP0SPqqmHPQkQgMF8zQGp3Z0Ffs/5/lvkIwuHwEMxjF/iWSfmyoXb+y
	0TQqy/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaYA-000000022a7-3qnj;
	Fri, 06 Dec 2024 15:47:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaTj-000000021S9-0BFf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Dec 2024 15:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nG8WRDsS3aQLEGs7GtSj1/lBtlITADxa8Usay8tA1ek=; b=duU70AWxmeLVY9+oNeVbrwtmkE
	7KMvRSPV99qgH3OzE+ytixBN58kvxhzIZP3vCZGWj+MqWByre4ekP2p8mG2wVdxkR6ccGBK1UCY51
	l/cGBtifycDcULzkv+1smK47NEXkUP3TV7pP85LDIcgZgzuCmV0qjkvCZhLuqaA3f3Q2UOyOjCE1J
	NFSF50RTXZbs9m2m8/Kj4LvxiNUx/B3uusxuECTVA3MVgzh7lPH6cCVyZasSIqdtjkA+fO2uZ68Dz
	i4xY5v3yhmzgQpWxduE+56phMIvH0+fwU+nze0pvu3q6NeddVF+sQuud/TdIsJcylj3EXPQnQ2b5Y
	0IfxU6VA==;
Received: from out-03.smtp.spacemail.com ([63.250.43.88])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaTf-000000037AY-39lP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 15:42:49 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4b9D08PSzGp5w;
	Fri, 06 Dec 2024 15:42:08 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4b935nmqz2x9V;
	Fri,  6 Dec 2024 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733499722;
	bh=bNG16fxeZRe7PkHUfBJcI8c38q4ij6t/20saRuOZksI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W/tu/SBlJVeaT4mkkNWhgF5c/o6VzRuP/s+sDUPj+gON2iQ6m/P72+IGfpfMs24k/
	 Y/OFfvyCD+nvme1cjG3PAILhsoY35LtlKzaA+iDUsGLNwxpd6VMpgjSGy9TKisg8Ue
	 2w/SRa77iflGb8woA2AnDl7CAub+4Eb7leZppH45w7doJFYxtExiYpoCppE5+oxl5x
	 IXg8XMKAzx6TAdXMznus2aL6DGkygcsPmeXhEsnCCzzrqvfLCckn0PCw3oT+8XpzUj
	 dm16NYxyt80TJMAHWqD6W6mD2KkmuwI5EEXFWDU7Ld9UjDkKzBOCdb8ZGZQGiz6urI
	 POE6KD9gQ+WpA==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v5 1/4] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
Date: Fri,  6 Dec 2024 15:41:46 +0000
Message-ID: <20241206154149.4271-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
References: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_154248_114682_0F75D61C 
X-CRM114-Status: UNSURE (   8.34  )
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

Add devicetree bindings for Samsung Galaxy S20 5G
and Samsung Galaxy S20 board.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 168e77375..fab29f95d 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -241,6 +241,8 @@ properties:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
               - samsung,r8s                     # Samsung Galaxy S20 FE (SM-G780F)
+              - samsung,x1s                     # Samsung Galaxy S20 5G (SM-G981B)
+              - samsung,x1slte                  # Samsung Galaxy S20 (SM-G980F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.47.1


