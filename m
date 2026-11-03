Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8535F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 00:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jm4479bS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFwRqotE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vh/cvDInRTV2ogz1411cOMX/5XEmrB74tytYBj9+zVQ=; b=jm4479bSUE3pfl
	dpS/6wn8c3RTt12refT0XuWRLEonxx1dZ/O0DCiUJ6cXDIJ6parOFI4be4u4/oBY3q9eblUUgO8Dy
	cbGmLO23Si6zsSuQ+badQVyEoi4QQp9Ocl8zMhRXLwF2msuNNdru+gyMBNMKYqvTu5PwlitnCyAkB
	yLdpA4WDS9ZLnL9JCk/WJuEuLGM8TJKe/O/JacST5Xvw/cqJzCsWH38chLhO9zKHvSx8NejN3cV/u
	tQFj1n6MnQzdVSpmf+izpA7lI0CI9GBxlS64qB2o26Zzpbex38OlFkh1bcsXVUI6Obs1IMjTmKXxg
	l3J1m3sXsWi9qrIcsjrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2bC-00000000kXq-3X3R;
	Tue, 03 Nov 2026 00:42:02 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2b9-00000000kXB-42Lu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 00:42:01 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-854e904005cso108704a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 16:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793666518; x=1794271318; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vh/cvDInRTV2ogz1411cOMX/5XEmrB74tytYBj9+zVQ=;
        b=gFwRqotER15iuquJBVi+I7pkbWwisl1KTbE2TpV5uOhm1qgvCn1Uw/BA1JllOCZtc1
         5HSa0h7rqB/Obr3vpAGyWz4AK3PL4wV4jknZDt4GBGCEBGKel/BDk7o8snmFcJSJXDBs
         yHsM+SueecWhB2mexR7cW3T4WJrcCgo/vDRNyAVAfzTPyjvL4HXEVxl31MvPDggjJT0I
         jZjeX07fbmtPuTDAdWv4XVEAr5i0gfnkTLJ0G83khBf2FXZFTZWHzSKQQvu9zq/Y6IKw
         NubFNbv2kzapuQIFp8DooyhWQ4qsdZ49H2cpkvzlS5T7NKh4uQ3tfYUMkccNKegpH5BF
         KL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793666518; x=1794271318;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vh/cvDInRTV2ogz1411cOMX/5XEmrB74tytYBj9+zVQ=;
        b=bQEdK6RvBl/gm8H4PU3YNpot8pqqFTZ+XxCrOPi5/yFRm/Hnkw3qPtsk2rgn+t7C4D
         blWNqDkHGtuYzAlXLoT3unk6/y/JPgcv/5VReCQ9XBuo20cfM3HqVumASSS/VBDxx/fV
         HUb5jYw5eHYDd4tM9UAiDVLLouWhfrx8PYkcXPy6PFutAlQQeLS/kS/aLABDsCzGjdjy
         nMLXO7wBIThThQkaG5u5tPTpDgDbLgoufp6Oltbi/Z/pSsdL6IU8L+hCbAYhMprGjDvK
         WZX9VcjEPJM4SLPnPC6ku8R26WamaQPVngMeM6jLf4YcJU3Ft7PClRSUytk7ppZ5kJXO
         5unQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/wAwwQ4QvzD38zP1u/pJQAHY1QNOMZn+e8plZb7PyhDECr5VN39pLiSCzFbVxBEre8cc0aHXHglVKm71sJXni@lists.infradead.org
X-Gm-Message-State: AFq9FYIMlOgr1UIbs/k6eCFommaah9b87UdMpMuGbqq+jMN9od6GoPU1
	KQ8VpP+12WavE8T8w7mDTC4o1UFkW80VD4LCgUSPlSa7NUldj6A7Znrs
X-Gm-Gg: AYBFou29CsfWMfv/EiQbS8ZSbX3Y5CHDgYqrmoKHu2H+KoKB/7pOLk1e1x9Vi/jhKa/
	iWbwEGrKJ96DxedYVKqF4BLzU1J/6kRE1AxEOSjOkkCJwCInQUzbKtTmtPYudHo/JeYbdghGyxB
	DNa8/N64XpBic0dDQvs8c6rXT/IuVFHYTJWWTm6qT2HvNf8gPcmuUZ14G5VgE42mQe2QqkK4oEf
	CBUrXraSj5Np1IvLqZKTZ4TryTfoq3VJZhtZGy5z51P9GliE8XYSOtPQZlfxJQiaUhlfYA4xpzF
	lTKSue+haj/8LOFNEf8NHBzwt7xOE13MzcHhT/OFbj3zAjQLdK2bThSYyBSwp8A6UkK0jdt2T7o
	Z9oeQrEdvJ2NbvffYHLSSDhQc+bu8Ayi1h2fBA2ZF5YV2z/LkG+ypp93+LPg7xSLGLRsREueQ0o
	M517WQrRKQxRCghOlaqm+ocPfQIVqzx3zB6cAfvgTmeY7/kpGnE1URxTKMv83FWJhnJrclExoRc
	Sv05wCrF9VFGpQMQI76l/NnX+BPqzxkT9bP/euuOA8ilLua4yJJ5ZWX5vJjIvbVgR2NjxD1+BY+
	cHUFveH0kCbB1QFXjv/isHluCD+CHl2DfaCdzsgDpj7vh+QOvLJLw9YjTspvN4Iw6cltR127fJq
	EzSFw
X-Received: by 2002:a05:6808:6f82:b0:564:57c3:2b28 with SMTP id 5614622812f47-56457c32c1emr1301058b6e.8.1793666518415;
        Mon, 02 Nov 2026 16:41:58 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56523cdd0ffsm388473b6e.8.2026.11.02.16.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:41:57 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: krzk@kernel.org
Cc: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH] dt-bindings: mmc: describe the Allwinner A733 eMMC controller
Date: Mon,  2 Nov 2026 19:41:55 -0500
Message-ID: <20261103-a733-mmc3-withdraw-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102-steady-grateful-chimera-e2363a@quoll>
References: <20261031020640-263f7b05-a7s-mmc-binding@gmail.com> <20261102-steady-grateful-chimera-e2363a@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_164200_007236_EB52DB58 
X-CRM114-Status: GOOD (  17.94  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

On Mon, Nov 02, 2026 at 08:27:19AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Oct 30, 2026 at 10:26:47PM -0400, Enzo Adriano wrote:
>> AI assistance: Codex:gpt-6-astra.
>
> Drop, we do not advertise slop companies anymore.
>
>>
>> Assisted-by: LLM
> Drop

Will do, here and in my other patches.

>> This binding is a separate prerequisite for the disabled MMC3 node in
>
> How this can be a separate prerequisite? Binding without user is not a
> prerequisite.

You're right, it isn't. It should not have been posted apart from its
user.

>> the A733 DT v2. It does not add a sunxi-mmc driver match or claim an
>> operational eMMC path.
>
> Hm? Why?

Because I can't test one. None of my three Cubie A7S boards detects an
eMMC, and their vendor device trees leave this controller disabled.

[...]

>> prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
>
> So this cannot really be tested.

Agreed. Those IDs came from my local tree and are no use to anyone else.

I'm withdrawing this patch. André, you asked for the other MMC
controllers because the IP is the same, but the manual documents a
different descriptor layout for SMHC3 (A733 User Manual v1.00, tables
11-3 to 11-6), and I have no hardware to test it on. The next DT
revision will describe MMC0-2 and leave SMHC3 out until someone can test
driver support. If either of you would rather have it described now,
tell me and I'll put it back, in the same series as its user.

Sorry for the noise.

Best regards,
Enzo

