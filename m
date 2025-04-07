Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7050C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCOIayB/uh3QINC7/k4aL3vcVRE0EtU21+z9kTHUZ3M=; b=QdCrPSHEt9U5s+m5Z9M/2kwQXc
	nWSoAlGB2tfROxGD6SV14vL7cYivi+HZk8ZRzHidQtpBBJszzwOkGk7+MOryr9IXPS/ULhQajm3+E
	qmr3flxe9DbSbdiGWV77uoS/dDVBGy/s+oWFbxRLcZnvuNSIZGhWKhrK0Pmh7EJujj6GLelzsuqT6
	Asu8UOO1HIRHdxuLURp68Jaj1hfEAn7HplXKMmu4i4EqshmRQlXdE/aiddW8jmhlyA3Fo0wFfA0dE
	aELVSGR2CyMgoEUvzEBgshO5Ww8r8eTnPHJZ6aJkZgPKjE8NoSMab3uxTlMp9jzwKtyMN0wQBgpWf
	+ykkm48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uL4-0000000286f-0HhW;
	Mon, 07 Apr 2025 21:49:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sw5-00000001xEO-2hmz;
	Mon, 07 Apr 2025 20:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aCOIayB/uh3QINC7/k4aL3vcVRE0EtU21+z9kTHUZ3M=; b=BnAjNl7lG56Su2pL1jdYp2JAiz
	FKO7prmK+1mvyWcCX7APsfnvsRQHjZyFYnzjCo6NYyEcdm+Jy68aLewnYnhiCedBXXLbnzlnPeGDd
	S/O64sndFnyQKiuPESX6+bfBdxwyx7SdmL+IDOT/3JixWB+splhabJp9BtjE5Vz4lLnyV7zkFgPb4
	wz0EnOp+VA/LHb36WmQKC6xqDkAWfgvtRoW6CUJUon8f/gN2MCWSLXEGhUwMQUlMT2aDtttg+nvup
	Yzwo5ir0JG2YpyAbJLaMF8gmRPP8yl4XejZiXIQTAtau6j62P141gD9w2t3puy+zZpA//H+Q0aWR8
	BbFIv8mA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sw2-0000000896z-1O7v;
	Mon, 07 Apr 2025 20:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aCOIayB/uh3QINC7/k4aL3vcVRE0EtU21+z9kTHUZ3M=; b=TP3EocCpadaCAdFO71dftOQTan
	6RCmKPf1jrTeu7TFuXwMgOTnhEqRUeZ0kQ5L//pkrL1gkbRB/Jrgz+7Y3MOTPknmdM0MLaGsISOAw
	BIKAuO4sksZ7GPLbipuH73siTIFXd/0cZCL0hrluimBWN8vbK9ag1QVlQVuMJvyuZCbc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u1svf-008InE-Rq; Mon, 07 Apr 2025 22:18:47 +0200
Date: Mon, 7 Apr 2025 22:18:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v4 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
Message-ID: <64a3cd3b-feee-4414-8569-01642b127ac8@lunn.ch>
References: <20250407102528.1048589-1-parvathi@couthit.com>
 <20250407113714.1050076-6-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407113714.1050076-6-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_211910_550518_A7D525C5 
X-CRM114-Status: UNSURE (   5.56  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, basharath@couthit.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> +#define PRUETH_MODULE_VERSION "0.2"

> +static void icssm_emac_get_drvinfo(struct net_device *ndev,
> +				   struct ethtool_drvinfo *info)
> +{
> +	strscpy(info->driver, PRUETH_MODULE_DESCRIPTION, sizeof(info->driver));
> +	strscpy(info->version, PRUETH_MODULE_VERSION, sizeof(info->version));

Driver version numbers are pointless, they never change, but the
kernel is changing all the time. Leave version blank, and the core
will fill in the kernel version, which is useful.

     Andrew

