Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB59DC44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 13:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxCy6+4tgaC+do2rvc0+7V+EUsdw6w7kQ3US3qb8wy0=; b=hVw+9274nRNwCLyaSxB1RJJtiT
	sdaHtyUEkuDF9b8FFHluhRE+tiv7UnLAJuRkxSI2X8nYY9yZlfzaWCgsbwTj6xLiYcwIaPwQj9vr8
	fJgbAZPiQZQQDCmAaIOC+5Xj7yTcnBRarLNuxyN/hykrDdsgVJiQtqv6uMJviBsypkX2ieZZbxN8r
	bgj5lT70WMcJTCBtZWByuop/ZqlBVdQikwxH/cxsjHZQETuz95IwTrh9+tLLkFMCb5QynrLHzeOSO
	x7f11gSvfQe4OqsHhEjQspXqI20EPQOzwfiIXyHR09i21jCiFtE+GhKF+EdkxnflnmF+Q3nc8Fqtr
	3Lxj+1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlRMn-000000051aX-029E;
	Sun, 19 Jul 2026 13:15:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlRMm-000000051aN-144A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 13:15:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A94884097E;
	Sun, 19 Jul 2026 13:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE74E1F000E9;
	Sun, 19 Jul 2026 13:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784466935;
	bh=lxCy6+4tgaC+do2rvc0+7V+EUsdw6w7kQ3US3qb8wy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bgmli8w0LfTMb84cf4Usv1oyZxqOEFetk7IgX+b/lMYq21NtFhpZJJAz7Oyifh3wy
	 XPjiqrsUORQ9CKSnMkJJ6VVcg1hY4etT8P4vrZqviYWXehBYjvNZHb9WZA5kQemigU
	 Y+1+AdeWWdLeiOR3EUZ5LUH+XAkYmwJc39uRNQDs/NU7fy05f5ZvMgW+Bb+wzo0ATO
	 pQNdOzvTI11eegJuSAbbFJ5Ijlov59D/p8OgdpG25uXwjVZbU1XSuqYNUTTcBE8C1f
	 g9dx0eQdmTn28gJR8uzEA/JeaATKUdjkkpifuH7o92ZNG+lcnwr9M59Fx3ENq7EaOX
	 g/1MXbTONiJmA==
Message-ID: <e48a3602-0871-4675-a80c-154d58ce7243@kernel.org>
Date: Sun, 19 Jul 2026 15:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Janne Grunau <j@jannau.net>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718172513.986134-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260718172513.986134-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 7/18/26 19:25, Uwe Kleine-König (The Capable Hub) wrote:
> Initializing a struct using list initializers is hard to read, compared
> to that using named initializers is more ideomatic. Convert the macro
> used to assign values in the driver's pci_device_id array accordingly.
>
> This change doesn't introduce any changes to the compiled array on an
> x86 and an arm64 build.
>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---

Acked-by: Sven Peter <sven@kernel.org>


Best,


Sven

