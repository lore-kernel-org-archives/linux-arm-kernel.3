Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E059F532EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Il+eRjfR9OkeQof+2g3xBYD1JMEFfR8o1c5m4dXkzw=; b=dP6w51SO6EmW/P9kou7Ikk4eYT
	UYYKN8lhmA6Ht+P+uzkywYRyxhBh4/4+NI/8GnulB6lcFGlj2n1nEPEWJ6XGaKLiFyY+SDcJ6rZiG
	IYkNQlPJJN9yMtmHL7jgC5wltM1JFp5skxsGMFu/ujeEIUIm+IxL7JSTg/6VeT3G+jTwJeKYVSupH
	Vy1jFHEdRqwKvhtdfhzqclvXsijj+AoFNLSNOpMuaGW4RxP5TUKPmjVnuxa8kbHHNVj8oPaaVboqn
	CNWngOm21puhPzKugIwKuv7zFg+wTad1qQ7A2PNJyUlL3gYemv2iIRVcFPqQCdWt7LDagUCvjo3wN
	sIT/e5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4weu-00000000wDh-3X4E;
	Tue, 24 Mar 2026 07:58:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wet-00000000wDb-2yXv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 07:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9434600AC;
	Tue, 24 Mar 2026 07:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11451C2BC9E;
	Tue, 24 Mar 2026 07:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774339118;
	bh=E+devhyf9IBWaUXNi/p4XMjZeYP3OaMpOXno4la6WrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=01CJnKZWmVm9hOCxsByxCGITUNgJJf7mlBVaCZSReqbWYJyB1yH1m0yHJFmNfM2hJ
	 M2V15EIv0mvwaa1OMTnRxUV59ka36szHwS1qylnysTzvZ1725rohUs+vMROEnVujad
	 B0YN3zO4EIvIB4fAYwm7GQCvhYVlc4N6M8k+G1wA=
Date: Tue, 24 Mar 2026 08:58:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Richard GENOUD <richard.genoud@bootlin.com>
Cc: Kexin Sun <kexinsun@smail.nju.edu.cn>, jirislaby@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	julia.lawall@inria.fr, xutong.ma@inria.fr, yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: Re: [PATCH v2] tty: atmel_serial: update outdated reference to
 atmel_tasklet_func()
Message-ID: <2026032400-trimming-amused-b147@gregkh>
References: <3bd295ee-1607-49db-a12e-5a4d4fc81c5c@bootlin.com>
 <20260324024857.3244-1-kexinsun@smail.nju.edu.cn>
 <89bc9543-9fcb-4563-b6ff-01b186231ce8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89bc9543-9fcb-4563-b6ff-01b186231ce8@bootlin.com>
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

On Tue, Mar 24, 2026 at 08:08:40AM +0100, Richard GENOUD wrote:
> Le 24/03/2026 à 03:48, Kexin Sun a écrit :
> > The modem-status comparison that used irq_status_prev was
> > moved from atmel_tasklet_func() into atmel_handle_status() in
> > commit d033e82db9a5 ("tty/serial: at91: handle IRQ status
> > more safely").  Update the comment accordingly.
> Double space here, but I don't think it's necessary to send another
> iteration for that.

Double spaces are the "real way", so this is all good :)


