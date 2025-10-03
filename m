Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6BACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjkSzcHQCRHxGjAdHJ76YWjL7H9j4QRw11Hc/S45qjM=; b=sdJcDPnpxi8BxHRCahB2S1ECyg
	a/GVlibfWTWjqTnBIuiS4X4ulh6lyLBDPGBvsDuMcTYECReUyjbQPOKV5HBVCSoIw8EQnXvfHvSj8
	7cFD6QFtwe9RCECYHnscCwT9lFWTEn+J53QQ5a15ayE4AxfkHAIODoUkSj3j03ASB38MkGGcTh36e
	R1KvogkgBK3tp0npB04A1ikHKJ1Bov4NE7ZroJCZJUMfGxl5V8YEQGe/kksPSYFeFsvbdJD+BFiJy
	/3Zs/LdaHZIvxdDLRw8dZ+V0iOHzcWtRHscpe1th4gRa/Q4perQguCh+I2tAS3mC3fq4zDn0ndZ8v
	Ta40h1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4cWO-0000000BzsM-2zgV;
	Fri, 03 Oct 2025 09:56:16 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4cWL-0000000BzrM-3blX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 09:56:15 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so1873182b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759485372; x=1760090172; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HjkSzcHQCRHxGjAdHJ76YWjL7H9j4QRw11Hc/S45qjM=;
        b=bY5fkK2jT6oUBnw681NaqZxjINsxZIQiGl5DHVXyEABFXSZhwR4aNX/EhxrSbDQTGm
         Quef08MzmLDvTweCnoGzEbObJiGnYFZSSg3GDSPGs0T1vYjV2XHH6U3G8LYEvUheuvWL
         Eg5MAljYVq5BG37k7opprOcRlKXOn/RRYy6P4ikXIRniAwMwRjGk/QFZ3h/Gjj3Lchar
         kC9gfN/x1xZvZ7SXXdX0WSZndOGSMGdjDx91IuQPdZXfDafvxiQWvCJRQODmzMl6QMar
         3GlKDk3Fp7HaUtP25hujws7W2UrHDqtQsVWjtoVUsi/3yN8fuaitIGZakwtQPHzU0n8K
         tARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759485372; x=1760090172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjkSzcHQCRHxGjAdHJ76YWjL7H9j4QRw11Hc/S45qjM=;
        b=WL7Qel94sX4hHiYMkRb+Odae96XjFfRcYAA2tvktWFEMN+o68KfyH8AnyOxaYrT1QC
         2a3G/DANDQ76bXc7x6oBdZlctQJElcSnz6buCF7aRaGvwL4Bs48WTyl5gR8PApGS4pIH
         cnZ353a99NJsPRTxAQleaMx1D1bTVEf3+e6bdq1g3hKjCHmSC+gOFVteFdz2D/DeRUXC
         mdf5TL1kpZD1RaqUVzqttvEUWyIECzALVSdrwiwZDVoKPwD/Etr3NnlPfYqKMn7cigAw
         idB2VtueNYb4NhZTbHaSc9V4eijcmrCg43gne2nLZTAVUpTU6rkLyh7McQk6QnI2DGQ9
         VnpA==
X-Forwarded-Encrypted: i=1; AJvYcCWfOPKjybClfnmP2Lj2+CyTZTqUdlr0rgAsGZ4zXobASkpxmHCeulLTrUA6SJrZ9tMCt0EtcCubgJu677wM6OYo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg6Gsu4QGCcBdh+TdKG7flpI12cMQoaLwpL7vo+/CsNFjfELmT
	B8ANpgOE/QHzpcDlaXDcXLfYbryhXoJBWgsDbhRPQgLPIylj9D8qSlTd
X-Gm-Gg: ASbGncvdhLZaDAM55y1g6VoCaSk9vn0bivOEJzkJNhcdHsVXchgvbwlVvJ5yzl1n4j1
	WRJ1XCpP7KqIj66ikIp4FQgSlLOpu6JT7LEPEopXzhU5vNoITArlA8cKAQRVsEkJ/P4TpthG2eo
	TWnjJXKiZwJcniwOhDouJqZXqM/CiYYFoyLZEZKiGnXMX7GWyx/a9CWnr8fgLLxLxd+GulpC2Ty
	XFyOLMGdq/Ip9lSpOGeAX26FQmfl446DD+GG4/f04QJJiIuoSGo2UilJKr6qkF8BGZp1jrh52gI
	znVEHZl/aSzlw9mjIKTKSfBQCLCIVUFQVy58jdwwo5PABuLMzXekUH917JmICw7tOOwNt//VP5D
	xigCm4Bjfo4Crn6SxrK9C5Fzz5jsrqlgf4g==
X-Google-Smtp-Source: AGHT+IFgG1sDmJWIInobrT6MYZozHk7ObDc757Ax6SKK+T4qAyB9z8lgZO3RUGk1fZnpjVO1SGBv+Q==
X-Received: by 2002:a05:6a20:6a1a:b0:250:429b:9e6d with SMTP id adf61e73a8af0-32b620db8bcmr3216562637.44.1759485372467;
        Fri, 03 Oct 2025 02:56:12 -0700 (PDT)
Received: from geday ([2804:7f2:800b:2c45::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb1a9fsm4407283b3a.20.2025.10.03.02.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 02:56:11 -0700 (PDT)
Date: Fri, 3 Oct 2025 06:56:04 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [RFC PATCH v3 2/3] PCI: rockchip-host: Retry link training on
 failure without PERST#
Message-ID: <aN-dtHxYTspw3rvQ@geday>
References: <cover.1749582046.git.geraldogabriel@gmail.com>
 <b7c09279b4a7dbdba92543db9b9af169776bd90c.1749582046.git.geraldogabriel@gmail.com>
 <ac48d142-7aec-4fdd-92a4-6f9bc10a7928@rock-chips.com>
 <aHnAcbXuFqcMXy_5@geday>
 <067e1833-8527-4c66-90f5-d284f7d2ca5c@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <067e1833-8527-4c66-90f5-d284f7d2ca5c@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_025613_915278_7B83C66C 
X-CRM114-Status: GOOD (  16.86  )
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

On Fri, Jul 18, 2025 at 11:46:33AM +0800, Shawn Lin wrote:
> 在 2025/07/18 星期五 11:33, Geraldo Nascimento 写道:
> > 
> > Also, since you're asking me to test some code, I think it is only fair
> > if I ask you to test my code, too. It shouldn't be too hard for you to
> > find a otherwise working NVMe SSD that refuses to complete link training
> > with current code. Connect this SSD please to a RK3399 board and let us
> > know if my proposed code change does anything to ameliorate the
> > long-standing issue of SSD that refuses to cooperate.
> 
> Sure, I don't have Samsung PM981a SSD now, but I could try to test all
> my SSDs to find if I could pick up one that won't work.
>

Hi Shawn,

Haven't heard back from you so I assume you tested with SSD that should
work but does not and that the test failed?

Thanks,
Geraldo Nascimento

