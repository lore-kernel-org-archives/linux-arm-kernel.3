Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E037D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 16:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OAxtdk5B;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=movRfAxm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nql6qrrofIbpZdBZgH5BWbnDX891MVZZ/HtdpF2Gl2w=; b=OAxtdk5Bc7T+9JVCVj0RtI0X3A
	N61rl3MBhrIvjsLHqko6t8MgDY5bM/G6o2yeo0V5SwDFpdtqsfaKqX5KQyhqUg7+LygRUhBLGKjnW
	+c193b3gNJD7iw6NfLxH0fPrDBZgMytt5iZ/ySGTFFRuxT53z5PWfOLuiv5ufUBdjsYxV/8mO34C3
	ucnWVgBdEXoQZW6RgTmjNZQIz7TMc6sHTGnr7vooA8y04No7vWojeVttce1MplEZale3+wpFsehqO
	SnlFZzpilU1i3Ym5c5UFLCFYkcpj6W0/LSTUwc9sCxJXRw1QEwzWV7z82697oePiz9TkZOLYNj68W
	jxTf7kbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqMm-00000007zOT-46nv;
	Mon, 19 Oct 2026 16:37:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqMl-00000007zOA-3jW6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:37:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC7B0600DA;
	Mon, 19 Oct 2026 16:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADBA1F000C4;
	Mon, 19 Oct 2026 16:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792427858;
	bh=Nql6qrrofIbpZdBZgH5BWbnDX891MVZZ/HtdpF2Gl2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=movRfAxmSrdAuEp5xO0qSwY9VzDKKmEzk7KV3EHZ4Tz6s/+ASeyR+ibSSI2ZTy+Jj
	 kq9fq+8lQt9pviy5Szi6RM0CotUOSSvN5EUuU42dDtytbQnQViMt2jTtYU2STAz7HG
	 ceRm96u/wFCu8uoSHAknxpYqJd4swIR/pCbGu1sts++yzGtfztWXId81vZ85UQtFg2
	 CmXvDWeiujNYkbiJTyQCX1PiSKTlPgQIzAyChh/lySy37cha9QyHvglQ8sswin+wk4
	 TxiKShN0Vn4kgVcPGyFVjrGF3t/B7jrOisqJ5PhUWiLdS5t3k0A+S6R/sWrpxEdn6n
	 sQiejzpGrP5fA==
Date: Mon, 19 Oct 2026 17:37:32 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	dmaengine@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 04/18] dt-bindings: mfd: db8500-prcmu:
 Deprecate EPOD regulators
Message-ID: <20261019163732.GH2663669@google.com>
References: <20260921-ux500-power-domains-v7-1-v3-4-9352be6b86b1@kernel.org>
 <179242679515.1178810.16625867453853597322.b4-ty@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179242679515.1178810.16625867453853597322.b4-ty@b4>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026, Lee Jones wrote:

> On Mon, 21 Sep 2026 00:48:10 +0200, Linus Walleij wrote:
> > Deprecate the db8500-prcmu-regulators node and make it optional as EPOD
> > control moves to generic power domains. External consumers of VAPE and
> > VSMPS2 now use the actual AB8500 or AB8505 buck regulators.
> > 
> > Stop requiring the individual regulator child nodes while retaining
> > their definitions for existing device trees.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [04/18] dt-bindings: mfd: db8500-prcmu: Deprecate EPOD regulators
>         commit: c8132247fe4df52e9982d74c986bb199d792b85b

Hmm ... or would you prefer for the set to go in together?

If so, how far off are you?  How many more Acks to collect?

-- 
Lee Jones

