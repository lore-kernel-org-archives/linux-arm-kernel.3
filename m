Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED60A606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IODrORNa;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p9zDBIK7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=; b=IODrORNaTMkqdq
	aMg2PWwwOzcYmLs8DM8B/J5NI5OgyWNDtIzL5GEQtqrd0e+lemeoJeR4Q7VDIAixJ/bJbgbGAwurE
	Z3qyZsrsuI9MBpI+0DlEkgG7s6qPpAEfy8YCn4agSLDwfkDHYXZMDH5qXt1NWoP7PgoilJD0aS74W
	2u7uBkh9X2ak5Qs+diPvUxFhzH+C4+RyEOsE+LXASUrnhpaRqeP/XXuzNJIE/kLrFNV+1zr1WRvLc
	TLmj5D4n0j/ai0bQ1tR4fIO1LZ4xEwY+os4EOMD9Fbh25FXTSfvT0Hoj9sVqv9Z10TrCWdVb9pMti
	K9ZuTIMCPfdPrsmUx2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRLN-00000009Y8a-1HXV;
	Thu, 29 Oct 2026 14:43:05 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRLK-00000009Y7y-2ej5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:43:03 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso371306266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 07:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284980; cv=none;
        d=google.com; s=arc-20260327;
        b=i1NnEMLc+jdNZD71mieAglPAsxytLXV65Cj8UIaYU6/SyWOHfNp+ztM5Oq7wdUdkTG
         cC7B9jqishSq9pMv0QVfyUScmnCGOi7VtMObnG7jghm25QB+q22UZ+fTHsm/aqsxO/D6
         24T+r8BLNaevAj2Tj1Kmh6HRsRrTsi2hsNS67kaQpoSOqZe/k4IvV2dQ6PkWJVXKTh6c
         I3F1AisInq9UIins/7O42gsxcjrbKQkywQmafGSU11JPHcjV90BLWUEZen85NHwnrFyU
         QqC6nG3qFUU2TeyvtaGHkIaqKgogN/f5wpHuYvKXFaOYMZFU1BwA/sLNs/fPYK8+/I4R
         h51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        fh=wbqsCkZrvSIPYPc/STnDK+1TCuh8WTamHkD7FZbmhkk=;
        b=BPInv5ih1zZfq7smRohFJ5Bo7NkrI3CPl1CJrWwPI1asICqRV9dYfqsD8+TavmkUW0
         oUeo8n4nghY/yFogmPVPa58mjVMBa0yzqIE8MqXeMvou+AUOkt5ddqfPF28/x7tPpoxG
         PKivvIMZQ51ib18WiL70mQPji27dJ1p1x4Sfzt63nuI9UJsUK08lesjcTGLqdkkT/9WU
         qAmfObCwKvaPFpc2kqER9HIij+U4IwRXGXZxPxsRYEEC1gcJFhvsrNjK3DA/RY60Ny3g
         zAAGPKA8iF3KI7y1hRvO5R97jdZqdOwgsGMw+YBjPleP0uu7o9FfKBeXWuVxIn1zd68a
         7iuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284980; x=1793889780; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        b=p9zDBIK7I5MHXs+u4ysj6lWoEkKr71HHzizy+vkRVL4gNifL8eFKH3XzIru71oc3EG
         DyPLlL3g4g/+Inn2EwU9al58htHC6zfhMkujuNKx3Ycoc+un0aLMkyIitryw0GgdFD0u
         nY2LrOLvtN8xjsu3xmVWWylAdRWGF0XIuOJsZ43NTXrEUHbajVxTvZZU7RkJzufdVI0X
         4RMSrg3w3KWHBNzNXhY28znS6aj5rlAVsd4atVfm0IXoGdcJsnDP+th+t/9nww7q701i
         yS7acz+RNCHV15AKSzaUK1HwGLIDu6YYdoImKIhJveKzwTjfWUBmhLm+ImpxIv6CdXFr
         pVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284980; x=1793889780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        b=kWiZWDaaPxLk5mYy9i7n/dfOe/mSiQ1jRK14FVakMLsCaO4uxwhi6f92gDiIoq11jb
         lmp9A+FpNseJj+Rv3nC614MVm7H8+/JV4Zqv4Z4o59XB5RxaPIGdJZVW3rwR21FsQqxq
         vuyYNIpWF9oVHN3+WfsNhytpG6GfJvMuiWFHF/k9eaFaB/vsu16w7lGIVP89Mre7A7fT
         hgcZ0PtV0hsI7mggdE/81aqM2gDVV4/gPEgCY8uHnwyMp9UvNlvj5dhGDpdPGTL1ylAl
         238RGdTUc+C1IG1hh7+dwcc7Fh2wIrvZoMe8rQIjhRbDsCYbGX7QLhbxWGNGYka5vTdg
         htgg==
