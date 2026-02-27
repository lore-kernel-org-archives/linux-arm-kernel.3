Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E994FEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 16:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hg3ftxRVP2o0Fqsn83GKQdV8U57RiZh6rSnr3Ja80i4=; b=2THpjLaqty5SUz3KgWfls/DALY
	mIN573feVAiEDKVlCjC3l5V6btH8ruUdnbZd3itHfLhQeh3axue6kXbx9Fq1viFFjlOkXG6ZMdNgg
	kEd1gpYThnSQQV5vyW7riu2q6If9ojEmhgpPw8DYrg+Af6dTyJkdFcEps5UeWg/xW53nuX3uC5tu9
	ElhIrAP8deQDxQ1COctvaPEpehl/+tmttHhXF1PumMq9vly98aRk1AA8LFRyAr2eAq2Wg2K2CPGIY
	s9FXiVqye3n8WvgD+hzmit7gb40xNOwaOvV8BfOq7jm0FsZdRQfJM02dzew8QdBZoZHLoOcH4RVD5
	cPPlqz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw15S-00000008lBX-1Xf2;
	Fri, 27 Feb 2026 16:53:10 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw15P-00000008lAa-3P0c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 16:53:09 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 9DFEF240027
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 17:53:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1772211181; bh=hg3ftxRVP2o0Fqsn83GKQdV8U57RiZh6rSnr3Ja80i4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=iYv35PHXitvDLrydbkqRnuU71kNKDdIuRJq1NUqBWYwWJQ7Hc0nR4WON/ET8eZ/r0
	 +gWF/6fphL7evBjX5Sj4tRPGOGyiTVGaZjplx39iaVCF/7v3qDlt5rXw+5oTxgbkvJ
	 uvPS0wsOxuDMlva7/s1qp1y+4/DSzdJETVFRM6fwu5stvWWpcvb6MnooOMGdFCaIP9
	 2vdIiOipCDLFJQRU3ui4Q9QZwXkbWMSYehB+kMYe8Yggi+PEfADKczU5spZpeBBM/N
	 wAmDFB1/SOLdQMbTIug6QOVLKlieRGM774H50lxaSBvZaeC3SJc1As6NL8gTUUm7q/
	 rh0rc8KD1EILg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fMvX95LGlz6txq;
	Fri, 27 Feb 2026 17:52:57 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,  Lorenzo Pieralisi
 <lpieralisi@kernel.org>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
  Manivannan Sadhasivam <mani@kernel.org>,  Rob Herring <robh@kernel.org>,
  Bjorn Helgaas <bhelgaas@google.com>,  Heiko Stuebner <heiko@sntech.de>,
  Dragan Simic <dsimic@manjaro.org>,  linux-rockchip@lists.infradead.org,
  linux-pci@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: rockchip: drop 2.5 GT/s defines
In-Reply-To: <5172389ba8d291fe05bc0887bc97fe73f110c5c0.1772169998.git.geraldogabriel@gmail.com>
References: <cover.1772169998.git.geraldogabriel@gmail.com>
	<5172389ba8d291fe05bc0887bc97fe73f110c5c0.1772169998.git.geraldogabriel@gmail.com>
Date: Fri, 27 Feb 2026 16:53:00 +0000
Message-ID: <878qceku1j.fsf@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_085308_151842_CF6C64DC 
X-CRM114-Status: GOOD (  18.06  )
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

Geraldo Nascimento <geraldogabriel@gmail.com> writes:

> Drop the 2.5 GT/s Link Speed defines from Rockchip PCIe header
> definitions. The reason is that Shawn Lin from Rockchip has
> reiterated that there may be danger of "catastrophic failure"
> in using their PCIe with 5.0 GT/s speeds.
>
> While Rockchip has done so informally without issuing a proper
> errata, and the particulars are thus unknown, this may cause
> data loss or worse.
>
> This change is corroborated by RK3399 official datasheet [1], which
> states maximum link speed for this platform is 2.5 GT/s.
>
> [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
>
> Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
> Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> Cc: stable@vger.kernel.org
> Reported-by: Dragan Simic <dsimic@manjaro.org>
> Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> index 3e82a69b9c00..b5da15601b58 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -42,7 +42,6 @@
>  #define   PCIE_CLIENT_MODE_RC			HWORD_SET_BIT(0x0040)
>  #define   PCIE_CLIENT_MODE_EP			HWORD_CLR_BIT(0x0040)
>  #define   PCIE_CLIENT_GEN_SEL_1			HWORD_CLR_BIT(0x0080)
> -#define   PCIE_CLIENT_GEN_SEL_2			HWORD_SET_BIT(0x0080)

This commit alone won't compile right? PCIE_CLIENT_GEN_SEL_2 is still
referenced by rockchip_pcie_init_port():

         if (rockchip->link_gen == 2)
                 rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_2,
                                     PCIE_CLIENT_CONFIG);

This reference is removed by the next patch in the series but not sure
if we want to do it here instead.

>  #define PCIE_CLIENT_LEGACY_INT_CTRL	(PCIE_CLIENT_BASE + 0x0c)
>  #define   PCIE_CLIENT_INT_IN_ASSERT		HWORD_SET_BIT(0x0002)
>  #define   PCIE_CLIENT_INT_IN_DEASSERT		HWORD_CLR_BIT(0x0002)
> @@ -197,8 +196,6 @@
>  	(((x) & PCIE_CORE_PL_CONF_LS_MASK) == PCIE_CORE_PL_CONF_LS_READY)
>  #define PCIE_LINK_UP(x) \
>  	(((x) & PCIE_CLIENT_LINK_STATUS_MASK) == PCIE_CLIENT_LINK_STATUS_UP)
> -#define PCIE_LINK_IS_GEN2(x) \
> -	(((x) & PCIE_CORE_PL_CONF_SPEED_MASK) == PCIE_CORE_PL_CONF_SPEED_5G)

Same for this, references elsewhere tho.

>  
>  #define RC_REGION_0_ADDR_TRANS_H		0x00000000
>  #define RC_REGION_0_ADDR_TRANS_L		0x00000000

