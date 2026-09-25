Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB36CC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 10:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1qtZNQkSLL9jY8cFQvdaU+DuydaEVSzJnJZ/ismFcI=; b=fRXGDebCSA/XBV0qUtlOv/I2P9
	M4BF/ntC2+jbZMbDpy8KEr+CCIok0i8lUj4DBI+zdD+T+2nh68Jjn+DwV3QoRr9h9Hvq+3W389Jhk
	AyDqiZIttVO9IroUFnA/gss9XDUGWb0LqSS6wuMicI36KqvxWnyAlhbaIRD9xJZXpgeGlakaDXt+0
	Run/UbFRgL3+b/N0JqlH6DQGoN5FW029BADtSa6H/Q+vRm6AFCzqqUJvJuLui6hsm4Q45zVfPNjSw
	VhHnRn5xa5ZDYMuJjh7VZLDlObY+7S8yDXr1zrTblIIFEEkfHj505zFVnpFzFr4LsF1FoQ6Z8Uvoz
	6reo02Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2kP-0000000D4mD-2Ojl;
	Fri, 25 Sep 2026 10:01:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2kN-0000000D4m3-2Vfz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 10:01:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 324DC4196A;
	Fri, 25 Sep 2026 10:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE3C1F00899;
	Fri, 25 Sep 2026 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790330499;
	bh=c1qtZNQkSLL9jY8cFQvdaU+DuydaEVSzJnJZ/ismFcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ry0H7W/pDYg2HNPBp5VpWT3cgYkM6L7bmz00BS9xiLGVwMUCxAgQsJlVxbGOXVRni
	 OOM4Vrek6dykBdeMzLGoHCzhNSzKt20cUigmR/Eo2NH/Ij9Xw4/swDB1OL2v0xrsFK
	 MvVXaM1lVdwNLkwNKxyjPVXYzDG2GGXyP6oiNBaHmp1B8n0kpLZ58PDU98cwjHJCaf
	 UzvQZFGDQ7NeKrroJ5FPhCTJa6wpw62K52yHrREtDVOAK7rQ+Nvd67OedGmj2Are8n
	 LgmSt/pe/agZJqVefP++D35e29wyh8swf5iRcjqbqHc7cfGUFxSwS7TeZr+kx4Yu/k
	 2MBDDIAfwQO/Q==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 919B6198003A;
	Fri, 25 Sep 2026 06:01:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 25 Sep 2026 06:01:36 -0400
X-ME-Sender: <xms:fUa2asZjlTTZThjWtSXaPFZJgFBkPnUcvkqUZslxtET03teSnRpFlw>
    <xme:fUa2amoAxKgYnO5i2XNOhhxeIngCv5Id18Wb4ZmZTTfyyQeXVjC367AEl48R0Ymb-
    N-wqC9bFjvNyVKj6H8KDnn2ct9Di3B8mSNtusLXcArlZ2eL0u7N87DX>
X-ME-Received: <xmr:fUa2ajL-639cc4qE0KKv-MgFk1cpqQ4AC0xvbceQOuTWyx4IWGeVB14YLn4>
X-ME-Proxy-Cause: dmFkZTFaHL7/M+1Ihc5bUYqYtFwJSgrnURianRf/JR5tgLUu7fXkjZXZfmxr42uVkLDENz
    n6CT7lbp4ydF0hj9OqU2bDAPnJ4sy7gAysDEagQgRgjtp5/JepVQ5/DqM747wnWVnxDpTm
    jrc4s8XALNefiP8J76+Wd9Svwha8zvIC0O9O96YtBwgD0mX6idSPc1uKI30oRERQlqN8L3
    Lr8Ld3qlOHIm8iMljBRija5/BxhTJp2TXV2Mkb4SNPIlVJe3N64zVavtx9WdcYOkYU023N
    aDiaeR+VutG0GUjhSEsKc9hMRKknxanLE2/l1pwQvzn6kS5GFbP3ihVGhp6eMTXXkGvkBS
    AmeIHYIzhZ1yFuqqvqaHttceMfXxJ9esOyF3qN0yTrvFw5l7swuIkeiaIWZfmYXCLOkUxH
    VeWCFrW6XfDAicXxWHkznCBWbqieq0djlQ2YFijalVtJhux2dw5S6+WESijC+Z5SzkpHD8
    6AP3T5/WJZ2Twln5733ADDWrueKkQAIHBNwGdZOaXqWW2Ih4AoS7VjqMXcHB/MboRVRphc
    DhHmLwygPFVFuzkxTsFkVJmQ+ak4ZvhUKjAEascAyCoLk6pNwzBmTcsQ4y24hX2qaB7OjP
    0Bk2Z8itCVYzHmcxnXZN5gCoQguQAyxW7M12yG9pjkOqhVb6di6ypYXqSAig
X-ME-Proxy: <xmx:fUa2ahZg5cvFEiejGT_ny8tJvzmJMMCC6JEOjYjtSmZ2BAsNA8rxTg>
    <xmx:fUa2aqpZiordqWJcp4HQOrUmrM111pY9DfhfHzjmDir62mi3QT7Gcg>
    <xmx:fUa2akAIbnxQmmH6kSR8fZHJpOaxnd33Ad3h83f7tdT8gDu1pfm2Tw>
    <xmx:fUa2aokJ9B0Y8g2Ixga72Cl0sERlNFrflt8vPCraPEXQcvYYyqT6KA>
    <xmx:fUa2ahptMA3Q0ZKMkk_xxAAkDBS9NMREmdQlWyirfizDxAIVAR4NwhgC>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Sep 2026 06:01:32 -0400 (EDT)
Date: Fri, 25 Sep 2026 11:01:31 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Breno Leitao <leitao@debian.org>, Kyle McMartin <jkkm@meta.com>, 
	Usama Arif <usama.arif@linux.dev>, kernel-team@meta.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] iommu/arm-smmu-v3: Add a cmdq_max_n_shift module
 parameter
Message-ID: <arZFDAofKaurSjCd@thinkstation>
References: <20260909095228.2174031-1-kas@kernel.org>
 <20260909095228.2174031-2-kas@kernel.org>
 <179018301689.3334538.1783583175230817305.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179018301689.3334538.1783583175230817305.b4-review@b4>
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

On Wed, Sep 23, 2026 at 02:03:36PM -0300, Jason Gunthorpe wrote:
> > [ ... 34 lines skipped ... ]
> > @@ -40,6 +40,11 @@ module_param(disable_msipolling, bool, 0444);
> >  MODULE_PARM_DESC(disable_msipolling,
> >  	"Disable MSI-based polling for CMD_SYNC completion.");
> >  
> > +static unsigned int cmdq_max_n_shift;
> > +module_param(cmdq_max_n_shift, uint, 0444);
> > +MODULE_PARM_DESC(cmdq_max_n_shift,
> > +	"Cap on the command queue depth, as log2 of the number of entries. Zero means the hardware maximum; the queue never shrinks below one page.");
> 
> The patch looks ok
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> But I'd rather use lg2 as name, especially user visible, instead of
> n_shift. "shift" is a word for bitwise stuff, this is a 2**N log2
> encoded value.

This name has changed twice already. v5 took the value in entries.
Nicolin asked for a log2 value and named it after max_n_shift, which is
what the driver calls this quantity everywhere else.

I would rather not rename it a third time without input from the
maintainer.

Will, this is the user-visible name. Do you have a preference here?
Unless you want it changed I will leave v6 as it is.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

