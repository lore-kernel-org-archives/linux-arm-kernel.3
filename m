Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF7C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A5P0BaCI;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=KXnUfh+P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PaO3mUrvyrlxLx6T6FMLOlGYCy2w7sWQHAyzdDwn7S0=; b=A5P0BaCI4wucy5B/kqOpXrKRVq
	RdltesUZ9OlD5FUfFF81V8LeS14qNX4EHvlnjgyfTKC/kDXnt87zApV0+HFj9c6d7ATeYiuuOiAHm
	iSjrUpecT2c560ex9ZAN0ChvJSY9PqriSonP75WLIQGP2tZ3LsxXUV/MdOPpkYd9bD7ueTV+jglJD
	tmPboDVnrcCoYE+8HwOMH7BnaWeSyuNH8CFQYvINuJJ5QV4g3G+OdB13YLBV+2neNen3u6Wv7w3sw
	MwCPOlF9RLeoA8cqtgm0cLsqY7g5/0NOScqO1fAfJcHE7HfJs+FCudQAuuXFQxSlFXvvDPX9gp9B1
	0kd/66Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw4b-00000008mtu-2NBK;
	Thu, 05 Nov 2026 11:56:05 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw4Z-00000008msT-2MC6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:56:04 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1226487a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:56:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793879763; cv=none;
        d=google.com; s=arc-20260327;
        b=qIySj+lCAVSVujXLqcFOybp6vs/DCK8Qyx4YsClhMw9HPqvXypz8cqfTxatUvbxvXj
         ZCUSSzPrUEaLA+gA+g4IhAsgwUotxZrBbfsenE5oHeZ6rV1Yyq4DOm5BUSJcMzPB+BE/
         w/Vvspd+1j9dHuzU+XdS86BAWaqlNn9hQR4sYnaY5DF3mGnGHVtYxv9YXiXZGJwr0gV+
         bfMOCrJIuH8k6weqb8CQVMMkfumPdadJmMb6ZFLX6knHGOdXKIw58ZM9RVAO1uKUSsXC
         /4YLTv76804MkEuFmwlutaq0nVCRvO/HpA1CLP2dkWYUk14TLaTcK/cN3Q3JjZWt2Ww1
         pAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PaO3mUrvyrlxLx6T6FMLOlGYCy2w7sWQHAyzdDwn7S0=;
        fh=DhuP6/Tax2eK1BVqf/S92czvQ+4s+AZ4MomL+zxXWrI=;
        b=H5wr9KNdoyqxajMeVonXmeMagfscls1Gcmjy3Ha8LAZtxeNFj9fXmNnPhOshfWSqWE
         /N0RhMhjM9IJtCGFzYH688JmUsaNjBRfszJTOG2R4p+Wh+BG7JzJGYCkzu3Ytbb8Kqz0
         Ns2u3p5IXCYF7OdTZ4fw0VqlcP8NFVKjjfPwB4K/TRn5fDrqnbmuTLHuYqmCzGCt/MaC
         GoDM5VFSWtCYrVWeVbs4miQ0jo5eBQl1JOQp3Rkfo402sbNEFJHFtE8vPNMCEk0ziUYq
         3ALFBgbuwrx/yVL8KQ6gCoHp2kawwMuukumWsSmCdDS1xAvmQme8O1T5nsTU4v0wnVoy
         ZWNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793879763; x=1794484563; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaO3mUrvyrlxLx6T6FMLOlGYCy2w7sWQHAyzdDwn7S0=;
        b=KXnUfh+Pr+kFeLWcEYxtogMeYsntIPVeC7W76T4Yi839FO/LhYyA53dbIB7FIMSu+H
         s18ZlThDNtiDuWlmotnCbzDQ0qljh6aAgw/ifvjgUvZVo1bIJaZPZUW4RoMgcRusipQx
         8KDcee7GsUgixlQCBpX2chDoMQS9z80FOIYwFodXiGwrXIZ/RUMUDr2MlAIRoynhv6jS
         ThdaJCbWEYnDZ3a0r1R+yCbx2BQY4TwXqyv1N0uAebpe6OkvAJuawDlOz7PmC1WLNHZo
         +3GHjAtg9O4vAkl0GQFUlD33eed8N4a/57Ti0HC/9K0obBnePXoNdAaApxf0QrXca3Zn
         ApqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879763; x=1794484563;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PaO3mUrvyrlxLx6T6FMLOlGYCy2w7sWQHAyzdDwn7S0=;
        b=x4UR9/mGi4TXGKf91ufvOnIeQC9H/xr3C8ws2OcHBVAerpNQyPqbuToASPkDBYEa17
         3OmpeYBFz45mT8NgrWV/Rm7Ag/pYmAnmPahRtUamFKzi3QNSmPsXStDmBAGeVhmCQjoZ
         nvz5+xs7bAyyDZmKY3XejK6hcmowXYL9Q3ntHRkxZtRUmcIOhwht9c5YpfAni/EwoZh8
         Rd8TSU+Ga9PM1q6fQwnCUYzCX9Ux4ZHl2FlUjlBZgZs64AQHQpkNmAsik5zDo1afxzJl
         QY27IISc4wepZDsxdefzHh+ZYkI24igZ0ObyjktJBGJY+R6LvY8IAqRm+TyKJtCgoXJL
         GOQw==
