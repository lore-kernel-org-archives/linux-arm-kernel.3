Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137DEC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oj7aDLhck8d5+ayvvwLkGQOKkyv7fiwIxcrymm6gaWY=; b=eqW7GotNS2uy4xxN78kq1W26re
	fo1RccbYByDaNXfV76r4RXFsIDby4m/uQoRV22QixtqYUwNMPfKeTwO6AP+Ku2zJk6lLzLrLFqFQM
	yOalWC06/X3yfPm/BMkJJOW1BXIYLThOxJHwi96Fh9iOxWbbnd/mZnSNnNVzK8G8QjWVpwWKottVl
	zkfq5FKgl3vKEf92siUgDwJICqRBfMPbTUZ1BfXxh3ZOYgAnhztoSpQCcsQBvlfjVfBOhFeb+HavE
	JZPgI3XdIcK9WM547pi4AUwkl490UjINif4gbTmXSolWvpbFzfoJ1U6nYLFBHq0wdyZbJugB9fVlz
	IidbFUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbKA-0000000Fd2E-2YRJ;
	Fri, 20 Jun 2025 12:58:30 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSb5j-0000000Fafw-3dgR;
	Fri, 20 Jun 2025 12:43:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-234c5b57557so17402095ad.3;
        Fri, 20 Jun 2025 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750423415; x=1751028215; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oj7aDLhck8d5+ayvvwLkGQOKkyv7fiwIxcrymm6gaWY=;
        b=cLmugfXdWtJXmqTUfVZ5OTfIwbq5GR7tJe9PqZVxGpu/pipNRhpqbQPuPtbfT+fMTK
         HKKlQ9kM1fq3MtWMD49gj/EiqDTlQk353/NqhdSEPXkv3xB/r1AJ6Vzf2yUt6cDadcg0
         5kYMRij0K/4n3bh/Xvvki3uEEAYbaLHMP3UySE3ZPdiemZwDTYvRBraSLay8/dLTKwLa
         ixmhkibf4Deogjf/x8MZGu30HVQrJmuwantaXH4no0AWPlQ+QaE9IsCbb+XVBMSyaUjI
         9x9g4cdwGrhH4i3XJL9dsTV369Sj0Pb4dEgyvSB1I6bdyUqpoNB2hYi/QO9AWkCX8KIL
         207A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750423415; x=1751028215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oj7aDLhck8d5+ayvvwLkGQOKkyv7fiwIxcrymm6gaWY=;
        b=JajXWqXrHiK+NcmeykLaWP7mbTeqiRKncpbiD98aBSj7iHqp6/TN1oC6UAcu6DIYGy
         N7k1z16xZmb6tSJVdk5gLpeTNNfGlXNi8pWuWQWvvwc171646sw2+Hgi3AlqZYN8fJ8y
         UtmHtFdbQs0VGN+KVXPhQmKAdEHPcGqoVtM+U1G4qwXjv2eORAyz5mpobwC8hxuygseq
         D1yRAsstw92WU3nsIa4dYSvJgv/L774JAc37LJG/Y1u0tRXriycHczfgcyT0D09zvUcJ
         xMruv/ws6sxMGkPV+efd/iuN8P3JubriyOBZ1vSIznN8eIjuOgw1Vq8Reew0ezqmG7wy
         Ugzg==
X-Forwarded-Encrypted: i=1; AJvYcCVL3hmJZtmhCD1NkonYwxv1x4kxHb9qyRGnWjDfLr4EVQl/dqRX9iwmrEG5iHxOeEX2ug5UHsjWHBeuofwxtdC0@lists.infradead.org, AJvYcCVbvNtoTZAdJWauWYFQrsD1wf8EOL0F5uuBpsT8LT7VETUqUWdrZv2rpn/m/SjwNIgOMjeRBGTUGOj6@lists.infradead.org
X-Gm-Message-State: AOJu0YySeVf19lkKx3Voyymx5wqqp4nMmHolC30Yloz1Gdb6e+f9Z+QW
	Kf+mGCqTdX/kF3VAHQf43zc+IpGnncIU4eyT6W02dhcCJBbPE0A8IGiA
X-Gm-Gg: ASbGnct4pJSnGL2rjCG8LusdQQk3VJpHQSzVTWKhhuASxIsbhh7t2uqLShhav2v3JTr
	jrA5EVJQ/SXhFct9IpL18fCDTj/pBE89NvPSZSLZHaIdrVfdN1nXhfSi+MGKOC5UOdzcleEb9kd
	gjt+Jito++iKAa5KK6oyZsfY8xXVd92y3LyS4dkNF2RXaTLAoWvDDxkWrrRO93NbGGsJ1C70MaP
	wNn7gyGnen/CDAu55jH+88QbsQcsXdPvtoChTUdfWIN92pS16R9l1yvpzAZMDfHP+wyEFX3C5Za
	UIE3OHazJRMLklJpji9Q24SKsaJ+OQm3cl3Er2aAvqaFUF6YzQ==
X-Google-Smtp-Source: AGHT+IEuD3H+HAfeXs9W/BR6wxzL9h2mEYrXblCAc4qefsZX7SSfF2y9fHbF07Keq6sv02/yWTML7w==
X-Received: by 2002:a17:903:3201:b0:229:1619:ab58 with SMTP id d9443c01a7336-237d99f4420mr46670075ad.43.1750423415114;
        Fri, 20 Jun 2025 05:43:35 -0700 (PDT)
Received: from geday ([2804:7f2:800b:cab9::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8674544sm17204025ad.167.2025.06.20.05.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:43:34 -0700 (PDT)
Date: Fri, 20 Jun 2025 09:43:28 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5 2/4] PCI: rockchip: Set Target Link Speed before
 retraining
Message-ID: <aFVXcIGHC9aeSuAF@geday>
References: <cover.1749833986.git.geraldogabriel@gmail.com>
 <1966f8ddc4a81426b4f1f48c22bea9b4a6e6297c.1749833987.git.geraldogabriel@gmail.com>
 <562662d4-69ca-4d0e-ad0d-fd8cece417e0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <562662d4-69ca-4d0e-ad0d-fd8cece417e0@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_054335_903206_BFCAF4B4 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 20, 2025 at 01:33:11PM +0100, Robin Murphy wrote:
> On 2025-06-13 6:03 pm, Geraldo Nascimento wrote:
> > Current code may fail Gen2 retraining if Target Link Speed
> > is set to 2.5 GT/s in Link Control and Status Register 2.
> > Set it to 5.0 GT/s accordingly.
> 
> I have max-link-speed overridden to 2 in my local DTB, and indeed this 
> seems to make my NVMe report a 5.0 GT/s link where previously it was 
> still downgrading to 2.5, so:
> 
> Tested-by: Robin Murphy <robin.murphy@arm.com>
>

Hi Robin,

thanks for the testing, I'll include the tag in v6 once Bjorn gets back
to me on the 16-bit adjacent registers problem.

Geraldo Nascimento

