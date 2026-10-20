Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206A160A2616
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q83AWtHk;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cWpIx7cU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=; b=Q83AWtHklkTWCsJfVf8JB42iSa
	u/uwPqPn017VE3rd3T7rMAFdh3TIKYh5lPxzigUU5AlIAesfUpcqvKZpQX55fPRBHt0V6yE6n1wN6
	Y0bfOpksmW5azS3XdMiHeUpq8qV1dJD4gzgAy+N947nBOkvrvq9jF71/uP9Nf+PAJO1RYq9PDuGtI
	w347glzM5aRY+OrzPFKo48Rv0UfYTA4/3IAXGgzjAobcQVNPOEektVjongsVhnYGKzjLG1s9W9c9e
	PLfU0ujaoNz6EnuQ73kgef9l9JYWUyfEdNYg0E0LmEKHGH9n9WcSZZByK/zxP77UzpTeRczF49vbj
	Ymz0OM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBuK-0000000A4Ik-289M;
	Tue, 20 Oct 2026 15:37:44 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBuD-0000000A4FS-0YKb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:37:42 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-35943f55c06so1226360eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510656; x=1793115456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
        b=cWpIx7cUqCU7Z1HkqWbRyxvKqrBhosciCPeBiQEBW4xG2aRARFKdZturJyddHAvBah
         xvn6ExoJcqydXR9hYrLi+dSBOzrzhz2n7E1smsimrrF4WPkmOGWFhJPN7U95DxZbWRut
         ELFqd0MkMz1YW1koTkzjucS/zAnvA2s3PHBt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510656; x=1793115456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
        b=YP9aV+9R3H2x0WSapkTWQeU41dwUDq8XV9tqEPXt6GEiFXvUbKhvghhprAFhepBfZT
         5sWpJeFOaDjziq8cOjwIoxPHqwlSnspHMCNmhKMx5eZdqhbJDXovcbOOLiovZLMxthqS
         UoXk2r65K8+fYdr/u0Gwv6KvKrfh+YiYMEiXhRIBSqbgeyQpR/PWutIH97InbkMnxPsf
         7JyD7l19YmfqmgMs1WWsyEVho3LpSGAAIfOug0eyRU4A9DrYOc06rhcAGByZk2AqNisT
         MhoZI43Jkr9iSp7jyKUzk4V49A9c/xVWZSbEdSKTRUzdNvPMGbXHfUFl8HR2psQUwdpn
         pMnA==
X-Forwarded-Encrypted: i=1; AKwUvBxLkX+lJLRJ4g9nCNUuiOSzoB9/wsAqGHvq7ck5gruqjv5VqQryY3dTkRaTTIxsbk1iV7YmpR/Ac+Dj3mjoK15X@lists.infradead.org
X-Gm-Message-State: AFq9FYLxNfGqXkGtEd/Q1ZnMUXmCQ9akN0LBWGNtcztGE+xykoWfnE6h
	qjdkuGQwjP5bX7KArQTwuuYyzn5daWq3ZjItGuPcPGEJNCPq+cKcbDAO/cLBRtgfRg==
X-Gm-Gg: AYBFou07aZ1gFdaDSzLleTUIlucGtUM0KUIseUO7Rn10jL5MT2/UDlnQZryJK0gHV4a
	l0bQdxsX8gL4FODclaoDIPn1HEtcF0Myvx73/MFp1/E5tFFPBZBnDfYYEJZwSTY5tLAssUAkupw
	hdOXZ2BEAvKvlMKifU5wayHJB2f+rvg8lI7UnKtzpzlvIMfZ1ti6FCLtQHVF3bWBfNES/j8RO4G
	IrKep0L1uIIutB6iHALh2f7zCWlV5vQfqHZF5w3Q82yZh5WcT/vjORAThmVt5iO8CMKr6ONEQGt
	pYYLykgYOSfjcYlCjHtzi9ccAkMHMepkX+nZ1y54dZRnGxgeyynBChZpkE/bT7uUDYslhVuyjpG
	5ZjP8dhqOoK+xQcSJ6bicTduCadcV7QjXytnp04AY+zTRf28xFvBHQlrzzMcyY0fIIg2YVgrk1A
	UGgwQhox3Y5NnAxo8LG5WqLPTU5FFuPIqo5J7EqTd5wZBdCixBv0+oenh4eVCCdDvgHOaolnDUP
	JQQ0nMT8WkBh7QQgDwhvtx3gkxQPe74IXAgMclSbAQ9r+hatW0Vtg5X0OI=
X-Received: by 2002:a05:7301:1408:b0:353:ba38:789d with SMTP id 5a478bee46e88-365f53e0019mr2964076eec.0.1792510655681;
        Tue, 20 Oct 2026 08:37:35 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 3/7] scripts/dtc: Build fdtget and fdtput host tools
Date: Tue, 20 Oct 2026 08:35:21 -0700
Message-ID: <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_083737_656384_5C36E7D9 
X-CRM114-Status: GOOD (  12.99  )
X-Spam-Score: -2.4 (--)
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

Build `fdtget` and `fdtput` alongside `dtc` and `fdtoverlay` when
`CONFIG_DTC` is enabled so Kbuild rules can query and update properties
in compiled device tree / FIT blobs.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/.gitignore | 2 ++
 scripts/dtc/Makefile   | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/.gitignore b/scripts/dtc/.gitignore
index e0b5c1d2464a..24357adc8896 100644
--- a/scripts/dtc/.gitignore
+++ b/scripts/dtc/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /dtc
 /fdtoverlay
+/fdtget
+/fdtput
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index b47f4daa4515..6bce3542d8a9 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -2,7 +2,7 @@
 # scripts/dtc makefile
 
 # *** Also keep .gitignore in sync when changing ***
-hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay
+hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay fdtget fdtput
 hostprogs-always-$(CHECK_DTBS)		+= dtc
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
@@ -10,10 +10,12 @@ dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
 
 # The upstream project builds libfdt as a separate library.  We are choosing to
-# instead directly link the libfdt object files into fdtoverlay.
+# instead directly link the libfdt object files into the host tools.
 libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
 libfdt		= $(addprefix libfdt/,$(libfdt-objs))
 fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
+fdtget-objs	:= $(libfdt) fdtget.o util.o
+fdtput-objs	:= $(libfdt) fdtput.o util.o
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS += -I $(src)/libfdt
-- 
2.56.0.212.g129ede20d9-goog


