Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0092A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KsmRZYHU;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C6ksuttI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pvWiGhrTNAzK7aAEaulPXx3JNKfuDMHI4rCQcPEIeC0=; b=KsmRZYHU6iJOGWkV5oPpnmkkcp
	6sP3acVZneu32bc1pFfinRt4nXU/JKGQBdLyUKb/7uk5syDsigjPFHLz/76sdlRifJ7Agw+D3t0aN
	ROMKAujprxaSMn/IXUT2sOxRx0Ba72dFEmKFzcQC4MIRYF+8hD4xrvEN4U5HffCA3kib+4+5qxhCk
	qD8DSQbiiJRwbWvYQNq0HvaFD4XSc7+IAsb4IydftjIu9c5RxW2tZRzYmtow/1+2Lf2K5dHFP1L8/
	ukWeTfarLUeNCqlbgrAzZ6ONKPplfb0bwbBtFUyW8SaBQo2Dk+7sJKalLFFxORYp2wojuJgP841Lf
	8V9Cig2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk2M-0000000BQAd-2N8m;
	Fri, 30 Oct 2026 10:40:42 +0000
Received: from mail-wr2-x08.google.com ([2a00:1450:4864:30::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk2J-0000000BQAI-09lx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:40:40 +0000
Received: by mail-wr2-x08.google.com with SMTP id ffacd0b85a97d-48b0a195dbcso28410f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 03:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793356835; x=1793961635; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pvWiGhrTNAzK7aAEaulPXx3JNKfuDMHI4rCQcPEIeC0=;
        b=C6ksuttI79qJhRaVnibq8IXqu27UBLWgFe/a/cdCPrUS034Rk7o74nuDSX21SDTMUE
         DsH2K72v6/FrL659jYKRzJI09fKlpq2SfIOFhP88MILLzWN4MvvwMzU4PooJFlAUicqI
         I0dFFBg3wJw9YIbOYHgKsY2mM7ba/I07jDx7+UWkg//RRYPxpJM41f7SniyhHkJpAH9Q
         OEG0AVrWQbJGwt86l7omCSmnesxf8DVF6o7b5DHHZXEyZXpGwuIAB8YubyG+rdX9f9pl
         bX8VwIv8u9NPskGUCZW8/jN+8zTsAo7XScnQkbEALGqPzdWUMPDGHg5QJNDtvODKwkX8
         t6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356835; x=1793961635;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pvWiGhrTNAzK7aAEaulPXx3JNKfuDMHI4rCQcPEIeC0=;
        b=Tv5FFFZtHgyWuCG4v2Iq2NENDiqGRtHAam6NqrLumsxNfpzunCANHUDvlClHz2SQTm
         xsTFOLIApfhnoHZ7SMc+6TgN7b1GjronaAOyx9r4vakrzYXNti+35YPIBy0tcsfS7YVc
         jg+UBMRmInUCO3twkNvs8lUfA3nEhyWB3B3D3GWuDUQvjQIqb3LrZVfKwKGJnAhonY/a
         TfaKOsSmlEqajKT/rT/oEZRWPN0xEhbwyBC1GeIHxP5X8NiuNj61Y610VBZ+jLwE1P+5
         681hFqIR43aGdVkdCb6GCFVHGfQ5joz0IdPp+79UBLgbhkWqe6wsTsNwk4slSz1VhgIU
         4KYA==
X-Forwarded-Encrypted: i=1; AKwUvBygv+N7n8ipeYcf2f6LWrnAIcjrdIYlrzFf3nDSo1NuHFVNLATcGMZpHSuPzOsCZTft40j/Yw8CHzPPyUvNwU7M@lists.infradead.org
X-Gm-Message-State: AFq9FYIBWwTeYQVCZ93USWBGBIn7V1rZ44llBT4GpSYqCNyLM2wc1J3h
	4siSBLFOtC9G/8sVV3J3+MEKiLfT4fQAJafqvNiMBuOBfi+NrPDGZnL1EGlXFhOUt4JMZmatKrf
	FxO2npoS5icVE
X-Gm-Gg: AYBFou2fr79S0dY0qX2xPsF9TZNyeVMAwc9xDPdBsMHN5aAUCgzHHi7VE/7Yud2tDdq
	RHa/U7ULLiV/3XGJMMeF62BdXqc7eQvQ8NUSG/yf5i2xZNUzAHUlriB+UmVr203ZrtppVkoFZXP
	D4qNxlG2fAqrpvGSKVP6VcCkLrANCdu1PN7u07XF0XDyxtxdwUrT0SoeGSsdI9Yu9X8NoSBgdXF
	lmPrj6pWw4ay1RPgNXXL8sQu0F3zBEJpi2kggQz1rkVcksQzGILjIodlOGX6KpLQEa/IQECHyf8
	ORrsmdmOJQkAWOfqjeMu18Qwa6rb/hYKlYWY6c2+icK59h1jsiIS1dj2Ddd23IMQViLhgxyihrO
	Yyb9q0wtYKo72Bl382+feyzHilHgJZQZeZdXSA1MbBwnE86d0MNzv+XDlr0EgWnFOniE+Pm9eea
	LHRPe6qtuVnND1cXloUjBBU2bncjcpYrEK8xUQPoa1RvqzjzkbSOl+UVreFsfxuHruOrhitrVt6
	PAtjSTGTv7QrcwyWjQBhx2xzmypBRkD9URYA6QVB1z6EghspclbbeTovKSkdzto3MCSZ7n9iKR6
	dtncp0KZCgqqB8Bq9tP1rd5vj2c/fUYU5CArAcB4ImWNztKaidj5c/DDSWTO0hYkmZ3loQhXk6L
	n6IuUe9nQgYoEvhQ/14jTN2Q4m0L7c+4MciF8bDXctsZrBE4=
X-Received: by 2002:a05:600c:4e08:b0:4a1:9c71:9f17 with SMTP id 5b1f17b1804b1-4ac17287d04mr43924345e9.9.1793356835493;
        Fri, 30 Oct 2026 03:40:35 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm128054145e9.1.2026.10.30.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:40:33 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 30 Oct 2026 11:40:30 +0100
Subject: [PATCH] ARM: OMAP2+: ti81xx: use non-scalable voltage domains
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-patch-ektor5-dm81xx-vd-v1-1-8ba90608c25b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBA0as0s3YSoKLoVYyLAoMdjS0B2pA0v
 buoy7f4f4NMiSnDtdsg0cqZ56lBHjpw4zA9CNk3gxLqJEUvMA7FjUivMieN/m1krbh6NEL7o7K
 Xsw0GWhwTBa6/8e3+d17sk1z53mDfP5nUuDB6AAAA
X-Change-ID: 20261030-patch-ektor5-dm81xx-vd-805d42b97bf8
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793356832; l=2174;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=fW7+0/WXEVB4unwZegY0rWJvXAG1+Sm+jd3ooJSV6oE=;
 b=oBDmhYYvqpRgRr++FtlQcR0z2LNcib+56DwS5KNiU4zDkyTp3TRXHEVXIBVFdwnKuwGqasWY8
 MfXTTatdE9LAITQKNQgQKdE0Sd1c2Jhbzs++0H3zLwYKN3G4EJQI+Yl
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_034039_121703_60C3698B 
X-CRM114-Status: GOOD (  15.56  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TI81xx SoCs reuse omap3xxx_voltagedomains_init(), which registers the
OMAP34xx/36xx voltage domains for every SoC except AM35xx. Those
domains are marked scalable and reference OMAP3 Voltage Controller and
Voltage Processor instances, which do not exist on DM814x/DM816x, and
no PMIC data is registered for these SoCs either.

As a result, omap_voltage_late_init() tries to set them up on every
boot and bails out early with:

  omap_voltage_late_init: Could not get sys clk.

Adding a "sys_ck" clock alias would only push the failure further into
omap_vc_init_channel() and omap_vp_init(), which then complain about
missing PMIC data.

TI81xx has no voltage scaling support in mainline, so, as done for
AM35xx in commit ddf536d0d7e1 ("ARM: OMAP: AM3517/3505: fix crash on
boot due to incorrect voltagedomain data"), register the non-scalable
voltage domains instead. They still provide the "mpu_iva", "core" and
"wkup" domains needed by the powerdomain data, and
omap_voltage_late_init() now skips them.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
This patch has been tested on DM8168-EVM only. It will affect also
DM814x boards, but seems that the problem probably affects every DM81xx
SoC.
---
 arch/arm/mach-omap2/voltagedomains3xxx_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/voltagedomains3xxx_data.c b/arch/arm/mach-omap2/voltagedomains3xxx_data.c
index e98a3f289c27..478f5eb2a17f 100644
--- a/arch/arm/mach-omap2/voltagedomains3xxx_data.c
+++ b/arch/arm/mach-omap2/voltagedomains3xxx_data.c
@@ -119,7 +119,7 @@ void __init omap3xxx_voltagedomains_init(void)
 	omap3_voltdm_mpu.vc_param = &omap3_mpu_vc_data;
 	omap3_voltdm_core.vc_param = &omap3_core_vc_data;
 
-	if (soc_is_am35xx())
+	if (soc_is_am35xx() || soc_is_ti81xx())
 		voltdms = voltagedomains_am35xx;
 	else
 		voltdms = voltagedomains_omap3;

---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
change-id: 20261030-patch-ektor5-dm81xx-vd-805d42b97bf8

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>


