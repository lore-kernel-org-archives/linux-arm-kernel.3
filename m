Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8901606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i3f0bUb5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fnwfKndn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQ/Tuyn0JH1gUFDpwUT2+qvwHnCZOxuYKusSWI+7qzw=; b=i3f0bUb59eNim44z+aevpF2Cpo
	d/BI33K0GMuuGGoGwmvT0pAzL8YS4Ls9jRSwTCsXsKJ06wolJBMazIYcGtsUz3OW9WLS3SaLyOsdH
	yoZSjFhMHvj7WQfF31rua5Lcp1vSTmXBzIb5st+lqf0U873mhw8XdUUPFD8F3GxSFMf/zHoYufkXg
	xvIP4aelY9nw8wJGFeK19DPymuHaY8UGGZCljrLjAdylg+sLsCXCERot1H/FbiVgbmUw0BTLEcSpg
	aH8Sqo2EI0mJZeCWk7Dp9EoBvn4eScfuqsO/KvmHIFkW7XThRTtg3h9dr4PCFWSZ1VFr/uC2r8Kv+
	K+gH3gsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyxM-00000008eTk-3CAH;
	Tue, 20 Oct 2026 01:48:00 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyxK-00000008eT4-1b02
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 01:47:59 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so6210093eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 18:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460877; x=1793065677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IQ/Tuyn0JH1gUFDpwUT2+qvwHnCZOxuYKusSWI+7qzw=;
        b=fnwfKndn+/G3gwvE9Ifqnn7DupT1UV1pK5cq/auHtxX4QNYcUV01jKVXNMf48lA7ez
         L+C/0ecN/E+9oTcgnU22IGfEpGso4SnwpnIIC+hMlgSHruckpeWQKopYwLEXYrCCTbKM
         6p/eQs6ofOPfFppMFxb5NORasZIcCdbujNAPFoS8yHZSLd9pm/6KQkuE58a3RU9i28Ik
         4srTSSx0U6Yz5BNjHVZfdiYcukVMaUS+Tt1L9LdmD8XEQnORlQyY8izxFWHYISNnhzKT
         fCxycfAw++wPjWXy6BbJzdmn/+kNJKcrljQTC3n/P9yZVeRWNhRQJFU4yOCg2n51HX3t
         zXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460877; x=1793065677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQ/Tuyn0JH1gUFDpwUT2+qvwHnCZOxuYKusSWI+7qzw=;
        b=NdTS1yFJZkcxwG/XDpoKXPEtSU4rXOHKMDCLl9PNWcpeGQ7kqGhyj3ADX9IRQexPVn
         F7Paqi23wKTpz7CrKUEBHEoZzQ9+0Vthj7b3FCCNwg3L4ilZjdMJVTrQN8eUveef1qdM
         q5H3GXh4//FCVn8zXHF7xiztw+MNqM7EAd5Q9SRY7etwAxWrwuksQUuh+2CLHlNJrVlT
         gUzVeHUm5VlNQnvKKk4adQQ5L0Z8hpDLrswhHTvJ9aeCSZ0aFccRpb93CpFnlEdiV1PR
         IyLF0shDTSDSB/edKKs0d1IWNrA2Z9Z54fEy64IRUoXWAx8asvD4JndrfBmLtmKE7ij8
         uzaw==
X-Forwarded-Encrypted: i=1; AKwUvBwYVYUbHT+YpJLLYvQ12b9jY9reisHFaqmYGIhtbpFi/+bI8Bt3s8KCfn/hv8gbLGpeOtgNW5CSKHUoqc86LUb/@lists.infradead.org
X-Gm-Message-State: AFq9FYLCHmwwSr+UKhLOJggyp46tdFaUwGCzxAWp1yVG82umCxQgY7ES
	dE4bLkh0anW1ueFZr8ycJ7BZk7nMMA1v9lfWicYZkbJe47/YOW6vtSBL
X-Gm-Gg: AYBFou0b0dVvuYbHtH8dPdT4boVwjsQZXnbx8rTREAOaBLrm3gcTkcqNv+r51grEkUA
	P1PA+F0QvJOVSRfTGdOkIqr1roSzUmPSxgq122TUp/wAz0nd9fIka4+aLIps1HbcUBwlQmDMsa8
	srnvhHr4SMFq2yf/uaeNI88G6+Xq3frzfX5AjXIG7AiW/T4goB5DzDZSfGNz8HQ+5ZLbriTMGbn
	VJA8QqMCf5WU4N8ZhH83XGbEFCVh53Vthy7DO9I7zNw01xbGH9Iv4R82G4jgghdPqMKooxqYGNC
	4+Wo9BE0nGXpSa8CpnvsEh+rAjXu27J80Km+kDz+CYs/qjpx1C541ry0u4gaQqq8MrG9qwv2cdU
	iIRztBJHXK9by0zqe/C36Rv9WT/WjcsljhBPreA2bbKP2DI8R9ypKh7zwp9WOB0twEUyTqmBdM8
	MnFvUJTOjXbZxImtBfJxq5Ivmj5zIwD4q8Ia6Lggc4znoM1ReTVqPxNqNYAxK7ZfRwlfMFYg/fZ
	n+1oVFXLEtEmYRa32UVFbs=
X-Received: by 2002:a05:693c:83dc:10b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-362fa872acemr10206165eec.0.1792460877332;
        Mon, 19 Oct 2026 18:47:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm37173189eec.5.2026.10.19.18.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:47:56 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:47:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: reset: mediatek: add MT7629 TOPRGU
 reset indices
Message-ID: <6ffb487c-dd6c-4a6b-860b-f4e02d381cbb@roeck-us.net>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_184758_420706_9393E442 
X-CRM114-Status: UNSURE (   9.36  )
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Sep 26, 2026 at 07:13:59PM +0800, Chuanhong Guo wrote:
> Define all seven reset IDs documented in the MT7629 TOPRGU SWSYSRST
> register: INFRA, ETHDMA, DDRPHY, INFRA_AO, CONN, APMIXED and CONN_MCU.
> Use their register bit positions as reset IDs.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

