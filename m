Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805ADCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7hpZuYgfofdrhjchTCVySwUHHelguJs02x7Rdk3AgE=; b=VRz8zkly7XxO7YX/qwgUDzibld
	mmOKfOgw3AqZEeqfnTwcOoFBZUQGlh77pofX675wag446ybkcQezO7Q3kFPvwv4l/nsyGFUXJRAWd
	3GwoNn9sVfpwcAvNyJn9eTeX0s18xavLJ34Rdjh7qxSuv1FV8yKwE7ALzsSs1XvULLjZ7eBYGqRTP
	drIXZMcJY4C8jM27/gfQGBruCM7j5aUEv2LkTClHKrxisD+5928DlqkHngaX6qu8uet6vCQaL8GlC
	ZuPXcQQJ8Yq5MBjaQcuqA9fpNWJO66Pqnf35lMbwAHt5BlA6qf7Accdd5uj8ehPH7tkg1tSIBQci8
	EjsEoNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4Zb-00000005fqK-12cg;
	Fri, 09 Oct 2026 06:59:19 +0000
Received: from mail-m118211.qiye.163.com ([115.236.118.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4ZW-00000005foL-071Q;
	Fri, 09 Oct 2026 06:59:17 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5069e789a;
	Fri, 9 Oct 2026 14:59:05 +0800 (GMT+08:00)
Message-ID: <3bd9f6e1-c670-42f5-b2ea-2b4848e37468@rock-chips.com>
Date: Fri, 9 Oct 2026 14:59:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] PCI: rockchip: 5.0 GT/s speed discouraged by
 Rockchip
To: Geraldo Nascimento <geraldogabriel@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>
References: <cover.1781622998.git.geraldogabriel@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <cover.1781622998.git.geraldogabriel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa11f75548d03a4kunm5c17223adff550
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSRoZVhlOTx5KTxoZHUsdGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cDLPDS8AfQJiV6enNljTDbaVs83pRqqyPjzVSyPDn0THv9O+K0X69w04Y6ECaYO9MGQ6Dn1RSvFwIjN1Ls1H3KCbz6HHT6NoaSI+8cSso45CIxF/uzDASquN9AJHY2Ja50uAj9Bp/vWNLysrNFLhAVhLvtzMFEoHcxGxEFD4MzI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=C7hpZuYgfofdrhjchTCVySwUHHelguJs02x7Rdk3AgE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_235914_598188_09CA0A93 
X-CRM114-Status: GOOD (  15.36  )
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

Hi Geraldo

在 2026/06/16 星期二 23:24, Geraldo Nascimento 写道:
> Dragan Simic already had warned me of potential issues with 5.0 GT/s
> speed operation in Rockchip PCIe. However, in recent interactions
> with Shawn Lin from Rockchip it came to my attention there's grave
> danger in the unknown errata regarding 5.0 GT/s operational speed
> of their PCIe core, including data loss.
> 
> Drop all code related to 5.0 GT/s operational speed from this driver.
> 

Apologies for the very late notice that this series is still pending.
FWIW,
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Endpoint Mode driver was not tested.
> 
> Changes in v7:
> - In pcie-rockchip.c (PATCH 3) drop unreachable code
> - Link to v6: https://lore.kernel.org/all/cover.1781207474.git.geraldogabriel@gmail.com/T/
> 
> Changes in v6:
> - Squashed patches 3 & 4 together as suggested by Mani
> - More formal warning message as suggested by Dragan
> - Set the 2.5 GT/s bit regardless of if link-speed is set to 2
> - Link to v5: https://lore.kernel.org/all/cover.1772239598.git.geraldogabriel@gmail.com/T/
> 
> Changes in v5:
> - Changed commit order to not break builds and adjusted copy pasted
>    commit message. (thanks Charalampos!)
> - Reintroduced behavior to force 2.5 GT/s in case there's something
>    non-default in the DT. (thanks Dragan!)
> - Link to v4: https://lore.kernel.org/linux-rockchip/cover.1772169998.git.geraldogabriel@gmail.com/T/
> 
> Changes in v4:
> - Incorporate suggestion by Bjorn and refined by Dragan to drop the
>    "catastrophic" code
> - Link to v3: https://lore.kernel.org/linux-rockchip/cover.1772057799.git.geraldogabriel@gmail.com/T/
> 
> Changes in v3:
> - Clarify warning message even though Rockchip won't disclose details
> - Drop DT changes as they were applied as subset by Heiko
> - Link to v2: https://lore.kernel.org/all/cover.1763415705.git.geraldogabriel@gmail.com/T/
> 
> Changes in v2:
> - hard limit to 2.5 GT/s, not just warn
> - add Reported-by: and Reviewed-by: Dragan Simic
> - remove redundant declaration of max-link-speed from helios64 dts
> - fix Link: of helios64 patch
> - simplify RC mode comment
> - Link to v1: https://lore.kernel.org/all/aRhR79u5BPtRRFw3@geday/T/
> 
> Geraldo Nascimento (3):
>    PCI: rockchip-ep: do not attempt 5.0 GT/s retraining
>    PCI: rockchip-host: do not attempt 5.0 GT/s retraining
>    PCI: rockchip: drive at 2.5 GT/s, error other speeds
> 
>   drivers/pci/controller/pcie-rockchip-ep.c   | 13 -------------
>   drivers/pci/controller/pcie-rockchip-host.c | 20 --------------------
>   drivers/pci/controller/pcie-rockchip.c      | 14 ++++++--------
>   drivers/pci/controller/pcie-rockchip.h      |  3 ---
>   4 files changed, 6 insertions(+), 44 deletions(-)
> 


