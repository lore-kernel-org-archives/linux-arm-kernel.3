Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC56606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bF/Dhs/h;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SYULoNi2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EYYENz//Yxu5meUYT9GGLBnB4hd0LOVAJcrkVCx2F0o=; b=bF/Dhs/hQiIeCU
	qLCScGx5p7vpc8WmBdnJhFsFPStdTRnckoC6UpY1XC2YSSkj2Q0T0sIfp7nBJiCxHZMOydF+h2Uc5
	13Hhi4aO1p8PaaYaJ5EFlZhwNG3suIxZRSxYnXfgttvMv0bTWq1yWN7yydqqpnQPAtfVGp/hDWkBd
	oDNmSLwSVP8MMTjf7epb27aZJABsOUgQYIqgNKoZrNMt2Sr4+kX1zZdege/zKlNItaL0i7KvNQDil
	416wb6JXddQGLrgmsZhVPz9s2kE5pjEfysxS6Fqd/61SzawDONy0njxKZLcaL7gmHRPYZl3DuJFcH
	3ywkxoMz9EeFX08UdvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8n-00000002oRY-2tGL;
	Mon, 26 Oct 2026 16:01:41 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8d-00000002oJl-0G5M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:32 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c413dea9ca6so504350366b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030489; x=1793635289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYYENz//Yxu5meUYT9GGLBnB4hd0LOVAJcrkVCx2F0o=;
        b=SYULoNi2BGlkLMDj4j4K/EkmPFFZip1/jDd40uHkqiusQk+eynIXMQrdbL58dgkvE9
         hfcTXk4F2hll+UfOEAjtDLpVS0F75yTDLjv4N2ZoRlk3JIuN0tBsA7E5vs8fdGM72E0w
         aqW1NCUEXO6BGJXz9P/DZ4tRiHFMSAfsUZZ/6ObyqakkbLifsjAU3lcLcl+G6LRKY/G3
         Ay53WV8Vd1BxzNrCSnwcQicO5skicUgXyNelXkUVYFskyjPpyKLVys/yPdqrh6fbLNw8
         G5StAgqYp1pyEW0T+f3HYBNuxo9NRrnSpLoNeZKNiwX6DUvxh3E+THHP1TMxnRskoj3K
         euOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030489; x=1793635289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYYENz//Yxu5meUYT9GGLBnB4hd0LOVAJcrkVCx2F0o=;
        b=bBSBC19Rxvy3k+PnuT1n90dAOZjTaJjkLtvetvvzytWwtg9QSiBZvqwXElfPTGXKYJ
         WQ8Th0lUC0dSJ+9nfz5hbd2wL3GN/OyCy8LgiZbRflhyKfdgJXd/BIUGKEqXNjTBM4Ee
         5I/V2XtcJb134eSdxJPIcVlQEkRvarpkDFkIv9qM666piG9yMHQzrxRonV3T5KWfAD5F
         Nhv17jd3Jrs6vg+FVkcnX374OnG/1thM8Le1kmNHl3De2uFLlHFDOKXN3uA4KumuuK8z
         3lc6AAXwF0q8eonDTWd118aWspZzpsGpex1cZ1LjiY3yc9Pu8KhWBXmLNwsM/m2ZehWg
         noaA==
X-Forwarded-Encrypted: i=1; AKwUvBy0wbA0TE3HoTRrywuZOuacE0OzZGroI6TZUfgdCLEY2KDyp+i5zciC4nHCyNV4bZj7iXDZ7Qu79uSwlrcRRYYj@lists.infradead.org
X-Gm-Message-State: AFq9FYLBDPgCvrYWL2mE3Fr1dk4XQEiAzT1jVhBQQ8g7fCoF8dCxjtrQ
	JoPsoz2Q9of/NXB0TwnTWfJLxed+g0JE2p9AzssDo6n7R42sitkk1mN3SNCukhbcsiU=
