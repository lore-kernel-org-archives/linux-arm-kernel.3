Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA35C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 20:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NZunTCfGj3/9fwiLPX4VVecAWjO4p91vdh24q/vCI8=; b=PoaNn7CzJbcENEnK8xXQ79OjLu
	CMEMV1zgpkobeV65KC72OWt6eFBfe6urQ0LctZqsf6jyyV/Roh8g6uDXtdpMnDK7VveXFeKclU1SX
	46OsDkjbiapRQkqQrHolPwF5kBnH9RLpcPJE9PLhHmkX1ycSJai/C+67r+tGuixoZcA+J3L4qv2mN
	NqbQ+k8qV5R3NdgCg1mjKy/yX88ejwOdJPB/8ZpXJyd1BOGUAWVxdevPs9bQPWaIizAfZ0Z0I/gVH
	yjNiMJl4exzic5jZRimfuXsh3+ZucbuKrXTmhMsNto1CCNtYd2LjGpwoIJJz82Haiuz79/UmFopWl
	950+yV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTqT-0000000E6yJ-2x8y;
	Tue, 20 May 2025 20:45:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHToH-0000000E6T8-0ky5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 20:43:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 599F75C5AA2;
	Tue, 20 May 2025 20:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E35C4CEE9;
	Tue, 20 May 2025 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747773816;
	bh=QKRukmbuEwwuWzb3b6AjUBX0NaLEkAeTqogcvnWc3BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fYQmjl10u8d+o/qHPxX+Z4MEajH6bpHF2ohSk/NMgfeyJ5W5YUMRkuFGZjq/d0jsx
	 BaG0g/U2ABvNahgnQkduP/YtmH25pTyvP7MW/rqC0N8a5r01uuYJ0bsgP71CUbd45o
	 dSBdU9zjTGvwXGTJqqKmGtOlW4OTSbwBVx3tsTKrhmPESN0Pr9xBKrrdf4j2o8NpJC
	 nm4LNnLsxDAiZkg3dmhPe0NVMch4yJadifVjnodGrZuvk50Y92jkjqRGEMj0HNJqN8
	 vsNcIC94Lfy1pUknXFU9sxrXGI95oXCzy6czSad81gv8n6YlT8qYoWlImEAE1gXGtI
	 1R1MsPbymYs0Q==
Date: Tue, 20 May 2025 15:43:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <174777381319.1323810.4064448957148847478.robh@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_134337_262379_4B5E92EA 
X-CRM114-Status: GOOD (  15.86  )
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


On Tue, 13 May 2025 19:47:54 +0200, Lorenzo Pieralisi wrote:
> The GICv5 interrupt controller architecture is composed of:
> 
> - one or more Interrupt Routing Service (IRS)
> - zero or more Interrupt Translation Service (ITS)
> - zero or more Interrupt Wire Bridge (IWB)
> 
> Describe a GICv5 implementation by specifying a top level node
> corresponding to the GICv5 system component.
> 
> IRS nodes are added as GICv5 system component children.
> 
> An ITS is associated with an IRS so ITS nodes are described
> as IRS children - use the hierarchy explicitly in the device
> tree to define the association.
> 
> IWB nodes are described as a separate schema.
> 
> An IWB is connected to a single ITS, the connection is made explicit
> through the msi-parent property and therefore is not required to be
> explicit through a parent-child relationship in the device tree.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  .../interrupt-controller/arm,gic-v5-iwb.yaml       |  78 ++++++++
>  .../bindings/interrupt-controller/arm,gic-v5.yaml  | 202 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  3 files changed, 287 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


