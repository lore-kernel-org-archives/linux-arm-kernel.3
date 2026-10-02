Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EDBCA5FE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8C4oNz0B3j10C4TExUEIycHLskvC0S9bsmP8HfkEVE=; b=ASLqfuCCaPBvh6sihSFpE6+j8R
	38BlVYoFYUFSnIbUjCoLMUJF7CrfE2OYRdGJ01j0I9ou35cj9MqpGyKAdwsSMl0NXmHhduMsvfcQv
	VJjqVW6QobUquqwMrChDcT07jV4JvVrZbK5943GrfchwdHMJjh8JakaYTjZRq6pkh+Q5Y8SVq5li+
	pDvZ9cgTsRwl/YiOUgRnN6hJvUrjMB54XqVCO1J9fETGaCVcZRnl09sGvI9tDQ9C8BE81X/Y82PcQ
	igL97uXg+Qpc6xphhiU1FdGAnJr4MBmxP37m4z2UwNYLb4Q8QTGlOraGqCdQ4ODDTAG1CJn53bmpQ
	L4WLrS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmLm-0000000CfSA-01ZK;
	Fri, 02 Oct 2026 23:07:34 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmLj-0000000CfPk-2m94
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 23:07:32 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-34b3e517e6dso82774eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 16:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790982451; x=1791587251; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g8C4oNz0B3j10C4TExUEIycHLskvC0S9bsmP8HfkEVE=;
        b=OrzTmLhiraxaWMl/aQAtWDGqkk5t8ml+dEs3WboOYqyFVZ3h4dazQ/0pvR3LdcI9wk
         c8OzvPVmeLtJCluSBNR9g206sgUlwQwa+4X4n24/snzzgMzOKcI92CzCprf7r5H8kmp2
         cMIlbYr8dn8m7kWrc1MYmlCMR2CVTDydPYWFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982451; x=1791587251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8C4oNz0B3j10C4TExUEIycHLskvC0S9bsmP8HfkEVE=;
        b=LaikOyFDptX6vIma/yrviUzHJgS3tUSTQGFX56JNyhvAJa5FCjEN3idBwgm0xYiffE
         c3lxNXfk3IWvN5rDlTzvvHH4qY/gBGty97wfXEe2kMHuabsn1hExVuCigK17ImHL+Pvj
         mZQYvj9q9WwHzErTuTxur+3nDCFeCqhu9mXOAF3TljYgBZ2kOEI+QmMVZXGRIhk8Qrc0
         EhBGpWBvQKpqzXUGYjlHwJvY0ZFr3jEq54MhvxhiuxNCPpbwjQlY+6F+deiNwgh4ZKwk
         SrEcpTtcnwJ3DZrIvS9J+bKLr0GWLi5GHPZo+yzhgnWbmKXcITuQdG0Di1K10QM2UKec
         otyA==
X-Forwarded-Encrypted: i=1; AKwUvBzZujaJxxx7OLlrwHbyYweBz9By3Mf1N/P2cN6wV7ip513rcd8UZTrYs8BEhLLgqz4OMG1T3w6vK0/9x+AyhAwU@lists.infradead.org
X-Gm-Message-State: AFq9FYJvXNo0ot2TodrUAtla2X3mhMFTHMDYE8Z4QsY7h9RPsI9MHQZz
	5CJaYB/8GKVsDHtAYW18pF/kWJPeLdiWZ8Yt/3J3altOuPYc8y7+GVwiwtaYPZNrug==
X-Gm-Gg: AYBFou2AXrbRUxgs5j8zzDJKhTly++Yytpqdh4XbiQiZDGCUbU6Cc7bcjyXPHwK0zZv
	kr6bDUJtIUkG77lrsnD2YQF38tGG35tNdyIYio2QNp1+Dsa9qsvs5xInFYInKtbd85yW3cSISnq
	XO8ZtsEQNZF5H1YxIa6FHKLJP34ZCjLT3pMOTh66sPHKf6qStXpsNYR5j8qIb7grdLRyYFoSKRz
	VL39g1QHIPbM5EnZMGZSm0tPxb67Dk3Gbxu+ndy83H5D1qzhgFcsB2EL8EQBwc/oWFXeNd7aHut
	uJZEpHxX49f/DaeTaz5N9NATRF8TO7EdAaw3+0anjGODYZjhxuGL9Buvk3nGpyscxYh+vp+gRbH
	sXGQ9bspgeApw8BH/7kZZW9W7Cf6XQuMOFSyZUi+wQqxg5eRSDN+ME/UlPRjinxyRApVaj5Ge3c
	Umdbbt8DU1E4kc4e5OdsvQ7hSjevDd4j0dQG4dxxFghCuXhs3i74xWrYrNp2J+LaDZKzoVJMpOH
	RKqbmyslxafCttE9BvV3H8OevUb5cB1L09n3Q==
X-Received: by 2002:a05:693c:6391:10b0:34e:7f9a:c722 with SMTP id 5a478bee46e88-34f218665camr4494122eec.34.1790982450979;
        Fri, 02 Oct 2026 16:07:30 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b0dc:e72e:e96b:3323])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34f14f303e3sm11053210eec.5.2026.10.02.16.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 16:07:30 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 5/5] iio: adc: stm32-adc: Drop runtime_idle()
Date: Fri,  2 Oct 2026 16:03:09 -0700
Message-ID: <20261002160309.5.Ica1e32ae51d7975844386684d2b6a097f3ca9122@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261002230714.507921-1-briannorris@chromium.org>
References: <20261002230714.507921-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_160731_704266_E179F529 
X-CRM114-Status: GOOD (  13.13  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This runtime_idle() implementation was added in commit c537d3457542 ("iio:
adc: stm32-adc: fix runtime autosuspend delay when slow polling"), to work
around a suboptimal behavior in the runtime PM core. It should no longer
be necessary as of "PM: runtime: Propagate last_busy from dependent to
dependency".

Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Ulf Hansson <ulfh@kernel.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
I do not have these devices to test. I have tested other drivers, and I've
verified this behavior in unit tests as well.

 drivers/iio/adc/stm32-adc-core.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index a42d82d61cb8..e9e113a46ccf 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -836,17 +836,10 @@ static int stm32_adc_core_runtime_resume(struct device *dev)
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
2.56.0.rc1.315.gc6ed9934b7-goog


