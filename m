Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5E9CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9daZsmkCHyLMqWnxfPdS+fBOe38v3SYe3uP4fnwIYU=; b=VtZxePf+dENFqGxjn+60KCdtaw
	DxsvCPH5ARym1ISnAon2qIbQQ/ZPkrDX/qN+luK5dQSUPYvJ7Kn8O8+vy+OzYBds952pRml8GSjPa
	dLFsiitKmV3sKc8oVYuLOKw9umkP8P2wJzhgt8TuWMCYiwuIwq6p/jzfsr5sspi7Z4OLNLBxEFRyP
	jVkr4dIkIfh4FhS53X8XpfMrr/atLy02v7Q1MyXkfEMjLaGpBkSEhCFYLZ7jH490PoEWIqV/SQHGb
	PIayvE/ngNInDpLKrfUBirVAXdtnmqXFzFKsm8KYzfacsEDY87p4BnuQscKWJlNKBgICKK2D5RWj5
	qC+qwg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7EB1-00000008hEU-1NTV;
	Fri, 10 Oct 2025 14:32:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7EAy-00000008hE5-1oEk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 14:32:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0117344744;
	Fri, 10 Oct 2025 14:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED75C4CEF1;
	Fri, 10 Oct 2025 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760106775;
	bh=T+LRS+QiugIh4I2/N14G4GgJQJfwQzir1ldoMUFkfQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ae0M31rdci3aj6qUaCrf/DOdMKMknXBkNkP5tIQEF0xiq05gWmp8FEoP7XxXQlK7G
	 bO5nmWAj6TwciNjW006Q2Ai8Es2lNlQfhzME0fwVnjkqAACxqRAovNT8pedYIw5W1z
	 Dyl3ZDKmzfJTFbBzKpC4M1cBxDBkD3avOlWm/BbMNndVRpha8+iC/kvC5VP5+vjlTC
	 9UlBnZycnqYcwbGZMuy6qghXRPAVFtdj0erNhMCISRQptl+FzTPCNuCKRLK5FSUPl+
	 a9s3650zvUXziCPlY29NvhTMb5jbqGc6dc/7CTIg1yKXol3HvYYdAmF+r5NAHveqlZ
	 Gxv8r5jB1uVKQ==
Date: Fri, 10 Oct 2025 09:32:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
Message-ID: <176010677341.249054.11003330189373181817.robh@kernel.org>
References: <20251007135738.487694-1-shgarg@nvidia.com>
 <20251007135738.487694-2-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007135738.487694-2-shgarg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_073256_738474_404AC41F 
X-CRM114-Status: GOOD (  13.61  )
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


On Tue, 07 Oct 2025 13:57:35 +0000, Shubhi Garg wrote:
> Add device tree bindings for NVIDIA VRS (Voltage Regulator Specification)
> RTC device. NVIDIA VRS is a Power Management IC (PMIC) that implements a
> power sequencing solution with I2C interface. The device includes RTC
> which provides functionality to get/set system time, retain system
> time across boot, wake system from suspend and shutdown state.
> 
> Supported platforms:
> - NVIDIA Jetson AGX Orin Developer Kit
> - NVIDIA IGX Orin Development Kit
> - NVIDIA Jetson Orin NX Developer Kit
> - NVIDIA Jetson Orin Nano Developer Kit
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v7:
> - dt binding file name fix to keep same as compatible
> 
> v6:
> - compatible name fixes to "nvidia,vrs-10"
> - changed dtb node name to pmic@3c
> 
> v5:
> - moved device tree bindings from mfd to rtc
> - changed dtb node name to rtc@3c
> - changed compatible string to "nvidia,vrs10-rtc"
> 
> v4:
> - no changes
> 
> v3:
> - fixed device tree node name to generic "pmic@3c"
> - fixed indentation
> 
> v2:
> - fixed copyrights
> - updated description with RTC information
> - added status node in dtb node example
> 
>  .../bindings/rtc/nvidia,vrs-10.yaml           | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


