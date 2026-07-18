Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FE6C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 23:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YziOsZAuz5FyhRvti4+0bqRF5BJSUN2tM+fuVXppn10=; b=qEjmWI6yBp6ZQXbXPs2TIN9+ZU
	drySkWkYO2MWBv1kVqxX485XD9iPs9X+oOdwiBkXz6GdiWNOjZXBRJYGh/l3ZkFwxH6wM4YMqktHM
	FY1CZlEjhseEToe5FVgXj6qATaCKE6/RwdH/uAzmlJr8dlXJ2ilPEVi2BCvL+Uw3jEtBprQm170xG
	8LCpNO5Bxqk5RIKK9g9vgJgdEUgYfbDfKp70YJYpxW8jTVbZN9oCsu2qaZF/GKfmL7DT43m/Yd23S
	VLu+4A6S2AQ3Onyib3IBABFTrLSy82B9ex0obrH2Y7QPD9y7yYnsF4Hop51elOKjHCFnErp8nwdm2
	4SSiJpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEGQ-00000004akf-0l9y;
	Sat, 18 Jul 2026 23:16:10 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEGM-00000004ak8-40ko
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 23:16:08 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8f256eaedf8so102247206d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 16:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784416565; x=1785021365; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YziOsZAuz5FyhRvti4+0bqRF5BJSUN2tM+fuVXppn10=;
        b=CVKEY0leN7xPpAggxPsVJsyD3A9MDLUq2bCV1a/Z/xnzBlQFLOEh+/FzXc8EgrpTgU
         m79egS0HEm2NOLZlwXpwnPTBRurJ4umJPcw4LDwfUOU2IiArpL+J/Tb7eYCqVFsREqr6
         3kLiZW4P1d4Q4nyTPAbQDeyjDk4rI3j8ghBDWIKe4GoiynloQxC0PgW2TyB+NBtQbFsk
         b3fOfJMk5ocFz5+zObDHNrGZzNkBQLzMOc1NnivK1xa0PTAuVjTAIEDPf7ImYQC2OpvC
         I5SKXDHn7xwViTpHddshqh5sFsuFqkcBKJeIOZo4SiR+hzwTnLHQ6sQB4qZcR41GAsUB
         ypdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784416565; x=1785021365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YziOsZAuz5FyhRvti4+0bqRF5BJSUN2tM+fuVXppn10=;
        b=WoiBRWko6dDBEYPueg6uP/BT/9jnE8F9acza2bHn8mvUk1UA+dBuv4qQ1RsKFSzQs8
         iC/V84/bfY8SCNqMmBrRJUb7nwBapnG3rnSYWnNxqEcDKlSZK51Rd0CZTNS+FY26EDTN
         Tlg4/FBjmBnOobfULLY5hb7b7Y0TeNdEqE30/iseE7VAzsCPM+E/v1RO5pShxZNCqERz
         JzPqIJhJ3LZ/lRdwhmoT9AZjnYY97vK7TvoziTYH07uSB/HjX2XqEOlKOtExwjnOSb6f
         5S/mlrxCMao04LbZq4n8N5YrCy5/y4MmMUnT0Al7mgE4I8sTGAEJcIvRgCHEdEKG9dlP
         UsQg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3BEj/1Oeradvxok90cEsPZTwt/mOQDANN9+zMcNyQRI+iJqE7yv9Xj3GAKxA81twklR65eV7XN0tvyWKHTgTZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwxiyWs5dIdwauRiBLOwMB2Pmy9FXi+tbovAVPcfjIWdTl0bzqd
	BZX3HH2nf4Kf+7tGF1Wj6b1su4OLTTucpppkGtOrxvBSCpskA8vsB7B34jCOzlmqfm0=
X-Gm-Gg: AfdE7cmJc3HVVj8d9GmWqlqa1HI0I9oLJRLIqxtyPq0p5eu2gl1LjyLIC0dWBRHomZY
	yO3LsAEUG+R/G95PUIBg4sYOL+tSMSEhe9M72g4AGjUpee6IWW2iZHwgYIyMjJnAzlB8JY5hZYw
	g+9zRyF2UR/BJEMSRi+Lv+W2k6nhIo+gE9jPFV0QSOhWA881UWGmqihWdUrlfUwMba4VzeVVTYm
	3NA9UysudiG34fgv0jjSIC0qMhWY6OR7VmZzwpY3n9CwT6Wb/JPX68FiNbOggl3PdcLIDJLhw24
	ATcqKzB7htdxlESR2xBPYQPNfu7y/YPKHtQPRABWJK3eYMANK49r8uhEpYPozZi5l5F81guhyyg
	tcxctQOkqV0gZzK7Sv8NsPJ5Nj5gegOqpyhnpmHcQJIEvqCrIzftMRf7ZTkH2
X-Received: by 2002:ac8:59c6:0:b0:51c:18e4:38ab with SMTP id d75a77b69052e-5213ee7eda4mr74584161cf.66.1784416565170;
        Sat, 18 Jul 2026 16:16:05 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214fae3268sm40901021cf.24.2026.07.18.16.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:16:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wl8Ae-00000006ef0-0ssw;
	Sat, 18 Jul 2026 13:45:48 -0300
Date: Sat, 18 Jul 2026 13:45:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Ashish Mhetre <amhetre@nvidia.com>, catalin.marinas@arm.com,
	will@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 2/3] iommu/arm-smmu-v3: Introduce CFGI/TLBI-repeat
 workaround infrastructure
Message-ID: <20260718164548.GI701389@ziepe.ca>
References: <20260714104202.1664187-1-amhetre@nvidia.com>
 <20260714104202.1664187-3-amhetre@nvidia.com>
 <20260717201841.GC701389@ziepe.ca>
 <alqbxaKVYFX1BZR5@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alqbxaKVYFX1BZR5@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_161607_104602_68C628AB 
X-CRM114-Status: UNSURE (   8.78  )
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

On Fri, Jul 17, 2026 at 02:16:53PM -0700, Nicolin Chen wrote:
> Given the use cases on Tegra264, instead of patching the iommufd
> path as this patch does, perhaps we should simply spit a WARN in
> arm_vsmmu_init():

Nope, in this case you need to make the errata discoverable through
the viommu info so the VMM can validate the right DT is used, or apply
the WAR itself before submitting commands to the kernel.

Some kind of new flag in the viommu struct I guess

Jason

