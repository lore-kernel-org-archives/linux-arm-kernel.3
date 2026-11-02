Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F354F6096213
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N7oS0Tgt;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvuhwsrS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=; b=N7oS0TgtPrcfev
	IjaqOFlsuxnz/7U57oe253PHDmjcx8DEc4xmlCCGYsjZq94gfvqxL4k1QZ++ZnRC3GOIg+JdiXXd5
	kLbg7cIn+PwcyOAdY/seUAG2yu1eJYp3ZfDfRFuOrk0yXE02j983TzcIP6iBQzsh3kP/mbggDsF5Z
	M/iFQD+RI83MF7kriW8+xXW1A324FG2pYxA8shfkUuDpcgxFVrMZdhvs5w6pUKc0mMIDuG7tRiGJ8
	LhytT4lXWtGeQfFtEmuuSrZaLtH6Vwv55En6dEV1KByIpweXgbhEU6ZFpB+j0hIarXvy5PG2+a3hz
	fCQhDnu+s0N/xULwAGOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgj-0000000HQpr-1pAP;
	Mon, 02 Nov 2026 17:19:17 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvge-0000000HQks-3UTq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:19:16 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36a1947498bso2081971eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639952; x=1794244752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=DvuhwsrSMyy8NP93gG5mzc3CLxNQAppZDfGeEL0exrGI/8kf+HwUebaguyd7VDwXKO
         7NdtDv7aPNa0mX/qSMVTXzjV/moTaOis2l4yXxaQygrTUQ1pduIu721PdkOHHao9Fv8o
         7qp3oUwlVFJdQOqrxQQGWcQBFa1K6fi4FZECYpnHGIt0xCfd1tFqd6HJiyfSwekYub6C
         g7CTd/Irxu0v4vOjQi4hWlyNvRmB1p+cG9S+nUY+C1I40Ng9IIOEu0cfc3xZ/ZQOm+VN
         zdOyW0mhUzmMHshQHcOM1z/POpOmWxJUq15kFggxrJUSROSjKaivF+LM6MW+hjfNlsP1
         NobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639952; x=1794244752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=ui5ob9VoASUApWMCfaCZWoI48YbF4WblPYReOuIZJ3OvWLVQqQSTcqvlxaJRbUHF4u
         LYWmka7Ul5xaxavDgP9TBD+q67vFdVW8WIcqA0ZX/EWPDHg2uRcZvRTs2QLByqdamCi8
         8r/DPtaceB22/cTwvN1rXoxwotFMwzVtkSLUfM9LsrIRIkUBUYC2Qy2bGkMvXdt9+rrf
         MPTjJ5XYAupCVdhcnjFsQKsg6XKkG7RU6ubfAdIXKYa7DdNDQgo+E2UBxFSbKcsB+iCY
         ANgxa56CI28SEp5CJZ4WE+E4ZLXgV4SZTDGt8X/tEwSRpEbqjcXf1KUhMFGldJnNtT8h
         7qsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+qn/oF77hRBt7DnE0ia8a6oMc8XpLV9BbdqRbUYQ/D48eb7ZFg4Qjsbtvo7m5wdhvxLFPRBoLZLNq186MkHgW@lists.infradead.org
X-Gm-Message-State: APuU4Z+gpDnUo7GpeiB/zUVzxdfFrCYhfnpdzP1m+v5tmigQQ9TRxJKg
	yJzYmYMFfjCh8uBLT6FwfRqW/DM1wv6sEVCyI2c+rt8Mqq0hh5O5MBWH
X-Gm-Gg: AYBFou3lwARYmjjwWUCrjU4DR1mVK8mrqn/5TJLo8Ec46hAf8vKwLy6bA8bI/kLx5i8
	+YmpQTUCp8vyL5LRtEZ5xLtr5K5J2VsjVs88AyzucIO/YZy+hq4tcDfHwf3mAD1mjSyykeSAaDg
	ar9esK4O1BGe8K/vfhOYHlfg4CyR7ohfW5TLD/xN59zqqiefKDAXLH9P6zgVdvagwzNc9Lrj73F
	E9G8vSqM/BNx1cUKspYNLjkAw4WBbyzCQFY9eom+L4Jg34bS9Wfc87kongR8cS0CC7sPngTbWjz
	DIY//Vaz4YZnUUJnqBb+zD13tV0TEMnrcX523HrgJ0/tN7nVovBe3n0/0KDSU2Q0JYcZhH9XkMU
	GdlaMwa2LTOqJLQ3LNuk5kPl4cPYLXXVJPjo+/7PR27N6QZasMv26UWbkuIGvmRn4EBWrbQ8PTO
	/q9MIoqhqfKyeih9Yeogt2g6+wYZL5mhKCfU/OXupq/pMIaRV+h55oUxuiHp1fxkE/+6hpdW3ZP
	m4ZdSRoMvW4553ZxPV1YeoRXTBZnbqMkLyme5SWZenWaevfpcekmyWrbnF99tXHm2JUG8vxK8iR
	qBuWvqT45sBvUo4PXXkbeFQw6IA=
X-Received: by 2002:a05:7300:4717:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-36a423f4253mr16154942eec.32.1793639952051;
        Mon, 02 Nov 2026 09:19:12 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:11 -0800 (PST)
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
Subject: [PATCH v2 4/6] arm64: dts: rockchip: fix GMAC clock parent on Photonicat
Date: Tue,  3 Nov 2026 01:18:36 +0800
Message-ID: <20261102171838.2958552-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_091912_872753_16046211 
X-CRM114-Status: GOOD (  14.70  )
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

The RGMII WAN port on the Ariaboard Photonicat uses SCLK_GMAC1 as the
GMAC main clock and SCLK_GMAC1_RX_TX as the RGMII speed clock. Only the
parent of SCLK_GMAC1_RX_TX is set, so SCLK_GMAC1 keeps whatever parent
the bootloader or the hardware reset left.

Set the parent of SCLK_GMAC1 to CLK_MAC1_2TOP explicitly, so the GMAC
main clock always uses the internal source and does not depend on the
bootloader state. The rate assignment is unchanged: SCLK_GMAC1_RX_TX
keeps its rate unset, SCLK_GMAC1 stays at 125 MHz.

Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index b719d5b661c43..7e0a2ab829209 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -285,7 +285,7 @@ &gmac0 {
 /* Motorcomm YT8521SC WAN port */
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
-- 
2.47.3


