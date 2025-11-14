Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0152CDE00C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 04:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Asl2n77HU3heubUqSeGFUaLgvo8IPQ436F0WxE2PGX0=; b=SnOOparDm18bjQJMEH5Yjmj0cd
	btglkRVSW0H9401hvSoKZkOSrY1iXznXBF6YWofQO/l1i9Jwb4S7hT1+B4BPBbPx6pvVKC/jzhOEo
	5JtK3COBbuinw5JUgsqKTeXDSv2mOnaC204JgrKc4Z/eRCdjSkf0GiFF4TVzaIYw18XURJQlNy6S7
	7ml6c+30dFNDLzcptbGhjTNSbzVIZMDZORsvJ34zWuFg6F+Pg2OfHgX027oKnxHv8uwQABVDdlUg4
	lDs+IcsvTKAIrhmq+DYgsqEOROwOEUJi2m4yDx8cVSnAgzacefWqxhENpkPyRrhhu9RCZ0LTEELWa
	+wxKXZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlRw-0000000BXwK-3GtL;
	Fri, 14 Nov 2025 04:30:16 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlRu-0000000BXvp-1CKs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 04:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763094611;
	bh=Asl2n77HU3heubUqSeGFUaLgvo8IPQ436F0WxE2PGX0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QGP5Yb12xJXFWdCyPoGzgklbAoRrvIoeVYaYzwPUwi/V8gT/P5FinrJrjwHjkbOWy
	 p4FYmlSlNYNesjTZv5fQCYPAeiOLm2DNRu43/KuC87rM7+qUrXKkvRitIwPTm/PZ+W
	 SCpvrIHopL8h75j8jx4QZHqb22sftUNvwBSD1KvP2yo3BKam7OG99V32+ahF0Zh5ue
	 x+inRUwUd6T70FtkiQjTFKzmeQh6W96EHdRsSvfqW6o2s3/8u/ofdsBOM0b/VEjLVr
	 12pgtYVKulZNx7duVVG0sSTG+kVo00wauh4v3XyM2hMNxLv1Dsc6O+zIR9k9+4FJI3
	 eVm1DjAZbHmdg==
Received: from [192.168.68.115] (unknown [180.150.112.244])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5BE61783DF;
	Fri, 14 Nov 2025 12:30:11 +0800 (AWST)
Message-ID: <a4d3dc7e6186f41f5bae9135574c21411826e554.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 0/2] ARM: dts: aspeed: Add Device Tree for Facebook
 Anacapa BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Shen <sjg168@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org,
 peter.shen@amd.com, Krzysztof Kozlowski	 <krzk@kernel.org>
Date: Fri, 14 Nov 2025 15:00:11 +1030
In-Reply-To: <20251112211248.3711889-1-sjg168@gmail.com>
References: <20251112211248.3711889-1-sjg168@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_203014_521327_35EA7577 
X-CRM114-Status: GOOD (  12.93  )
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

On Thu, 2025-11-13 at 05:12 +0800, Peter Shen wrote:
> This patch series adds the device tree binding and the initial device tre=
e
> source file for the Facebook Anacapa BMC, which utilizes the Aspeed AST26=
00
> SoC.
>=20
> The patches configure the necessary platform peripherals and aliases for
> OpenBMC usage.
>=20
> ---
> Changes in v6:
> - Rebased onto the latest upstream kernel (v6.18-rc5+) to minimize potent=
ial merge conflicts.
> - Restarted the patch series submission as a **NEW THREAD** to fix the in=
correct threading/In-Reply-To usage in v5, as advised by the maintainer.
> - The email sender address (From:) is now corrected to fully match the Si=
gned-off-by: and Author: address (sjg168@gmail.com), fixing the DCO mismatc=
h issue reported against v3/v4.
> - Corrected all previous style issues: fixed block comment styles, line l=
ength issues, and removed un-documented/unused device tree nodes (amd,helio=
s_cpld and eeprom@53).

I recommend using b4 to manage your patch series. Using `b4 send`
automatically tracks your series submission and adds links to prior
versions to your cover letter. This makes it easier for us to track
down feedback and changes.

Andrew

