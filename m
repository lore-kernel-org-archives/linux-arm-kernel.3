Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF825606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZeZVn1QU;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iNjfyv3p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YMPvQ0y2/UErW4qcLjewTviEOS5UzV5x/LnfQYGS5D0=; b=ZeZVn1QUcmXVPx
	YEn+Y7TPvaUz3N+neGHqjEU9IJwk86k7oY7WAoUokb5ANpJZF537XShFwi8OLtheHsPKk8/9H2kl6
	VMhIDPO7CXqnXISR6wvAEi2zza8l95VfAACTJqJPOfF4SluUEOKvNG22i67Fqzyc9aRaQ/PFPQJvd
	ct58h1/H0dD2v5Y1QHXn4qkrsOY+8eWrdLsQgP5pgz4cQ471Qc3YcSzhGZRSn9l4zPecORbKZ9M4h
	ArKycPDdB6RtOIhUupre0c4/zFw9B4K9Fb4Y9AlQQtcbs/V+Dot13yMc2chIDe+knkWVgQ7YjLp84
	bOqOyzQgl+BkKsrIWH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzah-00000006cHe-2oNc;
	Wed, 28 Oct 2026 09:05:03 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzae-00000006cGl-1jcT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:05:03 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so1751305e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793178299; cv=none;
        d=google.com; s=arc-20260327;
        b=dJp+0ewO1Q9QDX1E8lOKF5ArpViQGQb3zt8nG74OOShW5DLa3lALG1og+wtlvvccQJ
         wuJgK2dPP0BoGgPq85KqM4PHcng8ghASDUSKL6ddU2e4udbEs+hKfBJIvNi6ZvB1bsC4
         lc7Kr2y9n3tXoBtqs+91EIMMuVxUKkcLTVb4xqYOOO/vK12Cteuaw+4il+XaT+1+0f7K
         51n8q45tOKq82M6Cz91g7niWqZ8XChhYWUKzf39B+ffmZ510jXNpVwXNXSeLSFzeDEM+
         hKbzc0CtwU5+uipBqMSfiYKVzH1ulav3TUCEr07SDhkD3Sra/Y5lRBr/XB3It9erhppY
         w30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YMPvQ0y2/UErW4qcLjewTviEOS5UzV5x/LnfQYGS5D0=;
        fh=JFfX5RzQGIK+nTipnv4dOwV7xrY4tsU9LVnY7L16VNE=;
        b=QnRgfAy5p6fiaCW8ckp9PXbi1u0MchR25kNNz+UFrrklzTvTuCG8dkDznrJqbSzSbl
         lhgvzVrj2CY5EkJfOh+ZSHtDy907KQz0TjU43jnf/7n7J0STcf7Vh+aFbVywc/lscQZX
         fcLZAEcU163ZYDI+kc2TrMmQxNRc8AcpUBPod2liNYYmcCtNECbeW8qXQZOhD0lOTZLM
         W/Pr6VfXC+9nKTHOQuYA0TFVJzbwrzVRFMxSwN1XJoUKPgCCG+r0VDpIe/9MlyKWmZjk
         6vClL09c6ucWN0paFDBQgVDdv1yiFzPOob1zq2Ug3wgvPz11d/LnLPiv4liKQvh0MYKB
         jI/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178299; x=1793783099; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMPvQ0y2/UErW4qcLjewTviEOS5UzV5x/LnfQYGS5D0=;
        b=iNjfyv3ptUrfLHS6ObSCNiOi7jv8vtAlFyNQ1oEq4/Fw2JkavGy4W4x9kCKpQ8HHNZ
         jdD1Bd75IxQW1RlPAXh9Z0DCKOCfyBK8GbipiBH209nXa70rL0NNrw9GPSwuvLpnrT76
         /pdH1YxiKtTi9FmvVJc/5ERNfqJz2gnhOmrN2qdgmmPL3e5lrft2IxZRjHReHLu07CqK
         oKqqUbArgw91Uw/S2OTa9unlZqBV0iQGh69SaHFQwSR9lzDayUZI3xM1yWxB8A39jO+x
         7FqhMimiyzGGf4+3mZd8QLz4j83DWe65a4eu+UuOrFmVD0FWCBgLL3d5lSmgmNKK7j57
         zeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178299; x=1793783099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMPvQ0y2/UErW4qcLjewTviEOS5UzV5x/LnfQYGS5D0=;
        b=TFVcorU7/9yVHP52649Hdnsb0t+B2pp7eIx/oHLYKkpcgstu923beJIOGuWQNZ5GN2
         lsg6KUEO4GBzh1nDZuHhkvqKANASi31wbi1V+2oEQXZXn/un/EOL8dk8THPYp/CmXWaP
         d+Z69+cVUOqJwms2p4nHF6Yd5H7hORUK69uyjOZbDeJJLoukYsfGLnbS+F/JQR3Z1R3p
         yxnSxqADN4cqzWGzQ9+pMHYx7DHRpgCvl5KMffOHO9+2o2zVAJHuJe6wShgGHA6cDMQq
         +v+02Uu36XvLXWzxaJevyaC+wmyho9Ou97nqhpKHtr9+d1imNAjp4WmdTr58o/8ZHHcl
         LGgw==
