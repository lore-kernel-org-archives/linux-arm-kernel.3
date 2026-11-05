Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DB7606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4WJZfH0u;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=f/SUUrh2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GkU9fJVYjw6koPkED18+RNmNCd0Pc4rVVHMltt2KuQg=; b=4WJZfH0uPzVSMFrmT8nYcLieLt
	+K0krqgDEHX5SEeK/OwqOxfLyOIVKp2e19DPchM7dZQBtE5KyJ2bRrOzCp7XFssbkY0sO7/RNm17m
	Q2SJh1UwJ4rFBUJ9/jJpkg475X1wbu6Hq2K7RV37L7IL9Mwa+OEtBa2DoCMg9MLEXRjdQEq/y2lO8
	qvERjJ0NoYZAD0rsjrmbS/cMTSOCinCSHXXOw0djdfuDoriTXEfjcc0cBzk/4nNVv5SnDd88jDh3Z
	zfVtmXTUcKbEkqPYlksXkwwnCSP+JYof/3+Tvknp5bRZRRAmXQcHur10BNwHGaAQe1BozQ9JySfJF
	jXuDMe+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyZ3-00000009Iab-2FDz;
	Thu, 05 Nov 2026 14:35:41 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyZ0-00000009IYG-3vTI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:35:40 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8a058f74a54so867511b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 06:35:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889338; cv=none;
        d=google.com; s=arc-20260327;
        b=DwYO8HUj2ve0mjDdEjhGQzUVQ0I+HEu27/loG8e6jdaxQqi3HFUy84oFysA3ywgvf2
         0nKR6jX3ju/g4iRov8w32FMomv51Yu8ZmzUQH8xK27zjvvKEnFJZJxRSD8VGlNofTxJS
         ZRSe85uaNkNZSX38pHKRqNrIykxZyNqDPHw2RY2PtYka5gHSsaFkNbWFVhC7pUeqy9tS
         Cs204dk7tuz1h6ObpsAOmvHB42utTsvsgTymFbYhixNbbM/oK/iir/t5BkqHHXBsC+df
         UEvMxJ2Cnt+1vis6ZM3OG/McTsv52JEORcsfvNdsBjRfO1rG2ynbS8Goy4wzrHqwyH14
         Kccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GkU9fJVYjw6koPkED18+RNmNCd0Pc4rVVHMltt2KuQg=;
        fh=r3ijS1oHc6K6dX6BLijcZjHa/ZPOxat1dnD8fAnqBCg=;
        b=ADsBJObRP4dSuUJ00gHh5agEN9XD5v9zeQngO3u2fx00giIsbtRArJK76w7EYsB0RS
         mlLUDc1vFW9D5ci+bFx/EvtrwEL9+rcfo0A6xsR/5CCpOpAce/lpNEpkX+/tKnFgW88i
         is+bxEAOugr7VqgRObWuYlYtrco1lmobdK4BYx3Pad7+4V51iL8yh8A372cv34zzVf9X
         XTpuVh8cb4g65iEDo2GSMpc3gQRfFmaHhDe0fQcZGsFEjQ4yT8wQ/jNQtRPu7bWKkntU
         6v75RrxCDJmMaLSrimgGfzWuNwlatotoouITLXGXBjVyyxwI9tqzw2QoBBm5sR6zE4aW
         00cg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793889338; x=1794494138; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkU9fJVYjw6koPkED18+RNmNCd0Pc4rVVHMltt2KuQg=;
        b=f/SUUrh23LtbQDJ5L835NpArHUOXDrg0b7mSfFSZllryxG6KJh4flR3u0fKMHqHlx/
         qzJiwfQJNHaijdlbj0rYUoXpAvK1wVgl9v5rnkWfVgYIh+4wdX7lTgNHCC2X8chQwz8W
         ZlzB2aRfLl7OW64IXMZ2KJsR8R4O7iKAX0HF9Js5KPRvgTX+IVOF/wSFzwV/xtzYQcOr
         3PQHTNqqMD1j3WuEx/xE35YgJarnoIRCu/pLQ5eMZ1s+Zs1r3XJ6CNYqZTmgM5oAcV6n
         DzuIaN9jHE84uMwGfbZEK6veNHUlCehueErIU7zcOD+GfuNxjKCA5J2DnlDUiW2okPzI
         zL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889338; x=1794494138;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GkU9fJVYjw6koPkED18+RNmNCd0Pc4rVVHMltt2KuQg=;
        b=pMlH42nHmUQRJ/vZc8QEIPk/mUsN+n9G3xJW3Tv+SundKcz5a2I/+e9lhSTusNRV9M
         Xp+EtBKRcRN3oFdIddshgBSCcyaqF7mK473/YuCUDWQhIUmPJ/XroBgxkHYnVNFJ9pUk
         mKPpSKnV2q6WeuVG+fyBb4db1vc8n3Z8WY766xO0z470H2/l0JeAMdrOapl1KX6biU98
         tRU4kjfs6w4PyUj4xAAdsWMBXoNifT/+UvsD8730u4UFeR0JbX2KeP3nMP4qXuufDDa9
         R+rxHZxLTlbHwYVbI4GGe6cNkivQgZL/SezmbFM+lNwpB338owmQMf4eXSpHwnEvq6J4
         uY7g==
