Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841ECC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VTZ9zHl9OoQneFVX7eJwf/WovVc3pD60nK1eidpzDA=; b=p1fcZzppF6PkILIoEVpe5GNEnO
	Jddp58oxjLmiXTz/rgvT/JvNQ4blgEfvNctY1adPywwCjLyBYx0EVpl76pgrmTTzx9rnacgIlx32K
	09sk10scfcO+FR834nbrPW9b+3GV8cwJxpIqhvI7TcoDcqospTmLJsZvCuESLSZwbc8nveKcFj6ib
	umVuse/HUuhVKajN/7iTFryTJaAnSUKrE/6pzFkDUXH5ziq4l4+Eqt8upLuDdgKulD0e0CAHXGbJX
	fQtUPu+C6PZS+dfy5IBqUt/w1dGwrIODTddaYV0OeRkJGe9iiBxVNVHm/2taGrawMThBFg88HwlaQ
	XJ7bEq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlptS-00000007BN1-2tyI;
	Mon, 20 Jul 2026 15:26:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlptQ-00000007BMO-3nlY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3VTZ9zHl9OoQneFVX7eJwf/WovVc3pD60nK1eidpzDA=; b=UBGOxjGhhLmiklcVtz3yUwycXK
	SKF49xsaG1+mMXpYyZr4R77KFUYtHnY2pnfW0afafBbv1dIwV58lDExoIpgAAL9upkQw8XWRRCIKF
	AuBOVdHCxej8totyKKlLWZXo8psNhvVNWkk5DNCP9nCSl/z8qAg/aiIBKuGR2eZY+HPhSwXGuxsxC
	GtyJypnTcW8xQStCJ7SUG8Q9e7sBncN97LJgKKNdJKwCcNo6Zsr79VLrchmVywyg9VPjajafb2Nv+
	+vmIz+rT2JbjrlmAcO3D7eD9FuW2nlRNUXOVOqwr3lk7Imje7ZONyeBFW6LGYyiyCbCwGVHZwsNs3
	ysEVdJoQ==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlptO-0000000GjRZ-0MHA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 15:26:55 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-382ef647e20so9715612a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784561210; x=1785166010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3VTZ9zHl9OoQneFVX7eJwf/WovVc3pD60nK1eidpzDA=;
        b=LMFOPP7OI8PXUYYl9vvEGHoAIvpjyvajounxIlde6HCQYCE0wXLSuk4FVDmNBTd+H0
         P7ycCoxZQTYVgkmQNjBaSOYQEgcf6Jq7LTUnBHv4QXwkh4rbFda5ySKt9BpygTq7UP41
         lK+dEy3vcbLdeW1dZzEaxIDM5PqPzJARmsRgVhwsWrYCZPEup7SC1oXXdqex9e93FQSo
         oNTMOEfxcgvVa0JQxEo6vPMdlymcRvgVmytlWgM4zfWzE9ueOyqSthARbic2ttF68MFH
         aQr1SAPBv2VSQkr7W4HqxMRZoQ+547ZjLW10KGlZxhdFczrA5UFP7p8/CRt73UxGk/eg
         5iYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561210; x=1785166010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3VTZ9zHl9OoQneFVX7eJwf/WovVc3pD60nK1eidpzDA=;
        b=L7nKscO4B/+FoAlmeqfSHe9goDed7pVUmWbqVztOeXEEr27qYjeSnKDMp/CNu07fjL
         P9o3sMWlgRukf7MXqUvOTyvLXVOtC2ILOsSK2pDqJVWPle+pq3X89PVNZNIkj9Fe5Wwt
         iVmswNjfn6bsKz1VJKQCXNTbsrQNvSThut3PbAO/gmfm2DLHPbywBHJgFJbXX5mP6LaV
         t9UbGu0EFGX7wY+kX3UANdXi+55oBXPwW4qpMYrA2JkFmmdZQ8A/8lkIksVGwC+9eiqf
         mhA7+FE0f0o3ECK51mc3jTCw80PveG9ylMpZrVwAqkY7IZKvAWi5uxa2y2KLyd2fyINJ
         NRHw==
