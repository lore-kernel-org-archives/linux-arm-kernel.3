Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B5F60A3807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DznxazgA;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ML5sU7vc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TM7SxuLHSkIokTfxUi5Ea/8G/1rov27xpyXAoGZkTRk=; b=DznxazgAFI++A/
	5wl8MJPb+0HLRJBhewtDl91zrb+/NkRNgekU8Fu/FZqWMCWHaq0p13/bQ3gRG2K+BjmCdQ+2XVDty
	gZTNcY8qIgcPtwTJRjvh0vActEcd7JROKz2ni5xwFPP2ihQvEfp9+rF93jNkvq9X6QlP2RR+r3lYn
	scuCFe6OhmYfAoK2PyyBHkcOFm+Y4pvo6ab4tJcA5NAJzvUMbi8VdyH9EQGDbbnx1RsN6Sn2g6B5y
	vXb2YnQi/+2FjKvxVYjfPd5CNozW7hpy0WSfgIdiBlIzEfHOxpZpHSNAHg74UHKI/4DqsuDSKaO4P
	fy/qrwksTudjLb8kghxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw63-0000000HVYZ-2XWh;
	Mon, 02 Nov 2026 17:45:27 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw61-0000000HVVE-0rDk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:45:26 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-33e48934fa8so1091256eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641524; x=1794246324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TM7SxuLHSkIokTfxUi5Ea/8G/1rov27xpyXAoGZkTRk=;
        b=ML5sU7vc5Z04EjXgY1fnhsdhQoUtGde4KXmdQxnpX+8eBvdChR/Q/bZxxrpTws26DZ
         vWaLO+Ap6GRmf/OYU8apxjqjEQ7xwJR/v+vc05KH7emIdWMmQrfX4WfHk7vxSR56AjDE
         GGAbwJ9CKi0TxUQKKLKRpaG0HxW6ABqrxOEU3UI4Y2FoGLkrLRf3SkOaiDc/AANNB3A/
         wLpYO/hoIPizOTGSBjSaACTVL17HKhme5jTl5buL2/YL3SR2e6rGiCMPe2E41zHT4Dyh
         cN9hWaYlf6qv7XUIMMLvl3mBHSzacME/9tv2KSNvuWrjwqss4CXyEAxR3TExPHjQlyxj
         V/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641525; x=1794246325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TM7SxuLHSkIokTfxUi5Ea/8G/1rov27xpyXAoGZkTRk=;
        b=rAbTMFzHTByl85+KV+Fgs8xAxf2bHk9XrNYUt3e74vMI64X8lu/TbihF7SVzqId7yq
         LJYMsQvJjyIV7rlvKwTQBNofae/H+PdhuMU56IyzFLskwn/oXwE267WLZaizUGdh7OS0
         oW6FeUY1wkJu8/Whh3iKTGitMTk5CDcflWUe729bNhHv+qIR4+odND43CXD/uifLBPWP
         1kgjCWX8MDJT2s7DMsriNw9qEJVNJK9oUpiC5T0LosSYIf/dLDTiQqzfQ7+nULWPQLbX
         9MzyfeJjFRg8jWEoozo3VB4oCKBepEAShy5CgvV9QkDGkDbPBLSOCI15quBZfT/tNfQQ
         xYRw==
X-Forwarded-Encrypted: i=1; AKwUvBy/3xlf8i/dRCmfXTVuPyimdRl8MVqdJ6ifkStKZCFRnixjr8HmbSGWWgPad9fycBL/TnRmgXb6KDmvzKjv97fn@lists.infradead.org
X-Gm-Message-State: APuU4Z+XNL1scF68kdzluz+OPCQU958UPe9NZIn/YrGinJFWXQ0x7QZR
	nE9K2+8v7+aHQuYTx06i2PmM5YSXtSsrJMp6i2xhyX96zGaqrMjv7hjM
X-Gm-Gg: AYBFou2ST75hBsEvFy6t+q+huBxBRwoWzeKBi6SjGwOlu6m4WzRWNfeupFgL08VGiw6
	PDrMkz1oY2kuiqN1yFsa1V4qBrhnfcZHi0ziGXl6A1zO3AmA9YJC2wjqPmMfelpo7/VnHcZ9GZY
	VdoUvqA+ptNjUraF2qcGSwfoxZx2QI3xgnAz9oLsdkVnsspskRQ0pcvcoikS9wb7IeaN6yqABYI
	jgmZVooQjs3eNfb+FRPcOZzuQPXnxhgmR2C7o5ugp7Tg9vHGdTmgYyb5VjwM1bGQ7kJYyshbX19
	Zlf6lMeKbvmSE0dhzjeC/QgfCDrWYtYFQYilcx58Fvp0F4fBREsD5I0kQxhZKrFroigJ76jF2BE
	gZG6yIpWvS+3HV60ogHMKiTeJbCEb/20u1vG+UL4z9TyBI0ce20L9q+WVypb4EXLfIUkmlr9PIZ
	sgKcfFrQTDzAsI8Y/1dNfWU6zUV96VoqE5kMClFBlkVJVfnXgWhOIFjHpTf5NGTGcvCggx4WX1c
	wL98FKxL0PPDUzcY1tlF3oSvJxLR4mZVwHdynqIZp5kZo67QaZJwhIcX0o7E/L5EJPinu8tX/ah
	hhfnjcSHG8D128s1F8Xghu7WV7M=
X-Received: by 2002:a05:7301:4b10:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-36a424940d9mr16596225eec.38.1793641524327;
        Mon, 02 Nov 2026 09:45:24 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:23 -0800 (PST)
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
Subject: [PATCH v3 6/6] arm64: dts: rockchip: fix modem power supply topology on Photonicat
Date: Tue,  3 Nov 2026 01:44:50 +0800
Message-ID: <20261102174450.3000397-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_094525_262162_D6F6CDB4 
X-CRM114-Status: GOOD (  14.50  )
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The vcc3v4_rf regulator supplies the M.2 B-Key 5G modem. It was
incorrectly modeled as being supplied by vccin_5v (the external DC
input, before the main power switch).

Per the schematic, VCC3V4_RF is actually derived from VCC_SYSON (the
main system power rail after the power switch Q5013) via a ferrite
bead (B1).

Change the vin-supply of vcc3v4_rf to vcc_syson to accurately reflect
the hardware topology. While both vccin_5v and vcc_syson are
always-on fixed regulators without runtime GPIO control, this ensures
the DT power tree matches the schematic and traces the modem's power
path correctly. It also clarifies that the modem relies on the main
system rail rather than the external DC input directly.

Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonicat_rk3568_sch_20221116.pdf (Page 18)
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 290e3ee97c709..6ba70e5d9037e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -177,7 +177,7 @@ vcc3v4_rf: regulator-vcc3v4-rf {
 		regulator-name = "vcc3v4_rf";
 		regulator-min-microvolt = <3400000>;
 		regulator-max-microvolt = <3400000>;
-		vin-supply = <&vccin_5v>;
+		vin-supply = <&vcc_syson>;
 	};
 
 	vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
-- 
2.47.3


