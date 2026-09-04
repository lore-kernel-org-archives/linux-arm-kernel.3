Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA76C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UcylRtrevP9cDrLWI1rtQ6s7S95sqQxzFm0CRM3Gqs=; b=3s3DY+7MpDkx8t6jKtoCPHUeGs
	t67OTbh4AuH3QvgqA8jTwQ+GCt0j13g8VbLUNiZuouBuy3uY1laHpHh80QrN9WHUVJ2TnEpkuIVvC
	x/aFmEz7b79KiUaZkVjvqgzYaBffONUb0sGpiibG9mTl1nOicBGdTYrue7d+ek/pbrPsv9vRv5SzN
	NuJa17ejpRDKcY9o9CDKlWIuIMntB6FDOeqKG++iVBjnPPXcrr1OYSMc6f0e8TeYvRSpw1fFg5l71
	bUg0RSoZbc4Y2EKExfcg49qx72ezq7Agpg36wo7mV6WOCRviWxE3wS4fPxhhof/v1qOwh5t9dfhlQ
	cX5PGpwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U8o-00000002FXD-1c2s;
	Fri, 04 Sep 2026 13:39:38 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U8k-00000002FWP-3Q2I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1788529174; x=1820065174;
  h=from:date:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zesXpEseowuhkScQQajGo9Gm6M5KbuH5TUA2nQ5LhGE=;
  b=Nn2RRmdAR71JppRMn7Cu+8oKSpqZUKEMYHatwIRijUcECTavwQ7rILux
   /Ng6T7YeaEHhczLZ5HAsIX2++sQ/yg/FeRNrbAxqOdwzKe3fR7RsJGy5B
   qr5SeYct5Vs9YMQF9r2ZQ8lYA0k+OontOgI5S0j3hRbQmCHwXyKjV1Qsh
   cuJ7c8frHDUsiO26bKOpyYtUUx5UJPChoydwmOJDhVHhulJB9SsDqBjkh
   mIXs5MG7mV1QWof4e5McUJwp2jYKiYA01FpD9Sjxcvmq1jbDtbDkXrRI9
   1zX2IJUawm0LpH09A8NFu9BSGJcU/eFx5gFG7eS3qX82rzcdODGzQKEhr
   Q==;
X-CSE-ConnectionGUID: vEFSCZuJRtKaOVLiZJKKlQ==
X-CSE-MsgGUID: ejyRlUoQRFmK+ZOWi+fLPQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 16:39:32 +0300
X-CSE-ConnectionGUID: ZM77DTLQR0+7lN7bawTt/g==
X-CSE-MsgGUID: rIrAksyhTzmCLYfnSyIKtg==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 04 Sep 2026 16:46:09 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Fri, 04 Sep 2026 16:39:30 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Fri, 4 Sep 2026 13:53:55 +0300
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Linus Walleij
 <linusw@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
Subject: Re: [PATCH v2 01/12] i2c: core: add I2C_XFER_V2 - support for
 detailed transfer reporting
Message-Id: <20260904135355.427fcb01d57c172552748943@mobileye.com>
In-Reply-To: <apkgBIgF09HAcbot@ashevche-desk.local>
References: <20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com>
	<20260903-i2c-fault-reporting-v2-1-fedeb91792e6@mobileye.com>
	<apkgBIgF09HAcbot@ashevche-desk.local>
Organization: MobilEye
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_063935_299397_C75D44C3 
X-CRM114-Status: GOOD (  36.80  )
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

Hi,
On Thu, 3 Sep 2026 10:21:40 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> > I2C bus controller driver may implement either both callbacks or any one
> > of them. The implementation of both callbacks may make sense if the
> > precise detection of the fault position requires different handling with
> > the hardware that causes to extra CPU load or other consequences that
> > may be unwanted if the precise fault report is not required. If the
> > precise fault detection is free, the driver may implement only `xfer_v2`
> > callback - the infrastructure will provide pointer to a dummy fault
> > report that will be dropped if the client uses old API.
> 
> What tool do you use?

vim, git and b4

> The problem with the submission is that:
> - it has no cover letter

The cover letter is here: 
https://lore.kernel.org/linux-i2c/20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com/

It also contains link to the patch for i2c-tools that adds support for the
new API.

> - it has been send with In-Reply-To set to the previous version of the set.

https://lore.kernel.org/linux-i2c/20260903-i2c-fault-reporting-v2-1-fedeb91792e6@mobileye.com/raw
In-Reply-To: <20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com>

What's wrong with this?

> 
> 
> > -int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> > +int __i2c_transfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num,
> > +		   struct i2c_transfer_report *report)
> >  {
> > +	struct i2c_transfer_report dummy_report;
> >  	unsigned long orig_jiffies;
> >  	int ret, try;
> >  
> > -	if (!adap->algo->master_xfer) {
> > +	if (report) {
> > +		report->msgs_cplt = -EOPNOTSUPP;
> > +		report->bytes_cplt = -EOPNOTSUPP;
> > +		report->fault_msg_idx = -EOPNOTSUPP;
> 
> Why all three?! Why even a single one as long as we return an error code?
> 

There are two distinct cases when we return -EOPNOTSUPP:

1) The I2C driver reports that it cannot transfer a specific message.
For example, there are controllers that have message length limit less than
8K, or cannot do zero-length reads or writes, or cannot change target
address without generating STOP.
In this case, `msgs_cplt` and `bytes_cplt` are the number of messages and
bytes transferred successfully (both should be zero if the driver validates
the whole batch before starting transfer), and `fault_msg_idx` points to
the message that cannot be sent.

2) The driver does not support detailed fault reporting (does not implement
`i2c_xfer_v2` callback). In this case, all fields of the transfer report
structure have -EOPNOTSUPP value.

Also, in theory, I can imagine a controller that supports only message-wise
report and not byte-wise. This can be indicated by -EOPNOTSUPP value in
`bytes_cplt` field.

Thanks for the question. I think I should add a comment explaining this.

> 
> > +		report = &dummy_report;
> 
> 
> > +	if (adap->quirks) {
> > +		struct i2c_msg *bad_msg = i2c_check_for_quirks(adap, msgs, num);
> > +
> > +		if (bad_msg) {
> 
> This style is bad for maintenance. Whenever you need to validate something,
> never assign it in the definition.
> 

OK, I'll fix the coding style (here and in other patches also).

> 
> ...
> 
> Make sure you do a series of a small logically finished pieces. For example,
> introducing a v2 of a hook with a new prototype. This can be done in a separate
> patch. Adding report is another, and so on...
> 

OK, I'll split it into a series of small patches. Thanks for the review.

-- 
Best regards,
Dmitry Guzman <Dmitry.Guzman@mobileye.com>


