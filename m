Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EEFC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NdjXka56cznUdQuW4uynCPh9h5JevUOrNvyaWjWaMV4=; b=GiR5cds7Xu3uWKSBATxe5nn6qn
	/KQNEKi5hWOIPKjzkwhxw2u6S1L3IlAajAI3I96slm0wjK23nPN0adtnYUCKPswOaxIPQb6p9kTYZ
	GgqLtn4S8uXyk+w2Rr7AOBA7qF/TePZ0sS2Bwp/UTAxQiJ6ILU4eD71CczblCgSlck/sed1bCR8sh
	FqBwphyzH+LdJqUP92ATxS4996EfSHPI/CfO1xvdbHNFURda9pUbl2VvnDVSQZp6CuxO6/U+1tFm7
	WSCsCrXUxcEkv80v3ZoCwl1v9EOsaEnUWHFukf43wT/G1nsSgrUIMsTkF/xWXVFdSmOMccZcFzLcw
	uqnRtH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrKD-00000001ZgA-1iDb;
	Sat, 07 Jun 2025 11:02:57 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrHz-00000001ZG9-3zL9;
	Sat, 07 Jun 2025 11:00:41 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-747e41d5469so3319446b3a.3;
        Sat, 07 Jun 2025 04:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749294038; x=1749898838; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NdjXka56cznUdQuW4uynCPh9h5JevUOrNvyaWjWaMV4=;
        b=lPHZw47ZK0E7JhMTO5HDtH2ukQyxkVU6XXwuuMgXXtDGzrj7MriOemn6PdzrFj0w9w
         bz6tdWAc4wF5QQcBCyR9GTx7lhVT9pcr+vbGMJ41M3hon9akI8y0goZyu88sopzOs0B4
         FFHsHeqQ7qoru06CpG86+uU7hQEt5YIH4mebjHgGErpnsEWYYvO2mq20R9vDILNcTVNR
         9/6077lS7L2FkmXl92F/z9etGmQ7kzGU2RneWnKZkvhcXmiwannEv+0rHyLEfAODV7Cs
         iRN8NyBF+U1a/lKlVxb1fhhaCQxEjjnJIryUaxNsp9eneMgHoHzJCzkly2PGUWxFHKKl
         Jb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294038; x=1749898838;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdjXka56cznUdQuW4uynCPh9h5JevUOrNvyaWjWaMV4=;
        b=H1L3bQFDhtlWp6A/7iTqmXQHzY11IioGRvhY2HNZOMyHu1RXyesfLu4EWI4O/6Rtq9
         AAP809h83jS9eX1MIzDzQqhXbk8YWVzx/nYF/RmhY56DEYTt72QM1Z0RcQ8yPwLgyrMA
         gGxJKUDSARaFGUjJy3nHFvNsmqgDk5DQw7M2qgZpBacVCOAx7XQZOjboGXQBKMtfqT8M
         q8Czg54qB+R3JWqAcQ2DpgufkOSDRm2zus7oF3zrEXBb0R9ZeNWFeWlJtjHrzKqPwoQO
         u+i9ydJpZAB52ZOu7rHNJKOjk/gIobd1qI8QWPJVlzZJbjwN6O0EwjJ+6vXRoAP3VO/S
         x6ow==
X-Forwarded-Encrypted: i=1; AJvYcCV17D1nziXrECYKISwFjnHG4FTszhYLqL7DEdxyOXNUYnYLOl8mvhZPJIgG0BHZrYMhh4z6LT/mOWw8ymUwFol3@lists.infradead.org, AJvYcCX1MssbZp2NjqrhBILGNxN4VmzKCI+FpWddUDiUaInGDMNqKkLgVvsgVK3Y0aBtjnbEGRkggUanX0tx@lists.infradead.org
X-Gm-Message-State: AOJu0YzXoGC1PphsE7ZqU6Dj54YvmEnQTwezRhzFeV2A0b3fQ2x+AZZV
	WR3dmAqkENv6f5Xj+nQBWk6s83rXDi258bwtBXNblZWGnbiT10YHm2oQnan3IoiV
X-Gm-Gg: ASbGncvBj7TpPx6ZjOL7zGEdz4zR778xpSE864INAFy7fozuZbVJz2fstY0YXrCQEU8
	NHW4R2yKC6VChas/erH9FnnMaAAYYpoVE+Dy+5t+J2UiX4f2MCyYuuQs/EkUAcEp6hJesXm0T/h
	gwtzqYjOZz+vkXxI3uFhWuFsYSajdmxH8SPWLNK4VOgpC2KXXyf4z24myMbNzje+23a9V0wrnce
	ZIhCETlUieSnnrNOc6mUVB6S5Ggq8ZNyG6AEv+qa33Ry+TublkmcW+93Iv/Mbpg32sESwgKaYOC
	9ipHi8uOKkLrjHHXlSRUxyMs3JsbfJpD0vNZlGk=
X-Google-Smtp-Source: AGHT+IGRYLSWTyAi936hLvd6o8149o/EyQpTWPHWvpkegPUAF8UXGv9uvJGM0/mU1HVRhc7meRbayA==
X-Received: by 2002:a05:6a21:9991:b0:1f5:8f7f:8f19 with SMTP id adf61e73a8af0-21ee25d62e8mr9048461637.10.1749294038311;
        Sat, 07 Jun 2025 04:00:38 -0700 (PDT)
Received: from geday ([2804:7f2:800b:2bc9::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083abcsm2642030b3a.92.2025.06.07.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 04:00:37 -0700 (PDT)
Date: Sat, 7 Jun 2025 08:00:23 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/4] Quality Improvements for Rockchip-IP PCIe
Message-ID: <aEQbx0Qu-2UKhV1y@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_040039_994959_3CA88E9D 
X-CRM114-Status: UNSURE (   7.37  )
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
5.0GT/s, on all four lanes and plus if anybody is debugging the PHY
they'll now get real values from TEST_I[3:0] for every TEST_ADDR[4:0]
without risk of locking up kernel like with present broken async
strobe TEST_WRITE.

Geraldo Nascimento (4):
  PCI: pcie-rockchip: add bits for Target Link Speed in LCS_2
  PCI: rockchip-host: Set Target Link Speed before retraining
  phy: rockchip-pcie: enable all four lanes
  phy: rockchip-pcie: adjust read mask and write strobe disable

 drivers/pci/controller/pcie-rockchip-host.c |  4 ++++
 drivers/pci/controller/pcie-rockchip.h      |  3 +++
 drivers/phy/rockchip/phy-rockchip-pcie.c    | 16 +++++++++-------
 3 files changed, 16 insertions(+), 7 deletions(-)

-- 
2.49.0


