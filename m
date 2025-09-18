Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926A9CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMNCQB3IZJa1lenTGE4yLUo0+d2lJWLrI+MvU6M7hlo=; b=rSaHUWvD5pvUf0IXDpUvbchlOt
	ZtauIxzzsnsJkwVYqkukXr/IpG9t0Me+CTet+vP0uUBkh5A2lzDJB51pkOMvs+dSRhHNQz4k9ES9g
	Ecegd7BWq71NWP/bA8QTnJwNIi8N5APK6g2ib8tX4B/CVU4JmZO6aipg0xS4aQv1QkiA9xx6A7yhR
	eJIfAJiCIMa7lYcGJGs6bFbJkqxen2H6zKjJEBwtLMY3by0CsK6uE7ByKLjiNyZdxIEZtX1V5oRjG
	xcmpp0FnFNUH7nAd49Hubdq1jGc+TofWTgFY2mkaOQihkI9nVFM+c4mkZOvsHpPBCJUHQazQXXpQE
	Myjzt0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHMh-00000000b2X-1dxH;
	Thu, 18 Sep 2025 16:20:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHMf-00000000b1f-0X5Q;
	Thu, 18 Sep 2025 16:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:Cc;
	bh=zMNCQB3IZJa1lenTGE4yLUo0+d2lJWLrI+MvU6M7hlo=; b=KrYRs1+0IXwH9rggfZxB6I0V6F
	VAf+xYmNBz8d+HEdykNno5v245fcT0C+kM+zRG5hz/ikTomnlz+QfmjC/QS3kh82Ns/Cm8Dcc2XkG
	BcdW/C0yUTbJd09PDkUBnNs94Uk59AofnJfc8m6KlJqO9byyHdqsv/xqN3iKGOmeHKHnaJ/AO0c00
	HsOOsKYhs+HoG9QPh3WM/5xrKTChgnc6oAcXm0Z7ntp/ekW0yj6Wrmw3afS2y/uO6n7CYjtE4meUG
	sfIAZEunYHPCiw3/TFbQZcmoibdlXCvn9ZUpaiO40k8b6JPPzt1EHFgJHwoKIKyP/4WbFoItXFUpe
	Qyi5HrRQ==;
Received: from i53875b0a.versanet.de ([83.135.91.10] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uzHMd-0001yb-F5; Thu, 18 Sep 2025 18:20:07 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ed Wildgoose <lists@wildgooses.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ed Wildgoose <lists@wildgooses.com>
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: fix dma and pinctrl defs v2
Date: Thu, 18 Sep 2025 18:20:06 +0200
Message-ID: <2424735.BjyWNHgNrj@diego>
In-Reply-To: <20250918093246.15623-1-lists@wildgooses.com>
References: <20250917114932.25994-1-lists@wildgooses.com>
 <20250918093246.15623-1-lists@wildgooses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_092009_165029_15A9F89D 
X-CRM114-Status: GOOD (  20.13  )
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

Hi Ed,

Am Donnerstag, 18. September 2025, 11:32:44 Mitteleurop=C3=A4ische Sommerze=
it schrieb Ed Wildgoose:
> Based on feedback, I reworked these patches. I've re-presented both as
> I realise that one had invalid formatting (spaces vs tabs) and I've
> moved the dma-names definition into the same board level dtsi. At this
> point it seems reasonable to also squash the two patches, but feedback
> appreciated?
>=20
> The default pinctrl definitions for the Radxa Zero 3W don't match the
> datasheet. Possibly few people enable extra UARTs and hence it wasn't
> noticed? I needed all 5 UARTs for a project and the first patch corrects
> the pinctrl defs. Without this patch, enabling the extra UARTs causes
> issues such as the MMC devices disappearing, due to collisions.
>=20
> Second patch adds a dma-names property, which appears to be a
> pre-requisite for enabling DMA on the UARTs. I've applied this to the
> board level dts as feedback suggested there could be unintended problems
> if enabled across the complete rockchip dtsi.
>=20
> It's tested on my Zero 3W board and appears to function correctly and
> DMA is reported as enabled.

housekeeping requests:
=2D please don't attach new versions to an old thread, but instead
  start a new thread
=2D this is supposed to be v2, so patches should be named
"[PATCH v2 0/2] ..." etc.

At least the cover-letter should contain a changelog what changed
between versions.


Heiko