X-Forwarded-Encrypted: i=1; AKwUvBwgovCGoXhspa6BD7GNDo4H8E3PLxXW9Pf4LYTxGUxwCWthWdRDA2Qf5eI/x8eHbxOGI7q3+BWPw2mbNOzTk0bV@lists.infradead.org
X-Gm-Message-State: AFq9FYLvMl7CwmlzvA9BrYtbr5TyRPlm3gIWY94WBSpEn7n7D+Slv3kN
	V3bc2pPHDj5v5gDEuDMJ7hUlymfuIY1BzPopiwP0lT5KsMpy2j9d/4Wf37gefxwdQCOtMAqFtJz
	4CcEH4zbSnZ502NLzRRTXBtD7iGJC+eA=
X-Gm-Gg: AYBFou3ji/YH19b4WXC6VCJNbVgjQhzCAkEU+UFN0eC3Jxvrswf7ySZPKY7SRel4WWh
	5B+/p3l6LMFy/V9WalSmSh6xJli5yigGJ+1Avy07K3cJWx8GCMIp4MUsnPdu/h6182levfeWqg/
	bARPwQK8XJQji3HZNhf2kavN5k5s2E668g2/flMl1xrsF02ich3QJhAABt0UAj9HpdVw+2B/xdp
	KoT043sQj3IVMQCWEquYxXlO4z4moJQFk9fkl9PzafuLDM0Sp7723z6Fo4FlIRTDMYaubgPheVU
	vuGrv4OTiGqXbcIhse4py1jXWQ0R5XQTxypKGVAfSZa7XCzM9T0RM8fBaCq5gfZuIE57MGSe3Eu
	cS2p7j9M3j3FjFE0cDH700nClXXXVUoaigfbSeYgopS6XPIohb5WgLQvRIGL4T1L27HC2M5wXZF
	zTSJBzfatSUE3qMSfsNB8AzPbNJIZaFJTI1nbT50U+5vYh4Zo3Oj3oULxwl1YIs+Ei5mZJ0NYtb
	fvABQO5mMasRynxbWXj7dB0oInKFg==
X-Received: by 2002:a05:6122:3a11:b0:5e9:5e79:aa5 with SMTP id
 71dfb90a1353d-5ec4fffa0b3mr263672e0c.7.1793178299127; Wed, 28 Oct 2026
 02:04:59 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com> <10f350ff-8f82-4a3c-beea-4a02d0d179f9@arm.com>
