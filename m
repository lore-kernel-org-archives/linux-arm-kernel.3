Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8056CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obEQVdyJXAFkEI0Je/LnT9feisCX7gXrGWaTmDNS/as=; b=WBVBgxqWZvUJOqHr4Cr6KEYFTQ
	2vfc8Lq+jrVjPLCBFmsmSeaPR2o8KSNgJkDXpsI257ywZt4VwbSY81r2wWJcLZVAfZ+6D7sg0mx3a
	ieZ0LXHB7H7weOpGJEa00Co1aH5KPGE4QTAsV9cWuQQeC2h59gMd/L3Ifq0/he7T/jKwY0Kbw4Ujs
	Z5792HGTrz2HLmZCp0iUXr1phCUpQPMe5BXp2u02RbKxbD0szDfa7sOuiRv/hFRS+6FOPya1+tbKd
	7HmI1JtAYMf5KvNOmxPO03zYMHhMB8E48DSv18Vo+RRaiucBHXmygDsW1HwWNs51c1lbv5k0u9qQj
	UQ6AULUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWUF-00000003Ckw-2gzm;
	Mon, 08 Jun 2026 09:41:39 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWU9-00000003Cjj-3hEc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:41:38 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260608094127euoutp02a25129a3aced8e1d4d0e8f7df11908f3~3Eb6L4rvK1359613596euoutp02T
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 09:41:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260608094127euoutp02a25129a3aced8e1d4d0e8f7df11908f3~3Eb6L4rvK1359613596euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1780911687;
	bh=obEQVdyJXAFkEI0Je/LnT9feisCX7gXrGWaTmDNS/as=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CtDu0a8cImy5JxUjV9LlIN1j5eGanH+PqXyibLEZXNH9fJe274NoQAk/Q2h19A2Im
	 7QyqlhJENEB6aMlSbzDiBLNNr6vHhfJ3ksGVoYNZQy2OCt9DlE9s9uTni76Rni1MPt
	 LbC0RGfORp+p2SBwZJHvG/Z6YosO+MwklwkJR46I=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260608094127eucas1p1c139d6aec7fe2c8dd308e1885033ff6e~3Eb56fxPn2011920119eucas1p1x;
	Mon,  8 Jun 2026 09:41:27 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260608094126eusmtip2229735d838ef62408503f8ed036fe734~3Eb4yXZk_2588725887eusmtip2-;
	Mon,  8 Jun 2026 09:41:26 +0000 (GMT)
Date: Mon, 8 Jun 2026 11:41:25 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Ding Hui <dinghui1111@163.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Ding Hui <dinghui@lixiang.com>, "open
 list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>, xiasanbo@lixiang.com,
	yangchen11@lixiang.com, liuxuanjun@lixiang.com
Subject: Re: [PATCH v3] net: stmmac: fix fatal bus error on resume by
 reinitializing RX buffers
Message-ID: <aiaORbb0lZVxDg8L@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20260604144557.3175399-1-dinghui1111@163.com>
X-CMS-MailID: 20260608094127eucas1p1c139d6aec7fe2c8dd308e1885033ff6e
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----ri_B_5NHaOs85FNcStlWAa-YkdjA1OEu4E44JRLWFc1KTRWK=_126c1_"
X-RootMTR: 20260604144752eucas1p180b6c1b783450a11e78584257e023f69
X-EPHeader: CA
X-CMS-RootMailID: 20260604144752eucas1p180b6c1b783450a11e78584257e023f69
References: <CGME20260604144752eucas1p180b6c1b783450a11e78584257e023f69@eucas1p1.samsung.com>
	<20260604144557.3175399-1-dinghui1111@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_024134_516567_A6B4821D 
X-CRM114-Status: GOOD (  13.85  )
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

------ri_B_5NHaOs85FNcStlWAa-YkdjA1OEu4E44JRLWFc1KTRWK=_126c1_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 04, 2026 at 10:45:54PM +0800, Ding Hui wrote:
> From: Ding Hui <dinghui@lixiang.com>
> +	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
> +		ret = stmmac_reinit_rx_descriptors(priv, &priv->dma_conf,
> +						   queue);
> +		if (ret) {
> +			netdev_err(priv->dev,
> +				   "%s: rx desc reinit failed on queue %u\n",
> +				   __func__, queue);
> +			mutex_unlock(&priv->lock);
> +			rtnl_unlock();
> +			return ret;
> +		}
> +	}

This is not directly related to the patch, but rather stmmac_resume() itself,
but doesn't this return and hw_setup one leave bunch of descriptor memory
hanging and effectively leaked?

> +
>  	ret = stmmac_hw_setup(ndev);
>  	if (ret < 0) {
>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
> -- 

Other than that, I don't see any obvious issues.

Reviewed-by: Jakub Raczynski <j.raczynski@samsung.com>

------ri_B_5NHaOs85FNcStlWAa-YkdjA1OEu4E44JRLWFc1KTRWK=_126c1_
Content-Type: text/plain; charset="utf-8"


------ri_B_5NHaOs85FNcStlWAa-YkdjA1OEu4E44JRLWFc1KTRWK=_126c1_--

