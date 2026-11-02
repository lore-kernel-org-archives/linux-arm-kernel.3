Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B9B60703B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1nXMxy2S;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eLEULkaY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iKqppwJgaOXP6N2jFbbLAd1EvvxPKuXzSzDJiISCkR8=; b=1nXMxy2SSHo9bP
	WAcVFDNcz06jMkuJO6+nIVc7HYh6RMtElniLawIVjRfG7wNoc2yzZY/bh6Q/BcadRCDMqHBzTSazS
	EVIDjIeKmehsfAgDMxu2K9RRAXr7E2POuqjkD5zm4FMgRqF9mEpnaYq0CI3QTPmOX3bvCta8qndnS
	Ef89DuvMC/XfYv9xZeQ2xV15+Hw1EdzpFz+rqlt3wq238eQdhZ3prWIh+2/GZqM3OT3qoQ4wkJlrQ
	OyVuydyV0/JmSIhOlWPDZpVqw8de841q7lqsrGAMRcy36xZ1gBXw3814Ku9X2ZvgZAVjnYDk4VFIc
	wUsv7FTg43OA1P4Sp8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuZh-0000000HFFJ-1fIJ;
	Mon, 02 Nov 2026 16:07:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuZd-0000000HFEb-3KWf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:07:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so30803845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 08:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793635672; x=1794240472; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iKqppwJgaOXP6N2jFbbLAd1EvvxPKuXzSzDJiISCkR8=;
        b=eLEULkaY1xh1UmL/ZqbTNHmtNkO7LlhkAUJL4Nxrtyqe9jV2fBiRh1uwupV28bJv1S
         b9Bea0qD0qfiV1Dl0YQP3W/TpgYVyfCc6ZhVmTUM63X7MwbmEnjCHmbFAcvgEPJfjoy2
         p0DcExwwgdmC6k1zMaK51yDYkTZ9gdAWT0mhw8PPd/8+B1QQFM+Rfmy/G8IERYmKZhB3
         VMFmNreW+cyaDBl39Iu+aiLZ4MK1dN+5K02GxLySc7lWLUg5bcM7Mo1ndg+Px8Mz+bQG
         WIQbzx04m3wHsAx/7FV7Z8guBoJl/FM0SgE9gulTW3HunTIML/IypiMffq4HP/1YdQrQ
         4dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635672; x=1794240472;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iKqppwJgaOXP6N2jFbbLAd1EvvxPKuXzSzDJiISCkR8=;
        b=HpXXbMuU1YT1FR02/3uDGajzoP853GPbBQ7NVfSQ+86tIRNhFC3/NLFChghvBhIRZQ
         Be618RADmtbYgOp2BVm9/DmoUf0Z7l7ZfT9mglJyXP6KhlEiCYPm7sr4qQ3qwVsCkK1q
         9FFGO0xsxvXBQahMTX87iXDg3r0K+4i222kV2TTuL20M5DHES4Bf1nCG6tYOl3TnBQ6j
         F2oItCiPeoHg+yMfkt5MDkGDxVIPvUwZa2DfzrvB8nF0gYy0zKhRB87Z1xtJ7UmWveUn
         wT5bxpZSVRJEc6TS06tgec6ieS9RT7oQCzoY7YYc/OSedXHKBWQJpTdfaAP8sgEa3jDm
         zCJA==
X-Forwarded-Encrypted: i=1; AKwUvByw3igEkfUbM6wikP+hpkjKxMQEuloi4CXb6u+iBGCuHX7kkswTNehOfLRRQ4mc6fNxKNGSk9H7nPpyyruGgAM/@lists.infradead.org
X-Gm-Message-State: AFq9FYKUGQoEP6snMSPM5vV2Ski36Z3DIQEV8DbFkxotZ2rrJWYmWglm
	EHTWEx8TVfD4dbt2y1PadsmlOdmUMr1758JE4Sb0t+DFMxdspkl+KwXB9zC0bZJl1d3HrABZA04
	YhX/I
X-Gm-Gg: AYBFou0cTyD8Lia5mEKXEwP1UeYK7/Ba8OdQOBEAz5xyHtShDerD+YOIPFM4sOZHIsJ
	JvROXZ4H4Njrj0Msq3pjiuxKLkC2ZHTE63GkhshnmJiThA+gw3m+VXKxkXD26hcGs11zzOudwN3
	eb93S1oS2oCmVAvKLsWZ7jSFlwsAiIvlGLJfvTNuwMv01tXbVuWQB526QAGWAYOW/gGp2msC2DN
	bpJx7PTJSix0NHVhR5+n8aLP0yL4kAYbOpDH3rtwS12f4l8U2vSM3T5REER9eNHKKC0MSs4yHlF
	OjINNWPP3S2xTAsYB/agg4YvZUCsuNeNjkutFcDvUKSpoHSnRh2923u/sk0KeI7FK63u/1N/ezf
	lsNI5fRyD/UY7Rh1LurazZRflvqrNLG9UhalYZZxvmHkkjej3ZFKl/r6/hBnp7EBf7ORHSYF1ZZ
	+IdjjhtzjEX8gEAfC7wAEVoxOzNIB9VHOHqszMUWRFZZnp0CdQ0GDiqzM41FbrnUolwuPvstPaO
	3pbX5dAR5YTL2xaIagtfngWeFxItNH4usIPXbWBKdqW5w1mwqXB9lRSIptYbNNzs4C5/pZp16jR
	sQi8fMCq4RXbi63KnnpzMCm0FCtIpf1Y/7UY/Gq2aMUYN2V0yThfoS/to2lD9ggVqIkvcHLJQw=
	=
X-Received: by 2002:a05:600c:350b:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4ac1932bac0mr210839835e9.29.1793635671784;
        Mon, 02 Nov 2026 08:07:51 -0800 (PST)
Received: from jarvis.. (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm360429605e9.12.2026.11.02.08.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:07:51 -0800 (PST)
From: amergnat@baylibre.com
To: rtx4060@gmail.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] regulator: mt6363: Use 8-bit regmap values
Date: Mon,  2 Nov 2026 16:07:50 +0000
Message-ID: <20261102160750.230679-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101164405.1743177-2-rtx4060@gmail.com>
References: <20261101164405.1743177-2-rtx4060@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_080753_840113_0D157E76 
X-CRM114-Status: GOOD (  10.17  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 01:44:03AM +0900, GIBEOM LEE (이기범) wrote:
> The registers of the MT6363 are 8 bits wide, but the regmap has 16-bit
> values.

I had the same fix ready before this series and have now posted it,
together with a VEMC voltage fix:
https://lore.kernel.org/all/20261102-rgp-67-mt6363-regulator-fixes-v1-1-420789a3113e@baylibre.com/

The only difference in behavior is the BUCK_TOP key, which mine stores
as __le16: with 8-bit values, regmap_bulk_write() sends the u16 key byte
by byte in memory order, so a big-endian kernel writes its high byte to
the first key register.

