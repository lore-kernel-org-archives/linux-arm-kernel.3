Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EC8C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZaLSwjBwhLnjVfyHqGWYgJq1s9ZezkgbaJ0D//rO7k=; b=tXQzj9yz8b+vFaGqJnziTNVWVp
	5BagKbWeTwJte42tknAzTcXLJzPkGJ1rPN3M83/Rq13qfgttJ2yfJFv53U5TsW+cgx5Bb9U1RyGk8
	XDouFowLHgT17GBJFPq5fSg6cziEZHVdbHtYP/tBAOruT4VsXfH3t/wiqifLvwGxsc1AqtDGqIrsy
	6nzZJsfi3h2I0A5gsjF/bf5XLScXJ6x53/5EDDcyPapDr3W9nNaEDaD6u9xb2Xb4KRf0kUjG3H79E
	qZuXG2qMku8og2k6AEZXmKUqlZeKhYPc60RjgXUPDzZSRN1l8YFq0D8RwFA3AIv47kMuONO96XEJ4
	+EL86B2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglFX-0000000EIMX-0awU;
	Fri, 16 Jan 2026 14:56:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglFV-0000000EIL4-0ea5;
	Fri, 16 Jan 2026 14:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pZaLSwjBwhLnjVfyHqGWYgJq1s9ZezkgbaJ0D//rO7k=; b=ArjrMqz35azQ2qpmNcwP+uxvJ8
	rB+XyOY1s7Su4+jHnldErB3tvWHZYek6P/t44UyjjrU7jHCnffBf7zbPubnJtuvMwgOWDck7NyQ0E
	SfsjR9iN2+auvk4U3e+hzLwCEJ1YHTdzZGWhjg3FVQU1AVQLFCQ2X00kFf04NB9qyIJQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vglFP-0035QU-SK; Fri, 16 Jan 2026 15:56:23 +0100
Date: Fri, 16 Jan 2026 15:56:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: sayantan nandy <sayantann11@gmail.com>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>, lorenzo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	sayantan.nandy@airoha.com, bread.hsu@airoha.com,
	kuldeep.malik@airoha.com, aniket.negi@airoha.com,
	rajeev.kumar@airoha.com
Subject: Re: [PATCH] net: airoha_eth: increase max mtu to 9220 for DSA jumbo
 frames
Message-ID: <fc018e11-3957-4b2e-88a8-777057091923@lunn.ch>
References: <20260115084837.52307-1-sayantann11@gmail.com>
 <e86cea28-1495-4b1a-83f1-3b0f1899b85f@lunn.ch>
 <c69e5d8d-5f2b-41f5-a8e9-8f34f383f60c@genexis.eu>
 <ce42ade7-acd9-4e6f-8e22-bf7b34261ad9@lunn.ch>
 <aded81ea-2fca-4e5b-a3a1-011ec036b26b@genexis.eu>
 <f0683837-73cd-4478-9f00-044875a0da75@lunn.ch>
 <CADJVu8XP_wBudwOrT1OLhcZ3-9Qoci8FQzw+yyxnogiC2Asx5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADJVu8XP_wBudwOrT1OLhcZ3-9Qoci8FQzw+yyxnogiC2Asx5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_065629_232180_D3ECAE02 
X-CRM114-Status: UNSURE (   9.47  )
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

On Fri, Jan 16, 2026 at 08:09:51PM +0530, sayantan nandy wrote:
> Hi all,
> 
> Thanks for the review and comments.
> 
> I checked the AN7581 HW and it does support MTU sizes up to 16K. However, as
> mentioned by Benjamin, larger packets consume more DMA descriptors, and while
> no extra buffers are allocated, this can put pressure on the descriptor rings.

Does the hardware consume DMA descriptors for the full 16K, not just
the number of descriptors needed for the actual received packet size?
That seems like a bad design.

      Andrew

