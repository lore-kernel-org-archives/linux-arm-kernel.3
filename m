Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A473460A383B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SA4UntUH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BtMbeGm6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=; b=SA4UntUH97korC2Gp4Cx7dkpmK
	oEEJbcCuPPG7IYu6e8BgHWOZm0jdwOkgaoiMKrkfLxN28Eh8IbmJIUPIQs0bz88euUnoJenCjSJFa
	DrNl6s6XFBkiwfaYiNbdROZX2WkeqiLeM9ed8AwB5rniqHiu/VHqSWyyLLUoYqiv1820zvqao6gW+
	bBz0JbYiSrtkEssDzmsWUdJ7U2q5DbEJ/uFrWckaCkvEcFwMF4VF5E65jSXYyyaf6eLCoOarIhNEv
	mXDUaVfOfANT54EHKFN3lAxI/ycF/ixukCTgLJ36oZ9QICGDJd9bNNajZ3eQszeCDREPvvDyMGHHw
	dxgKMScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFnu-00000002l0F-0wWc;
	Tue, 03 Nov 2026 14:48:02 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFnm-00000002ktH-0tMU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:48:00 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-679a2297c55so4542911d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 06:47:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717273; cv=none;
        d=google.com; s=arc-20260327;
        b=TKQBPag+pExDydRDoBo2zJ1HUR2quk9QgW++OTG22fZlfq0BxtCmxodwFOqMy4tX8y
         vqZDurhwmtw/PzBlu+LX0CzIhOVD4kwSq3gfQUdjVU3fWViVD+N4qtwotrIPbwEGxLYT
         VJTDK1n7ngi/Hhz+bnxher4KTeyCPxGmBjUD+GXVuQwMQLQfS19VRuQASA8tMOr/o5HC
         QYyVMKTiuzX2SwCzYqpdxDBV6CzK0j4NaGNTL+U7Viu8rXGm0dXtARDGDAvCbn4T1VSA
         3yJRY38SjK+ySq5NvEXnzVzk8HK8+AiXfmmQcwrjL1VdaogvHBue400PXME8nRMz76H3
         ZoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
        fh=YlTPLOSJHKGkK9EZSDLJFbIFp9AE/f/4rV0DHNYJOKw=;
        b=SqY3FBAIuBBFR8ZPlFuX8SumgYvDQWtU4ndEL+brYyaORXhPIzzjkixN5mFMiZxslz
         6+YFuQ0XcsgISDeLzuF7J0fqQ7r5SUwWy/K7jvZFPJOMLzth1aDqvGdKGKiF5pS3XSjR
         CRuD9X253HVNTi0Q7lc7DkLeb+XVrXyoLF0YmkCSXNF341KLkWX8jnvk+vKec6rsjiSc
         +PKC/79dFbqd7q36SR2epanWs/GvY8y/ol8tia35bujDD9ez2FKhytGfz4MgbFehxZLz
         iSfdvqky5sQ/Y6b40KlrESMABxaO+DDndSssIIChTQhduiNhYpe3tTZye5DDlZV6pR2w
         H12g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717273; x=1794322073; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
        b=BtMbeGm6tIUbqFT6cM/WPPyzuSjd2ye2aVNcoIiAlcd0+t5SszE/wTCuZwYAVgUfeG
         kBWHQnV7VEZXylLMGUzF2lTWTIntSFUGOIww5vQgAc1+hTwQIaaTNcOG3qCs16yGvXnc
         CP7ZMX4mrYPHNzjd/cwq0g5hgLbCSbd4JHpSOF1T4n9Au47+yxyTRs2fRSGgqL95zEP9
         aGASZZJ8J/xwPZbXDgZAf38C4rQ+cTs+naVmLnLBpJPzvKGYGXDtrg8uKuZOx65gSVId
         AtRQD+6kRSHoe6VaUsKRPPIFsqjkoZ9snS1sDrNTlq80RPScq7ugBNESnuidEkvM6obu
         eP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717273; x=1794322073;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
        b=CvP1e0aIN3ZlpuDKHHwsRMhyZLgv6iwjYf80KJ0ZiR9lB2pl8GZEiqbewkrcwWRhvA
         UlL9wLBVRQvSsC83pAM/AJqDqcIeflfjw4vATkNs1y0XhzGq7tTaP20eVlx1MWG3KVa7
         iDQUtxZEjFSaegNXlTQ04heAyYMZz2A9a4T8piVF+91IHjMmdfqXxCP3KnMxF6rK9vE1
         8IP9vPJy/EIl0K1DbTbAxZHdwM2MbY1Vk0dbaQKSLAHD2ApJLFlzSy6YrU2CRx+7anWt
         rqlVsWBijjNcDb08fqDMy9KUyF7hDFmrwaAN0umZ1s7W+uoIjm9YRgmhDEiPs1J+ZwZj
         ylRA==
