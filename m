Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF14C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 18:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtFOqkBVbdu6zNF6h4YnkKJZaUS0WkW/Wxv1qDA9ygA=; b=JXWL1EHPrRHi9ONijcDGVGjx/1
	Q0SbfbbJAa6abc/Usxc67qVNkupiNOkRGvSk+dixzwmtWvTQikV87AX0ZL9W+uZz6PlB4EeVmVL7I
	C5ja9xGpew5dRoqjpqUiREgqwi4Q8yiGVQK4Fds7/JcRJjIgjOLv/6kBaJHdKZH49W3rVKm/CD4e3
	TggC7/s36SOQ6fpIzxhrRucUpMYqqMEoPM6VTDa/x8Vfca29m3vxKEr4WZ+jMGMPPKfqeVRHDpzHN
	v3WTT7QHLtR202S8Q2LJgZfDkSyV35LKu4vlGm59cMJ+BiNlv+y2MUe0EFqwxa472xZX9f92ZBrvb
	9pchw/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY83q-0000000CkL3-2Q6T;
	Wed, 15 Jan 2025 18:24:14 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY82Y-0000000CkCp-3vTg;
	Wed, 15 Jan 2025 18:22:56 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d9f0a6adb4so73704a12.1;
        Wed, 15 Jan 2025 10:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736965373; x=1737570173; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wtFOqkBVbdu6zNF6h4YnkKJZaUS0WkW/Wxv1qDA9ygA=;
        b=XfscInjG6aJi6kRCxBScIB59J/bhubg9vI87EILc+Svj3omXS6mwytLVNZZB0ADHxM
         IdPrK5FxkOlJd9xLjsSOmr3Oo28xmHqzFUQXDp8pwjglcBQk/O/73ffHbsqlDjNaKhC7
         PiFS1Q8ZP4ng/fNJj42apcrKA80N0sbJzJn6zEBGRfUxtTC8/QcJp0R8hQGF+Q5U+sgB
         yTi0r9qtdD2TgjgH3ZtP11jnw5yBt/DxJ0Ui44AWKs55r3yuH55c6jMuuOFPLGrCejdu
         cPQwV6WfSpZGzY4aUPihcjgP8Q/Z5nhRPHF9x3suQ144NmObGJqfrctMzR6hrLd0hpmR
         Lwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965373; x=1737570173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtFOqkBVbdu6zNF6h4YnkKJZaUS0WkW/Wxv1qDA9ygA=;
        b=tEK03zf8MCeroMWf7+Ni/Qg3HTeCJ19Zd3ih9VFgAvrUzqA2IYyLFCzY4J2+0DUrvG
         TlzoNtbrRIFpwGX2Xmky4FZposmIQ9dVLQ5somuPfUaW5F9yHwWlrvIhudZHz0fySqmQ
         /P3bYFiAo9pW/M7TQLUedH2OPWqSdEaQj/GoubVqWggfTWF+cDdfTlH1YBflM9rQsnOf
         fLyByIJlNglyay+HZZA0lgV8XvA6Ft76SoAYp8AHbySPnO88CZwdMXGJT9ceaiyXNEnZ
         mTq9XVKZV29/jR6iTMH/2FivbNULq0tpRlAQji0WHFAwDJ9NvWskMNEYjij74FaYGZcQ
         YJ3g==
X-Forwarded-Encrypted: i=1; AJvYcCVHM6x4PQpCJChOzTx5+WyUXbXEeEqfucBHhe2CYj78V423x0mLLRPNXAhJP7uzNFnmxNC9IXYdn2sFOsp6ld1+@lists.infradead.org, AJvYcCWBPWErdvZWk9ywa0omGWUoZV0hQiMcgxauDGLxdaCyXLB92cDlD6u8cNKYRxyGXlUF9P/01fwEtLy9yF3hvyM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfBAm2AZDqVPpcRnLjzk7wFxhhFmoYgqwlrwxCvwQWxEBbm+aR
	7Y5aPbO7CV8y973oen/KQXsl+vxxqV16tQqZF1+dOuooIie1zSDWmbCfqG0AbFX5g/FuucRzLKH
	YvKfXWqzyPQZhtG2U4PMQr+veLHI=
X-Gm-Gg: ASbGncu6uZyLzye4u9usD7vfIq0u5ypL8wFKTY+7VxjfkDLCDmKYWr3zSJ9Y9oJehHx
	zVZBfkXpbF2MSLJRL7K0duXiTz6FjCW+R58xucw==
X-Google-Smtp-Source: AGHT+IH4ZBPCX1+Zs+u6aD4i/Mk+EEOp4Zxu5uuiRB2111BunzMgKFahuNg0HGJ0e/tCZoud1qbk+dK1yM9Wb1ed+A8=
X-Received: by 2002:a05:6402:4023:b0:5d3:ba97:527e with SMTP id
 4fb4d7f45d1cf-5d972e47717mr27159444a12.25.1736965370851; Wed, 15 Jan 2025
 10:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20250115174012.bdny6nxxr4tuzyis@thinkpad> <20250115174834.GA538101@bhelgaas>
In-Reply-To: <20250115174834.GA538101@bhelgaas>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 15 Jan 2025 23:52:33 +0530
X-Gm-Features: AbW1kvZ50fXNCVlx0U9GjzuVih3n2_IhFXemWMJd-_PuYqVJD6pFzYzcMcNZWiA
Message-ID: <CANAwSgQ2-r5gHmNwf9YTWXEU-mQ6dVpjFV4gzM+sVGsTUit7ew@mail.gmail.com>
Subject: Re: [PATCH linux-next v1] PCI: rockchip: Improve error handling in
 clock return value
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-pci@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_102254_972880_FCBFDE02 
X-CRM114-Status: GOOD (  14.56  )
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

Hi Mani/ Bjon,

On Wed, 15 Jan 2025 at 23:18, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Jan 15, 2025 at 11:10:12PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jan 06, 2025 at 09:00:38PM +0530, Anand Moon wrote:
> >
> > Subject should include the word 'fix' not 'improve'
> >
> > > Updates the error message to include the actual return value of
> >
> > s/Updates/Update (imperative form)
> >
> > > devm_clk_bulk_get_all, which provides more context for debugging
> > > and troubleshooting the root cause of clock retrieval failures.
> >
> > Btw, it is not just updating the error message, it also returns the
> > actual error code.
correct.
>
> Already squashed into
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?id=abdd4c8ea7d7,
> sorry I didn't mention that here.
>
Thanks,

I will focus on improving my communication skills and delivering impactful
commit messages in the future.

Thank
-Anand

