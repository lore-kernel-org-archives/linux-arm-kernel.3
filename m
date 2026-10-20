Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447FE60A263C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3lasfzdy;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YLW2xCoK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=; b=3lasfzdyr4pS4AIkVYWlYuxwk8
	shOOGncBtSULj7Pp31HBcS5TcVFgzZgsoYhDyQCDIzKyI9t7eygRom9L7bKZViv8llrRSIxQhgs+k
	fcRNXcsG6KezLsSOllVoDwoUlSyceSQieVA2xaZDYIdf4YYEzXMvxkfl8nsDKdzTxnAr0baExOKpZ
	x0VfD4G0JVLG7hPyXauPtGMHCRhMz0lxgcJx/VDa57M09jLm0GfTfYLWS1WkhDFS9aqQkrXxXy4w0
	SuMFAIWaixM9I+l4icwbErk8CMCPFZmsgVj6Uq1KsA6KEENVv+X7Pbm1tOp9XgYW9z5Ap8Vk55Jqj
	1LneDjAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBuE-0000000A4G8-1DeI;
	Tue, 20 Oct 2026 15:37:38 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBu5-0000000A4DW-2pG1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:37:34 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-35b2c599f43so990353eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510649; x=1793115449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
        b=YLW2xCoKRrc9YSv7QfmFtmED5muO1vUz9S6PtZ150iNi2VB0/B9OaUl7c0KcYFzxfW
         XsDx+NtfMECt+iHNbHXJPUwB4otxllcevRCewGXMTP9S7tfzxLK3GJKh9jnHX1mguvo8
         wW/HDoKg6vbDNKZbe2Ziykd++u30KaIIISO38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510649; x=1793115449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
        b=e47RkuCjm1GWD1V85ptOSu4MtgFyqeNBgeOneTJ/C6SwIFtrWvW4xVm/fu5AWoYlCf
         RAKzDI2xWxbtwwdYifQUGWOIZSQzQJUnxYSnklLAZMg7D864QrRno7eQr2mk0g4wLlWo
         zItar72IGjpjS4XXEuoSpFEboiqqrILkeURefpZHPfkDViFBtpkAzQAHbGJO4D7D+eW+
         DFHzt7gePfn/ETZ5GRMdjjPIP0zt1lTsf5bb0mOZ5oSutnKwW+zfAUFxBhgBJKGSLvtu
         caaeIyxeDMS5Q2aDGRg5x1PQXMg8kvYqQqwcqFNk3Gx7/CvLMkiNhNaEntKxSn/i4ZCZ
         5qsw==
X-Forwarded-Encrypted: i=1; AKwUvBwl55fLd/l1tGpRdBO8C6D//ilTiiKviGSqJxzNztuAfsSNFutZSnhb04ykUVP/T5MDjVTBiIxyarXnOX0oLKcU@lists.infradead.org
X-Gm-Message-State: AFq9FYIp/lJO3duNFGyKqAlIBEFmWbuFhff2zj5uuBN0yuXHFz6zTthc
	OOxt/uOS5ltws+1tih98JqVBU69seg0JAkqj5TlQTvlOpGizKHupvDRbEEjmDLciKA==
X-Gm-Gg: AYBFou1+0xzEDzqBuFYgyHhQB+XF7UItTxQYKVleMoeI3aPH8BQBr0R1m9YoC8Z7qf5
	l6KyLtKoxYsNIJPnu9HxJsglPeZGRD0EPA0g6F7HWN9XySeiv/+Y0HKQ9bXQekEfSsZIEROgxZS
	pC/gqipK/gZoPXOiiBFBOR07DtgB+fQg9VHkyPn7pUfcN4MBT0yX4Kx4/t1VxCvJE8ZZdHEoXmn
	AJawzBGx94ShQImZN7qmYZCe2SGotb5pfcbkTeRTBFnl3fEpvwx9uuY81RUs6IDEBoIOb0mBOXV
	EXJeSGWuP/vu2JMoAugv80beOIvsuISeiD52HlGBr1DHun0HGfyQ5YxgtYLfgubH7Bo+wfjtUuz
	eISyGPbjg+K0TdZmQreYss6h1bCE/hxLOcOcrUAegMN+b4Moq4OyCOS+OQgMAyWUKY3EccY7P5s
	kMt7Drk6YJgcUXpDHYjOXEuBT6a+F+fZ1nju0SnuqZTdPP1dOcnrzY8IYVOmD/+nobg1l4Rt1jc
	YULe2gAn2IpN1YoLw3uT+sTc/hSS/6oqecqiKLq9cvvoMvOGrp4pwyQO2g=
X-Received: by 2002:a05:693c:6391:20b0:366:e24d:a0f6 with SMTP id 5a478bee46e88-366e24da2d3mr927924eec.29.1792510648703;
        Tue, 20 Oct 2026 08:37:28 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:27 -0700 (PDT)
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
Subject: [RFC PATCH 1/7] scripts/dtc: Add fdtget.c and fdtput.c to sync script
Date: Tue, 20 Oct 2026 08:35:19 -0700
Message-ID: <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_083729_711160_CB1A4D05 
X-CRM114-Status: GOOD (  13.02  )
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

fdtget.c and fdtput.c were imported into scripts/dtc/ in commit
cd296721a964 ("dtc: import latest upstream dtc") prior to the creation
of update-dtc-source.sh, and were never added to the sync script.

Add FDTGET_SOURCE and FDTPUT_SOURCE to update-dtc-source.sh so they are
kept in sync with the rest of scripts/dtc/.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/update-dtc-source.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
index 94627541533e..f21da460742e 100755
--- a/scripts/dtc/update-dtc-source.sh
+++ b/scripts/dtc/update-dtc-source.sh
@@ -38,6 +38,8 @@ LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
 		fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
 FDTOVERLAY_SOURCE=fdtoverlay.c
+FDTGET_SOURCE=fdtget.c
+FDTPUT_SOURCE=fdtput.c
 
 get_last_dtc_version() {
 	git log --oneline scripts/dtc/ | grep 'upstream' | head -1 | sed -e 's/^.* \(.*\)/\1/'
@@ -55,7 +57,7 @@ dtc_log=$(git log --oneline ${last_dtc_ver}..)
 
 # Copy the files into the Linux tree
 cd $DTC_LINUX_PATH
-for f in $DTC_SOURCE $FDTOVERLAY_SOURCE; do
+for f in $DTC_SOURCE $FDTOVERLAY_SOURCE $FDTGET_SOURCE $FDTPUT_SOURCE; do
 	cp ${DTC_UPSTREAM_PATH}/${f} ${f}
 	git add ${f}
 done
-- 
2.56.0.212.g129ede20d9-goog


