Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA770606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 00:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5DRK4pdl;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9iXd6zb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCGg/CTtREd9dJsEJv4hKhUFTdHLK4OwgXYqQ/u+uQE=; b=5DRK4pdl5lEWKY
	+AOrMS9tPR0jcKhcF3qM3TuPofMdBjTtlLl0LXiklZBoBgSe7N6I0k+8wqv5s//AUaOaECdqW3ATx
	42WGZ1t3LbXmJar/wU1llYtb5x7SD90rygn9XvBAjVxJlx2FwJ34JjoFlK040hC1C3yBtktmfePIo
	CF/CQklmb63lKqxr4fUMr9Q/e9xQZ9DGg6+FhsayhaDp0MgXtnQ/8TJjEN5OVADfCPKiiJ/Sjcy5L
	HG1WpO/Kc1EAWGxO7hzu/lOiNFXQS3PWbrEaYHhuoKXB4zeaVWpqQzz1Uw0Dzes6hzthjQa1cVuCB
	9U9GuUAWRBIJPpNwqKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIxJQ-00000008Yt2-0Emu;
	Tue, 20 Oct 2026 00:02:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIxJO-00000008YsQ-3hb1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 00:02:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ADCD43FE7;
	Tue, 20 Oct 2026 00:02:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792454558;
	b=BNDRQP8a3Tea1PUMhDOKqdrQwyG/6VR8G8/W182UNemPRgheURA2CSy5DAKOzjfPbb7p
	 YRhEV4mkxIqVYqZ0vLpEzr56e3GFZfAKJa9XHeOYDkr/3LSJDyft0bl+EWUd6ubNjqKsv
	 a7jV9E1lx5l3yMEpR/w3Uv0DlzdxfQ64+A6YjvdXGYJvfbAt1kZ33ScD+QSe4aPiuCK00
	 VT+u3HALxDj5im1kuWCzUrH6RDHMRd65hEkaRAQJzps57t/Bpi/HkJp8CDryUkj6BGVlY
	 eo0ZFo7LSm8Vogav/f4rWlYZjjuKP7o1J83GpPBRJTQvn8S76sKn0fAZ+1ZudECtrbw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792454558;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eCGg/CTtREd9dJsEJv4hKhUFTdHLK4OwgXYqQ/u+uQE=;
	b=hzC4/TC09GvSdRXYK+Nbud1Ly0jNOlqf7odToTCp7xwAJhJ5pzGKOSwDDpwjq3vp180E
	 wbG7UxvpuwVz9myAfT+thzspPJ+vVYO0TCs8nu1v8as+Qd4l5MEBpCxZIdY7mvtXsz4oJ
	 Qi0l99IR6V6nlooWVuTlyy/XbseCWffirk/uzKCZ/V3pRHWM8HawHR6DW170d0JGFHsWz
	 yNUlDxAwgjDABi+XVQriotMQG56QtrasoGoH2rjweWFDoH25RVYibQv+MlGbkPd2lD3D5
	 7cjjYySHI0jQgJDJVBh2UncqdiSajn/4FEmbi62zEYE8+iD3ORrmfak5lcT/HJiF6tg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E074F1F000C8;
	Tue, 20 Oct 2026 00:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792454558;
	bh=eCGg/CTtREd9dJsEJv4hKhUFTdHLK4OwgXYqQ/u+uQE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F9iXd6zbgFAKtbNBI61EUvpZ9fDoDe/SCBk+OS0H9yAelCXDEffmydoL2ax0Oi5wE
	 6HtSW+hc2xOf85JGTewcRVH2JQVmPyGo9xeNdQDO/WEEtlWPX8Idl7MxUxegm2QVz5
	 VSbC5ZBbjmVSXEAtauOsbPfDR1iYuxD2Cd6FpLE4rMoo9IzaoYztszkT813AVHR6hG
	 0m1nm6wYe0ZyzjkNitStslDflOO6qGidvKVJpROo8zNLv1k5POcsEeR3C67bySL/hy
	 0lbABpnuW0JVEhQ+TksyuLXeAKTTFEfO7YPIuEoYBEHM/66h+12u+kg6zw0JKdI6hS
	 znswTY9dtz4DQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 722E7406C9;
	Tue, 20 Oct 2026 00:02:36 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Tue, 20 Oct 2026 01:02:36 +0100
