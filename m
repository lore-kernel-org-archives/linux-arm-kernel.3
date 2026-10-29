Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D84606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OXVW5gVY;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bLwQbsqk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O73xnnUqQvELra/ffGr+ZGulR7alxp36K/afX4bZ+3s=; b=OXVW5gVY20A1bj
	doRKXYFa6kzdAT6kbrUK17ap01Gd8riiT17GqHnD1bPN615mS5DvYNS2ka4j+l4g7VCfPZ2l7x+fb
	YBOPhwUJyKCwzIC2jYRJmkM1t3XuLEeTk/7knRJr8n44A/OQ/NMjmJqad7Tq/FzzJbEj2xg25Hau+
	5PPdtn293EiXBN2g3hl2uKohkKE4vME6v5gdRDAdZGk63kQqB43RqkNzjZmRxRcMSyRDspPhgNKiL
	wjPDbW5U3c//d0BMO+NsUtamFolwYtu/rdM3NnDvN44Q0gfC0ZuK94Cl3amqJJpxJSYr8n6Bb4MQM
	8sPpA78eARMTjB9mpkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNzM-000000092rz-2XdN;
	Thu, 29 Oct 2026 11:08:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNzB-000000092la-1ykY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 11:07:59 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so19639765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 04:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793272075; x=1793876875; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O73xnnUqQvELra/ffGr+ZGulR7alxp36K/afX4bZ+3s=;
        b=bLwQbsqkuvNYTTIZQPjCm5rVYYNRJH5Y2uuKygDM8nq2H3e4fd5RBEyIFINGe/HozP
         HXXXtfRTJnfwzNJIFVL6Z8eKJVrNaNPkviCGpPR1Xqc2G+SlQm4s8nGFk4qSnznoYYS/
         QTDamye/hA5PY4EUnmnf72uKkSVZszQ1ZK55CWXqxt8awXkHdccrM7/8lLS9gW9LPw69
         qaUH5Rq8N1gVZXKft2U6ME0whIHMGBhcSRZuwB5kfdcP78xtrR+w/ss52P+RkXaV4zYR
         lLEVoVzU0qivS/Yf4PwlJbzJt8bUDHCyg1SvOTDBl/2yWz2DL6qaFRXjCbITPS0tiTlY
         6/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272075; x=1793876875;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O73xnnUqQvELra/ffGr+ZGulR7alxp36K/afX4bZ+3s=;
        b=U1VFiAxcCULsljWN1j7cZ7/qXe+D/vaJCgWEoLXRgRssHE8aEtAvVPL3/Dnw3wyGAH
         LEI/MvIKYEt035p1ngm7eou484VjRs+8fEu8HVEwmMznnvakunMUx9Zq9oN4GkyOKTKD
         j9unt6JmIFnvZ2Za6SRRUEThEoIFjmggQ5q4CVQW5Vhxx+K1o8P/W1WwFXpbIBlYyulb
         /VF8yL0dfKk7Ksae/Eu+CDGywp0nhxz9kEo/KV8e3aAuZv3rOVoJe8SVuXCKvVLQFHat
         U/ozzZx01PuXsHhDp/0mVlFzrkkt/cVMJw3jZp/L9eUzh8v5gblW2sYFRDLIFo9u62dl
         3Amg==
X-Forwarded-Encrypted: i=1; AKwUvBwfg+qJXAAxgl6dRFe7bojIwMVv4GjODA+opjKfEPxiOa6O5+lo03rDzOEccNw2IePGbWErVCeIeVQBAuKeTaXV@lists.infradead.org
X-Gm-Message-State: AFq9FYLIIv3UNCvp/UgSHxPkNu4Ir92GIvb86HDVKTNUYFBOTpoMIq3v
	w/rvA2NGzyCJb08+rpfwNKntjS0uf51yrrFrEQ/0EIqrziXGD6qEzlya5j6kCvbNXSE=
X-Gm-Gg: AYBFou07ZsSKrNvC2DTw/JHlxqCcBCCnDQ35G1NlIx5fuURjy4rJ+xcYolC1FFGur0j
	iEwaVAM9zpKNBC9Cg3E4/zK9GsKcvvNJ/Fv7P6Mc+k0C3TUUGO0KWbyvzg7imymzIhkPl5Wiup/
	h2C7J1Aw4DyyumGbfNdbntccUReGk1Fw/L/mKfHOHUlxydmS1A5b/mIAQOmeB9J4LTbIbwYBt1L
	8Wh3RS0ANil2h2FkYWmg1M7vCs2/+3wXbwaJkx01+W9jtalsb+3mQj2PWcNSsHHIDDRhVgKUjL5
	sJFwRLacQtpIGtkTNxkvEqRY64RCd2gzlM0TCQipHjBoquN0zBfIBAwgIVvHZN1gSIb4vScgXPs
	yQ6oHH52wJMtHM3X9Y7hEVKNfr/VGF6+uoW4IgFdiOQDSVS4hrfKjIttZyjDGXgd0hIFrIFRiNu
	/qVwx7TEffsMQ90KfkxcU2QRAMqz1U6s+2UJmcKLIOuQHhR7a4Cz/53HGRMa4kp7ukdBM1KZyRZ
	YkURjvjlcUPWot9JPchayk0HZAUem1VlUVUx0bSSw1HM6yOqCKUBNwQzFVDn8693YNxShPh2KcX
	Pcm0CU0Sz4h5ZawguS2yDbavKM6KFCLXKy0Tvm5R1uYdZGGUGHy0weJ8oyL9x9VGCZ9NOQ==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a965dd3274mr123729855e9.11.1793272075153;
        Thu, 29 Oct 2026 04:07:55 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f41895fsm51035565e9.5.2026.10.29.04.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:07:54 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] clk: meson: regmap: use the current divisor for
 read-only clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-2-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
 <20261026-upstream-clk-regmap-ro-divider-v1-2-c8216b0fb93a@baylibre.com>
Date: Thu, 29 Oct 2026 12:07:46 +0100
Message-Id: <179327206664.1865333.6840169064466594528.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=586; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=nrVNC7hHxSqNoUqQLRJq4FIPYelw+3Hubgb0s4fcz7E=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmPNTmumOoztc4onjjRI3Jmxovpf2OeJ7SY5/xuKV3pv
 8fffgV3RykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbSJczwP03juURXa+0zXYU/
 u56nXgy9r/GN5TiH6OJfAmbdG2vuezIyXLtkpNMdHKzwRN1b7ofSgcQb547eWz7d+AjrkuO970/
 xsgIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_040757_539845_0200699C 
X-CRM114-Status: UNSURE (   8.64  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> None of the Meson clocks using clk_regmap_divider_ro_ops set
> CLK_DIVIDER_READ_ONLY. Without that flag, the shared rounding callback
> can choose a new divisor even though these ops cannot program it. The
> clock core may then adjust child clocks using the wrong parent rate.
> 
> Make the read-only ops always round using the current hardware divisor.
> Parent rate changes remain allowed with CLK_SET_RATE_PARENT.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Fixes tag maybe ?

With this

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


