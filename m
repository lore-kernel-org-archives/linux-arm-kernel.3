Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500AA606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oqao31lj;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=oQ5w372D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IhotsZMujGgxWB8wogYX7M/QNYLtJDwXry3FOoC6GuE=; b=oqao31lj0ct4c8mKvskF0n2V0J
	hZITR0LZ6DbIZquu9pwpobE/MPO5+cBMcmD8h/c7599jcmVIA+KiBOl8aXZ+NUwFIFnAFojUcebeG
	RwI9/YNBjVvelS/ChLwPX0aguIdmiOLG8fO6PDBQB8oaAp19e8Z/IGX3EeWSnUmMW7kzE4NTcEqUE
	rNSlgzxt+h/of1qKwHcAdGO3zRFwxzFpNa7m4vDLnyYoMv5Dq2TkdgfZQZYbsIKb+8zFG686GQnJq
	2wEwPiljAG0YjnsJ0+nvSKN7plJtYim7mOAenEXxQdawLgsGf/pSZXt/aGQBTO+w0P6rsNh2hvwZz
	+LmconlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkgG-0000000BXoh-2xhL;
	Fri, 30 Oct 2026 11:21:56 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkg5-0000000BXh7-1Cty
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:21:46 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so302836b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793359303; cv=none;
        d=google.com; s=arc-20260327;
        b=fE3CQFwrohxHHfzOxOHllM/1m9dTKRVeLdo1mEE+WZ3RKz6Y6sEgu8nIwsCrmJdgH1
         l5EtPe5ecOgBBeDiVahkuOH4vKOLFpzhk01A6HMoVmf/aZG94POrSvI0ozGstrfjp7YM
         5dwSjN5i7iiPIrgEFuFGtgwD17JRXF/z03r3hUcYwb+PInBmFn2NTiVTBpyA3i0k/lv1
         RRdbPKEXfYSBIjU2+klxJKRolNpaHojsj9g5cZB/ZRBLLkTKCJ93O/zD4sHi2OWtu7Ia
         Q19imM33MIaIRrlAdpgvQHc5okCByLU27lB0H5sYVdgllbG309E6H9ntOuLXbWASaU4Y
         uopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IhotsZMujGgxWB8wogYX7M/QNYLtJDwXry3FOoC6GuE=;
        fh=5rZd4L+GA8dYHCCC47RyxPEo+uz9f8KbRmstf5+XkD8=;
        b=bOSzkjR4eEXhUOcyjPFJ0PFQt0DY2EMWvkS01yp4dof8igSPT9vHMY6y+L0978oUqS
         pIac/ouuFo1yiwd/+nxKN/t2RKbvCXdN0Sn7gA0xmMv1EA1vVDsMEUrlacwi8FnAplG1
         0f5PA64mc4qe0NfOOBxPtXJHGR3kFTNaWinASNFj1lzqFOVfwIprgenuNi/CERe5+CK0
         65XUZy1BxEWf/avqXMvRlcJ/t68p35frkvMxYl2FHtbqUlLNKcbypzB0oRzq0oYiyBWy
         NgaUpMzPLFqHAN8bGQX4+gx+2ti8TVx0yTdikbBIO+PHq5xAsuDZosxiYlTv0izDfXTK
         HU2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793359303; x=1793964103; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhotsZMujGgxWB8wogYX7M/QNYLtJDwXry3FOoC6GuE=;
        b=oQ5w372DwLpKKyBUglzmgODmaoYNYVffCMU6JNA4jXMn8iwr5XmYbHtwfYPPh652//
         5vsQ8+yXn4yjfWifVqf9B8nuSilDVHjR3ToT9TiQsCP+OFEY6/Z3d9pOMBB4aci1aEVN
         W+Pk4PROdbYthFN7H6PFpUB8Azr/HRLFfFBav0MvxDSHLAa94Hy5ysAeJsWKaNBMyxxd
         iXkZFDr/trA0IkqNjLJffPOyeAaSix0nSM3VEW88KbX2rZSG2b0dkQ7yv9iYmTYhFswi
         qToROoquWlB+5UXVxePnYNgIkSOLYrJi91yOoac4Cje+Y14WkXWu8SyH0XUD/IJY1+OU
         lCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359303; x=1793964103;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IhotsZMujGgxWB8wogYX7M/QNYLtJDwXry3FOoC6GuE=;
        b=iU+liLZzM4XI0XOuhwF639VwiWa/xg1gZDpFTMk+T6HVU53j+ZHeKZ8C79Jg0Z3t4L
         1YRM/9/J/P+9xDVfV9/UOa+S0klxZI/85G913AxNXlUExQU8NCbudsVr5NYeE/do7TrV
         z9XbaYr8FXwBiR6PX2djbLDOXch3a7rQrtVzq4cwb9VYKHSRKZLcKC/vHTH5rGz6H5b8
         7XP5YeAhOicil5tKazOpySOK1FOONYTkJEUd8ievXLBoHh+hzAkBXEeoGIzuIDOxiBCb
         PsjAvG7U0AWBOkjczPqN07JmYpzp57HBIjTNgmV7rhLwupfSk8Nr63dsZHfaocUFQXor
         MOCA==
