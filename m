Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99429606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RJJ+K+G1;
	dkim=pass (2048-bit key, unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=jobzWXkm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wYFb2KtssvV1UrVJuVQzQnQHX/owbjyH0m18a3WIZzc=; b=RJJ+K+G1qqh3zO4o+9QYe5JLkc
	dsMS9dPFAvOZ3nVHs4/XwgGTktcspyW42OgCQISU2CnJKc01qulHwwop/UOf61DwDiFE+i9yj98Do
	Pme+306t/2PS+9dsDaxaPfiTr7P/kNePlk1DeaCykd/LHT4P754yKzGjs9fWPAWalZfylCkRH714p
	4gCBsHPo84fmUboHCiqqF8wU2XPzh8pijvj9kV9bGJwBFRdiyEAEAzCkOzoVcvM2wFl2TM4yK/rNG
	wK2WLNxep+rmONB+ZTCL+PnQo6rBz4FgGTCuz5aY/24ZKjn1C0wXBmyRbTA8msxG/E3gWOmDj0/XF
	gMMgGFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMah-00000008sPq-1ssO;
	Thu, 29 Oct 2026 09:38:35 +0000
Received: from smtp-bc0e.mail.infomaniak.ch ([45.157.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMae-00000008sND-0gHa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:38:35 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jFfL96K3Rz45b;
	Thu, 29 Oct 2026 10:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1793266705;
	bh=wYFb2KtssvV1UrVJuVQzQnQHX/owbjyH0m18a3WIZzc=;
	h=From:Date:Subject:To:Cc:From;
	b=jobzWXkmoXRBEyxQtoXEgoxvUgk8S1c+aiehwCrq90gQyyf9FBPWTHcNCdW31UyKc
	 0mIPQNmVMw5W2cY9b2wZ9CRMVeTu7P8d5L4sbsHyHp0+eV9JUAm+zb24PV+mbpeOtT
	 TYxMvgndryFeK0ZNqj7e4vznVwVtKj+2awcMPVSvOZR4BYZq4LVdnBB9ZMPZcOsxxL
	 tJegYsCpp3rQyrlcoWhJSk0/OyZcXpNEJB1wFY3Mn3M1yu8QKHnBbZCgVvFIa2tDvd
	 1nxxGetgVSpp3ygCG69Z4KZYG1MyUWVfZAxywl5pSDMolB4jj5fdOhm95hcgMfR/iP
	 t2Z0am4kRrLaw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jFfL76C1LznDb;
	Thu, 29 Oct 2026 10:38:23 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 29 Oct 2026 10:38:15 +0100
Subject: [PATCH] arm64: dts: turris-mox: replace denx.de links with
 official location
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-denx-de-links-migration-v1-1-4ffff7db7d98@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBAAvyJ7diGJWqxfkR6Mrrq2jSWrIoh/7
 9ZeBuYwc4BQZBKokgMibSw8BxWbJtCOTRgIuVMHZ9zNGnfHjsKuwBeHp+Cbh9gs2mCflaXxPjd
 UWND6E6nn/TrXj7/L6idql98OzvMLXVEAH3sAAAA=
X-Change-ID: 20261029-denx-de-links-migration-f3880bb40e51
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_023832_658589_C25D67F4 
X-CRM114-Status: GOOD (  10.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Quentin Schulz <quentin.schulz@cherry.de>

The U-Boot project doesn't own the denx.de domain and we don't know for
how long it'll redirect to the official location (it currently
redirects). Update the links to point at the official GitLab instance of
the project so we're future proof.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Found when hunting denx.de leftover links in U-Boot where we import the
kernel device trees verbatim.
---
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
index bd00e7df87c67..159515f95ef33 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
@@ -151,12 +151,12 @@ &pcie0 {
 	 * for IO and the rest 112 MB (64+32+16) for MEM, despite that maximal IO size is just 64 kB.
 	 * This bug is not present in U-Boot ports for other Armada 3700 devices and is fixed in
 	 * U-Boot version 2021.07. See relevant U-Boot commits (the last one contains fix):
-	 * https://source.denx.de/u-boot/u-boot/-/commit/cb2ddb291ee6fcbddd6d8f4ff49089dfe580f5d7
-	 * https://source.denx.de/u-boot/u-boot/-/commit/c64ac3b3185aeb3846297ad7391fc6df8ecd73bf
-	 * https://source.denx.de/u-boot/u-boot/-/commit/4a82fca8e330157081fc132a591ebd99ba02ee33
+	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/cb2ddb291ee6fcbddd6d8f4ff49089dfe580f5d7
+	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/c64ac3b3185aeb3846297ad7391fc6df8ecd73bf
+	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/4a82fca8e330157081fc132a591ebd99ba02ee33
 	 * Bug related to requirement of same child and parent addresses for first range is fixed
 	 * in U-Boot version 2022.04 by following commit:
-	 * https://source.denx.de/u-boot/u-boot/-/commit/1fd54253bca7d43d046bba4853fe5fafd034bc17
+	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/1fd54253bca7d43d046bba4853fe5fafd034bc17
 	 */
 	#address-cells = <3>;
 	#size-cells = <2>;

---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
change-id: 20261029-denx-de-links-migration-f3880bb40e51

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


