Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4136CFE5214
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 12:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFoNQkR4m6ISqcP4PxzgHhBXbH5/ARCp3z5MOkbHYek=; b=48ty126RIUlwA+MMADFxCRaFAQ
	qiFD8HFsCWCUbcGLw40DwRvSc3jbgqBl/zUfI6tQ0u9jOV7D56AIZPFkhSnTSiWYkpFgQyapUbdbA
	IJHcCeI87941lJpFHai3DWaLVbCVta2NfdyE72YcPxRNYF7DnTIOgQsX584nQBLxs+Ss9I3asvHZB
	Wx/rsPJy5oVXWU1m8u0Bs2vrKfS6znOqKMM0am+zGyE1wCr3IP4FgprZOuVVUqi0DVLRWfprPrYMS
	OLFA1Y5TnDx6PLCl8Zg7cB4nqYOgLQptucxYm28geDeXnHtB4RM0TnMi+O2C8+Ja03BKPmGPTjWuI
	JBvvqEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFKZ-0000000DA2c-2Rud;
	Fri, 24 Apr 2026 12:08:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFKY-0000000DA2U-22dS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Apr 2026 12:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eFoNQkR4m6ISqcP4PxzgHhBXbH5/ARCp3z5MOkbHYek=; b=NPZRv8pHRqIj5WKo3vGtQjv17O
	Sw3o0RfI4LYL4KA8bwgauR8UCqEIE/9cz0xV7uW6oVxGKFF4yZKHawAKjwmT6jJp/uo4hI4AnmGb1
	+pOuSj5H/FZ1QXCNWv82lN8H7iKuhgCJkDex/eZMX2GC2R7f8qciUu1CJ+zH4Jzea+P/q4X4kw0wb
	mqSeAcknUj6EovBn87Sp70FX6mydLti1jrrPkswRqQgJokU/UgDGQaDXz0c1ica+N1bavEp1Xdhx7
	eTYKHa167bzjp5pPouDGpllwUcA+qL/E3KWMZ1ArRRO/Ej8dwdwOS/8lwjN6eHcCGxVdKh1vFv447
	SekanInQ==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFKU-0000000EkOE-3RJi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 12:08:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1777032487; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HXNAqMyoHqMgojwx6MnSPNk+yj4GSKW7Qn83OGawyK+hTs3JO0eL+PoijG73hKgQLLVJeMVJ3QSNtR//RCwJNcx+sJxAZk2E8JWMOSDdi6CV7MjafiBiAo8btLABSx1cARDKtbJaRyLVby/3cADoDoYOdQUXGiwtf8K1zaQUvDY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777032487; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eFoNQkR4m6ISqcP4PxzgHhBXbH5/ARCp3z5MOkbHYek=; 
	b=gmeNvQ9vTiST3jlKgMWx5sbT0O2IlcJF+XMlcqiijASRHoR7EiMnq+YxJop8AzGxbgMQP+7CAqGIkCtJyU81en0g+r+FbJJotCdfMkzMthsmYmmMJXkTtU8NlZGQmSbQ/EK/04GEzlugsDOI57xVIvVJvWcec64wrXoNGL7m/kI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777032486;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=eFoNQkR4m6ISqcP4PxzgHhBXbH5/ARCp3z5MOkbHYek=;
	b=GNjp24LTPgImMeeRy9ecSwNznTfZzqE0PBV40tgjM9DgNaleLQMsytVbXmci0k6K
	OQZBY2eIVgIOhF3g1Cy8As2FqCV+XIhVwxvvE4PYFHXyyYo9Il+jjcqqiTPLciUBLem
	pD/+780Rmjwb8L1lBrA1xCFI2yHk6hZuttzqvOgU=
Received: by mx.zohomail.com with SMTPS id 1777032485578973.2634566723241;
	Fri, 24 Apr 2026 05:08:05 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: sudeep.holla@arm.com, philip.radford@arm.com, james.quinlan@broadcom.com,
 f.fainelli@gmail.com, vincent.guittot@linaro.org,
 etienne.carriere@foss.st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
 dan.carpenter@linaro.org, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
 Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
Date: Fri, 24 Apr 2026 14:07:59 +0200
Message-ID: <WNCeTzosRbKm_zGsbSPx8w@collabora.com>
In-Reply-To: <20260310184030.3669330-9-cristian.marussi@arm.com>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_130819_325458_6A3162F8 
X-CRM114-Status: GOOD (  17.47  )
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

On Tuesday, 10 March 2026 19:40:25 Central European Summer Time Cristian Marussi wrote:
> Add proper error handling on failure to enumerate clocks features or
> rates.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> index c9b62edce4fd..bf956305a8fe 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
>  		    SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
>  			clk->rate_change_requested_notifications = true;
>  		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> -			if (SUPPORTS_PARENT_CLOCK(attributes))
> -				scmi_clock_possible_parents(ph, clk_id, cinfo);
> -			if (SUPPORTS_GET_PERMISSIONS(attributes))
> -				scmi_clock_get_permissions(ph, clk_id, clk);
> +			if (SUPPORTS_PARENT_CLOCK(attributes)) {
> +				ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
> +				if (ret)
> +					return ret;
> +			}
> +			if (SUPPORTS_GET_PERMISSIONS(attributes)) {
> +				ret = scmi_clock_get_permissions(ph, clk_id, clk);
> +				if (ret)
> +					return ret;
> +			}
>  			if (SUPPORTS_EXTENDED_CONFIG(attributes))
>  				clk->extended_config = true;
>  		}
> @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
>  	for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
>  		cinfo->clkds[clkid].id = clkid;
>  		ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> -		if (!ret)
> -			scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +		if (ret)
> +			return ret;
> +
> +		ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> 

I see that a quirk is being added for this, but I thought I should chime
in with my opinion for future approaches in this direction.

I don't see how this hardens anything. All this does is break platforms
that were previously working by returning early. At most, this should
be a warning (as in not WARN but pr_warn/dev_warn/...). If firmware
returns nonsense, a clock driver should imho try its best to work
around the nonsense in a safe way, because the alternative is that
a major part of the system (and thus likely the entire system) no
longer works. It's basically the same reason why we avoid BUG(): sure,
you prevented a problem, but you tore down the entire system to tell
the user about it.

Kind regards,
Nicolas Frattaroli



