Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DACC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xa4e3vXPBQn3dF4u0LjLXBeBS4I98nyQ4OLpGIQQrGE=; b=S7h7wtm/YudPgV1dhBMkaieTmK
	Qi+r11FZER8WcHt0h/5F+Jh2l0aGlYz7NjQvf9MnIZMhTGL/xk3gAXZcHA+IBiX5LUABW7RDOKjVI
	LTP0Zqnj4wSoRZY5JVyhiZH5Zq/bi3/dpzCUp0M9hvyjo6bS81ubsQsyr6+1292FJKwxZOdL5JMj3
	3RA2Eazj2SlsUhe/hq7YeR/w6Xp2OmyMTwYuK11oDVxG7f2D84RUcvyahTUj07WicU2Xzuu/3C/Di
	bi9VXGAmbrA7nenugIj0zjcNxDBxOHGYxjXlXPvvlwkUlGb4yuOaFubXfE8nLN3uziuDVuQhz/G4K
	dIFp4f1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tszGm-0000000DHyH-48Qn;
	Fri, 14 Mar 2025 07:15:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszF7-0000000DHaJ-0Y5U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 07:14:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8A1B5C5724;
	Fri, 14 Mar 2025 07:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB998C4CEE3;
	Fri, 14 Mar 2025 07:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741936444;
	bh=hktCmAulQe2IC8fiZbvgKwnkj4lo+vKUO88gH/ygbgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UjD0KNQzNpgphsn4JQrFezoQSyvW7B3vrkzh1X2zVKuLY0Hc1XTYj4mqlRWoh3daj
	 5hDXrQRekh8SLdSJhUFCx0XIv/g4aCOYxhBwgSPEl3cmKQOzW5hsFoxjmW+ZaxGHBo
	 CyUc8xhb/tZzuwPhmNAmlodHCCLlJhQVwIclV1es=
Date: Fri, 14 Mar 2025 08:12:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Li Qiong <liqiong@nfschina.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] usb: remove the invalid comments
Message-ID: <2025031430-poncho-aviator-8131@gregkh>
References: <20250314070921.355986-1-liqiong@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314070921.355986-1-liqiong@nfschina.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_001405_220815_D82A7007 
X-CRM114-Status: UNSURE (   8.13  )
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

On Fri, Mar 14, 2025 at 03:09:21PM +0800, Li Qiong wrote:
> These function don't return value, remove the invalid comments.
> 
> Signed-off-by: Li Qiong <liqiong@nfschina.com>
> ---
>  drivers/usb/cdns3/cdns3-plat.c      | 2 --
>  drivers/usb/gadget/udc/udc-xilinx.c | 2 --

This should be 2 different patches, right?

thanks,

greg k-h

