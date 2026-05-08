Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8721ECD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8eBbS97pv7OakhYA95PJoS3eajNOoVvJdDYdhJ840k=; b=kvSafDSuwTeRyZ8TtoVvDDU5+r
	tXSHX5acmWWVzuW9qfX5x6eE9bxHIAOvpsPZpnoirFEmTWBzf2COTDl68KLf9/XRUMF9jCPPTGmLK
	0Nkg0PVAdYXUm+L5hZJaDoOwp3dy2e4Q++poE1CchKfW7JbWpR28xN6tIQNNgyXKE8W7SuwRrvovn
	bxJH/Z0ssmvjBqC99661r4xKx3bjbcNMm8jrtGWOAuBpCF5wo7leK0VcHcLzXnwgFGATBz/fmTUfj
	ZxiH0xyItNKoKFqxnm+bWf6NyWuf3P4E73apBQBlhk1IdmUl1HAYFkrELfcD4FWKEoTzJ9gE7xarg
	XsuYGs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN7H-00000006paV-2sJA;
	Fri, 08 May 2026 15:27:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN7G-00000006pZh-2H41
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/8eBbS97pv7OakhYA95PJoS3eajNOoVvJdDYdhJ840k=; b=ldxym+gUguqAWTo5Y4O5ubif7y
	JrdPAWk4tXvb0dPpjat0GKpCpoMTcu52OBXZxnpcob9d+vmYWM7MOjeEOiIvM4/LSLTlVHgm2LDoj
	1B5nJ1JnsOFSR2lGOB54lfEoSxG187wE7g3bLs6CJXDbSb1JO5GBlosGeyubwMvyokO5fgNr3pBGU
	pmMVL0sQUcO4QwRyJpxc1zHiA9Y5MWhbq2NkG3dhT+gCcDS5sw2SwEy6C0xBytFpiMCWhef1K9LLC
	UdBPuCh8Tqy5KyP0JS7rOil2DlxAjrngvx0lnIwvMpLkA1F6ArwGnsEW65bqDIOTiUuOEfUwJjBSf
	MMgboRkg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN7D-00000006hNv-1quY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:27:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D49BA3595;
	Fri,  8 May 2026 08:27:39 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C78343F836;
	Fri,  8 May 2026 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254065; bh=fA9luiM0hxDLT0kv5HtcUycaXbjAO4oEDYzCee4bUcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dv5caBrgjyIubJ/j5OmhQq1Gvro3YCti6XPY6zkK0iA3hkhnHpjFHFuXXZCQC/rLz
	 rL/gS3JFe0CvkxVGzKzXCI8msOV0FPU5nwf0oL5fbiYioBJO0zppvwhfWj4XwGdDXZ
	 kWoHqqLfw0LhiNFvVcFwltOzkmTlQrTreKceg5l4=
Date: Fri, 8 May 2026 16:27:42 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 04/13] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <20260508152742.GI3778514@e132581.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422132203.977549-5-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_162748_013663_ACE70E7C 
X-CRM114-Status: GOOD (  12.84  )
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

On Wed, Apr 22, 2026 at 02:21:54PM +0100, Yeoreum Yun wrote:

[...]

> @@ -573,11 +573,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>  
>  	for (i = 0; i < caps->nr_ss_cmp; i++) {
> -		/* always clear status bit on restart if using single-shot */
> -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
>  		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
> -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
> +		/* always clear status and pending bits on restart if using single-shot */
> +		etm4x_relaxed_write32(csa, 0x0, TRCSSCSRn(i));

After confirmed with hardware team, we should preserve status bits
(including STATUS and PENDING bits) during a session. So here we should
set drvdata->ss_status to TRCSSCSRn.

> @@ -1503,8 +1501,9 @@ static void etm4_init_arch_data(void *info)
>  	 */
>  	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
>  	for (i = 0; i < caps->nr_ss_cmp; i++) {
> -		drvdata->config.ss_status[i] =
> -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> +		drvdata->ss_status[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> +		drvdata->ss_status[i] &= (TRCSSCSRn_PC | TRCSSCSRn_DV |
> +					  TRCSSCSRn_DA | TRCSSCSRn_INST);

It is fine for read these capacity bits when probe, but we need to clear
status when a session is starting to avoid the stale value left from
previous session:

  drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);

We can do this in etm4_parse_event_config() for perf mode, and might
create a new function (say etm4_parse_sysfs_config()) for preparing
config for sysfs mode?

The rest looks good to me.

Thanks,
Leo

