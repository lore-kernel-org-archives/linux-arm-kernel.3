Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA36CA0EF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xibftz/ljx5r1EJKeItkXmhjnIndJ2ZdhbnDLI3LgQs=; b=WymapMYNq/i872x9l6I+j+kSpg
	KtUzpsFT0gyaTHVlF7sN1PXbZqJnEPiG+6dTi/uAsfQUpOEm/5yW5w/ICP8STXrA3O5+n3A2kA/10
	PeonKae5hkLY/MRw2RI0j+Mf+YuhehZFpCzxbnDdjCU11MWHFxju6Ol/pTbPS5bL9MpghfPI2DgQP
	PH6MJ6YCHtSczozB8nyKrL82TKYPSwwUl3cJhguMQV/Z7uQso62jXaznYghuoEf3WUrTi4KtoGDB9
	FPpZqujFukStTxkJ+8sH2hTbNjF4JRRMLaS7u6fiOeKSyepudXlkaO9pzBuOnVpaI0n9MS96PCM1P
	2rETy+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV1j-0000000BkYt-0psS;
	Tue, 19 Aug 2025 22:41:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNg8-0000000Ao0V-1UDN;
	Tue, 19 Aug 2025 14:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C669060209;
	Tue, 19 Aug 2025 14:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65888C113D0;
	Tue, 19 Aug 2025 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755615071;
	bh=Semh9vh6H26pGxI4SeIgYYwW2rQqCSzaKGfXow3uekg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AhmxpjrCi5Uiw+pSebpXvR0j7wId/VxhsnbpudwSHuSzKTtEpDF2S0C+UkFs9IzV+
	 lV16LMp8+jVpqfIORdL2Y+kwaBgqQCMK4silBvtsg6cew6vABb8k6/3j493js7v9MT
	 09Ay7rJ77H9C2ZGPxTntJIT7WlwX7Tvj/E63cCk73Rq5vlYiItgmzi9FeUgdnp/7Lr
	 RvM+kPPY7tmZrSZZpUg8dawKe+Ng82wq5ZS9W5aNfO4oKexiNBKCjErbQplrEpgnB2
	 hi6a5fMA9xspM0fOEJH7Klmdd2g5Km+2iyZ1Sea2vV1rodJ3DPrrOGfaXorbDpfcq/
	 XBsTCrfyqL7ew==
Date: Tue, 19 Aug 2025 20:21:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/3] PCI: brcmstb: Add 74110a0 SoC configuration
Message-ID: <wxrnpfu7ofpvrwxxiyj4am73xcruooc4kaii2zgziqs4qbwhgj@7t3txfwl24tu>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703215314.3971473-1-james.quinlan@broadcom.com>
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

On Thu, Jul 03, 2025 at 05:53:10PM GMT, Jim Quinlan wrote:
> This series enables a new SoC to run with the existing Brcm STB PCIe
> driver.  Previous chips all required that an inbound window have a size
> that is a power of two; this chip, and next generations chips like it, can
> have windows of any reasonable size.
> 
> Note: This series must follow the commits of two previous and pending
>       series [1,2].
> 
> [1] https://lore.kernel.org/linux-pci/20250613220843.698227-1-james.quinlan@broadcom.com/
> [2] https://lore.kernel.org/linux-pci/20250609221710.10315-1-james.quinlan@broadcom.com/

Have you considered my comment on this series?
https://lore.kernel.org/linux-pci/a2ebnh3hmcbd5zr545cwu7bcbv6xbhvv7qnsjzovqbkar5apak@kviufeyk5ssr/

- Mani

-- 
மணிவண்ணன் சதாசிவம்

