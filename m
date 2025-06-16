Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D675C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtvnbND1VpwP+vkOOV4oU/HViyDYooXx2VMwGg0jO5s=; b=ZcgIF14C8gEjmZPjJKphs9RwB1
	NYpdsn/R2aG0xlAE9q0W2IDy/xQk3H3xBIZzPDUfumoCrTX5FOLAmQzZgv1CHdxJ5esG1Ww/ISRrg
	sUkfojW9x5/7UEQ/OdVvuV5Ia2eRBsKAzzgnuIqjANYJz7U/FzifBXE7dXRk3H5+i16wKNSCfhAa9
	X9IBPHTg9OSjDrDD0zYUBPfrHPeLRGuoPl4FsuEg25h8r76W+UKLrC1/bSjmecdXpEl2KhfDxyyQL
	AYqmRLEQxnkqdwDydcJOLhkexL1nASz6gu441ujXu9xCpoFjdVlr3qHcErU4SJUL/8gurPMi4TSk6
	C/xZj2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREag-00000005Eth-3qGE;
	Mon, 16 Jun 2025 18:29:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDgn-0000000584P-0OaE;
	Mon, 16 Jun 2025 17:32:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74A8D4A692;
	Mon, 16 Jun 2025 17:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368DFC4CEF0;
	Mon, 16 Jun 2025 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750095128;
	bh=H41Dos4nuiBHHj2x24i5YJjmevLAfJf6MRT1WONU3aA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eKztQNF46WfPuiW035B/qC/7nvwIbGDsISPHoB+LkJ1AUqHAXaluUuzLu9K0x+TdI
	 zqg39Ssuy44lknWcwPe+uJd+/XeiJ5VLW2bQTzhZyukICbKBALUlwTvq7QGOakWlFI
	 mGxO0DcO+dHY0ifk3x1XuC1oAj8rFv4RxJqoc7jv0kRp83EfHxul8OkXXJR0nLWfwR
	 VAbt0bkZGRPS9euMoAK2d3GpOleLxX1mDqAkmbAm/H/LqorWLFupDiwBBzAsU3lr9s
	 W1hYmR3ZHgd85PSMhqPcsOUffgB3OwTPEeHO7ssapp9mg6iPl/b2F5mLlBLNm4B8US
	 4TnoxFWH2lSQg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, sjakhade@cadence.com, rogerq@kernel.org, 
 christophe.jaillet@wanadoo.fr, u.kleine-koenig@baylibre.com, 
 eballetb@redhat.com, make24@iscas.ac.cn, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srk@ti.com
In-Reply-To: <20250616064705.3225758-1-s-vadapalli@ti.com>
References: <20250616064705.3225758-1-s-vadapalli@ti.com>
Subject: Re: [PATCH v4 0/2] Enable PCIe Multilink and USB support in
 Cadence Torrent SERDES driver
Message-Id: <175009512484.77433.7332008040409961551.b4-ty@kernel.org>
Date: Mon, 16 Jun 2025 23:02:04 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_103209_156923_ABCCA190 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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


On Mon, 16 Jun 2025 12:17:03 +0530, Siddharth Vadapalli wrote:
> This series adds support for standalone PCIe Multilink configuration
> along with the support for PCIe Multilink + USB configuration in the
> Torrent SERDES driver.
> 
> Series is based on linux-next tagged next-20250616.
> 
> v3:
> https://lore.kernel.org/r/20250109121614.754466-1-s-vadapalli@ti.com/
> Changes since v3:
> - Rebased series on next-20250616.
> - Collected Reviewed-by tags from:
>   Roger Quadros <rogerq@kernel.org>
> 
> [...]

Applied, thanks!

[1/2] phy: cadence-torrent: Add PCIe multilink configuration for 100 MHz refclk
      commit: 240ef19ad78b12e40ec8808694a0b81e6a3a2c2d
[2/2] phy: cadence-torrent: Add PCIe multilink + USB with same SSC register config for 100 MHz refclk
      commit: 351e07e6b2ecc16ef8669713b14b6f67518c945d

Best regards,
-- 
~Vinod