Subject: [PATCH v2 3/3] pinctrl: samsung: Add Exynos5515 pinctrl
 configuration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261020-for-next-lucky7-pinctrl-v2-3-b6b0e6065452@member.fsf.org>
References: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
In-Reply-To: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8848;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=WpGruSkDQ5IsRlg36hYMM7lL165QL22fCdhSe6pa0fI=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1q+bjOFJbWOXCtr6XjDBVxo6/5QoGIFN4yZSQ
 cWXVSVZKeWJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatavmxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+ukeg//TMIg4hn0gY8svHMqv6Duyi5jfPRl5IJ
 vrzBEC98/oXKRp+Xu5+4Yg87UduiJBRSEauJM25U7XZUYfLjMxmXxZZTmbxja35+ceXWqHkm0m0
 Z1cyqmR2/WspWa4LO3JJFwQX9frzOK6JMd4uItIMzVqQz35PEAu0ZikclA77ZBOWD/6v8Fk50Hf
 ROi+9pSispcKnEDlFpkPUS0u1208xyGmb+3bZhlZ4qDwAkif2ljEdEHO9JKHWC+3vPboSD7QgZQ
 LuSV4kgp7YXLiod0fi7D/YhuN7oDiX12r0hYoUoIJtz5f5/bVPlcNv7KRt0gJiKS7s+XdpACE5O
 eGQahBGehoLwSD2SsAK7+03/bYFBXTsYSVg978O/HmGZ59wimezU74noAD2a19CxCDsuET/wzZM
 kdJuMG6PMG/0ev8gHmi5L4GDzXlhHj7nxGYoknAdHekt9AV4FHZHhMc9Xz3LLPPrbjhTxVGRtBQ
 e/KlxQeLPzhVB2HrewuJdLLivBmRvPM3qeg7nz5cm871esJU2MudidrqexNm9Qgx3Ae+/XvVxKi
 ogVeFscL7s1WPGcOdoH0fV2htMjb1BHKwAt/hv8vk+QZBSr5OtzF4TjknaKPvKvt1nlKj0VYsWP
 Bf9fSTKcizv4RzU2Yoftpv9mX+M+5oR6cJ5Bxrxynuz/WzyyMHD8=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Aiden Isik <aidenisik@member.fsf.org>

Add the pinctrl configuration for the Exynos5515 SoC. Reuse the pinctrl
macros from Exynos850 and GS101, and add a few Exynos5515-specific macros.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 119 +++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  20 +++++
 drivers/pinctrl/samsung/pinctrl-samsung.c      |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   1 +
 4 files changed, 142 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 1aa977d2a1f8..3983979631c9 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -488,6 +488,125 @@ const struct samsung_pinctrl_of_match_data exynos5433_of_data __initconst = {
 	.num_ctrl	= ARRAY_SIZE(exynos5433_pin_ctrl),
 };
 
