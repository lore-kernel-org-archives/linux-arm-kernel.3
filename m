Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JlHgeGuG;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RiSFbNpm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=; b=JlHgeGuGAznYw3
	6oAysYsW9JAe+N1nDFBLY0TXtNLsefc6lcuqDlkSSDL7JLuGBr1CGVtTuYkhFY+VabQ2Sfhej/WwL
	Q8ZlJl2xay9HMq80C984kXT1HGdrIaUYznGi8+j/swG1adIvpaLf+1eDKzjkpAf8QPj3nJLu8vu0I
	2bSSv1o7f0lxo3VZ4MJ5JE7ik/DT/nkOydzz1RIPMeLDmvh2NEk+j9iE2hnnL4o7QztM5+7S8Gu6Y
	WvpQiItxWyJKMudSi5G4Pz1REqdE2oq5M+QjIcJHGnqdMmfFZTyTlqlMgNUJguL7TOyOfNp35ystW
	28SXG46g/E3YsAxHph+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLubW-00000006Elm-0fWD;
	Wed, 28 Oct 2026 03:45:34 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLubR-00000006EkY-3UJa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:45:32 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8ac8a2ac52bso6492237b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793159128; cv=none;
        d=google.com; s=arc-20260327;
        b=PEJcvtsNKvFWL2Na2kgcS8/Ks5FvdncETn3wgta4Qwd8TeiNCMxxP7M3GfDrORdCu5
         osxbYy/MtgS4JuHV1aTigcEvsnL8tLSSRYF0MKpL7xQI44tHiYxC3aOONPtMV2Uaz9hz
         Y+9p0HD8cyXFP2m7ksazcmCDAcltgaxs20xckyN7r83dACpnV42fXgLDHrON8GhjPKCW
         gbDpmbU+k6iWMBFwHaEXmcSJrW+IqkrnzB6TZ7l3h5IpFWhKtSuX1eEaVids/AEnbKj+
         pSY9kzVvqSqxgrts4cGN68ZLyOZjKQ8gCq/UyXfEi++VTSZVqqOkIuJ0/M6+SN+SegvE
         8gdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
        fh=RStb64KmVDyBLY5GmLwj/6rowpxA2Fspm1kgn6U/io0=;
        b=TiSHieL8QD4RfBgJemc/3mbVx4st8MlJd43UB/mF875xoSy4gl73Juc8+5bih9s7At
         SIBcmTH/hzijBFDhg7VwztrTtt7ijmL8pOYF9xxR9MF/u4TAdMDxtveSXDPf4EUxx6XA
         YoToRlgclXq52qFFIhsHI+iy+FLIFdIraCRuDdazUUPvdoUU1GDxLlJCKrprslf4hptJ
         XjjaXNj3ZsSivvTbbhyAvUN9ldQr4p32JbJenrGndoJVo8mMm2cD1xcZ3zA7FjbKXTBo
         vqinOfYBc3VzwY2u/UYtyanDaHdXP/FfNEaSjwl+NY0lq9X7VY7qSSTEpCefW9XOZnNZ
         5UVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793159128; x=1793763928; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
        b=RiSFbNpmWnZao5LNGp8HGVXXrtwqMQXAZewxsStXZFUtso27kbei+nuw46HZLOgQIN
         +8E8v/ZYcugzW04y5qfCBXfLaZPGg4iiznZymV7nP7kcG4MF+mXoq6+SIMdbWyuSxJ0I
         pcGKSPN8ZVx0NDhFXaL1RBaCAyqTRtJckbaoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159128; x=1793763928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
        b=Q4WZlPUBiygWCCL3cTayO1zhINe6OeXh8P5ghqTjHBOFYd8KCg6bxdU6Fw3Z3REth8
         1Vh2sLJUKsp6aOgnRO6J2eV+lPR9dX6bAc4zWZrbt27WGCCk+cgtBTKaAt6sIID4nYbO
         /RiRhTY3h+0cI8QsD0FRfL07edRLEqzMuP61iK/00Hf4UZ4g+mfuB3ekR6NIru50DfIK
         HX+nrSRgtpJQFl/UnE9KMdCE7qtxE3606KvuSfYqb3MXxOYYwAWwpoEXJF3avYysq7pj
         CdIcOSMVCL1j2um4ZSCMy7CTF0jrIMC5UW3QQf4CtCxkq7LyConQ9MCc1gsfO+G9A0AU
         kf7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzE+IZpvtssHL1ohk50Ad4Kj52Up3o6yutrNlBYbrcRaXiEqjUTL8YuiPVP0MelTQI7UXggGZLH80jWzQMEfAj9@lists.infradead.org
