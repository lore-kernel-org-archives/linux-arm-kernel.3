Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D669606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vFCyN5ld;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fX7yqF49
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3Pl5KEszsxbSEkrqz64pMGPD6Bkbga9OOvIN3MFGNLg=; b=vFCyN5ldLP5y5d0vNQ9ZhUtRve
	J8/GdD9LfWqaMpR1zFjlkuJMguFkDY3HjsMLbZzTSkAz/OFNYYPSl1iXWfpFYfVmJc016SoLAyueq
	ATKPB/XZGhiijXI5jc2McLb1obsU4MCX6lxhEDylbjzv6RRPWVD37MyVI3ZcVtisAJODMhep1QaJ2
	5uIALE1He6s4vJisyxIHTkWKiFDqhYEoywoFnQQf1ZC9FVEmMQj/FHZrZzdfU2MoIONueuyIYGPqH
	iLgKj5OGUNSqfybZm7H9zydcCpekZMxacaXbGVxtrvRjIVBE7x8WeFsgGieglFUJIFJ/ZmR1iiEK0
	r5M6MXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPeM-00000009FSj-1x2I;
	Thu, 29 Oct 2026 12:54:34 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPeI-00000009FPz-35xB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 12:54:32 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1856528f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278467; x=1793883267; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Pl5KEszsxbSEkrqz64pMGPD6Bkbga9OOvIN3MFGNLg=;
        b=fX7yqF497BR6Bhdgoo6r04RxiUgBlvAFBRAdn6PuS2JmRKQiuE7enS4nEL3C47/y0A
         8iJyZCBhLx8XHJOOWYxnySyGuVSQAZYKLX3lmTzCEkKyvUlco1rgiV0c870ARa52ktqX
         MW+D1i6z5QWbHmMWfd0p/lud6MR1OEpmk+jsQDiIHPogoXnhGx2jHrlnp50UXBEG/Q+O
         GAaEfLaiZ6yO7gRIqsMBOCKYT8BFqD6agtbumksVVXKMxXauMlmRWXbTGNhCoGWkkLO0
         xPRyaw4vERONz6skeXq+whsMtK70DP7On7Pm7UbG6DKHt2GtrUYmZue5SV53BRuwvZS8
         9djA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278467; x=1793883267;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Pl5KEszsxbSEkrqz64pMGPD6Bkbga9OOvIN3MFGNLg=;
        b=c2hpETJRDupwkvEGZEy+DXDCO2NulP1G4jxxlPM8QT+DJ0bjxWg319i42XoA3ETfcu
         tc/QL/3wOgjy0dxGzAAad1Ccqz3Eget8OeJ+froiHh/lkUs9B71iiRqZKSEG3oY7+c9i
         +YMO/DDyNNaTNPiIT4Pw2TQJkomOhvTbUYjq5ou0/BBYCgiUMK7TtwoDcYOtHtUrhaeT
         lOJx+yAwCBJq1+58cBucCFj8KF64dmoiEZeVxt/xb3F6iTaJ8s7ztfBNIC9DoA0PN/aw
         n+8JGOWw28j9u5tdqgTZFjM5Qan1Mt1nENcFQC7qYrUsW3i8GVp/7phe7+4hIvY6U6i6
         0WDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9NxX8+AUAEXjY+VEkwXXiX4dk9Mnr+agrG+hA6QlVg2wda9kY6UsPEp+HMmYiq9Td16H869vahbjci7DfHgVT@lists.infradead.org
X-Gm-Message-State: AFq9FYKJ5BCwDyipPmQjURvUA7vdqGEbAjW0cPAcJ3Fc09sMMWA7GVXJ
	rqiTXd9zAhEpoL0rg/sRx0Nmal3sEmbh1Wi4m/Cg6nYWQIF9KJd0XzMgS5cUqPdJ3PE=
X-Gm-Gg: AYBFou2hr4vuzBvFPuTjjasywfksJstbpYpRENpF2P43dNP5Woaxu2OxlUeG3/BtckJ
	6jrIERn4VbTV28RMP1gLuwmsEPySglMVIVzFrs8cu+9xLxEQhuuXY/CG0s6Lq360fb623TlnuIP
	aAO1EdkhDIndhPX39AfHWcSWGCpQdjaNkhycAt/1wa+nI1NuFyssfiWvaL9OwRj9D0TBH/FM88Q
	AdCOKjctuxI7sd9e0/HyW66fFpW7XjeNS1b2XfzUJBRUJwUoMLOqytrz+33pcCDM1xrxmYDX7do
	/R25/TEcbPvYlMUo1hiuHlpIJCeKpFEMkLQ8cf8VnEq6amvDp6UTsFofzNvj4zdTVxzk2D0Le3V
	bfFh2V+26dckhlN3qsRLybomFLYl8YDg7zLNlOsYFAoW1oqzT1cA9iM+yOXn9ZKCK86Xgr53pCC
	n/9fDsq1GConiSHVLYv3Lx/UgeiWcVdP6EpjeQcsleSG/pq3WCwllEyBZ9pp1wx4dBcZzqpFGZA
	uEibQkx93FMM8ENaaMLw3w7fpC97yan6fTL4HmSJwXoLPCEpObmt8JOz58XuhchQU/ySJRS1fa+
	RUKQ4Wrm+TyGNpQHH2IGXRYSyCwH7p1JJQLLeppNmUlbepfJ9W4of3W/1B2nftXsEruX9OYEb/M
	e6hUg30mlTfdn82mBMRYxbmtIObzDzmjVbth4rFEzkBbJEGKoArZylf671xoqbHfrwjI=
X-Received: by 2002:a05:6000:46ca:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-48e679a4fbdmr2549385f8f.3.1793278466836;
        Thu, 29 Oct 2026 05:54:26 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:26 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/3] Fix rate rounding for Meson read-only dividers
Date: Thu, 29 Oct 2026 13:54:18 +0100
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6dgwtkYgr72FYtGUKo2DJFBoJ4
 e4WvICLv3jJz/t/FQGZMIhbtgrGSIH8O4E6ZcJ2+t0iUJNYqFyVMgXmMUyMegDbv4CxHfQI7KG
 hSA0yuAqxuBTKGZQiSUZGR59j4FH/OMzmiXbarXujozB5Xo4HUe69v8eihBzsVcnS5M5Uhb4bv
 fRkGM/WD6Letu0LaX4K6uEAAAA=
X-Change-ID: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_055430_809915_DFA4E1E9 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

Meson read-only dividers can round a requested rate using a divisor they
cannot program. The clock core may then adjust child clocks using the
wrong parent rate.

This series uses the divisor already set in hardware. The first two
patches add a missing /4 entry to the GXL and G12A HDMI divider tables so
that all their register values can be read correctly.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Changes in v2:
- Split the HDMI divider table fix per SoC and add Fixes tags (Jerome)
- Add a Fixes tag to the clk-regmap patch (Jerome)
- Add Jerome's Reviewed-by
- Link to v1: https://patch.msgid.link/20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com

---
Carlo Caione (3):
      clk: meson: gxbb: add the missing HDMI divider /4 alias
      clk: meson: g12a: add the missing HDMI divider /4 alias
      clk: meson: regmap: use the current divisor for read-only clocks

 drivers/clk/meson/clk-regmap.c | 34 +++++++++++++++++++++-------------
 drivers/clk/meson/g12a.c       |  3 ++-
 drivers/clk/meson/gxbb.c       |  3 ++-
 3 files changed, 25 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