X-Forwarded-Encrypted: i=1; AKwUvByW3BL+iWnbUihHHHooZG1BS9d2zR7p/HEN6/jgXgkWL7851UCtMsrNQDXXtTgdTt85+V8cKdip/PN627wlUZqx@lists.infradead.org
X-Gm-Message-State: APuU4Z890Igg99fRM3xCriLkL8s3yuztNy6fggG+pbkb/zQrCWetZH/x
	wZnE0cPFhGImJosAOVHP27KX9WBxEXZsqRADKqad1WjgFGBsFHG9Lr6+3GOSY6F5m6lk05TdkML
	o1wJfm919f/72f/yob5h76M5YhPGZhV9j09iKnhhlMw==
X-Gm-Gg: AYBFou2BIlHFfKyOzNDZ4wRPnsVSlAq6SQX/xI2EKiUajbBZQpu4Q+k21NQCaQhLc0g
	vUDHpKHCg2FW20KBP5CNQVCFY5rouLLrfgfDOSVCJx8W8bir9n+iCOA9jEtsNjl41v5rBY0zTfV
	eezWXYe4SCuLwuCQdYK9HyxU4i9+B2u/YM+9Ck6MOL+TJzEOg4TiFYrmX8w3Sf0Ige2PiPDGVxg
	t2ouBFTm7vuIGnwcgSpfGPjluxrLUCRKSyd2EhhJKG6OyRJcdxOUwWcT1nksyPo6AxLxafhhKTx
	/O5DzbmXAe/Ss+skw20QOhWJ0mVCAEMcq0S7CAde8V0Wunag+Z1XiZxYDTuXrCmOp/dh02PiIX1
	D9nV/vPMWoCgLpTG3BWEgmFLQJVFxeyvWgxB9
X-Received: by 2002:a05:6a00:330a:b0:84e:909:ac03 with SMTP id
 d2e1a72fcca58-8a9be48c598mr16519398b3a.10.1793889338094; Thu, 05 Nov 2026
 06:35:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com> <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com>
In-Reply-To: <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 14:35:26 +0000
X-Gm-Features: AclHuK__6TlodHOzyVdjm-UulEeYQ_S-cCkdzywOgk9TNIGTgV-C-tpWJDrX-8A
Message-ID: <CAPj87rOKJ_EEmSwkokjvqytgnzTi8V_EhtGywQHe7xeww+ECDg@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color
 format on DW HDMI QP
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_063538_978215_603CA1F3 
X-CRM114-Status: GOOD (  13.61  )
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

Hey,

On Thu, 5 Nov 2026 at 13:04, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> On 11/5/26 2:25 PM, Daniel Stone wrote:
> > But if this series keeps on collecting unrelated patches until Sashiko decides all
> > of VOP2 is bug-free, we will never get this series merged. Could we
> > please keep this series focused on the useful bits at the end, and not
> > keep on adding speculative new Sashiko-pleasing as artificial
> > dependencies?
>
> Yeah, sorry for that.  I'll stop here with regard to addressing further Sashiko
> findings, unless there is really something wrong introduced by this series
> (which doesn't seem to be the case).

Nice, thanks a lot. :)

Cheers,
Daniel