X-Forwarded-Encrypted: i=1; AHgh+RpPuXKNu1kufDrzqR4Ogny9vTyI8B3K5MMy0ul0KBHdSb6yamc+Bo/mXypV1w9XXAKB08CPOfjrTzl9vms6OAax@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9r1fz0rkO+77QhAYIZXS7to5kjcD2o3X+NSuoBfO2QuhDgVE4
	D/tNPVDGJBLquCYsDkPInu7Yn7r2tHjW6Gu4UxlkG6HZQ0jcnp646ZK2DDOd7XhDSWg=
X-Gm-Gg: AR+sD11AZdiQheNX/f6j7Q7Ff0L1n2KW6JTFQfvfoCUc44CpxUQ3u0IiTPBM7++1zDZ
	xg//teUcfIApLLkA28N5s/CBncq9tqeAKAMcfdt20l1ySa8piq87dJ99ytXfJeee7arDd5bXuft
	0mxCDN1MMOOUN90KrI7x0eOq4NyTFYFfHx5uhLc/1uWKW+F6O40WZrsrP9Dpr4F25P6OeNZcDWR
	r48/r8k8YLodigj/itwGp9gutlV4G09DhK52pnwnnaocPiBCPFNN6vMnocf8+rtUETPc0hgv0ie
	mTV1upSak9azYCYvxoBxPwxoLGMAAoSehFtd/83wpSmuE1GcI1nlXO5SAJdqf74GzF1wQ2fwaMm
	a0Gdp3Sa5lylKKYOTJVIRhgiO7qpzyOzeYFc5Pt5NMJrDkWbjO2/Zwk9KlVM=
X-Received: by 2002:a17:90b:58b0:b0:38e:7239:b945 with SMTP id 98e67ed59e1d1-38e7239ba36mr4798636a91.21.1784561210391;
        Mon, 20 Jul 2026 08:26:50 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:55::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcd3fesm6080875a91.2.2026.07.20.08.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:26:49 -0700 (PDT)
Date: Mon, 20 Jul 2026 08:26:49 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 09/14] net: enetc: open-code
 enetc4_set_default_si_vlan_promisc()
Message-ID: <al4+OXBo7rVJiLb0@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-10-wei.fang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-10-wei.fang@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_162654_228061_8716DE69 
X-CRM114-Status: GOOD (  19.29  )
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

On Mon, Jul 20, 2026 at 09:43:11AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> The function enetc4_set_default_si_vlan_promisc() is only called once,
> from enetc4_configure_port_si(). Open-code the loop at the call site
> and remove the single-use wrapper.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/enetc4_pf.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> index 859b02f5170a..505e4abf6c37 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -307,17 +307,6 @@ static void enetc4_pf_set_si_vlan_promisc(struct enetc_hw *hw, int si, bool en)
>  	enetc_port_wr(hw, ENETC4_PSIPVMR, val);
>  }
>  
> -static void enetc4_set_default_si_vlan_promisc(struct enetc_pf *pf)
> -{
> -	struct enetc_hw *hw = &pf->si->hw;
> -	int num_si = pf->caps.num_vsi + 1;
> -	int i;
> -
> -	/* enforce VLAN promiscuous mode for all SIs */
> -	for (i = 0; i < num_si; i++)
> -		enetc4_pf_set_si_vlan_promisc(hw, i, true);
> -}
> -
>  /* Allocate the number of MSI-X vectors for per SI. */
>  static void enetc4_set_si_msix_num(struct enetc_pf *pf)
>  {
> @@ -361,7 +350,9 @@ static void enetc4_configure_port_si(struct enetc_pf *pf)
>  	/* Outer VLAN tag will be used for VLAN filtering */
>  	enetc_port_wr(hw, ENETC4_PSIVLANFMR, PSIVLANFMR_VS);
>  
> -	enetc4_set_default_si_vlan_promisc(pf);
> +	/* Enforce VLAN promiscuous mode for all SIs */
> +	for (int i = 0; i < pf->caps.num_vsi + 1; i++)
> +		enetc4_pf_set_si_vlan_promisc(hw, i, true);
>  
>  	/* Disable SI MAC multicast & unicast promiscuous */
>  	enetc_port_wr(hw, ENETC4_PSIPMMR, 0);

Reviewed-by: Joe Damato <joe@dama.to>