X-Gm-Gg: AYBFou17QcKCAkNvpoziKgGCMbfL6YwcSjTXLnv/O4SDigFLiW1shDGIERAD4bSoCpZ
	hqi1aW2cNtWto9kcPw1YM7alYjVEJDJ2/GZLhX+mSoJ59Mu9jWE2ZAne5L5/qrGyCqxphI33dM8
	GB4aX94AlhnFRRUDr7yom695xgygmJw06yEmZhZb/v1DRTzMi/yqUweOOwZLWBFF0PtKS6Dw/X0
	Ya5wlZIIdCJRAXJP59u90U2/Gjg942OcOjB38WOqJMq+wXRGXm8hupi2wEIcflCv1jQdiixwcf8
	3CxI3o9bpP7kX95xSkBk32TheZaqcPpkODW69IP+JJFNwSHx20wXS01PCEYJjMT/0FACot1L9/q
	SVbuO4qsqPPlzKB0sVCpEHnCf+/o3pRFgXp82u54Nsgzed5rB9vKxC/eCGeegUhLIgAdFrbf4Bp
	O3m9+8V8CCuKiQz/sce4t8/NuBH6BnGtEOBkLe/wkNARp9/nty42iNsNYC7AlpOI/T9UQixYs7U
	d0e7Ey4JBXcEsA9BBwY2qoeTPCdArg8rry8Lb24tSYaFGIBEQxehEQNHv84DCOs9leA9GvbP65j
	ZNOEdEdKH62iOqVu4VBQLlAOhdqzZ9DTdgcbxOsEBq7O+YdktW+X34LyiarvLAXM4YQmA1JsQOi
	+fDHij+i7Ng==
X-Received: by 2002:a17:907:724f:b0:c3f:cf2a:76a8 with SMTP id a640c23a62f3a-c46bde8b95fmr863838566b.28.1793030489246;
        Mon, 26 Oct 2026 09:01:29 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:28 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:24 +0000
Subject: [PATCH 07/15] thermal/drivers/samsung: acpm-tmu: Return -ENODATA
 when sensor is disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-7-0637431b7268@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1760;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7lM3qIErXOkLrWCUvTMJgQuGSIk/cFpH48BW97n5ryc=;
 b=GQSw8sx0872mm/sZpXZuyYhnHTCUuT+ksnT5U3IgLXaQ+PhbVK6oVjYCsZsjB6Z5+rZvYxMqS
 7YQOm8auVUsDmEyQYgUOUVjIg/WNDpL9zUhK4lgRBg+nrXwLcA1OoQY
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090131_146552_184FB23E 
X-CRM114-Status: GOOD (  13.29  )
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

In the thermal core, returning -EAGAIN from .get_temp() instructs
__thermal_zone_device_update() -> thermal_zone_recheck() to schedule a
250 ms (4 Hz) retry loop with no backoff. If re-enabling a sensor fails
(for example on resume, or after an acpm_tmu_update_thresholds() failure
when polling is active), sensor->enabled remains false while tz->mode is
still THERMAL_DEVICE_ENABLED, causing an infinite 4 Hz retry loop
instead of backing off and disabling the broken zone via
thermal_zone_broken_disable(). In addition, hwmon's temp_input_show()
forwards -EAGAIN directly to userspace rather than -ENODATA.

Return -ENODATA instead of -EAGAIN when !sensor->enabled in
acpm_tmu_get_temp().

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 4257bec802c1..1f56c69af76f 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -200,7 +200,7 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 	 * after PM resume.
 	 */
 	if (!sensor->enabled)
-		return -EAGAIN;
+		return -ENODATA;
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
@@ -208,7 +208,7 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 
 	scoped_guard(mutex, &sensor->lock) {
 		if (!sensor->enabled) {
-			ret = -EAGAIN;
+			ret = -ENODATA;
 		} else {
 			ret = ops->read_temp(handle, priv->mbox_chan_id,
 					     sensor->group->id, &acpm_temp);

-- 
2.56.0.257.gf7497c7d27-goog


