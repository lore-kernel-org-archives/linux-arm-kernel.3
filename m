Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF89C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 12:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9C90v3ImIZv7UydPyW7LEI+N3US6KQ8k6AgX1ptSNqo=; b=SC9wdq24sp9+bgSxA9MEC50pge
	qk1DQpfIs6njsU7p4NlMb7Rubt6pxl3+5jP3KyWTTBaSDnLgT3IaGecaMRzuU+TPCNTT5rPRLtzkK
	PVM6WvpWp+cpe7WkOqjHIWCftG28/xV0FMlaGCFHwLS2kdqNdPjVrH8Ep1wMunuExrlYg3sAGSQEE
	4u8qYR3ODPao3nSn7Tzn9bDEMmkMBNlhOVbgk0+KQMNgE0yyeW8VmO+gdcqTI+2WDVGnzhqAr8GnE
	GiwInGiCHb9SYhnLIkX2f7+MIez+QG9DwEXSCwZ2A06wYQ0hW5Y77QSROSM/eTjL2qobb8VIK97Py
	c83DriXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOc0I-00000004ArM-02JW;
	Mon, 09 Jun 2025 12:53:30 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOby4-00000004Aes-1UtN;
	Mon, 09 Jun 2025 12:51:13 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3138e64b3fcso515162a91.2;
        Mon, 09 Jun 2025 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749473471; x=1750078271; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9C90v3ImIZv7UydPyW7LEI+N3US6KQ8k6AgX1ptSNqo=;
        b=aSVLmqzW6q3kc9R0+f/aOeMMiwPqsF1YdIGwmlFPUc7EFLSfxPBJVsaxQWhUmxapzy
         sTREr7rdAzMmqIqfoIRTLXVb+P7meesaN+nUC2TnwiqOn2aUwQo45geExeeDQY0oxlc2
         SsTgjWZwRAVObbv12jvZvMVRgyJRiCdO/o949ffRdd5QWWwg4zmeLYurl4ARAfDDJigd
         hl4lw8e0gXB6xHDQE8ySPtQWSBaqIq+H4fypen1q7JS6/U4Fc8F3BRvJhrOfgG18AJkL
         8QszGCKpXT+nXntZytwWUec1y4Ff8DjHgWR5+jb9NKHNXCYPffBhVydGDZ9Yfd2xakUm
         BEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749473471; x=1750078271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9C90v3ImIZv7UydPyW7LEI+N3US6KQ8k6AgX1ptSNqo=;
        b=aoac4+vwdKrvNYXOpETyUN68AmOdErsQFkXKa8vbBfptniCRoLB87kZCfHxx83QXOI
         JupvqeCZgHS3OaTvHMTs1iKdxWHGaqA/DQHUm1rI8f3tz/+kRdGLOukTttC3hunrcPky
         R5xXJCpSXfbsZOAHtIqfdE6NpwCsoAH0JbQ8BWjM4pzHHWjhB6Pq3bMz34yVCmgglrIU
         KE4WwTIeHG2nmfQ0G9Jml/VoNPdlkghG/ySTrHCMOt7HLdMZjewksilkTq/PbZbJQXPd
         pULs61gajWKTM0pQVka5MObcil8ezlr+xWfWU1o/Xm8xOCEplg4NsWUIBHgqxLlIytE+
         pakA==
X-Forwarded-Encrypted: i=1; AJvYcCVYMdGFMWXNp6qKbC5Klg0tiyRljQSYDbiCVcRY3OgW9NZ63gcPtsNlFi7TkhRJveElo0mXLiCwc/ZN@lists.infradead.org, AJvYcCXOvxktbxkyd+7sZJ6iCXb2sfUiHgm4GwmhltxhMXxa6TwwvLNjKx8IXOjGtHKgvYjE9aNG3/iYivF75QXUzK1c@lists.infradead.org
X-Gm-Message-State: AOJu0Yw28YQW1FP63Bf7bYR6GufICzui9p14+rTsObBcrsYqRR+XCz5X
	NXEPpNg9cWWUSjusY4f0uiFS94c2Psie9WeSJbjlORcWFE+icXr6UBaV
X-Gm-Gg: ASbGnctTR+emlvYanroFEG/dgP9MJKkX7tQf0UY/pp6TSA89caHS5mS0RQOt4iIhprP
	2rbhSMPfxzuBGU7hNpuh5Vt+t2dzjsO8i3jrHCkH0DJZMLKMfL/jxQSYZeLHGhvt9xmYJV147ny
	i/gJ7R3uheG5xg0uVN5NdQz6WFJMBNTFFv7Budl7j4EtAmVohzzcZH9CS+Yb8b7eWkUxolUqbdU
	yuI7Bz/biOjdzFY0P1nOAK0G5gRa8AQHo5dMxqVJRwUutxHIahv/guiIOt4nMQ42ahUNdmbsxoH
	ErzrYsIOMHnhmzSkyQCa4dO6/H3qFSx0MWMks43Fk/V6mwyJ+yHBE8U4IPVf
X-Google-Smtp-Source: AGHT+IGdd8dmqbyUaRhK5fCGOxSgFpjbYr8iwfVIm0WyVUzmcQ1qKNpUKaJ/KyU1XDsl+cxD311bOQ==
X-Received: by 2002:a17:90b:224c:b0:311:ef19:824d with SMTP id 98e67ed59e1d1-313472c0115mr19004864a91.2.1749473471147;
        Mon, 09 Jun 2025 05:51:11 -0700 (PDT)
Received: from geday ([2804:7f2:800b:40ac::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fdf554sm5708242a91.35.2025.06.09.05.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 05:51:10 -0700 (PDT)
Date: Mon, 9 Jun 2025 09:51:04 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] Quality Improvements for Rockchip-IP PCIe
Message-ID: <aEbYuMSE5hsClaB0@geday>
References: <aEQbx0Qu-2UKhV1y@geday>
 <2266650.atdPhlSkOF@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2266650.atdPhlSkOF@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_055112_407528_6BF222E5 
X-CRM114-Status: GOOD (  14.28  )
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

On Mon, Jun 09, 2025 at 10:50:45AM +0200, Heiko Stuebner wrote:
> Hi Geraldo,
> 
> could you check your settings for sending patches please?
> 
> The individual patches of this series did not get "in-reply-to" headers
> that would point to this cover-letter. Instead each mail of this
> series stands on its own, preventing mail clients from creating a
> threaded display of the series.
> 
> git-send-email normally does create these needed headers on its own,
> so could you check if you have some option enabled that prevents this?
> 
> Thanks a lot
> Heiko
>

Hi Heiko,

I had noticed the same, I'll fix this for next submissions, and
thanks for calling me out on this!

Regards,
Geraldo Nascimento

