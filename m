Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE83606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b2UoAH3B;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mV5QDOdV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eOuijn9PgMv6riyIyWWQRIh5Cc6DVi7OfQ5u48jI3VQ=; b=b2UoAH3BslRn4v
	TdLyNwho3gDyI0axmKwty+uGx/qZTXfN8MZWQky/Mk+Xe0QE6+bBSvzthCId4vDG5AvTYlcoqj6J9
	gM0sWrOaBiUpNG7TxF2RMEu7oIxMrBo2QFysG2gxdpiNn5rVWRwKbiDgiNV7NK3NwLe3HR4rplTnT
	fU9FOZNBxKZsYBEWMDgjZBj03I5q+X7ZKbhmXTcl+qGWr9CozY8XHJwSsO7eXB0BotCqMWNczD6Q8
	ep2hwjmLqhwC+xxUiNuhdedLsGcuuLKB8M3c3rqQw+qdwRs/AHdwa6G7Ua+sZc/SUBxzxbzB07+dj
	emSKEyjC10R7VzApx1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLBU-00000008g7K-0CAj;
	Thu, 29 Oct 2026 08:08:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLBP-00000008g6a-1hRT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 08:08:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 97CC94E41387;
	Thu, 29 Oct 2026 08:08:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C71160360;
	Thu, 29 Oct 2026 08:08:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 046A1103290ED;
	Thu, 29 Oct 2026 09:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793261297; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=eOuijn9PgMv6riyIyWWQRIh5Cc6DVi7OfQ5u48jI3VQ=;
	b=mV5QDOdVzDfl4NIwYDrDcY1+KRvU/6S0qUUQfABjFDGmPmboTiIQtG/U0mLR6Hm9eamKcC
	KufXt7HXmWRyDDQR/LsK9rBG/g6qGtLYjSQ0Fw4vkA0HGdi6tjfkLxgmxIgs+g2GibnUX0
	1hFSBd9kwzVJxSxcDi950sVPJc/DjaUqIRI7m8BQBwZVMMMo/Wd7fGRNrV91dk1JBerhr1
	dL9QsVmgfMcuRfLE7QFmzgtU2r/XUbH1igFjY+BftdQ1E24BggW2uVz5CCtK3BhVNlljY6
	LgkWJ0W6Y9PUVF27wVXMFtZ5+Nw5qAnRcKi1HRkATNqws3atXh6DLb7Y/zEwWg==
Message-ID: <a71e5698-1ab3-4032-8905-3ada901d799e@bootlin.com>
Date: Thu, 29 Oct 2026 09:08:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 1/3] net: stmmac: initialize est_lock at probe time
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <Jose.Abreu@synopsys.com>,
 James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261026-stmmac-est-fixes-v4-0-999dac4de44f@oss.qualcomm.com>
 <20261026-stmmac-est-fixes-v4-1-999dac4de44f@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261026-stmmac-est-fixes-v4-1-999dac4de44f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_010823_746975_42A3160E 
X-CRM114-Status: GOOD (  17.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 10/26/26 17:55, Lorenzo Bianconi wrote:
> priv->est is allocated with devm_kzalloc() on the first TAPRIO REPLACE
> and priv->est_lock is initialized in the same place, which ties the
> validity of the lock to whether TAPRIO has ever been configured. The
> lock is also never destroyed.
> 
> Initialize priv->est_lock in __stmmac_dvr_probe() next to priv->lock
> and destroy it in stmmac_dvr_remove(). This keeps the lock valid for
> the entire lifetime of the device, independent of the TAPRIO state,
> and removes the lazy initialization from the TAPRIO configuration
> path.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b20e5038eead..9e09e11cc35e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8204,6 +8204,7 @@ static int __stmmac_dvr_probe(struct device *device,
>  	stmmac_napi_add(ndev);
>  
>  	mutex_init(&priv->lock);
> +	mutex_init(&priv->est_lock);
>  	rwlock_init(&priv->ptp_lock);
>  
>  	stmmac_fpe_init(priv);
> @@ -8337,6 +8338,7 @@ void stmmac_dvr_remove(struct device *dev)
>  
>  	destroy_workqueue(priv->wq);
>  	mutex_destroy(&priv->lock);
> +	mutex_destroy(&priv->est_lock);
>  	bitmap_free(priv->af_xdp_zc_qps);
>  
>  	pm_runtime_disable(dev);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index e137fb9012d4..aea235a69105 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -1028,8 +1028,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  					 GFP_KERNEL);
>  		if (!priv->est)
>  			return -ENOMEM;
> -
> -		mutex_init(&priv->est_lock);
>  	} else {
>  		mutex_lock(&priv->est_lock);
>  		memset(priv->est, 0, sizeof(*priv->est));
> 


