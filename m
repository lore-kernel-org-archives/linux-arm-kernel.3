Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3E0606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sjfRwqgB;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=AaxsJ0SB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9Ymc+4AQvzzaiCWsBbLGU5SMznTThrS02qv+sUCHS1I=; b=sjfRwqgBOhAlon
	OobKn+xaI0c8YuzfC1ICmumpMGWx+1eQ7M0Y5Tmiva9DwEsEMCsfiluHvc1HKwbtnkH6NjBLPU7cY
	WQU382fxXPJWVg4a7BaIVRNz1zTaobylfadYmfd7TpejQGchdJULHlhYEqs8GWTweR2yLJXwSuXFA
	B1EKH3gmxb5oPRxB69N2/chN/LJc59ciMvBnF8A6jGzFH7FOYlz43MCDK7+LsI1XkVgvFQu4N58O9
	VbxHF2WLmjkyrtw+q6eHoEQ6ETqtS/c2kb9zvzDqZNmzVu3DkLJH12w5EPveyYKSZBu7IUzrbtalD
	Yk1X9NFkdi/HqQSKjzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyZo-00000009Iut-2rUh;
	Thu, 05 Nov 2026 14:36:28 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyZj-00000009It2-1YNy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:36:26 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so2286561c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 06:36:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889382; cv=none;
        d=google.com; s=arc-20260327;
        b=M3wGeeLGC7KMCLo2cjbWbqoKOWJoPLlE6abVN5Fuxn6W9INgMfg/l2RxrxZp5I2tjv
         nU4VdDxVavAocTekGhJtf7NuZpxiKGoR3/dUGI2QKn/7L7QdpEffMeRfOgIufAe0hBhh
         M7kIa/OaJ5itROmlCcFKsvZc+6qXh/Y/UMAZT+EXaMgrPO0zod7Ckooq3g4n5wxFEO8n
         9Ad6cmFeIuOH+GgB4OG9DeGbJ4g2vyhKQuKPj/B9+jlAt4STbaO2naC4pKJ3IvucoWhT
         Sjql1uZbs7gxOFA1ggb8SgYTMTrThXGglBWVyhNcXONT9FDu5dMUjC9nuPP7Er1fyRCx
         fmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Ymc+4AQvzzaiCWsBbLGU5SMznTThrS02qv+sUCHS1I=;
        fh=pVyOOEV4VLA4p2nZq+/mhK2PZ+k96JEJG4G5BzIOKpo=;
        b=WH0Lpo9y3klTR/t6LxHobA82749KkbjIGE0vrfAyGsMmcfWz8HV2oakocg0hrZO/cf
         Vfbha88jBzG0FS+WR0i8kPzTu8NE6L/Zu/dBg5L8XGJ/p9qtBzlZbHV6kNQPSzuim/ma
         ikCw/aaeOiqzwOWJt1Kz69Zqi5XkVlTWYv3wE2GIovNWZsHgOIyGVp3ZWylH9Ov1kWrh
         wTEI9ngUUC9sEQIHxA1pW2I29rSJ/HepqC3nWBEvrFStPPyCYnV8TshT7fl6Vfc5shi4
         vi5atysvUR8BtWMQzz2CQDi0YmLZmGBU+w0kDm2YyaTrcNJA7jFJOm7Ov6iGeJ33K0ks
         RzqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793889382; x=1794494182; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Ymc+4AQvzzaiCWsBbLGU5SMznTThrS02qv+sUCHS1I=;
        b=AaxsJ0SBifIvCHby09kHsFg6WZh08uiOOQGAMDUynTln4KY4Dl7tpECHQ3vgqAbwP2
         072QaaTs/gGSNOO56AHTrGeJ4jII8I1m4qzFBxUl+M+un5sK+gYQlM6cxWy4TrpsEiB+
         AMxa0WzUmAfVAU/MP57ep6H+dcup5dUCR/nUbNnH+ajxLcn+YAhl1qOA0tOWvBeqQU8+
         F/s5INMPxq+CwNzqy9MSOa2Ek/JFkukj70VCBazdFy1P0CMvkT6TCvDCU9P+LprgnkCL
         kPNw0oo0P/TKMl0n0Ww5OqLTP2nBAOzaEaLP4Qic6jLo75I/uzRK3+ymWLLwIlUM5jsj
         ZKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889382; x=1794494182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ymc+4AQvzzaiCWsBbLGU5SMznTThrS02qv+sUCHS1I=;
        b=XhW+uAf6k0YLTFGQeTePDR/ThVu0MzMPSyG8zt1XAVC2B8ibxv4QvEn4OwtS5lHuF3
         5ImVOqIBYncQIdbPrK0tbjQKq2Hfumdmq6i6FFntZcebCiw7bS9bM7m21ojiIQVCGmVZ
         Vo+d3QYWZoWQBlyQVPc8t96pX1zxaAS1AvLEZUtiImsUUIQxH7EY3eHpy12n93K9cliT
         ranQz5Z0gn8WTdXiAqHLdw7gXba26YxTLuuKVv2RsXp7bxw3VHPCV482ddtDmyuzJEIA
         jxFsAKlZ4UeQ1hgmOUjmDsAUfm2UbTYrdsXnHgDL5+AzB1zmgpk8TXqR9iP2iyDhmfnb
         o/IA==
