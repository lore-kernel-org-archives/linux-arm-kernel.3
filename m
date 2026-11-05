Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0oSL+Qme;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQI62HWk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z9XTrE2yrR3HPAGKN8cfazsOZArS5Wy1dlBvlHzw8y0=; b=0oSL+QmeWKBMjf
	XVNkFV/rMv9TingdxA2bK/KKUxx+Ok1GBGXHQrryszsmDnf6pm+J0njtShjNIBilREVFOBj2xWRWG
	gGwh7MfNOGVFU+UxbanQdFISXE4hrwDgT5h2p41TA7K7uDYCGcKdpksECBB31ZnU8Q9DN1/AqBnb0
	jUCEWki7SFdIC2QYTM/zLU+B9gyXijt9aBXp2+dlbuOng+6By63cJwdQrwb7baij5QNA6AkJZYEFZ
	3Uoe1X2MBeo+O9bZiqTqDj5tTo+GjuDhHTdhBvReNbW1sSrG/c/8dtNnCgGZXSl7Fw6wo3yTtM976
	xOTwZ+bvOK+A4WdvucjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5t5-0000000AnGB-12HW;
	Thu, 05 Nov 2026 22:24:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5sy-0000000AnFT-2qiu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:24:48 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so431064a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 14:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917483; x=1794522283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9XTrE2yrR3HPAGKN8cfazsOZArS5Wy1dlBvlHzw8y0=;
        b=FQI62HWkW/s4QuH8OmT8SwJ6uey6R+g7Yxr5qpchUR7sp4uxCZEi05Pkbv6pXVpFCe
         pHp6C1XOBbCm04zcEgiKD/IclsX94wPWIk8S/OmLpVwYh2xSmtV09FJ3H23EyyhqJZcD
         glxY4ZFvhPionzqFfuTvrejqOsfZ36wKzEpNkP8gNHQtIqCJNVUihuDuDbfIx8N/yAfb
         Rwogwu1egFFGLRudMU/p9p433TexrF3km41bVJwyGTN4enAmK/0vgCrXOXVztOnD9EO1
         zCCP/WZe7hs7S97qZGlHIuAN1L2ChlsGPwky/bWv64Evq3ZekPpnVzI0/2K3+9r/cvGd
         Xtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917483; x=1794522283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9XTrE2yrR3HPAGKN8cfazsOZArS5Wy1dlBvlHzw8y0=;
        b=BwiYnnTjw3BJre0Hk3ME0ftBqwIyEYCmMrgeyuvugHVZkP6wgMc6VTWUh56EpfszCf
         R+4pq7vz2pEr1EWYUI9mouv5AyYcx76TuJfdn9HXNld0nvYUrVrFAw8uUHkc3/912D+c
         xCN2xEHb0ZgHYyT+4TJq2WYb/brYdp5YyaiEqY3IzJnWVxtrtpUpZBVJ3/ZkZ4OwUwb+
         DJwvC1OuqUJ91Mz7lY8PaMMcSoU3XTwQbnNF3JazWpY4FaztQjF4qKs+ZDGZLgJAbJBM
         LseyYmp3Jl6vsRs0O5Kzvx85V5C7tjjHuXsL5WnyYDAQhHSFXxPIVNBs0rHR/afhQ4HD
         WQwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDfStwUXE/OsEWrvhYNl7BPXkZ0uRADCNshGfUecFElWdZsJQxscZtCmRkb0TuUbVBTlS7Sk/C6DAOvJa99NQV@lists.infradead.org
X-Gm-Message-State: APuU4Z/QshtCXq2kj++CSFHjDLEzRxVpq3hovxbGeDU6dU7LtPQ5nUUu
	59e6lG1TlOPryHwS0DrG9rhwQy0+ELy1Ckmj5f69Aw0X6++3e9Q4L2HrNkO8Msv4C9+Ffpg3
X-Gm-Gg: AYBFou0wlJOnw40uRsaVOKQonJC2PG1RFsgXCGGtBSHjR/NRS2Kz/yq5qqxq0MkvQzC
	xgaHjZVPZYzuVXLuFb80yrSKOkUGDjlKDYaeFiZg6SPwFnm17CCjUJ6i4Uq49pe6nOr7ZK0bGr2
	Z+Fgx8Gw9EUzCefIHf8pemujM+NWyA3L2fQ31I9RidcLu9WsQexOJ8wEh9xHQjiGjeKJfTJY9Fq
	liR86KLZ+9fVz8GkWGkaKg16KFjMAvsTkE/r1AXbpNp8YTAaXVVbm7bOKNFkURyMIt+xUEZonCo
	orUwDaCr2xic1Q0Yx9S/69HuNplK4ctFEBsFH+QkvHQYaeN0ErUVnXB7g13+U01q42GT1SYgikb
	q8iKxccFqv39wCEv8iRDHVAaWB76UTLEiAaRychboNxUSCeqwC/eHEwpw+mvpKDnTzJR6vEY1Lj
	lRny5Zw/BRzahDFSEZRvBi0e6xZTGQWt8Ut5mgTs2iRhK7/iEiZGG1Aaku60Ivs0xx6zOIGDEYJ
	QNF27A2RAIG6fWW79LFLaI61OyovY1yQ5LQ8mK4aYDjvKIbcC/1qyXb4vG0HzGjOo2euQnIXJch
	6L2HoQtxYvkDlA/xBqH+FAKr1oEuAXffcoZzYNsIJvGs/h7S7g==
X-Received: by 2002:a05:6402:5384:b0:6b4:d7fb:affd with SMTP id 4fb4d7f45d1cf-6b5977de20emr411756a12.12.1793917482391;
        Thu, 05 Nov 2026 14:24:42 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac57b9csm2103697a12.15.2026.11.05.14.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:24:41 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Alexander Letuchiy <asalde.le1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
Date: Fri,  6 Nov 2026 01:24:34 +0300
Message-ID: <20261105222435.571449-1-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <xUMh3NwVp4cBhFsWWFE2Xng4h8YH95iJM37_I158WAyVmsRCPbirWT1iU8eMFeiSFw8xco0X45o-2NOeB6Jc4_nWAg25pFPgDMwK3mKzm34=@protonmail.com>
References: <xUMh3NwVp4cBhFsWWFE2Xng4h8YH95iJM37_I158WAyVmsRCPbirWT1iU8eMFeiSFw8xco0X45o-2NOeB6Jc4_nWAg25pFPgDMwK3mKzm34=@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_142445_396155_3883387F 
X-CRM114-Status: GOOD (  12.28  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Roman,

Thanks for looking.

On Thu, Nov 5, 2026 at 11:50 PM, Roman Vivchar wrote:
> Does mt6895 actually share the same reset layout as mt6589? Given the
> generation leap between these, the former is very unlikely to use
> the same resets.

The vendor kernel for this SoC binds the watchdog with the same
compatible list ("mediatek,mt6895-wdt", "mediatek,mt6589-wdt") at the
same address, and its register definitions are identical to mtk_wdt.c.

The TOPRGU reset layout is the one thing I can't confirm, as I found no
reset table for MT6895 there. This series does not use it: the DT has
no #reset-cells and no consumers. If reset lines are needed later, I
will add a dedicated mt6895_data to the driver.

I also tested the watchdog on the device: while userspace keeps
kicking it, the system stays up, and once the kicks stop the watchdog
resets the board after the timeout.

Best regards,
Alexander

