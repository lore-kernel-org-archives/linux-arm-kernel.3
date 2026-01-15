Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CE0D4661F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 21:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUWcV84WwJqUcovZHFJhuIOiF7eJrSEXzB43bULHQnw=; b=N1xc4zsH7u94tGL1t9RpB9BTtQ
	1MbhmZZdycbVFEvx/aG9IFNjFXX5UWOaeztKWWS5QO/WeLBL3QUAUqXlmrJSnKaqaCIqbla/xNBnd
	G45bhU9alcFMUh8sSLl8p5yH30gSK3c7buPxTTIexyLwXlTfZrZe5MRDrcOo8kpZQdA9UvuDswYb8
	yEkQJhTzgT4T3fTPaep3Wi3x8fnCAT27YP7nKlv6wHzbRD6npNOfq2GQdYmGXtnn7bhC1P9urQ6l+
	1miyYDBY/l5WmhSdd8EmroLf69xA8V4SGeH6FFz7PgIQ7G0y6PSDAhhjW4ApFRTKiLtoSwtqQatWA
	Cze2vhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUSP-0000000DBxC-1V3P;
	Thu, 15 Jan 2026 21:00:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUSM-0000000DBwm-2lrT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 21:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A235140BBD;
	Thu, 15 Jan 2026 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659BFC116D0;
	Thu, 15 Jan 2026 21:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768510837;
	bh=DykiV8OWIGZBqj5EbF75NN1M9XHMbeDKlJ0/Mh6XJ7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ACPWfmPbEgahCgAzAGCzEtKriOasnghvP7Zt5xB74K+zymKMYmEBJKKQeqnC0/L0V
	 WWLdAu28hiNXXQYVnhA3mRtaktnX2ldstmms5z1sPg6ekeQOMKb2k/LzCrbAwp4zas
	 n90v6kuMXR/bnXuFagW23WaVi8nx0vMxQq7ssJv3dKwVCzW6sKBvHPGgjE72vRhdo9
	 ht49jMDgwzEMfywZTg7/Xxz7ze9mKGWU1cMFVxt/Vs74SW8PkuXc8WwKhrMoMDG1l1
	 MEf/c/3nFhHYiU2hVsPD+gCQiNtpUJEaChBAX1ym93lAvFMLAbfTYp3j4ZLaz+rQEP
	 qdoC1AElh2idA==
Message-ID: <af3204c0-0492-4555-9a75-3716fa264ecd@kernel.org>
Date: Thu, 15 Jan 2026 22:00:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] power: supply: Add macsmc-power driver for Apple
 Silicon
To: michael.reeves077@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Hector Martin <marcan@marcan.st>, Lee Jones <lee@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>,
 Sebastian Reichel <sre@kernel.org>
References: <20260115-b4-macsmc-power-v3-0-c236e09874be@gmail.com>
 <20260115-b4-macsmc-power-v3-1-c236e09874be@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260115-b4-macsmc-power-v3-1-c236e09874be@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_130038_748779_A771719F 
X-CRM114-Status: GOOD (  11.31  )
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

Hi,


On 1/15/26 08:08, Michael Reeves via B4 Relay wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> This driver provides battery and AC status monitoring for Apple Silicon
> Macs via the SMC (System Management Controller). It supports
> reporting capacity, voltage, current, and charging status.
>
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>   MAINTAINERS                         |   1 +
>   drivers/power/supply/Kconfig        |  11 +
>   drivers/power/supply/Makefile       |   1 +
>   drivers/power/supply/macsmc-power.c | 834 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 847 insertions(+)
[...]
> +
> +static int macsmc_power_event(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +	struct macsmc_power *power = container_of(nb, struct macsmc_power, nb);
> +
> +	/*
> +	 * SMC Event IDs are reverse-engineered.

Any chance you meant something else here? The event IDs aren't special, 
everything here is reverse-engineered ;)
No need to change this imho unless there's another reason for a v4 though:

Reviewed-by: Sven Peter <sven@kernel.org>


Sven

