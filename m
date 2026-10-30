Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FDF606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 04:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JL4bKQVc;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFixfOuo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HpeEYAEKyyCPvuV7efERlE4nfg2Y+m/mO0FuoK2R5s8=; b=JL4bKQVc5KVFJN
	2dzsE981XUmwpzcOEQSpzwo6IhJ8aPsXJljx9cUHIphxAkmROzHqFx0TYm/BqTxarsoHGyoxZiFtR
	2JbveRIfNYZUfK+J3Mv4/eRoS4e3hWTzoiZTuEe0qWOCBTgjF7Aq4fa0FQ9zgxfbELdSJtjETj69i
	wTUOZWH2QdTtix8b3ec/5WnANnpy4Mb4C4E4vaWmVekqh2wUnQ+J6GtyJYLhte+rGg3ao6+WQ0aNn
	opWyAuoM5W5NkRyJzy30pBSUJ4+KWqEfkzqWdim+9/G0j58DvZfQkcbr83ryU9L2fE315PuDQFMxz
	BBdTTVrV+de8Wn/EdJsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeF6-0000000AoD4-2Au5;
	Fri, 30 Oct 2026 04:29:28 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeF3-0000000AoCH-0yYI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 04:29:27 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so169927a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 21:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334564; x=1793939364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpeEYAEKyyCPvuV7efERlE4nfg2Y+m/mO0FuoK2R5s8=;
        b=cFixfOuoYbdFnJSsyKviHqc/w51i7SaSF8y79mlZjWzYZUU7p0snW+NMNyjlo3LBA3
         N86b3h7U9HG8EpQDc4m6fDQBMTkFu35wSgLJWo7tD/3QJfZEKUPYLxPyF73g3/uYn1We
         30APEIhUv7tOsAx4faTnX+35U8rU5CAGLTA/P5n7kbaGnsqrPVJ7JcpEMexIYHdaBoeF
         hLpPqSi5lwkhvQGJQUjj1FgnZdhXVnl0jECZtgqYFmsONgbQibvfgH3WimznzFjQHbT6
         eittIkGDVXcFT6MncHKIuCbhEHHl7tfmvounSyDxNsQRYh0bwPMkpeLY1DYxUG3NQXZ2
         pDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334564; x=1793939364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpeEYAEKyyCPvuV7efERlE4nfg2Y+m/mO0FuoK2R5s8=;
        b=gP3mOhkapEPbHNVzwh8R1DOQjuHIkgP+lT1FJIz4nNx9Q1rx1LSR37zOfO1jxW5Mci
         uBqy/muHs8CH+2npkQCxCW1j58BHhRQXn9Y0kNtQezr+6F4xebBFtg+vETnWkV6qRBmf
         pEKDzhsX10QoNufSPPGYytmDTVXqWUKeQkyL1imLY12MAXQAbiCKzhzG1g8c86CNpBOe
         uTz9MnLQ/9DcWbFaTLSlE7Y4wU0u9q0CMueKcqmSRNcz2oAaMap9AHWEObsn0pTe2LT/
         mzeMv80wcwwZOLFB9yNHezGSCBEO7arSL3gwUiTMpis6CybPKwr+Ob1wluVpzMS2+RF4
         jg/Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2sDn8ojQgfcLAME8ce3HdZyJN8mg7m7sYHByFh6K4BXM8eXUB9z8SZ4wcDTNuTXpkd6PXYRkdxJ/1g9MwwsSx@lists.infradead.org
X-Gm-Message-State: AFq9FYJmu5Z0BW3Q4hZB0ttbmE3qzfdT0VusI/SXxDbEK32/xKBUQzeE
	OCjE8wqPje7c840uc91gl9hFl0/lSAnaIcRLDTRk7OT0JsUPhKbwoNE=
X-Gm-Gg: AYBFou1Blp+LeOif3CG+5A0k9u3I/gDxH4NYMvXVa8oIBBgOy1J4T/DwHKtqGWOlHrQ
	+eexQOp9JB2Dk9QA4Pu0b8YA61Lfrb94q4bMHvM/m8kUZ8p9I7JdJBb2S4/CPwWaxRk2a9zXTjc
	6morSzFxwt2NWQIHejqhzGKEW0ZIDrSm3gQQBtjCev5ou2+hdO2JKLIPJQiNLbPZVxYU/ipWb+z
	v4QlJtWUg71hwJs8gszCpanWOfjHQsmYbUqWK99Limbf+H5bZqQFOk3Wxy6ZPuhFpLt5659HerY
	so0DerZ/W6J3Y3lh7n3OMnryHXLgj9jPPU64USdCm/+AqitRmjSqZgSKTZJPc0tKwaCVEE4iSXo
	BfiBCaiHbPWLn051Bfg+1UVWsLmG+A9jiKMdFp2l0Nz2b5+u7erzN2mBkxQziTm7KNL9Bn/smk2
	uvBORICRc/qmkZ8fNXuQXbUGUj2UjbGxG7mEMuOEdSSAZO2JuWOVamucCIK0My9gTGHMjHK0iUd
	gAJTfRHgSXfeqjQWSzyG0853yEAnx/WVJ9Chbqx+0wuykTeBDPsNm5by9VLh/E0n61yjSE1tCM8
	i5bu3b6U5bOeZMcpxlvb9K6m3eF9sXxYoFbKqIxmYuiTjJ6WgAQxCtePEpEA8ZfANQzK
X-Received: by 2002:a17:90b:268a:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3ae897ddd43mr857008a91.60.1793334563678;
        Thu, 29 Oct 2026 21:29:23 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8826a769sm606067a91.4.2026.10.29.21.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:29:23 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	dragon@radxa.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/20] drm/msm/dp: Cache eDP link capabilities after successful discovery
Date: Thu, 29 Oct 2026 21:29:00 -0700
Message-ID: <20261030042912.2745609-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009-msm-dp-hdr10-v2-11-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com> <20261009-msm-dp-hdr10-v2-11-1835d4966da3@radxa.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_212925_279234_076FCC81 
X-CRM114-Status: UNSURE (   9.34  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09-Oct-26 11:16, Xilin Wu wrote:
> Discover eDP capabilities from connector detect before the first
> modeset.

I tested this patch on its own (not the rest of the series) on an ASUS
Zenbook A16 (UX3607OA, Snapdragon X2 Elite), on v7.3 plus out-of-tree
Glymur platform/board patches, which include other msm DP changes.

Without it, msm chose the eDP output bpp before the panel's link caps
had been read, so the first modeset after boot ran the 2880x1800@120
OLED at 18 bpp until a DPMS off/on. With this patch the first modeset
after boot comes up at 24 bpp, 4 lanes at HBR2, with no link-training
retries, on two boots of two different builds.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke

