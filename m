Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FF2C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 18:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnftztqlqToNinxy/Mu3f6KEvFaK0MjBO95XuXaBaT8=; b=BjA3PrubJG0zLeHStqjH8swHFz
	dfoOhGUPv0WuFtvxTNQplsqIi96ajwLrm2tQTHQdVKD9PLh559z8xgS52OeiNA+et2BCvMt6Tx67I
	PwrmNRpU4AyrObrmYXzmUvAzG0YWxdBWfLun8Z6x8fcMG3ebHvosyMT6C0CaP/DOBwmrs+OhaMJHn
	wR8YehQdkZyDohU2oniIBE5JaUurB7Mfa5lggfO6snbHRCrkWZZ+1pRmCOunPzM+Xyx0ASyuwFaXP
	uf1208vc4iHQi19D50SzQBLbBFQq3OmTL4cNsf7V/XEbwX45x6UDJH5kutKIo44lxnwwlYiqQalMM
	rft0zLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MzY-0000000CbdK-3YHs;
	Wed, 09 Sep 2026 18:25:52 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MzW-0000000Cbcv-30SX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 18:25:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6B57101EDF;
	Wed, 09 Sep 2026 20:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788978344;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=TnftztqlqToNinxy/Mu3f6KEvFaK0MjBO95XuXaBaT8=;
	b=cZf9dgO14Y9lijIc/oRqi2o+8afIk5zO+iH1NS+DI87OG1olgsvw4jriNr5WuiQhQme1CJ
	p56+46kb946jZ1UJmKv3ESKkb4xtlcxUhFoX5mGZ6Dd/pYyx9CB38/7JQ0TSwVgjeEur8e
	NhUlGo+EpiurUyZ6nUNI+p575AWY3y5DrnVJha6oSoSmRfLGoqZ7hMJzhW9/4KVn93HQnT
	Xle47b7DJg7m0AyBSNqx3eep0xrGT5pZzslXXaXQObdh4T4T6zRGWmmX/v1FjmpAcYfv4w
	xvTUWkoC7gOOr54DlnGV5JsIHY5pFBbKjowUU2PqWeYpHdBDExs4l4s6hG0dOQ==
Message-ID: <432b974c-f436-49f7-bb3a-90e1fb86f29a@nabladev.com>
Date: Wed, 9 Sep 2026 20:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Michal Simek <michal.simek@amd.com>
References: <20260909164423.97288-1-marex@nabladev.com>
 <20260909164423.97288-2-marex@nabladev.com>
 <20260909165525.22F151F000FF@smtp.kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260909165525.22F151F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_112550_908047_49C2C2A4 
X-CRM114-Status: UNSURE (   7.25  )
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

On 9/9/26 6:55 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:

I really do not understand why the bot drops linux-arm-kernel@ and the 
maintainer from CC, grumb.

> - [High] The TI DP83822I PHY is incorrectly declared as a Clause 45 PHY

Datasheet says C45.

> - [Medium] Contradictory RGMII internal delay configuration on gem1 forces TX delay on a mode that explicitly requests it disabled.

Delay is needed.

> - [Medium] USB0 interface is not enabled despite commit message claiming 'USB host interfaces' (plural).

Yes, "UART and USB" are interfaces, plural.

> - [Low] Magic number '1' used instead of the standard 'GPIO_ACTIVE_LOW' macro.
> - [Low] Non-generic node name for LM75 temperature sensor.
These two are addressed in V2.

