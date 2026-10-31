Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB040606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zkr2p0fN;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ILLwOeKj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cXCPp3YOjVOMEYnPkFXhZpoDSfPXdwR+BZnSniJGgXU=; b=Zkr2p0fNKPMw2z
	h7CPNmWewf77UTWMsQpd3LqaQ/tbC1p3QvFp8Twyq5ls2nSuGwyJCGfIneWYUvD4Z2HhRi8qvEwMA
	eX5Tat3HC44JQrAwg5G719ijoNaHYAIcelygezTr7QH7bFZx3AIJ9/RyRHlRQGFelosmnNmFOlnPY
	p1tWhx5yX79UKYv2omfKbB0FxpEkIFPOLK45bZ8UBctiLicOOBGjE/VpRcD63mxKt1Y9brxlO6pJ2
	tYXm+vm8Ujj+NAeU28X2v7f10P1SENURaY+lRsD0190bPnI3p3pRdhdhSFffKQgaSYUbCru0WmJL4
	fmxxnBJlv8oRcPkgE65Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNGSO-0000000DhJy-0SkF;
	Sat, 31 Oct 2026 21:17:44 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNGSL-0000000DhJE-18pY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 21:17:42 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-67989a98f8bso1135282d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 14:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793481459; cv=none;
        d=google.com; s=arc-20260327;
        b=T19fyLzdK808rte5pWv2Bif6Tmhogeo8XRrJTVf3KaGCFXV1jR5omQQhWKWUks5LE/
         +aGuM1DW2+wV5RoCvvVJx67vv9Wv8Ff50uLQJmKt8Sit6TkFbNryIXvaEY0YdjL9MARv
         sOFUfh8m3p/tzJbiPEOYI+DkSMoSsmra8ZIRKRSv+cLE4T2u+stquTr76zEJRaqXuBoA
         KfzO2oLNScNdhaQ2G1RwoOVWGLOJaedofqcG6Y9SeBAg3SM1D0J0sxrjKKPZj7oNhwTF
         5CntQ5m+EtJ+cyMh4DWweTSrBJAtQcTrIDJlbgu636bY2YJylNmhTAS7mEwq341gNIq/
         jDzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cXCPp3YOjVOMEYnPkFXhZpoDSfPXdwR+BZnSniJGgXU=;
        fh=6p/AjY0irpXDx7FR5MaqQwTvbLqGmhSz8B1qwMmQdfM=;
        b=JaFbo7YQFQ0+mRi7FWbdNP233FN4NdSg7MBnETPYdtLjLgb359n9j54e9t3h+69Sux
         QmW33j3VTaAKT6jv39tkBpyS9PmamJFUblzAr3AaP7/PdEqZxpvHjvulHPeNjFg3Aqh5
         kX0o96E9+aqSdanZ2BYtlLUzzPpETglDylpCwmUPG0uGdzhG/i+ylGe5+piUTgDCtXDR
         IVdYz+mc73rD2o4JGPUOWcRBQkOizcZ6H3ARuqqOyBOCcPuVS9zqe/gXnruLJy12bDrk
         cxXw45SO0Rt3MSv6tYGWw8w+iNGy4IGqtvK0Yt0JOam3H2P0p4kodNUEgI/Zx0ek0R9m
         /tAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793481459; x=1794086259; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cXCPp3YOjVOMEYnPkFXhZpoDSfPXdwR+BZnSniJGgXU=;
        b=ILLwOeKjGD8S7RYuz1e8VL8A3PUL9hwYzbgfrqIAcQfFghs9zS14vZQzV5ZsOihErt
         22tWtGZm8rY/soMAwMBP3vWklekBTdDrS7MSEjJT6PCe6uAXGW3GkoRr/eHQra07uHEQ
         pGKKuKDNokQNwxoKsSTAjTTpj1EhIuv5VzzwKNdwcy3PB0nHOmmiehqEga/kAeywcFgd
         iACCQfukoGyWCL6HQ9D5nyNdZZTaceMk33vwB8teEZEKPtU/j2xVT33kcSfaH41YUmT/
         5J7bhwWlpKVVHjarl9KV+WccqgrivBTQKMGpKDJdHv8vsyX2LZ3egBC/nERRRFt2Lm71
         C9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793481459; x=1794086259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXCPp3YOjVOMEYnPkFXhZpoDSfPXdwR+BZnSniJGgXU=;
        b=SjnEVjAAMN9ixPc9/5UdAr7++AHmQSy1NYWjkmidBXzMnF2o5L1wGMu4rz6+K/JH7S
         fOQ0kOW4dh4qyQEZDYaSPjiuYA0DtG2+t2ZhTC4ia6e9pmgkGTYhVzjEbFTi79Rkosip
         R0V2aFl+ou6R7gzPwLzgGK7gOS3hlPmfkx7QwCHuxGuV/beo2fGyqfkxqpUvMVblxZSl
         XE0AEOfuF+SkqlxFU0GGqWMdI/5i1r2gT4JmwBUk8KSXkcLCy/grJkajiGws55QL+P0B
         JW/+j5Zx6o7rFZw3nIKILcA0OsrXH3mv7PVKZnTaWLS5w2913qscoLF+iWUi0l0AaWM/
         Y2Aw==
