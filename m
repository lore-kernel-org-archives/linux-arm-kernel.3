Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A680DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 01:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxMYpyOM7XqQUozuyUuJHGk4groWbDIUWZBQKf3SOwU=; b=zwJ7qxdNVegkGY6fbuO0ngqS1Z
	nLLYtdSH9DN9U76l/opJoiUX6byUDp2B0lI7DFJAw2wFoq5b7tu1zO/WJFMebjCLwkpc1DaAt6ueb
	xVouW6pueJbLW4Wkky4ACA7gjE1ucCiaPBg3YmZwUr43lncFJ0xJyhZQslmVnDjWE0WGeXMVjrTmE
	q1YJVI3elgbxvCd5a0S7MktlampQj+QJZLdHOdhh+7wCjKsO5VDr9v8gEyjL5NKVuN+XHvGXjAEbq
	9sxqGIS1+cUz0XdffTVVgtLZyLZyL2QbL+baHK10JlF4uY/sHqPs2qbnXrcEbRMeDJr2Dn80tFfzP
	I9Fxhfsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVK2t-0000000G7Zl-3ODS;
	Sat, 28 Jun 2025 01:07:55 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVK0a-0000000G7QY-3PAO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 01:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072731; bh=TpUWAVaLMF4ulXcMSeUq6hXbTlYEUlPjAt0Xg4D3NSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o10c/Ov48oF4yT8PSHvLCTPLQ3p0vHQaG6xF7Ny9KxYrG6UGp66QfqDKDCa+zIJiG
	 svDMaFxRCD14bVYn45m7F0tJmIoRKcE8H66ZKPQvsL8qLbuQ/EfELCrQVEZyaBmWEe
	 WFyWedUjy+dciLN4sVgksReARWAjubasaVgyX1LckwCJnsf99G4mjotJB0HX1qq0Bb
	 Ki5u/n6kuxoCfr/Tdgy0z3f/xxxiKAvADzt3eTkiI8dMDtx26NrfEB1ENnJQXL9QS/
	 nEnbGlmZse6zmKNp1TP+lvRGZQ6gEESmi5g9OnvoulMhrd4cuQGp6v7MeX+R5rZuhX
	 giuxQqRVc8Pww==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 5D0153C4FE4;
	Sat, 28 Jun 2025 01:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072731; bh=TpUWAVaLMF4ulXcMSeUq6hXbTlYEUlPjAt0Xg4D3NSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o10c/Ov48oF4yT8PSHvLCTPLQ3p0vHQaG6xF7Ny9KxYrG6UGp66QfqDKDCa+zIJiG
	 svDMaFxRCD14bVYn45m7F0tJmIoRKcE8H66ZKPQvsL8qLbuQ/EfELCrQVEZyaBmWEe
	 WFyWedUjy+dciLN4sVgksReARWAjubasaVgyX1LckwCJnsf99G4mjotJB0HX1qq0Bb
	 Ki5u/n6kuxoCfr/Tdgy0z3f/xxxiKAvADzt3eTkiI8dMDtx26NrfEB1ENnJQXL9QS/
	 nEnbGlmZse6zmKNp1TP+lvRGZQ6gEESmi5g9OnvoulMhrd4cuQGp6v7MeX+R5rZuhX
	 giuxQqRVc8Pww==
Message-ID: <dc0da3aa-f3b0-45c3-b3d0-bf365ab2faad@mleia.com>
Date: Sat, 28 Jun 2025 04:05:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: input: convert lpc32xx-key.txt to yaml
 format
To: Frank Li <Frank.Li@nxp.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250624200659.2514584-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250624200659.2514584-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250628_010531_401950_92253A23 
X-CRM114-Status: UNSURE (   5.62  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_010531_401950_92253A23 
X-CRM114-Status: UNSURE (   6.36  )
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

On 6/24/25 23:06, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

<snip>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

