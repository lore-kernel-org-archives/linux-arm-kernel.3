Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3700606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ppiOgzmS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OU96s+tr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZfxbEV1+fg5DL4WByiUrgmxcxFW2ZGkGENp2uYMYyr8=; b=ppiOgzmStr98KndQdUKGZBIJWB
	5dtbfhenOtsmvX/wMcWRu6PTCCXulfNDqrMP5s5H0GUj0A/bvNeJNE1/BgH5BdmkuesMX0Ge14yRQ
	4EfR+XbyMPqRa7oCevTMiUABif1OCMMI3Os2ulx+NkMj7nnFi+pQSgj81CFora80uToFZQVkDhUkC
	9lyIObXQcyATOeMQsg2KE8BkRLONw4AnjfnNmUdymMVBfTvgT+1T830AsfzDJrzl4ifX6pg5/q99D
	oYstC0eXHwjCwhiC8KQ4pW7yzjcDeEzKiTjbvLoLju9PtLJiLfeV5iaVrjJecDnYOumqu0On1ZyT8
	MhYJ9Ilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOufd-00000008SHX-3DE8;
	Thu, 05 Nov 2026 10:26:13 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOufb-00000008SGM-1CkU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:26:13 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso278211eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793874370; x=1794479170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfxbEV1+fg5DL4WByiUrgmxcxFW2ZGkGENp2uYMYyr8=;
        b=OU96s+trVIS8CraKnblZDgm6P3tR2KRDx6zObF/F6oViDKtflex2StK5Jx3X+DyapZ
         CCJty6cA6+yQ7eeLD7Yd9pSgeBCZ+Fx/jKtlnwSazP/ZeEYvmdiDTPPaM8LEgyG3NOoU
         TTMIvtCCKGWjMWkQSRvkbyFnnU2dQ02IFy4TrmGwZbtQrcKw85hvhMe8+pLBhLDLcagc
         yw5r7Qr0bSCpIVmHQlkx+LbuzrmVTdsh7GciGGnT21HZ0SH7lxHZcqqQcVFMuwvFuzRs
         DHijpTwRXzcwnVBt6/tKSwinR6N2XrQS2XPhltfRf7dOuFAsjhLcj1OCLstvNiizrUju
         l/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874370; x=1794479170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfxbEV1+fg5DL4WByiUrgmxcxFW2ZGkGENp2uYMYyr8=;
        b=UDS8ZzbuEdEOumwE3CsjQ5wrzcB7/oKW5nSBfjpjk6oWdyEZOkoZE9YiTM32wbs/N3
         ksZEwcOa0hiSYc20s633kxk/ObN0SOJ7i5rMxN4Tepd6oQRB3EbRzuRqplgTrGKsDo8c
         GlDuRBquFd0Tgl/Qh97CtlcVLc+2O/2DNHeSaHYDnr4abN74Zfe2ligCUM67uJxMCO9S
         2zE0x7bn9bvzwDgPWRz3ay8SVTow0KrxHtpZoCI8TbC1KbmzqNNgWIPz5OSo8+NJUYmw
         +KKkoYshVziuysc2ZmhAppu/4T/M2yzbyeznWC6HfEpb/KLxaSyHDkQZ3oKLJFHWvo/z
         wxTg==
X-Forwarded-Encrypted: i=1; AKwUvByr2nPzttZG31gNW9w1kevARqZ2AyHxAPy562yC0LJWcwxoodE/IpsBT5002GmG+3GQNf1GbYvDvsNN6PlK38RN@lists.infradead.org
X-Gm-Message-State: APuU4Z+CzyQ83LO2RHxJGbgWfS/nqjOdM3i+JbBHUtZofDeB/oWoBBfQ
	9f/nKPCDfjjuNE3Fc4RQZGUhF6gnxE7/6VjS3KxoywULROAsEa1WZEUJ
