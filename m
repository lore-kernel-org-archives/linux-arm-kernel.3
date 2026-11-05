Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F114606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G7Cics3t;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=IywYu9JO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZvGn0TWxKmoxK6KM44Y6QgeDgPYc9rdxIcbth936aAY=; b=G7Cics3t9TtxvKRXYCO8UzgoiA
	WX/XqbHzynD1BKVrPTVpd3YxW3csJXIWtqR+EASJooB00Z1r3gwEK5hKDmZzvQwyFFxB6Cb+qQD2N
	YDoIbcOYZhtV7sAY+iTT//+2PqRqxlyoj8tb0LDCNfEXsjWVLdZrilF/N3dZszoeNRDmkStFVFTEx
	antJ6AvU81vJduHV8FAkQ/+TH5+gMnsELzmf5S7DxftXqCJdRJVnDLU5bUTvo90LT9q0QmwhnCZ/6
	Z5s5nRY6lrqcxkxuOAydrnO10APSMwmiSAu59CbDyRm+aUj2G/+RFwSbWDZitgvy/QNL7BLyWR/M9
	3/s4QYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwXR-00000008wcK-3aMF;
	Thu, 05 Nov 2026 12:25:53 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwX9-00000008wUc-3yfF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:25:48 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1582633a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:25:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793881535; cv=none;
        d=google.com; s=arc-20260327;
        b=n+RImOzmtIn8OWS3vmUkfF1ZtQHFrdKgfT3XLzhfRtVU78Rsmt3L5w9mMPQOxDzl3T
         sd0Dpl55RebpqW6/aG2++m7F3K/SDxsHb1MmlNPAro5hFBnpZNjyJ2W3noXlN32elKkg
         yscJ7r0OIBKRw2t6Yp4NCJsOZFO/sSEqwzQmRemGetvwogKdp1362eAVMh7G9TLF5VaU
         aOHLl01oSGhvfezJm9QAHllpI7/6BMoRcVO4B3gFO4HNgohuIF6U7KHE9l8KSy6YPKyV
         V1U824v7B48vtcO6zDXC6l5NtoXHUHnrOP6Uho0cJpnM9BZLzqV36JIjqdp+DOS4rxOK
         Czww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZvGn0TWxKmoxK6KM44Y6QgeDgPYc9rdxIcbth936aAY=;
        fh=lwljskO+ZhBp9ZS/7Tul+M6XtAR8ZfvZ/x5gQtvTTHk=;
        b=p96c5F5vaXwjpVe/vjK3witA1SUW3av8iPRdQGMnLQr/rGAOLsRLlNVo/f1CTikdKp
         Hw2sogJtDabRDxIT7KizLZpE9cBBVvJBUkIM8RktDp4vK1w8nCJQvW+BCmejvb8ko02c
         J2D1D8sWIjFcDmItggYBf/brvC4pzstvNUTH5hgvUbT+ZhfPQ4OTZn6n7YsX+Ym7bpjp
         jx/ShnK/OLZu3A+h9DE7p/2LiyTBYZ4n2VruJKjVWXDAuNLJxw2Vg5GTAXc1pAk49Kl2
         c+SXxlkoJDvHiLh8FNwk4zt3qXOk6mJHTXxY4aeA3csetZyYARIjJhif8xwTRB342nEv
         2UMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793881535; x=1794486335; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvGn0TWxKmoxK6KM44Y6QgeDgPYc9rdxIcbth936aAY=;
        b=IywYu9JOK2BwvDFjPzM+Tup7jxp5wCEqeq2UfuoeHqBVdOE/c5a35Z/vFWJ8PebnMT
         kJjE7fHfvH4qxAb3J7iie5Iq2KE0WT5uZQTqiqk6wHcYDETkjit+cZCsScTA1CJ+U+D8
         NSF+Cem6lnh61m2UvTu57ZVoOHmMOnmhgvLjyWRYWLeDi+H4U1aNSztswaNMKGppA1oS
         o1XXrQaWKQA5r0ax3TpQa1BN2GfjUVUnW8VN3TOLH1DHEhPstJ0EWF7miJkAPEmvvuF6
         KwPgId+57nsFX/U6oqDhelCdxTMt+m/W8UA/0DMBSiagybNcf27unNJyx80tCUVWGjcE
         1JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881535; x=1794486335;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZvGn0TWxKmoxK6KM44Y6QgeDgPYc9rdxIcbth936aAY=;
        b=gnB4biky5MoSRDT063RqV3yTqAGBL7SBqZR6wl9WBB9TCyZ8xRqCin+VNc9TPm5vxS
         UAr7ScRSpDcwxi03RvuAVPOEwq5twlD2BXMPNqYZAUncpHfrNswpatNoC02a74MUMz6/
         RnplzCbiFKgEddl70g17IoglcwMHfbUiEzYmq3dkeobodNuM9plWntqbvZvJAhz5EOEg
         ay+eAfzt7eWKfj6uajVX9Z6h232IV/wqjyjq1F3+9vRrXe2byQ48OvtrdvbUCHjU62TX
         I+VpF8jCDK2Se8lHRFEwZslCDKgR7Snz8YBzPDxsdmIv/GXJphoD/2J7YvO9xdsSezBu
         jJcA==
