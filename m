Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583B8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XTDfbQ84;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=X9YtF1t1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c97+eBSw0JgaFK2XxPHQ2OocTE5xGkKfdIwT0n7EkqY=; b=XTDfbQ848dSAslw/x03J5AN+J/
	mphMfg5xRioLdkeCIs3EezqgS9oP9gSWyI/GTOECdWVzNLdXCUJOP3tkvMH6TDLO+jojj0Vb3zTvU
	U9CTUZFsspkPx1TmXVlUMq7Abdq+F07gfn38UrpcL2lMFhYjQkgMNr83+5lo4KWkPMIt1qSlYB5FK
	RxS+pM1Gn8/svmvoJpehqVvGekWdp0rm4zroNk+I9j3bjgpYEHkSvSzGOgzWRCf/zcvE3r9U+i/z2
	FTh+kQmGfz/ZkSrWSY+3RFBB1tl4wnYHW2mcgUvEorQIr7xtpqkvPDHbENiEXmEYIZ7xGjJCrJecH
	WFbkBkTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMksi-0000000BYtZ-2rKb;
	Fri, 30 Oct 2026 11:34:48 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMksf-0000000BYss-22jH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:34:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2eb18f4da15so2051435ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360084; cv=none;
        d=google.com; s=arc-20260327;
        b=PnvexhnDgiCJP3C8b7v36ieQb73rMk9S+M+zjvG1eZWRxgjJTYJCx8w+3rSgPAt/v6
         qLmdQgNCAQxZbFjzz9iTr+EiVuf488XRHhQTLXjS2OgGD00mbM5HQFRl8/c8JCMIdr+U
         TTe5/pcpMgXt9N7RT+UJmUiU1F541qEOyerIeD13VTwFblvLAsweKmg92SwgJexwNN+W
         b5CixK4P+63ebYV2ZFOne21SYL/2ehgwS1g51ME8TKmDwaXCHdtjmxNSYC9T6DBhl8gX
         Vi9rUC3G9OA43q9RMF1XDd+wiH4VMY1M+UWXGwlcBzUQfM10IHHuMtCNIaDKY5Kl/NkY
         UVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c97+eBSw0JgaFK2XxPHQ2OocTE5xGkKfdIwT0n7EkqY=;
        fh=8lWH3C2unpRvL13TLr9s1efoQotxqf/bRk1qW1ohOw8=;
        b=PfQv+AQBKwtgDKGLadTDgd/05rkUHCFXIzrxAetjReJ9LvSx87jCtuQwcioF49NGx5
         l+zANQmWTOpJ0wfklO8w/NdEKaxjeKEOopm4cLpDxySO+AselOOhIhOIUXvGcz7ZqEPi
         M5ykIcSujHJ0Mg1bKTNnPcMFZi9qHehuNq4/PJaKLiqqFWn3DKmkoaprvzkCkkcARpRi
         8tPfbDbJlq7ek5UNbARX16GyHQBII5DyxfYREeRs/V7vrzfBgHduM221OQLfA3KjIeuz
         HMuBYVmbPZ6fgowTbVAsC8AF9Eqc1Cu0wv+gkG1nL98R0paiHpgBSuRSqlrcHTpFsbWb
         jcmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360084; x=1793964884; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c97+eBSw0JgaFK2XxPHQ2OocTE5xGkKfdIwT0n7EkqY=;
        b=X9YtF1t1NxJuxyn1q/iCYcz5bITsCAQ/7Vygleeghw8KOYLHwoElPTf4AC6OG+TRpY
         d8k8FT2Y+wYtLtJ0XfXPLjsrv8aDdrXWmNS3tFowG+VbQgYp1oS/vLKOXzBKvd4rYHcB
         QsIuLGW6g5aPL6e3lscf7MHWuDqmJZMlOu8zubOccvCI1CVrDVmhGZ6Y17YGRPHtCCWB
         KAd+CrpPl+m0Jz0PtuhzgUH91tkqlXXCDTpiF42rrxEuUHp12PIW0bnE3t+oMkr6RtpW
         lu/iY+7wxWh6X5qVKV7AShCKho92uZD11DZ/LtEc3ItxrUkEuzx5J+NmZL7owiD+H18t
         7zIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360084; x=1793964884;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c97+eBSw0JgaFK2XxPHQ2OocTE5xGkKfdIwT0n7EkqY=;
        b=wpZrChIPicRQ3VoKjcTYrpZM7UyzxHN2n5yVaToK29XBYdv9MUueWUbwXLsO0byvdM
         Y3QpoQw3jjyqGSNNOmdTe2T/witi0Vj3eV6VZiXMMxKI6twQ0tmBG2Vp0+aMxIWYvr1j
         eOKPGlvzNFxQqzlt3RD3hdIcLZNnH2oG19MOxfpzKi5Q9yXymCm1KMGJtre3MxG6IwJw
         HXs2Ll310xQLnIQ8GF7kf6vTk2JMc9yNywjxr/MOTH6QMWOLNxAZDD2zt2vQlUJoIfBp
         FgAuQLbUyNl/HRjCddHRCjCmlcKUS+T5s2yx17+tBmb0mYatJhDs1gWruLWXC+NvnZm4
         olvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0d8dGSIs6P3zTZej7dNzEZzyQyt7ZbtyNUONSk/BrpyUmE7csaKR4Bh1PgqYxeGST61JVLA+ePOAHXXZah9rf@lists.infradead.org
