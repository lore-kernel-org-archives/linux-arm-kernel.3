Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CDF606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 04:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=39IHCxkm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NsbG+n2v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O6Cwq/TYI20Xap5XXma+Ak7imjQ/5PuMjwKwFGT+f70=; b=39IHCxkmWQ7yJ/
	/oEi/uTDRFfI2ru2rkBy/NOad5g8TtSANEXhOBU6o9hJZ+HVVCCPjX6eGP0KjZ7qhaJZ9yagu0Njh
	8D//AAI/XSD/RdPNaOZrJJLSu79tP0KZK44Ce9aBVVB0id8L/hF9UWn9QVyEDkJfLGqPE0W03CUcY
	BAi+Gzcg3UhPfyQA3dcuFKe3z1gad6So49HOAeVVOIjfipHq/trO/uURk12tTkktFRkY17dKP2tzn
	zV9AMezYrxMv/SAoOW7MMuFC6d4/iRno0MdrXk1MN0UQzUh++5p8lfxNh3LxnNiHJ46zVCr29mixz
	fPrjiPA6zoiIK/3q1NAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjtv-0000000FWrX-3079;
	Mon, 02 Nov 2026 04:44:07 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjtt-0000000FWr3-36NN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 04:44:07 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-8b0a28a720aso23208807b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 20:44:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793594644; cv=none;
        d=google.com; s=arc-20260327;
        b=kNDOkCV3pUK6qcYIxja7vZbebaSggbKZuMFIkyevlUlJOTQneTbhUTKuLr02hdEEcM
         mjKAyb2+PEYmQExnHsIc1GbvuOoh8uCz7IyR4HYQ7rb9NPO6LQF5NkMkfS0qVKInJ1Do
         s2uKMAVSL51eiCMGR/oLFxoirQ4AhTtuHGrGeokrMCv1ZzSug+nerXfC08nkGU5DXj0A
         D4Td+RYkpo/cCLyN5PJM4Q6CojP19FZFDKeY4p5gpzg65f95R3clMzfm9KndqJ/1gvj8
         OfwUPpcZURHR0btiFBY6Q76tXA4Vg8VRFtK8N9eJqKOn+PKow3TqWTSNWFI1Fc81zsEF
         mUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O6Cwq/TYI20Xap5XXma+Ak7imjQ/5PuMjwKwFGT+f70=;
        fh=MDGTi1878zUevfFxzK//ar7laC+tJi07QYaY3XooBWY=;
        b=Xyfb+Un46XMCB8+PHjLPQY6Wog5xa7hGY4pn2YOXaT+IEWsnXOxYnTe367sGSY2dH4
         7UPqMD0vJF8T52gjhgZAy6Fm9QJfi30V97Rkg7FSQpWJDCWagvbAVHa5LIAIr+3CnlbZ
         U8rEscbV8GjAMGK7SwepyZ5aE7akBHiYRONRIipnitHZCONuXaD4/xLnoapEXsdLtkkS
         jTmIBcnlmctxY2a9pjTpgUWiC4OJtS+gk9uWwFNDfJBHbh4qQyZE1NPJbTkzD4R+nBYE
         dxlTukxTlldX1FlcIuU3DtIyFoW0ziVpLxT06bj9cjXDjVVvPoV93FfG5+gKeXm8Qbnj
         UvJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793594644; x=1794199444; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O6Cwq/TYI20Xap5XXma+Ak7imjQ/5PuMjwKwFGT+f70=;
        b=NsbG+n2vAMagQXI4cgVHjnOp9eTUsq1qj/jt7cbDEwi17D3Ab7RNaEwR2DmLRRMg95
         78xAbG8R6bx4A0d1tdQHxqUDx/P8tTRsuDEJ6vtp4h6+liY0ci2XegQ0Fo4AV/KGDqh3
         XNRs+mOTcdc3zQI2IiiOqwn1DY6WWbaIhEG3dcTYMZhE4lZ4WOOklxDvft5lzgtDB1/j
         yPm3+uMgVtH0N0luFR24bK8K8rsKhdMpVP+rrOdpTPdVBK2PyNhmWg1SVrVQyMIsSqeR
         XAGygM0bRaooNTmlilsZRbTrjRF4fWJNDCBZvvdmA300nRz+/m3Pa3eXHW/h27LhgugS
         a8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594644; x=1794199444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6Cwq/TYI20Xap5XXma+Ak7imjQ/5PuMjwKwFGT+f70=;
        b=CH0xaorgNrGZ/vhl3DG5RdEUOn8IVmdvSlQ5nOXuklcHX9tz9XMvsHGzFWI9/UFEgM
         ERsyEQT6DbHSsI9YDBeauFcL78bIlHYkGue9CE/7p6WCzbtRwWsxW2LtslBKSxpGmUj2
         m1ll91Zr3gH/AtwC7/5bm83gAdCchkZh4jLb7Sx7qXBHNtKRzFhZRbDbyV5rarZQARoo
         NsFG2nE8NQiLr/yHSTjSbvOTBxbqKSxgmESpjHROVDF1BZh/UGZ1kMYv4rN9/JXLunVZ
         xENjuNbdQH7a5e7IDSEwH7yzu3Twqempvg546iigV0Pc+LHzV3k4KQYb+fcaRfVxQNwx
         fZ4A==
