Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D0EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 13:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQUPGxoaH8FA59cOm8IpluUIIZocGZ7cJ6+fjnFb0aw=; b=mX8rifJsj/bhDeBJe1+1GDAdS3
	WDQnTwl+xo+dfyEQqNbJtKIqNMfvavXlEpBsfjlT2VH3yAUbhsE3BxwGrmIwvZd1gjiKH24rnpztk
	0UHp94mc9RCdAWbXKchhH9b3ORlYakPzv+sPHture4Q4Dvab09FZVJ93u30/HueGmMwAHTCKlv9FN
	pHSlmcgMxrREhYGqzjPpHl7TFLrrMKT8vqywaJqkRbCJRxT02Msda9pxIgm9rlk23+Tt3zPtC0Mat
	BQC8S5wY71h0NcKny0jNDpCqycrFS/1xu6mUjkf7gnyRAkAw5Pqeyy7DRevAQ4ssdQlZ/Vu16tRWD
	SWn36aDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taadJ-0000000AFzN-0YEP;
	Wed, 22 Jan 2025 13:19:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taac1-0000000AFli-2i4d;
	Wed, 22 Jan 2025 13:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mQUPGxoaH8FA59cOm8IpluUIIZocGZ7cJ6+fjnFb0aw=; b=hDGA3cWkUIjckV8IEpqdEy2BJ2
	SgI2YPnxfeW+EhMoGELAoVeMIQQEC48m5RGhHktUd4o6xJ6W5DbSNnhOUKBbTOvZRtXuY9ITVNEVP
	NoBbLrmhH/h7RwgwGb5SIdr/rK60OO5V5v70Tt+AI8nHTANqupQw4gHiD5++N5/miFehZaDUJoNFx
	x7M74XOo97mJ/8sii2d8/cJF0akRn4K3LnkTF6+Jiklr1MqjC1hS3AXjI0792P+Mu7Mf4KVYSO4OT
	vAs4SLdi2yVuyh4FhK5SF8os7jka2Qq03ZuXOald3Rnqdk65NhQifqjN9xzuPiwd+u/6GvXY7nw4U
	6r1yyxGg==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1taabs-0003Kc-Ss; Wed, 22 Jan 2025 14:17:32 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: rockchip: add overlay test for Edgeble NCM6A
Date: Wed, 22 Jan 2025 14:17:30 +0100
Message-ID: <39523024.10thIPus4b@diego>
In-Reply-To: <bbf47543-6fe3-409e-a988-35be63d47cfa@wolfvision.net>
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
 <433a8050-98b5-409b-97b5-00fe0e719a52@cherry.de>
 <bbf47543-6fe3-409e-a988-35be63d47cfa@wolfvision.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_051741_708572_9DB2882B 
X-CRM114-Status: GOOD (  22.73  )
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

Am Montag, 20. Januar 2025, 11:34:25 CET schrieb Michael Riesch:
> >> Maybe open a new section "# Compile time tests" or something like that?
> >>
> > 
> > The above line is to compile the build-time test of overlay application
> > (notice the missing o in the extension). This points at the target below
> > (which ends with -dtbs), which does require the dtbo to exist. So
> > essentially, they are both for the build-time test of applying (and
> > generating) DTBO. I feel like this comment/section would add to the
> > confusion? I may have misunderstood what you are suggesting, can you
> > provide an example?
> 
> Thanks for the explanation. At the beginning I was wondering what the
> point of this line was, and thought that a comment that explains the
> purpose of it would be beneficial.
> 
> Maybe it makes sense to provide a section so that other contributors
> know where to sort in their tests, so maybe
> 
> # Overlays
> dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
> [...]
> 
> # Compile-time tests for overlays (and combinations thereof)
> rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb
> rk3588-edgeble-neu6a-wifi.dtbo
> [...]

I do feel that both parts belong to each other, and we're reading from
top, so personally I'd go with Krzysztof's suggestion.

# Overlays
rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb rk3588-edgeble-neu6a-wifi.dtbo
dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb


Having separate blocks for overlays and the description of the building
blocks just causes the reader to jump up and down between sections,
especially once those parts become larger, so please keep things together.


Heiko