+/* pin banks of exynos5515 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos5515_pin_banks0[] __initconst = {
+	GS101_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTW(7, 0x020, "gpa1", 0x04, 0x08),
+	EXYNOS850_PIN_BANK_EINTN(6, 0x040, "gpq0"),
+	EXYNOS850_PIN_BANK_EINTN(6, 0x060, "etc0"),
+};
+
+/* pin banks of exynos5515 pin-controller 1 (CMGP) */
+static const struct samsung_pin_bank_data exynos5515_pin_banks1[] __initconst = {
+	GS101_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04, 0x04),
+	GS101_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08, 0x08),
+	GS101_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0c, 0x0c),
+	GS101_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10, 0x10),
+	GS101_PIN_BANK_EINTW(1, 0x0a0, "gpm5", 0x14, 0x14),
+	GS101_PIN_BANK_EINTW(1, 0x0c0, "gpm6", 0x18, 0x18),
+	GS101_PIN_BANK_EINTW(1, 0x0e0, "gpm7", 0x1c, 0x1c),
+	GS101_PIN_BANK_EINTW(1, 0x100, "gpm8", 0x20, 0x20),
+	GS101_PIN_BANK_EINTW(1, 0x120, "gpm9", 0x24, 0x24),
+	GS101_PIN_BANK_EINTW(1, 0x140, "gpm10", 0x28, 0x28),
+	GS101_PIN_BANK_EINTW(1, 0x160, "gpm11", 0x2c, 0x2c),
+	GS101_PIN_BANK_EINTW(1, 0x180, "gpm12", 0x30, 0x30),
+	GS101_PIN_BANK_EINTW(1, 0x1a0, "gpm13", 0x34, 0x34),
+	GS101_PIN_BANK_EINTW(1, 0x1c0, "gpm14", 0x38, 0x38),
+	GS101_PIN_BANK_EINTW(1, 0x1e0, "gpm15", 0x3c, 0x3c),
+	GS101_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x40, 0x40),
+	GS101_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x44, 0x44),
+	GS101_PIN_BANK_EINTW(1, 0x240, "gpm18", 0x48, 0x48),
+	GS101_PIN_BANK_EINTW(1, 0x260, "gpm19", 0x4c, 0x4c),
+	EXYNOS5515_PIN_BANK_EINTG(1, 0x280, "gpm20", 0x50, 0x50),
+	EXYNOS5515_PIN_BANK_EINTG(1, 0x2a0, "gpm21", 0x54, 0x54),
+	GS101_PIN_BANK_EINTW(1, 0x2c0, "gpm22", 0x58, 0x58),
+	GS101_PIN_BANK_EINTW(1, 0x2e0, "gpm23", 0x5c, 0x5c),
+	GS101_PIN_BANK_EINTW(1, 0x300, "gpm24", 0x60, 0x60),
+	GS101_PIN_BANK_EINTW(1, 0x320, "gpm25", 0x64, 0x64),
+	GS101_PIN_BANK_EINTW(1, 0x340, "gpm26", 0x68, 0x68),
+};
+
+/* pin banks of exynos5515 pin-controller 2 (DISP) */
+static const struct samsung_pin_bank_data exynos5515_pin_banks2[] __initconst = {
+	EXYNOS5515_PIN_BANK_EINTN(5, 0x000, "gpb0"),
+	EXYNOS5515_PIN_BANK_EINTN(4, 0x020, "gpb1"),
+};
+
+/* pin banks of exynos5515 pin-controller 3 (FSYS) */
+static const struct samsung_pin_bank_data exynos5515_pin_banks3[] __initconst = {
+	EXYNOS5515_PIN_BANK_EINTN(4, 0x000, "gpf0"),
+	EXYNOS5515_PIN_BANK_EINTN(8, 0x020, "gpf1"),
+	EXYNOS5515_PIN_BANK_EINTN(6, 0x040, "gpf2"),
+};
+
+/* pin banks of exynos5515 pin-controller 4 (PERI) */
+static const struct samsung_pin_bank_data exynos5515_pin_banks4[] __initconst = {
+	GS101_PIN_BANK_EINTG(2, 0x000, "gpp0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(2, 0x020, "gpp1", 0x04, 0x04),
+	GS101_PIN_BANK_EINTG(2, 0x040, "gpp2", 0x08, 0x08),
+	GS101_PIN_BANK_EINTG(3, 0x060, "gpp3", 0x0c, 0x0c),
+	GS101_PIN_BANK_EINTG(4, 0x080, "gpp4", 0x10, 0x10),
+	GS101_PIN_BANK_EINTG(4, 0x0A0, "gpc0", 0x14, 0x14),
+	GS101_PIN_BANK_EINTG(2, 0x0C0, "gpc1", 0x18, 0x18),
+	GS101_PIN_BANK_EINTG(2, 0x0E0, "gpg0", 0x1c, 0x1c),
+	GS101_PIN_BANK_EINTG(2, 0x100, "gpg1", 0x20, 0x20),
+	GS101_PIN_BANK_EINTG(2, 0x120, "gpg2", 0x24, 0x24),
+	GS101_PIN_BANK_EINTG(2, 0x140, "gpg3", 0x28, 0x28),
+	GS101_PIN_BANK_EINTG(2, 0x160, "gpg4", 0x2c, 0x2c),
+	GS101_PIN_BANK_EINTG(2, 0x180, "gpg5", 0x30, 0x30),
+	GS101_PIN_BANK_EINTG(2, 0x1A0, "gpg6", 0x34, 0x34),
+	GS101_PIN_BANK_EINTG(2, 0x1C0, "gpg7", 0x38, 0x38),
+};
+
+/* pin banks of exynos5515 pin-controller 5 (VTS) */
+static const struct samsung_pin_bank_data exynos5515_pin_banks5[] __initconst = {
+	EXYNOS5515_PIN_BANK_EINTN(2, 0x000, "gpv0"),
+};
+
+static const struct samsung_pin_ctrl exynos5515_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 ALIVE data */
+		.pin_banks	= exynos5515_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos5515_pin_banks0),
+		.eint_wkup_init	= exynos_eint_wkup_init,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
+	}, {
+		/* pin-controller instance 1 CMGP data */
+		.pin_banks	= exynos5515_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos5515_pin_banks1),
+		.eint_gpio_init	= exynos_eint_gpio_init,
+		.eint_wkup_init	= exynos_eint_wkup_init,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
+	}, {
+		/* pin-controller instance 2 DISP data */
+		.pin_banks	= exynos5515_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos5515_pin_banks2),
+	}, {
+		/* pin-controller instance 3 FSYS data */
+		.pin_banks	= exynos5515_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos5515_pin_banks3),
+	}, {
+		/* pin-controller instance 4 PERI data */
+		.pin_banks	= exynos5515_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos5515_pin_banks4),
+		.eint_gpio_init	= exynos_eint_gpio_init,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
+	}, {
+		/* pin-controller instance 5 VTS data */
+		.pin_banks	= exynos5515_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos5515_pin_banks5),
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos5515_of_data __initconst = {
+	.ctrl		= exynos5515_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos5515_pin_ctrl),
+};
+
 /* pin banks of exynos7 pin-controller - ALIVE */
 static const struct samsung_pin_bank_data exynos7_pin_banks0[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index c9c38f8988dd..92bf8f0f1eb0 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -132,6 +132,26 @@
 		.pctl_res_idx   = pctl_idx,			\
 	}							\
 
