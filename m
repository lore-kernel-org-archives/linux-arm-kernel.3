Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB71606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KiLh/+HV;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ipf8sFKA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vG7YyaR1jfJGT4Zyo7fUKW5YQdRxU04KVZC/8HRXsU0=; b=KiLh/+HVLQbl+yXktLHrluzo3f
	8fgOeZD8xXunFXXvvW4RLvPCqV52I09ceEIPOsfI6kj7tD2Bv0p3dUfWBKW4OAPrNeMExZLfE9gu9
	Eg49j+SqoQ492ZUsiVO6h2CkDPRBpGg5maXgHXVDd5fYFc7aZtGqAQyuZp3LOUnEz2H7LyvHdRvC4
	s8y9W4LIfUVkEGyqq3sx6ysQd9FxMpvIigwso57MxnQQaYYczhj9ybL05s0/aJ4CwTlJCa+KH4cxn
	FXBr8zeIcxXLf3pohm7s1Kc9RYR6dPlBxMuUzpLRSl+OaV5iQZg0GzPqThz1gTMbGHPQzUXQ1rTtd
	aGTV7J/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMuG-00000003pgF-0NRH;
	Tue, 03 Nov 2026 22:23:04 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMuD-00000003pfB-3AlC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:23:03 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1a2af4c8d00so297338c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793744581; x=1794349381; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vG7YyaR1jfJGT4Zyo7fUKW5YQdRxU04KVZC/8HRXsU0=;
        b=Ipf8sFKAfS1DhVjJNIM+Aistdz6JfJ7tgf6VUy4T2KFbrhSS+ZXaApfkvygBIpVugD
         iosVixEdkdacQ6FFF8ygPP/sVPA2uAUX+7CV+UYHFBiTltpubl2VZlAZD2qVDREeOifC
         ygZetbxyxYErgEiYIPhjd6LWeyWIKxmP8uMO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744581; x=1794349381;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vG7YyaR1jfJGT4Zyo7fUKW5YQdRxU04KVZC/8HRXsU0=;
        b=I87cOci2dDkJPeARzA0PIK8zQw3RkDycu1Yoh7fV/mk0/r1z86jXuyEpebdaxPrORA
         7bf8u4RPNIcbYKWQbJff0SEczcKM6SbwqEEDrdQgZDeQGTUkY57gGjF7al/3x777yeRG
         OvUdDvx1iO8/AbVdpOEbD7dN1vTwyIhraiQWkz7bNn9/GcCQA3Qhm/fW6OOYEfnQ0oam
         yNEYeJeud4kmEJ4OwIdXZeq/NHah2kemumz/fwsRHUpU0WD5ZWD8uKyo94X+tf20lfs4
         Gzx7yJiRWat25yTeBHSYTF/DNWmP7XOeoRtvwEi1mWagjIpMfD8tpKhgnDM9OFFE2Nlp
         BDRw==
X-Forwarded-Encrypted: i=1; AKwUvBxdeDLebKPdDf78tJ1D4qp0zCPx5y11oua1cCNIPbaxnNUAPeqcQmKaKGVjpGgDrHE94NXNU/ehvZfqBZzSsR/8@lists.infradead.org
X-Gm-Message-State: APuU4Z81zJwoBB1TMQXS+suYkIJlSqB+3mcOAUAtn7WYxdaUJYtMzy4i
	o0Iw4rQPLyNFrUN/sN7wQcfNJ9pue2kXzbDBac0BibCMT60w/FfOGYVVcYuvtgX/YMgMdjsZ0k3
	avqA=
X-Gm-Gg: AYBFou1GSi8DVipyd5A6l3nNSlNXo0bE9mznqtmXe6TWPT/YX30UXnN4rhr3jNLwAZw
	gOMe2NHqLRfwLL2RZSsbwLthlgR68WTTdg/ehihWm+2RQzqqNnM8pt9uZRRaud5mMjxzfTJRk5N
	wIH1WIeguppSWNbVZn98P+MKiOYCbGWqhbeEYq1Ex229TzfDqOi5qOPs73c7fAQ8wNo5VtGw7qk
	QewId+ZLjBugtpuegdro8X0sctDicSYDkE7umYlUM1ramPQ9Gw+dFg4Yw0jMNIZTWsINWg2jSMx
	I60lq5bsQVI1oni02a2FqRhvN4TUOugon0ANmaO2umzAt75sLm1Hh9GglWJzC9q6QXO1jT9eMcd
	DX5D9eB4WtjYzmi+Iw5QSZTi5wl5TuvCGi8y1gtH5cQUQReNmdQybxbb/ikhn8e6vuB8gNvERe2
	jiN2tWxSQwGd9Awj4DVFOr9MP24Sj6JMPtTm8z5zEmn80XhVFQIQnhH4mQGRkhH32f09mWYz6xD
	9ybKXEtRcIjy4Q2pXgs2GpyIUph9OHMDlV3zYCZK96iQWl6vv1WoQUHShNUvNk9nL0jo86cNjQs
	08KVF/m8haL8sW0q9GwGAn0LsGbCG0mHEzfPWALF4EN9o6JNDND73dP3HeLULOwFCvXr
X-Received: by 2002:a05:7022:b0c4:b0:144:eb46:c3f with SMTP id a92af1059eb24-1ac560219bamr19881274c88.2.1793744580537;
        Tue, 03 Nov 2026 14:23:00 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b245b86fbesm1926506c88.1.2026.11.03.14.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:22:59 -0800 (PST)
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
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 0/5] PM: runtime: Improve autosuspend child to parent propagation
Date: Tue,  3 Nov 2026 14:14:38 -0800
Message-ID: <20261103221717.3840215-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_142301_825071_6BF30D5C 
X-CRM114-Status: GOOD (  14.00  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

v1:
  https://lore.kernel.org/all/20261002230714.507921-1-briannorris@chromium.org/
  [PATCH 0/5] PM: runtime: Improve autosuspend child to parent propagation

See patch 3 for the primary change here.

In short: today, children can resume/suspend without extending the
autosuspend expiration of their parent. For parents where their activity
is largely driven by their children, this makes it easy to experience
"premature" suspend.

Many .runtime_idle() implementations seem to try to work around this
problem, and one in particular (stm32-adc) documented their problems
heavily in c537d3457542 ("iio: adc: stm32-adc: fix runtime autosuspend
delay when slow polling").

This is an attempt to improve the PM core, as suggested in review for that
change:
https://lore.kernel.org/all/CAPDyKFp=KTf8=zGBSzPYqhjnZpY8xwvjCeM1e-WTKT1QLSxaDA@mail.gmail.com/

This will make it easier to simplify many other drivers too, as a
significant use of .runtime_idle() is to simply extend a parent's
last_busy timestamp, as a proxy for "last activity performed by a
child".

The changes:

1) Preparatory fix, noticed while making the following changes

2) Because the last_busy mathematics get a little more complex, I have
   to change last_busy to use an atomic64_t type

3) Propagate last_busy from dependent devices (children, consumers) to
   their dependencies (parent, suppliers)

4) Add KUnit tests

5) Remove the pm_runtime_mark_last_busy() workaround from the stm32-adc
   driver

To follow on with #5: I believe almost every other .runtime_idle()
implementation in the tree can be removed after patch 3. (There are a
handful of drivers that should just use autosuspend. And perhaps 2 or 3
other drivers that do other non-trivial work with .runtime_idle(). But
most are redundant.) I may work on that next, if this works out.

- Brian

Changes in v2:
 * Update comments to explain when/why rpm_propagate_last_busy()
   performs the update
 * Minor kunit test improvements

Brian Norris (5):
  PM: runtime: Only queue an idle check for RPM-linked suppliers (part
    2)
  PM: runtime: Convert last_busy to atomic64_t
  PM: runtime: Propagate last_busy from dependent to dependency
  PM: runtime: Add tests for last_busy propagation
  iio: adc: stm32-adc: Drop runtime_idle()

 drivers/base/power/runtime-test.c | 99 +++++++++++++++++++++++++++++++
 drivers/base/power/runtime.c      | 30 +++++++++-
 drivers/iio/adc/stm32-adc-core.c  |  9 +--
 include/linux/pm.h                |  3 +-
 include/linux/pm_runtime.h        |  3 +-
 5 files changed, 132 insertions(+), 12 deletions(-)

-- 
2.56.0.398.g882cbad275-goog


