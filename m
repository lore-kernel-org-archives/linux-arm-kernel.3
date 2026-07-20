Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C49DC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 23:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cx+ezRc11qoejyDwRyBvxAc3Is3tTNGOfMZZRPcGCGo=; b=jzdqAv8KY7bcKIClzFM/OUuZKE
	XotzU1vj/PrQcSfJLz8Z81WBCFBLVDWoB3px50uP/HjFUFamwnWZ49AFsnhAa55QG27uNzsykVO47
	4rDz2o8K3C+0uWJEyxVBTO72jErt4zWtLHekZ8Q+00Bb8tm23wFCvxj9ZxsWPf1YX9k1APPvknRj9
	2d5NeAHEyyeOtzTfHMA+hnkl77k2TaG526l3R0GCexw/smdaS+ZANYLh/Xdo6vSLcriDvsKyFKUIL
	C5SNbsBAXlXrir73NCeJbTvsz8pL3QWcvYo6slKnyVRklhnYpSIW1zqbVlIUVxasudCpNKqcIWQaG
	iFxeuqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlx9p-000000084oD-0y4j;
	Mon, 20 Jul 2026 23:12:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlx9n-000000084nz-0hx4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 23:12:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 43FC060A7A;
	Mon, 20 Jul 2026 23:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62A41F000E9;
	Mon, 20 Jul 2026 23:12:17 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 40CE118081D; Tue, 21 Jul 2026 01:12:16 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sebastian Reichel <sre@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Peisach <jpeisach@ubuntu.com>, stable@vger.kernel.org
In-Reply-To: <20260712-gate-power-v4-1-aa59c6583247@chaosmail.tech>
References: <20260712-gate-power-v4-1-aa59c6583247@chaosmail.tech>
Subject: Re: [PATCH v4] power: supply: macsmc: Support macOS 27 SMC
 firmware
Message-Id: <178458913624.374847.13868321140299746497.b4-ty@collabora.com>
Date: Tue, 21 Jul 2026 01:12:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Sun, 12 Jul 2026 00:48:56 +0200, Sasha Finkelstein wrote:
> The SMC firmware included in macOS 27 changed the size of BCF0 key from
> 4 to 1 bytes. This key is used for indicating that battery state is
> critically low. In addition, B0RM key has changed endianness.
> 
> 

Applied, thanks!

[1/1] power: supply: macsmc: Support macOS 27 SMC firmware
      commit: f7b253a6e217f71d754d70c525e9b4c1dcbd4414

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