X-Gm-Message-State: AFq9FYIExOEmVEjVi0UwJQbNJPI9FOjul+8H07aszPSHtRBH41gonrPw
	JnALge2JJ++OtBTFwnhxLPKWvXAhcn2Q7Ylony0q87GH4HVtj4xOhoxlfILy9PcqVcNfACS778s
	spKdu9/T3Y2rOu41az8KOHHPI0ueNZiHdJGwYvGU7ZA==
X-Gm-Gg: AYBFou3uwoCyJuPAw0bOtfMDdLUNTwUFbGBwd4fr6XMPbWVX8hXOyUAP4Fu/QX+27vH
	fiyhg9YB5PcKbZA2MV9HTWhjLD9c+glBi2kogA55YoGVFT8Bav60AiL9TRonA0KAvNivd1wBxqk
	sHrRzIa6O8G2hgEpYZ2M4aoono+EMiC0qeOoO6BE7ETZM7ta97STGQ1IYwPxbs0JAyonRwbBOvp
	6LvEa6KYv2P8/N4kAS0nT/+yhGc1ujnFLffJRJNvjOK1y6Zwyx3lNaKGP7XD3+4k0TiTTqK5E2F
	uPH159Cp/YPTYRJfewiigZXCOJTYXpZJn6ZoPoePOVokJ7ocly+36QwNEZgXcWiIeI1OYrKlaQb
	h3jI7kmrgcd8/StBYfCvwq8d2ZK7fLdNkwXe0
X-Received: by 2002:a17:903:384d:b0:2e9:9bac:2e90 with SMTP id
 d9443c01a7336-2eb3650d23fmr19334835ad.65.1793360084151; Fri, 30 Oct 2026
 04:34:44 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-2-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-2-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:34:33 +0000
X-Gm-Features: AclHuK_tphtpQ4KgZ6QBDW1MCkhoNuUykWSbAiahdSvtWRJxD3fhHMWk1DFCw5Q
Message-ID: <CAPj87rMYHa6NmiwC3DJ30fSLukpyNJdgRa-Ri-TyZTpDu2NkrA@mail.gmail.com>
Subject: Re: [PATCH v5 02/15] drm/rockchip: vop2: Fix resource leak on
 vop2_enable() error path
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_043445_527591_9CA6613A 
X-CRM114-Status: GOOD (  10.04  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> vop2_enable() returns void, so callers cannot tell whether powering up
> the VOP2 succeeded.
>
> Additionally, if rockchip_drm_dma_attach_device() fails, vop2_enable()
> returns without disabling the core clocks or dropping the runtime PM
> reference taken earlier, leaking both.
>
> Make vop2_enable() return int and unwind all resources on every failure
> path.  As disabling the core clocks is also needed in vop2_disable(),
> factor it out into a local helper used by both.

Reviewed-by: Daniel Stone <daniels@collabora.com>

