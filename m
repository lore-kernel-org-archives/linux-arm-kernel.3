Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F936CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjnVfgz6zh4SF3gMbSx456mbBro9ABf5bWAoYvwZu+I=; b=jzHPLp+bQyveSk1h4qM1LDsSOJ
	p1Ksb2GS6q7IwkKJfdAThdHHJKgnr3BxvSK3eGRmX3FAiDzapyFLwV23sOfrBEw5I/nAdqc9NyMij
	GzJHsrNawPH5A398tfTKFBff2dHpcotGm0PWtIWZ5KpU5UX2l9VhmsU4LKpEiKGBvb8M92f1PuzkY
	6Ob6w6L+ivnKeX1GG5hmusjbJFKccrqFbsVlOkLCfIyXB5ZCCaOK2CBEH0Ykl4I2gkXnXE1UaHOwj
	UQxnkIO0tCzUMKv49JxlCQXo6n8u3phMmPzOMDUjRf6IlEOaFjFllDIsR6QTQEdacYtCsDznp1aoz
	6uYT2JgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVvo-0000000HNUj-1WJW;
	Mon, 25 May 2026 14:05:24 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVvl-0000000HNTu-1fZG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 14:05:23 +0000
Received: by chaosmail.tech (Postfix) id 52D991C7F11;
	Mon, 25 May 2026 14:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1779717918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OjnVfgz6zh4SF3gMbSx456mbBro9ABf5bWAoYvwZu+I=;
	b=qkmwoldY0R8w+0rmZMTmWCi+CcadvVw6SdMk05tvUh+mSzuoKZNKjflD1vD3kyAKK4bVSX
	6PPOEqV3T0ZbsgKWxHiIXodhBmSP+qGfbpzj8QH6rlxH2Oq8b+4I9ztkiNyUUijA1W3Dh5
	wkm//BnOjkZZALJNM4Sp91l2ai8I2qU=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH v3] Bluetooth: Add Broadcom channel priority commands
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <DIRT7260SRQZ.1BFF8CX3FJ57G@ubuntu.com>
Date: Mon, 25 May 2026 16:05:06 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <172D11E7-AF98-43F8-B41B-907738749EA5@chaosmail.tech>
References: <20260525-brcm-prio-v3-1-6259e10233f8@chaosmail.tech>
 <DIRT7260SRQZ.1BFF8CX3FJ57G@ubuntu.com>
To: Joshua Peisach <jpeisach@ubuntu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_070521_902278_C44C690E 
X-CRM114-Status: GOOD (  13.59  )
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


> On May 25, 2026, at 15:58, Joshua Peisach <jpeisach@ubuntu.com> wrote:
> 
> On Mon May 25, 2026 at 8:11 AM EDT, Sasha Finkelstein wrote:
>> 
>> + cmd.enable = !!enable;
>> +
> 
> Probably a dumb question, but worth asking - what is the purpose of the
> "!!"? Wouldn't just passing "enable" be sufficient?

This is a way to enforce that the value is exactly 0 or 1, not 0 or non-zero.

> 
> Also, currently, cmd.enable seems to just be set and used in the case
> of boolean conditions. Would it make sense for the enable field in
> brcm_prio_cmd to be a bool or does it not really matter?
> 
Opposite, actually, this struct is fed to firmware, and it needs to be
specifically a u8.


