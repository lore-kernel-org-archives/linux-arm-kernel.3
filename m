Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFC9CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvV8UMNk3qWzyPb5Uu+AntAWNc1TzMc/W+vx04AWWMs=; b=KxFLzGZOr+CJrSJ4bQP+TgFtgS
	L+DsQ9OsXl0SYyN4qbgDbdNohlb7CSFVj0CRh4C1ovrJJwLLl7tWtBoKJ1ZEFALObwV3s17FLQiZQ
	HWLZTQpo4jfAzf97fGmhd2Fkgp6THprnM6bkCejJVXZXUa796uiPXgrY2kbNRoOxjGNRTTdMLHY5Q
	jcb64dgPt3axrGpnaZp4hEBqaNH+w4LVSmqfMd0ZSlaVPWQaoA7zhhB/5dpODbJ8mZ7tcXX5w3ifT
	UEUnPqZ6S8C4hFKYfmeqmuZ81siZy22qsgLB53DPYXoxyOyp9zEM4nMPQ+FiFj3wJqv3NBPyibjuz
	1TPCxRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utop9-00000006nbO-0DNq;
	Wed, 03 Sep 2025 14:50:59 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmr0-00000006R6T-3vF1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:44:48 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C9A5514000D7;
	Wed,  3 Sep 2025 08:44:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 03 Sep 2025 08:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1756903483; x=1756989883; bh=bvV8UMNk3q
	WzyPb5Uu+AntAWNc1TzMc/W+vx04AWWMs=; b=IQlDaw1dCwrG0YDmB0LOGOAE9O
	8pQ7HVso/49lcBsyoOeA6PXKgP80I9pTHPTOprK/MTCefJhuJVrjdT7MFd0701ZR
	FkVo7/fNu/RxF9kTjC7UlYpDFDKGp147e5MCNf7qHvxqXK6P7S/YwmtrULxVLTk/
	4QbjFsAXdugBMfGC/qJs2U0Oa0PLzUyc/FmYWjAkRyVl4+qB9bwd3JYNBW8tBxlP
	W8r/+bx9THINV//EZNHzTEdwaymGQ4eX2N3fT2JXehMsBk2vm7n2ivfl+SLdwbTC
	Ccb4QflwjxwaKVgKeiM0jqM/8kAXrx1/G3I0eYGCQTpncteglKf3o9P3VTIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756903483; x=1756989883; bh=bvV8UMNk3qWzyPb5Uu+AntAWNc1TzMc/W+v
	x04AWWMs=; b=CBLEUrsHweJyv0TtxHS8jKgWGa95t7HxlT8toO+2bkXj2ZHZwxe
	ZEg9nepo2xXIJCMIbYJ95KfRLl2ILq7MFcOPUW1G87lgOAcbEavvOU/8mwGGhXBu
	ficww50d+AR75+AU+hG5DdG0MAyg7bhCqSrnrvdMRPVCKO361hOi2ME5slSEDacr
	clx9UargA616C4XYvL2VgUdtPjwUEXZhXuwjrOr4okgMaKeKznFwzgVoLI+3EyTY
	ukqSDH40XbCRaVl5cpVWK9117PHMXAmrJl/8UVgV7jC4HtpsRr8eUyfg1f1afJtB
	A1b9Etd7F901Y2LfwWz0oMjL9qvS//NqEvA==
X-ME-Sender: <xms:Ozi4aIsWmrNurFvTks3GX9gNEg8WfV77a1DhG1-QIlSAuqYAj6VGCQ>
    <xme:Ozi4aP6ImQRXyGrs_Q_POXo3X1jTTA5Y9MayIZPoiX-_GaGU-EVSJKilVaqB_UfPl
    -Vuq2LCEeN8UC5LFw>
X-ME-Received: <xmr:Ozi4aLQGBsfGQAft1pmB1drmoLZ_chHUGkT-poPbuboHwEqlyAMHvoUWfMhMnmjCaV0zMHOLmghuebAYgyRksbuZI_V-RAc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujggfsehttdfstddtreejnecuhfhrohhmpeflrghnucfrrghl
    uhhsuceojhhprghluhhssehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    epveehvdfhkefhueeitddtgffgfeetjefggfetleduvdeggffhueehgefhkeekkeffnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehjphgrlhhushesfhgrshhtmhgrihhlrdgtohhmpdhn
    sggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhlrg
    hushdrkhhuughivghlkhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghs
    rdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgrlhhise
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlphhivghrrghlihhsiheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhifihhltgiihihnshhkiheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepmhgrnhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtg
    homhdprhgtphhtthhopehlihhnuhigqdhptghisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Ozi4aCu0duqtBePHFXAVHGbwyPk-OUk3LcNZprjXb3wFbmOu___D5g>
    <xmx:Ozi4aN_3ekEjpLrMLrwqjfDMdunfqS0al7J8HdGjV__wH2H5AbA2Mw>
    <xmx:Ozi4aLzui9h-hbaEDodAV3I7CsdNUohYRg4wXG47kLn5_HpU4HYVjg>
    <xmx:Ozi4aP_ZCxf7LE9FH8njlftvWYKMElFcnq2oul0HdUb_AcDKqe-tPw>
    <xmx:Ozi4aLoWE0_ACk5Zeb1cTK95IEnoZMhCPhOOXlQQRaX2JEUCIZlOH-ON>
