Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC42D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVSE01m15S0lW6ejbGYjxqx5xjX2hcGc8bWeo8Y5qhI=; b=Em16khevIUPK3gRhjLRo9TylnP
	DAHM+nR9uNhfE53MNwpEPalk38TZ/21HwM9Wu2PJuTJOU4vCd06H+cS3Q4UbR/bJ7PqcbrCMXsFeU
	Jk171+O5vL/mR4Z+QDcLoVlChwgvhfJUlI2h2JEwuEQMh9UXSY1Z6nvXAfPegnfpWfRu6sze1tBaN
	AoJeUir/sp/iUrFveATr+MMh/vzm1TvuS4xlisk8iHOx1GJJKv724ADWYad9WK2C2nF1/TT6b/CYX
	FI6ND/QSJUE29L95pt1AOmTF4NgnbNSIa/hbVR7rrkvslrhqsvWdslCbU2H8gZl8sFpDNCmA/G49Q
	Ri7Izp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9O79-0000000AWqr-2M8b;
	Fri, 08 Nov 2024 12:29:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9O4j-0000000AWH3-0Fjt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 12:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65B865C541B;
	Fri,  8 Nov 2024 12:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE97C4CECD;
	Fri,  8 Nov 2024 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731068811;
	bh=LE5ViNZC097yakLUhcdt/2Wuhu+SiSGw5zfIBA0XZD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJVlOg6CB9NqZpkXXZWGGcE3xtciRj+3e9/6HOJDc/uN+fGb14cuq6eovzph8pA/y
	 OkmjJNmdX3lQk56OKAeVIqGCp1iBiM95I3dV5p6DtCcH2bsB6Ll2o++rdMMvrZNo0o
	 FCdAD9FaqEJNDpXPW1NoCdTswVTUbOxO5vTzaqC6r6IfrSTvibhQt9tk8SeGc/MhCe
	 x+2RtXnmW0c47VR3F72rr+M6i+r58uhBu6OIc7SM24V9Z8SKmuoR7CcmeAcQ6blkX0
	 furKlzwOWdP417FrJgP5ZA3BE2zAudQw/ZGFdCXziNd342imkYHmt+faIv7IBRbjVl
	 FaPGOE2NK5vLA==
Date: Fri, 8 Nov 2024 13:26:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: add stm32mp25 support for i2s
Message-ID: <vbdhp4q6ymyf6skjqblb3f77l2x6po7djhlu5zmh75tbqigaqg@hjyhyzpfklsf>
References: <20241107144712.1305638-1-olivier.moysan@foss.st.com>
 <20241107144712.1305638-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107144712.1305638-2-olivier.moysan@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_042653_166142_2E57EA02 
X-CRM114-Status: GOOD (  10.74  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Nov 07, 2024 at 03:47:11PM +0100, Olivier Moysan wrote:
> Add STM32MP25 support for STM32 I2S peripheral,
> through "st,stm32mp25-i2s" compatible.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/sound/st,stm32-i2s.yaml          | 36 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


