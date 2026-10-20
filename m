Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA41D606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bVYlI5rM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ppg/2bVh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI1sDXL68rILFOS5IDyHXobc25qpbCh5q48o7ZrhuAs=; b=bVYlI5rMfoEf2o1S79Sqky+vPh
	QIrOhcIWi4ID2VzisLNWDIOwg19Y26OYnhKNOPymdPLs9ux/1P3uy0JLrymVQIwz+s0NhznxEsseC
	luSwskVZgf66QFvexpC/9CJ8IIRPD0j7QSLEcHv3E/6wqGcFT94+r64NejYNeRJOOzSUtMK0/96PQ
	d1rO24CzrS6hXU4DXd9VzpQGVf+r+cJgm8pIWog2pPzpTxyrb8PjDNwFZkTE7B6/K95NafeZlBIWs
	iGNYrOCUxnu+sZ1ehV8/9ylmy3BnpL+IrBojj8lHJMLqRAe5S+ZH2qEgCa5aUgiIVi63Aw5PKlHTm
	C1UyyKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyym-00000008elJ-1qXx;
	Tue, 20 Oct 2026 01:49:28 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyyj-00000008ekg-3l3p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 01:49:26 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-3535a54bed9so3802505eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 18:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460965; x=1793065765; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GI1sDXL68rILFOS5IDyHXobc25qpbCh5q48o7ZrhuAs=;
        b=Ppg/2bVhOgYgAQLlNYAnb6zKWpz0KD7oDPHhd8/c2W1oSq6bh1RAnfRZD8bHcBm7bA
         QCoGwZJFKVdgaKjnpgT6Xra1rlFL37YiG8zk53E/rKGyBnVl5kK6eSzLyUAo3mYQcp1x
         3XLCIUKWVzMOcWAYQ10EMTPdbtdMqY2IXo3CCS0xPQoAkfAPOzteqnogCmfgwiGzXikA
         QFokoMctnT9plNrIDjJwB+tkZJECNnNzqEIOGqVwtKt4QYvYWyD18+kPThwVrxrU1Gea
         7y+bVr+1BLEwPfLQbs+VaGfyNvv3LrY4+tve8otEi7vAsOjX2sSbAgDUgyX3cBjPTgx2
         I9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460965; x=1793065765;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GI1sDXL68rILFOS5IDyHXobc25qpbCh5q48o7ZrhuAs=;
        b=JWvYUjaWq5yTDknnu9ZxAGkWcvDK/gdhvBOkbiDvZJQkZrXywVYX+KxfwqyTUmIUv6
         ug6qDWwJjCPobOOuVA9mrwbeRmv2mHB8Nq1jheGxYpRdHsvY0Xr3ZMYnbhg+HdNsaOlG
         7ms2lopC16mRHDcMdt4hky2qcOctoeHnXAVITEkWj7aQEcE1vxR1yhjWy7xBJIId2fXY
         ttzw0GzWBx8zwJ8UJUCBKg0IntOo9mRYbW4lXwv5E2dKdXzbp4KEMfGvxqAC8EWLkRL+
         YqGMsiXrDd28ENRveDLZRT5/k4FXeZYdjgK5bgNVfcarJjgH7wzHAgTo3ddmsF9sOw4t
         4hLg==
X-Forwarded-Encrypted: i=1; AKwUvBwp7Zh0sl/hsAT9xOKQQ1ww8cICSZP+jN36+QxuFGeW6MDSg1d7/R3ffPbJwKuj4rr5NYY/4o8R3LnZh01oVJJm@lists.infradead.org
X-Gm-Message-State: AFq9FYLsVJSKU+VJIjxwmYIWsPddDh5fTZKCUnd8+xDEGT6xTJNjFUR7
	h1FC4cz1qom+8z0tkaQ/++4XykgyVESQ/S4TPVLKSDvfO8hST/LmDovm
X-Gm-Gg: AYBFou2FoN1xzChHHI/xIEteZlCyz5lB1JKvUuMz9mvTRrsNTZ4+iG5/DbtbEzwcmny
	1EYkk//wQtbOo+nDDuyGFIduAjyp2DwcdVAUhV6Zvdd0U+Psh5EKKjcU5Vrql5RsQybXqAAt17H
	zlyUvJissjIpNwioo4X0P4k0D5QYKGx8iIp+XoAwX7tw6MGgVu1LoGlusTupQUCxG89fl6vbqG7
	i51x2VZkJEAZZxkeatAKAkP6LdnoPoaitD4747dx7Ar7y9/YcIJiJGAwbjopObW8ri0KPFPFCkj
	m9oaTodaOW3zrcLCNkvzq9bdCsz9Z9Yc600zbDSyWdZMcJh9ynqoQzal3HLuSoDSirMqkbZ65lk
	ca+WelY+LSWMihZC+7r38onVoRg06bt8gR3u1w458l0XZlJEbjzW5IuOpF78ocZYO+9Z//5Sf8j
	Xc1dZwMve/caIIKnkSrCwIXq79axVsZBYPqagZeXhKeWxptR+04bl6xZViUATZJA03P9PAh9iCe
	i14NJ1StkFz
X-Received: by 2002:a05:7301:271c:b0:35d:b452:902a with SMTP id 5a478bee46e88-361a2942d31mr14312652eec.34.1792460964928;
        Mon, 19 Oct 2026 18:49:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm33941191eec.22.2026.10.19.18.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:49:24 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:49:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add
 Allwinner B288
Message-ID: <0ed8c1ac-1f9a-4cc0-b914-6b245f86d296@roeck-us.net>
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-10-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005202731.153971-10-pmazzini@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_184925_930461_2A6350F6 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 05, 2026 at 09:27:29PM +0100, Pablo Mazzini wrote:
> Same watchdog as the A31, which it falls back to.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter

