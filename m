Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D3F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 20:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E96hbwGY;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=125FkxPy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OqCBZEU+Pd0NjT6IFooBVYOMysmau4mF1Iu3HMfa8Q=; b=E96hbwGYlTMRvewTpeZB1OwUhO
	BXqgeiUnejNtpE7kQlXKxb/+d1kfZ7RbyI+z+rRnEthJRnEUo8MDY/EYGptgjoOz42ZW5uRDioiKC
	Mzzl2oQyLRFsKmZ9UTjPyYE0HS+FV6ycBujWdCtwQMiiJgMaNuVZEKvzHlANq11VjRlXiYJoTKJv8
	5nvMjVO1d/SOq5iiKFNvk4oC4cVDwg21HEXfzF5zpIOET1VFCpgGqePxkLQHGOsoaeqSeI5t8mz0v
	uIHwa54Ishglg2iO52POs8pehahq3px/ggw+xrKoYaEFbHh21j596GYvr79lCUAmS7Km9NAz57sD+
	JRjGLjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIuBC-00000008K8N-1h3k;
	Mon, 19 Oct 2026 20:41:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIuB9-00000008K7Y-1FDa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 20:41:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8DB954E4127B;
	Mon, 19 Oct 2026 20:41:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5666960582;
	Mon, 19 Oct 2026 20:41:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A21210328C22;
	Mon, 19 Oct 2026 22:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792442507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=1OqCBZEU+Pd0NjT6IFooBVYOMysmau4mF1Iu3HMfa8Q=;
	b=125FkxPyq337Vh1OA3wc096MpieQslVvspAetPhiqRNcfzezjW8yUqNWb293H6KYbEBRnq
	drquXFkIIeHoGijkogfsWs79lJjio0WYQvdD6t4Ip5emGPb2FNufxi322MXRIDgAp99R4A
	Oy80AR0N78yCHFBW1lB16b/vndjauepmv15KiDJkXZkNBoUnD31ltEMksLjY9U13CUA/Yk
	wwRGtIpgn5VzrDwHtXpw1tgFgDqA2wlwVrzy/VkxMO4BcNwkgA84M0DRfHoMnV57dj99+x
	BiziaCGzUuDt73HouW/lLhFFAAouMpYXA+B4luzKS+w5/piUCkaDKK7B+V5rCA==
Date: Mon, 19 Oct 2026 22:41:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, pbrobinson@gmail.com
Subject: Re: [PATCH v14 0/3] Raspberry Pi 5 RTC driver
Message-ID: <179244249433.112512.16719708376827736602.b4-ty@b4>
References: <20261018151056.1051330-1-sander.speetjens@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018151056.1051330-1-sander.speetjens@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_134155_468470_47702D92 
X-CRM114-Status: GOOD (  12.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 18 Oct 2026 17:10:53 +0200, Sander Speetjens wrote:
> The Raspberry Pi 5 has a battery-backed RTC located
> on the DA9091 PMIC accessed via the I2C bus[1].
> Access to the RTC is provided exclusively through the VideoCore firmware
> mailbox interface (not via a direct I2C register interface).
> 
> As stated by jamesh on the Rasperry Pi forum [2],
> "There are no plans to release a public datasheet for the DA9091."
> So we are stuck with the firmware interface for now.
> PhilE also states that "The firmware needs full control of the DA9091,
> sometimes with extremely low latency,
> otherwise there's a risk the supply could just cut the power."
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
      https://git.kernel.org/abelloni/c/09399a7cd932
[2/3] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
      https://git.kernel.org/abelloni/c/58db0fbeef2a
[3/3] rtc: Add Raspberry Pi 5 RTC driver
      https://git.kernel.org/abelloni/c/dba67294e215

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

