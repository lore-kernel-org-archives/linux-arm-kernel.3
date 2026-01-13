Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6381D0C850
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0OJZ/hQZKKYABzNfYq+FrBKtzynJMslAHCZaI8S9CA=; b=4PD5UgLRiVnLgbxBS/gXjQiga7
	lW58YkBclWGyHfouWlU/ox8UAt2/zPkY92/hqNLM7D+E0ifK7936P9ov6GAbrNGZAnwDQ0rBeaDVy
	RRnXnZ7khIIb9ZJxWIpfuUf1/RwTyoB1wlfabonViYg0LldlI2EbQx53yPanGk8JQFOJ+0U9tf6Q0
	qaM6xITdjZmAZ165OfzwDTWlf5dkyoD7LNnf8TCNDGngA7zmAg1qV9PvLBvKoQNQ6nDEAxS6ebQCl
	cbMh5jENP1J5rHkO9mLYUVX5FO4zvu0Z0f4z+pmT6WPkySYJx0y29OMTkHuIltRxmY8+9MqnrYyHy
	Ork1xK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc5G-00000006wFP-2qdT;
	Tue, 13 Jan 2026 10:57:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc5E-00000006wEk-2ZAz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:57:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3511C43DAA;
	Tue, 13 Jan 2026 10:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628F2C116C6;
	Tue, 13 Jan 2026 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768301827;
	bh=6dzbtd4d0zsoXuZ/SJa4SnlTGp9monm0A/IN612PyE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsPCFA+ym2PrA0TOKPD2t31XHFM9RhVU2abdDB0CDpxJeVXomalpAFvDyc3uzMTbM
	 j4pxi9+N3BwWHWrRbxrOBq76Og+ehb5FcaBNhTtGPOJYZgtjhDPPySk6okTuPIliTc
	 /X6r9+tS8ausd3W2kB41cC+mJKI2rTfDjAyWNAa42CyqUvvIZnIIccA7DOcwrNATNu
	 4xVP+PxsU8V5yuzSiFagfw7T39lWLQCWfhYuE+2r8CnUg5oyKnIIt1fiCt5cVRsIIj
	 fji3+IrY7Gm9imrtEQldeFUVy66kGoJ7XisGHGUTLtaDyhng0bHYKLqT0pdvJADntl
	 YFOuaVXGMsXZg==
Date: Tue, 13 Jan 2026 10:57:02 +0000
From: Will Deacon <will@kernel.org>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWYk_qGvA9Kn0xGe@willie-the-truck>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_025708_672647_0D441240 
X-CRM114-Status: UNSURE (   8.78  )
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

On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> 
> On platforms where a vendor SoC driver already exposes widely-consumed
> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> of a vendor logical ID like "519") and breaks existing userspace consumers.

Isn't the fundamental issue here that you have multiple callers of
soc_device_register() and your userspace is only looking at soc0?

Will

