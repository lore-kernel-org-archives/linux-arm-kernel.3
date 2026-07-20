Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABD1C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 20:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvsHl9nCB/3oWpy2i1hy1ychLtOehm4UQV2Y2KB3lfw=; b=yjpOyCqh4h7k0bBfDG0u5nCdkU
	6GYfF4XvktJR2NiohQ6KBGZqUCjZbYWn6qJZXGTpRZqEtItJM0F8FCh7x1nilzJpiACNntF2wgQiI
	ETVwjq0mY+HfbwCThdy9CWdw2cIM5LOsHoGZndHF3JFyBKfG8QTIRpcAi6lAj4H0PKXa64mlpdaon
	IuabopwmTmcEtsD9hw0maARmNlOStc1uUOS8GiIQCKttFn9AvitffM54crPTllNMGhuwAnoYrJ/Rt
	LmjKE2Z0XhKmGdJD1IZXVthT8q6xlSUNGWr4NdZCkmTCnUs27fQcHx87BQIVNrzUDr5joK+mX/YOt
	O502j5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluUL-00000007qng-1AOb;
	Mon, 20 Jul 2026 20:21:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluUK-00000007qnS-15OV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 20:21:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD5EE41699;
	Mon, 20 Jul 2026 20:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9973B1F000E9;
	Mon, 20 Jul 2026 20:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784578879;
	bh=WvsHl9nCB/3oWpy2i1hy1ychLtOehm4UQV2Y2KB3lfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HnPEsUJq54Co5xi71dKgJd/7lqrTFRL0qGIobg336BnVlU/Ub6sjuAoBgmX15h/Bc
	 4fO9ammUsx21F+uhFB0mKBcaE6j/AD5EmbXvjqCEsSpLEj32Akx7P3+BkqUNxuDyG1
	 vdSTA4HQ6UZ14forz39AG4DvyrvRmkAx1Aa0bY4TWYtcW3JFaKd47y3QRzBlN3zFmN
	 g4S4hydUrjF647jGwO2UDXboBqeWzWVgieCuuTKK1Z0B0PktOGB08HO40p3oMZsajQ
	 SABr631mPhJkISXdPcD5fl35qLcjsNCsMeuNcp6fcJ+Fg0espphp6zmP0zj/OOSWIF
	 6E28bQsJ53Q+g==
Date: Mon, 20 Jul 2026 21:21:14 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Laszlo Ersek <laszlo.ersek@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, arm-scmi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/devicetree/bindings: update Sudeep Holla's
 email address
Message-ID: <20260720-great-sidewinder-of-tornado-8b1b30@sudeepholla>
References: <20260720160235.36592-1-laszlo.ersek@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720160235.36592-1-laszlo.ersek@arm.com>
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

On Mon, Jul 20, 2026 at 06:02:30PM +0200, Laszlo Ersek wrote:
> MAINTAINERS disagrees with Documentation/devicetree/bindings on Sudeep's
> email address; fix the latter.
> 

$subject is bit of a deviation from normal practice. Otherwise looks
good to me and thanks for updating it.

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

