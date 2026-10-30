Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBEB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vo6g0lsv;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZINXWUPL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VQsxK0ypjps04yXtP7D9Vl+v3TvG2zuYW8obCp7EWXY=; b=Vo6g0lsvJHweWzynMf8wqvjz/8
	XiNOgozpp6X1+F5H8U0xTZkSN+H4HEMcWC5XDl8aPXbjaPZ1hsonR4BJ8Oorhwf4pp+ffPlyMYieU
	4ok729LfXwzMR4c2EV5I04XTg5PXilB6EByroO5MIzoQ2ZTlOvY1dkK2gPdmXeMV74u5rdD6lttO4
	Zhx8h7MvNmaIbbDTfXO1iYoQee47t8zmGUtMoljYo0iomiXYz3WiI+O9yg7iaKbXM9p9XnNtPVobh
	7MbJezzxWcdMDknnTjeq4HYQJMRNlHDQ0zVQohWx+aHAuhUM9OB4f+r6WfLnwlyGGYlsyHFZ7h/WR
	CSw6E15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi4c-0000000B8Pg-3Q2y;
	Fri, 30 Oct 2026 08:34:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi4b-0000000B8P6-264g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:34:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A540B4401B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CED91F00A1B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793349292;
	bh=VQsxK0ypjps04yXtP7D9Vl+v3TvG2zuYW8obCp7EWXY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ZINXWUPL8f7LzBGYW2E2EFIN5YqikTTIb6zwoXh3U6y5TI8TyVghqJOnoO2wsfn36
	 moX34gngLXCKOjeWefU2mX1XvRbWDQtwavmxT0cPBm/KX1wuvozwQlohjO4uD03q1T
	 uI2V+vypbS7nGXA4PT4H+cAxO3NZUAaMdTxdvkxOjKlmHIjFI2TnPW/0/wdwbQZW5j
	 d7KGRB6+Vjvd/v0UuejTd3Lu3zI+3BJqDMtUXig8OO6VM/BJ2YLRVUjIc0IreFrqw5
	 zzbeJ+8dS3RPR4aushFL2zDJmRGC1cKBllkHlI7TGpc5S9FoZ2bv+7oL9sZ6Wf/XCC
	 93y/wQ0ypmeww==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d0so3955351fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 01:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZtgetQDaSon0tp5orRoUKyV0IzQIJOs6HVCKkrgezUR/Cf/NQ+qm6PN8KFiBgMNY4MydS9gTktpMPVMs3NyXT@lists.infradead.org
X-Gm-Message-State: AFq9FYIAzCtlsF9HLwmS5H9UR2MpAl/FRpnrUMZ774roEaZi2oHD0Dkt
	+G1yxHNyM0Ch/isG6z36i7nYH8ykGv3nuiS0+Ax2ZlcGS07uQ9OXiStvycPIBkJz9zgeDNY3Obv
	faP4y3MoOq2UNIm82cLEszxI+YyXEm3g=
X-Received: by 2002:a2e:be89:0:b0:3a9:a1ed:6341 with SMTP id
 38308e7fff4ca-3acb7ac0796mr3395761fa.11.1793349290657; Fri, 30 Oct 2026
 01:34:50 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 30 Oct 2026 16:34:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Ya50=++STiOLihh6VKtb00QYcv4ARAWqFQ=1FML0Ccw@mail.gmail.com>
X-Gm-Features: AclHuK8f9aQow26btBoDKktg4w5d9q6uuVMy592vvuptaUTTeNrSAFWXrHhABVQ
Message-ID: <CAGb2v66Ya50=++STiOLihh6VKtb00QYcv4ARAWqFQ=1FML0Ccw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 3:12=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/mfd/ac100.c                   | 2 +-
>  drivers/mfd/axp20x.c                  | 4 ++--

Acked-by: Chen-Yu Tsai <wens@kernel.org> # ac100 & axp20x

