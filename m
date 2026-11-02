Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FA5606CEF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rsr7FzSa;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vc4oAmXm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=; b=Rsr7FzSaTyNAbH
	IbVwRHKTnEGBdyIBWHjmJDib1JFdn1Tg+vceyLFoEWaUzUqA7lIE/UpoPIvBLtG+gPQBlb2aB3D6x
	FWM4HOX0rPMsQKnqD+xah1mWjtdYi6jgyxsqMfedhXpsxC+pEpqwd+b3GlIre6Caye8UdND6XntwH
	eq4ohudykvxaJnkDPqhcCiXM3Ujz9TjiJdnUf4VxtEx+hG2EA1Vy2i88bHDNhbK1YGwVivZIITmjS
	Ed//jgsiyqXPjx/xKfqOX61p/CMTv7CMmuz5Is6qC8ssCoVCU54u5I4UQb8QsEuQKceYEaB77BGGK
	bHZci0/jMQJhHzWP4EjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw5i-0000000HVBO-1ETD;
	Mon, 02 Nov 2026 17:45:06 +0000
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw5g-0000000HV9U-1Qg8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:45:05 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-3537f63c9e6so1335069eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641503; x=1794246303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=vc4oAmXmKbz5qo4F4A0j30uIrLU4d2Rq1gvRpeagUfnFHJDNPOYEyL1pBnBp/gfdgP
         xfe/WjEqN2ba9zQ5p3XrXP4mYlxHKajCOSao5CflIxJBW1TgmP+n7W4YtNWRxxSs6zro
         qythrh4PO65boYGrBoqgXrw2BSH8iBu7EYUVYny81nWvppIY1dpSITEvEasLBEUfEo3p
         4495+TNjOBe0DzL30o3XlrxVCX+TWWTFomfDi7TLKt/bwEsH0wItXGT7G4JgI46iu6BW
         67lUKHTXA7Ksng8N2Kn75XrubA7vMnaU/tBT7WUHbUEhnEqhXKQXXAk1HWpUu8wxbdRm
         fEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641503; x=1794246303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=TnBRHFwN5+b0qVMYomt/iwjthmDu0bUzU2neagE5OqjIfoIf+uIMY+AbJdvzRvWr9N
         9KqfvRmtHFqYQu9tUSqcAgVW9uE8m7jIfyXRpLu9c2Wx8cCQOFkBQmuxIl6pU2/1VwEr
         1C4QaiZxR57vXsCS68ypQ2CzYOAGU5qvJIp7Eh8R4KmunaJojouu0mM8E17IM8R8CHpB
         /eRbL3HdaaKIdq0iT+oKamj7rBJ12FKzlU6hUZmzo1yTLqQnOxRIyLGcbJb7ev/GrlYp
         MygWOtRDwT8n6hNvOM3t0kbswa74SpP+fLtDe6ztoXBxJuADIWxS39ACUo/nBJNrullI
         n6rQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjZ0bMQJDkklgeZCPYx3cqovtRnvMgo7d1Qke6wGPZ1nsHG9DTLR8AOGk+PbF5JzOYubHHhOYMs05Aksmv0YHv@lists.infradead.org
X-Gm-Message-State: AFq9FYIkfJSb6D1PWkaQv72I6YzIl7IKmTnWZihw+H01mBTpvnj3tgGy
	1jq1sk48CnEIUMDTEwernos3wsABwKHtjch+onG3XeLUVwChsMluBhkY
X-Gm-Gg: AYBFou0JPZZid+IudWww9HTHr8PYc1vRX5edRj2Wti/3UyFA5YhBkJLTEUuANbXO43q
	61At+JpWA96Dx1R15e9vk3O3ZMtXYRpuNrqI3n5UiiX6rOe0ZrQ4waFzB370js4OYrUz/44AF25
	INzqiNlx54e9M8nH3PLhCBKjWn8TxhAxfSFEiaw9saT45oYCGLsp77HowLBfBC11k4gNQbXbnrO
	gVlTVbrq4rCPizF37I86dipZzE40WJMzLbOvYYMcinNYxS/Sdvfr0vVrFPYtsB4Pxv+pCM6KGjG
	kpB84oqHHgzY/oPGNagEIC20tdLhpmRPPj8tnDNpAVSjZ1x74kq2YgppG65lbNVROHqFilVrXXg
	0aiP3lzZwLwsjyObZkCzRZHGKNYg4L9DRplAeWlK/kTSGBWcB7CRdQZg22Xbr0E4Tw3N4mkMoAq
	W3vKh0xPH1+qq2iML9Fjp1Ld1md1HCw4gy4hEw8C60/EEm/0zzmy27KGkdePAaEHam+z3Jfiyrw
	AZb5Ac2sB03EA2BBGbwRJMAiK4k7/HlF5EEJoB9TN6XuqU72qFG3TemspbAP5ZcblFDRyEYPp2u
	69EEMtigWRTKHiM4yocex40Vvj8=
X-Received: by 2002:a05:693c:88cc:10b0:369:d486:457f with SMTP id 5a478bee46e88-36a422195d3mr16266651eec.2.1793641503345;
        Mon, 02 Nov 2026 09:45:03 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:02 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 1/6] arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
Date: Tue,  3 Nov 2026 01:44:45 +0800
Message-ID: <20261102174450.3000397-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_094504_384527_BFECE3AB 
X-CRM114-Status: GOOD (  14.26  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both GMAC nodes list SCLK_GMACx in assigned-clocks, but only
SCLK_GMACx_RX_TX gets a parent in assigned-clock-parents. SCLK_GMACx
therefore keeps whatever parent the bootloader or the hardware reset
left, which may or may not be the internal CLK_MACx_2TOP.

Add CLK_MACx_2TOP as the parent of SCLK_GMACx explicitly, so the GMAC
main clock always comes from the internal clock source and does not
depend on the bootloader state. The rate assignment is unchanged:
SCLK_GMACx_RX_TX stays at 0 (managed at runtime by
rk_set_clk_tx_rate()), SCLK_GMACx stays at 125 MHz.

Fixes: 156a530ed5ed ("arm64: dts: rockchip: Add devicetree for the 9Tripod X3568 v4")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
index 4903e32d0ead0..d94bc34a31e67 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
@@ -268,7 +268,7 @@ &cpu3 {
 
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
-	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
@@ -284,7 +284,7 @@ &gmac0_rgmii_clk
 
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
-- 
2.47.3


