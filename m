Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7FFCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 09:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJcW4nczgRureB45v9RTmjAU4uZkHavoR6nx4jULq+g=; b=ft57OSi7l9IFwouI2cmWT+6cDR
	MJLDWDuqIBILNkTCxHcyQMEjpKan0Y8iKpjIx2Z7p6dPpXkZ283ToZSDNRrgDHN6BYP0oRSIycc7F
	S1n8m1RnZOLya5txqANtal/DfhHdL22/MmR2mZwHtfFZrMxdhc9/GA3NAfV14KlSqYkQYcaC3T34J
	EPsbSi8wOXiwWLgRcVxmowMGH9DW4jlHYuY/FWBFhXHCLfDFxWHYoILuRaxmU5oXdDi1kybWFgMQ+
	yON4J3aN7IDaALQ76QrCl9JaBYXRXgpfHI2w4Oh0Up0jDT6B3zazn5Ti7jKT3v0o28q8RU0wPz0Bu
	tlDDu+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeiC-0000000CpfX-3o4w;
	Wed, 20 Aug 2025 09:02:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodwN-0000000CguY-0KM7;
	Wed, 20 Aug 2025 08:13:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79D416113B;
	Wed, 20 Aug 2025 08:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97A8C4CEEB;
	Wed, 20 Aug 2025 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755677582;
	bh=CH9L5v4OJHqNF11uvWGznbvo74AYetAeErsKQ/WIsgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U39V5nHDEseiJajLZVfudpRL/MtpIT+/avAlSeh2oaPpigXeGuFJlFtv9Pna+GkJC
	 kNET9eK9bntCIZOV0NDew5F0GzNZFpLDKfHgrV2S/HvEx1rQjz0A0tQf0IZSpGM5/s
	 pvnn1fcJKT4FcYPEf2olm8TjAC1e4yY6P2fZ8SluGuEOueXPI3lnSORQgxvhqfALwc
	 XNsB4pu+l2wzfzeWI6gtUQsCoAC/aS75Ory43kIpRCskfkScxIZinzwVISdWerqWem
	 yTbjFbdJmBoSKt6f4fies/UpbdtFvx2TnExtnPiIFUILzyiDLit7yzWqSklHvh3Nre
	 iqAt5wZ4daSXg==
Date: Wed, 20 Aug 2025 10:12:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] soc: amlogic: clk-measure: Add more SoCs to
 support clk-measure
Message-ID: <20250820-spectacular-passionate-oriole-eaacda@kuoka>
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
 <8e64245a-d7ce-40b7-b884-84a7234c4a3e@linaro.org>
 <673d8146-1cc6-430f-81fe-9e99896a56f5@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <673d8146-1cc6-430f-81fe-9e99896a56f5@amlogic.com>
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

On Tue, Aug 19, 2025 at 11:32:07AM +0800, Chuan Liu wrote:
> > 
> > But the fact you need clkmsr-reg-v2 means you at least need to add a
> > generic
> > compatible for v2 register map and drop this property.
> > 
> > Overall, I'm not a great fan of this, it moves data to DT and duplicates
> > the strings in _all_ board DTs, which is worse in fine.
> 
> 
> If you agree with this approach, I can refine it based on your feedback by:
> 1. Adding a new compatible property: "amlogic,clk-measure-v2".

NAK

See writing bindings document.

Best regards,
Krzysztof


