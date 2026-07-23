Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F5CC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29kO6oYeUoSm7e8Y1kHOj1bvp81JeeAODvGvsL9nYnI=; b=yOG7+SzJOpnr/qRbR4T3/eyFh6
	T3OqPl9XcBn39DNSQQoEqxzpU/3f6EVs1q9hIZ/ZuPjG46cZAbHS5svLVY/0hQFjh99qZuxEXzqHA
	1EQGva80DMT+oRZJMRZDefag8tfJ6iJU1KVB/y3rCXudUyt9mGIwNMlaDJNGVKb+PGg2SOtSSKLQo
	Tc8SPnLCHiHdW3N0kSs7mtdakB6sJZOVqWN0gOIuVe+Pi7FAGCSHKZAap+Piy2MtaAeLAFSvptyNz
	XFDdw8Jo5faVPIIettoM8y8L2C44PBaqEKwIFcfc+Nclu6EMvFPMdLCcfiJq9WEn3MdtixoFw5cQU
	ua55x4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsWG-0000000EEjq-0ynW;
	Thu, 23 Jul 2026 12:27:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsWF-0000000EEjk-09jm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:27:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15D89600AD;
	Thu, 23 Jul 2026 12:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CC91F000E9;
	Thu, 23 Jul 2026 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784809637;
	bh=29kO6oYeUoSm7e8Y1kHOj1bvp81JeeAODvGvsL9nYnI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=brsyr1zjY38ayyaTX+WpF25csJg9sfdOpeQURKLG989VI0SqjFglM3g34526GJH3q
	 12XYkoyEwpYE8aK7SUFzuACj/6YWpoVoC3Hz9BcaEn7PKBdTThv/w3azsVNFdRFNwu
	 LLRPa8ScYjvb5MvBn6vkB9wHB+6gkbmtJ51OZ8HWVLvZ+oxVILxfQGxnjqnTkk/FGW
	 TvbQlpBE7A6ndn6xb+XVnax4OScuE3lvUvhZZsCgKNpl7U0ns+uRTZKFrC4le2hzKb
	 uZ2TgfH1ke6aV0mK/DuPlTbdBsIFtIeU76lz1F3DZHDKwb8AfUslrTA3KGSfRtfyWy
	 1c7zsPVJ8DXcQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, william.zhang@broadcom.com, 
 anand.gore@broadcom.com, kursad.oney@broadcom.com, 
 florian.fainelli@broadcom.com, rafal@milecki.pl, linux@weissschuh.net, 
 krzysztof.kozlowski@oss.qualcomm.com, tzungbi@kernel.org, 
 Ninad Naik <ninadnaik07@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-leds@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, me@brighamcampbell.com
In-Reply-To: <20260713200732.2470666-1-ninadnaik07@gmail.com>
References: <20260713200732.2470666-1-ninadnaik07@gmail.com>
Subject: Re: (subset) [PATCH] leds: bcm63138: Use %pe to print pinctrl
 error instead of %ld
Message-Id: <178480963434.3405982.16645336608309304296.b4-ty@b4>
Date: Thu, 23 Jul 2026 13:27:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Tue, 14 Jul 2026 01:37:32 +0530, Ninad Naik wrote:
> Pass the pinctrl error pointer directly to %pe to print the
> symbolic error name.
> Detected by Coccinelle. Tested by compiling.

Applied, thanks!

[1/1] leds: bcm63138: Use %pe to print pinctrl error instead of %ld
      commit: b6e08e0ad4cfafab2c2070456e7eeba17608a35d

--
Lee Jones [李琼斯]


