Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641DD606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pCqBsoXJ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EVnB/wDG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WItnU3JphMlTYMOTnE4Pme0y21QgJys3MMeDqbhdRdc=; b=pCqBsoXJNL21vNPknbIK93ATiN
	rMYpDAH8KeynHUbSMIWePm3eOXS3BdNRXyCjcni3jKzosYTtH/Yu8MX57OD3E0gTYuh0wFiv2U7R2
	xnByc8IKg/tRSoyDoEyT95rL8PQTuR5ucDSf2yjgj3NUK3W7TONBYAYVoqHP5gGAJhZr35FL5Ip4D
	82DfGa2BEg/g44IOZezGB7s6qvZzhBPpunnemMoqBaJZ6pN9QOSFyohD3KeNDQlUbMZjiwCIZgDOS
	iRpzXnoDPOWVXe4wbr7pokWx1xkD1otM1TbUpRvX1PsF1EcGkYaP69E0h4bcX9UlWVIJfxzX2bvCL
	DE2UNL6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEG2-0000000APDT-1CHi;
	Tue, 20 Oct 2026 18:08:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEG1-0000000APDM-2wnd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 18:08:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2738441653;
	Tue, 20 Oct 2026 18:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83191F000C9;
	Tue, 20 Oct 2026 18:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792519697;
	bh=WItnU3JphMlTYMOTnE4Pme0y21QgJys3MMeDqbhdRdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EVnB/wDG4mN3TskeK4yB1M03z9fyCLZ0jiRa5bppasg0A6IJcd5IzD2n5R2X8zayf
	 O6n+E7GfsJBO/K1GIlbmvtziDKWg4bVjfRIjl4nlsoPnQ0Y7MG2++ldFmMPVjfKHZi
	 JqqM5IDpsWGnINpNvoaXp+9qhkQXb78wDM5hiuKgjxzoSz4sFbEqFO562BnZYhoZL5
	 uzfUg9u22Cv5oyQH1fVKMtJhmB2sLORSY6WEwYv+XTlMqaT7tGYWGWKFpjRiMvpwDs
	 bHIQV2bclzJ/BI93BpMmrgtgj3jK7tbamq8kBl9JPgVge5uVSjVaci4A68/85FkV1G
	 bTpQpbwgtg4Ig==
Date: Tue, 20 Oct 2026 13:08:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: joakim.zhang@cixtech.com
Cc: linux-kernel@vger.kernel.org, lgirdwood@gmail.com, conor+dt@kernel.org,
	p.zabel@pengutronix.de, broonie@kernel.org, perex@perex.cz,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tiwai@suse.com, devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, krzk+dt@kernel.org
Subject: Re: [PATCH v4 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Message-ID: <179251969565.476022.15302211349293373026.robh@kernel.org>
References: <20261019122048.1107179-1-joakim.zhang@cixtech.com>
 <20261019122048.1107179-2-joakim.zhang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019122048.1107179-2-joakim.zhang@cixtech.com>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 19 Oct 2026 20:20:45 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add the DT binding for the Cadence I2S-SC controller integrated in
> the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
> controller supporting standard I2S, left/right-justified and DSP
> formats, plus TDM operation with up to 16 slots.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,sky1-i2s-sc.yaml       | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


