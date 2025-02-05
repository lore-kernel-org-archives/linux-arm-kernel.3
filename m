Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D260C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 10:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaj2hF5PJOQtH2xPQWCRpX95tOHDhHY5WQHstGrnojw=; b=GFufvkB4Xgx5Re5A1tFt04RXp3
	Q2I4/OwR4eDKlO7hgScL2KoqgPPILb2jlAe33SRF+CNhzicri6dmiy1OLjWZsHVJVgN3kfegquvPR
	6XdiuNxRIvLOAeHBcX1U3T+mMnn+pYDxEW39LXWDeBwW3WA4QJfhL8us6l+Up9iO8MGBdQHTjw3ff
	22HWGygjfi8f2F1Su9y0U1EqN4wtUxsMiQdsF2DWmJOAHF52SpiDkpA84lBROGycPgZUgMgo0jh0d
	/8NM0++GXIG2PbU1ptcaf0Zz+4AX1XzJ+E7ywrlH1xycormzEk0iIeXiYc8toCyDXDREdT30gqyh5
	qJbIHAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcQU-00000002qC2-0U1v;
	Wed, 05 Feb 2025 10:14:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcIG-00000002oPH-2GFO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 10:06:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F0CA5C62AF;
	Wed,  5 Feb 2025 10:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11214C4CEE5;
	Wed,  5 Feb 2025 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738749962;
	bh=hkYngXU+6IeLPNhNvs13cKpx26XKj3YSH/OAeRpga3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qunve0YxKKubq7KmDTNg1Ed8RfUlCXKjxIzL3LUwAiVW1oCrwBK5KmsdpdmdLog6h
	 6n+BNwajJMcrhwjfhHINnbjyzOtnfW7+CXcTbMRF83YaLZpw/c17deWk5eDDDAPvos
	 Gvkcy+Mo/BdB31t1Bfg7hxlg5PW/8+JBtbOt+x83ZBTFKTonl2WC+atoe3V/1bFV76
	 KOrQk1YUV4sjzM2de+xrK7o58Y6OOy3ui3BKNW7JACcvTM1DKfrz/QaeqH+fz1cdWK
	 D2nFniznztdCTJjRskVTZBt1mIJShJ8WwchuDTQ4SUGZ5wSQ14tVKmBJU9awZ7FNJI
	 bu5WcyXuPSBIQ==
Date: Wed, 5 Feb 2025 11:05:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: memory-controllers:
 samsung,exynos4210-srom: Split out child node properties
Message-ID: <20250205-wild-classic-ringtail-98cbc2@krzk-bin>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
 <20250203-dt-lan9115-fix-v1-3-eb35389a7365@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-dt-lan9115-fix-v1-3-eb35389a7365@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_020604_619412_62F45D00 
X-CRM114-Status: GOOD (  10.72  )
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

On Mon, Feb 03, 2025 at 03:29:15PM -0600, Rob Herring (Arm) wrote:
> In order to validate devices in child nodes, the device schemas need to
> reference any child node properties. In order to do that, the properties
> for child nodes need to be included in mc-peripheral-props.yaml.
> 
> "reg: { maxItems: 1 }" was also incorrect. It's up to the device schemas
> how many reg entries they have.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/memory-controllers/exynos-srom.yaml   | 35 ----------------------
>  .../memory-controllers/mc-peripheral-props.yaml    |  1 +
>  .../samsung,exynos4210-srom-peripheral-props.yaml  | 35 ++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 35 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


