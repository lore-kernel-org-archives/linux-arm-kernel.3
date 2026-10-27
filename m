Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC63B606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 03:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sWVmIvGC;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kqkQBlrB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=63XdMIgmDxPufVfDbiuncQKIwymV4Xhq1c62N9eTtiU=; b=sWVmIvGC+ppk+W
	oGQgcNC3iRUjRJDKqlfw3/+KcqHH6lJPFpG5QDtUg2gmzn5gvOhU1U0ETF6QbBbd9cBMdJGWYTgTP
	M5FrLr2DoVKdpmfmDohfEBAK8aiwcgKY0bux7YMgfyOq7DYT+77/8tLgh/EOCaHDe+zRD1Znp+SUt
	/L6zNWx2VZoXPhNcbxI5iWR91X2fLuP6YxuAnv+XJHtmsXO0293DSETkOI999sPDgkT8fCP95hus3
	MHbuc/hxywLm7hyoxqNuFcuVBvhZs/QUwDEdIUdcYJ4ujsz+VKQ7CD5s4+utVeDD92kLXOSwATlIQ
	G96PaJuzNXhl+FkSokrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLYFs-00000003ilg-21rf;
	Tue, 27 Oct 2026 03:53:44 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLYFp-00000003ikz-11qV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 03:53:42 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-67990a45e02so3629205d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 20:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793073219; cv=none;
        d=google.com; s=arc-20260327;
        b=qPqD8mKxeaFnZtv54CXgXCKY6ippB+NTh5hH5VjZZt9A6N/mYYLSqyjHd5tRApIyz+
         C5AnQo6A+iAPgBej/6+GRM84AMR1dM+RKBcm30BvcfaVL45crV28a9tlInczxh1J/RAl
         Qp4kHPgLBQeq4mJLn3oNMby5ZgoEbOyM94NjzlWdyrd/JKzlHieoOASPBOaebnC1w/vL
         D1YjzeERWFTO/CTPd31VlYZR2eYeNLh7nshk3c7n3U1vumAwtds2xOWoK56gTiexZcOJ
         8joq6Vh8Ewv4pZKaErXuhn8CymvLZGeO4x74Qy3m1mZfCbZe5oKQDBVKSBjGrGadqFMt
         kMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=63XdMIgmDxPufVfDbiuncQKIwymV4Xhq1c62N9eTtiU=;
        fh=dbzgREl8vHRGFdU+U+m/ACrfW6KgCv+3FXP89jg5DeM=;
        b=BAGKhVK6hdLz2TmF7FYk11gmyicKyLG85XgoY4roQog1RDtmgsGxSU2SywU8b37Zm5
         CnxPItByRccFalsbSFYN85KXy56KJ90lWARkidIRRocYAPSc2gxVC0IqKw8ACiiFZ8iA
         ZoxAaHTuJk+rG2DjtDpHsRCy3PWzlBy6hvbBURAT8v/nCVIE+nRysI/1GzdkntCA4Csd
         ME3zo1tWdnjBevkZMrQ6YkoHPyYZx0Lft1VDuc6z3BrzxAdPnOR9bn+ZEHy2paA+CPJ9
         8p+386zP/F5owMB7G50E7azt95cVk1q1FGhJ6B6fEh4ja/HaW7ELqcdZkzsiwi+ZpKdg
         zzMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793073219; x=1793678019; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63XdMIgmDxPufVfDbiuncQKIwymV4Xhq1c62N9eTtiU=;
        b=kqkQBlrBvt8HK6vGTJ+A6OFv+DC/0MfC4OwbVnqctZ5fMoZ3LHMlizpKD0+s35H2QT
         ElNAaz2IxcMyIsUHqx7l8KxVMT/BJJJ8gIPrzhpx17YcGhsozvc+toNe0szR3qmW3yME
         LZ/VE1+pZFF07RbLy7u7DEuqTHTO3GL0rEt/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793073219; x=1793678019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63XdMIgmDxPufVfDbiuncQKIwymV4Xhq1c62N9eTtiU=;
        b=jXGUcYy3CKKbDbBDUcbyf+Hw2XgeCgV1W5qre+DP2oMwEn3rVpqHjFd7Qn/XeFF+fZ
         qeA1xa92cF8NhJYyqBYNUld1QQjqZmi3cSvFmUH7FJMiOjBzI4XE2EuNhRQdQ/ptEblB
         yY4ZPBvKCpu8A/9lAJuEOh4pNnsyWfomqO9ZeXA5qxZWLbGHAIv/AlFkJ7StA+7fFPX0
         NtZXGKX1jNZm884n2tO1r4STNdd2JZPbN7qsRvQWzZ0UArUokanIIIxw2L/ZhCdZOHEq
         dRgbAf1dsqMrWhzIgvdfgU618RQRC8ljfHL0+7gtxBdvi05w+kF89Rw5z3tovrQXNQQZ
         FdFQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5KxZDDm8MHfk4SU2Y0rTBGComkdqj+b0NCkcYDcvtLxGVOW3C75ZGuC3TYpeZ7RWktFgGvkGi/HVCGNYFnJez@lists.infradead.org
