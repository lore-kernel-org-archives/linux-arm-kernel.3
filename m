Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE21C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 22:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSaP5bu22sODePS3O3o6OuW/Yz/Yqp93mwqWTCEkiNY=; b=Ogt9/p2ZUvJXAT/T5RdXn9qymY
	Ie+0MjvYPXV46P+7GJVs0zoapN79pPPxIzjwqyvXENjiK2tc5Rxn3WNlFCfwhZ9Zk0u1ssyfA2Sue
	yi/wruQ3B7r0IVTqlnP9u/ciuZCoii4m1HBugfO/ugQiDld/9yiJ0jZoACp31vRSmGMNKKIIL6JTM
	hSHdEfuhx7v8NCE1zxDiWLH3HWAO87YPwNCzTVpu7O1Q1iOyxs0/zjC5h+r/bbPdbj1H9yx+tdalF
	s0IB0rIpLhw8aGvQ9uiGONCjO+sck4KljpXG/mtRPcOkiS+UOuP2i2RQggzoYThShioUswxYVGddt
	f/jGk27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNM7-00000003eHH-3p88;
	Mon, 30 Jun 2025 22:52:07 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMze-00000003bIW-1U58;
	Mon, 30 Jun 2025 22:28:55 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4a43afb04a7so18533821cf.0;
        Mon, 30 Jun 2025 15:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751322533; x=1751927333; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bSaP5bu22sODePS3O3o6OuW/Yz/Yqp93mwqWTCEkiNY=;
        b=Ij2hhTKJl8NNjlapTnJonF4ST75sZDNP/0RevRCG4I/HZM7+uCU3cWMTxv4rAJHB5q
         sZhJdIvq77GUbbJq0qCHL9M6k9ZkJVp44iaYWSpixsN6XLzhWeR3T3u/Zj0LOz11CLDR
         dDwuiGUGVEVdxynKuExoYPnPzMOY6wPd/LYOIyH0ds2tEvERJMdoJsarVvO60eEGBYQf
         D7NqUiT1E+Nr35+Ur8krqWwII30loU4uJE8cbe1HTdlIuLJA02HkYLTYSqBLohSBKVs6
         m9onO1OrDh7dApQ6BOfcuEZXT1dIJdbQ20c/hXwd1LsRq+dwb4DoBabhOdmOLmF+Kx6s
         NU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751322533; x=1751927333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bSaP5bu22sODePS3O3o6OuW/Yz/Yqp93mwqWTCEkiNY=;
        b=EoEGdmgwSHNGnGmcAXOqCet8RD9Sb3S9sr6gekxFNhdf4nvZvXXjWOkfUjSP7+HpsQ
         WkCedvYdMbXj8K8cGQer+oDTIYU++6YQgQA6vZzzPBR2Wbr25dCg9g8NjpXmQeaIT5bZ
         XruEeF+6kYhZrf4xLo2Ds62OEItE78KRgcpWUw8VyDMJspE2p5/DZHFK4aY1jMxEl4jn
         Dc1yd58XiOSPeV5ftovIFQzWWmkhAWrzdJPYmS6AFE3GvKcu5FLIHuuQyVVm4qeB3ezk
         lwKUGlEPZQKfE+nyWX/dmqbFl6Cf8SWCO8mgrMNveuiqMY4Z6XBNUXSRaWxpZEAdLh8i
         7NkA==
X-Forwarded-Encrypted: i=1; AJvYcCUgbnJqcm7CvYGfNVAaUlYpvJpfNs2acMhNfjzSpqbPPztDeZJFSCWuevDLDAHBrtaIf4cTZk8HXkWPQNwoESq2@lists.infradead.org, AJvYcCWozxxgE8llA1SGfXBff8n32mAQCWxcboRuqIJ/GHQx1HEC4NAHVDnJauO+khRhqUk95FmSk00/Cv4F@lists.infradead.org
X-Gm-Message-State: AOJu0YyBFlbSUEnuYG/yumW47k89Qd6jUPv8kulaUoYc+owjBY7jRJxd
	0jh1jCyLeRT9MxvyF1yL+WDFpG8bSHRt9zCsbIrSr/Tkg1lBYPUjNNC6
X-Gm-Gg: ASbGncvfMTVaGeoQ5Q08H85Ng3j2DiKILR1C/FOn2X9s5Kwqlw9Tikm0dmZqgOmhl3P
	Ai2DsKo0Yruvi/bqtAivx6U3CD/lP1KL8gWF9wR7uriMxp0c8dvBmH1JhPL6m4UJBNJrcoSZxrF
	iSMF7I0wv83wevCLRDNoxreSyLia1WinE2DYv/Ecw3yddK7vMg3Vmvzv5FdVz7LOy1jNTLzMnol
	QqXdYEaE80mosIhZOUTG0fj+at9TOsfBEXwNL9YLwLotisJvy6RIMyKIveTl9cXmO1PbUO17UY7
	eAgXl3UDztqZ8mTl8LWRzYwemMhRoKQkQP2dcpYirH8tsGB+VA==
X-Google-Smtp-Source: AGHT+IEMPUqeW45dRJW4czX3mdDVSLcJrOSDF/YCwt3dJID5kuK14Ei+8Rr00WsM+IEYTAg6AuZ/Vg==
X-Received: by 2002:a05:622a:1994:b0:4a3:d015:38c0 with SMTP id d75a77b69052e-4a7fcbc9f4bmr253146511cf.37.1751322533182;
        Mon, 30 Jun 2025 15:28:53 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4851::dead:c001])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc13a311sm66966841cf.25.2025.06.30.15.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 15:28:52 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:28:46 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/4] phy: rockchip-pcie: Enable all four lanes if
 required
Message-ID: <aGMPnvF-TLsmA8rz@geday>
References: <cover.1751307390.git.geraldogabriel@gmail.com>
 <d3e7dc38bd287aa93a5d6bba87bf3c428ae92ca4.1751307390.git.geraldogabriel@gmail.com>
 <4006908.X513TT2pbd@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4006908.X513TT2pbd@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_152854_391551_2676C3DA 
X-CRM114-Status: GOOD (  10.89  )
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

On Mon, Jun 30, 2025 at 11:33:19PM +0200, Heiko Stübner wrote:
> Am Montag, 30. Juni 2025, 20:22:01 Mitteleuropäische Sommerzeit schrieb Geraldo Nascimento:
> > Current code enables only Lane 0 because pwr_cnt will be incremented on
> > first call to the function. Let's reorder the enablement code to enable
> > all 4 lanes through GRF.
> > 
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> > 
> > Signed-off-by: Valmantas Paliksa <walmis@gmail.com>
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> 
> hmm, if Valmantas is the original author you should probably keep that authorship
>   git commit --amend --author="Valmantas Paliksa <walmis@gmail.com>"
> should do the trick.

Hi again Heiko,

Since I don't use git-send-email and instead rely on mutt to send the
patches it seems I needed "git config format.from true" to properly
add the From: to the email body.

First try mangled From: email header, resulting in Valmantas' name
together with my email address :|

I've resent it (hopefully) corrected now.

Thanks!
Geraldo Nascimento

