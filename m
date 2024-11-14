Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD6CD68B32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 15:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4EZ3jl6nOJdqJAgt3wJNi7n9xQj+CzVY+eMw04jHG4=; b=0exzZcU31Ktxwv714BtHVLvAc6
	5a1jY2mKdANV4IUOkw+BlGSsMm8VpQmVsiWDJMxDhMaMtCduq68o+evMMBsbMTtC2iBse+kPaRc8H
	0TcnGKF8b6IiA23+NWcy8I9V04InlWlfVwlAIaWF8kT+nRh4Q2fxSnTy/ScmZaEZ0S/wB9y/XtygO
	hwtS/4/WLnx7QvDKn8p6Hg17a1Uvc8iZXRKRmqnqfsKfIAbNAakZCnUvIt2Wf8fHLJ2k5TnN/84cN
	fQ8nCm1b8rxUtAX/VlPDbQGic4HrRK/jeUbLrrIwyWlUVaEw39eFqkLzE87d6MBA2xiP/ugSJrDKI
	H7yPBZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbru-0000000018p-48KP;
	Thu, 14 Nov 2024 15:34:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbqg-000000000YV-31Xn;
	Thu, 14 Nov 2024 15:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=G4EZ3jl6nOJdqJAgt3wJNi7n9xQj+CzVY+eMw04jHG4=; b=rUwt46Zez10UJ8W0ckfKsbtoTq
	x2S5LRlUHPXEcceM7uJZuiR9eRSfX8dvUz1C+V4g4K73c3YOI53zwAyzVsKK4A/XvXkdZcI4dV5Pv
	6pu12wjuWJHLBtM4IX87wOayueKLhV6oAEhIqQyK0aldO5epFecK07i1o33aSeO/iXPM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tBbqO-00DJTv-Ey; Thu, 14 Nov 2024 16:33:16 +0100
Date: Thu, 14 Nov 2024 16:33:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: wojackbb@gmail.com
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [net-next,v2] [PATCH net-next v2] net: wwan: t7xx: Change
 PM_AUTOSUSPEND_MS to 5000
Message-ID: <546f1456-87f2-4e54-a486-86cac1504a3d@lunn.ch>
References: <20241114102002.481081-1-wojackbb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114102002.481081-1-wojackbb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_073334_924879_366344F6 
X-CRM114-Status: UNSURE (   9.86  )
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

On Thu, Nov 14, 2024 at 06:20:02PM +0800, wojackbb@gmail.com wrote:
> From: Jack Wu <wojackbb@gmail.com>
> 
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
> 
> We tested Fibocom FM350 and our products using the t7xx and they all
> benefited from this.
> 
> Signed-off-by: Jack Wu <wojackbb@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