X-Gm-Message-State: AFq9FYLgyV/uQ+DWaO2n0qbmdsDAWCxee1McD7m3zl34zbm06Uk7mfND
	ak51vUp2J+GnYvG9xI5wzGMmefR+F4sxSIbxv+ZnyXy7+u9wDJFPN5hd/dNqtl0PEU9N30tmkjX
	RwmYqhr2H3HUILTuEQlrVmibG5dOm2qhHdOOebNzKdQaDS0zqNa0=
X-Gm-Gg: AYBFou0r03LPnIFMbZ/59Ty712B0CTE7Gppotc+1DdI6IxXAD/GCW0ZwtMd6pM2VNVG
	rj+CdYUPAwQsu8buu+9JxtshnMnle1j4+d+WoEsiurC7XM0sX7XAbUJIty2E0YHdJiAih19RzXL
	NHNhSDCqH8mpJh5bzXesiwfBL0WpEEDOgOobhHwraUtOg/Ol6TK1jlMXQv5HpjYR8JdyeoHTlXv
	R6WI01+tDf7nZ6oobv4CnYIBQ29w6aeQE62m8t7XG2rNX7p3ebidxkm6myCZPKC/mkriA6JWPJX
	Yr+3Bh/xLfO5NHIU5rfFU/thMM9K2VqyFBkUU49BDQ83NVMTR7NHatNdXioaBGfoUAGIcmwBdva
	UPA5+roM21f1Q+/9jJioj55MSf4GPl2VIuL4w3ADAT4YqmTrqXq+NdjMFDdS992MRslY=
X-Received: by 2002:a53:b644:0:b0:677:d023:49b8 with SMTP id
 956f58d0204a3-67a4543f2demr5622996d50.66.1793073219651; Mon, 26 Oct 2026
 20:53:39 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027002419.2099708-1-nbryskin@gmail.com>
In-Reply-To: <20261027002419.2099708-1-nbryskin@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 27 Oct 2026 11:53:28 +0800
X-Gm-Features: AclHuK9fP-f3Hs_1VqqYwtoVLd1mzJ767fSZbB5u4Nm7cGL3-Cn95lyNs_2rirg
Message-ID: <CAGXv+5HiwX0R7a8gJeQMbZOB=AYEDUanD5ry6y0-X=wqO57RKg@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: keep the OTP gates shared with the
 secure world on
To: Nikolay Bryskin <nbryskin@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_205341_341032_BEBA9509 
X-CRM114-Status: GOOD (  20.17  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 8:28=E2=80=AFAM Nikolay Bryskin <nbryskin@gmail.com=
> wrote:
>
> The secure OTP controller (OTPC_S) shares three clock gates in
> CRU_CLKGATE_CON18 with the non-secure one: clk_otpc_arb,
> clk_otpc_auto_rd_g and clk_otp_phy_g. The kernel treats them as ordinary
> gates: clk_otpc_auto_rd_g is disabled as unused at the end of boot, and
> the rockchip-otp nvmem driver enables clk_otpc_arb and clk_otp_phy_g
> around each read and disables them again afterwards.
>
> Firmware in the secure world (OP-TEE reads its hardware unique key and
> the secure boot state from OTPC_S, and programs them) has no way to take
> a reference on these clocks. Once Linux has gated them, every secure OTP
> access times out, and a normal-world nvmem read on another CPU can gate
> them in the middle of a secure access, including a fuse programming
> cycle.
>
> Mark the three gates critical so the normal world never turns them off.
> They are 24 MHz gates for the OTP block only.

If OPTEE needs some resources kept online, maybe the OPTEE DT node should
have a reference to them?

Otherwise everyone is just playing whack-a-mole in each separate driver.
And for folks that don't have OPTEE, it's a potential waste of power.


ChenYu

> Link: https://github.com/OP-TEE/optee_os/pull/8034
> Signed-off-by: Nikolay Bryskin <nbryskin@gmail.com>
> ---
>  drivers/clk/rockchip/clk-rk3588.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk=
-rk3588.c
> index 24baa0ef9bf3..8e0f408fdfad 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -1158,11 +1158,11 @@ static struct rockchip_clk_branch rk3588_early_cl=
k_branches[] __initdata =3D {
>                         RK3588_CLKGATE_CON(18), 9, GFLAGS),
>         GATE(CLK_OTPC_NS, "clk_otpc_ns", "xin24m", 0,
>                         RK3588_CLKGATE_CON(18), 10, GFLAGS),
> -       GATE(CLK_OTPC_ARB, "clk_otpc_arb", "xin24m", 0,
> +       GATE(CLK_OTPC_ARB, "clk_otpc_arb", "xin24m", CLK_IS_CRITICAL,
>                         RK3588_CLKGATE_CON(18), 11, GFLAGS),
> -       GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", 0,
> +       GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", CLK_IS_CRITICAL,
>                         RK3588_CLKGATE_CON(18), 13, GFLAGS),
> -       GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", 0,
> +       GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", CLK_IS_C=
RITICAL,
>                         RK3588_CLKGATE_CON(18), 12, GFLAGS),
>
>         GATE(PCLK_SARADC, "pclk_saradc", "pclk_top_root", 0,
> --
> 2.56.0
>
>

