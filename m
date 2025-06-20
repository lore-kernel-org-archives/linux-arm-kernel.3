Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B109C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 12:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NmLYBG24ijAXHoIQVzJvB+/26hO+EVlKH3Q7Q1ZOAU=; b=XdSBnqx4ZwUPWRfdyf3YU0AgB1
	ei6rpoVg26Wza26ca7jc9voBSbiZ+HoKMvqUbLdOw/YyjGvwFGuUxQHq3YzzcWJSjRvjYMr1nMl2W
	vnaWLiO0cwLxNA89jP1Zle+mDtCa5UZkA+3G0rwVoCHUOEJhM00IFep46zJOmPkLkY+Q9tvz8CL0R
	1vNRa/HpTHzi187fVyyzXz33ZlzHAJKgzaxzQGdaI0E3XOGproWguJn5BxlAub66AxjBCbJCF+mKx
	fq3sr4Bb+pl6unCzFbLJ6EG8coFJJYYpg193isIZNSLLrOsuCCsvxoj8gvN43F53hkZRgKY8Qnqq5
	fnvj6Ngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbKS-0000000FdZW-46CL;
	Fri, 20 Jun 2025 12:58:49 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbC6-0000000FbXp-0FNn;
	Fri, 20 Jun 2025 12:50:11 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-747e41d5469so1778671b3a.3;
        Fri, 20 Jun 2025 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750423809; x=1751028609; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0NmLYBG24ijAXHoIQVzJvB+/26hO+EVlKH3Q7Q1ZOAU=;
        b=BFW7pzDNvAVNdZxzHbUIw7pzzc2ohlFCCoG9dInphj0YFfFSDqN3ljF46EnkaGzbpz
         xSBOM6E/0YGrmgQvxBT0tAk/uvKN5ujhvO0N1LHHMw/Ejm7dFIEFFpA0INchW5pgY9/W
         cLONrD2fPdQ8avJMtM/qMsu5xl81JciD2YRkt6RWbntehYBnNtxoioHcLRmczEJF0H8m
         A21zNrnlcF7DyzW3GjCKOOOne4TQ+GakEGI4a7CgY+/YvGPnrIF1Vpo/UCNiuNuaRHnH
         QBdfsvBQd/8lNf1Ob/QrXsTpudy4NPLEuBlBEcq4hlzeWZzGBimZPnBCPfS1L0oxWWjP
         qeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750423809; x=1751028609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NmLYBG24ijAXHoIQVzJvB+/26hO+EVlKH3Q7Q1ZOAU=;
        b=nEgCws/S0R0ffQxpjT7cCSkf9FIrnlhY6o/Miz3AsOsmBD4fpbCKlDNpEgJKQ2H1nt
         pKTtL2jUde9BbaYOoRCp/gLe7S3JYhIFE8i/GiazEfLW8BP3pkMTfKt0TW2OBr9J/RRn
         dtkz36fsXVyP7yD1RLPgY64VkV4mlNQbV6cHN9GoTmq0lyhSUPOggGP/G5g/BnaK5pTB
         etJ3BE19n3oE3U0ZkT0hmvQ2NG61YaeDgHLtjtgXXX6GM14JHQi01Kec9pVCjV2c51GY
         cVo318VtTfII2KmD7TN+bqpMVOprGSPTfqX2EkoTigvUEUamUFLlc6RpItt5JOfrZ4uZ
         rpdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjSi7CyRqAN5j3Qy/YM5buKYgpACXVFJowgc/UT+09hgTy8mSEbN/6+ED4hnvVN/qLiuwRjH503n3sEqTaTIle@lists.infradead.org, AJvYcCWVGN34qLwbL/m2tWNndmJxRW7F1BVmKkTaUFR21OS5QWiL0XtNdA9uZhR+AdNgDfgImSsSzSrk3qNd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv6f+gK5B6u8qrGvSGrprKoR41SgnGF12rsDAnIAIVSMyEiwPb
	BcYC56oHYrytHZ/cvOodARd25Pb8JPAg4cAtxzk6IIhTVEy78T7fEGau
