Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CA0C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 06:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SonI6xAcMBhpkgEQeBJTusRUx+HcxMVTBLajODqHgvk=; b=4wPym+Y/+PtqoFGqYRzRKfn4ux
	wnWmaxG3sFZ+pk8veRxQRYiCy8XU2YXZkv4RO7/p3RoLVYdhGERyyBfcmWnHV4CnDQaJ7GvnW0d5l
	x95v6xN+53MWcnYDeIV5BsXj9zT0g0MP7del0FNTg52zX3aIFMiVdk53NY3Kl1Bxgs3T+hOXk5eHb
	94FG8y0Gmq5RcyqSkZaWXc6akg7u0932HeZlvZp5ntJhn0khImr7ZE5yUEffz12S6hEfl51rkqBlZ
	b6mQN324LO0P6fPjTh0exyDoRNiZCGMoWbs4m0HKhheVtrrkaPmUwhiPkmuSJYxiul/IrJDoAQUkI
	pffSw4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUzk-00000002578-4986;
	Tue, 01 Apr 2025 06:21:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUwi-000000024j6-1Qnh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 06:18:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6F6C6115D;
	Tue,  1 Apr 2025 06:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA6BC4CEE8;
	Tue,  1 Apr 2025 06:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743488279;
	bh=KnEDjwzU7f+yS42V6ce7fa3bnnh/T4X0uQ0vYcQujSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqsPBV6ZDjA4JXFCcrEZ63438y/20vB2mvHM3E8CAfefaN/roeihqcnBpj4gL6fHt
	 9/T50ZfHic0p24x1YYnVJa663OpTSmjaHIHVvXiOG5tv/Z4dTOqC0zeFQ6ZNA0+iPe
	 7FWOerDBjRrtbWN9DbBZ79Bco+tjFDaYU0nJvmtwZAvmKCsUCd33QelYSFp3YDvgs7
	 1ew6Ye5Q9HFLThkniDCATefPUbhcE7ZL5m5/pUFrBmJ3XU0UFZ75F+j9IzrZcqbYDl
	 p4vhmBOM+SRRGSWXMfdL/391h1gCMGdZs977xO0b9bABOUcT4WVbaWzyjjUS8nk7Vl
	 WHhhcegmHDJ3w==
Date: Tue, 1 Apr 2025 08:17:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Winchenbach <sam.winchenbach@framepointer.org>
Cc: linux-kernel@vger.kernel.org, mdf@kernel.org, hao.wu@intel.com, 
	yilun.xu@intel.com, trix@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, linux-fpga@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sam Winchenbach <swinchenbach@arka.org>
Subject: Re: [PATCH 1/2] dt-bindings: fpga: zynq: Document ICAP on boot
Message-ID: <20250401-helpful-bronze-gazelle-4d8e25@krzk-bin>
References: <20250328141944.119504-1-sam.winchenbach@framepointer.org>
 <02496a88-3d9c-49ee-93ab-8f1400fc0c6b@kernel.org>
 <p4bujnmgkcvsu4qipmgh2j2loedepmwgp7zlaxrurhaveb6tbc@ibqtbjnbzdzj>
 <14b12882-119d-4c24-9634-e4cc37a39212@kernel.org>
 <2ccsnpv67gsu354uo7xe7syrxs265ncj6hl26v3cwf2dfm7hyu@ihkemyajuiag>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2ccsnpv67gsu354uo7xe7syrxs265ncj6hl26v3cwf2dfm7hyu@ihkemyajuiag>
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

On Mon, Mar 31, 2025 at 09:07:03AM -0400, Sam Winchenbach wrote:
> On Mon, Mar 31, 2025 at 02:43:59PM +0200, Krzysztof Kozlowski wrote:
> > Not sure yet. Can't you check the status of ICAP before programming and
> > then enable it only if was enabled before?
> 
> I am having a bit of difficulty understanding this so let's talk about cases
> where the ICAP is enabled/disabled -
> 
> 1. When writing the fabric from the driver
>    In this situation it might make sense to read the state of the ICAP
>    interface when preparing the fabric, before enabling PCAP. When the write
>    completes you could re-enable the ICAP if it was previously enabled.
> 
>    This might be outside the scope of this change - and I am not comfortable
>    enough with this use-case to understand potential side effects from doing
>    this. Logically it makes sense, but there may be a very specific reason that
>    the ICAP must be enabled after doing a fabric load or partial
>    reconfiguration.
> 
> 2. When the FPGA driver loads and is probed by the DTS
>    In this situation, which is covered by this patch, the FPGA is loaded by
>    BootROM/FSBL but contains functionality that requires the ICAP. Unless the
>    user has made modifications to the FSBL or 3rd stage bootloader there is no
>    clear way to enable the ICAP interface. Checking to see if it had been
>    enabled prior to loading this driver does not (in my opinion) make a lot of
>    sense here.
> 
>    Perhaps the name of the DTS is confusing? The suffix '-on-load' was meant to
>    indicate when the driver was loaded, not the fabric. Would the suffix
>    '-on-probe' be more clear?

Neither on-load nor on-probe, because again you instruct the OS what it
should do. You should instead describe the hardware (or other parts of
software stack). Describe the condition, the hardware feature, the
characteristic observed. With proper phrasing the property should be
fine, but I still do not see that its name and description match actual
hardware.

Best regards,
Krzysztof


