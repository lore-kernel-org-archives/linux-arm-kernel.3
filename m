Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FEA606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 00:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yN6qRdDk;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NqNFWULk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=; b=yN6qRdDkk0yhw+
	f9JDgsUdorGV91n5GlYzTH/xUbLcc7lVWfWJfLSNCG9aHynix6sHdn704Dvylb9Vt7apRy4PafM+e
	meIj4eDDuOZrxXj3gLRFUPipq1vAjGa+Rx6gWJYovZXmdKA0aantNz7aSLDcDaVJNxzCCi6iQHCBu
	Ho6UbZa6bsm6BvYycPAR/jYMNCisVxGL1JgWTHmeJZ46S/ItjKaB4NQbaovIOz22bC+X6LMNg6FK8
	RmX5qkHZFkoDR8ZmseL61PZ3abi5CmmYaMysBzOHgwpu7z3PDK3Tx0jehRgxQ52sGlS8r+SdyDnNR
	5lO4w/eXxsbsLSdGjy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJgMf-0000000D58f-2xl8;
	Thu, 22 Oct 2026 00:09:01 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJgMd-0000000D57z-0jy1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 00:09:00 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6de2f213b7aso546433eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 17:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627738; x=1793232538; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
        b=NqNFWULkKLyMH3R6n3nMKrRGV9QdZZ0K2gbGrgBBQvI2sILqPgJ8FXZEYhoml0C3tS
         N/yeZXnuwgo876ucL/P3n+2tn0TPrT8fu4ha94RpK6PoqMGpisdVadnBbu6RIOb7CPIN
         lK7bcN/+X8DKYJi0Nifr4g9kb1dQ2cYyB3nuPIfzPxkfB/ngCdHH4zbSrz7Y+JNP7Ma2
         OlL4P2acDp5rbFSqSMfv8ZDQCcgoxdenk47OaP55NHIdTCz7bvWMbmbHmMq2KJKcPXn2
         NChHJEUrCnv/n7l1IYtcVdJDhHiCqjeP7LwoZVw3LCaTP2cBH7JbqGb/0jDlbicKq0eq
         jZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627738; x=1793232538;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
        b=1ZNd3Db3J6KZLXrq9pCPGFEVkdEfvhcOg9FPy0or1ozEdZxEjKYR4xHN6YZG9So+en
         gSfZZ2sFClGr6mXjHomcI8k6KdK09IzMWFV1cuhnt9lcxFoVJ/jaf4CBM2wuTJyADtHi
         0PKMPyXgSXTubZXzenLat6jJq+T//GKTMOH7KmZLwww4/LiW2+8aH14GT6oqizQhsQNd
         +dP3ws0yPxt0ubAz6WcrDy2P/GV0V6klgmkgEhtvHezyjX5HVMAxU396k6E4qW5Of/OW
         dwlwwjE8HhOVt/FbOT6zlaea6uL4CragiydKGZQui53MEIuO1JqXu35lb6dA2oxjS2Ol
         p3mQ==
X-Forwarded-Encrypted: i=1; AKwUvByfL5oRsGatSeVy4/L8GHn2e0Ae0RNi4DNsgDdwPEY0Q5N/wXSud4djfig5lZ3wAxbPmrdfsdPlaZ4TUGT+Cjmw@lists.infradead.org
X-Gm-Message-State: AFq9FYJjY/crTZuVgvH11cU6d6vxyy5/en44vwHQMvRXWxGJb0HvVKXG
	qurN1Spk0tTeZlITfwh6nT5bMAaVjXnZmK0bxfh14+JOC/IbWyqoYqrG
X-Gm-Gg: AYBFou3ZDwDyRk69Anmgp2XIGslHC7mqMJwinYpWtG2QeTdiAhfbPxCP08VclkaGvMx
	/CajZIr/VeS9cnXeCh/VSNAA9skISLD51/xnFvioF9fDXur+nyffPfrXiaOopE6moEe9IEyQTvF
	wSSe3/71LEjUean9/fGnDYZz25qW3BdPYG8rm7MlZsOL0dMs+zLib7cYxzEqCt963JaxbEsUg26
	0oVCV7o3sg0q6YCTF2R200jRNJFUK1l3pT5TRkCapoRCN4e3os1qSdlU4C/ytn4a5fOJi9Q9e7M
	Vs0XQfUThRJgP2dipJWZajN5tnHkufWXgFiniC516/vOjqER9jkIhPxax0uw6xjd+Vr0AESz58g
	dLs7lWDL6CN4Q1TTkbY/2yGIfUd/QkDAgOPekWnNJwXckNPQRCqEYG7anHrTO4Hb2aO7rtWYHYN
	rag6tMB451CBCym9ljdgpnhCsB7L9MJj1lYV3atVBkIlma+MDgA+C6Wn3JkAo/eWUZpAKQE00vY
	SGu1B4tsj6id29QJ4PzzFXgteY0P81jTHuvpVatBIqAqRMDBSjodeMu36I0J/3nX/kdjH7Zs2qZ
	po6qVqTMAUXSGIR0zPvASbxO0EUqBPnrsianvxnyX348n6AtHO7dSyKaypGBzCwIe93E05djRTz
	vYDzEijCdvSEbr5gS9PlsWwKQEgxUV6TI7X3e3IoDOH9KO8qj2D9Rq1RPiarCyH5msC/7H/T4FR
	ARqA==
X-Received: by 2002:a05:6820:5715:20b0:70a:1787:268a with SMTP id 006d021491bc7-70a178733admr1123581eaf.89.1792627737623;
        Wed, 21 Oct 2026 17:08:57 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:08:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/2] clk: sunxi-ng: h616: export the APB2 clock
Date: Wed, 21 Oct 2026 18:08:54 -0600
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQ6CMBBEf4Xs2dW20Qr8ivHQrousYCEtEhLCv
 1v0NHmTyZsVEkfhBHWxQuRZkgwhgz4UQK0LT0Z5ZAajjNXKaEwf/5YpR7gowdZqi270BqkfqMN
 Zo61YOeKqrEoPWTNGbmT5Xdzuf86OF9O0e/eFd4nRRxeo3ausXuREfYfNEPF6PMO2fQE4WH1Sq
 AAAAA==
X-Change-ID: 20261021-submit-sun50i-h616-apb2-clock-v1-69e0ace9898b
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_170859_246002_2EE71ED9 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expose APB2's existing clock ID so device trees can reference the UART baud
clock independently of the per-port bus gates. Add the public binding ID
first, then remove the redundant private definition.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (2):
      dt-bindings: clock: sun50i-h616: export the APB2 clock
      clk: sunxi-ng: h616: drop the private APB2 clock definition

 drivers/clk/sunxi-ng/ccu-sun50i-h616.h      | 3 +--
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 9ef62592b80c7ffb8cd987d889f659c1dc4f9f16
change-id: 20261021-submit-sun50i-h616-apb2-clock-v1-69e0ace9898b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


