Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84BC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i/ixgeYc;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MNSUQQkE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKNUIkvvRElNLCz/nkWKn3YDTekvBpvFpeCv+ciRNW0=; b=i/ixgeYczhZ3qt085z1N//eVvs
	2sJpDnfOpjp7hbDo45rM9ZfZmpQtgK2Le8DzlUg+ksTvo9oLEH2g/4rg0gPw0sbWdKVRG9KaWhG1D
	3ievD9qyyvjDLyPvCMY58Y0M/SSPSs/JJ5BCw0Ra+4OFzJWX46sQexLza0pAvug6I+/dUW80weCfk
	sbr3bN9HSGIh3VSZXv/pVfFQi2YR06HO73GhFiDxVT9GHz3gxw51ncq2HyEG+m5L78Sk9DMgyKm0t
	JrlaM/BJzL+TrL/Aoo9iAxrpXgjJbY9u3lTFHm/s2O8Yr9ZrIbWZGa5SdXtYBEWd4kXL8j37q+56r
	Zjk1lvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7pC-00000009WJE-3OBJ;
	Tue, 20 Oct 2026 11:16:11 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7p9-00000009WIe-2nOG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:16:08 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-353804b591eso5895179eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792494966; x=1793099766; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BKNUIkvvRElNLCz/nkWKn3YDTekvBpvFpeCv+ciRNW0=;
        b=MNSUQQkEZ3Ahx1bPayHZAajNbE3JFQ1l+azInSjMWzSFJQOhJ0MqMJAs91G+jwAG04
         j8AkaQQyffGKDLovGNXqHd1S5L1euJFq8tByxNlmrJsqF8WNCDElmO8O9kRbiaDr0njd
         X6KHgUvG7/TgxJte1CTdwYMixsK2Sf10hrwO7q9TCOOAx9coxqbBu3bvXBgXDNfVhJ3G
         gJkPqMUTTTIVF2Ysm6OXncG7DMYiCYWu12SmPTmc0z46gJP+FOkv1XMjbYOz9iQerwjG
         dstBlOWGvish83U+CzVWr5Rpg85c7NPk6qKxANlr9+H9F6cSvo/hxCHtBqO0iXRnkxDW
         3gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494966; x=1793099766;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKNUIkvvRElNLCz/nkWKn3YDTekvBpvFpeCv+ciRNW0=;
        b=z5/wYXydwysrGwqKgOC7CR7XQTF+84oqRE9fxvBqMr+rhUUrImnXd02F4971Y+tFBs
         9uHrJGwYAJzXRevd60SrxvrnC0BKCBtJv9fNiBKMvyuePfpnu9ACIqz8fEKtqiZXmnui
         iSzOLRKDf2aSTmuur84jXqzEcotS2cpj2DG1Ld+NnRc7d6AH+29U79oXenLc6V73Lu+u
         SqbVAGngeurLqzWiJMg6fObT8U1s56yLqUGejBHAKB/XfDY1wiKuTwWpntSK8TE8ZUy5
         l+xL/wCJGD63kcGH5FMX/u+iGHgwAvtnnOiANwOrlLfZ31ms3d+v6GlIEdHJG2ydnV4w
         sJHw==
X-Forwarded-Encrypted: i=1; AKwUvBwNMjj9G/qZV2db1lg8E1F4PZFFHybphPoCjO6WE3l5ZPKQi1eXm1PyuYeXaF3inXvqcL6EDgqKIgoXR0bzwA94@lists.infradead.org
X-Gm-Message-State: AFq9FYKomc5B2NSTjIhFHAIzTueNkGDNs603FF+0Ni2b2riNNZ4FtLwt
	lUojFFEw+lRqiQUyu8rxk6R4FKtzL00If+8jkTKpwCU8O0tHCr/Ai6mk
X-Gm-Gg: AYBFou0veODqtJBaqFutghRksup1GSfr74cBO7Pr+RMtjY0qF5P8uGdM6+Azw3Dyur/
	7kP772CjtQXhxEhOa/u+upVPzBCYIyY8TpmZxEt8NjeRDIX25homf8LadC0cJeGaQnGpuvg+gfI
	mWp820nAZv156R3PrOtJTm68lOGza1ls/0Mjs1UdpopkObrwD3k2b2HFzHxQN/dFp+v94f9FPcA
	UAVHoz8TcPxnsbJD60m8dwfwxyiMXFw4iKiYuZMiif9HbNn6F1EnLQiiYbYT1SJ/xOPt+GpSEUR
	n37la/IPS6HmNjdOfFExol5VN5I/92GsgeZYYgKvwnowal3eXxAmXbwK+TC76LjEqUqfqwC56Pk
	OAiV3PIgHO4f5xcuCzebkNOMxowCoRbwNa8UTiUps6nGDtdeLkh9jlWDy7MpwREWtgqiMWg6JrW
	UpWgypk1FU9T5Vm4dQhKJlOsBxiV/NrgZQSPT6h8cxllPHfxRus53mnjkBRyK23BedEahYxe0pr
	mrW
X-Received: by 2002:a05:693c:42ca:b0:35b:91da:7cb with SMTP id 5a478bee46e88-361a284198emr14197128eec.35.1792494966059;
        Tue, 20 Oct 2026 04:16:06 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081fa5a6esm41461147eec.16.2026.10.20.04.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:16:05 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:15:57 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: simple-bridge: Support
 data-enable-active endpoint property
Message-ID: <u3zistwpxmtjstw6lqh2qfvr3mrj5ozflxfnrln2qqitjnj6lw@5ea5j3zmonw7>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-2-ef6a3a780472@toradex.com>
 <atZ0jECm5BDeROSI@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atZ0jECm5BDeROSI@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_041607_729573_D0150406 
X-CRM114-Status: GOOD (  14.90  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 02:50:36PM -0500, Frank Li wrote:
> On Mon, Oct 19, 2026 at 07:17:15AM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Some simple bridges, such as a resistor ladder DAC, may include a
> > data-enable input that must be driven at a specific polarity.
> >
> > Read the data-enable-active property from the input endpoint and fill
> > the bridge's input bus flags accordingly, so the upstream encoder drives
> > DE with the required polarity. The property is applied only if the
> > bridge doesn't provide its own timings struct.
> >
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Hi Frank,

Sashiko's comment regarding atomic_check was a false positive, but I
wasn't too sure about the one regarding devm_kzalloc. It seemed to make
sense to me, but I'm not too familiar with this subsystem yet. Do you
think this was also a false positive?

Best regards,
Leonardo