Feedback-ID: i01894241:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Sep 2025 08:44:43 -0400 (EDT)
Date: Wed, 3 Sep 2025 14:44:40 +0200
From: Jan Palus <jpalus@fastmail.com>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI: mvebu: Fix the use of the for_each_of_range()
 iterator
Message-ID: <hiu2ouj4f7zak2ovtwtigf6fylz4c7fdyyqiqezsddoouzr4n5@bfs7kudjfnp5>
References: <20250902151543.147439-1-klaus.kudielka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902151543.147439-1-klaus.kudielka@gmail.com>
User-Agent: NeoMutt/20250510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_054447_251240_45133C36 
X-CRM114-Status: GOOD (  24.93  )
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

On 02.09.2025 17:13, Klaus Kudielka wrote:
> The blamed commit simplifies code, by using the for_each_of_range()
> iterator. But it results in no pci devices being detected anymore on
> Turris Omnia (and probably other mvebu targets).
> 
> Analysis:
> 
> To determine range.flags, of_pci_range_parser_one() uses bus->get_flags(),
> which resolves to of_bus_pci_get_flags(). That function already returns an
> IORESOURCE bit field, and NOT the original flags from the "ranges"
> resource.
> 
> Then mvebu_get_tgt_attr() attempts the very same conversion again.
> But this is a misinterpretation of range.flags.
> 
> Remove the misinterpretation of range.flags in mvebu_get_tgt_addr(),
> to restore the intended behavior.
> 
> Signed-off-by: Klaus Kudielka <klaus.kudielka@gmail.com>
> Fixes: 5da3d94a23c6 ("PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"")
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Closes: https://lore.kernel.org/r/20250820184603.GA633069@bhelgaas/
> Reported-by: Jan Palus <jpalus@fastmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220479
> ---
>  drivers/pci/controller/pci-mvebu.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
> index 755651f338..4e2e1fa197 100644
> --- a/drivers/pci/controller/pci-mvebu.c
> +++ b/drivers/pci/controller/pci-mvebu.c
> @@ -1168,9 +1168,6 @@ static void __iomem *mvebu_pcie_map_registers(struct platform_device *pdev,
>  	return devm_ioremap_resource(&pdev->dev, &port->regs);
>  }
>  
> -#define DT_FLAGS_TO_TYPE(flags)       (((flags) >> 24) & 0x03)
> -#define    DT_TYPE_IO                 0x1
> -#define    DT_TYPE_MEM32              0x2
>  #define DT_CPUADDR_TO_TARGET(cpuaddr) (((cpuaddr) >> 56) & 0xFF)
>  #define DT_CPUADDR_TO_ATTR(cpuaddr)   (((cpuaddr) >> 48) & 0xFF)
>  
> @@ -1189,17 +1186,10 @@ static int mvebu_get_tgt_attr(struct device_node *np, int devfn,
>  		return -EINVAL;
>  
>  	for_each_of_range(&parser, &range) {
> -		unsigned long rtype;
>  		u32 slot = upper_32_bits(range.bus_addr);
>  
> -		if (DT_FLAGS_TO_TYPE(range.flags) == DT_TYPE_IO)
> -			rtype = IORESOURCE_IO;
> -		else if (DT_FLAGS_TO_TYPE(range.flags) == DT_TYPE_MEM32)
> -			rtype = IORESOURCE_MEM;
> -		else
> -			continue;
> -
> -		if (slot == PCI_SLOT(devfn) && type == rtype) {
> +		if (slot == PCI_SLOT(devfn) &&
> +		    type == (range.flags & IORESOURCE_TYPE_BITS)) {
>  			*tgt = DT_CPUADDR_TO_TARGET(range.cpu_addr);
>  			*attr = DT_CPUADDR_TO_ATTR(range.cpu_addr);

Thanks for the patch Klaus! While it does improve situation we're not
quite there yet. It appears that what used to be stored in `cpuaddr` var
is also very different from `range.cpu_addr` value so the results
in both `*tgt` and `*attr` are both wrong.

Previously `cpuaddr` had a value like ie 0x8e8000000000000 or
0x4d0000000000000. Now `range.cpu_addr` is always 0xffffffffffffffff.
Luckily what used to be stored in `cpuaddr`:

u64 cpuaddr = of_read_number(range + na, pna)

appears to be stored in range.pci_bus_addr now. I can't make any
informed comment about this discrepancy however I can confirm following
change (in addition to your patch) makes mvebu driver work again (or at
least like it used to work in 6.15, it still needs Pali's patches to
have some devices working):

-			*tgt = DT_CPUADDR_TO_TARGET(range.cpu_addr);
-			*attr = DT_CPUADDR_TO_ATTR(range.cpu_addr);
+			*tgt = DT_CPUADDR_TO_TARGET(range.parent_bus_addr);
+			*attr = DT_CPUADDR_TO_ATTR(range.parent_bus_addr);

