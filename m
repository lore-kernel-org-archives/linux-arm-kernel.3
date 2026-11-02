Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F65A60A6F51
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jgxebnhg;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EyMHcKcA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OwvQ1K/T5ntTIih2Uajc562qVZy7T1bItsBHgcFYO5c=; b=JgxebnhgyxAJOl
	GgTIsWjd2IUHOYqzJ2kem7WL1xd+xBluggFOD+qScK0l/W2d8iRy38+ePpu3gytWz6dowidl0fBAC
	QLJl4DjjkQEZKyMtOuuJX/j9WocRsIspYBIFgjf0QJGt4SL8Mcnud3TWvybH5MR7ibij/mGSb5kgz
	gyhz4sKLqglg/TR+HrVjes/oRhFAE7pZVMnsBEidtxC3p8JINTO1b7Brvfylo2iBrzgDBvK0q9tRb
	zpDEjGq9QGnNI3XA7U/6h4L2Gy705hRwPbgDSSAB7q66VMJbbeXpiZwhtoIDE2LKdHMuXwK91uQHj
	3nk1oLfaTrOCug19zGeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsHC-0000000Ge6p-3ooe;
	Mon, 02 Nov 2026 13:40:42 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsHA-0000000Ge5e-3XBk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:40:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a210470b49so24271955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 05:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626839; x=1794231639; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwvQ1K/T5ntTIih2Uajc562qVZy7T1bItsBHgcFYO5c=;
        b=EyMHcKcAf67vQlDJ332RQ40YYAgHVJmOws4n0Orc22nyWNHMbP7Jw42A40/2xh+A4t
         7cwQT6oxzvTrbp3rPVTXJW36OlV/7321g4o82X6jFtpoLWnozWm34lbPrGS0CHkJcK3J
         NvOFhisPR940gX/xlIFHoQtyzxpNgjRCxniFLn4m9kJGG4WRR5rRPsu9Hv7totLh1tz1
         HKzX2hBb937TtITXNTRa2+XvB4cl1Z+U11LgC545kVXNtGDUbuQ9Ems1BLwxIlBufZ8i
         LUqzJwBqpokfQy+x6EzVhvgZAnfXflPKHx84qsg8ax6fPk0GzrKy8aJUXvsqmDmt/FSw
         j6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626839; x=1794231639;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwvQ1K/T5ntTIih2Uajc562qVZy7T1bItsBHgcFYO5c=;
        b=tc/XDc9CVeQj5fNYa2h9FWCnyXmpHsDNI5/QgT/q3dnTAkPLwV0x8txUrv6JmqBU8Q
         HvVEoDqLRQGIkJONi++TbFFhjD2anxq1YILdyqRqoKn5amSkX4JXHHIeue9u3Vtns9Xv
         +XnLsEG2v6Q4vxzvcv1SZLCoAmcpfP5w9GU7c5SLqrWlocEWug6fvyn6hwnXLgOsKA6d
         eX12SuJ48xWLa6Qup8DoctDjmvVJyjrBro8SQ6Lz4/aCerQJ6DkDc8F1VZXnlJQOIb/+
         q5/gadKsEwlttxod/kYYxPhu0lSuNknV+2uSKlX5GU8c41Lcx1C2aMOT6jVTRzbZLydd
         GtaA==
X-Forwarded-Encrypted: i=1; AKwUvBx9Y62x+LwgOqIe0DRUD6xJXXDLL93Znti9e1NkfGXFANGtUhqbMNJxZZoAVkFtY7sMHX6D0PqFy35LzNYjqy86@lists.infradead.org
X-Gm-Message-State: AFq9FYKw/RAamHf7BtZZRIvxh2i+WJtoYg8ABpReg0jflBMzEiVe1K1Q
	UPP+/QybswRWS14IVdRFmd25IxrSyb0x3K+xH2zBtAsrwAYQakc8MXxszp2pB8u9GF8=
X-Gm-Gg: AYBFou2t2DG83CEeTf+XvmkKEgYqyI5XoIAX4YM3V7TRdZInDs0Zbf0K6NxFhi/XjNp
	HAm/XxYRr115wEg00L6sF2P9IVW9kJTAO68vfbQk3JBU94fl8gJN9VKbADOjIIRrs3geF1BiwSu
	qIHT9tAucz0FoL47tPoELE/SlE7kark4ir4yziw0eSGuaPIwtqmEww4hEIQ3aNiiQT4n83zyYvs
	e9MEfPpB742lI//U7kf/9D5OT/Di+PO7YsCUdNXoezO96zNl1qYlgRCsuOBm8rkO8I5aScRXoHu
	wV8d7+qHfsNpk9hFRPU88/GY2bBzDiKROgxz7K47tWB2ixuZNZwRncL8mk8fZqxootpGUVU8rBW
	qIlE1qnIqVXKx103UVp68ZcwJIFQDVLIPU71LV3LGtjulErUlu+SD30HbAh9yzPrMDTeWjQZen6
	XAt3zCE5d2ui+HhxybtvZOeBiuYrTTEKS1mZBckxrT2Y0/Sv6p6MurOIyiTPG15lGD0S8O6u7sL
	KfqcdpnsiqTWjSRr12Ok8ORV3VxoPwh/CI2IN3K5KxTQQkz3ofE5xuo8ZtCHNmkMPUHidfT9122
	V+aEnIUiBPWyXqqvIN4CYctlw1JmUSsN067+9c9pp1tEnbP8Aw==
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4ac17b2bc63mr237869415e9.10.1793626838793;
        Mon, 02 Nov 2026 05:40:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Primoz Fiser <primoz.fiser@norik.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
In-Reply-To: <20261008053850.2941955-1-primoz.fiser@norik.com>
References: <20261008053850.2941955-1-primoz.fiser@norik.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: panel-simple: Allow
 "data-mapping" for "auo,g104sn02"
Message-Id: <179362683780.3310106.8889373164273856192.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_054040_914614_21438016 
X-CRM114-Status: UNSURE (   8.92  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Thu, 08 Oct 2026 07:38:49 +0200, Primoz Fiser wrote:
> As per the AUO G104SN02 datasheet, section 6.4.1 "SEL68", this panel's
> SEL68 pin selects between 6 bits (SEL68 low/NC) and 8 bits (SEL68 high)
> per color over LVDS, i.e. an 18-bit or a 24-bit input format.
> 
> Currently, the auo_g104sn02 panel_desc only allows for the 24-bit
> configuration by default. Boards wired for the 18-bit configuration need
> the override introduced by commit 1cd3ea3e4b12 ("drm/panel-simple: allow
> LVDS format override")) to describe that instead.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel-simple: Allow "data-mapping" for "auo,g104sn02"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/47459027812c73d4826f5f78bc8291cb59a5de3e

-- 
Neil


