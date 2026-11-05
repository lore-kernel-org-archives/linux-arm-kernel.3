Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB3E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T3L/R+Iu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=70nlDvoBPsnGpl5oVrTXxWd2kNX6qx4N/2s5G+z+mzw=; b=T3L/R+Iubd1li9
	rLths6NCw0EY4NL8SfRtzg6J2iZPVjd9WqSkqrzSuWannljcvYSR8uUegYNjUm0TVghOFGvoog37H
	yEg/9Qbl0gIOgmZg57SjEzKN1wpJVz/RkZaw5s/2OdSrw0qn337IrKNAED2jUujV0KV1NcQppD0Ea
	6KRrGipbUvMLLQ7qrDCtAsPDDMEtYTjSe2bADWI+8C1cxphum1lNFKvdw4XuebnmcYze9AKj7+4Ey
	DvNg49KSp4KOgXw5KrMPVAiax3NhsMTsNLLNcmJz34lBB7k/XNiHEZ6q76Qe05ozSs3y9unyXBKRY
	pFB6JWnIgozZ3N6W5/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Mr-0000000AbsP-0eUa;
	Thu, 05 Nov 2026 20:47:29 +0000
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Mm-0000000AbqV-09HR;
	Thu, 05 Nov 2026 20:47:25 +0000
Received: from [192.168.2.104] (91.78.15.64) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 5 Nov 2026
 23:47:14 +0300
Message-ID: <71b77625-8475-43da-a62b-983cf572229d@auroraos.dev>
Date: Thu, 5 Nov 2026 23:47:13 +0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pmdomain: rockchip: Don't log when of_clk_get() fails
 with -EPROBE_DEFER
To: Yao Zi <me@ziyao.cc>, Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner
	<heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, Midgy BALON <midgy971@gmail.com>, Finley
 Xiao <finley.xiao@rock-chips.com>, Frank Zhang <rmxpzlb@gmail.com>, Chris
 Morgan <macromorgan@hotmail.com>, Kevin Hilman <khilman@linaro.org>, Caesar
 Wang <wxt@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20261105001257.1368266-1-me@ziyao.cc>
 <20261105001257.1368266-3-me@ziyao.cc>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <20261105001257.1368266-3-me@ziyao.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_124724_128434_D94D76AA 
X-CRM114-Status: GOOD (  16.62  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello!

   Please consider using --no-git-fallback with scripts/get_maintainer.pl --
I don't see what do I have to do with this patch (other than fixing another
bug in this driver earlier).

On 11/5/26 3:12 AM, Yao Zi wrote:

> Current error handling code considers -EPROBE_DEFER as hard errors,
> logs misleading dmesg like,
> 
> rockchip-pm-domain ff600000.power-management:power-controller: power-domain: failed to get clk at index 0: -517
> rockchip-pm-domain ff600000.power-management:power-controller: failed to handle node power-domain: -517
> 
> Use dev_err_probe() at the callsite of of_clk_get(),

> and check for -EPROBE_DEFER in places> where its return value could propagate to.

   To where?
   And I didn't understand why you couldn't just call dev_err_probe() everywhere --
the error code seems to always be propagated...

> Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
> Fixes: 6be05b5ec161 ("soc: rockchip: power-domain: add support for sub-power domains")
> Signed-off-by: Yao Zi <me@ziyao.cc>
> Cc: stable@vger.kernel.org
> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
> index 34c862e56aad..c147cc88edb1 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
[...]> @@ -1006,8 +1006,10 @@ static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
> 
>                 error = rockchip_pm_add_one_domain(pmu, np);
>                 if (error) {
> -                       dev_err(pmu->dev, "failed to handle node %pOFn: %d\n",
> -                               np, error);
> +                       if (error != -EPROBE_DEFER)

   Why not just call dev_err_probe() instead?

> +                               dev_err(pmu->dev,
> +                                       "failed to handle node %pOFn: %d\n",
> +                                       np, error);
>                         return error;
>                 }
> 
> @@ -1102,15 +1104,17 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
>         for_each_available_child_of_node_scoped(np, node) {
>                 error = rockchip_pm_add_one_domain(pmu, node);
>                 if (error) {
> -                       dev_err(dev, "failed to handle node %pOFn: %d\n",
> -                               node, error);
> +                       if (error != -EPROBE_DEFER)
> +                               dev_err(dev, "failed to handle node %pOFn: %d\n",
> +                                       node, error);
>                         goto err_out;
>                 }
> 
>                 error = rockchip_pm_add_subdomain(pmu, node);
>                 if (error < 0) {
> -                       dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
> -                               node, error);
> +                       if (error != -EPROBE_DEFER)
> +                               dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
> +                                       node, error);
>                         goto err_out;
>                 }
>         }
[...]

MBR, Sergey


