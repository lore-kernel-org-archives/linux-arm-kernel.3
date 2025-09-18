Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32A9CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auJypmeJ+OauCPuHoVkkb7kVeyHnCM7wOf2csNOyrVY=; b=5EmWey7Ud7rgvFeaTt1W0pcBof
	SpIxMXg6W0VmxEYAmsczz6aHTAmGNsiFiBaKQAJ68jp9nNJ6GtXbJHJFIVM0Zc3LltCYCmeiLSIN7
	WAZEG9YFYz88dPVe2LwAdyZqGcN34VDDIQ+ZyKT29Uz57T+aXxcik/lakwufZDs7IXOIpEavVvQ5g
	qhw38CHJF3jzun97c/rHH7NYYY8EMAq3STw0Pw7j/O3RDL9jElPfCvz+/dkWtTNPIeSiiWQ/cWjqD
	c8itrT+zz4vsZErf0s/wfXO6KU4hCrCRTIHRN51yER3WF98vlHW9C4JtckXBSQVtGj4ZwJo3lHwxd
	ei8nzF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHPp-00000000bvt-0Yeh;
	Thu, 18 Sep 2025 16:23:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHPm-00000000buC-1NSD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=auJypmeJ+OauCPuHoVkkb7kVeyHnCM7wOf2csNOyrVY=; b=gC3GzEZpYgzgaODE8Qx09xGxd5
	aKmaCrfkx6RvRQi5dtsT6j6wCHLtcxDGkrAWRmeyif2AuS15ZLiOHDkw19LuQPA/tUPgqAyj81VBA
	y/ODtYc1TLaYdO8IvF8nF24U9CTIWGwrv92jSCr/g8N8c4KlN1lH8J0Y4kBFbBHye7jU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uzHPN-008qth-Hn; Thu, 18 Sep 2025 18:22:57 +0200
Date: Thu, 18 Sep 2025 18:22:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: weishangjuan@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
	rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
	anthony.l.nguyen@intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	jan.petrous@oss.nxp.com, jszhang@kernel.org, inochiama@gmail.com,
	0x1207@gmail.com, boon.khai.ng@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v7 2/2] ethernet: eswin: Add eic7700 ethernet driver
Message-ID: <28e282d0-ca3d-43ce-8c10-3517ca963a3b@lunn.ch>
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918090026.3280-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918090026.3280-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_092322_367930_0A1F6C22 
X-CRM114-Status: UNSURE (   7.71  )
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

On Thu, Sep 18, 2025 at 05:00:26PM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add Ethernet controller support for Eswin's eic7700 SoC. The driver
> implements hardware initialization, clock configuration, delay
> adjustment functions based on DWC Ethernet controller, and supports
> device tree configuration and platform driver integration.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

