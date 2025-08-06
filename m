Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45501C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZK5V3MersSIii614/5r6OgvzTxwXRniwWTH6RVoqVU=; b=A8X7M3yB7ZlnPLZdw899MawKYk
	V+LZVGeTdMLNx483FZHXMnUxLMNDAPzwDBtjn4TJua9O49saav6AvG14C5kqxQKdjDbQD4FUs+FaK
	qyPAYS+sazkNdB21D+ULdK1sTZdl8RVF4kyMTJm8R/0cwQ2xF9cA78v2ghSd/XnBQzYOjMNlsv48T
	mRXWa3Hp7J72Z49qKDRqgrz/3yVHftXC375pQzk0kemJQrX552iblo6wA13SVf10L3rUJo85bI5+h
	UemfqY218GNLtlUXgZmO5aSEkJmN0NWJvevV0x1yko+/KmaIn7Fx4pClBrKVL7c2m0wcI1ETh6f6g
	2xR2WzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjG6-0000000G86V-0tom;
	Wed, 06 Aug 2025 18:53:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjD0-0000000G7dj-0B2F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 273FE60204;
	Wed,  6 Aug 2025 18:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEFDC4CEE7;
	Wed,  6 Aug 2025 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754506192;
	bh=Fq3lCenJdcFbBPGsBCYGH9j0A7GaUKJaPYK+8MGwrFU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hBNshinW1rnUFB0o4Si2zgGSOP/IP78XUiCJDginX06F1KGRNz1j55sJezeLHVZIT
	 w+XFGy1HU53pbqmwxSShdWT3x289hy8VECUD9Zf43WDu2qCF3NGLZVxi1+m9+8JThv
	 5K7L1sIXatNl/G8UJrHzynyblSrCuZFBFqybQYJbRefZinuKj5YetQfpLqELxQ6feP
	 29TV8wgGKDELrFcxNoX47IQAZsxN3QtIdqhXHgYLhiL8sKtB0KnpeWBV6k1OQTCDsn
	 GUmic3fO/zrqiTDlMFdS5HNG0098MbM6KHCy4HyFbUUhLG67uYNf3It4jNRfBmMXzD
	 FtrRyybW8m0Tw==
Message-ID: <fab1f878-f174-4b21-985c-abd2e6369847@kernel.org>
Date: Wed, 6 Aug 2025 20:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mfd: macsmc: Remove error prints for
 devm_add_action_or_reset()
To: Waqar Hameed <waqar.hameed@axis.com>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Lee Jones <lee@kernel.org>
Cc: kernel@axis.com, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <pnd8qjym7td.a.out@axis.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <pnd8qjym7td.a.out@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 05.08.25 11:33, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,

Sven