X-Forwarded-Encrypted: i=1; AKwUvBzOwE5dmJEFEUgfA4QjhNRRwyOTwEvpjxgAdZPfPctID5C1Hme1QAkEYeQtmmIYjoFb0Y3C29mCnmf+LoCHhVcD@lists.infradead.org
X-Gm-Message-State: AFq9FYKXmD6mwn1hjoRZoJ0teB42m070syS4S2Osc4DbyyXRK4U3aDIv
	S/k6MoKiircGEEESFMO+d6Rsk5QcNujatyT2NXLp0EZi0mhvqqoefq0NteqCoZ+L7u/FjMOQCTZ
	VW7yoqyIspKc9xROjIZd3d7WqrRuwL6YykD0DyLkhFCCe3GgQM6I25XQ=
X-Gm-Gg: AYBFou1KEVeDPTphzfKo9Qq5g3b2r0k8MxTwL4ESJ2KCjEdmNFANKfmJRHZ+c8oRKSW
	LkO1AWArCzsAHKudfG5EEx2GtNzmQPJSLe5vE6d7oGGXgYuyrs4TtjBhT1L9OTfJO8liCxxz4/K
	QbjtG7u5aLXhxVkoveyiTsCQbydQCKn+Sw2IXWXfV29PMRnSaV6zhj0dJZJHr3YWhL7aMcCSZLX
	RWV9aTUzROKBMDgwu3Mrm6aViY+wnfIQvfN6T4P/x9nYgJPByrueSroZhpypJ9z558lCpEzdGas
	3k2vOm5zKvtJn59yfybPB2UszU2zRuJcUMbZgR+fWQKn4ZlIcP7ALHQk9EwPCzJQNyWo24CRplY
	TXpJfRowYNMJFjqZHITScUiX31KbQ5/phnzzY
X-Received: by 2002:a05:6a00:12dc:b0:8a0:18bd:ddb0 with SMTP id
 d2e1a72fcca58-8a9bf71b34fmr1264612b3a.26.1793359302995; Fri, 30 Oct 2026
 04:21:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-4-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-4-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:21:32 +0000
X-Gm-Features: AclHuK_sZpu_OHKEsqb49igvHOjsFenvWY6XU2UJTZwHMq2AAjoVYXumXoLt9p0
Message-ID: <CAPj87rN1rzjDMPvVJytwmvHGipCCuYOyX3abTRqYp4Vq5PyrYQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/15] drm/rockchip: vop2: Send pending event when
 atomic_enable() fails
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
X-CRM114-CacheID: sfid-20261030_042145_430038_3643C9B2 
X-CRM114-Status: GOOD (  18.86  )
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

Hi Cristian,

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> vop2_crtc_atomic_flush() stashes the CRTC completion event in vp->event
> and relies on the frame start interrupt (VP_INT_FS_FIELD) to deliver it
> later via drm_crtc_send_vblank_event().  Since atomic_enable() runs
> before atomic_flush(), bailing on an error path makes it skip
> drm_crtc_vblank_on() and leave the video port disabled.  atomic_flush()
> still traps the event in vp->event, but since the port never scans out,
> the frame start interrupt does not fire and the event is not delivered.
> Userspace waiting for the flip completion then blocks indefinitely.
>
> Note the event cannot be flushed from atomic_disable(), as userspace
> waits for the completion before committing the next state, so the
> disable does not arrive and draining it there would deadlock.
>
> Use the newly added vp->enabled flag to detect this in atomic_flush()
> and send the event immediately when the port did not come up, rather
> than deferring it to an interrupt that will never occur.  This also
> avoids the spurious drm_crtc_vblank_get() WARN previously hit on the
> failed enable path, where the vblank is not on.

I really don't know how I feel about this one.

atomic_enable() is not supposed to fail at all, hence returning void.
(Obviously, there are scenarios where it will fail, which Sashiko
keeps 'helpfully' pointing out ...)

I don't like how this just papers over the issue. It turns an eventual
WARN on vblank timeout - which surfaces the issue - into a silent
false-success. Userspace just sees commit completion requests arrive
as soon as it's posted the commit, so it keeps on going on and
everyone's happy. Having the flips time out is a messy splat of WARNs,
but at least that messy splat points at the exact issues, rather than
the screen just going black and userspace blithely trying to continue
on.

Cheers,
Daniel

