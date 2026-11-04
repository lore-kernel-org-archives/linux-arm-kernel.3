Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B258606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u4zbkAQL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lu+/V23W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pZa1DyQ5dhNm7IcWztDUNPVGU8LXVDzTyG5czYuorX4=; b=u4zbkAQLMtDeUj
	4pxwZRWwW5CLL1aRlWg4b7s3wN7KyhtQfvb80lW7ed1jB++86AVk6n1Z83g3F1rRbAbACSxQnPJov
	pyMlLSsSZeASjC8BALFZNAUvgznuqpSWIogjufgKtKuRlyml77DEH72/Ba16L59CfIB2TurlvBJBk
	yOnz1uRdTxJCij2zviAnuBslEozHchrmPx0FXJ5TOY6uy6flb2HNpViiv4YJqxZQkQpJtbLmAXwN9
	aUN5am5sBLmxK3fXkR82a3vLiTmWmdOByUz+0RwodJ54Jis9FwWjlImEh8VLcsXdPnj/W1fmSrYa7
	tI1blBDB5fRYHym6Gx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObJ2-00000005Vsg-43K5;
	Wed, 04 Nov 2026 13:45:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObJ2-00000005VsW-1rOW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 13:45:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF99543EBB
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 13:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FD61F00A27
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799935;
	bh=pZa1DyQ5dhNm7IcWztDUNPVGU8LXVDzTyG5czYuorX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Lu+/V23WSycXM249y8TFrnUl6pnNNAczyEkfJCPCcFSEDGnHvAN7R47uN0Rm5YOlb
	 ksG0DWFJDoGQ+XKsxZoHcJhImNa1vUI5mxCJtznQwwm/t4wIw5e0tI3Yg9k/G5Q2L4
	 fFOeO1onHFqwKzLY6BOr+KyXDJBhmwRRPEGZsgexcP7HEkhp7/CMW3ntJanVhf1YZo
	 5WyloPwOjAsMwCQDPkAohS4CsCRQgv2FQ37+rA546fb0XUaQ/t5gQkWVarjo16xSYG
	 5NARaUAeW/UeaP+rLZbakxwAbDsZ/H+MwVTMzvs+TyERdbiaZITZCeOw5ej/Jq7sIA
	 PvV9EmRDWCvEw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a98f260f85so7255991fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 05:45:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByLElH5V0PhGWMq2AQ+IiMWBZQ04RVYFq/d+Mun/MIXG5yDuWTqUYmQ984PORZYEVj3OyeNeUFkteVgpsbzXAUh@lists.infradead.org
X-Gm-Message-State: APuU4Z9eQNOveeaUvA4T3w83aZ3sqnUbnrPwSyfYOIIulgPnblV+H2yE
	jjoF+D2TsczekUpcS3C0DxorEOIYEFgk7fvf13bNntAJhW5ahLwvGQArpFwuUJB+jZX9tXDcxVO
	l3hOgPEOvcXtPyymKEU5Y4xnfl4xxIrw=
X-Received: by 2002:a05:6512:3089:b0:5bf:f559:2d10 with SMTP id
 2adb3069b0e04-5bff5592d49mr943044e87.63.1793799934435; Wed, 04 Nov 2026
 05:45:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026040230.22338-1-xiaoleiwangxiaolei@gmail.com>
In-Reply-To: <20261026040230.22338-1-xiaoleiwangxiaolei@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:45:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLk9BUeA6KEiER16ZEemBkV_k_EdUDmbEf=DLjbSsyO=5Q@mail.gmail.com>
X-Gm-Features: AclHuK9G39re6JxrJ1z-ZGqu808jbf6f0YNR9rG3WzY_Xw8qXMct9UAID3GD4J8
Message-ID: <CAD++jLk9BUeA6KEiER16ZEemBkV_k_EdUDmbEf=DLjbSsyO=5Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: scmi: replace custom dt_free_map with pinctrl_utils_free_map
To: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
Cc: aisheng.dong@nxp.com, festevam@gmail.com, Frank.Li@nxp.com, 
	ping.bai@nxp.com, kernel@pengutronix.de, s32@nxp.com, s.hauer@pengutronix.de, 
	sudeep.holla@kernel.org, cristian.marussi@arm.com, peng.fan@nxp.com, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 5:02=E2=80=AFAM Xiaolei Wang
<xiaoleiwangxiaolei@gmail.com> wrote:

> From: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
>
> pinctrl_scmi_imx_dt_node_to_map() kmemdup_array()s the pinctrl configs
> of every pin into map[i].data.configs.configs, but the driver's own
> pinctrl_scmi_imx_dt_free_map() only frees the map array itself. The
> pinctrl core releases maps through pinctrl_dt_free_maps(), which calls
> dt_free_map(); the duplicated configs are therefore never freed and leak
> every time the DT node is parsed, e.g. on each (deferred) probe attempt.
>
> Replace the custom dt_free_map with the core helper
> pinctrl_utils_free_map(), which frees the configs of each
> PIN_MAP_TYPE_CONFIGS_* map before freeing the map itself. Its
> signature matches pinctrl_ops.dt_free_map(), so the driver-specific
> implementation can be dropped entirely.
>
> Detected with kmemleak on an i.MX95 board (FRDM-IMX95).
>
> Fixes: b755521fd6eb ("pinctrl: imx: support SCMI pinctrl protocol for i.M=
X95")
> Cc: stable@vger.kernel.org

No way I'm sending that to stable, it's no regression.

> Signed-off-by: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>

Patch applied as a nonurgent fix.

Yours,
Linus Walleij