+#define EXYNOS5515_PIN_BANK_EINTN(pins, reg, id)		\
+	{							\
+		.type		= &exynos850_bank_type_off,	\
+		.pctl_offset	= reg,				\
+		.nr_pins	= pins,				\
+		.eint_type	= EINT_TYPE_NONE,		\
+		.name		= id				\
+	}
+
+#define EXYNOS5515_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs)	\
+	{								\
+		.type			= &exynos850_bank_type_alive,	\
+		.pctl_offset		= reg,				\
+		.nr_pins		= pins,				\
+		.eint_type		= EINT_TYPE_GPIO,		\
+		.eint_offset		= offs,				\
+		.eint_fltcon_offset	= fltcon_offs,			\
+		.name			= id				\
+	}
+
 #define EXYNOS7870_PIN_BANK_EINTN(pins, reg, id)		\
 	{							\
 		.type		= &exynos7870_bank_type_alive,	\
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 5ecc9ed4c44d..f6b392a84cee 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1492,6 +1492,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos2200_of_data },
 	{ .compatible = "samsung,exynos5433-pinctrl",
 		.data = &exynos5433_of_data },
+	{ .compatible = "samsung,exynos5515-pinctrl",
+		.data = &exynos5515_of_data},
 	{ .compatible = "samsung,exynos7-pinctrl",
 		.data = &exynos7_of_data },
 	{ .compatible = "samsung,exynos7870-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index bb02fb49b2af..7c60375d5924 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -392,6 +392,7 @@ extern const struct samsung_pinctrl_of_match_data exynos5260_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos5410_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos5420_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos5433_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos5515_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7870_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;

-- 
2.54.0



