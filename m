Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BD5C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzksFsHwUZAZdl059Q9dYveJ5pvso9jFFjPVpDgEbd8=; b=zbA0VRFI1fm9uyGpoXcs0llw0E
	cVW/6uYRHQpIpuurtl5bGGEK5KBQqFqAbBsemN9NSXXppvtluAb1mqjIHdHHJs1i7AMHEslHBJ8XU
	aGfA6Er9venCikkvWKIc64oyBCg8UpszBAJyduvRoASTBliUvokUqoayVCUH6WgzHwQ2sIrKYtepq
	NG1KHnGWH1bkIceJr1Ga7KxLGqW1kyDcLqJrEo8SYQBUO/XLPA0OOttpxel0Z7Hqg/j5PBO6mb6WL
	0sn4CNt9BDRf0BTcYEctyDKuagxn2OOoe7iAbgmEZ989o7qH0kzqKAGpjJonSk+CCYOG5UPKXbJM6
	b352xMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trup4-00000004zAh-0kbe;
	Tue, 11 Mar 2025 08:18:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trunO-00000004yvX-13C1;
	Tue, 11 Mar 2025 08:17:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D01B55C54EC;
	Tue, 11 Mar 2025 08:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70269C4CEE9;
	Tue, 11 Mar 2025 08:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741681021;
	bh=qzksFsHwUZAZdl059Q9dYveJ5pvso9jFFjPVpDgEbd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZmENIUFu7jOuBLc8tK9jQIJs7hzrt5xOV43/NGKih9hZnUxXyagM4pLvsos+raNM
	 fKt6PigNDT53PJSxWG0ljsBzAzp+Bx61h9G1ihZXaI6xeDnS/nHqNOvTTVY718b187
	 I4sDfB/hJgaDg1apyDlhBld5DrWiAQYC1jU2x9jlKnvLmhKM6k8YCjbz+miSsZzUbj
	 9tqNOteSSj3eUmLr2Uzjlyt8qOy+f2RBzbnrpGLt/AjcUnUJBgaoKKunCW78YXC9/C
	 mT7Hk6mSpCHwSA+yNyeSlEnOsdnkBExitrlhXsGvWabUcivkHF2fX8n0gc11a5FPG0
	 Pqbshzo1yKTcw==
Date: Tue, 11 Mar 2025 09:16:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v6 2/4] dt-bindings: clock: axg-audio: document A1 SoC
 audio clock controller driver
Message-ID: <20250311-famous-adamant-teal-20b1cb@krzk-bin>
References: <20250309180940.1322531-1-jan.dakinevich@salutedevices.com>
 <20250309180940.1322531-3-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250309180940.1322531-3-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_011702_345999_3F2A6C42 
X-CRM114-Status: UNSURE (   6.19  )
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

On Sun, Mar 09, 2025 at 09:09:38PM +0300, Jan Dakinevich wrote:
> Add device tree bindings for A1 SoC audio clock and reset controllers.

You sent multiple copies of similar series to which you got responses. I
don't know anymore which should be ignored, which got my response, so
just in case I will skip this one. Please implement received feedback
(here or in some other series).

Best regards,
Krzysztof


