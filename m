Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3496606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wvFm/S4y;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUw4tJON
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v358HEhOlmBDuVPDB7wDI9WRAFH4nBpagPV3eCkU2/U=; b=wvFm/S4yNZaIWk
	A3nw8oldxlcZXNqn5xFTPJf3KpQ5kfcRIqPXRYk9m5anWBJfmBNTRlwtthFtqhYM/AVemGQO8FVcs
	aG/D0dEg8gHyVIjWCLpk6eQ+akIXGZJNcj3swV403QEvVfzGk/XN/jVwkqNmWU3vF3HpL9/7fGLcE
	EwcIJuNDly75poiO7byZP82+q0OXK20/Z7Z3X48Z+eHVPhH7yMLkZtkC/GgBQyS0E15LJjR8rN2SB
	P7EsEb0/9Yhm0BDxTpskWrufZo1BrFJsK4vaCvnr3BScH2pA3oO7IQ++nzlte1OOw5N2eXTnoN/CO
	52idAMETopN6AcQoUz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRq6-00000003GP5-3SSl;
	Mon, 26 Oct 2026 21:02:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRq5-00000003GOc-1Bm7;
	Mon, 26 Oct 2026 21:02:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E834F436C8;
	Mon, 26 Oct 2026 21:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6791F01825;
	Mon, 26 Oct 2026 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793048560;
	bh=v358HEhOlmBDuVPDB7wDI9WRAFH4nBpagPV3eCkU2/U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XUw4tJONe4g8PLwoFuRLxJoUZxFxGq6F2n/k53iHgcdPwP5Z+JgqVNJb+6EqhZngi
	 EiBaSMmzjYf5ndm8Nj8sIZzjNHqiPFI35g2RTZVerwjo4lb+SzY1fs0rZOOD3ortey
	 ctdtcaK6FTozfHodP4mje2y9Juj87pDeC2a2wZZCTeG0Be+1g/jKG4BgyarHi1aAln
	 y9ECIly7XIyzOMeqfShcMAy/QF82oADXSJ4wVufvqJDnzzojBpqTrFLbaNb9awHiur
	 hZukemHAVM21Z7Zszt+kadQcDVhuPTvxK8bXfBy3KumFcl6QjBz8mTaZggVUCW/Xb+
	 jB3snI5IW5gyw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9AE551F289D4;
	Mon, 26 Oct 2026 21:02:27 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec
 driver
From: Mark Brown <broonie@kernel.org>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
Date: Mon, 26 Oct 2026 21:02:26 +0000
Message-Id: <179304854619.199157.2693374514232344592.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=591; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cqCG7i2KkY1qhKb0vz9axhgwtlpKCIFLBV1xu14ZY0E=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLu73/cV3RV+ql6TtKlM74fWNw4a7yu3fp9YULKho+Sx
 4MWPvsm3FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJZOUx/M+M3cEpf3dK1fOf
 pQanquU+LKr+62m4denzvSpFjw51JX9k+O8ucfR+blMf79cnVwuidzXvteqaHP6rRjMvYdN2P9k
 p8cwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The S4 requires additional clock control bits to be turn on while enabled.
> The S4 has 8 TDM lanes, instead of 4 on previous SoC.
> Update the widget accordingly.

> +#define CTRL0_BCLK_ENABLE_SHIFT		30
> +#define CTRL0_MCLK_ENABLE_SHIFT		29

Should these have a _S4 suffix?

>  
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),

Should this have a custom mux for S4, it looks like the register bits
are different, a shift of 19 for S4.

-- 
Mark Brown <broonie@kernel.org>

