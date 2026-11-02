Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A8560722AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=22gB8GXa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=e8EhYO9I;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n/QxLb3k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=; b=22gB8GXaQZtprF
	uKyJj0Ph7GaTaqL1wDU1xbFmDNu5cvj62AWjYNtlctjTVV+yoj54ffwDIdWQ7GgDmTHOt9AG2TeNt
	G4VN9+5mNpJ0ZP3L/br5LNGJ3K7eH0gKPYIpC0N97MYQDnzC0r/D5MEo7BIwCZxjIE4eN52VBQXat
	b6oQZ9muHFpuFuYy+gsStO0zg4Pbh4YwGPOsCUbnqhnW6qecA4LoHZzconK23BG5lAW0EbDHQFHst
	2SWNd9DlasvGSTCMtF/rQa8hPgWECWzuP308/JYiKr2m+DM72tXZ0xUKNArzn3yd7np/cwGL4hAgh
	fWC4TgqLjNPrwn5ZKonA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNut8-0000000HIFv-3nJS;
	Mon, 02 Nov 2026 16:28:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNut8-0000000HIFW-25r5
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 16:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=; b=e8EhYO9IVd+l8WmVyeO8gVrHdj
	6zLYtzn/gFTgoIe9jG1f0eXoLKOLHemQUQYoH+UVV6mPAjY6rdmQph7ddqJrPCD4LlKPlXBKpiwvo
	NhiDqBofh6E6wPIqzt1JVxrP9eCTTI51H/P6GtMeknl7P4Md6ON5GUSYUzf2/tZ17Wdt7uohe+Bob
	pbOHXVKA0rjydEHiplbgSBVFGpI6935m247A7ljOiczLTNrKwVeNwQpQmY7z3XMIAMaT1Ng6ljbPa
	0A7+8V3U9JnUbC1cOJ4M/qXm5mCEN9BqOwCe2Jrp98/AHVwDVvBeQNBF1cwKItsvCmTRzrqIkWpAd
	LuLdxkiw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNut4-00000002oQr-0cmK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:28:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1461585f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 08:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793636876; x=1794241676; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
        b=n/QxLb3kSD+SUAgyDHqSpJyDTFRiIqIyuyqrKJ72noMfGkswPWpWUNsQIaDN2N5JP3
         UIbRRFl5MAaT31CeEzhJheSMgwL9DFCzuoDhjCVcf+Ic1WsuF1w44n2Vctarq3kfCrhL
         NmOTA/foH58uhU8zUiB/KojugV3l2Wmarp9rpiCPcrapjdKWiOHbnIdp16nzdwWpfBFy
         VwIfsOYucAScNUnaBcXn0Be6k5P4OJiMNY4gT6bDCfoG6gLG9XrlVtYG+Ri0VgfkeU/5
         Fng8PU4etuHEYNSvC2tmo0EkMQDEzeNahIXQoYKzDKTkrL3eEk0sNaKQoORMufXf0I3h
         7mCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636876; x=1794241676;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
        b=E30IC1nYYjcLssPEjSHc2TgYTLmk60M+xRKEXLzBIGD64MwpIQ/G3TqV593zqLOsj8
         vl9uEDsSizfe3VA8RXjYoTt7xIb83SV4ZOFFE0Bq62U0dJPFc7f3iP6hNp3laW9XMutq
         AX4q1R48UdOkoLY07yEofsGlStG1Bht7f5nMbr8eBRItt/Loics2eUm1pTnR3DBOym4u
         f8OryOEyVpbOiJYxeLmYFxZ7SssWi/DzWFmxLDpNdkmL+GqAd+yn++7R3B1t7RpOWtVs
         1kwHDilX3s0bf34mTse2VjcCr1bXqWZMg35mkDawM4BiPYTdLLG9uldj/uLlXp8J1qRQ
         qqAw==
X-Forwarded-Encrypted: i=1; AKwUvBytw9WOnmxNdHxAgTSDPcmrNLtsnbbeI75cdKE2mgioGg1ffyFYiZL+4oOHlFKaiMjWKVcput91QxshJBeRjiE8@lists.infradead.org
X-Gm-Message-State: APuU4Z/PtPRqIZwHWUtZP7EZDzJGFUtu/yGQYVAsqWDzSKxsd83AhWle
	0U22dwUYuX2ThMfCc5lnKvwKhMYJCpQMUo2VbOQxPSeUevCZGLSh4iI/zqhCb4E/N5o=
X-Gm-Gg: AYBFou24sYCK5wds2mptc5qa2zns06PtAJ2qqdza+JDVpz2Tz28OgZFC1v0kCJZnDOs
	Fw5JWbLSAfRtjbo7iiJpeqXZdfO9OTBLJnwUEJhJlmWE8L2xRckSPBf/ccmjStOgdrzRs9GOoDl
	SeVZFDND2JA2rGcjjGZRl94OsGkzBtxfS4goTNl9aWmAtEmnvmTCih7Ggvnn8gGLrotoYy4b/+n
	Bs1sr4GLHD/HgLoEozt9uPSUODOuL4LUWGc2n9B89FyN64Eo97LDntSTgxK7yrVNRLY1ocOcFr4
	mBOXsvKsjbhqGISQ6OpiSfnQ2PuOIBj9Ex5CJtucXOLZWEla6lo4yGkL/lxKoO4B7O2JEcNqtTA
	aM+9Isc3I14QMDUHcOr5oU6UclA/DtZYWRBzVVAfbbi2+fKhIGP2zb3YX/8FujKG73AjBjM+8et
	KjTpQtiWs1G+NsJyFBy1t6jWH+VNcRrra+jz1HRifRwsvoiP7zbZzUaSbuz2LIANVJvl7laz8Ny
	wUDu0vlDfKwG0Vi6tLCL4r0utBnRfylp4qXKr656A0y5aGQ9DPWJTGwWd+l2Bfua9kZ4AFvzkmb
	MdjorYRndj7SFJ/8N2MhLZ1ctnPDc8mF81T/rZseGFKSfBU9ZQ==
X-Received: by 2002:a05:6000:22c3:b0:48e:61c9:4e32 with SMTP id ffacd0b85a97d-48e6e505515mr22460208f8f.32.1793636875388;
        Mon, 02 Nov 2026 08:27:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d425sm21327567f8f.1.2026.11.02.08.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:27:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
Subject: Re: [PATCH v2 0/3] Fix rate rounding for Meson read-only dividers
Message-Id: <179363686177.2573818.9840227299008811238.b4-ty@b4>
Date: Mon, 02 Nov 2026 17:27:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=78; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvdnHpxHrPXvaH9XIH+4SEyWdKTjDzFkYtFOY7YbPEt
 ljWNNW4o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5dZ/hD0+n5LxFfV82ZzPZ
 LpyvGbFFh8d2+Z7r0yJVltn8e3RUezHDP9Oft5buYvW7J6K6Z1Hb+ym/t6j/8G1lnzSlRvlYf7X
 6Ri4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_162758_523855_3FFB05AC 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to clk/linux.git (clk-amlogic), thanks!

Best regards,
--
Jerome


