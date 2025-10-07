Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5705CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 15:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkwQg7lA6PqX2eYbLly+zIvMuIHdofZuaCQQqQ1kN9w=; b=TvzanOsKIspIRqrxPec909QUow
	LOCWZ7h/y+cm+ehVxUssL6nLeqNhymIi/WKnUKbzBkVBrjWFN4BuR76Kb2JGBExecLSwJzXkNWvLt
	Cokr57JaOV+gXyZl4iC6VNCLkQceT4T4Trs7TRy+nUuWzn2/7+jVaTXtqLlmQFZCLkSxUoS/KrIum
	Ko9G9BppyIjh9anEnzTolLvenoYX3ocYmscNSWTC9m8Bc5mK9vJ+9pGDThAkbSi4swU3LnWmGH1F3
	mVxMphNeQwVsy6ZqELwybrrPgIFmtAwa2SqI2Nm2aE1GvbVF2uG6iFBx9Q0d8gw2B4qUKiQN4Zom/
	vWVgRvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v69pJ-00000002JpW-2VX8;
	Tue, 07 Oct 2025 15:42:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v69pH-00000002JpN-2wUv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 15:42:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3B8C6032C;
	Tue,  7 Oct 2025 15:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7565C4CEF1;
	Tue,  7 Oct 2025 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759851726;
	bh=HTp9egI/EQqilYgnZaivf9/v+3moPdyBfRynwvlSPgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koG/RO7YwUwyU4Ukbpsp6hMltCYanwGT4o0fM5KqKdCX9I0ufrlYnkpUoldu5N8jR
	 CWhiPdDp6RwhIIAl8Jk+SjZESiKj71yzvM95+H2hX2+Am6wAHb7cxzz3fXLI9kOzTH
	 fL/jJbvHZnQOp47jJ9FjZqzIj+0swbLZ4dnLgI7BLEwO0d7x5BjgoRPCHw1B0IpWzF
	 R4jdZtTdHFkKblkNv+JSYQ7tLSFRViyoYaL09AWZ8WDakaZZ7B6TXhJMGCQJm8W2To
	 DItFaEW0HaRmiCQkdft+GW4zwsIeNln6tdXRqVDZlDCZ8MKPsbMdFmgg7nq050P4ts
	 D/BGskVpr9h4Q==
Date: Tue, 7 Oct 2025 17:41:55 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, chester62515@gmail.com,
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com,
	bhelgaas@google.com, jingoohan1@gmail.com, kwilczynski@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, cassel@kernel.org
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
Message-ID: <aOU0w5Brp6uxjZDr@lpieralisi>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org>
 <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
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

On Mon, Sep 22, 2025 at 11:51:07AM +0530, Manivannan Sadhasivam wrote:

[...]

> > +                  /*
> > +                   * non-prefetchable memory, with best case size and
> > +                   * alignment
> > +                   */
> > +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
> 
> s/0x82000000/0x02000000
> 
> And the PCI address really starts from 0x00000000? I don't think so.

Isn't the DWC ATU programmed to make sure that the PCI memory window DT
provides _is_ the PCI "bus" memory base address ?

It is a question, I don't know the DWC inner details fully.

I don't get what you mean by "I don't think so". Either the host controller
AXI<->PCI translation is programmable, then the PCI base address is what
we decide it is or it isn't.

Thanks,
Lorenzo

