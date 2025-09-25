Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92590CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTdc+5XjoLirKBt3ethpIIBo+vHjglYjK+kcoXPxeLY=; b=OGKfob16Bghba1NbhgfYzqbOTi
	Dk48SZ9ueauJIwZB8El2KY0B+hje1SnC0pi+wf9xBjJ326KPJuMEQ1d8Tl2lAlwlGabK6m/xkkMQl
	Gtbgkv/7zu8E2gxdW6UXBko3iLhqzFsIEuaVtUnFj56qEH3Y6mCaoLwtiwMDF+kuFf0L3pmqPDADR
	carQ4T5F7kENpiPL4eI0dmdjxfvAqvZG3IWQXAkd9rJP9pORIm36KUAK9WxY25GTj7f/Oh5lQ2qdX
	CXXDj38V7u7PwAIHI8J/bRG6xpd8O+PLbcQmRqrXbY5D6O3DpPNpU/Eab+Mrkzm2N2PJQPG3nRlIQ
	WaCZAXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n2g-0000000A6t3-0mcq;
	Thu, 25 Sep 2025 14:33:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n2e-0000000A6qe-0DM3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HTdc+5XjoLirKBt3ethpIIBo+vHjglYjK+kcoXPxeLY=; b=nxJd77l5fQBCkfr0N5hryU63O3
	jA9+TLurVpNTJ3v6Da6K8YjXd50UXpqhomuJFg4dyxqoQIZoGhXkzTPHW/d1sGNg//cwuzaF2QTVC
	PkIuoYl3MNITuzoFUYCM7W/+9r9b573D4odm4+02hwxx76f0GCghN6gqM66WQx9T7K3U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v1n2S-009Tak-9J; Thu, 25 Sep 2025 16:33:40 +0200
Date: Thu, 25 Sep 2025 16:33:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com,
	rogerq@kernel.org, pmohan@couthit.com, basharath@couthit.com,
	afd@ti.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pratheesh@ti.com,
	prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com,
	rogerq@ti.com, krishna@couthit.com, mohan@couthit.com
Subject: Re: [PATCH net-next 1/3] net: ti: icssm-prueth: Adds helper
 functions to configure and maintain FDB
Message-ID: <02f2c50f-31f6-4d4a-9cbe-5f77d1d60706@lunn.ch>
References: <20250925141246.3433603-1-parvathi@couthit.com>
 <20250925141246.3433603-2-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925141246.3433603-2-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_073352_088395_8A8C776C 
X-CRM114-Status: GOOD (  22.70  )
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

> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth_fdb_tbl.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2019-2021 Texas Instruments Incorporated - https://www.ti.com */
> +#ifndef __NET_TI_PRUSS_FDB_TBL_H
> +#define __NET_TI_PRUSS_FDB_TBL_H
> +
> +#include <linux/kernel.h>
> +#include <linux/debugfs.h>
> +#include "icssm_prueth.h"
> +
> +#define ETHER_ADDR_LEN 6

Please use ETH_ALEN everywhere.

> +static void icssm_prueth_sw_fdb_spin_lock(struct fdb_tbl *fdb_tbl)
> +{
> +	/* Take the host lock */
> +	writeb(1, (u8 __iomem *)&fdb_tbl->locks->host_lock);
> +
> +	/* Wait for the PRUs to release their locks */
> +	while (readb((u8 __iomem *)&fdb_tbl->locks->pru_locks))
> +		;

Don't use endless loops. What happens if the firmware crashed. Please
use something from iopoll.h and handle -ETIMEDOUT.

> +static void icssm_mac_copy(u8 *dst, const u8 *src)
> +{
> +	u8 i;
> +
> +	for (i = 0; i < ETHER_ADDR_LEN; i++) {
> +		*(dst) = *(src);
> +		dst++;
> +		src++;
> +	}
> +}

There is a kernel helper for this.

> +
> +static s8 icssm_mac_cmp(const u8 *mac_a, const u8 *mac_b)
> +{
> +	s8  ret = 0, i;
> +
> +	for (i = 0; i < ETHER_ADDR_LEN; i++) {
> +		if (mac_a[i] == mac_b[i])
> +			continue;
> +
> +		ret = mac_a[i] < mac_b[i] ? -1 : 1;
> +		break;
> +	}
> +
> +	return ret;
> +}

I suspect there is also a helper for this. Please don't reinvent what
the kernel already has.

> +static s16
> +icssm_prueth_sw_fdb_find_bucket_insert_point(struct fdb_tbl *fdb,
> +					     struct fdb_index_tbl_entry_t
> +					     *bkt_info,
> +					     const u8 *mac, const u8 port)
> +{
> +	struct fdb_mac_tbl_array_t *mac_tbl = fdb->mac_tbl_a;
> +	struct fdb_mac_tbl_entry_t *e;
> +	u8 mac_tbl_idx;
> +	s8 cmp;
> +	int i;
> +
> +	mac_tbl_idx = bkt_info->bucket_idx;
> +
> +	for (i = 0; i < bkt_info->bucket_entries; i++, mac_tbl_idx++) {
> +		e = &mac_tbl->mac_tbl_entry[mac_tbl_idx];
> +		cmp = icssm_mac_cmp(mac, e->mac);
> +		if (cmp < 0) {
> +			return mac_tbl_idx;
> +		} else if (cmp == 0) {
> +			if (e->port != port) {
> +				/* MAC is already in FDB, only port is
> +				 * different. So just update the port.
> +				 * Note: total_entries and bucket_entries
> +				 * remain the same.
> +				 */
> +				icssm_prueth_sw_fdb_spin_lock(fdb);
> +				e->port = port;
> +				icssm_prueth_sw_fdb_spin_unlock(fdb);
> +			}
> +
> +			/* MAC and port are the same, touch the fdb */
> +			e->age = 0;
> +			return -1;

Returning values like this can result in bugs. It is better to use a
real error code, just in case this ever makes it way back to
userspace.

	Andrew

