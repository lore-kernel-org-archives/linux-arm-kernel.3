Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06994606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3r/UQ6ao;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BkVSmJZO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDWovBO5t1R7cL/YqgMZtu04YVJnGP0rNvIJ0GRt0YA=; b=3r/UQ6aoSh7uz2OMoKuQPfi8Uk
	83nkmg7MT9ROcWcP3v4AVFTSFuI+B7FPUIxAiEBvJxa9FG5tBfBO5N+BPwnQ9nHaQS1BjjKkvSVVB
	ajxghEUxDaLAfNKWCYCCY8ZtZDgsmz9n5LrcN/LpN3GpD5JIjIcT+tNOrY1Gf/f8Z4Owjj7d1zCxp
	rxsbO9OLbF1KpEZ4BdJ83I0QLx9DgvA//BCj2m5K9OVY54voXV8gRHS18FskU0ZfKiVkZQoQJiuRF
	/7uNFf5WUW/Rz99E15y1dLQY8ljf8bh6xrMEXqIrmAAJdRhIB/yXxKIIKVNrgT0WiO7HqZW7FXJfK
	I4NtjwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyzg-00000008eum-2nuY;
	Tue, 20 Oct 2026 01:50:24 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyzd-00000008euM-45pR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 01:50:23 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-366421dc8ebso121537eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 18:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461021; x=1793065821; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iDWovBO5t1R7cL/YqgMZtu04YVJnGP0rNvIJ0GRt0YA=;
        b=BkVSmJZO74F3u1wOyus7eEjZsaLVl2cJ4LE720TpYKurn4IByD8+P2AP3Y3VEhRrom
         Cmlaltr1TPFaikwXdoXWJV6k64z8kFsQElxny0wh4c1MYQmYsDEUz6B6tP0KQhNULWsa
         ZtXKnuZRIQ5MKPSU52tjFkI+77mSNiwd2kOwvuF0auBiSgB/rgWRyn3GwV1xluEpN/dp
         lW1IFadv152inJq70S24jg4KAnB5vBSlJNzcv4l/Fgr0nATZhQ9lmoeylPVAiBSHQ2+v
         VX4wsipNkCdPfDNVvVSubZNdIDY+hGAFi8PN/BnjEglv9TsPC/+07TEkubpo8zW5dytN
         hZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461021; x=1793065821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDWovBO5t1R7cL/YqgMZtu04YVJnGP0rNvIJ0GRt0YA=;
        b=Td2Y4/xUaCnDR/2+/7cAZoRctVGIYADf6AzTWr8itvUx9ea9V+eDhDvIntCzrf15Qr
         nSIH20TM+7pO0KaQ20vKIuK5QTyiC334CeRscSXYk3uEBAjh30HaQfDPJMMUEyrfYfog
         S1w0LDefXJmM97/D5j6YFZPVoSId8ZR/l94mUWRbHsByE/MmvqiRIQzgPZZyF9jz5xt2
         0NNy1x9R8crf9OPUz2jZyPJ8T4wzvsnSBLNy2kSbXkm51iaeLuraWIsP4Wx1TsezkBMp
         JuxkcCL82T1PAQEwrf1v5nNVaz5quAaLmcFtRZZJEgfWw1Ysc+0IVYCKXTHlCNQN4o8L
         V8OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWUxPXZ4snPF7TcBm9XtgSrIeEBmiat6hVhnj1dkowfbLEUkubJvyA65ZqduLGtWBCTCMuL+I0qWPZCX6i1zqf@lists.infradead.org
X-Gm-Message-State: AFq9FYIn+U/E5OhWFbKtK25+tYxo4O27h0b9yOr207b0K7zjrKZzfS+P
	SY2B86rcUW5N5O85YlMLL5NTGkQP1N42rPtOmf0YGr7qT5GJ3baaBqkGqj7Icg==
X-Gm-Gg: AYBFou2RJRatZ655qrFsDSwDLY2094xFbb+Sz9+BXG/qbfiDX5BzUrm39WfYLICT62N
	wfHNA788vFKAxQmXdStBJwjkhfbkCFTWSCbz9y+AsfbrMM/v/qBRnx5AJt2AoK8dqcpRJVoGe2S
	pWaaod44KWDbh6G6DTFwYXpUmr8+qMgjRx8IksbidU6rqlrUfSxj86xIy8Y/BcZ5sWTkaMWj5BM
	lcI225NhXXnr2LEvxe9cs8AJE9xWshRsEzW5DjZjZ51ETNuCJ+XQRTG0Nu3ZhpsaeDMiBX7ZVQY
	v1O0j3FWvRPslugyevKHeHcyCVed6wUi2b9G3xOYkjY+6E22A67/dCecoOeCZyK99ePjjGmRY83
	begY3TFwMF8gJbksolw4haxFVG0D48T5tnWrKQItbHOeWUPnKapdIcTkrHTHB+pCpHzk1xOLSrt
	hIx/4bXJ+h+LmgKVyyT3bFp0OrTjdkJ+JEXCsJ4QgWSi+hgTYOb3sEuxP3wARQoi5yHWrcp6iz2
	0hqnWTrQyAt
X-Received: by 2002:a05:7300:e7a4:b0:353:5d7a:cabe with SMTP id 5a478bee46e88-365fad8dd2dmr1501089eec.13.1792461020849;
        Mon, 19 Oct 2026 18:50:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm37187697eec.5.2026.10.19.18.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:50:20 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:50:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add
 Allwinner B288
Message-ID: <b1f2e857-134f-4bd9-84cd-fa05f43a62a5@roeck-us.net>
References: <20261012100816.331033-1-pmazzini@gmail.com>
 <20261012100816.331033-10-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012100816.331033-10-pmazzini@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_185022_012694_D0FC5B08 
X-CRM114-Status: UNSURE (   9.09  )
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

On Mon, Oct 12, 2026 at 11:08:14AM +0100, Pablo Mazzini wrote:
> Same watchdog as the A31, which it falls back to.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter

