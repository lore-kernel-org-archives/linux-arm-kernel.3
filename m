Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936ED6078737
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 20:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=byOTFE9+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XT7VD5Ey
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vyp9Xg+NZWPDImO3yojecGwxOV8bju04kpo6ObDJXdY=; b=byOTFE9+K2ABgJETBL2U4txn0y
	XKo9PbNtQB45xf7PuvkY9g8OM1FGrHZVwbo1TGj0MYsg6SNhZ/GMEZIN76wYPPB/JBvsn7Bh7NFXX
	U9KUoEk48DoB/4DRv7OJtP2f0hFEBa6Rht4EkSssjilh+c/sWY57YTPrV0YRLcTE6qJJiC8nKNGVi
	uhhw+SPDZHiNR666J/JivcgQh7UFAhndjyRIjDczt8A1USLAFEUikacwsJghpgCu9D+If8RG4j/EP
	d4cGX0HR3ibg/O7Vrn4Sr0zr9Dwe6oQOegll78eNRzW0sOCHNMs7wR2mQEeqSj4rWUr1umz2kiHbr
	+ztQrtxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOi2H-00000006xYg-16kg;
	Wed, 04 Nov 2026 20:56:45 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOi2E-00000006xXm-3cVs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 20:56:44 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-70b875f6f1fso1076591eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 12:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793825802; x=1794430602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vyp9Xg+NZWPDImO3yojecGwxOV8bju04kpo6ObDJXdY=;
        b=XT7VD5EyH2MFaKdm/76bhPTgLW2R6S25KNlJiL+b99V6cPzMudainS3ojzWesHBKZe
         yAE+xUROMMf8V0HGmFbG1aLqEi42Nf73RWcOjEpy1/P1mCbtPzQsDAmGTiljGt/3u/Pf
         izwrWvkW41JEfErrXtPecF5I0TON/kFjOqe9EY5aWZwl5h+5Lzik6Rlb1//onrsqn9Bg
         2vEPb5ZXTq8sPI8G1hg4lrmeLspd9fndFXrfXNbhFDXPMKGCda1pqWFyzjfKuJGd43rh
         t37AYYiVIhED7wQ3u8Nmu8p5FPUhuyifGonn1YXL+qAPOUfIsQPqZK5LiJZ44P9PzT0B
         3B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825802; x=1794430602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyp9Xg+NZWPDImO3yojecGwxOV8bju04kpo6ObDJXdY=;
        b=iqPMZn3Olai8WoN/TBuWqAslzOjZnHDMuQXg2w3p+JdAk3w83aTFUrYqeZtlNpBbyK
         WQKDsbB6lRYow/5gKEXrHM38Uth5m9stf2QePipKjTt72jePUWI6MLdgmXjOEACXj/a/
         HPk1nOF0XkqUCey7+XHvwdK15HIcHR222BUMkvUCIH5x4YN7/9cT6SzW8lYCSEW3aGH3
         KpFf8VhbQuY/ofWuQ8Bo7pNycTjEBYFMOyvCkM1g8+YUk36sPbHJifKHdSGaJQOHc6aV
         C7rPq4aEB7VC+TRft7N8Me8/SbGz1faVMzqg1jSI/t8Ke1V8O/kaHjUuZevkU+R/wKer
         boUA==
X-Forwarded-Encrypted: i=1; AKwUvBw27fyqCqAanoa7BjcO7jXyhmzh6GU+Rzzf+8UdqLabnUPs32AsL0dQVSMjBwolwzEL2nv6SMCnXYUB5YYdmsps@lists.infradead.org
X-Gm-Message-State: APuU4Z9593xqscw+K6TfmSqBy8tpWWVkx8GrPEnPOP+44Uq/DPw1Mtmi
	CovSOt4WmsZtKZuQa6Cmex3eN9pH+5qT0jxpEtbVH36JYfP1zJnAeric
X-Gm-Gg: AYBFou00Wk9HSd5GJcunH6RS1KHdjLGIfCgKMbM5Ca93/X61aUpfXhwNuGf2DsRT0Rf
	EwH1/EgFVYQPqVyMWNOgmkzztrG2fh+mmTRfzcb25k+C8crvH6B52LUdw6a5HqcJDSP6YzkJAJc
	DdwYcNgFpa4nAJOYIaVLbiGH/TWYgmBah2QvK/DzSyNYJB4ODuRm3hCYoPYmqb6EzwbUJ5MdDgS
	vJ4m2FMNDj2hRVhs163r0Bl+vFtsHtGrzkIDWgm74qYOGLqEwam1QX5N2L1P5zvuHhyezJn7uhG
	3Yd03IiiaQP9L3t/bkBcdrmVcU8u19YcubzPESSUElBPhf4kxpWHRWj9QONDIMzBF8Epf5B+E2Z
	kqLmI7TttlGTl7LsHJnYxg9xI0TaxsZz2A4ED0aElx+M7e07LOZGbf/Ypv9SxYWdxjXvripd+5U
	jK4vRDPF0GsGyIklVD59faqhqc2TMAwfS96nl1NEXUDJKFRlQjGa4Ah6IoHcoBYg2N1lcrWoHda
	j8sO/cqdCAPwoGiPpPi1+02rYfJEHMjmC1VDPikIN0grnth4gS8ftxIwIWWOketvlf4X3rOXUk4
	++M0pxXTMBV8CePkKD8ElXZzaLSbWul56gd+I27WiJ40BaNF8vslhKBhZEjj+L8R1bGRQ8o8PAY
	lVu8=
X-Received: by 2002:a05:6820:4082:b0:70a:c89b:d12d with SMTP id 006d021491bc7-714f24f9d20mr8969903eaf.11.1793825801586;
        Wed, 04 Nov 2026 12:56:41 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c12529a1sm2620150eaf.5.2026.11.04.12.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:56:40 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Wed,  4 Nov 2026 15:56:39 -0500
Message-ID: <20261104-a733-pinctrl-v2@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_125642_916748_482EB40C 
X-CRM114-Status: GOOD (  20.41  )
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

The A733 GPIO_POW_MOD_SEL voltage-mode fields are two bits wide on
both controllers (A733 User Manual v1.00, sections 18.14.6.1 and
18.14.7.20). On the main controller, the one-bit
BIAS_VOLTAGE_PIO_POW_MODE_SEL handler writes bit N for bank N, which
is reserved or half of another bank's field.

Starting from the vendor firmware value 0x01155550, a request for PF
with a 1.8 V supply sets bit 5, changing PC from auto (01) to 1.8 V
(11). A request for PK with a 3.3 V supply clears bit 10, changing PF
from auto to 3.3 V. PB is supplied from VCC-IO (A733 Datasheet v1.01,
table 4-5), whose field is at bits 25:24, but a PB request writes
reserved bit 1 instead.

A733 R-PIO has SEL at 0x340 and VAL at 0x348 and nothing at 0x344
(section 18.14.5.2), where the BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV
handler it shares with A523-R writes the A523 control register. That
handler also writes bit N of SEL inverted: for PL with a 3.3 V supply
it sets bit 0, changing PL from 3.3 V (10) to 1.8 V (11).

v7.4-rc1 added A733 support with these handlers, so the writes happen
on the first request of a pin in a bank with a vcc-pX-supply in the
devicetree.

Select BIAS_VOLTAGE_NONE for both A733 controllers and give A733-R its
own descriptor, keeping the A523-R descriptor and behaviour. This
leaves the firmware voltage modes in place, including any that do not
match their supplies. It does not implement voltage switching.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
Link: https://lore.kernel.org/all/20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com/
Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Cubie A7Z
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes in v2:
- Rebased on v7.4-rc1, which added the A733 pinctrl driver. Only the
  context of the A733 hunk changed.
- Dropped the old base and its prerequisite-patch-id lines.
- Dropped the AI assistance and Assisted-by lines.
- Added Vinicius' Tested-by, from a Cubie A7Z on Linux 7.3-rc6 with his
  local A733 patches, applied with a context adjustment: warm boots
  only, no cold boot, 1.8 V switching or A523.
- Added Fixes tags, manual references and examples of the bits the old
  handlers write.

Andre's RFT [1] fixes the same bug with a two-bit handler and changes
the same A733 line, so only one of the two can be applied. This patch
uses BIAS_VOLTAGE_NONE, as Vinicius recommended in that thread, rather
than an AUTO variant: manual section 18.14.4.6 gives auto as 01, but
as 10 for PC/PE/PK, which the 18.14.6.1 table lists as 3.3 V, and
there is no evidence that 01 is right on every silicon revision. The
cost is that firmware modes that do not match a bank's supply stay as
they are. Andre, if you prefer the AUTO variant, I can rework it.

[1] https://lore.kernel.org/r/20261013142351.771229-1-andre.przywara@arm.com

Tested on v7.4-rc1 on a Cubie A7S with vendor boot firmware (one RAM
boot from cold, then a warm reboot), with A733 CCU v6, AXP318W PMIC v8,
the sunxi IRQ-bank v3 series, the 8250_dw changes, my A733
firmware-clock patch and A7S DT v2 on top. The main and R-PIO
GPIO_POW_MOD_SEL registers (0x02000040, 0x07025340) read 0x01155550
and 0x000aaaaa in both U-Boot and Linux, and the PF selector
(0x02000070) read 1. The PMIC regulators registered over R-I2C0 and
MMC0 reads worked. The readback was taken before the unused-regulator
cleanup.

The main-controller value distinguishes the handlers: MMC0 requests
PF, and this DT gives PF a 1.8 V supply, so the old handler would have
set bit 5 (0x01155570). An unpatched kernel was not booted. The R-PIO
value does not: PL has no vcc-pl-supply in this DT, because PL carries
the PMIC bus, so the R-I2C0 request returns before writing, and the
old handler's write for PM (3.3 V) would set bit 1, which is already
set. Vinicius' test covers R-PIO: he added 3.3 V vcc-pl and vcc-pm
supplies, and also read the registers after the unused-regulator
cleanup.

Also built arm64 defconfig with W=1 (GCC) and the changed objects with
Clang. Not tested: 1.8 V switching, A523.

v1: https://lore.kernel.org/r/20261031020640-263f7b05-a7s-pinctrl@gmail.com

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 20 +++++++++++++++----
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   |  3 ++-
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef1..1cfd81184350 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,17 +30,29 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	/* A733 has two-bit voltage modes, without the A523 control register. */
+	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc;
+
+	desc = (struct sunxi_pinctrl_desc *)of_device_get_match_data(&pdev->dev);
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
-	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
-	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
+	{ .compatible = "allwinner,sun55i-a523-r-pinctrl",
+	  .data = &a523_r_pinctrl_data },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl",
+	  .data = &a733_r_pinctrl_data },
 	{}
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..d4b0a40525f9 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -24,7 +24,8 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	/* Preserve the firmware-configured two-bit voltage modes. */
+	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0