In-Reply-To: <10f350ff-8f82-4a3c-beea-4a02d0d179f9@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 Oct 2026 03:04:48 -0600
X-Gm-Features: AclHuK-gFIc4OLdQpz2xuDakOfWjCmV7F0pKVxznmCh4UQXGFX7ZPx8S3KT4ikY
Message-ID: <CADvTj4oSo7gXsqoLndTChgC0oaUGB9SB-4B4a1gEkx6XDFD7Tg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] serial: 8250_dw: describe the Allwinner H616 UART configuration
To: Andre Przywara <andre.przywara@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_020501_605523_605D242B 
X-CRM114-Status: GOOD (  37.43  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 2:57=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi,
>
> On 10/28/26 00:05, James Hilliard wrote:
> > H616 has 256-byte UART FIFOs, but lacks the DesignWare component parame=
ter
> > register used to discover their capacity. Its debug-divisor and RS485
> > registers also overlap offsets used to probe optional DesignWare featur=
es.
>
> that affects almost all Allwinner SoCs, not just the H616, so should be
> solved universally, not just for one SoC.

Some Allwinner SoC's can read fifo size from a non-standard
register from the looks of it.

This approach at least allows for just adding SoC appropriate
compatibles with their fifo-size tied to the compatible. Or the
fifo-size can be pulled via that FCC register on the fly and
reuse the code paths here probably by tying that logic to
the compatibles as well.

>
> IIUC Chen-Yu has a patch to attribute the right FIFO size, in each
> .dtsi, which I consider the best solution to this problem.
>
> I'd say we wait for -rc1 and then work on top of his patch.
>
> Cheers,
> Andre
>
> >
> > Add an H616 compatible for the integration-specific setup. Keep the
> > existing 16550A port type and describe its fixed FIFO depth in platform
> > data. Use common Allwinner helpers to configure the transmit load and
> > receive thresholds from that depth. Configure automatic flow control,
> > preserve the BUSY-safe integer divisor path and keep the UART gate enab=
led
> > during termios changes. The H616 configuration uses PIO.
> >
> > The series first introduces platform setup callbacks and a shared RX
> > trigger conversion helper, then adds the binding, H616 setup and SoC DT=
S
> > changes. Based on tty-next at 6b4b543fa187 with the posted RX
> > trigger callback-lifetime fix [0] and DW BUSY-safe divisor fix v4 [1].
> > Platform setup runs before installing the BUSY-safe divisor setter.
> >
> > [0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifeti=
me-v1-v1-1-731b78d5003d@gmail.com
> > [1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1=
-v4-1-41714a75e15a@gmail.com
> >
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes in v4:
> > - Introduce common Allwinner setup helpers with the fixed FIFO depth
> >    supplied by compatible-specific platform data.
> > - Rebase onto tty-next at 6b4b543fa187 and the posted DW divisor v4 fix=
,
> >    installing the BUSY-safe setter after platform setup.
> > - Use an early return for FIFO-less DMA setup, following Andy's review.
> > - Default to generic setup when platform data has no setup callback.
> > - Select Octeon's optional-register discovery with IS_ENABLED() in its
> >    setup helper, preserving the existing 32-bit and 64-bit behavior.
> > - Extract the shared 8250 bytes-to-FCR conversion, including the
> >    unsupported-table check, into a preparatory patch and use it for
> >    H616, following Andy's review.
> > - Set the fixed 256-byte FIFO depth in H616 platform data and omit
> >    fifo-size from its binding and DTS, following Krzysztof's review.
> > - Precompute the Allwinner RX thresholds during setup and retain the
> >    sunxi FIFO-depth helper for filling the table. Use named FCR encodin=
gs
> >    in the helper, following Jiri's review.
> > - Share threshold-table initialization and callback assignment through
> >    a sunxi RX trigger setup helper.
> > - Group and comment the H616 trigger and RS485 setup.
> > - Link to v3: https://patch.msgid.link/20261024-submit-h616-uart-fifo-v=
1-v3-0-286fc1b8c3c1@gmail.com
> >
> > Changes in v3:
> > - Introduce a platform-data setup callback in a preparatory patch,
> >    replacing skip_autocfg and preserving the existing Octeon setup.
> > - Describe each H616 UART's FIFO capacity with the standard fifo-size D=
T
> >    property and use the value already read by uart_read_port_properties=
().
> > - Derive the Allwinner RX trigger thresholds from the FIFO depth.
> > - Use an unsigned trigger index and conditional runtime PM guard,
> >    preserving error propagation when the device cannot resume.
> > - Rebase onto tty-next, replacing the earlier DMA prerequisites with th=
e
> >    posted RX trigger callback-lifetime fix.
> > - Separate DMA enablement into follow-up work, retaining PIO operation
> >    for the H616 FIFO configuration.
> > - Link to v2: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-=
v1-v2-0-af0593504635@gmail.com
> >
> > Changes in v2:
> > - Keep PORT_16550A and set the FIFO size, transmit load and capabilitie=
s
> >    during setup, following Andy's review.
> > - Select H616 setup through the matched platform-data pointer and remov=
e
> >    the type and DMA burst-size platform-data members.
> > - Use get_rxtrig/set_rxtrig for the 1/64/128/254-byte receive threshold=
s,
> >    with port locking and runtime PM around register updates. Keep the
> >    standard half-full FCR default, selecting 128 bytes on H616.
> > - Advertise UART_CAP_AFE so CRTSCTS enables hardware automatic flow con=
trol.
> > - Rebase onto next-20261023 and declare the posted sun6i pause/lifetime
> >    fixes and their prerequisites for DMA enablement.
> > - Link to v1: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-=
v1-v1-0-e4a3bae2eba8@gmail.com
> >
> > To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > To: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > To: Jiri Slaby <jirislaby@kernel.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Chen-Yu Tsai <wens@kernel.org>
> > To: Jernej Skrabec <jernej.skrabec@gmail.com>
> > To: Samuel Holland <samuel@sholland.org>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-serial@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-sunxi@lists.linux.dev
> >
> > ---
> > James Hilliard (5):
> >        serial: 8250_dw: select port setup through platform data
> >        serial: 8250: share the RX trigger conversion helper
> >        dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
> >        serial: 8250_dw: configure the Allwinner H616 UART
> >        arm64: dts: allwinner: h616: describe the UART integration
> >
> >   .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
> >   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  12 +-
> >   drivers/tty/serial/8250/8250.h                     |  16 +++
> >   drivers/tty/serial/8250/8250_dw.c                  | 138 ++++++++++++=
+++++++--
> >   drivers/tty/serial/8250/8250_port.c                |  12 +-
> >   5 files changed, 151 insertions(+), 28 deletions(-)
> > ---
> > base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
> > change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
> > prerequisite-message-id: <20261027-submit-serial-8250-dw-divisor-v1-v4-=
1-41714a75e15a@gmail.com>
> > prerequisite-patch-id: d8219673210dac82d3adab41578ff2f76f5862c9
> > prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v=
1-v1-1-731b78d5003d@gmail.com>
> > prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269
> >
> > Best regards,
> > --
> > James Hilliard <james.hilliard1@gmail.com>
>

