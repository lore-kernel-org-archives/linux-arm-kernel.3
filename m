Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BFE606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gI9rGQIu;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lX1JXafI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uVxW16mpXXGmdLmnlhGkMZ8vb/cT1vcxPz/t91VG3GA=; b=gI9rGQIurzbat0
	1Atn1aJhQNCvQTzHlwn6dukipBpEKHJSW2P8xzK9GoemOWVcbcxkJc7m3rKm6TwnZDDYlgN5icMvY
	VsKBnJHuh45hRSHEWgWmhpxS5EISeWiXc8Zbd7tkwuKJiec4fIUYwiMxlxnpDGHBC6DO8FX0dq75k
	zw8ZF07lc2/Pn3i1BRUddZ4fCuhmDl3WYjXdeXlfetXcSp1FRUgeG0U05wCDJHKfMAFQHV8Sq5rF/
	Sm+lbkzylTz7heY8K65qiYMC4FPM8aG/CkQ15jkYQwDxmT4U5UVvOUskm04VA0LGuOPSnZMKmhtpN
	CeCmzXxELlipvrA41yOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8p-00000002oXG-41eY;
	Mon, 26 Oct 2026 16:01:43 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8h-00000002oMa-0lyS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:36 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso490173766b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030493; x=1793635293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVxW16mpXXGmdLmnlhGkMZ8vb/cT1vcxPz/t91VG3GA=;
        b=lX1JXafIuhjfIaCyuWko2e1YpF2p4gz3mqitZW/EDbXBrNsTagIzGcB1ijEa9Rs5hP
         yl/2LYEIp+b67ixpP98L6/EgoZCj1bRxTtxfLWNLpli/oFBvP+ZKSjXv/eFXi4v3ZgHj
         GRJcXpGwsNQA37ZxjUWWE6WqZP4AZMXzXjKNlzlG1MyKPOFyW31zFRWRLr+GsNsK0/u+
         oTCXMx9i/4bAJCTB2G4djd5Q6OSB+xVD4t+sKwjDrRIZ21vaAxgpXE46msm6oe7NHpj5
         4I2DASTgiqyTWb0csThIGmakiBMOJem0TLa5buEiXC1XrkX5FEtPhglp6lHVV+apMMhr
         YfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030493; x=1793635293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVxW16mpXXGmdLmnlhGkMZ8vb/cT1vcxPz/t91VG3GA=;
        b=N+lvOksBX7Au4UqATtdPCIklsOdnoRIjyDuUnRVJeu3D7KUDAttR5uqmSICmuvzUQq
         yPwaX1GUWbOHoNquXk6HDfvK2/yo1Hp/iDjr5pPPy8+z7o94gZDUaWx2LXQqcvgp2x77
         8Lnl4+rBnMmWPJDLtOmK85GkBLEKzo8e/fRmbz5BXZjjlnDsZjzQDlYTyl5WEItNP1da
         u2hzc27wBPksL1Dy5JXhhKuDVL0EIdZoMN+jB9DBoEP2i4oJDlrG+yD6U/sCa9e2wGRA
         ngfOni6+buWLFILhcNRLVNiUbiG8aEXlb8ZFoNPDQGX6JuutZMswJT+uzKtJK1/RK/Kh
         SvNQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/4L5A9rEWXeqkgsTpFHBhNVzFAT8aE0OQzmLejjmif+2ip90S3GxFD0q9Z5rpWA9sqR/dfR8kV1QhQCktDCTd@lists.infradead.org
X-Gm-Message-State: AFq9FYIplnoKNsBTl5nPRIVrG3sNzS+6qA4UpNlgOqIZMxjGWHmmi5EV
	ZRNOnwWEDO8wplTPouM6vgQWJ3mdVUPGfh4bxUw6ggFhDtIkwgS3rS0GoRg3mbWyFC8=
X-Gm-Gg: AYBFou265ZDduIhvbiATGyQuGcuHNgssIThSwHgdiYjM6OCyqvp38xj+ahluv8/b6mz
	DUcN/e9xGUASLnhVsspNP7wdDZEUF/giBCEGYAMUZMyrqqZ31CLRGkY4xyzYQD0JN+kx1y9gesZ
	36KKEZQIx3xigLIOgVSfNpUZbHGLBLuX6ic9S9i3mrKdb7OX34etVE6yVBeBQOCnjOLg9cW+ngi
	4/6lg9HaUpzqCprDnK942zMaVyw0Pe0HKV/TcmcaFagccXnv9s3W2KxPKd/Pn4trqpi6I5kL0K/
	beJu+F2UbsTjZH+9y0qfs0BfvNzJPuoR0RPb7emdlxPkDb/0rVX5ed+0pI3NlSyioNaq0dEk8DR
	VXUgNNTS/yNbEzkXWsrxJOAgha7T1GRd0rskSDIhrPxvXHuwcJEQTt8QskEcSNuhfnVMOncOPnP
	Yt1XtCmREuwEnUUYJCEiCT24O5bimCWljwryuVNdvYcqAcbfo03+WsJUWl7jKc56FLrhpM1mnX1
	UOFXYTdTTwzx6vEWET//kZJcDs+WkoENyJpDKfC7UD7sN7kq700fTCg4JX+EwDM0rt3CYm1N9rh
	ju2b0qr2I5kBa4wYxR/gvYvE3Z2syxOuUErJ
X-Received: by 2002:a17:907:e93:b0:c46:ca2b:84bd with SMTP id a640c23a62f3a-c46ca2b8958mr640208666b.30.1793030493521;
        Mon, 26 Oct 2026 09:01:33 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:30 +0000
Subject: [PATCH 13/15] thermal/drivers/samsung: acpm-tmu: Disable regmap
 locking for MMIO INTPEND reads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-13-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=900;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=n9oiBAiToV2j4imluH0Dini5o5jk9l5YDFDeRG4d+9Q=;
 b=7egW4kVv7aVKyCi0S0idVb5FBWfiO3hOv7yz0j+W9TmYVCqptWD0mnRVo2uyEHV17etYiyvBh
 TCUuH84NV5KD7i/ZAuGk68LaJMqn+KLQISgMVlqRMXgTK286SThIUKP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090135_259059_0EFFB8C0 
X-CRM114-Status: GOOD (  10.17  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The regmap in acpm-tmu is only used for full-width 32-bit relaxed MMIO
reads of the INTPEND registers, with no read-modify-write operations or
regmap cache. Set .disable_locking = true in gs101_regmap_config to
avoid unnecessary regmap lock overhead on every INTPEND register read.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 2324efcffb84..fd491b4f305d 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -127,6 +127,7 @@ static const struct regmap_config gs101_regmap_config = {
 	.reg_stride = 4,
 	.val_bits = 32,
 	.use_relaxed_mmio = true,
+	.disable_locking = true,
 	.max_register = GS101_REG_INTPEND(15),
 };
 

-- 
2.56.0.257.gf7497c7d27-goog