X-Forwarded-Encrypted: i=1; AKwUvBzrqz9Xys/FhM5LUyqG0BEVJzWYp5flnpvAggUNkT45x9/MjUhHQGeWFm1dtn7ZqSK9Inz1dEKrSbRYq0jxqqHt@lists.infradead.org
X-Gm-Message-State: APuU4Z/hSeHxCE9JETQ+KCnda5fqu7uBAkM/LATvgfc/pZKV/u7zL+0p
	2L9pkAdPaZ9SwITN4Mmp4d8NhRme3GEo7os8kENdPKGcREq/iOdzQphSODMVdo7+8JkHA97PHeI
	uXl7iCPXCy6f72mCImTbm7gnExkvEkBPw3SBKGMTd4Q==
X-Gm-Gg: AYBFou1iw/RETagdFtmT8/3ue5mVoY3lksV0UAZkOjNh/Qracbx/6B7kG9Qb8eVMzf4
	K3KIAFO5BqQ0gvjbZRbfurwEbAqdX22kbvUDpCRNzcwsk0kApVHc9JqqiNBi7X1tBaWI1Avyzog
	R9a+oY6eqo1lmXpzkhLbavvyj7Hx+f+RGZuW6PtS9fz0gEfUPIvJRZ3ZohEIqqRPvsMiCmYMT66
	vSOkMrbSHCyd5rJyIwturM4W07oucDRqdqT6d+0K1amyEe2R1OKdAY55HvvlT+Fb3QapwQIlYgN
	fDjBLrRuyPrtmLKuvfwZ+101Mf6RwlHBBQw7ZFCUo1IOuM3chn/vaG/M3HhFT0+BEcVYeVR+fTF
	213Imv0j1sw5gd/mx8Hxy0jCy/Ih2WeVjCv5E
X-Received: by 2002:a17:90b:180d:b0:3ab:2d46:1dd2 with SMTP id
 98e67ed59e1d1-3ae895a5c46mr17306949a91.6.1793881534904; Thu, 05 Nov 2026
 04:25:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:25:23 +0000
X-Gm-Features: AclHuK94D60Hc87aFX4xe_hS9QfUHnTA410grumPTEjY5dxN4dgYm-_Kh7IGrsk
Message-ID: <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261105_042545_045380_39BD53C2 
X-CRM114-Status: GOOD (  15.39  )
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

Hi Cristi,

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Changes in v6:
> - Added new vop2 patch "Disable core clocks before dropping runtime PM
>   reference" (Sashiko)
>
> Changes in v5:
> - Added new patch "drm/rockchip: dw_hdmi_qp: Do not mask error code in
>   atomic_check()" to fix a pre-existing issue reported by Sashiko
>
> Changes in v3:
> - Updated patch 3 to skip any hardware programming in the callbacks
>   gated by drm_atomic_helper_commit_planes() after powering down VOP2 on
>   an atomic_enable() error (Sashiko)
> - Ensured VBLANK events are sent immediately when atomic_enable() fails,
>   hence preventing userspace processes waiting for the page flip
>   completion to hang indefinitely (new patch 4, Sashiko)
>
> Changes in v2:
> - Addressed several issues reported by Sashiko
>   * Reset AXI before detaching the IOMMU domain, to close a theoretical
>     window where stale or in-flight DMA transactions could fault or
>     access memory untranslated after the domain is detached (patch 6)
>   * Fixed resource leak on vop2_enable() error path (new patch 2)
>   * Balance state on atomic_enable error paths (new patch 3)
>   * Avoided division by zero when computing max_dclk (new path 4)
>   * Fixed VOP2_MAX_DCLK_RATE overflow on 32-bit (new patch 5)

I think everything in here should now be solidly reviewed. But if this
series keeps on collecting unrelated patches until Sashiko decides all
of VOP2 is bug-free, we will never get this series merged. Could we
please keep this series focused on the useful bits at the end, and not
keep on adding speculative new Sashiko-pleasing as artificial
dependencies?

Cheers,
Daniel

