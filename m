Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D1C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Jb9nsyp;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=AHOfU3Yy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SIhqbZ+2HotYam7MjDXog6M4P1fIwOCZkrn6io6yVIg=; b=4Jb9nsyp+Y8tT9mr7ovT4IcCJj
	QzssIA1sDPx9zH6GUT4wo4QKVn20sVMjC31vyG6V1wZ5MHcJ8CCJ+XDzk+cVkyLcraHhGgPrYauMY
	l/ZVVPncBu2Igxemjng64fINGDy62UoHgi/ygM5XWOvQfYopKWDlQIC29im22m15zFdtEyWoxsHbm
	57FzEmSgf5gqd3pojwMOkFYL5PvF5bP+uXX8X4O15vyIxOugXejjNIgkFNyd5ak7ayUkRRb51ys+f
	VW9N7tD+LngUqpKkg/sqcG1WeFYlmuCbVnOTESULgKFwDv5GUcM7Fz8hKGZcjTBc1fZaCaXFcZxs9
	OULmF+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwF8-00000008pg9-3otB;
	Thu, 05 Nov 2026 12:06:58 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwF2-00000008peM-3RZS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:06:55 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so390822a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880412; cv=none;
        d=google.com; s=arc-20260327;
        b=Q4hN+FGQGyaEmzTsXwsjPE+Hz4EE/w19sv6/1vs5A2Sl09lsw8QWg0jpmOoyi2hhUM
         5Y1uSLKjGiKoZ5dW/BLCnek9v9BovCHAM2nzDteCZZRhwwkhNWU7ss9fv2IadFziKpbq
         NNxq7uN8QD2+MsPiPOeZ3nTVCORoJg95SpfFa3Ko4InP2t6rLbZYB0uILVs3UEVD4XCr
         nx7ys5t/5vKWtGsD1aDkKP4ykMJdoLnR2eLrEF55VIgXDWDBJnn4Nl9fF/vvsWqiHKLD
         vdZ7/J/zfJts7WDkC8ZWikeMTpPosMl60g8YgvZKmKE6fOEygJOlIxNwsLdIgfygI6x2
         Qq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SIhqbZ+2HotYam7MjDXog6M4P1fIwOCZkrn6io6yVIg=;
        fh=UDb2hfncULMoU0ZOqJHcPQpEayaTlmhir8/Pmm93Dg0=;
        b=b3Eg0cAIwSyf3n4XPTpzaibgpRjbpR4h+MVQoOiVss0neKPQE237/uVJpcKQcs/9BO
         cBKL0euyhqXTx9O3kzdR8DQRP5hTXcLrI/tMVsxlM2gnQlpGekdk5jXhue7oD/HJMgiX
         8V+50U61JCI+nS16seNKRv24qnrLdu6iIz0RdzHPXFiCHi54f2NAiDeYrdnHN0txyIlE
         5Cf7UxO+8NmRWdY6FIJQ7bqNLVgiSSbmVWsuGiYgmuIed88bRhmR7iiniX53ktZDNiVP
         dFc7he6HxMsgBKS3DIMc+LQsjojI//KnDB7/fJrw/dP6bgXFyebS8yq2N0y83HHIvdsu
         briA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793880412; x=1794485212; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIhqbZ+2HotYam7MjDXog6M4P1fIwOCZkrn6io6yVIg=;
        b=AHOfU3Yy1p4pCQ/54E8ZsYs5lTvwpRpNTgGKdvmFO8NAzIlTB7SEzwz40Oe2P/byOu
         E6d56GU8oYkJ4Nz89q8ITRPaUPYZiW8blCBvMWD4B1IXeMAv1BCIKOsjU7jRFNBlhIaW
         8tz5ZVrDlWbr8fxezLQU6o6fvxPlvWwPfslpcURSnVfi3umMsAbiaZzGmqp+5rDqMM8X
         kud6r/fvok0Y75hJTrCzlpTEbupD2bySINe56D2jhyNl7gTWa1U+hAdru7mjk40sJBw8
         poZc+Me7xB5JIt79L3gLH8Vbiab6u85saKIucILG0VBWdZctvbHwAhjJ/ybkLdOBQDHE
         YvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880412; x=1794485212;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SIhqbZ+2HotYam7MjDXog6M4P1fIwOCZkrn6io6yVIg=;
        b=Wx5RE1Us6O/WnSrOJSW2GbiJI7EWvb0kpEEZPCUGZKx6DSCt/Lgs52PYJE0GT6AZwj
         Q8Oz/oiHFI8CvXZWdu+/rAUm9w3S5t5B0JmU/7kpfv+ZBQV+lizYMg07aAtT33JNJ19/
         eIqRZ13ofMPdYcRlKDlabVBWAyNZVyvww2nU6NiH/wQx2MQ6PGBWxPQp9wmFSRNxWHsu
         Uk7XPVO2utZWVKDHwCqkj+xYSX1cdvBg4OxzCY86GdtFIc8KkvsFjFe+nCwdD82rrPx0
         gpSjOE6XIDh7cVYY06n4JVsdpeEQaqYodJFyBgKwtnEJuseqN4iEfuRUgihRYI/OC5zc
         lkWw==
