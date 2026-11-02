Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5747B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yxpc/cj7;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KY5/YjPY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rYrONzDmndfVB6GaH3dGiAC1FfNwMYrSAW/wh3V+FUI=; b=yxpc/cj7kRgzr61CvJNZ0hFZOw
	RndYDIYLAB+/E+IkTaZQkxupdUeGsrTaKholMmiVn8W+yjWUrVjXP6ZwkDRM2a6oDkOzU8febpHz2
	PylbBuq0IQFwVoBW4L00LuMFSXk/Jk8OXbIWdZpD60cwi7O64/TrpBOHhNLy2CpQT5YHjOJpFPeNo
	woI2nck2DvEJxlKndKcuMjFOlXmhvY+bzqh8+xnfUKAl5lJzNZ1qcIjimz3IhsxZqAB5PFGn157rd
	UxN+J8XD/ZQDKuPMJNLdmh6wvXudomCnM7Wxn1KuVWQY+2qXHFW2CbHInOfgoyR/kZvtCN9PEsgFx
	HQScoPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1XY-00000000erV-00dd;
	Mon, 02 Nov 2026 23:34:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1XV-00000000erB-23dk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:34:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 386B22F;
	Mon,  2 Nov 2026 15:34:04 -0800 (PST)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18AD73F673;
	Mon,  2 Nov 2026 15:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793662447; bh=TyPXI9cOspx3YhD24PSZEUA31oaVYiyRztgSw5AfOuc=;
	h=From:To:Cc:Subject:Date:From;
	b=KY5/YjPYz1s+wKGHenLIrGW6UuNYi3/dP16lbQEGEt1D/xIUfcJWgXCqly+N+kx9n
	 NfBiNAUBXfBBKCZAQHlOC+PSKYaWTAZXz7RW5fUnbe/BgMqfm80lBVLBYhJWEZ5m+U
	 Yh+SupEqXGLE9FqUi90PuwGcORUSgU+vffXiOk+I=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] arm64: dts: allwinner: a133: add ethernet aliases
Date: Tue,  3 Nov 2026 00:33:48 +0100
Message-ID: <20261102233348.23117-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_153409_590240_8C1703B0 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When adding the DT nodes and properties for the A133 Eternet support,
we missed the ethernet0 alias, which is required by U-Boot to generate a
stable, device-specific Ethernet address.

Add the alias, to allow U-Boot using the Ethernet port, and also provide
a non-random MAC address to the kernel.

Fixes: 8f128f357dfe ("arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts      | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts
index 694c0cacf9064..607864ee13718 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts
@@ -19,6 +19,7 @@ /{
 		     "allwinner,sun50i-a100";
 
 	aliases {
+		ethernet0 = &emac0;
 		serial0 = &uart0;
 	};
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
index 90a50910f07b7..81a2914ae3113 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
@@ -16,6 +16,7 @@ /{
 	compatible = "liontron,h-a133l", "allwinner,sun50i-a100";
 
 	aliases {
+		ethernet0 = &emac0;
 		serial0 = &uart0;
 	};
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.46.4


