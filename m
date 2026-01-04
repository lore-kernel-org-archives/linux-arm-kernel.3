Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9977C2A06C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFvt0f2YwBKMzTAEFLn8m3fJ+A4Ao/v8QPAnNilZ1C4=; b=Pw8+6yEbnsMZO6/U9t5pBlmrAe
	KeHV/2nwt8PK/dzHbDWEwPJqr+E0SLTBHThfGQ3MXwc1OJyAaxAw4jLeZT29Q2U2hvMA94+wLZ3Gq
	zK5Hy3MycDX4CJVa/gEwIu1IiiXLY2N2D0PlFYNcmoIZ/Q4oJnyxt2GRWLCA/q5r/PGR1sOjJqrOt
	svgYRHk0w7w+tX0k0qxhYsIW9rsU6f8CLGlheJbk9nY8QqbeG6i0FSqLwfmOat2lRjDHSsIgY5uRH
	p2asL0jZj0rxgPec4XRcB9AcjWqWZqLH64Y9GGBIJpu51bKhGS3/AnUuB/Q4r0wy3tbc/j/Txv/Pf
	LxbuBU+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMrM-0000000ADbq-3Boa;
	Sun, 04 Jan 2026 12:05:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMrK-0000000ADbX-1tkC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 12:05:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADDEB41917;
	Sun,  4 Jan 2026 12:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3F4C4CEF7;
	Sun,  4 Jan 2026 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767528321;
	bh=p3dhNZI9rOps7CoI5KuesqaPCNZpJmogIoq7MYMTt7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e9tX/yfCYxNAiSslgxkqmar83uwhD7Ubn6JaekOIRBp1FkQTYu482iYJAb0FUhDGi
	 H14gQSqeH017UhuBc+aIouiYQw25oNRUPtjiuut5wrU42YoNtl15SrDz9zeKzEdcxH
	 BNj1zfQAqIVPOGQNpiuQRFx+r+pPdAiTMOww9cFf5BqiQE4jWkLaTTwli2yYRPtHMB
	 pX/blpDqkPhulRGgcu4fT0dAsX3COwUU308gwyviKQ4bEzEJXc8MGHCeeGooRctIKU
	 0G3taORlmjytXOdKOgt386KNQjPqs/uZyTpaqe8T4nuNbVU6Tj6m8tiCjx7V5+F9fN
	 +bpDHGeoqXtjQ==
Message-ID: <bb7d80e5-20f8-444f-938c-b0ce53357fd2@kernel.org>
Date: Sun, 4 Jan 2026 13:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mfd: macsmc: Initialize mutex
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251231-macsmc-mutex_init-v2-1-5818c9dc9b29@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20251231-macsmc-mutex_init-v2-1-5818c9dc9b29@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_040522_598836_745BA515 
X-CRM114-Status: UNSURE (   8.44  )
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

On 31.12.25 10:42, Janne Grunau wrote:
> Initialize struct apple_smc's mutex in apple_smc_probe(). Using the
> mutex uninitialized surprisingly resulted only in occasional NULL
> pointer dereferences in apple_smc_read() calls from the probe()
> functions of sub devices.
> 
> Fixes: e038d985c9823 ("mfd: Add Apple Silicon System Management Controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - rewritten commit message
> - added missing Cc: stable
> - rebased onto v6.19-rc1
> - Link to v1: https://lore.kernel.org/r/20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,

Sven


