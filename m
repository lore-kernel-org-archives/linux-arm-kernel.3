Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22075D6408D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryoAGCrbNL6MiCN+uo1T2w6mNoskaai3T4G0+EvUCEQ=; b=hFEoLgjkAlHYxxMev4JNlpjdFS
	gRsgIc/YkeNTIhQNxXhx067iHsMPdi4I5Zvyqfewufr/eeXwCBA6KXs/v5jKOujQgvioFF7E1jBDl
	P0HX4aSuzPBWDTC8pO6aL7Par3wmyY+ZiQB8hoIUzEITLG0go5IwfmuqtV+Ax/oOTNWO1Xw1EyZru
	UQgsPfnsBvEZ3vo3GxrbpAOwFcdEGKkmEUdHqOgi2KJQwJ9zYY7saNox5Cj+KPPSHehDSlUYEbyz7
	3wcEsVfqgbcbn2958uPFQQcSen/W/B61nurahrTwx0f26QNugzEMI7q+R+npPWHVo/7h1sSpiIxzv
	ng3oFF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmwM-00000006M0e-3PAD;
	Wed, 17 Dec 2025 08:31:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmwJ-00000006M0Q-10jh;
	Wed, 17 Dec 2025 08:31:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52A19601A2;
	Wed, 17 Dec 2025 08:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8A4C4CEF5;
	Wed, 17 Dec 2025 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960277;
	bh=ryoAGCrbNL6MiCN+uo1T2w6mNoskaai3T4G0+EvUCEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YATqAVZQRwof4ZvZmVY5lQYranH3I3lQayPyfpORo8kXGYqD+e1+aTdlqvGmjpxjO
	 5FWcL7dHALOF9Zr16+VTZraexeUuIc6fkykhZC6RSx1p8J3JUU0/acah1lkUyj+O50
	 eyNnZLW4fPhaZ3urptadO9ndOsIGqGqNpeGwtyO6XqZHRWguCeDXXf5Jzok/rVFW2c
	 luPrjAiq7ByNNDzVZjOKBIzlNijqnEnPUbX8J5DSZy9tqRL9OeibyU6C0E5dk727qS
	 /xwy8zFBkZu5KTn69PDgT5RSAzY0bzMUmbQ74BosQRJsLLl4OWPxjfYSyQVIENFYsz
	 P9TedzWILIafw==
Date: Wed, 17 Dec 2025 09:31:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: input: adc-keys: allow
 linux,input-type property
Message-ID: <20251217-tough-ultra-junglefowl-f1a9ae@quoll>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
 <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
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

On Mon, Dec 15, 2025 at 01:29:29PM +0100, Nicolas Frattaroli wrote:
> adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
> property. This makes it impossible to model devices that have ADC inputs
> that should generate switch events.

The solution is to use unevaluatedProps instead, which also allows
dropping other properties.

Best regards,
Krzysztof


