Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBF0C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 20:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzSk146EZPdEuoi3fRzTjgIcSI+I1KqFNXTcwx/L4Bc=; b=AzQBS7LvK9BWHnk1xF44CGZYJt
	DmtTkqqqM92cQF3L/93YbKlgj88ojJhwvnBXK/+X5XEmNkFbfr5s7+3Os2VwwxEXtxM9Y85TdX3lN
	cw/7KMshXZ9CAVSUlb7QJA3teqcjZJqzAcQ2BjotXOLaTjygdLEFN37Zhq27YA907FYc2ExeSfEjB
	lu441RE+zLwyvWYteIs4yDK4gkv0OG4eX6T07cIuwGh+LGz1hNU4M7egKax8m9m+sj2WfgVNwFaoT
	tUTvwk5+Ho3cQV+OZ9fxrQeBqA4MI0gyHlZXFUIIsSwT5q9FsFfqrmUivCR2QHluPy4oFiJh5RFT9
	32/iq+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkr8i-0000000F2C1-1Wio;
	Wed, 19 Feb 2025 20:57:52 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkr7D-0000000F1bH-0chD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 20:56:20 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 526C840E015F;
	Wed, 19 Feb 2025 20:56:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sylMmaoy6Uec; Wed, 19 Feb 2025 20:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1739998572; bh=BzSk146EZPdEuoi3fRzTjgIcSI+I1KqFNXTcwx/L4Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aVkq3dIgPr6+5o1k3zYpUi4eS1vWXA2yWgboIFcAiLRGdxot0OWfOmMJD8cmcQfET
	 u60oS07EkLaLM2rqBXDWYDhT1Yk1iCeGB3k5EjQo7348HK8MZuHhvNaqKwHHmDnZ88
	 8eEMMVrZramrswk7Myjw0GM8iRBd32XJmXLCF8ML2K7F6jTu8kKxRnbEuvmcI0PNN9
	 Ex3AKfASEDn+9HkY3HYF27f6iSg1YMhdto1FVaJeNlLvvAyUFQOAZNOArqNX84ru18
	 e7R/FgZieLXkmidmG4qcvPS17I916+k0xG5zJRuiyzC7XIOzVcFEDxvcRufJdu6RF5
	 GPLApVlOzRtqqg3ilMMkaapKBfMlZL2V2CLZnPyt7I43YHsB9dVbuaDpwYqAk9hEQK
	 Pq62XBNGabRcHr7A3EoUg3C8DwCH3uvBxhI6LheWeCihDS3M9T3RC1Et8HjFQAO9Kz
	 SK9yt8bpxtu+OxGVHZzlInnKN0cRhsmikPnLxDMsx10SS047lnbounb6GxZwF4wAB/
	 ENsGPeCmZ+Ia8gS/pW89+4TmaufrjOoedJTnpxL6/FBQinE1K4oXqEKlHpESXUGqBB
	 BlIjV85hfV122bQ/hvdLs2ylzDYA2/Y2fkmtQY3KRkYf2CN0T4pAVLYFmzSEzAOQDf
	 Ffnx3AKuELfYb+9D49NOXvNM=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3FB2A40E015D;
	Wed, 19 Feb 2025 20:55:57 +0000 (UTC)
Date: Wed, 19 Feb 2025 21:55:56 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: catalin.marinas@arm.com, will@kernel.org, lpieralisi@kernel.org,
	guohanjun@huawei.com, sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com, baolin.wang@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	lenb@kernel.org, tony.luck@intel.com, yazen.ghannam@amd.com
Subject: Re: [PATCH v3 2/5] RAS/AEST: Introduce AEST driver sysfs interface
Message-ID: <20250219205556.GSZ7ZFXL0In8nPzRIm@fat_crate.local>
References: <20250115084228.107573-1-tianruidong@linux.alibaba.com>
 <20250115084228.107573-3-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115084228.107573-3-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_125619_334733_1405734A 
X-CRM114-Status: UNSURE (   7.29  )
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

On Wed, Jan 15, 2025 at 04:42:25PM +0800, Ruidong Tian wrote:
> Exposes certain AEST driver information to userspace.

Why?

Why do we need to support a debug interface indefinitely.

If "no real reason", then drop it.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

