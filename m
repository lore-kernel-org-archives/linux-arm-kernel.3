Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B10606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yfk7PMeI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbYsXDg2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1qij314zoZxRirYc0U3jWu9+iby5U2jYKMg8ZnSCq6Y=; b=Yfk7PMeICsCVQK
	D1sDpCCvUBTWeGhGW6xba9VaO/vopTLRiNDlJum7Cqc8WxRCNimy5AK0vCOIJhm7/QsatY51vYTqE
	CsZutbP7a8JnfSA5S9k4whPAQ30hhe/L3pn8Ck5KG/LogdOXemIHo59RgXzN9/xZ3hldGYvEyn4Nc
	v7YN2XDA12YI9up6tQTp2JcQ5f3yVLCeWrUF8DCxTETVeawEu98PwA4kXyHfVSjoNFTZml2zSze+o
	y53CgA2iSaZz5hBz4CR9OhzgvUAQfycKjW/U+/OHpOkOfAmr12VMWPidEG2a8x4AJVu7xxXZyhwL4
	ds6SvHWH3EToeNXeE1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJx3-0000000CQV4-04Qx;
	Fri, 06 Nov 2026 13:25:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJx1-0000000CQUt-3iWQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 13:25:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30A6360A81
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 13:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB82A1F008A6
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 13:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971550;
	bh=1qij314zoZxRirYc0U3jWu9+iby5U2jYKMg8ZnSCq6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bbYsXDg2sCi/PgjU32XsYMu6y/C1IXR8pPnZJD0AOvY3JnlXhqAa3CGaUuPksEZnG
	 ambzwSgaiI4bJMmoG+bqfq839Ose/D2cUE+cQIiDNLJ2GmI3LNK4QFPcrnFnZk5y10
	 P06RsR4d7j/ueIbgcKCsRRKG1PW3aQMdIk4LB93B9aEis9l//dVUwozE5xDn2jDq+E
	 RVcdF/L8j3oGxd/W7EA9+V+rSyEFy4TSyso06k8TT0hi8DnL496qwyM8cqJ1nuJGcr
	 cLFqKO9MLHtGzhHAXafqQBZPEU3MpukJ8WnPv0bjB/kDt2lty30KEcZxHIfl8OAIYb
	 wODFNqnG9148Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso553638e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 05:25:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwkxhUWxxPCoB6g//zpcg18dQeusKI2sVfwg0sh+/bRw3taswEr0FG55/BiZZsM/JjTnwRfF2F9h8DwoVWph2v/@lists.infradead.org
X-Gm-Message-State: APuU4Z/XgvvClx3jMSDfXcWwuVx9vhZX50+hqz7lw47V/fDZDwvm511i
	6mOoJXzoDL7DHc5dJd6swrJPWTw5ZAGF5NDP6OPdozo3NdijhfNBCCOsAJTQsK6hldm2JmqeOQZ
	PPKYCLe2Vc8PCWYrzCu3S+JMI5sgNZA4=
X-Received: by 2002:a05:6512:3c8e:b0:5be:3c86:f24a with SMTP id
 2adb3069b0e04-5c003b066c4mr930672e87.53.1793971549628; Fri, 06 Nov 2026
 05:25:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-i2c-fault-reporting-v3-0-515ad74ac4c9@mobileye.com> <20261105-i2c-fault-reporting-v3-11-515ad74ac4c9@mobileye.com>
In-Reply-To: <20261105-i2c-fault-reporting-v3-11-515ad74ac4c9@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:25:36 +0100
X-Gmail-Original-Message-ID: <CAD++jL=R9qr-PP7HnP5SvZrqwcNruH95h=jGp1oZQygU_AyUbA@mail.gmail.com>
X-Gm-Features: AclHuK_jwcl2jYgOKr2HFBdWlzfrDzM0qykcv5w6x1x1j7s493OVvppJLUOpzHk
Message-ID: <CAD++jL=R9qr-PP7HnP5SvZrqwcNruH95h=jGp1oZQygU_AyUbA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 11/14] i2c: nomadik: save I2C_CR register before
 resetting HW in IRQ handler
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 6:16=E2=80=AFPM Dmitry Guzman <Dmitry.Guzman@mobiley=
e.com> wrote:

> On some interrupts, such as Bus Error interrupt or Arbitration Lost
> interrupt, the interrupt handler calls init_hw() to reset the I2C
> controller. This clears I2C_SR register value that might be used for
> fault reporting.
>
> Add i2c_sr field to nmk_i2c_dev structure, store there I2C_SR register
> value before resetting the hardware, and use this value instead of
> reading it directly in nmk_i2c_xfer_one() if it was read in IRQ handler.
>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

