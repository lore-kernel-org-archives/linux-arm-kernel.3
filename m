Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E58C982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XX2yD+8wURMhJe8OMHAj9LszXZhB6LGH5KwBAjhAx08=; b=PgJaRo5kBJ1EsbI2S0COwYzib+
	lD5AiqdWBwgznvnOllQOMIqmUkYwQ4teARGna0UMSthcvaLI9LEqOcESNuEvHjaxMU1qiA3cfVtks
	s84Omlb33RiSls21imALGY4TvJFo8fwiadCHIykXyziOp8R8H5LeJ80KMPE7iXerFZAuK6/5o2Z8A
	B8UvOVrgu1EwuJ3nG+CNlU4fbDH0wt8oMfqf2LfM5iSXnc88H0qJkaG9cZ10WpKau8VivSNck1BXO
	IdcGPHOY/Zxz7z21Kp/ZE7RlGfoMATk/ZyjKE/BbcfqhfkW+lZDIDFt18tawsUgpk/ZIheUYYZ8Kx
	9j2PFQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X1C-0000000EHV9-2fog;
	Fri, 18 Sep 2026 11:44:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X19-0000000EHUI-1khV;
	Fri, 18 Sep 2026 11:44:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D7E3D413A8;
	Fri, 18 Sep 2026 11:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFBD1F000FF;
	Fri, 18 Sep 2026 11:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789731874;
	bh=XX2yD+8wURMhJe8OMHAj9LszXZhB6LGH5KwBAjhAx08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yi6tIWX4ay20JVGOp4RLYzDscKJEdk1Py/RsefQ9uBr94B4lTauReE6wK/Slixycg
	 IXBKwvOzgdL7WOkZ4zT1BGHkKqnJ9Xvy8oGNVel18E1h6DTkQsGBBDFDXd1mQ5fjEH
	 0nAHLupBTuwp0pjWhuzKoeHA5hW0DKjBGxN3xh3mjmrS0qW7DMbMNYvrg8BAJf5sJ5
	 GbHLa1utAJdX/Jyw6O6sKUKbBxfXs+1zdHv4k/gCaO48Ff3bKUF5DnK9tUFvfIyPKh
	 gvV9ZrOLjEUVdNy7NRX1c/5qeH+wvZc+ouAGVgbizdcrC3FGVZwLwhL0+E9APj+59A
	 yPC7/Nwi/Yh7Q==
Date: Fri, 18 Sep 2026 13:44:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jonathan Bell <jonathan@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5
 RTC
Message-ID: <20260918-steadfast-unselfish-loris-996d7d@quoll>
References: <20260917135841.841680-1-sander.speetjens@gmail.com>
 <20260917135841.841680-2-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917135841.841680-2-sander.speetjens@gmail.com>
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

On Thu, Sep 17, 2026 at 03:58:40PM +0200, Sander Speetjens wrote:
> Add trickle-voltage-millivolt property for the Raspberry Pi 5 RTC.

Why? Describe the hardware, the need, not the diff.

> 
> V2 -> V3: Fixed the firmware property naming


Changelog goes to the changelog area (under ---). Please look at other
patches how they do it if you are uncertain.

Best regards,
Krzysztof