X-Forwarded-Encrypted: i=1; AKwUvBzOkjOQ9MY56NUGBiv5LMqneXmsqOj19Bt4y3FZDKJuCBPqIMXpc6Pris3eRP0vVVE3fh/TmGq1no6SE+SJMsCp@lists.infradead.org
X-Gm-Message-State: APuU4Z86gBvymEXY6mg3P4yTIRvFxKZ7X3oJPF5FgvRLjKiErj7KzE5C
	37ffuzJfOUaGe2Ev+2V2YpsSRFz+m7QvFFSrW4xhd9tGF4P5non15vsPjwMjTx3yqp8E9eicTp2
	+3AUGyNaKyLrj1z7GR1rLzKGK1N0U1Ua9SEbeMUFH/A==
X-Gm-Gg: AYBFou1TbQMKAYnPWJNWfpg2woG6OKHsElxTxUNdxseavkLMVmQNkZJDGthjrGY9u8L
	NAmav37pcJ6Y1XaZMn3TAMun/i4bnF0sdc0QxW3RQCmR+LckcZTlkG62H+fzcYThpeU6eKlQNio
	TgKBRAXaa8f30l3A3Gmbd2fYx2lyIjZeBc2tPeGJOe6ItkT/+LC58JuheSR6/67yeq6yCbI/AdJ
	g+DGQmvBqgmXMMMDbq1c/4JL1pjQVCCOFOs+bjGyQbAHlwT8YCICNvASho4eEKrpqSI862AsUoX
	fsLgjSjsYbiOwpsgOoVPp9JnMsh/IQ7buw100/B8L95DS78U+NPpZvM38G5qY5ancIAqvR7Sjt+
	1Hj6ouK/B8DfrdFpkwuhB6OMStUexPy9SlC3e
X-Received: by 2002:a17:90b:1fcc:b0:3ac:7406:b49 with SMTP id
 98e67ed59e1d1-3b0afc29351mr1335407a91.15.1793880411843; Thu, 05 Nov 2026
 04:06:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
 <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
 <CAPj87rOMjFEjOQ9TVgbGWu3gTwVjmjuFNtnFiyxbWO+g_RPqeA@mail.gmail.com> <f9797a72-2fd0-4127-b741-dfc6cf3306f1@collabora.com>
In-Reply-To: <f9797a72-2fd0-4127-b741-dfc6cf3306f1@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:06:40 +0000
X-Gm-Features: AclHuK_ucWApughnWJGAl5cPjcPtGno9PpRPUGuTDrBVFiQWtpP0tMXmnOOScVE
Message-ID: <CAPj87rN0944v4OyeJ+VNn5QBsnPsjGJUvNqiFmQFsO_wakOX=g@mail.gmail.com>
Subject: Re: [PATCH v5 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
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
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040652_870854_137CB081 
X-CRM114-Status: GOOD (  15.19  )
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

On Wed, 4 Nov 2026 at 20:56, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> On 10/30/26 1:52 PM, Daniel Stone wrote:
> > Same question as for the VOP2: why only special-case YUV422 when
> > YUV420 also needs special treatment? And presumably in a way which
> > can't just be mashed into bpc, because the maths doesn't work. So
> > would this be better off being handled as a separate output-mode
> > adjustment?
>
> For YUV420, the halving is already in the TMDS rate, so the PHY PLL output
> equals the halved VOP2 DCLK - no special handling required here.
>
> However, since YUV422 is not deep-colour packed, its TMDS rate equals the pixel
> clock and therefore the PHY must get 8 bpc.  This is essentially what
> drm_hdmi_compute_mode_clock() does, forcing 8 for YUV422 for the same reason.

I don't follow 'deep-colour packed' as it seems like a non-sequitur.
However, the TRM is pretty clear that a 2x pclk divisor on the clock
rate is required for YUV420 and split-VOP display outputs, so this is
fine.

Cheers,
Daniel