X-Forwarded-Encrypted: i=1; AKwUvBzfrA/6cUsbNJQ7anQAvOhOhg3fM2YO/sj5HDMVP/jijxOp+hZyn/BdIg/jgKBatdjMVxBZL5K8aKnKFoCHS6Iw@lists.infradead.org
X-Gm-Message-State: APuU4Z/zjv0siVeauYjIOXFLfGhDEYIDt7fgpHzKAuqnDf8SAljVeh92
	0OhSJ5dwGSvDWwdIHjSCTWQR8tgztSNatbfxvXSoN5V5FcoEmEmj5ZS/s0Sn62p5jG0WO6Eq8/T
	PTFJRBlhXLa3KJaPvyIGOMV3SZV6p/A==
X-Gm-Gg: AYBFou0HgVbxvLzp6Yb8fpbB0qBRKzGm58kqig9G3ErkBONRx+LaFk9ZIPez/Db31Wv
	zIMtlDRSbKqmfZFv7wrK/SzXAUU+t63qsv6PmjPbXkoVD1MNvURWytWeQfXRPH/h6vTo4KE1EMR
	Od0qoMEHxMYtczCzmdVPEyA3eIYwJXbt4S5XuGLci6N8+nkQhN0MT+SClC8asS2f0kiLJzngnpH
	L9OsjzGeCDI9lrwo6t7L4pWFMPcVFcXifXLSSDJRl0JgMvljVx+Skt/cnDEdlgP07OqT/azrgFI
	UuWeTMr5xe8bDRi2+ryOko/Uo1le0w16vbiQObTACPyqTS6q+JnT2v3cvlyhmYmB7Acib8i9JFG
	YZwstULVIu3UOeCaAS57Zzr9tqImKCNdnh7nIkzL1e/SVKmGk4ttuQL0Wa/akDvZZ2i/HNJb6HI
	UxvRVvrXX0HG75wc0=
X-Received: by 2002:a05:690e:4088:b0:67b:e1cc:ca6c with SMTP id
 956f58d0204a3-67be1cccb74mr681732d50.47.1793717272964; Tue, 03 Nov 2026
 06:47:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
 <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com> <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
In-Reply-To: <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Tue, 3 Nov 2026 08:47:40 -0600
X-Gm-Features: AclHuK_bAiiHjTrLk6BAhfSIpWQ6uON5mPRZGYY15ZS0axcuvmvGLmO8IscHRKY
Message-ID: <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_064754_289436_B0FB0D0F 
X-CRM114-Status: GOOD (  12.33  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 7:07 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> Does the downstream BSP have this? It would be nice if we could port
> it over. Then you can properly use the power allocator and/or the
> schedutil governor.

Yes. The BSP (sun50iw10p1.dtsi) has dynamic-power-coefficient = <190>
on cpu0, and sustainable-power = <1200> on the CPU thermal zone.

The energy model uses the OPP voltages, and Andre points out that the
current OPPs are A100-only and don't fit the A133. So I'd like to fix
the OPPs first, and then add the coefficient as a follow-up, tested with
the power allocator on the K5C. Is that okay with you?

Thanks,
Rajan

