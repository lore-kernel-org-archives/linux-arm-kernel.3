Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB33606D819
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VU5vnNLX;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VanVbB/L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=THF8Gn9zKSMxI2CX7V8w53BXwvAHKb6Wu9y7FvwOfiw=; b=VU5vnNLXcoPxnO
	FXF7D+nyvaTmWeuIwBsqKqKW/c7wCRC9XmTadwxF7YKmbczQtlwJwQrIhossbG3bo1Etf81TYlqp/
	hnsFq40FHxGDoYADw/2MPV8+daeeb9xkDCMZt6Aa80vjbD7+APe/Ojvpe6k1x9Xut3jHBe6t+R/M+
	R3B6oSSrtg8xHi6W20t823WpMAmgupoIc5cdV/7yVCqJU490R68so6pZ2yKSRK/HhToVyeCGfBSXp
	mEgXD59C7Nzb3F4Mnp9GD9tRAbER+J6x3KztQLwHz3sHvQMp7i6/Yiu6Cuo2vXWGeYppBaqfegU2p
	y4zqB8ykjlf5GxPouZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMuJ-00000003piG-1Rxi;
	Tue, 03 Nov 2026 22:23:07 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMuG-00000003pgj-3lhj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:23:06 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso69856eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793744584; x=1794349384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THF8Gn9zKSMxI2CX7V8w53BXwvAHKb6Wu9y7FvwOfiw=;
        b=VanVbB/LWDEr1+B8HzJfTSri+Ja8U6iA653bnyy96sZSHMZnAQgkOgK8R9tGTXWlK7
         lOpduXQ9MfqKyyfZB0SqK00P68CCSWWcZSJCOF0eduTVjE1ChI0a1fa/hjm55J7qu7Gl
         RiSHVC0iq6wO3Dqj38uyjPm/ts7+ZuskCCvgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744584; x=1794349384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=THF8Gn9zKSMxI2CX7V8w53BXwvAHKb6Wu9y7FvwOfiw=;
        b=17yxRRt7yJa6d2Rnf5ZE3QTVNl2/Zhf4VwjOZ7ac+Jk4jSqQfZJK/Y3ONH2tz5hnTZ
         L0jzQnqS/66F2EMVmEyYRtcEv7ZmTK+EN7tecp2jPEgx2AQa+AuvdP9/+CzqTuSsrVIW
         cOuzPMEMmevaUw2NjtWfjrboip8M8DQCWT9HEGt2BYZL0e7v1CQpFz2j/REvaLnEiQvp
         La1wOH7SZuIoFQ3fMmdCqd8Bh15ZBPy6m0IwyILyKgbuUcWybmAv78z9zA/fmq20l7B6
         Q7Gc0/JBAds6EgZ7vl+gkG3nIgOLovq4tI9mwHd/SK4fCurwU9G826r8JsA3IsOUcMPr
         mlWw==
X-Forwarded-Encrypted: i=1; AKwUvBybpftJqf+Vb+VfdGKxkY/25KYcpS0CuEcd+NY6p8Mbr/NFwdmxiEKAnvxCqsg9jB3HaYWkDyK4xacJqJR5UEFs@lists.infradead.org
X-Gm-Message-State: APuU4Z/3d3jAJJq6fcHDTkoI2JIV3t/aOhb/r3HLcXZD7UcZu/MvWeB8
	VoDdmXqW43F6qC4SCbIqHbDoyyHTjSjlb5Cuxm7pkT/0XDBEqE4VnQkl17L9nVDa0A==
X-Gm-Gg: AYBFou36mI09fjCnno4y+5zyutAk+oThwLIDknuwK2doukZjJo9CTHpJgpXpW6hB3Y5
	w2E8zxGVIRvo+s47bDtXO2rjhMD9tX20vZRgNuaKFWshFXQGa0K5FWIqZPjAE7Dv+8ccg5zGC8S
	jRiDwfESBhxk2SyK+0m9x28Ivy7T7S1L/svsrDbpEVQZE1vdvXZrWnvxGhnGQ4v0H0LWwddKbTL
	OEKgdfd61uoh5tJCqZpMfcRP+uTQW3SVVUhkiA+5Ay/8U2eh0HpLzgCanrMHVp2IKjMveCb28Ge
	R5IuQ1midfUpdiMvY9CtJg02LuE3k0lfj9rUaB5cZXCH1wsH7qlV3wI/grQd0mMOqnk469FoOfj
	WSizOhpM8ylbsQZTJx3zg16FX1Da1z8I4GvrXFvJ3neoCIO80qLXEgb+YPmMx4KnMNYFxB2W/LJ
	tV0h/90ELJzf1cQyw0HyODUooGkcYKNbsFqe6DFX7g9hY0fjOu3huWIaZhFsyDLlQetr17zgTVw
	ha0qV/YFPc/f2I8wsbHEOby5LKas0IaWjGo54Gv2g8jGEaxsozL4n1loH/yeHMolGaUqEt+xkXJ
	fjiXrpTyblo8u3j5hXxw4Yj64E3x93nYnLjddksMf76kdoO/ryG/kItOo370scQK3VEJv++b1Dv
	ePZnYSX1bcQ5BLw==
X-Received: by 2002:a05:693c:69c9:b0:36a:13df:749d with SMTP id 5a478bee46e88-36a423b3dffmr18134134eec.24.1793744583878;
        Tue, 03 Nov 2026 14:23:03 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36ca38a67edsm988222eec.8.2026.11.03.14.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:23:02 -0800 (PST)
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
Subject: [PATCH v2 1/5] PM: runtime: Only queue an idle check for RPM-linked suppliers (part 2)
Date: Tue,  3 Nov 2026 14:14:39 -0800
Message-ID: <20261103141442.v2.1.If69ddc515c2e9fd4338441e87688b9d690d2ef36@changeid>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261103221717.3840215-1-briannorris@chromium.org>
References: <20261103221717.3840215-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_142304_942670_E21A7B88 
X-CRM114-Status: GOOD (  10.81  )
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

Commit be5755f023e7 ("PM: runtime: Only queue an idle check for
RPM-linked suppliers") was incomplete. There are two other cases where
we perform idle checks on non-DL_FLAG_PM_RUNTIME suppliers -- in
pm_runtime_set_suspended(), and in cases where we failed to resume
suppliers.

Fixes: 5244f5e2d801 ("PM: runtime: Defer suspending suppliers")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Noticed while touching this function in subsequent work.

(no changes since v1)

 drivers/base/power/runtime.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 304a2b123420..9d3508d9b4a2 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -343,6 +343,9 @@ static void __rpm_put_suppliers(struct device *dev, bool try_to_suspend)
 
 	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
 				device_links_read_lock_held()) {
+		if (!device_link_test(link, DL_FLAG_PM_RUNTIME))
+			continue;
+
 		pm_runtime_release_supplier(link);
 		if (try_to_suspend)
 			pm_request_idle(link->supplier);
-- 
2.56.0.398.g882cbad275-goog


