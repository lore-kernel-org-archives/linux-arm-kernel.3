Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45994CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 12:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aBai4Bmp3FNjqpzIHTNtSmcD0KEMyb3M+ZQ842RQWw=; b=OtJ8okX0OXdvMA7AijIf1GRXJi
	dfX2JMelclzGETfCKLyn2BOgEViheAw8yEt70S6aapfCdoKdinGxB/aJLmVnThLGbAqqaWtvlfGHq
	UF5ez33Ma8idScEQYsoqc2kCDos9QBEQ8ORq8GOc1wV8x9HqqGydjdvEY0gxNCySrikx+KTPstRO/
	Q4p9e+oIZvltSx+BzvOZ2rZTrxySbCV/zLoPR5bmfkVxJaqVchFtrULzFq4kL0JLJQAsf8ntDKhf0
	NNhostl50+GxHCGlnWhWr5wRqEI8tmMI/KyJ7LzvF3riTnVfEPD9K+cbxiDwuE1o7A9WSPylkuTGz
	drVa3Wig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4XW-0000000GvH5-2gY3;
	Thu, 21 Aug 2025 12:37:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2MY-0000000GZ0T-2ZaB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:17:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CE41152B;
	Thu, 21 Aug 2025 03:17:32 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABDC63F63F;
	Thu, 21 Aug 2025 03:17:37 -0700 (PDT)
Date: Thu, 21 Aug 2025 11:17:34 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: Juno-r2 WARNING kernel time clockevents.c cev_delta2ns
 clockevents_config.part
Message-ID: <20250821-thundering-skylark-of-proficiency-a17ddd@sudeepholla>
References: <CA+G9fYsYVuEpL5KnYdq4ciRmpnUMQqkNQHmy7y5XvUm48kjxyA@mail.gmail.com>
 <aKXajiHqhhkFeV4a@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKXajiHqhhkFeV4a@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_031742_693657_0332224B 
X-CRM114-Status: GOOD (  11.49  )
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

On Wed, Aug 20, 2025 at 05:24:14PM +0300, Dan Carpenter wrote:
> Hi Sudeep,
> 
> Could we revert commit 1fa3ed04ac55 ("arm64: dts: arm: Drop the
> clock-frequency property from timer nodes")?  We're still getting this
> warning on our Juno systems (with admittedly ancient firmware).
> 

It was dropped to avoid further copy-paste into newer platforms that
need to get these right in the firmware. I am afraid keep it would just
not help and any strong reasons for not moving to newer firmware. It should
be really ancient one with no security fixes I guess. I strong prefer to
move to slightly newer firmware version if not the latest.

-- 
Regards,
Sudeep

