Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CD0E67493
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 01:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zawj+nQkJIKTPKzueNaTx4vatHNfGjr+Nht902MSMPY=; b=lJ4fjG80PtGKNYoVSveF85FltA
	VmEOXk/I2glLWFBH/r3XI2Ax82YxP8i45hlsS6h7+12XUsw34EnKXwNDLnlSHM06Q8M7VebnhGr98
	pft75yUSlRaR5qSjZ7h9zSkiMS/8euMna2etG1OovJlyuyDC/+UiY/1Vx6DWLsKKj8o6+yCPE8qww
	ulDVCv5VfghyhOpbvM2n6MVC1u9ujkSuaMweIVVHD7iI7vpKbZiurXsWRCfbtJcFgxFFodrsGuABO
	rbd/hYw/MUb8PxvMaAYrHRFJ4KbSWEDCmEjUN77tH2GxoiWIETNDCL4WvQWADQJlGzja/o76kbbPW
	P84LG1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6gr3-00000005UPl-13av;
	Fri, 01 Nov 2024 01:53:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6gpN-00000005U2u-0Brj;
	Fri, 01 Nov 2024 01:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B5312A42F8A;
	Fri,  1 Nov 2024 01:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F491C4CEC3;
	Fri,  1 Nov 2024 01:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730425912;
	bh=tXK/7nqEpwz2TcEyr9H3mzOgohqDogAx76vxMxbvd20=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=giePI72i0ulqtcYect1ACj6IjNTtFq11gtGGGDS10PTzrDbuMANqy2C7koOyY4MoX
	 TyYEIyqb6kDK03T5RzErUONt3rkAnq68pxw9pEIFM0RxNzeJOF/vHRf1jVt158GSBD
	 ZCTinTZdoX1PYLqNI162lCItV6TcRLOKS8/ZuCSy//cgC1jTXFVCgLcobop94A8kVu
	 FutP1QoF8A23WAnEKEMmm+6uwo+hvRaU+faLnlFlkWbMk2fL98h1lFjPDvg6z3pIcy
	 AFWxeUPMRaqAttCWKnPYX+pWDduC0j27xgteBFU2YqfB+rK5MjeyJXEoPPF8fTND6t
	 J6+pi14D1Pgjg==
Date: Thu, 31 Oct 2024 18:51:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: wojackbb@gmail.com
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
 chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
 m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
 loic.poulain@linaro.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [PATCH] [net] net: wwan: t7xx: Change PM_AUTOSUSPEND_MS to 5000
Message-ID: <20241031185150.6ef22ce0@kernel.org>
In-Reply-To: <20241028073015.692794-1-wojackbb@gmail.com>
References: <20241028073015.692794-1-wojackbb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_185153_186891_5DC0C65B 
X-CRM114-Status: UNSURE (   9.02  )
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

On Mon, 28 Oct 2024 15:30:15 +0800 wojackbb@gmail.com wrote:
> Because optimizing the power consumption of t7XX,
> change auto suspend time to 5000.
> 
> The Tests uses a script to loop through the power_state
> of t7XX.
> (for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)
> 
> * If Auto suspend is 20 seconds,
>   test script show power_state have 0~5% of the time was in D3 state
>   when host don't have data packet transmission.
> 
> * Changed auto suspend time to 5 seconds,
>   test script show power_state have 50%~80% of the time was in D3 state
>   when host don't have data packet transmission.

I'm going to drop this from PW while we wait for your reply to Sergey
If the patch is still good after answering his questions please update
the commit message and resend with a [net-next] tag (we use [net] to
designate fixes for current release and stable)

