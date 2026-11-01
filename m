Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D61606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 19:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RSoxHAPx;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KVOx7kXl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=; b=RSoxHAPxCHqTYt
	5XJwsTapDNgtiwPqhP2Mi1U8d/83SSL+KBLUxnXR9gyma035jw53xWmPg8jJsOwIPCIihuMU2dhKd
	1QmFr+Bkn7iyTvXlqe3fA03Bn1P1k1xgv2mMt1nkC041X4D890CP9ciFzIwh7nA4M1zAgWGA4LvtP
	3kpUqXKl1N0P0e1r1fembn0nicVFZvZvQeZzqtwxpDelXrU0KHaU5gt1zWOkbnzjaaQohph+sz2bQ
	90MCx2DVfqq73IPKyWNHhPIy2n25z4YtNyWoF1eRmzBHPapObiw/cLomJ+DUt6ZevsvGFauQwK6wm
	hNtJqGW5wMESKQsne5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbFZ-0000000Eoud-3mq2;
	Sun, 01 Nov 2026 19:29:53 +0000
Received: from mail-dl2-x09.google.com ([2607:f8b0:4864:38::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbFW-0000000EopV-2yE1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 19:29:52 +0000
Received: by mail-dl2-x09.google.com with SMTP id a92af1059eb24-19305bcb6d5so598377c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 11:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561390; x=1794166190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=KVOx7kXl+4bahNHU+BrrVn4xNNDd/8d8XPqJuXRjprnPtJyXsk9KNjhgfGxSPWRkoQ
         /ih93wFAf44uejnk7g2OBfDi3xFc/Q4GgdpzBd15Hrqj2LLOxUfuTFq4cmky4gbhIZrJ
         /M3sOOEE8vXGH/X+UgtQcDpnWbq8Yq0j4kIbIYqmH9ldXVXiAeVZWxr4XciamMVm6P1B
         YSf5HD8kbcpYbocsK07fe24N+Zq778JLo5/a3fZfx7aVjqNmyrGpf1pND9PIZTRMwGVM
         gCVo2fc5Xkh0lxYG57H9WQJvVI+zdBHczisyH38ccXFBHOBOmPNJ88+kmgGBIE7qocsW
         pLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561390; x=1794166190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=WoE2TyTyR40LQXzTd1gyidchTjyY88S09Y96tnMHR/K70lg47LjiDSrGL9WpUN4jHQ
         Vx1pKiWOu+AkZcUaSQalSL0rIF7l3OpIej04EKKVQrSN55ouoKIOl3lP8QtDS/Cf2Azx
         BCbE3vqZQ4789ShvbwVufkCX0Lk000Z1zkqxFxz1oJFs7sKaOfsOFqPYsOfmxsAO87Wm
         PuE4CSdyJb18Jd2KALaMCYLOzE/7hI/syuUmn2+J52JqMZZHkp3xJmI6hOUxWFS4h/BM
         gbe87IbVqEkY7oMXwyG9qVjnaLExcyn0xyNkGIeNyUDfropXTAq2SmovCVQAB8nUDv/z
         MQNg==
X-Forwarded-Encrypted: i=1; AKwUvByORXc3Au8/aBClVIXebuzPxrVcIbcpzaSVlbY0UAbf4tgKIRdoYEOKJMbpI/fJG7WAZAOw8MHtIeCtt+azble7@lists.infradead.org
X-Gm-Message-State: APuU4Z84tYtFXgNU1qYlUYrsG0/l/AJ4aSGkfhSMtSwMH/DpzDpVXjW2
	uDVrPctZwi+8DgwQQWNgCpF+vk3mI3Hxd9GItcQUv1+RJ4wVvdNdlU1m
X-Gm-Gg: AYBFou3S1hxcI5G/gnEqEph727SIMQ4op55UDClOPS3PAzhOfV7zFTiixHMMzvRZAMg
	NKvy6a/G+zemXoKv3FenH3gBbpt8ZxQSgigG+PJCprwo4FeVVMq97pUOVS7y+1Bk1KIomP5OYjG
	3BIYlBAGjAd2f+6G2uy93mEqy4CUHo8Qntjr/kq99kfAhJCZiu6sRfOu2GZGVBnxNnkvmMawsgY
	c10OyUqqng25q2wNmwiv0mx0eOCSXDVGde53FSv28nqf3CuaJvzs5mZ+gcuzPHiHni0+39KFk8O
	NjPIRVJVS+WS+A9QwjkDvohrWOOZhNQJxaC2A/uSbqGBBqgoJ8utruNP5cQELrZVmJlrNDMM//f
	baEspQV95FOtlKZz0fY4xRLqtlufrlRWmplVurZuxMsbVVpK5Cw6htC+VAT5k5KX6OTnqfrDVC0
	xXbjj10LeEzrxs2+ZvX38IhJHxfspRA6mH9GKNNjalXl+28XxdBZZVUEc/Ws83DDbcDbzTUGqWY
	pgzmOpr6yGL55ytgUK/gomG/839bHWA6yMilFa3z25XigPAoKLVbvU4eS8xVT2kvaABuvzoI2Fa
	hST/eZyGxZWgl/SLW+xPuNNTdYJE
X-Received: by 2002:a05:7301:1828:b0:36a:10d:afab with SMTP id 5a478bee46e88-36a42423d10mr13381248eec.25.1793561389745;
        Sun, 01 Nov 2026 11:29:49 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:49 -0800 (PST)
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
Subject: [PATCH 4/5] arm64: dts: rockchip: fix GMAC clock parent on Photonicat
Date: Mon,  2 Nov 2026 03:28:06 +0800
Message-ID: <20261101192807.897562-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101192807.897562-1-coiaprant@gmail.com>
References: <20261101192807.897562-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_112950_768967_B3149E14 
X-CRM114-Status: GOOD (  14.76  )
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


