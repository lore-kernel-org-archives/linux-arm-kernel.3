Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E561FC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 01:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NXz3exVEQXWDc3wTEzEXN840OGMK0hx/i3YSgfAvZ0s=; b=Tw8vO+g+xNsLQ/XYsOD7huT4Q4
	CGa+8yucmxcR2Xhb8vD0FHrhkOu7U6LMM51dQ2xUcsjdibflNs2kVw/47o87sFKrWE67StPNQD70V
	nbFBva2scSjY/x7zWJwslCBxnvu3+UIN5e0SgCMGCruSUDz5n3uMqaz+e26b/TkSnzOCuh2TiaUMH
	cRqYVRtZnUi+M4y0OxOwLRridREXQyyD6UyQ0t+80qSGcMJohfrZmeUVE0OTi4+vb+Fu7IwfdsTY9
	PgOlP3ca51BaVXRDqiVyrEL38tg6vdKEMHjFr5rNwO2iDlPcOiG4LvDGeg71InBJpx4qprwZmRuUp
	fPvNMtJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSnNE-0000000GwFG-0k4d;
	Sat, 21 Jun 2025 01:50:28 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSnKx-0000000GvrE-3xiw;
	Sat, 21 Jun 2025 01:48:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-234bfe37cccso31991155ad.0;
        Fri, 20 Jun 2025 18:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750470487; x=1751075287; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXz3exVEQXWDc3wTEzEXN840OGMK0hx/i3YSgfAvZ0s=;
        b=NKyjYepAistIoUtC/cHcrZYxx2WrOQkOOyXQmjze0u38TAVBH02O9Qee9B+/Ip9F1X
         fIVqdStMhCb8BVz3bb/QUJENiedykSa8aeE+9fOOtgB/f8P33id4ENTM0aqRGN/ave+t
         k+YxZDTk6l/mdWIT2WnXox6nP4Y8tECmfZg2YTihsrQqyZwEiT0Zz6dA59GJKj3Vsqpj
         z0AfCPkwHqIFCWbCnIGhHShVOpgAtNDGZOZCFSM25qw1ceXB0525OtMGLtb3cir+d7kZ
         q5WfqVGo78tWq3OeBJW1cNkb9RfTHgdF3caNO1RitW8C5I74JFtmMx1dww6ybDydFWgy
         lhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750470487; x=1751075287;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXz3exVEQXWDc3wTEzEXN840OGMK0hx/i3YSgfAvZ0s=;
        b=cjIHc+mSjfE9iIjcspf8ULInodtwxEkEfI244yhGoqvCLWM/9dMwJxwetYhEhQ3JxB
         aB/gUP50UXXVG7jiOkO0qyyYjGjNL00GDGQrAMxTG5f5bMPHMcDOAJ0t/Hg2spVI7dO8
         Lb/tSn8isFFEKz5ugKnR+eWGonIeM07CUW0QtjSCg1YOgnwb4MuER0NW9NK8+sj7omHN
         S7HGu1oZG09Wn8nUab94ocgRIVrGLg+i8NLzo1Hl1RhBOPi8mbVAO8pVOGlSPY7RakLU
         /FQScSAP24MOoAG5rbALp6AlrpQEkQeoUDabNCFXFihdO2lWuu6ITQ1EIGLNy1JJliZR
         P4jw==
X-Forwarded-Encrypted: i=1; AJvYcCWIcgFR1YRQ48KJCl3MH2Rm7y5S19W3sTpy/ME7hXZok9XbNU/eN3Ep+SqrO0lqzxmVSTJWHus3wykM@lists.infradead.org, AJvYcCWs6ewGlfRPtwe/QfuWlt0NO+r2BUKv6/cf2YyNmjccEss5lTYN9iTUIFMf8MCwjRMpq0+3JVH3274q77zC/HMf@lists.infradead.org
X-Gm-Message-State: AOJu0YxOt20m5OElWWGImLITZKP+6KLhm7y000+DcehtFHiiVQEBtVOJ
	NKH11rag5+AhYyBvbbIRBpfxtmg+ck97IJ5Q1DPss9pYE9rsF5Bo9kGv0O7WWRhF
X-Gm-Gg: ASbGncsxt4LXs1wmtsJ+42USsXrAX1ZjT+IIi0r2iCEq9tY6A2mphKT6kSZQsH01Yww
	VHZmEenOEFfVlBjwuU6XcxJf0W6m09ZmLvAR8UPCHJq7eIiDDEl4FWTyVpRNjnSuHLnxlT63hLO
	pJEUoWlsFb+XhM4jBuyaaOFAFnlTcln3kCyZt0By/iynzQLLBAGScwSi0hh0tSOnlZq1daXLja4
	/unzyEtVeuNUEElcEJESp2wUkOkfeRHMeMUPMuP763USx5Hk17ZowN5AG+T4aQnrtscdwy127hH
	7p3iZ0ZmW4FVOjpNj++nGFpHnNvGJKQRwKLJtlfqEieebd+9oQ==
X-Google-Smtp-Source: AGHT+IFMj8zujnmQyUnnom6Sk4SjVcrZEQeYPoia8cwd9VCLwZSbqcg4mJosbw1axQAjm2sXPpgR7w==
X-Received: by 2002:a17:903:32c5:b0:235:2799:61d with SMTP id d9443c01a7336-237d991f9b4mr79363855ad.33.1750470486935;
        Fri, 20 Jun 2025 18:48:06 -0700 (PDT)
Received: from geday ([2804:7f2:800b:d1c8::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393893sm28573845ad.25.2025.06.20.18.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 18:48:06 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:47:51 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v6 0/4] PCI: rockchip: Improve driver quality
Message-ID: <cover.1750470187.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_184807_989316_0D54E89F 
X-CRM114-Status: UNSURE (   7.51  )
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

During a 30-day debugging-run fighting quirky PCIe devices on RK3399
some quality improvements began to take form and this is my attempt
at upstreaming it. It will ensure maximum chance of retraining to Gen2
5.0GT/s, on all four lanes and fix async strobe TEST_WRITE disablement.

---
V5 -> V6: reflow to 75 cols, use 5.0GTs instead of Gen2 nomenclature,
clarify strobe write adjustment and remove PHY_CFG_RD_MASK
V4 -> V5: fix build failure, reflow commit messages and also convert
registers for EP operation, all suggested by Ilpo
V3 -> V4: fix setting-up of TLS in Link Control and Status Register 2,
also adjust commit titles
V2 -> V3: correctly clean-up with standard PCIe defines as per Bjorn's
suggestion
V1 -> V2: use standard PCIe defines as suggested by Bjorn

Geraldo Nascimento (4):
  PCI: rockchip: Use standard PCIe defines
  PCI: rockchip: Set Target Link Speed before retraining
  phy: rockchip-pcie: Enable all four lanes if required
  phy: rockchip-pcie: Properly disable TEST_WRITE strobe signal

 drivers/pci/controller/pcie-rockchip-ep.c   |  4 +-
 drivers/pci/controller/pcie-rockchip-host.c | 48 +++++++++++----------
 drivers/pci/controller/pcie-rockchip.h      | 12 +-----
 drivers/phy/rockchip/phy-rockchip-pcie.c    | 15 +++----
 4 files changed, 36 insertions(+), 43 deletions(-)

-- 
2.49.0