X-Gm-Gg: ASbGncuBVDtru5Zz9psTQOzM1BJp85kwcNsTPNaRHn+K9YFxID8vyfda4GC+OWUYCHP
	NOqNh3HORrBA0OGvm4FwlTyLaWhNKPG4zu7pAyQk9BgFE7QWH8mBig2ER1AFMCAA1srdksYXTCZ
	1kgybNKG9oZHIloPJfsQ/6aIwRVpL6k9x1jXLH/3OfXWMchjgTmftgpcTv5zr5y3ihO6F81AFiU
	3kmj+0TQqRLUv2SIWCtXm2kD64VSPBFmZ2ircrG/PTiuWqu2/zpB8XWa/14ffYaunD3+EP3HsB6
	PFtRTtbbFN4DG2CV2t+HdVpkkhKotvMk472Px8TvES1cGqqW4w==
X-Google-Smtp-Source: AGHT+IFHPYDIR4or2vPqPU1VUvmiA2iVM69SFwDRvDzb2cK3GvAtLoyB4Hkk467Mv/TfqKSO9XUqHw==
X-Received: by 2002:a05:6a00:1a88:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-7490d6bf6d6mr4497789b3a.24.1750423809249;
        Fri, 20 Jun 2025 05:50:09 -0700 (PDT)
Received: from geday ([2804:7f2:800b:cab9::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a69bb99sm1950566b3a.155.2025.06.20.05.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:50:07 -0700 (PDT)
Date: Fri, 20 Jun 2025 09:50:01 -0300
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
Subject: Re: [RFC PATCH v5 3/4] phy: rockchip-pcie: Enable all four lanes
Message-ID: <aFVY-YtSTxUpJkIa@geday>
References: <cover.1749833986.git.geraldogabriel@gmail.com>
 <ce661babb3e2f08c8b28554ccb5508da503db7ba.1749833987.git.geraldogabriel@gmail.com>
 <4c2c9a15-50bc-4a89-b5fe-d9014657fca7@arm.com>
 <aFVTdYWxuq9YzVQR@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFVTdYWxuq9YzVQR@geday>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_055010_098199_731C5238 
X-CRM114-Status: GOOD (  22.92  )
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

On Fri, Jun 20, 2025 at 09:26:36AM -0300, Geraldo Nascimento wrote:
> On Fri, Jun 20, 2025 at 01:04:46PM +0100, Robin Murphy wrote:
> > On 2025-06-13 6:03 pm, Geraldo Nascimento wrote:
> > > Current code enables only Lane 0 because pwr_cnt will be incremented
> > > on first call to the function. Use for-loop to enable all 4 lanes
> > > through GRF.
> > 
> > If this was really necessary, then surely it would also need the 
> > equivalent changes in rockchip_pcie_phy_power_off() too?
> > 
> > However, I'm not sure it *is* necessary - the NVMe on my RK3399 board 
> > happily claims to be using an x4 link, so I stuck a print of inst->index 
> > in this function, and sure enough I do see it being called for each 
> > instance already:
> > 
> > [    1.737479] phy phy-ff770000.syscon:pcie-phy.1: power_on 0
> > [    1.738810] phy phy-ff770000.syscon:pcie-phy.2: power_on 1
> > [    1.745193] phy phy-ff770000.syscon:pcie-phy.3: power_on 2
> > [    1.745196] phy phy-ff770000.syscon:pcie-phy.4: power_on 3
> > 
> 
> Hi Robin, and thanks for caring, it's excellent to rely on your
> extensive expertise on ARM in general and RK3399 specifically!
> 
> However, on my board I'm positive it does not work without proposed
> patch and I get stuck with x1 link without it.
> 
> There are currently very similar patches applied downstream to Armbian
> and OpenWRT so at least I'm confident that is not only my board which is
> quirky and other people experienced the same problem.
> 
> Thanks,
> Geraldo Nascimento

Hello again Robin,

for reference, here's the commit for OpenWRT, originally from Armbian:
https://github.com/openwrt/openwrt/commit/2dc9801fe81ab3c092d2ca75e4c63f8d5eea46f5

Please note that the author of that commit specifically mentions a warm
reboot is needed to trigger the "stuck on x1" behavior. That author took
a different strategy than me, just reordering instead of using for-loop.
I'm open for different strategies, but the report is real I assure you.

Geraldo Nascimento

> 
> > Thanks,
> > Robin.