X-Forwarded-Encrypted: i=1; AKwUvBxliVpp5XLablOZMnqO6X+a8w64ehiSejDBzwggdNyItsw8KHeG3HEzcTStxlp1myB3la/FiLelrpwrHKw8DAMw@lists.infradead.org
X-Gm-Message-State: APuU4Z+0v++sei0/Pr/tGFD4Pol5e4ApulN9HNbS2xKtcAx7Y397+Wie
	eVK+DM7psdY/yM2Psrgr2y7Oi7Hodv5doJFzZOWjjq0Lh5q8G+pWvHC/7qRSLce4OTLrCK7sHjE
	u3aToPTkVLCEUb7YmBHMKaQ608EKo3eI=
X-Gm-Gg: AYBFou0N3KpvRnAHN/RiUu+xgaZ0s/nYkbdg2oU3B/Lh820sZrNMBthVTdUlyHunE2m
	XHr1FRtwFp9MgQHPtJd8DpW0W/rLgV2pn9iq6EUfjxwRMUdzHbHxKA8nGJY7wq4PnxR2f9+9OHd
	IiaT8HUD1/XI+42DhhPQSgwcn0xQv8K9fkpUbONUqpzS5yrjLRznS/6ay7thXfOBElI4wAPza1D
	YLEpS+a6bBPCq9GX+N0AGe2SeM9vZqSLgAqfrGk3+w8qQoOiTrlef6KkRGMv546kRYdFpO+J1Ql
	XLyByMM2KpoNG1ZZ/XzrVESs/RwLj5cJI2wUIAUU+gleUflevnoGJigPXv4u6sxB47MEvUM5Rb+
	/HtmqYymfr4ibpivcoSPkSAfkI+cnyhfa6gEu9lu986Pl3FxHcGPMt0J1t/ID
X-Received: by 2002:a53:e1a1:0:b0:679:9e0b:dc4a with SMTP id
 956f58d0204a3-67ba502f05fmr4965690d50.49.1793594644085; Sun, 01 Nov 2026
 20:44:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
 <20261031-tty-dont-use-autosuspend-removal-v1-3-7bdadcadc4dd@kernel.org>
In-Reply-To: <20261031-tty-dont-use-autosuspend-removal-v1-3-7bdadcadc4dd@kernel.org>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 2 Nov 2026 10:13:53 +0530
X-Gm-Features: AclHuK9vZb9AMAN_Qfd5MGPYCq7hcmIITeMPXc1WAqkUrzre3J9_8OXCQvnjwD4
Message-ID: <CAKfKVtGHZ5-yQacfzqs_cK7LTb6C6GXCHNrJBk_7ecyNtJkqaQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] serial: xilinx_uartps: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: Joshua Crofts <crofts@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_204405_787256_1ECBF9DF 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 10:40=E2=80=AFPM Joshua Crofts <crofts@kernel.org> =
wrote:
>
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosus=
pend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

