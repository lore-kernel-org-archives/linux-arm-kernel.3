Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68612CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 02:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bid7O86JWreCLqvxeuxqRpHgi3BDAOhI1RckqIeOIhA=; b=2L9Dhm/jFbPx7JD8zkedghtajA
	yU5VqwXnOxSZ+xt+JcFqFbQPeCr8As9ugi82yTEDIrlzEsHwzAqQgK8fE8UWhZAJ1LFPSiqFb2dUw
	lT03KH5nhRdS1OxPiAE7X+kUlglwHs3LUujmbjZn3XINRuTRn5seMVnwOY+kKn5ekmzFhFTzRm4L8
	rM6N9asLn17/oWssrEddzfeJBmOoEqcDRKAtDdiQNc6MQjmppo4HpdIQi+p+3WjouOSAr6G/tPCNx
	t1FSTtETqq3w3Be7BC6bYTq+m41TD3z/h/YRkn9TiLbKmTBM4dzlsi0RqvEn/7SabePpXxn6Kgy6v
	FxF7Y87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKSKs-00000000YLI-2cDM;
	Wed, 06 May 2026 02:50:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKSKr-00000000YL5-12TY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 02:50:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A4746057A;
	Wed,  6 May 2026 02:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7820C2BCB4;
	Wed,  6 May 2026 02:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778035804;
	bh=9Zp6weps/5i0bic4zLcKMfZvfoo875xrUuifN3/il+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BFSVwFmuFDrQZSHs0jRdNiiat100r3VhPb+RdSmbPZaeyzbXt3kjIc5204csi3fmv
	 8DmvceFufkt0gK0cBt2vTmWAducwVcTkbB0cfPVXqDS3jvgw2kDv6M1M9OaVAdNz6V
	 YsIti6u8JHQxWeOJBLabNU67GtpsDY0kIoLnxiQyXT68PfBn1uQcKjV32oTtDcrW/N
	 VvWyRoPAhsu3Y5iRq9BcNdXMtAUYnj8rN4QeXp1ONTbwV/JI9R3RXLTW1xaKut/4G/
	 OggD4wSBMLUGEFNFp9NrZiGdyg6oWSKpdQ3IOeKA1s+Aa9S4+XDRJoSLz2MqpsBMLN
	 4fIb61GXo4wZA==
Date: Wed, 6 May 2026 02:49:59 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] leds: Move MODULE_DEVICE_TABLE next to the table itself
Message-ID: <afqsV2bejC5Mr7_o@google.com>
References: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
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

On Tue, May 05, 2026 at 12:28:45PM +0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
              ^ d

> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/leds/blink/leds-bcm63138.c | 2 +-
>  drivers/leds/leds-cros_ec.c        | 2 +-

For leds-cros_ec.c,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

