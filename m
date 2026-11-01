Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ECD606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U8cBGAow;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oMvAOfWq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SAR00vszMy7Oo8d4FC1bVF4Fi2pxCcoHYlztJt6Lr9s=; b=U8cBGAowEQEOu0
	R4vWMYLLrQLY2+4L94KaKdP4Q37GtGlO8rxfxIg6w5PpUPiIFHwAe+LnyX6MHGx/50miPxhAT/tGh
	/zVWnEVX0SxmcSALk4+gM6aoJC+qFnE8GFrQAG+7MOkuVjsTijt8sQmRVh/CgawDbB13tMYuf+pny
	R+IeA3Dtc9i8x2Hof8EX+3nBq6fff+Zva8U0BbnkJ8t2AXoccNNK4WywXgwwHf5xgNLqQL1dSBlI+
	TShtTfU7Vp/NkMVMHNkfqYCaXp5cEweGX2LVJUw3VHlLM0PrkAjKrDXB1zI43fCyxKWNfOYFYtPy3
	PCCLCemDi9EGFOQfvCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNQGU-0000000DxZu-2AWS;
	Sun, 01 Nov 2026 07:46:06 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNQGR-0000000DxZ9-2kzs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 07:46:05 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-3282db206d3so2500055eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 00:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793519162; x=1794123962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAR00vszMy7Oo8d4FC1bVF4Fi2pxCcoHYlztJt6Lr9s=;
        b=oMvAOfWqoqoT60R+9419AVAq1tatm5lmp3ng0Nu9MP06zGTyOQZ3D5S1uC9Kx4rUAR
         ENBTqqQtDo6IZetlTWj+wvPp4j/jyuNhEDgPBLz52Fmvazp6kLTljwIuLjeDZTNhw3JL
         J+k/5MVUzXU4T+zMdVIjbfQPWNkULogOxH9HzZF4trQueij8P2Tq4gkuxwsRMaUidoro
         h/SOYy3L2/N5NMw1WeTF5jfBK3GZ5Muu+BvyMXoLlSKtoj2zCUv+L7NJLZfMLO399rhq
         poMryHXGsYMLKqJSgZqDqpuSIkZdo5d0TzTQQ+OblyyZ7X/GloREA1fZVMY/hqOEIsKE
         bwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793519162; x=1794123962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAR00vszMy7Oo8d4FC1bVF4Fi2pxCcoHYlztJt6Lr9s=;
        b=H45HWMNhpR6voGrUe+FohyHQ28ReuU4p++woj4gH7qfECq65KsggfPdhQfjRTDkN0f
         McsQAlCC2uzaYVjK9d8/ktHa6aggnApWWj4ow4UR0UFeek4Gnz28wk+LuXnP+NDjZdjQ
         irdeQimbCzo9erkODepTu+gVGhL9rsFnPVnoKdXtebXqEybDPaNt9j5sOfg2IzL0Kd8E
         EtwXqFkIYK0gd2TRMd5+JtlQ30Em6OxeDXxgILt73EHZc7ih50faxq8XRVmIZIKatkgZ
         Km9bOmWnANZxYRK5gW0kTLxiZC69irmUC1BROM8uDu1de6vQ9q6cI2fV9CpDj8KBPRn0
         IbNQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/lb5za7YFTC8kJI/SGihtttfcDAhQdZAQ0j5DUQXpLvlsJLpqXxYG9h7Q5mHt0WMIv+LSORZIvTzXvZmUNDBH@lists.infradead.org
X-Gm-Message-State: APuU4Z/O7g9AdnPZtei5SdGHw6i/l+M42XStR/AXHdscWmBlKvxKd+0f
	3wXA3SJO1+VrPM4KnlC/HINgRgCpnH6oFA7J802U0pyZqmiTx67KZm8l
X-Gm-Gg: AYBFou3DIvxLC3cjsQfn0U0O+IdfGi2ozz8fui2BmnntgbBVrsstLFz02vhK/KxZt87
	n65RQuEeBarStj4i72MLIEY4eYGGm7uNuVx6sm7AtcI8IiJ0zdyJ76sZgqKcRorVL3k+x1NZUQe
	BKVvgnpxxrLBWlGomPnS/0R1xoXiGCjlOEs8Y4X8WDeZi4i5IVq8W0PuQR0s2QwYkxPvM7KfUvg
	bnR52cDN7fBSjJinJFbExD07fae8Q3ljmOe8pCWra4vMg9sHAjw58Yfu3Po6RCMLKbw8PQ0z5VB
	+pquM1ToTBHwsw30PFmPsDPu2fvSrghtb68X003nHLRNsx15eSRot6/O26s1iLx5j5w7V/kWORJ
	z4hFli3y65TxeE2wxAoAuuUNA5rUIagtAavjIl9hfp7adqVRQ5IOf9lIY/H7x0/9RzKytFNp0Vc
	XeMlGfJWPogVM+E98Uy+VXYB2bFk0ix4rPwHAybZ+O0YKfwHXPg9GoqxESMi/wjQjaqXUFas4Ko
	84L/1Ip6qhpcRveNXRcYIGn6UzmuVsh8dTkIVLU6Y1Ty+WJVsssWKoc/mF6CGNSdoRQu8AxEkOk
	RVCvMXXWB8ddpy/G4mlS51cPkUuXi7q19cfAr2+p
X-Received: by 2002:a05:7300:fe86:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-36a42400c6amr10962673eec.31.1793519162483;
        Sun, 01 Nov 2026 00:46:02 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm28414684eec.2.2026.11.01.00.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:46:02 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jerrysteve1101@gmail.com
Cc: Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	damon.ding@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 RESEND] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Sun,  1 Nov 2026 15:45:51 +0800
Message-ID: <20261101074551.263631-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013134659.335829-1-jerrysteve1101@gmail.com>
References: <20261013134659.335829-1-jerrysteve1101@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_004603_701229_51B23224 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Hi all,

Gentle ping - three weeks on the list without comments:

https://lore.kernel.org/dri-devel/20261013134659.335829-1-jerrysteve1101@gmail.com/

It makes the DP PHY optional, as needed by the RK3288/RK3399 built-in
PHY, and drops the misleading "no DP phy configured" error at probe.  It
has a Reviewed-by from Damon Ding and applies cleanly on drm-next.

Anything else you would like changed, or can it be picked up?

Thanks,
Jun Yan

