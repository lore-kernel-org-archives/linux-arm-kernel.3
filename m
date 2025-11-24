Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80605CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 16:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZ9EHjTIO0Z7Xhk3cUhW/piM3vYynY3HcSsvQe8IgaI=; b=h+oTxMkLmvdd3PoD96oChd0SCL
	HdiB2vaTEYRyWklElGHWM61Mm0DSbkDp/mfcKMBpkE8HOJ0XdiiTjfIrjrXjtIUNzSpJXRVXaXGEt
	g7Jlo2ngsk3mrxno+/OVSeOnCNHmeyz/PsSE6LOcEFJjxTkM348LjQxr0rseHNm5HwXXTojGrPI5L
	W7sjaMfDx6gaZMyxe7Xd649YGJCJCgnk3OP46vLBZHND3aau7zQDBlLsQJBoy4EWPnyXP3f/XNE/v
	VEBKvLtYilri8ky0Rmm2H5KCIdHvvmLXUXinnj3BS+y0xlV7uesyISXilhqnP7pNR+Mk037oP7KgT
	FiPTeo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZXI-0000000C0H3-35x1;
	Mon, 24 Nov 2025 16:35:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZXH-0000000C0Gk-1Ucf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D21A40350;
	Mon, 24 Nov 2025 16:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272AAC4CEF1;
	Mon, 24 Nov 2025 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764002130;
	bh=EmC+AiSYeGSl26uiPMPxIiViCHrRPLaCMJy21dp/1+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVKCqp02shsMvbhfhXLoN/SSZJyx5bau9gzvk7pH7rXp9XMhT+ODgjdwv8TMTcpTE
	 2ov56RdfUjTzQK1ehzb4VWiFtfYD3XHvg7mRne61a8sm86OV06Yp7G4u2ifVz1lAje
	 0hDu20pwMyMKgC3uqgUuO9PqR/zkfvPdWyMiFMdI=
Date: Mon, 24 Nov 2025 17:34:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] coresight: Updates for Linux v6.19
Message-ID: <2025112442-shiny-neutron-28ab@gregkh>
References: <20251124053342.1082606-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124053342.1082606-1-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_083531_435714_D7460A23 
X-CRM114-Status: UNSURE (   9.50  )
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

On Mon, Nov 24, 2025 at 05:33:42AM +0000, Suzuki K Poulose wrote:
> Hi Greg,
> 
> Please find the coresight self hosted tracing subsystem updates targeting v6.19.
> 
> Kindly pull,
> 
> Suzuki
> 
> 
> 
> The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:
> 
>   Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v6.19

Pulled and pushed out, thanks.

greg k-h

