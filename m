Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C746C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHNIwvgIvrag8fe3InRwZWIlH8aKQGYsVQYfK37rrJA=; b=p4Q88HrDxs4oSioirjJ6HQ8IOL
	VvWe6BRKu1KOpR1IXRvr9YAZb0nzyvbk5v64CDBvGqU+J+05mwBG+ZnNpRkpNOuagI5c2LS9hOS8a
	HNd0d3PUY9Qd38Uj4AsI2AK3nF0TQI3pC2d4+ZgpdI2MsRGalXLoIRpFw+JKXKuC2K9zRyZqcuFJn
	0dETRCSmhX5mD38jxpS37p2T7feZZ+jflLPtdN8OQBvegdc+YSId5cJW4HaeqaDYNFVgBOIWSIvA2
	UYfvcRfuF/lIVhh4nZ6PHqr7BWa1X2GWT9vZ5ip5lDdBxmLV31s4UaPPbsJUE4YOgHLQeRkP1fjfq
	pzCArs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevhL-00000002G88-0NOt;
	Wed, 01 Jul 2026 14:13:55 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevhH-00000002G7E-0n7J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 14:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1782915231; x=1814451231;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CEVGvu6TCDiaCcSvmrd98Os19avfl2PEiaB4Dw/9jcE=;
  b=erosjDHtRbH6qpmRHkQZEh+yrzY9LoO398H3Z8RJn2ZcskWb7qszU6y3
   WyrkyDwVJwOcUbU2psl9njiv0oL1hnR7LMVYsjoY4if+MgKWtMc/iKxGs
   UPhYGm2Lk/xvCy6YA24lR/MpVWCUUmmC0Y6g0xVoCZFkMoiVHcw0kW+3t
   d9v3GiWTy51LU5A5VQfx3HBjSiPoPuqXPvrLG5+zN0Ced+CvR5z8zoxdO
   a3vDtTsTJ7XKGWRPtaCClDotJdUdb2S0B4mvFMxWTfINnCElehiVz1y8D
   c+NMXr9BmuV7cXHnYvHaXRPD2RE50Py+d3bxWUG2UzZVfREiWE6IN84+2
   w==;
X-CSE-ConnectionGUID: a6ygRUh4Tc2xpB9DXALZAg==
X-CSE-MsgGUID: PvKqB6oPRfCF7OCS61n8lA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 17:13:46 +0300
X-CSE-ConnectionGUID: ErA3OLcJQ1yRxQuQaa7WWQ==
X-CSE-MsgGUID: Zaseidf5QfKEyJp5AqiCaA==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 01 Jul 2026 17:19:05 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Wed, 01 Jul 2026 17:13:45 +0300
Date: Wed, 1 Jul 2026 16:46:48 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] i2c: nomadik: optimize layout of struct nmk_i2c_dev
Message-Id: <20260701164648.93eca0250e8a4932611a2ce5@mobileye.com>
In-Reply-To: <CAD++jLmqtG-j=Q-Ctr-1-GKVqYzcwOwWUF6AYHcKf5aXUSKE5A@mail.gmail.com>
References: <20260623-i2c-fault-reporting-v1-0-6db1a8aabf18@mobileye.com>
	<20260623-i2c-fault-reporting-v1-2-6db1a8aabf18@mobileye.com>
	<CAD++jLmqtG-j=Q-Ctr-1-GKVqYzcwOwWUF6AYHcKf5aXUSKE5A@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_071351_761576_2E7E6801 
X-CRM114-Status: GOOD (  17.63  )
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

On Thu, 25 Jun 2026 00:36:49 +0200
Linus Walleij <linusw@kernel.org> wrote:

> Hi Dmitry,
>
> thanks for your patch!
>
> Also nice to see some kernel contributions directly from
> MobilEye!

Thanks for you review!

> >  struct nmk_i2c_dev {
> >         struct i2c_vendor_data          *vendor;
> > @@ -206,13 +206,13 @@ struct nmk_i2c_dev {
> >         u32                             clk_freq;
> >         unsigned char                   tft;
> >         unsigned char                   rft;
>
> ^
> Maybe you want to take the opportunity to change these
> two into u8 if you're anyway changing the layout of this
> struct?

I'm waiting for review of patch 1 in the set. If I need to submit next
version of the patchset, I'll change these two unsigned chars, as well
as `unsigned char *buffer` in `struct i2c_nmk_client`, into u8.

Best Regards,
--
Dmitry Guzman <Dmitry.Guzman@mobileye.com>


