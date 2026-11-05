Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF61606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iHzlnlLA;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=WnJP8bqp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fwDskA9fWTX9sBCyIzGNiSQQNIOQGfJ8qP89spP3R4A=; b=iHzlnlLAzHZCuHglwa/Kfbi7xP
	CcVyh9kezI4QTpuWG5gbOiKQMXPpWIgbVlLbx5EEJRsfN26Z2T0Z98qu0wXLHF04278izddNT2oKK
	cAocbBhneCaLVQb1FJU5jK6JiiNg+ronblb8v1l+jxs4KT84/DT281ZaMi6/5GXRICnD44qPiIHRK
	4RgqWgej3Ga/ivLeyupgsA6jw9Cp8VSbZ+U7b5kyUOQwJ6VvKML13jHcUY3h3U2n0Eo13YuXhG/H0
	G+gLEY4t51fLFGeyk7cD7oN9uRJ+p5TSrfpLPKddqYDXhPsS9ZYkm/yje/ocE8U3gXPYd94S62Foj
	20rdkFIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwWZ-00000008wAO-04gq;
	Thu, 05 Nov 2026 12:24:59 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwWU-00000008w63-1NUt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:24:57 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cdab938dc83so783939a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793881493; cv=none;
        d=google.com; s=arc-20260327;
        b=ROeElicoWGzZyF4lmjncr3IMWcGFVo6YP6emrxQEmI9H5h0//SLJUwiyAQGiWXinCW
         fRDqTfXQyEP7JXoN5ZLqiyMT93tZkMshhAcsgasYj/vA4bwfuzgHkcH1ghz7+jv51LmK
         ZgOCecuPhmsYdGT7CDAIb7x7R/7oH7rrEBuCoyNGIgVOeRUKnsz2RzVIf/GwCuknXpbq
         njBuXfY5IOQiZ1ih0ATW269YJyO/LgjHF01plCgXkJ7GB3CZg29JXGqltevRSvC55hiI
         IQPDkBHuoELdg/grYtj2ts1OLdnY37jJL8/L2y2Zb/ZFFfVuDiwKwlHdOtwheAaw7c+F
         m+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fwDskA9fWTX9sBCyIzGNiSQQNIOQGfJ8qP89spP3R4A=;
        fh=J1k7uwLKLgpiHgrRcUXjXdvMJMdfSh1Cc9cjUMSMU+M=;
        b=ecjKndYbBUJE1fhUSUnSVKYeA+VB5Pw8t6oMqQ8IMeqjWjUCjy9plzKETLVFDF+szA
         H5kXFLyh5DEG7t/YXjUURLpYzvnOHBo3YtzzqUqSZjH3ZXhnk6Ond5UEdXVtjTTKfqSb
         zHUD1XCbIXAD6WENstSEsJOy96lYT76RhtiFvBU1DGO+/0WA4pKy3M7ZfcYHmRnvYImJ
         lRoQwZ7y/zGbSo9EFDo8xmqvs+eHV3b3ICBBG6q2Wf8hRRJ+IE3yWlvErqe/ug5f8Yqk
         M0/CvR17Q7/m6sxFC34/BKkMD6+UYowNeCWtFdWv0iIdumDfaMXV+sekBQxecqzYfQVr
         RnTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793881493; x=1794486293; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwDskA9fWTX9sBCyIzGNiSQQNIOQGfJ8qP89spP3R4A=;
        b=WnJP8bqpyog18LZsLGF2qdhZYAkWM+Q2Mu1g40D6N69mwJfTXzENVyPc0A/H0eSu6f
         dws6baXX47ec6YkzgcYUG4nkPkCPO2u/5sLembNvYqeCkpMQUTmKM659V8hFQ4FVntU6
         ku70Nc8BQ43t5Mb468G8J5pSVgGDR2Z0D4mpSjFTuPi9jg9ZFDQsxijZoiR2g6klNAzS
         6uj2zCOOJu6IbdEMQsJaplt8EF1kr+jAbWqHCK5LNZ0l/L1cYhZUtqLU6SrExrcZFsuA
         pe3f2eyXhkA9Nxb1dkFMRqKMg8gHG+QOC/xaF6EWG27/zCcTPbT23QqD2AGuBYhEFioR
         ByKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881493; x=1794486293;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fwDskA9fWTX9sBCyIzGNiSQQNIOQGfJ8qP89spP3R4A=;
        b=UOcRhOM+AlWg0BkZYoZ6ws018Zr4Xjhi8KHocfSAod81vuLmJ1lq1QrWV4wFNEk4Jj
         vV5uYVYT0TfwLE5IhRtWahdcLbGqVmyVxhM+LZb0Qyv8rem+uqBl7fbb/kqOQHY+WIC8
         csyWLFzdu1QJpuMj/iy5R245wEs9W3cc0xlouJxigS5M4WHZof3UCttwqKTJK4iZPSMB
         8vr/uNCX9GVCQlY2C6q1y1xAdZbCZKFG+Sd+EtPbe3weJJUgNGtEi0dmJd4jcthcCy0R
         FZDnc6zGjPidLDX3vYkD2u0jBvntrLb6R9I4IXtqBqEdiU28Plm18VwgY8y2eVZWev7i
         j59w==
