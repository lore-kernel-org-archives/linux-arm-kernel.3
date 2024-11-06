Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49040D59F5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 18:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BSemyVMGpWRmaclhSQib1OHQ2qqrpJSSSRuHRaY9Tg=; b=2rh4p7VGEdBVtmRFBNw7IpPwnA
	gdMTFm3o0ldvblWCpv5kLvwGbmFMKUu0yqXLZk6MZ2yVNLoUdn9gFlkBrcyEWqgxgnCl3lswQnDvK
	JEz/Y5nMaT+XtKZxmDJvgATS2V6xOIDcKXcZ4RGi/MuSX4dtVmp+daBkUo/Hbcp7+afUYJoE3sAZn
	PECZG2kkCIni+93TvKqup+iivwyE0S4d1ET0aLDCPMgEox27mXqENW4y5sg33ihwqBKMMwbX7eOZ3
	OrBimNrBj+xDK649Fqwzola01s/QAjO5xGVY3x5o3IQYelyX7JG3ZJKYbW7d7pqN4BCfSEeDOTtIL
	KSvmn5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kRY-00000004HkQ-2EnB;
	Wed, 06 Nov 2024 18:07:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kOX-00000004HHN-3MWc;
	Wed, 06 Nov 2024 18:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/BSemyVMGpWRmaclhSQib1OHQ2qqrpJSSSRuHRaY9Tg=; b=fUOWUF6dHNWVDwLgJ6CgXfzzJR
	JAYPsmgTh+NvEfMz1y+4ppmx2ACqt6TcZ6GPSWhCvf70puDXwCCU9Axfm4yzh+04egG3piG88he7y
	y4PhVZRtbugVm3Fz9YQhf98tK0vIcwiHiqDwbE/f/gAhEB96OfnV1YeF3hdJ0YDHMF9I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t8kOH-00CMh5-A8; Wed, 06 Nov 2024 19:04:25 +0100
Date: Wed, 6 Nov 2024 19:04:25 +0100
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
Subject: Re: [PATCH] [net-next] net: wwan: t7xx: Change PM_AUTOSUSPEND_MS to
 5000
Message-ID: <d2f54fde-1d98-4925-866a-1d755956bbce@lunn.ch>
References: <20241106104005.337968-1-wojackbb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106104005.337968-1-wojackbb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_100441_863256_EBDF1DA9 
X-CRM114-Status: GOOD (  11.00  )
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

On Wed, Nov 06, 2024 at 06:40:05PM +0800, wojackbb@gmail.com wrote:
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

Please add the justification for changing this globally, that you
tested a number of different machines using the t7xx and they all
benefited from this.

    Andrew

---
pw-bot: cr

