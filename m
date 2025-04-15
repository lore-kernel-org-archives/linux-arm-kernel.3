Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D11C369C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 20:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaeFA0Y7xJx8dsJ6LbYVH71W/pq6X6iYF8gAUrFlMG4=; b=wq33F5F95V2IDiKSZm/6ZNSIMj
	KFRlxQ5YPj58wAa6tsyLyIOyJTzWNHft67I2ihF/JTsSgxZiCjivq2UcN/VRU7twR8TTShc4L37C6
	0VE07KwpdZMhNnWvCID4XRF6zZtDOLBg5SJ2RlBUINpGacaNCMS9t4vrwODGC6BTWqrOvsIa8UDyT
	rFgpYdNrkpPg2ykNkIHomEkNez/6Abhn6dPHa30G9bfx8QKzBl1K0245FJoswu1WpHgovNzlbZ+Gi
	G5MfjdAz/YH6A9AuBexqBr9RwSt/0YKE5TyrcH5bwcST9CwPD7SD1hdtZGP8AI+1DIPR749EtRVib
	eVPs7utQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4mjH-000000071De-0iGf;
	Tue, 15 Apr 2025 20:17:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4mhP-000000070nb-0VJN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 20:16:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A59C2A49ED9;
	Tue, 15 Apr 2025 20:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC866C4CEEF;
	Tue, 15 Apr 2025 20:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744748161;
	bh=onoj2sY2pyRxx4KUIk19sDKIQq9HSXI7b26/f+g5/H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sR/opIAZgI/JM4gAz42+NTOAd9pYk557QzcLMeVNiNsHRZj/cM1mgaTUM1DYhHN9q
	 B/GjrV7+ImrPxGFTnWSLz9mpniB8tlKb3nzqVsn8x2FjY1ya7qid9viXvtcrSpytru
	 y5JbFPur9TUmBlgLIqiugRNhEjdSnuj4t0ls6qJihhAk+NCJjQwWGJqIeIqK2E2VqH
	 xYxF5olNRHXaR4WgW6IFl76b6WsHM1+4X3TCh5QqBWIaD7mITcUtnSZNqFwbkOUeCG
	 oqaPut7Mh0Jlfw8Q3I/FfgATvp9I082ATAmmAtb1jknPY4UyxZ6wZ1E78WK5gbC8Jg
	 aVxNO8fssfV1A==
Date: Tue, 15 Apr 2025 21:15:52 +0100
From: Simon Horman <horms@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v5 11/11] net: ti: prueth: Adds PTP OC Support
 for AM335x and AM437x
Message-ID: <20250415201552.GJ395307@horms.kernel.org>
References: <20250414113458.1913823-1-parvathi@couthit.com>
 <20250414140751.1916719-12-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414140751.1916719-12-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_131603_289452_9379A7C8 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, basharath@couthit.com, kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Apr 14, 2025 at 07:37:51PM +0530, Parvathi Pudi wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> PRU-ICSS IEP module, which is capable of timestamping RX and
> TX packets at HW level, is used for time synchronization by PTP4L.
> 
> This change includes interaction between firmware/driver and user
> application (ptp4l) with required packet timestamps.
> 
> RX SOF timestamp comes along with packet and firmware will rise
> interrupt with TX SOF timestamp after pushing the packet on to the wire.
> 
> IEP driver available in upstream linux as part of ICSSG assumes 64-bit
> timestamp value from firmware.
> 
> Enhanced the IEP driver to support the legacy 32-bit timestamp
> conversion to 64-bit timestamp by using 2 fields as below:
> - 32-bit HW timestamp from SOF event in ns
> - Seconds value maintained in driver.
> 
> Currently ordinary clock (OC) configuration has been validated with
> Linux ptp4l.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>

...

> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.h b/drivers/net/ethernet/ti/icssg/icss_iep.h
> index 0bdca0155abd..437153350197 100644
> --- a/drivers/net/ethernet/ti/icssg/icss_iep.h
> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.h
> @@ -47,6 +47,11 @@ enum {
>  	ICSS_IEP_MAX_REGS,
>  };
>  
> +enum iep_revision {
> +	IEP_REV_V1_0 = 0,
> +	IEP_REV_V2_1
> +};
> +
>  /**
>   * struct icss_iep_plat_data - Plat data to handle SoC variants
>   * @config: Regmap configuration data
> @@ -57,11 +62,13 @@ struct icss_iep_plat_data {
>  	const struct regmap_config *config;
>  	u32 reg_offs[ICSS_IEP_MAX_REGS];
>  	u32 flags;
> +	enum iep_revision iep_rev;
>  };

Please add iep_rev to the Kernel doc for struct icss_iep_plat_data.

Flagged by ./scripts/kernel-doc -none

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h b/drivers/net/ethernet/ti/icssm/icssm_prueth.h

...

> @@ -337,6 +343,7 @@ enum pruss_device {
>  struct prueth_private_data {
>  	enum pruss_device driver_data;
>  	const struct prueth_firmware fw_pru[PRUSS_NUM_PRUS];
> +	enum fw_revision fw_rev;
>  	bool support_lre;
>  	bool support_switch;
>  };

And, likewise, please add fw_rev to the Kernel doc for struct
prueth_private_data.

...

