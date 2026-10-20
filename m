Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE17F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aDhk9qfM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LY+C6XtG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fr0TV53Zh4gczCXYrk8qJ7Y+cVmeHFe014wAKV8qTsI=; b=aDhk9qfMOV+DiCnuJUl6EbhxF8
	oGfY+QTSwITM2eCBSUniccYcnXSVG5V9lhKi0rP7e+uQcLQAkEEDueS621PTBxzd65p2r311ep2uq
	tO0/03PLL0Ha1s73sdZ7INCNo2up59xdxk61GwAL1L1nRSSvQ83niRe5xtG8Qd8n8sDwavcV1ZTyN
	Iz6X0p5yTn5eWWUzwhXUB7kwBuRcHhWW3v/Bt7aZvDbH9GjJeB1IPP1Hsu4CFymGiBamRmXFea874
	R+CuZ3Q97pCPU483V821l7GMFBwsBDTeqWQkHOYGKjtCrEBIDTI8n3MdNwazbLQyd8mQurwVdaSUV
	ufkpNkyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyqz-00000008dYh-0v4X;
	Tue, 20 Oct 2026 01:41:25 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyqx-00000008dXn-0GKL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 01:41:24 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-15ea896ddc8so3340228c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 18:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460482; x=1793065282; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fr0TV53Zh4gczCXYrk8qJ7Y+cVmeHFe014wAKV8qTsI=;
        b=LY+C6XtGyegXdUBcqHYz26hdUDAbqI0dMoB9fxE4SDsbrBOvsGEKKZagncewDmkySp
         evMgQte4CSUirPB5VO1kGVr8Ku8ReJfB8J3ow+/haYED8A8sOnr04NDfSbTtY/791x2v
         +1OnRS+hLZsbRGtVY137genFNBdwUHjkVE5gavi1jz/x4bprsFBHr+4QITiqQt8V+c40
         w0wcydu9JZYkT68FKKXJNuU7ryzqYy4ZSyocIAzYxI3gEHG3S4P2dp6L3eqsMHxQCC7I
         OcIbhUTIGR3gBkT+YSY549qvWOKFklwVg9XkuyWLzHvwYd33rbNKIrX1rcr13xRr0+Kc
         SHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460482; x=1793065282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr0TV53Zh4gczCXYrk8qJ7Y+cVmeHFe014wAKV8qTsI=;
        b=IJ0/87jQUM5SbRUVW38gq7NgCXWLHBugrmbgjN2zMiye9Y++4Cql1kOVqMntI4u1tU
         yUyW0dEXX3fVTZPX44pH//Ly7aSrh5uNKkYSDEVC9ILQl7dVn056UyRzV98q89ohl+ir
         KR6HtSPr5Mk3h0+Ik8o2LCQK0ZAeiEirQFV1rC88bJT/fl66Hb8QKAY8WJ92+Rf5EGYY
         +dMCRy5h1DO62vvuW9AUkQIqx6+oBFxx69ydbWU+lyWcudSsSnnkizG8PYXq9QP/jKNB
         t7JyJYVoBxa7s4U6edxJCIokoxHUKamKmcDQqOcBnYtHj/PRBCOZn6LEfvxMOBh73NxF
         f0bw==
X-Forwarded-Encrypted: i=1; AKwUvBy7TFNTUgR04YjA74koXMxVyZR5S9grePlucEwZOBSNSn1l42UUqw8Jud1W9NwaVBXbvPQZgPtaeWbzn2FIWX8s@lists.infradead.org
X-Gm-Message-State: AFq9FYIalUFrcZ4z2FQJHvZ+Oz8mpvYkDXKL7G7itzQKGNm+iRRrkFLj
	SfMfIMRVttmrN2KkmsPG3RihxDTl0M/FQ8VbuP+AgBnrhppM9++u6Gpy
X-Gm-Gg: AYBFou3PmFIVNCM8wCeOsk008PZQg2gMrEXfy3ErjgnNcC7aY48h1IoZqDkkcVDTBHL
	5+RxL+wF50RtcDF/+C0veEthEw1+Zd688f0/vtgzihT/DAe3vxYOotWHqQzRyexnMXsuDTH9UeB
	Oss41+WX5dnwzgjsdc9PWPqNr0wSnDe23hwsXgR04ANcoV0qF3VR68VmkbKH7XQOX+ELsTWEnKa
	clJOYL+pnug0bBcA3NDDxWYKsQBVvQH22CSq1h2K5PiUbhmitFgccifyDbNz/RXNXlSbdc+tAss
	8vT3qP3AQ8TKF/omGjWUXV6qOzFo+DPb+HPi14Jm49ZoSyRNbxi/mO0dIkdqw7aKg4pMogYXKf6
	jJUd65aJ7Kdd+RXr2jOAcPEACjFfnIDuMbp8eIlY2rH+XjNzGseo59OpvlJyYhGWFBqIg5I4zjX
	v/5dxh3pTYGjjf+BE1ytlGYk2VQ5s5vX2O2xR3SEPf7iChlRubs363CZQiPQIjLGqySl/HO18Gt
	kDkVsUPnUfLYN2cN83w8VK87jNIQGzqoQI1hmwSS0rpLCCphcO7NJwvY6+ifK+tXXwtaw==
X-Received: by 2002:a05:7022:ea50:b0:143:2968:564c with SMTP id a92af1059eb24-18512f1e993mr12640931c88.26.1792460482105;
        Mon, 19 Oct 2026 18:41:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c2e7bf4sm28816461c88.20.2026.10.19.18.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:41:21 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:41:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 6/8] watchdog: mediatek: Add support for MT8163 TOPRGU/WDT
Message-ID: <589d0ab4-46cf-4b8d-b4b3-5519dbf030ea@roeck-us.net>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-6-f2462b2d2437@protonmail.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-6-f2462b2d2437@protonmail.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_184123_887422_E316BE56 
X-CRM114-Status: GOOD (  10.81  )
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 01:40:02AM +0100, Ben Grisdale wrote:
> From: Ben Grisdale <bengris32@protonmail.ch>
> 
> Add support for the Top Reset Generation Unit (TOPRGU) and watchdog
> timer on the MediaTek MT8163 SoC, which provides 15 software resets.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Applied.

Thanks,
Guenter