X-Forwarded-Encrypted: i=1; AKwUvByv7RrYWoYzm7I7nP3wmMznNgGgMFUpCuOUZLNqruN5/mny/IBtj9lEacYr9Hs1EBPsKxvPsjtSVFu6TBf4UzUL@lists.infradead.org
X-Gm-Message-State: AFq9FYIXTxu+GrOHzhFG1Ajaoec8c+Z4UdFY4V3Pi95vm5EX9PjGJL6h
	MpF+7OpGQY1yOx9tfQwUGoUysmJoPpArPxxVQo6XaGpzLw0CkRsQ2bFOmYSE192FL6cuiDLtcdq
	1BWcK891NncTnSdHK9X4IPTDpp75Fe8A=
X-Gm-Gg: AYBFou2755v4AwY9rGL28lXMH18YjD5hWvvCYMAZVUn0cdHNV9VF5WAVEbTNvtd4q7l
	uapkFCTseDJNh5/RyPryIVOW46P7i1EV/FE9lmPAJhJ0ojHIMJZsXl0C2DUeQEeBbOj0S+wa3RJ
	5NG40kk35apWxo5i20OXeN+qEvE+ZldiN5izl7RJEmuVP6hklJsfQt0Ymhsengil2LRnV56HfYa
	C5htiwkujLkfrFJyD2VVUGqw32b3PHK2HfxlasSXNBw9YramB2Sgb0XSafpwEcgf5EHXvAGDrAa
	ePJpS/u3ak/Sgr4C7+tmt+BT2zHfKP0h+NyWfyUP3HN4PFAaqJDaXffIwxbIPT3tPtiIys2ckrg
	gX96x5p2rp+RQrmPXOKV+GNs2U6ewjcqv1SSMdWkFPoGMxG6dgv0+mD+aN1ujq/pR8IG0b/XUeg
	hXoueh55n/QdovtqKwi8rfWo/JY/nCBL9Ziwmdv0YN00OXu5jES90=
X-Received: by 2002:a17:907:94c9:b0:c3e:34fa:611d with SMTP id
 a640c23a62f3a-c49be00bf6fmr469836966b.35.1793284980100; Thu, 29 Oct 2026
 07:43:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com> <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Oct 2026 16:46:28 +0200
X-Gm-Features: AclHuK-5fF5L0EppdkS4D8ZIoBbTyK3ZL1smqB5yKpnauEf7H2xoksPh6zRmaVc
Message-ID: <CAEnQRZBsKsDGhABri5MwiPSL1EGC=a5=GfK9H_OX1jXcYnerFw@mail.gmail.com>
Subject: Re: [PATCH 03/11] gpio: vf610: simplify with irq_set_irq_wake
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_074302_686634_2C6E5EB7 
X-CRM114-Status: UNSURE (   8.67  )
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

On Thu, Oct 29, 2026 at 3:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual enable/disable irq wake logic with a single call to
> irq_set_irq_wake() to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

