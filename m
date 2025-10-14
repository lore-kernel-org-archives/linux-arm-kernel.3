Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D34CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 22:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6apl9zwMRvC9w1MSyQud4IEH3rhHD5ExcGX4ewXJTBU=; b=mQqWybyvK4lOKbTU+8WLxuKaQE
	sCexRRCQTbGtFnh4iD7Lq/1ycZXE36ycp5Kxr0LNjiqhO01staUobvx04CQJHCe15MfEmN/bMEsK6
	rFHzeV8640XceM9jmhfqL2xul6QfLsxDza4v4ZCu3i8xCGSNWUJigQOprss45DJmPZ/hjENlADBXW
	BkbjcvgzMGaCC5o/VjIdds8y13vtQUQbpSdNH86Q1FuQ3p/I5AzKaAYu8m1HDZ6sHTJQFckqA2wc3
	OkCazgVRbe3o7V+rURhh94XmQmW+yOYYr11+AypqDzco8n0f+2+4PQInvmtU5KEmH6v2o50Q4jDrP
	h0lHlbFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8nKg-0000000HXQp-4An9;
	Tue, 14 Oct 2025 22:17:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8nKd-0000000HXPe-3OBj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 22:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6apl9zwMRvC9w1MSyQud4IEH3rhHD5ExcGX4ewXJTBU=; b=KePzjVzVewfO8IGELrYbs2T5+F
	Oh1qgYg1Zfwt5FY2GboRh/APnHibBpV0bmoaZbgERvoSe0R6dJVK3LGi6hZGjsvZzhWoO6lsnbxyo
	sCAtIzy5Eg3mX22+ZRgZcZLQ6FUW1wTgOVzRjFxjj9N+js1m/W8snRKsW12O+/IA7XwE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8nKU-00AxTN-PQ; Wed, 15 Oct 2025 00:17:14 +0200
Date: Wed, 15 Oct 2025 00:17:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com,
	rogerq@kernel.org, pmohan@couthit.com, basharath@couthit.com,
	afd@ti.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pratheesh@ti.com,
	prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com,
	rogerq@ti.com, krishna@couthit.com, mohan@couthit.com
Subject: Re: [PATCH net-next v3 2/3] net: ti: icssm-prueth: Adds switchdev
 support for icssm_prueth driver
Message-ID: <ce87a72f-09b3-4615-aab9-2be8648300f8@lunn.ch>
References: <20251014124018.1596900-1-parvathi@couthit.com>
 <20251014124018.1596900-3-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014124018.1596900-3-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_151723_843495_5F5B5A55 
X-CRM114-Status: GOOD (  12.52  )
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

> +static struct prueth_fw_offsets fw_offsets_v2_1;
> +
> +static void icssm_prueth_set_fw_offsets(struct prueth *prueth)
> +{
> +	/* Set VLAN/Multicast filter control and table offsets */
> +	if (PRUETH_IS_EMAC(prueth)) {
> +		prueth->fw_offsets->mc_ctrl_byte  =
> +			ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_OFFSET;
> +		prueth->fw_offsets->mc_filter_mask =
> +			ICSS_EMAC_FW_MULTICAST_FILTER_MASK_OFFSET;
> +		prueth->fw_offsets->mc_filter_tbl =
> +			ICSS_EMAC_FW_MULTICAST_FILTER_TABLE;

I know for some of these SoCs, there can be multiple instances of the
hardware blocks. It looks like that will go wrong here, because there
is only one fw_offsets_v2_1 ?

Humm, actually, if this are constant, why have fw_offsets_v2_1? Just
use ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_OFFSET directly?

> +static void icssm_emac_mc_filter_ctrl(struct prueth_emac *emac, bool enable)
> +{
> +	struct prueth *prueth = emac->prueth;
> +	void __iomem *mc_filter_ctrl;
> +	void __iomem *ram;
> +	u32 mc_ctrl_byte;
> +	u32 reg;
> +
> +	ram = prueth->mem[emac->dram].va;
> +	mc_ctrl_byte = prueth->fw_offsets->mc_ctrl_byte;
> +	mc_filter_ctrl = ram + mc_ctrl_byte;

mc_filter_ctrl = ram + ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_OFFSET; ???

> +static void icssm_prueth_sw_fdb_work(struct work_struct *work)
> +{
> +	struct icssm_prueth_sw_fdb_work *fdb_work =
> +		container_of(work, struct icssm_prueth_sw_fdb_work, work);
> +	struct prueth_emac *emac = fdb_work->emac;
> +
> +	rtnl_lock();
> +
> +	/* Interface is not up */
> +	if (!emac->prueth->fdb_tbl) {
> +		rtnl_unlock();
> +		goto free;
> +	}

I would probably put the rtnl_unlock() after free: label.

> +
> +	switch (fdb_work->event) {
> +	case FDB_LEARN:
> +		icssm_prueth_sw_insert_fdb_entry(emac, fdb_work->addr, 0);
> +		break;
> +	case FDB_PURGE:
> +		icssm_prueth_sw_do_purge_fdb(emac);
> +		break;
> +	default:
> +		break;
> +	}
> +	rtnl_unlock();
> +
> +free:
> +	kfree(fdb_work);
> +	dev_put(emac->ndev);
> +}

	Andrew