X-Gm-Gg: AYBFou3bi/rRR/unUSKGWidl4DJvk1wzHgqvqQY/ktbjAbuhHlodu8wn/ByXQF1yjzg
	IXqdckcBjE/iKW/DO7p7XI+mbPn6s0SmcdyQQNbB36kbe+qyc2BOG0ztTiYoAZ7gOT+RmeCQ/M0
	C6O1kcUAokThUB1e5dD98zaFy92s4pcy1WSHV5olVYDeX40wTmtRbdPlDkd5LtYnaskZckwsHbf
	Ped6yi7Tom7doeAPdK1u6WPxH5N/ScKJiEOpj7MbTCCvV1lEeKqJWu9sYo7tSCnIuL9AKa1D7Is
	YL+lsZE681Xk5UApgYvBJppvQehbagx3NfOnPwp7cFXyaU9gf3SiVvnteQzKUTiZtNLaar7T1rg
	kv2oWhWCamPKTa6oHylEKtFbse/vjodl3mnoeFN79mj1lRnBFqP74Hk3GMZuVV1F3JYKrPHzaed
	UfW/iD1FgWvWESTkMCN+6VKd/31IX7YHfDDL4DxVkqmSkvj8P8XglPYXcclm2qqCd4TtHZ5P9Ju
	t/YE/9F1B9oB1MCWRBA4ELbOJ1mG/pSIIj0L9WQXGa+i+vMUZ5u8SqJk1ur1CBtJzkzperdCPpS
	1CZ0AeShuepQ8r3LQm/ua3af86PoapxeZS41QwHhvGWR
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr27765980eec.17.1793874369763;
        Thu, 05 Nov 2026 02:26:09 -0800 (PST)
Received: from aaron-m75q ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36e194f4633sm6253335eec.11.2026.11.05.02.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:26:09 -0800 (PST)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Thu,  5 Nov 2026 18:25:56 +0800
Message-ID: <20261105102556.1365-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_022611_338493_7B932DD5 
X-CRM114-Status: GOOD (  18.17  )
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

Contrary to its name, vcc_sdio is the IO supply of the SD card slot: the
schematics route it to SDMMC0_VDD. It is listed as the vmmc-supply
of the WiFi SDIO node instead, and that consumer keeps the rail from
switching to 1.8V.

The WiFi module's main VBAT input comes from vcc3v3_sys, and its IO
supply stays vcc1v8_s3.

Fix the supplies of sdio0 and sdmmc accordingly and enable SDR104, which
now becomes possible.

With UHS enabled, sequential read from a 64GB SDXC card inserted after
boot goes from 22 MB/s to 60 MB/s. WiFi remained associated at 5 GHz,
with no WiFi errors.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
Changes in v2:
- Point the sdio0 vmmc-supply at vcc3v3_sys, the WiFi module's VBAT input,
  instead of dropping it (Heiko)
- Rewrite the commit message (Heiko)
- Link to v1: https://lore.kernel.org/all/20260922055011.14972-1-yaozhonguwl@gmail.com/

A note on testing: with a card in the slot at boot, the first
initialisation fails tuning ("All phases bad") and the card comes up in
high speed mode, as it does without this patch. A card inserted after
boot, or a rebind of the controller, comes up in SDR104; the numbers
above were taken that way.

The GRF io-domain device binds about 250 ms after fe320000.mmc here, so
SDMMC0_VDD is still configured for 3.3V when the card switches to 1.8V.
Forcing that GRF_IO_VSEL bit to 3.3V with the io-domain driver unbound
reproduces the same failure on demand. This looks like the probe
ordering issue Jonas described for the ROCK 3B [1]. It also happens with
SDR50, with a second card, and with sdio0 left without a vmmc-supply as
in v1.

If you would rather not enable UHS until that is solved, I can send the
supply changes on their own.

[1] https://lore.kernel.org/all/e9ff5387-b3c1-41a7-b251-a12789d25a70@kwiboo.se/

 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..fe1f8d7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -777,7 +777,7 @@ &sdio0 {
 
 	/* Power supply */
 	vqmmc-supply = <&vcc1v8_s3>;	/* IO line */
-	vmmc-supply = <&vcc_sdio>;	/* card's power */
+	vmmc-supply = <&vcc3v3_sys>;	/* card's power */
 
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -804,6 +804,8 @@ &sdmmc {
 	max-frequency = <150000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
+	sd-uhs-sdr104;
+	vqmmc-supply = <&vcc_sdio>;
 	status = "okay";
 };
 

base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.55.0.windows.3


