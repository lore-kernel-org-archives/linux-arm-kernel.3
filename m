Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9B2D59F52
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 00:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vFEeYAXaf3SW6O0CRcnu6sCW72HvMdruArHRMGAKsM=; b=E9RzGss2aL0a4e5eGRHsbJWdRo
	aLC/SUQspqUjRw5I/8k5x8VgaKzGaf4W52qTkWzHe9wd1R/OfqEQt8CEaEyIiMBXKH9a7RJ5Z7dIn
	AwClnB9uW70U9KjA6I4XngjmkHhLJdYMRUjys74mp26Kom1XGDbV2Sq4G/uU56pNvP0VYZ/qQHMBV
	9/xTSUc291RdZzRzDoj6TB6RRMIjAGIfoS6D7P3TMBxlvIaCxCW4dSHQiEMckNWqop8x6D2sdbM2f
	hHc4QRPDo9dPKZ6BbfNJRXHdTnTetZ/s368q4oqRP+MMFls/fGKOQBIcejAPvsFGGA3CCYJx1qfHd
	ybhXFxJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUD73-00000001ENb-3Wih;
	Sat, 13 Dec 2025 00:03:53 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUD6z-00000001ENC-1WRy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 00:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3vFE
	eYAXaf3SW6O0CRcnu6sCW72HvMdruArHRMGAKsM=; b=AyhbqKWe0U1hUfrwnOWF
	jH1B2aE8Y81qXHLbaipdJ8gqNy6Bw/51y6OFSS7lWubz/9BZ527M4oI7joUQvewM
	Xu/jLVfGg09xyOwcRak+DeYlZ6bMs3+2/WZcgFCqXR8U+TkZuAQaRPaaefsW95T7
	ceS4Hb7PFarwQuZDvfl2M0s0GV8WI3XVVRurU1pz8lV0a1TtoqDUmjr4VXSOCfnU
	niMJAZUbTepNSFaQnJUDWZdnmid6ePbXxZlVUtdUZeLQ+a+9bJXBeOO3kB9r3F0n
	E/b9p+bnPCRBwrN7F+ntCg7KSvCQbHJ7w1jGg29kEeKAJmOqRlpJqietNhU8Zyxt
	Mg==
Received: (qmail 129915 invoked from network); 13 Dec 2025 01:03:43 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Dec 2025 01:03:43 +0100
X-UD-Smtp-Session: l3s3148p1@h0xRHMpFguAgAQ9wBwAkACQ4Xrn/InjS
Date: Sat, 13 Dec 2025 09:03:39 +0900
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
Message-ID: <aTytWyyZiYFnyauo@shikoro>
References: <20251212203226.458694-8-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212203226.458694-8-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_160350_254707_FFDDEC02 
X-CRM114-Status: UNSURE (   9.85  )
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

On Fri, Dec 12, 2025 at 02:32:14PM -0600, Rob Herring (Arm) wrote:
> This .dtsi file is not included anywhere in the tree and can't be
> tested.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Nowadays, this should be a dtso which did not exist back then. Is it
okay to convert it? Yes, I can do this.