X-Forwarded-Encrypted: i=1; AKwUvBymaI6rSd5AhDPswcO/gru+M79S5UnsHifBuVgPL+xZEtq34jXZyatqpVU2UIRf2YylDz4AqIfXLPAp2FXyiUSG@lists.infradead.org
X-Gm-Message-State: APuU4Z8q7BH7/Pjq8MYqTdMzPcIatS5ljKpF8jjh+e2ftrxmoRturb6R
	gMmPrtHwYrgx+e5AggmTra3jLUsM/CHRi5VuFGUDuCgTYoVRZsxkhrRDhXn0JmUtGayZBUY3pYF
	7CUVvAWQDzYoigf+P6xHdg+zWpugd155m+unmdjYLMg==
X-Gm-Gg: AYBFou1uOkSiO8dWz4vchjefUCjnkhbwrWDeviRSd0zm+K6TE5lRSU0CF7rNDD0GGzt
	fmB3Ykn6GbAYXnieA2wTeBaHA9thKdCIimixje7d2RzEYK4zA3CzYV6JuhkwcymlRwKKOXbjDc8
	RpUX4SSirg3xtNs9VnJN1j+MJrt26w52W2A8qbr9meg+csFthQZKA5tyqEEwXIgM7PFdjpR2CES
	hIEnPTsrXcrNss4YBUQMtfpkgYZo8I5J7eKP739POjFILfanW3l3b2UQ2xJozmrOxNp9Ntbuh3v
	JvL0elvy6x9Oi2136Wj5VPL9VvCsilpPrT/wHQ7wdpR0Fl6Hj/3BFyvGlS0M3P4rqPK9Vv/Wv4q
	8AkJJdOkEvdxnBG4Nl5rOHYb9oHwRGBQz9jSa
X-Received: by 2002:a05:701b:454d:20b0:1b2:3b5b:b80b with SMTP id
 a92af1059eb24-1b23b5bb847mr12680614c88.8.1793889382405; Thu, 05 Nov 2026
 06:36:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com>
 <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com> <34506010.aRNtrjHk3s@diego>
In-Reply-To: <34506010.aRNtrjHk3s@diego>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 14:36:10 +0000
X-Gm-Features: AclHuK-P65od5HCTUxTkNtF8XI9WRdmLEVnuoZ_IAiO-y4WkOrppI1hKYcCtIdc
Message-ID: <CAPj87rMyMB05OTMDLSPe+oDZJYUW=oHF9E-f2LaTPCsBrKAAhQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color
 format on DW HDMI QP
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Sashiko <sashiko-bot@kernel.org>, 
	Igor Paunovic <royalnet026@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_063624_648664_5D1960C6 
X-CRM114-Status: UNSURE (   8.91  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 5 Nov 2026 at 13:22, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> except patch 9 of 15, or mail hasn't turned up yet :-)
>
> It does look fine to me, but if someone has an eye to spare ...

Nah, I just forgot to send the mail / was waiting to send until the
dclk reset thing was fixed (I forget which).

Either way, it's done now!

Cheers,
Daniel