X-Forwarded-Encrypted: i=1; AKwUvBx8guaqQ9ZXgriQ0lW+OliPctc7fdD9YjIRPmH2xXqmfAiA+Z2en3nu0dmUE3vAQqIznxmdKa2ckGdxZ5PYzGi3@lists.infradead.org
X-Gm-Message-State: APuU4Z8XHnZRqdCrRQKJRiX4d9xNPfSCbJjmfvPnw3owoGdY9nLSkJm4
	2XRgxvsxNX+bZWEKdFVPGhEWBChWTG6QLHumPprOGf/svIad6N7iijf4dfPAduhm6bXPbsSagP4
	3l6Vbd0QzkrptLzCJSYkZ7gMW1MJS3uHpYvKHTJkXrg==
X-Gm-Gg: AYBFou2PqgSHXWC7nhFtu6NQksg//grvmgfonV0NBHYA0DXGjWfNeWbCC4CTJkFPOHm
	72PYr0gYWzg8R4uTvq5j+eXCfLzgTQi+puofxtjeGJcEppHY7zIjzspHusBqM/sBXC2gHn8XWS5
	nvtxEJRgboxPO2gDbVDNoNl7PK2X0q1iuy3OYMTzdXLQN0Nt2snnJVRaOxvZnaN0OjGzqFi8A92
	iYTYPndOZiSLynmx5F6pLwYDdgi5ToPqjQ/ApVY8TuR2GEbZ/uCUdTogZiEKTWe5mXPxyfY5dR0
	n8cyJBrADE/TGSy3I3D0Cq6sEqKXhrfumU9zacCwBfVDmoNPU3/eF8yPgPzZgUjzRQ4tiljP9qA
	+zAFCkcuSOQ9opwDoYgE59sZJbFPpzSKxtAsY
X-Received: by 2002:a17:90b:5485:b0:3ad:c482:ae9a with SMTP id
 98e67ed59e1d1-3ae8957cc71mr15827995a91.1.1793881493387; Thu, 05 Nov 2026
 04:24:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-4-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-4-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:24:41 +0000
X-Gm-Features: AclHuK9ClbYY9N6f31xMjtm_H95iii7gcZZZTGs_rA5ccUrhMgtzVapBrsI3_h4
Message-ID: <CAPj87rOgPMc4_nvVj+aHK7qUEQBXCMa4OUHHC=GyYzr2Ls_Wag@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] drm/rockchip: vop2: Balance state on
 atomic_enable() error paths
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
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_042454_430958_6F58BACB 
X-CRM114-Status: GOOD (  16.23  )
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

Hi,

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> vop2_crtc_atomic_enable() prepares vp->dclk and, for the first CRTC,
> calls vop2_enable(), incrementing the shared vop2->enable_count before
> programming VOP2 registers.  Two later failure points return early with
> only vop2_unlock(), leaking the dclk prepare, the enable_count
> increment, and the core clocks / PM runtime reference from
> vop2_enable().
>
> Since the disable path decrements enable_count unconditionally, the
> leaked increment skews the count, causing an underflow or premature
> shutdown of core clocks and PM runtime while another CRTC is active.
>
> Moreover, cleaning up on the enable error paths alone is insufficient.
> A CRTC whose atomic_enable() bailed is still committed as active, so
> vop2_crtc_atomic_disable() still runs its full teardown, releasing the
> same dclk prepare and enable_count a second time, thus underflowing both
> counts and, where vop2_enable() ran, touching VOP registers with core
> clocks gated.
>
> Fix this by reverting exactly what was set up on failure, and track the
> per-VP bring-up state so atomic_disable() skips teardown when
> atomic_enable() never completed.  Additionally, ensure any further
> hardware programming is also skipped within the affected RPM commit
> tail, i.e. in the callbacks gated by drm_atomic_helper_commit_planes():
> vop2_crtc_atomic_begin(), vop2_plane_atomic_update{update|disable}() and
> vop2_crtc_atomic_flush().

This one is:
Acked-by: Daniel Stone <daniels@collabora.com>

I don't think it's the world's most complete fix which covers every
corner case, but on the other hand, building out the tracking
infrastructure to do that, for cases which will almost never occur in
practice, is going to make the driver pretty unmaintainable. This is
pretty much as far as I think it makes sense to go.

Cheers,
Daniel