X-Gm-Message-State: AFq9FYIhClS6Rk7ySQ9U9F6pDSyt5TE2rDumaglEHoM8kOfrOYzIWnq5
	ux2ZYnkc54pNEXNOUU5psey0oudukfkOC7yeuFwlpBPCg4a4wh6ASqv46YYd61DnKyeTz9Tw2rO
	ldgNuzmyipyonyHBaMF3jZherEQ5XzBjHSUyUdHPp
X-Gm-Gg: AYBFou2Y5pZNRJJnk5W51IBxxt3ZIZP+oBoFanN+Ym7QCdcLRbyqcXR4vAqOQH5tejH
	gthTG+YH8HExNW+f63IWM6f3AfucMSmywfQCmxlft5YiwA3ElEJ4wBxPJ861JArOeDp5Gabue42
	yMy0MixvEpa4lhYxzil8wjdHZdCU18bHIsK9daud2V1Jxmp2sId/iVZDaHPZeoCdx3U40NIZ4km
	ztAccgd7YJrDA1utB7Dax+0SW9YFpWCfWK9dFCVatz0OOBQVb5p/lCBbsPiTfC+pHi8hdhpah8p
	39moTdJjX43NRuqE/kJBr0jKnbT7fwyizPZLNJugajwM/OowOFtUkITUey3Vv/MVeQqe3nqXlJj
	tHWNft3A1GToNT0ZUo2/k+YngZlN7SQSASqmtPjBh/OGYokeDpt9KM0fxO4vz+9DyDeY=
X-Received: by 2002:a05:690c:d86:b0:8b0:a5d3:71c1 with SMTP id
 00721157ae682-8b19caaac51mr35421007b3.37.1793159128558; Tue, 27 Oct 2026
 20:45:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027093306.2812695-1-lee@kernel.org> <20261027093306.2812695-25-lee@kernel.org>
In-Reply-To: <20261027093306.2812695-25-lee@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 28 Oct 2026 11:45:17 +0800
X-Gm-Features: AclHuK_qoKOPS0Bqly0_GwH5QpE5HmWgWi0Q-7IU47_qa8u_hGoz7lpTqegB0HI
Message-ID: <CAGXv+5FWZQ1zM=mZm22qcqU86QO2oXQs0wtnGn1H9TrdFvfW1A@mail.gmail.com>
Subject: Re: [PATCH v2 24/27] mfd: mt6397: Manage IRQ domain lifecycle with devres
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_204529_909693_DB657F4F 
X-CRM114-Status: GOOD (  13.69  )
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 6:38=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> mt6397_irq_init() and mt6358_irq_init() create chip->irq_domain with
> irq_domain_create_linear() before registering the parent interrupt via
> devm_request_threaded_irq().  If devm_mfd_add_devices() fails in
> mt6397_probe(), irq_domain_remove() is called before devres frees the
> threaded IRQ and without disposing child IRQ mappings, allowing an
> in-flight interrupt handler or late IRQ lookup to dereference the
> removed domain.  Conversely, when the driver is unbound, the IRQ
> mappings and domain are never removed at all.
>
> Register a devres action immediately after irq_domain_create_linear() to
> dispose all mapped hardware interrupts and remove chip->irq_domain so
> that the domain is torn down after child MFD devices and the managed IRQ
> handler have been released on both probe failure and unbind.
>
> Fixes: 6df8dd5c185b ("mfd: Add support for the MediaTek MT6397 PMIC")
> Closes: https://sashiko.dev/#/bug/linux-b296fbe4-6e83-40c0-91c7-2c31e8d22=
6d0
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

