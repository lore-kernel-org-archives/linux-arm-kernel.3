Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E95CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 03:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBoDZ1xCyWp1Fvi31kaeXYzbssGhIDDXyFY4sWdg5AA=; b=miC/G6Tr9Nc37reoPBiJlR8hJZ
	qxAhSnbXGOvIOuT9FKYKLp5LqNo1bXExv40FSJqwhqFjZk+5GzcqWapRNDetngfPI/3hSK32R7Qw4
	4uvhQ1SURNQQHwX7ceYLWR6OyPZuK9SLcfNWywqIarpLGnGn8nTJeVQljyH0qRkrlGkXCr7aCjkCS
	LeLbfDgbpoRUU+2pt3D+8JuUAAMN5SM5/rChEc9gI2u/ZAsV9Qi9um8v/oQBlFFaW0Zdy1pp4fhRQ
	FWdCjTkXb8aghwkJwDxFBhRgh1V5lVeDVR2bISdz11lM2gL7bwY357Ii7YlH+VUg73yyObF2X0mYt
	RsZmEUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPY3u-00000003R8R-1ctU;
	Wed, 20 May 2026 03:57:38 +0000
Received: from mail.tkos.co.il ([84.110.109.230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPY3q-00000003R79-2a7A;
	Wed, 20 May 2026 03:57:37 +0000
Received: from localhost (unknown [10.0.8.3])
	by mail.tkos.co.il (Postfix) with ESMTP id 957194409AD;
	Wed, 20 May 2026 06:56:49 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1779249409;
	bh=YC8qRmmq/k5/5b+peTPbFAaVZ53DEJFUcvpKg8iJ8D0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MHej4Fj1FJgII7Koo1w9p39t/AcGgi3ic/5vxuoHwkYugHM1Oiih6eWT6ppN5uRW2
	 5w9/R5hGThaZCG/Mc1UEZ5gVsFCYO4MWcWBFVorxGEgvYmhiRWAioaXaKjVlX13MM3
	 cPDw3IFL/+CzOY/5Io1HAETefykV6RK1Ghsm+HYijcbg50c+CSHtIVUkvaZR6E6RYo
	 hAv0c36WMHNrik4cUkmHTUVWIv3CB21kQgc3E69hTiJKGMMkmapwUrQsf7mlE/9wBM
	 B0t8PQhTsYCiaRqy9LGPJyb7MLNA2VZc2AEE9WjvKIpMPi8wvotaOIfhBEuI8KPsWy
	 2skZqm2MYBWlg==
From: Baruch Siach <baruch@tkos.co.il>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Brian Masney <bmasney@redhat.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Vinod Koul <vkoul@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Lorenzo Bianconi
 <lorenzo@kernel.org>,  Felix Fietkau <nbd@nbd.name>,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-phy@lists.infradead.org
Subject: Re: [PATCH v7 5/6] phy: move and rename Airoha PCIe PHY driver to
 dedicated directory
In-Reply-To: <20260519220813.28468-6-ansuelsmth@gmail.com> (Christian
	Marangi's message of "Wed, 20 May 2026 00:08:10 +0200")
References: <20260519220813.28468-1-ansuelsmth@gmail.com>
	<20260519220813.28468-6-ansuelsmth@gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Wed, 20 May 2026 06:57:25 +0300
Message-ID: <87a4tuu40q.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_205735_163861_92424C7B 
X-CRM114-Status: GOOD (  14.50  )
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

Hi Christian,

On Wed, May 20 2026, Christian Marangi wrote:
> To keep the generic PHY directory tidy, move the PCIe PHY driver for
> Airoha AN7581 SoC to a dedicated directory.
>
> Also rename the driver and add the relevant SoC name to the .c and .h
> file in preparation for support of PCIe and USB PHY driver for Airoha
> AN7583 SoC that use a completely different implementation and
> calibration for PHYs and will have their own dedicated drivers.
>
> The rename permits to better identify the specific usage of the driver
> in the future once the airoha PHY directory will have multiple driver
> for multiple SoC.
>
> The config is changed from PHY_AIROHA_PCIE to PHY_AIROHA_AN7581_PCIE.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  MAINTAINERS                               |    4 +-
>  drivers/phy/Kconfig                       |   11 +-
>  drivers/phy/Makefile                      |    4 +-
>  drivers/phy/airoha/Kconfig                |   13 +
>  drivers/phy/airoha/Makefile               |    3 +
>  drivers/phy/airoha/phy-an7581-pcie-regs.h |  494 ++++++++
>  drivers/phy/airoha/phy-an7581-pcie.c      | 1290 +++++++++++++++++++++

This patch creates a .c file under drivers/phy/airoha/, but doesn't remove
the existing file under drivers/phy/.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

