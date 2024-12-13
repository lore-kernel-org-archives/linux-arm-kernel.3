Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4C5E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDgREbSUzQmLdhmkynanAv1+cQFPmmOlAOIJInXPqbI=; b=trnwLI3rCjTijv4rhstXz1Uu2r
	+wbmYBMxfMD0cofIsSexHkHpuim/W9FhXC9Tkkp5MROC4tW4gcBCXvEEr6Hsh6zuypuBZy1Dlgo+K
	7IKXjwU7cwWz+w+YjmGQa2Gnx7umi0sq41pHxELtuOjek3UgOdtB12DNnHWHXdkbaFPVm4m11BNed
	nbqls5YUfQTaWCgpsLFmB9V4VVGVwdY9XAS701Sd+C93fZ+vDxZ+5Z/CplpjZX+s42c3ocI2LN7RJ
	OrWW/vljRn/oTHR0xdaLdSoLvq0fk3Z+BrZ97lNokESrYqvct0Uu7wGiF/JJQyWn6Ec09nQnbTn+u
	VQr2LHpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2EY-00000003J3m-1zNm;
	Fri, 13 Dec 2024 09:45:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2Bd-00000003IVh-2Gqb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:42:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A92E45C62B2;
	Fri, 13 Dec 2024 09:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E4DC4CED0;
	Fri, 13 Dec 2024 09:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734082936;
	bh=++bhXlD9Y7I5XHvBU93y5RbnTsWThKKRO/NBUtN7RhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+ggrJGbh8WNoUrxYl6GHuDtRMflrlTKIiKD4tKOzvcS2g9SJInRK698lYvhUVeGb
	 EgczYJPPbg23J8BurEC0ZSp9z5DEjG8AIADfXygLsLX3ynxNkXMdCu2ADMynvX7R2Z
	 huv/FCOPgcg+bUZmZqoL977JQX1+nfgZfSyW07yAFXgQJhQWjCUiI3disR4RVeqbkv
	 bVDj/7fmWzrVcg2xuYeuexsoC/J+wbAh4a1i3HTPal62NbKuaWinnb3GMQGobg1gjL
	 K2OkbKS64+Ywa4hQ80ylj9sGM3lKBedeVAs5dCnyGn8awlEn6EdpGW1I3ndWGoaqRi
	 9yxZqSJgfhjgA==
Date: Fri, 13 Dec 2024 10:42:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	kernel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>
Subject: Re: [PATCH stm32-next 1/2] dt-bindings: arm: stm32: add compatible
 strings for Linux Automation GmbH LXA FairyTux 2
Message-ID: <h5gcnt6g5py4shyjpxlr77njkihwepdrn62poii6vyoyvwximv@fmb4becmsvwq>
References: <20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de>
 <20241210-lxa-fairytux-v1-1-9aea01cdb83e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241210-lxa-fairytux-v1-1-9aea01cdb83e@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_014217_620786_E37FAA65 
X-CRM114-Status: GOOD (  11.54  )
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

On Tue, Dec 10, 2024 at 10:32:27AM +0100, Marc Kleine-Budde wrote:
> From: Leonard G=C3=B6hrs <l.goehrs@pengutronix.de>
>=20
> The Linux Automation GmbH FairyTux2 is a small Linux device based on
> an Octavo Systems OSD32MP153c SiP, that occupies just two slots on a
> DIN rail.
>=20
> Add compatible for the generation 1 and 2 based on the STM32MP153c.
>=20
> Signed-off-by: Leonard G=C3=B6hrs <l.goehrs@pengutronix.de>
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


