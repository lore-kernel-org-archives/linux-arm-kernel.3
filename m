Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B56EE94102
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 23:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8g/RL9DpYMne2dKMvOLjYxHkoQzMWz5i3+ifdqNtVHc=; b=iTHaEFfq8DmJIe9JH0I4MmXyO0
	ueSsoaicXbbaUfjx/6pHlM/5qHD995rmL1RSQsBoB/kXf8aIkbrHk23VJqY4zkV8dCseBBE4Fhbwa
	1ktA2mJbKZ0Si/whHE+fep7o+qsHHf6uxl2J9gVXNRZUj49iRUQ4Kr1U52Pq49+PzbSto2C5zKi/Q
	w402rEWfpem0iV7u6oQz+f2FJhn7VC0PsB9upUMwn1UIhftSwlmIKY8XufF9yCUBk6UOsBO9buJ7b
	FTImc2j8WrAWlC1XwxqjdkPfPHZtAlOSIqPekMm59qRNOdFTrlO0FsjK47jEgCxGDJE7QBPxgiYau
	TGFtjRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaMcJ-000000048rA-2LPU;
	Mon, 29 Dec 2025 23:25:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaMcH-000000048qi-0Bwi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 23:25:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09E6A41697;
	Mon, 29 Dec 2025 23:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29ADC4CEF7;
	Mon, 29 Dec 2025 23:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767050731;
	bh=gBic61XhRnhOC+5nNfIY22uN2UTZjrJ0gw/UGoHisUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aY9VGVHhUxXe6n10yUd3Ij+dXkWLdgZUtVl2t7HHs71hCLrC6/bpMaQhij2BtIOKX
	 8I9pes7DADMkBv7d6XdEZdDndszB06v88ncLpH1JwJCzwgDIQiwzlEfOBK3CVDDrJ7
	 g6AWyiwCStbcLLy2cD90Xpf77wPXM7KUN3Ziq614OHCEYrBfIKMXAvKJ9+da00RSoa
	 Eh9kpcEtN61/0dJ7xPJwAQ65YtSVVmkC4MX/rIBohFQKt5HUe9P7lLhDT6eM6sme6f
	 supwRhDPB4Lf3Vpl4g88tqGjg4ygBBa7DKyXeAli3xv7pGi007KfbwA4t9pS90CUcg
	 ZBVU67HBEptBQ==
Date: Mon, 29 Dec 2025 17:25:30 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v20 1/6] dt-bindings: firmware: Add TEE remoteproc
 service binding
Message-ID: <20251229232530.GA2753472-robh@kernel.org>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_152533_106872_052042A7 
X-CRM114-Status: GOOD (  11.70  )
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

On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
> Add a device tree binding for the TEE-based remote processor control
> service implemented as an OP-TEE Trusted Application identified by
> UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> 
> The TEE service node is a child of the "linaro,optee-tz" firmware node and
> acts as a container for remoteproc devices that are controlled via TEE.

Is this generic for any remoteproc device or just ST's remoteproc. Looks 
like the latter to me.

> In addition, the "linaro,optee-tz" binding is updated to specify the
> '#address-cells' and '#size-cells' values used for child TEE service
> nodes.

I'm pretty sure I already rejected per service/app child nodes for 
OP-TEE when its binding was submitted. If we do need something in DT 
to define some resources, then can't we have some sort of 
standard/common communications channel? I don't care to see some sort of 
free-for-all where we have every vendor doing their own thing. OP-TEE 
needs to standarize this.

Rob

