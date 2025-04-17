Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF83C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 07:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/zsMg+TstwQ8xdiGJA3xZYATc36TalvfAecRlyVmZs=; b=a+aFG6xkFxd9XvL+LAizAGivVG
	u9y0+fc0kJT7C+X2uMM7ON1FJNCxUYd/YYn33co/07mYloi+zliAI5xGL1u6vfiovFGWFFkI2aJxo
	s89RUNVIoFdEP6YYVkNtShV85deQ3/WnlId8z+Sw9TUN/tOxSt2AIZkKi4ULlfHFlE4PMUjFe4FpO
	F5iqAL9L4fnd7e09y9WmuZZ58leC6fq5gMif5ViRbzxYaOa/fEhBCS1ovBFOxVjvYOG9IqIiD6Wsn
	Qk5lR7HI+Mfzw7/u3hoZESmI28scw9ZZtZIpA9AKeKKeMOo38EYVC0BZ7hNpdZ5EVbm0ASlcxP5WG
	8jra7mkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JLQ-0000000C1yH-0OX4;
	Thu, 17 Apr 2025 07:07:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JIu-0000000C1K8-2cSH;
	Thu, 17 Apr 2025 07:04:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4EECCA4B19E;
	Thu, 17 Apr 2025 06:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE57C4CEE4;
	Thu, 17 Apr 2025 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744873495;
	bh=A1UXWE3ilQY9BEMls0KvjFVXoarU66FDUevVVhE2dx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XIwTodbBMR171TZ4AX8MxpAiVF4LBuFV++eunfuyLDo2jIZl1zpE5f4KhmHssGfLC
	 OQcWFRyNDLhjyrvxLCrUbTGEW1ae4TIKGUIkdZHEH1NoTrjwGrtue3XXw2feCYrEPI
	 LfulYwe5IAACEvI2AMz6m1mwVHEACaQgKRbvPWUVI6nuluOU3JuRSKEftCtGpNqQcp
	 nnPIZslkezsAeBIYHpTjhNklZpwxRwuaHjQkftxs+VKglhBHChG7m8SfxxYRO3aOK8
	 2KzqtRqP1C9aIPeKXiT08gJunojmUrEiCg1S9pg8zGTa7YBou++qIYu1YbmAt1xDo/
	 +HcDrKaJ0Ga1w==
Date: Thu, 17 Apr 2025 09:04:50 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, thomas.richard@bootlin.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
Message-ID: <aACoEpueUHBLjgbb@ryzen>
References: <20250416151926.140202-1-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416151926.140202-1-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_000456_730225_BDC9E558 
X-CRM114-Status: UNSURE (   8.59  )
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

Hello Hans,

On Wed, Apr 16, 2025 at 11:19:26PM +0800, Hans Zhang wrote:
> The RK3588's PCIe controller defaults to a 128-byte max payload size,
> but its hardware capability actually supports 256 bytes. This results
> in suboptimal performance with devices that support larger payloads.

Patch looks good to me, but please always reference the TRM when you can.

Before this patch:
		DevCap: MaxPayload 256 bytes
		DevCtl: MaxPayload 128 bytes


As per rk3588 TRM, section "11.4.3.8 DSP_PCIE_CAP Detail Registers Description"

DevCap is per the register description of DSP_PCIE_CAP_DEVICE_CAPABILITIES_REG,
field PCIE_CAP_MAX_PAYLOAD_SIZE.
Which claims that the value after reset is 0x1 (256B).

DevCtl is per the register description of
DSP_PCIE_CAP_DEVICE_CONTROL_DEVICE_STATUS, field PCIE_CAP_MAX_PAYLOAD_SIZE_CS.
Which claims that the reset value is 0x0 (128B).

Both of these match the values above.

As per the description of PCIE_CAP_MAX_PAYLOAD_SIZE_CS:
"Permissible values that
can be programmed are indicated by the Max_Payload_Size
Supported field (PCIE_CAP_MAX_PAYLOAD_SIZE) in the Device
Capabilities (DEVICE_CAPABILITIES_REG) register (for more
details, see section 7.5.3.3 of PCI Express Base Specification)."

So your patch looks good.

I guess I'm mostly surprised that the e.g. pci_configure_mps() does not
already set DevCtl to the max(DevCap.MPS of the host, DevCap.MPS of the
endpoint).

Apparently pci_configure_mps() only decreases MPS from the reset values?
It never increases it?


Kind regards,
Niklas

