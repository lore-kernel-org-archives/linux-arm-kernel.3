Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC6960A2601
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 19:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qDdjgltA;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1rgwSRL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=; b=qDdjgltALElp1y
	TrwJcqu+VQkGWSR6TRMrRrQw4fdDSZjSgl2VaSrSzuFzZxwBzzPHSjruy2TFPOWP6OV3PHKKMNwwf
	4Tb/6QrtmFh90Mnk2RB53QN+dp8styxM23Es9C1k+ZA7xNApeWBeH5U53c2YR77W0CazdmD33Sb6k
	6GKa9PgS7J+adyGb3CMe/WhKeduKObyhcmbxNLFvtBjXS8Yn7neqiflNctdewHRrh0RZSJPYt1Igc
	ByiJwWDYL5m65Z3mWnF+ZXEEdER40QbrCWXoNdAvUTaxR9Pc0AUTAVHUH4zJDaOWZYtz8DCIl0e2J
	dqcyvVuJHkI5JfBo/zJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbFM-0000000EoeM-1jP1;
	Sun, 01 Nov 2026 19:29:40 +0000
Received: from mail-dy2-x0b.google.com ([2607:f8b0:4864:36::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbFK-0000000Eocj-1GjF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 19:29:39 +0000
Received: by mail-dy2-x0b.google.com with SMTP id 5a478bee46e88-369fd8abd71so2551683eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 11:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561377; x=1794166177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=H1rgwSRLd6JOJcu0k/N1aCmLe1RkB/fG7U/2v2ePVXf1UsDTLh1d11hCVcVN1WM4n/
         St4JWwmuuxF+76dJg3OtUTyrVqPSmlD3OS+ViNt76KL9DtzviKXYPk1GzhRQHt/Z1yRy
         ei3wYv52CkRtRvnso8uzIl/3Xjhcd1/An35Qb7piZYSlXzWQPKA+xnwVegkkssI2qL/a
         4XV8ZEvSTzv8p2Df3jDB9Bdj1qSYgDd2fbvaohJr97KzhfBtsPbwWgZnNr8ez9RxLtS7
         eY5tN57ymcnXu23qYVR+FwvyeQ5q5FmHS4SO3/ont2hAj6SRLJHJlsXYgvC6OQp5IIGF
         MYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561377; x=1794166177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=oQN8mpxgTH3f1Km0D+3PLiwqNI6HKI8DHxzthDqjkQlXFYeD/aXIe/AAUxrwx5uXLK
         sSL6hDbzEVZlAUroONmECE7hnIj27crpAvwTTNTXUEKK9Fi3oluXsKYoOnvE8nicaM+5
         wXJxLZDtNJt076wYSZLx+kLX6Z3xruasm894BpWYffsvgg4ctNfi3sYYdwu1heHJT2zO
         aEUtDePu7YQ3DViSO27Gt9tbSTwMmuddr6lxU1cnl609e7jg2meEoeoZ7GuR6kN6AEeH
         M3PaBynYB8Xutep2RPxE7XADs3ZmmvluRBDsHDAcpv/mWnhV+PnPCnT0nSb/SnqGZXYD
         B/pw==
X-Forwarded-Encrypted: i=1; AKwUvBzX8JZqlToJKhL5sWiI5SddFLeGic8h/YfPuQ7AknPa1WAFe/zwhYjVkOoNd+6FxaDxmSKTCxh1dUl0/kVe9OFb@lists.infradead.org
X-Gm-Message-State: AFq9FYJHptaAybgEAI3aAq4N2qinGnklc8G6MCuPU0r1IHpRKNpaLLcm
	uqMW8axj5QShEhI59CG+SURS/ze36D9ZRRIq+bL4hMNNy+RTzaIwc87g
X-Gm-Gg: AYBFou0MeHYNt3n8brhj9BqO0LXV/NpIQpN5ojVH1z8iCyQRguHeKixdjSzURD7ASjO
	fk8l3LOy0iyc+mB11Fr4RVm7AAvitzndq1LI5JPZQtdhd9SKpa9ErsW3tIOxLAFYl+Zx+m3CCio
	HIhYUm7IF0DKZ6EzUNu3AMKedW157CDcJMhX4fmrjnpI5FJFRKsbY2pbqyLXfkQ14u466KRqcbK
	iHohRtoMOAXXP0F1Ya237WTA/O4VunSrMZ2t0ZjSsjzfEvIFIAZ7UKkVCM/xJ06NAtNq0ZvadEA
	h/FZ4ot/n0slp81h6SCR/rQ4tNmYrHQEvJAHKb1GtWz7yA5mxWqde70gQ8cKXFbmc8Q9x2DCF9I
	nsVG/nbp27S0QtESBLixi9yp3S1+7etOBYnx3HFuwcuKW2MqTo68DDrgZHvyDe0HoL6bKvhu3AE
	zeP45h/YLL2C8zls8fBhP2zsyY+a6YxkLUU0s0oGnXLMwgUqANzKjzdl7Y73nYaVA2LqH+NWa0A
	3PJo90mDOfAxq8BuW+50Fr1Gxhpl/1ZZbBOZcf4S9w/keu0R2VtqJIg7Kw1YABiX3xS/jGrpWUm
	xJy2DAEWW4IjhzzyIQVuKxb3Os0=
X-Received: by 2002:a05:7022:b0c4:b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1af2ba7e498mr7041623c88.3.1793561377291;
        Sun, 01 Nov 2026 11:29:37 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:36 -0800 (PST)
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
Subject: [PATCH 1/5] arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
Date: Mon,  2 Nov 2026 03:28:03 +0800
Message-ID: <20261101192807.897562-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101192807.897562-1-coiaprant@gmail.com>
References: <20261101192807.897562-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_112938_368432_2782C487 
X-CRM114-Status: GOOD (  14.31  )
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


