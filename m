Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35161606D839
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 02:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aFA+nrnH;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Szw5iKY3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=; b=aFA+nrnHDX5GIufSdOKAXKl8eO
	R8CEswi0oi/9fQtyCPLuswJb6kSVv8RBzq8LBr/g9EyI3eCyos1dAXV3QAE0DUH0oRUi6ajVNuyPt
	11o8m96s5MiNoxiiKKAGsNBzJQX3WCCHonyPKLeaC+JHONJFS8zg40PzFrRh42k+w5Y1cg0CdcT3+
	+aLxQYLaGYLjK4fAP0ldrOxdVs7f26Wi4PqTh/2w2szsLSeqkMbNlgP5Ja+t6c978e4LtUxAme+5U
	buXrcREOuNAI+5yolSOqK1pYZgOZVKN/lZ3g9C7ebWnI3mcVxxIj0zWbTBmVJf1SewM/AFoNnr3OK
	XxymAvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3v8-00000000qIb-3xb8;
	Tue, 03 Nov 2026 02:06:42 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3v6-00000000qEa-0WlD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 02:06:41 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-353804b591eso6476256eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 18:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793671599; x=1794276399; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
        b=Szw5iKY3MCg/UYj3OLodtfrFpqNegez3Kfuj42RuG4Pmmf0ZSHbRY0Jg+1o6Mmbxlr
         JP6lIPutAIPlAKLHzCjkn09lvzYcPik/jSJ7GcpC8c20QjM8Plpg9YecjUIxXdVVf54z
         Epg1ooA4cQUm2flKvUyYQ3ejp6kgBAmWfV6rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671599; x=1794276399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
        b=CDHr3FDWNviBiCgoQy9KdkGW8aU1g5F9sTqQi2LAuYTBYHsgrsVSsR9uVtgSxt0LfG
         zBo53s2UsxVx2j/eYsoa/mfszhBbRURS1G3SzJ5pvTu+HfgV2rXWNWjZtCUa7Rzy1tZP
         gBtPnY3h9cgkCNhCe9Fpn5nP4Yg/BhS/xvxu2QQdqIkrAOj1hLrUNTzprxknSLWNiy2X
         Z4s5R09vDsD9XK6uaBouaEx85dYEc44pcitvOLSgGhfHZud5hGYli9Tpt6J9YkUywukX
         Spj1Ywf8lfGhzyyldDepaf3cStRUMu6fPcgnQOCGYHQYPFSDXv4IkVRaJ1muqhgaahrP
         /aBw==
X-Forwarded-Encrypted: i=1; AKwUvBz5sw8KvZwU/vwh2v0GWLcm2KYiT7lxBLnf3I19yjzxMm2inokBT3mmVRMcNChWc6StpP7Dq+KkqvI/zkCJpJiP@lists.infradead.org
X-Gm-Message-State: AFq9FYIclFlCLVbLUxQR++gi30LR2ujsjeD0Fx7iVZpgLr0W77HRUPYv
	267OfCU5ujJ2HpVEBcE1odzqyvWagcsV3EvEF0d1IudhUJAMuHuiE6rifcjHzpHZhQ==
X-Gm-Gg: AYBFou0L8/6rZRgTzaUi8zjwXmf00MxodnD9/XrxljGtnlncOl8a0vJYo9oYezkVpTU
	FoLnX2bmF0JdnSTBTZQ+gLeJkSxXkWxkEFWkutb2zIrcMpx/S/1PgoPOH+JXv6gZa5p50lpO4ri
	Odk76eNhCFBJVPFT6k03BpH4+w7XMItDYN3dbHLoB3BsGe0/2HvhsOsGb038JYfUHdMuNYMr6RY
	/FMY90lRFRI2Qhs6XeCU7bOLpvqNTlO0ttl95N5zsmztSj41eNcip9oou3pVa+BpuHzw0UNhSkf
	kAuZ0zrfeSRBkC8gPfdFT/MFcmO8i1R7UcpE3Zq90IGZ4dAXMKRQp07RYK0O2fDYiypVYhK/H8f
	PdH/QzCuLFZOH85/HeH5xaFVz4ZcA3EE66hjN7VpGxcXlvS8vLGIYm+fCbaJhcGa/E+v/nD1yT6
	TIQFPOtRMvTrXHTItmEbSRyxteWwAsYR+DkWTivkmd0ygUHMpVvpu5kvKPK75iF5IrCnq/6g+tM
	qlf3k4ZOnu41r0zL/fblELnWokluRq4yVGYg+UCYxblo86urQo+nL3Yu/TeXbL8DGzo0GqUrqlU
	SUQrhmU+TDPxYkdNFaMalBE4U0327rc1kxw5Y5LjZHFJGtyk+XdPZPJh8x2gZT2Q91c=
X-Received: by 2002:a05:7023:a56:20b0:1b2:3742:828e with SMTP id a92af1059eb24-1b23742830emr3971156c88.3.1793671599060;
        Mon, 02 Nov 2026 18:06:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1ac19f4a04esm37837284c88.15.2026.11.02.18.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:06:38 -0800 (PST)
Date: Mon, 2 Nov 2026 18:06:36 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 0/9] google: Add support for Laguna CPM
Message-ID: <aulBrFWi54E6a7Br@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261028-armored-glistening-cheetah-6f3070@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-armored-glistening-cheetah-6f3070@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_180640_221889_07270DF0 
X-CRM114-Status: GOOD (  14.47  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 02:24:35PM +0100, Krzysztof Kozlowski wrote:
> Either you expect review or not. RFC means no.

OK, PATCH.

> If that's patch, then at
> the top level of cover letter, as the most important thing, you explain
> the dependency and merging proposal of this.

OK, I'll try to move it up. To be fair though, every change that has any
dependency is clearly noted in its below-the-fold notes.

> You combined here like 5
> different subsystens...

What do you recommend here? I believe the general principles of DT
binding development suggest there should be a single binding doc for
describing the "Central Power Manager" (and the services it supports).
CPM supports functionality covered by many subsystems.

While in theory, bindings can be written without corresponding software
support (drivers), in practice it usually works out better to develop
them together, to prove that the binding describes the hardware/firmware
sufficiently.

And even if the binding goes separately, I don't think I can 100% split
the driver support by subsystem, as they all require the same underlying
CPM helpers, and those helpers don't have much meaning without their
clients. So some multi-subsystem work is still necessary IMO.

So I don't really see how I can address your complaint. But I'm open to
your ideas.

Brian

