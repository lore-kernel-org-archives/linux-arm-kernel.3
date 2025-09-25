Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF0DCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tvvhk7kaFoub2LyK/A4hB18ZONEl+pKYHKqNPFI5nk=; b=Tb+zZM16KWaPHQIjNxM2TL9bkL
	epvcXcScPBdapXDREIugY+2Xfcn/IO2xDN10JvIeFrve0cxLgpMV4vGDnrzCBjRAm+kNmMa1MbRVp
	Z6WxoZ3MtMdYG6M/O+u52ivBHD3vzBnEO1nU/y2wQrjTKg71Yw6ke/HSookM9LsStBKGgkIoHCZcP
	thUTuZWFF/h5MKuiiy2hGQfb117pDSYBR5XvD6FLZ8Y9a42N/Yhhg/eOlVLpNgqk3ZGhTR33Blxb7
	PwsXSrYIy6ZPYvyPehO/6kI6GRrmVEgiqVk1iuN1i4rKF1/NZSDMncOQ0Ms7N97vw17t/+00qN1kJ
	ge6FzJOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mon-00000009wVV-3oTe;
	Thu, 25 Sep 2025 14:19:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mom-00000009wT0-0I7s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0tvvhk7kaFoub2LyK/A4hB18ZONEl+pKYHKqNPFI5nk=; b=dLm06J0p7oEXoCKsX8k1lfe87z
	JhvusHQiSWY5y6udVzhqDKqbSzfGwBO/Zsjwe9x0xqengE4nX/kJN4NhRoBbzqfj0o7tJkpRlGoge
	1mqXHqaNQCAGPai3ZngbJuXiQjZtcTsPJNFOl6vQskAb/7HBzXA3yfsLFBrgioIWl16g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v1mob-009TTy-7Y; Thu, 25 Sep 2025 16:19:21 +0200
Date: Thu, 25 Sep 2025 16:19:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com,
	rogerq@kernel.org, pmohan@couthit.com, basharath@couthit.com,
	afd@ti.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pratheesh@ti.com,
	prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com,
	rogerq@ti.com, krishna@couthit.com, mohan@couthit.com
Subject: Re: [PATCH net-next 0/3] RSTP SWITCH support for PRU-ICSSM Ethernet
 driver
Message-ID: <0080e79a-cf10-43a1-9fc5-864e2b5f5d7a@lunn.ch>
References: <20250925141246.3433603-1-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925141246.3433603-1-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_071932_104142_788D8B9A 
X-CRM114-Status: GOOD (  14.10  )
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

On Thu, Sep 25, 2025 at 07:32:09PM +0530, Parvathi Pudi wrote:
> Hi,
> 
> The DUAL-EMAC patch series for Megabit Industrial Communication Sub-system
> (ICSSM), which provides the foundational support for Ethernet functionality
> over PRU-ICSS on the TI SOCs (AM335x, AM437x, and AM57x), was merged into
> net-next recently [1].
> 
> This patch series enhances the PRU-ICSSM Ethernet driver to support
> RSTP SWITCH mode, which has been implemented based on "switchdev" and
> interacts with "mstp daemon" to support Rapid Spanning Tree Protocol
> (RSTP) as well.

Is there anything in this patchset which is specific to RSTP? In
general, there is no difference between STP and RSTP. STP is generally
done in the kernel as part of the kernel bridge code. RSTP does it in
user space. But the hardware driver does not care if it is STP or
RSTP, it is the same API to the layer above.

	Andrew

