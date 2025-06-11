Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EF9C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 05:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pj6z2aRKvHtITq4Z+f1qO93pmK8lNGG0j4aMXrIWEqE=; b=IqrdNxy44kEkd2tUXF8gt1ffzM
	tKSmPtqNbBu0WVypCQ5F3elBEQVB7lbQxzU/aP5SRGmmOfur4ogHWy6x9YIXZScchXfyuswKTNMIs
	dC3fIINkBmFUQqD/IVnAD/6XvgycePtQSmGlDossOPrOXmmJ8i0qRpivPOcX2dH6vSgGx9L45mW19
	phx4rueVtWilneoMF2cusAtmyZZ9etSAri2UcPCooWp493Tefvs0zFqhu9p1fw0Y6raz6ZVcD5fKa
	j8a6ll2x52ld0omeT8/+LwP+2AcGJF4TIdbaqcFe6bu3R5w9wU6ugcn8o+wtrPR5HeeTnBO3nQa6t
	cBTZuVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPDhu-00000008rUm-4Atn;
	Wed, 11 Jun 2025 05:09:02 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCd3-00000008nPn-2YsF;
	Wed, 11 Jun 2025 03:59:58 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-530807a856fso328987e0c.0;
        Tue, 10 Jun 2025 20:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749614396; x=1750219196; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pj6z2aRKvHtITq4Z+f1qO93pmK8lNGG0j4aMXrIWEqE=;
        b=arBy126fHuz3Eg90qPIbP9RWOKzi4q3N/We9RR2SMYk16P6RThNVCaTPBDbnpApAWM
         Me4Xjn6n1jo/CEiyTqD2r43wSJMg7f3JB+v1kP+jicoCG8+f2mrYp9wqM53+UbDPP7Vr
         eSFYt+ET+j7B3/J0dufAjTAiVUQDd/kIqCYTqrg6j7Bu34717T+aWX1L+hkq72I6P9iz
         4hOIhqgdsu5+XeyqmiSDPARErUPIWX5eBrSAj3Avd2OBDCqiO9j6Q2C/jTjCTOQQUsKP
         jQ/xQNeOYPZSCJ1mKbt2CNmM50qSMOQJNamejd5DIZGhLcpDwptao728hkfETOFT+bF5
         iIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749614396; x=1750219196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pj6z2aRKvHtITq4Z+f1qO93pmK8lNGG0j4aMXrIWEqE=;
        b=v25KlbdQFeqTEpIm12U9eauaXgaotXN28UuPxRPVQYYsJkf9YgYGPdN3wcIfejhnwn
         cscvqzCArVn5DAQ4tovMlYFWP8qezwP4ORHM32MP9CC1kpyoGE85t0D4WmFGTalY7ov2
         PR3vqtgbVgAJS5T9nK7Z2peP7tlNetKEudoHofijWqGFLTmHKFCQtqV/psXMreSMJPNn
         R1YK51SCafB/f3Yezi9gn7nhF1oWmTcLv7djKPHjN10tIyVK+86xoROprahOtcUswBB5
         ugKb9twSbEch1xRpEtCIt8hA2rR2Y1omI0eoaHBDKiuXxOAqKqHXBLCO2dHa97hHfrt0
         5CzA==
X-Forwarded-Encrypted: i=1; AJvYcCX7dud8AuBosG5fA2MF6bx/f+pEKchkVyfjTT9Hh0A7fw5V45Kqd9EglwoA7eqnBMMt+YNjHJqoEoEe@lists.infradead.org, AJvYcCXevVBd51R01V8iDSbKYUnX1rgPuc8hgPzeFZlUEmwrLG5RaSoQCPZXzSHabHmkZmdYYn6wxsDUds9ufoSyvJZT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/WbjtvSQ73KMlNg3pUpz4lJw0fJgJhWmUSlxfxFMWEts7U5Cd
	SfOVVuzWUHhLy8wkXhKEY9OTOJVNAwOxv5wpCXCCDfdD6YQPA6mbSLwr
X-Gm-Gg: ASbGnctOk2Fy2PDiWY25ErlKa3NaZra5H8P+7Ai4631lwhFsCl2iZs3LVZZuTbgRg/8
	xUDyM+c3jf8CQZcM13OdowBAasUWSUahS/FD64s6gbnaM8cZbHqEx3Aj1jcXfFgoMtO1ByelH5V
	LbF4QIZcMykoO6SM5JNF/fnbaUobHbNHP2wl+GYg4ltmhMJvKsqplXlRDUkVQiEnlyTMwQGrnp9
	1il8jeMgYuWSE8/7g6q85hXJc4MWi8iIwCW7KY7BJ4s+eD6mBdCM3Rvf9IAKKVKdXLrvMTHfhD+
	QbRnAmexyvgy2GTKD+M/v09e6WTjFMJRW50+f5tKQTPkUsF3ik17e4OT038C
X-Google-Smtp-Source: AGHT+IGUDa7JtBq2dvoPFRpR8Ucsyx6ySznxILJ7IulGOvVCBM169/ICR1GV4mTL56zEZimS2JYQug==
X-Received: by 2002:a05:6122:119c:b0:52d:cc6f:81a2 with SMTP id 71dfb90a1353d-53121e8cdeamr1223105e0c.6.1749614396582;
        Tue, 10 Jun 2025 20:59:56 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5f6a::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53113c0ee7fsm2411261e0c.41.2025.06.10.20.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 20:59:55 -0700 (PDT)
Date: Wed, 11 Jun 2025 00:59:48 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/4] PCI: pcie-rockchip: add bits for Target Link
 Speed in LCS_2
Message-ID: <aEj_NDgaFJT-oceR@geday>
References: <aEQb5kEOCJNQJMin@geday>
 <20250610200744.GA820589@bhelgaas>
 <aEj7-6fMGKSXQb3J@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEj7-6fMGKSXQb3J@geday>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_205957_649994_3B65FC92 
X-CRM114-Status: GOOD (  12.03  )
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

On Wed, Jun 11, 2025 at 12:46:10AM -0300, Geraldo Nascimento wrote:
> Hi again Bjorn,
> 
> Your message reminded me of something that may be important.
> 
> During my debugging I had the mild impression L0s capability is not
> being cleared from Link Capabilities Register in the presence of
> "aspm-no-l0s" DT property.
> 
> I can't confirm it right now but I might revisit this later on. From
> what I've seen it can only be cleared from inside the port init
> in pcie-rockchip.c and does nothing in present form.
> 
> Not a clear, confirmable report but something to watch out for...

Not correct. ASPM bit for L0s is being properly cleared according
to my printk's.

Should have checked before creating noise. Sorry.
Geraldo Nascimento

> 
> Regards,
> Geraldo Nascimento