X-Forwarded-Encrypted: i=1; AKwUvBxq6gwcfnKNH5/vysKKZU1RZdZQfd29EMQZuZzPwKFxvA1rzNfO4zcxefQfZM0iSxrEij6CkBKuRpbuVWyInqYE@lists.infradead.org
X-Gm-Message-State: APuU4Z9RMcpfm1NQfwWZqdEJsztAsiZyniq3zXW8udlJAtcHn+Y34D7Y
	DGNLRP8CuOdqy6Gsjryv3EzMr1BHJ2XM230vc7JVVqqcj9u/yCMQa8ui0bAu75ceiZgy9/blwa5
	CfKYr0qlYVCsdRVoBsr3e/p9SdtXR6EGJ0+o5i7w7NQ==
X-Gm-Gg: AYBFou0XAppPtE+qssh7Ej++moZtWeRF2NbqIxiLtiaS7BK7S9oWl5XI0s8XGbPZIQL
	JNVuNW445DCkjVCDNANG3xD/+0ZVTnFI9quItdPozkX83oKIajKEUVVdj+OYx6qMuh6CjbLI3vs
	i6uxIwS4/nOiKhAgbCYpaFIqs1eolqkiH5N8npUPUWQlPff+7JEINOceZ9Qd3NfcZyyCMW8qqKh
	WNk+Pln+AySikZ3+44m8v73y9vkFPUWrUT2O7Im2Er7YmdfhGTJlaOZivbWNzJL6+h6R5FXs+2r
	YWY9VkWPGfd0YpcK8tmz0htznVNV2t7efj0r26J02sXLfGgGPqH22PH4sXUpWtNY7LziN4mH8f5
	PJBdsOvRf8ZM4zKYO8jxGdYrzFGz1Nh4Q0ZZ1
X-Received: by 2002:a17:90b:3b83:b0:3a8:5d1f:59ad with SMTP id
 98e67ed59e1d1-3ae89819ff5mr17083778a91.43.1793879762611; Thu, 05 Nov 2026
 03:56:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-12-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-12-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 11:55:50 +0000
X-Gm-Features: AclHuK8Jj7G6el-i8_82b6TJ0oa9AUPdN0owTnb0JTIANqcEHa0Ic8C9cFJ1sYI
Message-ID: <CAPj87rOAjcLZeKsKCMr84NoN89VzRDLV7Z8LySHK-DVyRW=u2Q@mail.gmail.com>
Subject: Re: [PATCH v6 12/15] drm/rockchip: dw_hdmi_qp: Do not mask error code
 in atomic_check()
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
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_035603_602770_151B93EF 
X-CRM114-Status: GOOD (  11.71  )
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

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> dw_hdmi_qp_rockchip_get_vop_format() calls
> drm_atomic_get_bridge_state(), which takes the bridge private object
> lock through the atomic state's ww acquire context and may therefore
> fail with -EDEADLK when the lock is contended.
>
> The DRM core expects -EDEADLK to be propagated up from atomic_check()
> so it can drop all held locks and restart the commit.  Replacing it
> with a hardcoded -EINVAL defeats this backoff mechanism, making
> otherwise valid commits fail spuriously when multiple threads perform
> atomic commits concurrently.
>
> Propagate the error code returned by the helper instead of
> unnecessarily overriding it.

Reviewed-by: Daniel Stone <daniels@collabora.com>

