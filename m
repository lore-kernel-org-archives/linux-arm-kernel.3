Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8C3606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zrke4m4g;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5QWTSwY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8MPpLo9g8WmfTBzYjDgl1YuODB/LFoNptN280IeFyBE=; b=zrke4m4g4msZlivsVS42ZH5mka
	Zwl7Gt5Aqoejj6i1YKvonv+mrQDjIhoxogWFFa+qywj757QFvOZVHveOMCO1K6ZAdX1f+rCht1a/e
	QikmjTKYsfQ8YWu2gXzBasS5VAS51qB8Fxk0h1SkEyOZKxEs/vctEVxqfXG5mi0GEQCROkukvJNxF
	PgcRMjWClMqqFoRLglNQiWaVb1rDzhBMyr7/Bfb6eQWWo+YOY3vqp4aAUMRodFnMkTRcjyZKsAbDS
	0DatsTyxfypMJR2Xu43Qg2Kz15Xzoj2QQ3Hpa7UmfXJFcPV1hQRh23/MH6Bea5yenTtLbhz65OH+Z
	u3Jy4uhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvw9-0000000EXMB-3hWW;
	Thu, 22 Oct 2026 16:46:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvw8-0000000EXL4-1L5m;
	Thu, 22 Oct 2026 16:46:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F795601F8;
	Thu, 22 Oct 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792687599;
	b=EE77ZGeAuyizkhiMFaBwPiMGDYDSDDaBaceEhj3/RYsshZJ7vTFihKarumEEovWrX/fc
	 Dl3KzPWTdFkGAf2xc9ofklmBsbvebw30ILCmUigtMoAjtX6uLrxMlYGhr/ldvm7pWlnut
	 /ZHg6Kb/prp8BCLhpousGODVQM8f0qCj0rFPCOvFue8EQ4uJUoK1iUsvVstvG3Ur3VWiF
	 MGIGkid/PKeoMmTXQwZwtIu/XDfZKbm3w+vnTYkztvp1d1W+KBJ86HhamuSgAJ4r5XdkZ
	 pnvoYUoK/c3hgz7RGe7MaD/x7TawW5Ma+5HIZGD0nzoNo92aIVYTIXn2m0VSDcL2HKg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792687599;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8MPpLo9g8WmfTBzYjDgl1YuODB/LFoNptN280IeFyBE=;
	b=WxfQjnkrBQoK3f6aU6ZEQyD1NcfB8y0J3e8l7S/ThZGdH61N78NzzmQdOIcfxe1apfOw
	 GK/smtg5Ppjn7qALT+G1SxY97rk+4TqITBQqASWcjCq1dI5aYyXwjxnmIeI2Dkn7t+kKd
	 57mmfTnRbNNm+sgl12oCSNqISrG2Pwrca497P8aNLYT6mHogjj+aKx82o37/+MVIN/rll
	 K3ItgQ2PofTMz7kPRPnj+TWMwMh0pKaCgIGFvAL7InN010xhg9ap33UEH7luhqNBE0bsY
	 hqoFi0/z44gy7qCDC4kIgUbDbbzE18gnkNrzFtIDECLDihUWRYL/aKMHYIlqHlMIxqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A8EB1F01825;
	Thu, 22 Oct 2026 16:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792687599;
	bh=8MPpLo9g8WmfTBzYjDgl1YuODB/LFoNptN280IeFyBE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=V5QWTSwYr/J+3WexfvGixiQ5Xczrz43XYlHletgDdEGGa7Af/ljYYH231HBeZEazL
	 hgGPN4OD6GppuYxIC9DOdReVCOREhkWoCWg8EX0WDZ0MinIFwjK4zpqRlYxPRfNpg5
	 J8NwMhhYfc28t+xsseQ90+IipUzpgAiu6IyAbwKQb7HslqhjRPG1jXaQwAT7v7FdrY
	 aiQvtUrcpJczV3qLetmVv1InNTAMmdelS5IBTNSQzV8UA+a91sW3OJHgIDV3qDUDIP
	 1QaZIv/F5VqzhqcNgsaeHe/P1sfFwj8D6iqCWxTZmHNiJabWRmOCB82ne4cVD4vtll
	 lwZoKtNAKIcKg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0083441E7F;
	Thu, 22 Oct 2026 16:46:38 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Thu, 22 Oct 2026 17:46:36 +0100
Subject: [PATCH 1/2] dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos5515
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-for-next-lucky7-usb-phy-v1-1-2e47f8484bf4@member.fsf.org>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
In-Reply-To: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=TSsA+fRx4RBo19oCHI+BqN+RycpJHWo/dLkXD94y3zQ=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq2j3ssieeYp5OpBBa7/6qfdEtFIdA4uG3F7T2S
 7t+nJe7sCeJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCato97BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+sn+RAA5RsY9YeLzM9rKsLA3zt2qepMy9qla5K
 8Ym4GmxLjGv4RGD1b34/5GxOOjTG19kRdtsQQkK8Cai+N79QSEw3IcfiMIjplw/iIbdgGyLRdBo
 X4lyTKCnB6ElPcURLBg5hdUuw5nzs820738ld96WELDcelDiZFmzfSQgjWORZYlRdZXK35ODdBA
 0Eo3SDYoExdOsqjcQEb7yfRdwhU5q5D3/vaub0F/JjmbaHk7JWAn48PCTOf6SLr/kAO8tA6GU56
 Z+0G6oVqzGXSBI4TyXnXQwbWB0eMCgVYedtNByQhWs5w+GdwJKUhJVce/AloHaTBvKbj6154NeE
 ZLFcNZ6usUTnzGQtY6tLQcHkGGYC56oJdpinpvOpzpndeLrSmP3ySjjgJDGYb8vAIeSaus8Kbg+
 iKtSuTBqWviOXF0+IB03T6BAQ8bvaIH2LPuUrtzuGy9se5e6cx0SmJe6lRnf0mTVAoh5qDczFnJ
 56gC8Lvhqrq3VpqKl8oMLpREgn1qU9P810ITZjTW12Scj7tsXvojTZ/myNUzdGSRAzcrt121o1Y
 PcpwzYnU8uJFz6VCUFBYar3Y+mX3KwjVdUsBRK92wZkpoZX5pwDcnQcHmyG9f1YI0WSGVadHQ9h
 MJ53kzDKK+VyQmOdwT4B8ScpFh33mcRrmFTcA/flKQUU/9jCZYOs=
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

Add the compatible string for exynos5515-usbdrd-phy. This PHY is
compatible with the Exynos5420 PHY when running in High-Speed mode,
in that it uses two clocks, phy and ref, so document it as such.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index a1b3d9e6a094..a9af03066d8d 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -30,6 +30,7 @@ properties:
       - samsung,exynos5250-usbdrd-phy
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
+      - samsung,exynos5515-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
@@ -233,6 +234,7 @@ allOf:
             enum:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
+              - samsung,exynos5515-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy

-- 
2.54.0



