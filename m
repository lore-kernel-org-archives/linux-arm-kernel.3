Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD226093D6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wqzJY51Q;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SoF2n9fI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AMToe4M6xj+oOLMHUEEuNxq8X9/DeFihUNzOBRE+7x4=; b=wqzJY51QnboBRl
	t3PcfreT6EILNIKlumxXUI0MjXZGj0JHuhZNuBACzVzWvUKyiDe5K/0gZXnwqGWEMrWD3phmBWJxu
	7e3G4KFhic4ZZHPGKA6owSiSmizgsjmVa4ihwe166dYUapDIyzhov3Xp7WFabAVqdI+p7tn4DrJYU
	EOjKFHQyL1ppKyp9AOeURqaaSi0glL4NQgO6hcX6/CWespK7TKCiQIVP52LCkupLkJlN4jdpR9Jbo
	aohpEHh+3RFWdLhkPjwCWNNSaBHjO6HINf2e0XIYLVxnqGyhO+R6UdIC/L/r1g4USoMTHr+QfHeDl
	yySL7USx0In0vkRJ42ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvJ4-0000000HLsK-1dGK;
	Mon, 02 Nov 2026 16:54:50 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvJ1-0000000HLnp-3YE1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:54:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1623265f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 08:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793638486; x=1794243286; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMToe4M6xj+oOLMHUEEuNxq8X9/DeFihUNzOBRE+7x4=;
        b=SoF2n9fI5l7gfFQ9V+FchJS3Pfu/wTAzLXtGzSR4tPEQvkQ8Zpb7ZA6BkyXhA7VnBH
         EZsKkSEs5Q5/0gXWIPdS+J59uXsByUr0z8mjVwitV14ia9xqgEqgGV/Bd642zJZLyvYz
         NqKm7xLBS0fv0I1JBiAciPvld7SIlFRKINN1tnd3FJ4Asp/YPlVm+LR9T5xR0xqW12T3
         BGB0GnwfIORlG3QzK/QxVWDFnRItcZzhh4BMVnCbFUI9NY6apBJqRNUl1jwB64c4tSKf
         yrDgeuV0KbKNIy8wgCDuJWp6I+6GVHqTkL8zbORyW71gmB5jA9csiXpFhWytoIjHmrRb
         A6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638486; x=1794243286;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMToe4M6xj+oOLMHUEEuNxq8X9/DeFihUNzOBRE+7x4=;
        b=FP/wJR38c3Q8SjgMeNWWdwlrolvNyku4ocR7R3kPglhq585rb8KzShUWc/5DaEQpmD
         gZP44WESiAVmaTVLANSlNZoWrHnaMP+/laWrx/981LsjkkUEtp2/6Ir6QqjHGsZog7Vd
         +Yra8k6REyX2dkK4IKtHc06M5MLqnSS0EoQQXdow0GJveA+qfuAC6VGF71hfqnZtmRWN
         p2sG8FXaE8vZf3hSnqLuWjGzVfRUfVgWrKYZeBvF5W+tg8x5pRqUNaTKX2RrSultcKpG
         WHh6VKbFQhaQD2pkyW+8NGwmx/LKXG6uQC6W9n22N2EkOYKGv0buhw/0XaaMUH4yq69t
         4JHg==
X-Forwarded-Encrypted: i=1; AKwUvBw8v4Jb799dhF2ibm2r6kp9BHeqUtExHt5sP872UmJKLNmUWHzsdwRgAzA2S00kqXSEk8q5UmAQGE6Y9tWCvpXF@lists.infradead.org
X-Gm-Message-State: APuU4Z/TWyv3yC2j3RwR49M6OxLV4FCOG/5HXvqEJaVkYEwO1ESotDBi
	vcSdMHH+S7ba/lbZX8mPVZhAtmGPguctRWO3tXHZ/xes97srmev7UyTWBaU0jbeMPKA=
X-Gm-Gg: AYBFou0060nADFg2Rv7fhBWrj8PfUMCDsTkTz/gaZXGX9Tg6fjOTd43XT9LzDVrYqO3
	fLupD+vsxTDHc0eNrqlguruaegwU1BPh2GWGtG4jzMmEUyjy/cPkjjkVtcDaNyBFaIi9inFBDng
	/WQPEZ5o+0ZgGK/U783ebNywazu2ok5jdPkIXTwhBiR5papyZusn9Eh/xBBzaFz7YPH8p2Eo9+8
	/raz26X1FO0rSkF9GjP8QDZX/aBdM4/oe05m8fr/5QWW2gAahkc1obMnULgY+YAvj12rXecIweQ
	z704osS5rOBq6hvyzfWzUAtA8E9qCZ9NgtCB15GNi3ynBoNCV2CtG9Rn3eFGYzmpgyDojTZOQ6Q
	sWRZRb3Lt2vLNHIEEO3WV4yL8WoM64HxtoViU9S8HDR9D9JyuSBrBzsIFhs67uJFcUip6p/9fD+
	2gsu1t0nIEMU+OHm53eQJvQzWhF2dTLhXIcDGfRbIhtaqasFH4Bq/grnqbsund58FvVAD6X3RBM
	Kt8ZlXYecsH51yWAKKOmPlUEQizI8+d4wafqZJrbvVsdh5T2yZmEkGvIfrMsiknye/7YH6ycMPO
	Hh2DVm/sF0j7E7Gcajzwzy/6NJjjbrBORtBC2Pw32OQ5KVehu2ta
X-Received: by 2002:adf:e00b:0:10b0:48e:48de:ab3f with SMTP id ffacd0b85a97d-48e6e503730mr16502593f8f.52.1793638485953;
        Mon, 02 Nov 2026 08:54:45 -0800 (PST)
Received: from jarvis.. (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm21550275f8f.12.2026.11.02.08.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:54:45 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
To: rtx4060@gmail.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] regulator: mt6363: Fix the registers of the VSRAM CPU and APU LDOs
Date: Mon,  2 Nov 2026 16:54:44 +0000
Message-ID: <20261102165444.588240-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101164405.1743177-3-rtx4060@gmail.com>
References: <20261101164405.1743177-3-rtx4060@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_085447_899349_52242B79 
X-CRM114-Status: GOOD (  12.14  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 01:44:04AM +0900, GIBEOM LEE (이기범) wrote:
> VSRAM_CPUB, VSRAM_CPUM, VSRAM_CPUL and VSRAM_APU have a register of their
> own for the enable (bit 0) and low power (bit 1) bits, which the header
> defines as MT6363_RG_LDO_VSRAM_*_ADDR.

I tested this patch on a board with an MT6363. Without it, vsram-cpum
reads as enabled while its own enable bit is clear, because the driver
reads the VS1 bit. With it, the four LDOs report their own enable bit,
and vsram-cpum, which the board DT keeps always on, is now enabled at
boot. With always-on dropped for a test, enabling and disabling
vsram-cpum from a test consumer only changes its own enable bit, and VS1
stays on. I did not test the low power mode, nor disabling the other
three LDOs: on my board they supply SoC I/O and analog rails.

Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

