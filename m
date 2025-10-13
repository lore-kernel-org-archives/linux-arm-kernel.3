Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54555CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qKxErbeKsELIXeWVirY4FlojRrGvEUsN7SYeWPCecw=; b=Xs9dwMovnKN7EPYS4hDk2IdH6X
	EGgvfcsY4wG99vUZAEkGhAgzMjRs1++oZPwwdPqcopnKJwv5TiIaf+D/bpVuhTR1Z9YFlR5bhzNZc
	pX3AMM13uskq73pCPd9m8YNnvZdS+6esLNt4yLkzB8Y1KF9iUIFacBf8bE3vBgmpr+IjMbbq4eFGO
	2rRYpjCQl+qvuHHXDhPCi9YJjaQA9EghV3nCV2Tj4XOh0m7D3Y8PAB3pW1TZJ5xmNFQAmzJnINz3i
	Yvaswd35wDwY3c8N6JS36IcGsIC0draevoD1RAX8SJvd03YRyhYfKOj7Iv83m/refLcyQgux3r9uJ
	vvw3TsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Js7-0000000DUzQ-1X7A;
	Mon, 13 Oct 2025 14:49:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Js3-0000000DUyj-48uQ;
	Mon, 13 Oct 2025 14:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2qKxErbeKsELIXeWVirY4FlojRrGvEUsN7SYeWPCecw=; b=cuGA2kXHja13naV529qo2t4NQd
	KKPD3if8jNkfykGKPZU9y0o2N4bOWs3JZO609thXeECjVz/U7mmq9NqYLACzRDH+C2JMQkUytABmh
	8PifESd/sq7yCIbOQfrI0fVL7lKRp8tzLXJ/2weSkOTKajX8FVQrdGfgPINXrhR2arkQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8Jru-00AnSe-60; Mon, 13 Oct 2025 16:49:46 +0200
Date: Mon, 13 Oct 2025 16:49:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: airoha: Add missing stats to
 ethtool_eth_mac_stats
Message-ID: <76070c7c-38f9-4a78-a550-61825895fced@lunn.ch>
References: <20251013-airoha-ethtool-improvements-v1-0-fdd1c6fc9be1@kernel.org>
 <20251013-airoha-ethtool-improvements-v1-1-fdd1c6fc9be1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-airoha-ethtool-improvements-v1-1-fdd1c6fc9be1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_074957_542950_CA2D3CCB 
X-CRM114-Status: UNSURE (   6.84  )
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

On Mon, Oct 13, 2025 at 04:29:41PM +0200, Lorenzo Bianconi wrote:
> Add the following stats to ethtool ethtool_eth_mac_stats stats:
> - FramesTransmittedOK
> - OctetsTransmittedOK
> - FramesReceivedOK
> - OctetsReceivedOK
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

