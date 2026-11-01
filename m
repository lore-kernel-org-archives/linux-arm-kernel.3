Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DF0606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HBtCcNTe;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSzieVkC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7EsnCPk4RiF2PEHjx3fU/KxMK5RivL58Fapzh0X8PUM=; b=HBtCcNTeGIGCqA
	nbI648JhjQbQY/cTl7G/UgQhJOvTOJ5vi4WbylX03vrxbTXdkqL0kn0x/LWOTrW/4rJVNgTVBc/6C
	h6S+tBuqF7I8HK20f0wCFM0reHO2vC9HYwIlIpNVYfT0eZo7uMbkL9Nx+ujDbZ59TAWvkilQqDrol
	C6i/QiZ1dyn4lU5qSSPI0+bw4Rcz+YeRnbvi9Xnn0CygHjXxRHhCRr2LDftPjZ9z9yiayV91aQovb
	biHl590RZRfTfcHwTda11ctYGLaTckgT2y+774sTMhyXIzNsna/Vqyhkvq4QPOhhdur3U526VNnjd
	np8DfXz1gwDZXBK+ydGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNRNN-0000000E2fR-3uSD;
	Sun, 01 Nov 2026 08:57:17 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNRNL-0000000E2ej-0WUF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 08:57:16 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-15ea896ddc8so3560610c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 01:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793523433; cv=none;
        d=google.com; s=arc-20260327;
        b=lqjLcLvpyGTRmYhk5hG3aJNa4jiqbbYwYZx22AgeiB/ndY+4c9BF9FHZ4kUG3fYt50
         nf4ojIPMpuYtS/z8mO9Pdc13wC4Lv8NB9aiXEPy1O5MDPIXmD7NPHRtZaUnci3tOhshd
         9KNMNz7Y0YCvggY7Lf4fusFJFOWvOWIjwDhSMzmeqvFS9G6nIOEgVEjuLlnFs+YKCORI
         Y2nxxt8dpON2m0Yf+vW0NTbGtakN81A70ZDrP6XjcX+pwkMTMYwJ6uS6Xn9dSn/jIdVQ
         i/irNiAf0Pf9FbglHUCmB4rHMA2i8/IxRasM7ewgucOcuKufA1CRFU8SWokE9HRI/VaV
         Uqow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7EsnCPk4RiF2PEHjx3fU/KxMK5RivL58Fapzh0X8PUM=;
        fh=7uqSnrHQ7HR4E7FNGZmOVvpqqa35Z/HkX4ZPzafxZoY=;
        b=IQX/NTr8zII9iwHJLIfyP3bOGSKpDBfZBm3Tl3NRH2+6ulKGKJIiq9XtNR1p1nAl+X
         vVVmgqiVOvssIjL7AG/nGZ15XuvDi8dAfkXiVqfcnf0sGh8EhSVnZUlF879jNBi8yz77
         q3posM66tqIX3xjErNT7nCyg+IhJaU2l3sW0lbKoXzm7cuBEqQBtFFEKUGEVYkDeTaeA
         U0z7eVQ7z5czGDaARBvPFgAVzfSTI5mS3XGm1cf6NmNTgJTfmdKVJfoYV0/ZXbkFHLi7
         8cEJofvsaWgq/PBx8b4l+fUHGh4gPbGu1W9AY6ghPQqR01GsAQ/EZMCi5YK98O0RU5rc
         4gZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793523433; x=1794128233; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7EsnCPk4RiF2PEHjx3fU/KxMK5RivL58Fapzh0X8PUM=;
        b=WSzieVkCaMWJBw5qx8WR7WL0Nj5yuUA4Y4PZWtuOkI8CQO4UkOk1diFwcNgsObWSEN
         DHmf87ez+oW7hSfSDIAigx+8kZvp5g6t5GbfmBvjhFy5YnvPlzlHuNcpERM6GOsBNfaO
         ub90KkEvgPf2+tS5comotJr0jmBj7hICgupT/7tI7UyWzbGpmmZMp374pqD3YJ9Uiily
         o48naeC437zxKHZbxdEAsEQZM6xeUwi4v/1uA2HRsCwV/n57fZVdIz8H3CksZdZ3pwOb
         HRtpgSAn2yUqa6ESLPjb+VjN9j+f/6KCBZlfJL+wXF6Tm5tlvGFIK19maGIOY85KBWe3
         zagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793523433; x=1794128233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EsnCPk4RiF2PEHjx3fU/KxMK5RivL58Fapzh0X8PUM=;
        b=jg+m8yS27ecq5+/z6m1XDU4r4oKkJSahIYmw8Yj09KUDwR6SUZPCQo/goUzVNLF6UN
         W7aS4zgiq2ugaDUmkfXwTYOqBL9zm+3XY+wfLOd3J1IRcD4bYd99LXAa2KHipr8tQaCv
         eQPjNLzUtFMMdLhQuIBpIlXYVHGgIvW0/CfPC/30xkNhIBBRnSRsoJfhUMjoCUOUFTnC
         bP/Zx7hQtzr+81iuE1tsNz4UzF9y74lR8iD5ueE5YsySMx0Ag+T4KMTv0kEBXIh4cyF+
         I1idVVEauiB6LAFFfufqra4Db27BqdLLachXxkmhYkX5yi/uLAduSj7fIxGIFkp+HxiV
         wwlA==
