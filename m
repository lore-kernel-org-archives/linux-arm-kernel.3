Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47482606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q4unrjsT;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Pxkelnzl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mtVdxBGNK8oHTFOTDJC4ciOsojwKNf2YHH+u+jkXh8g=; b=Q4unrjsTrsf8+r
	unNZDGonGdou0LQfjILtH6sEzJ92TkRodqKpjZMJyyWTSg3UKUEu30YAhjOe6M3cWQQ/hgB5whcsl
	wYXMQsf7gsO3gno0VLoxj/2gUfD46p8ueWZXBkWlHyXBMGlwxjL2ZV+YJGq4Npwu+rrsAxML446+L
	DaYTmeTF7NJJOBbF4bskE2e2NcJtXQrLce95q4w3mEB3bzeBQw/sc9RQlmouLsYbo0kjb1LnFjfDM
	h/fJvSeaCvMGVx7K9mcgpFhUq/UjcY+eXK7pwanbVTI2k7fxC2Mfy0T5avRsafUJcGSfLHFCiJu2A
	Av4+TO3WRxpIa801KksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMuV-00000003ps4-00iS;
	Tue, 03 Nov 2026 22:23:19 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMuS-00000003pop-1k88
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:23:17 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-15943c9c005so312445c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793744595; x=1794349395; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mtVdxBGNK8oHTFOTDJC4ciOsojwKNf2YHH+u+jkXh8g=;
        b=PxkelnzlbRU9d16Bt+mBCYkkicf2LQnU7y9vXsPT4NKgy499krZHv4PE5s0ytySCxy
         uuDwXHzb2yaU3vyB4gIuzqIxldHG7m6ABNTYaf64piCCqi+nlJLCVevxjgYeTDwMUvve
         sAEFOKI1Jnwkl5tdobZ6s80ls7EJ4boFZfnr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744595; x=1794349395;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtVdxBGNK8oHTFOTDJC4ciOsojwKNf2YHH+u+jkXh8g=;
        b=z4tPib7e/v92eMhuG6vzWN3ZeahaKg0Y0msRaKWsiCB3zqQi2bVQxZgdXY7Kmgmt5t
         2qapgrMazV3m+eKa4TatJE9zie28J7I7mGSeSbY8Rl6KHIoFRuRNMbyinVsBUqEhQB+r
         8pnyqjvWr87XLaCxjThcPU5V7anTeSxCo2r/q1qt3qb474B583v7qk6mW92zoB9KB91l
         e1ft//7idVGGoI3OsYgykwu5prSN7iESRxLTVU+C8YDAZbTkXfO9RgFN9d56cAV34Ell
         tXEizQ6tu+1MYFTzd4QnQKoD5XC9J5doJg1Y4+vPyFghRsAuMcHtLGJfNK6Q50bbkbqq
         m+8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjj0fmcNeNyEWTwNrty+3x85Grj13CnaaNbb1yIFujFQzLNbQ77od3bmyh2ts1L6jrwsoP6+SSI1SgQdvo1LyQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+Y8tNIhfhxmlSFd0GBhc4fmYOo/CqKuZ601cpbsHD3w8IKsm1Y
	BsEnqp+o1M3y8UrOAq5PsBiiBR+13l1m5f4Od9kF3HR+0gN854RDP7pERU/Erl8lGg==
X-Gm-Gg: AYBFou30OP85drFTpwBQqtHjfpRTXnOIsItyoY+oE8o3Zg9/50AtBBc/GVNIc56L6Ij
	g5MAWG4N2Oaa+jIjK4tx07bMXx9DwF6QJW9XsjpxdGC//YbpsSWRXWTfoRBGXzNiDMMnIyx+XjN
	Ouj4kUlF4SVDAur0W5J3EMXzXAwEFnQ7Yae9pssRmx4QU17FUmkXi1Xa8lJxMILgkHdxZ6lAoFj
	bur9vNLTl0ItwqKMGLajme6o7JixuIUmCNEeQeY6hrP170xTrNZcgYS9w7jpojZzDYlNXM2ygUp
	KIz/8bjIAvUyIzidmJUStLwLVHgPOWhI3YJ7cwpa9FZCfX3mfG8RK5XgHjWtnAwtzAN8e3l+YHW
	PFWITwiQFLpFlTBweCyKcPeIMw9boCQmGXfOG0IfsFI8RDaZ/2nSp8e7azGtXmWNVeatWuv7oGv
	r7hZuI1vHPd4haNnH512AhT2AlMK5OLScBzQKlmI3qEsbVRjVf6dvvVJ/wz+n9PT4G9O8rHZE32
	woAm5F5Oq9v2BcXUlFb4uNhu5RCNnt8mtHDsTDdg6AolaGDQYYUrKNc54N9mPBCDdMcoDI2c0hI
	covnVcGF1z7Fmex3xRP4x81tRCtwK6sHK2NkwI02rN4dykuc4X6rdS2ZakRkBl/uojbU
X-Received: by 2002:a05:7022:e27:b0:14d:cb67:afc4 with SMTP id a92af1059eb24-1ac5e8e1e4bmr29270005c88.41.1793744595232;
        Tue, 03 Nov 2026 14:23:15 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b245b8822fsm2254589c88.2.2026.11.03.14.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:23:14 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Brian Norris <briannorris@chromium.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v2 5/5] iio: adc: stm32-adc: Drop runtime_idle()
Date: Tue,  3 Nov 2026 14:14:43 -0800
Message-ID: <20261103141442.v2.5.Ica1e32ae51d7975844386684d2b6a097f3ca9122@changeid>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261103221717.3840215-1-briannorris@chromium.org>
References: <20261103221717.3840215-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_142316_455376_548FB48A 
X-CRM114-Status: GOOD (  12.51  )
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

This runtime_idle() implementation was added in commit c537d3457542 ("iio:
adc: stm32-adc: fix runtime autosuspend delay when slow polling"), to work
around a suboptimal behavior in the runtime PM core. It should no longer
be necessary as of "PM: runtime: Propagate last_busy from dependent to
dependency".

Signed-off-by: Brian Norris <briannorris@chromium.org>
Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Acked-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
I do not have these devices to test. I have tested other drivers, and I've
verified this behavior in unit tests as well.

(no changes since v1)

 drivers/iio/adc/stm32-adc-core.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index c409edd3a827..0193db7a2a7f 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -873,17 +873,10 @@ static int stm32_adc_core_runtime_resume(struct device *dev)
 	return stm32_adc_core_hw_start(dev);
 }
 
-static int stm32_adc_core_runtime_idle(struct device *dev)
-{
-	pm_runtime_mark_last_busy(dev);
-
-	return 0;
-}
-
 static DEFINE_RUNTIME_DEV_PM_OPS(stm32_adc_core_pm_ops,
 				stm32_adc_core_runtime_suspend,
 				stm32_adc_core_runtime_resume,
-				stm32_adc_core_runtime_idle);
+				NULL);
 
 static const struct stm32_adc_priv_cfg stm32f4_adc_priv_cfg = {
 	.regs = &stm32f4_adc_common_regs,
-- 
2.56.0.398.g882cbad275-goog