X-Forwarded-Encrypted: i=1; AKwUvBznthfYpwEvBE44MrqpLAXmtPUeFLlEAyH5Je69ex0nrcLwTXP/0tgzSTVztiCjJWS0VrvMcv4KHFL8Myri13b7@lists.infradead.org
X-Gm-Message-State: APuU4Z/QT4nnUCObTWrRzYrjMDtvxhnnTx4pF575vgJeJkZHHb6biuSo
	4KuZSG6THrt2R4Rr1PBCmp2Y8i4HEfzd+0eXU7744lTsEx/1uTMw8Ne+GyU6NYuOcnqt1q0yvni
	4xWVARv+lq2AQRtkH+xpHAQ+QufOg1O8=
X-Gm-Gg: AYBFou2yY6X0aS88/A994AVtVgjQWfn0PwpQOhMAnQ1LPfjZEEqwDh3zM79SQSAna+J
	rTTFkwhRaKA1UbD6eCeXCjtjNZh4VWK8ZWlnHTD0I2m3EiWS5lWZEdkzBAwiGZgy4SzM8LKcxxC
	325kgQNb5gwb44BWXb4Lvm4gC2etbIZ1SAV7MPl2KpzYSUO5/V8Fdo5AFvgxTdJipMmQjJjU2Ho
	VKgQXk05sdmGD4mRAjUlhxQCgolyKTn5V4E044agTz+LnBQ2sARzhH68NfxS+AUbhRC2lIoNVbb
	DCn7Q0wRt2xQXZsKnKMNNvJrc8lF6wwTSkQM850RbuIcJwRNcrmRwOkjnnnRnZFMDEzTG8h9uED
	9LXZfBifjLI21Msc1hPT5teA6f0CXz/rIi9AvxevbIblw6ObbYlo8wwFlZsVBAMuQeRtKdfZRFm
	BtKRy7DdPcsaI1BD0=
X-Received: by 2002:a05:690e:dcb:b0:679:ad95:8ef8 with SMTP id
 956f58d0204a3-67ba4f44351mr3951527d50.62.1793481458984; Sat, 31 Oct 2026
 14:17:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
In-Reply-To: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 31 Oct 2026 22:17:28 +0100
X-Gm-Features: AclHuK9aT_AtsyMcO-RHgeZfhZoWmnaHOU2QYfBUHDRz-4_ywAKOHyMlNGOtG-I
Message-ID: <CAFBinCBo0C=KABcg5ueDTRSJhF9vmWnPwYHbaMGTOYppOsabwA@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
To: ZHENPENG YUAN <yuanzhenpeng210@gmail.com>
Cc: linux-mmc@vger.kernel.org, ulfh@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_141741_354355_AA10BCEE 
X-CRM114-Status: GOOD (  16.45  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Thank you for this patch!

On Sat, Oct 31, 2026 at 9:09=E2=80=AFPM ZHENPENG YUAN <yuanzhenpeng210@gmai=
l.com> wrote:
>
> The Meson MX SDHC controller uses a single DMA address for each
> transfer. Since the driver leaves max_segs at the MMC core default
> of 1, large I/O requests are split into single-segment requests,
> typically 4 KiB each.
>
> On an Amlogic S805, this limits eMMC sequential read throughput
> to approximately 15 MiB/s despite using HS200 timing.
>
> Add a 128 KiB DMA bounce buffer for multi-segment requests and
FWIW, while reviewing your patch I found that Amlogic actually uses a
512KiB bounce buffer in their downstream driver: [0]

> advertise up to 64 scatterlist segments. Single-segment requests
> continue to use direct DMA. If buffer allocation fails, fall back
> to the original single-segment limit.
>
> Testing on a Xunlei OneCloud (Meson8b, Samsung 8GME4R eMMC)
> running Linux 7.3.1:
>
>   Block size       Before       After
>   4 KiB            14.47        14.69 MiB/s
>   64 KiB           15.06        63.21 MiB/s
>   128 KiB          15.08        75.13 MiB/s
>   1 MiB            15.07        75.93 MiB/s
>
> For a 128 MiB sequential read, block requests decreased from
> 32768 to 1024.
That's a nice performance improvement!

> Direct I/O SHA256 readback verification and fio CRC32C write
> verification passed. No MMC errors were observed.
>
> Assisted-by: LLM
> Signed-off-by: ZHENPENG YUAN <yuanzhenpeng210@gmail.com>
Could you please compare your patch to simply setting mmc->caps2 |=3D
MMC_CAP2_MERGE_CAPABLE; ?
From what I understand this will allow physically contiguous SG
entries to be merged by mmc core.

Ulf: the code here looks similar to the sdhci.c implementation. I'm
wondering if there were any plans to somehow move this to MMC core.


Best regards,
Martin


[0] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da=
69fc61a7cb04b6/arch/arm/mach-meson8/include/mach/sd.h#L627