X-Forwarded-Encrypted: i=1; AKwUvBxAOREnFQDL/iP2T6Df4ulMdrLeI2+58PBM7DprpQI/UqEFyIxq8ZsBoC7ecXlhE7OErp/EKRmByCafu2TBwfZY@lists.infradead.org
X-Gm-Message-State: AFq9FYItEPhLjcWLslaUIVibkk+XVafr8+VbMpqcQ6JUxMmSZ+f4v9Nz
	zoGho89JLaDdo83KF/Hwfuk+mAuGZgPgOaDn0+Q0mi+k9g89zCNIHXq9dUVWCTpvlx2d/Hqas9P
	E39NOIM63rRtg7i0DfjRwipVnQLUNsyA=
X-Gm-Gg: AYBFou2Cd8lMOKG3QQDnP24+Va+/VQi+WjmGl4ugOqlpF+lLbWR3IJUNfGel3N7Iw+v
	AnwcQ4PYSkiU0i320QSnG8s/ScAgg3d2PeP1Ewk1hB4wssAeNIvUJAn/NlPSvGaK+8n8VP8x/Lw
	0EVqQXdpgbSd+62D+Jg6YXYlCvuzyonTkaiE9oQ0ay6iM+eIBnn0q0lKNG7mAldBhJm4PVpUA+c
	qqsM90TllbOrFMLzTrta1h59gzVsvSOOaVgtU2w8qVtjGbL5HArtLG7O2E8hxjOLldGOZXqXdn8
	DFLCTXOtw1PL9DcTl2dUbv1nl2lMaGtn3g0kM09PMJruujJgEN21yVT0+ubXysJt3ELHWm5a1Ao
	Iv4IfCxcVQAHM5jcwxVPjLTUcEXFfjY2reg==
X-Received: by 2002:a05:701b:240f:b0:15e:6541:3099 with SMTP id
 a92af1059eb24-1ac5a0b8b3amr9647957c88.7.1793523433136; Sun, 01 Nov 2026
 01:57:13 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101070121.2714-1-sreekuttan2156239@gmail.com>
In-Reply-To: <20261101070121.2714-1-sreekuttan2156239@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 1 Nov 2026 09:57:02 +0100
X-Gm-Features: AclHuK9wgaJ_HkNnJv_xBJjiMMzCDxyfUAruQ6NGbegvoXIPxxM6IwWV1dPVkkM
Message-ID: <CAMhs-H8qmxZZ=6LD2qCJfM0AciX60AcPz3pqCp+gS5De2P-bYQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Fix reset control leak on PHY initialization failure
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_015715_160794_249E643D 
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 1, 2026 at 8:02=E2=80=AFAM Sreeraj S Kurup
<sreekuttan2156239@gmail.com> wrote:
>
> The PCIe port initialization code acquires a reset control handle using
> of_reset_control_get_exclusive(). However, when PHY initialization or
> power-on fails, the port is removed from the PCIe port list without
> releasing the acquired reset control handle.
>
> Since the reset control cleanup iterates over the remaining ports in
> the list, the removed port's reset control handle is never released.
>
> Call reset_control_put() before removing the failed port from the list
> to ensure that the reset control resource is properly released.
>
> Fixes a resource leak on PCIe PHY initialization failure.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
>  drivers/pci/controller/pcie-mt7621.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

