Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478F1C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vR3S5bFvr+HUo+LPE6J+nwHXZjEwfOX2Cga+g88x6Q=; b=aJeL2LjLIFJ/qvky5Q48Ly78qN
	qZFc1Od3QC8Qk6gi0SGDg3MgkJOIo5wn0zLYfxnG+JIPynPR1EWOaXoGMUIZaxCDgWTpPk1yxUH5e
	/KtgZ4UgD5oG66WyYWcoKsKrRD0ccoQA6kaxMaSBlAh1xQwQzY2tFMpsTQfEIuK18sdh6YP9Sl0D5
	UE6T/z42SV4UOLWXWIT/YUqGWYvNKUerLntZRZJa/3Trz4hCXBbBliSIA4uLqWA+RPa2Ac/e6Nnq4
	7m8JU85Gv6GsUwfn7GEPZV8u7RgcRAysvxH1HTisf0t3YAHIZKDf1A6Xo5wDRTlJh5Ov6+GEnjvqV
	cWOXhSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQL7-00000004Epu-0XwC;
	Fri, 09 May 2025 16:12:45 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOMv-00000003tV6-1SHk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:06:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad1b42d7ea7so29038666b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746799587; x=1747404387; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1vR3S5bFvr+HUo+LPE6J+nwHXZjEwfOX2Cga+g88x6Q=;
        b=gZumnxevTUDRpZGTmxcMUT1A7GzN3DmIk/HWtPoc1Nk3BAsp4L/G6rdEDYli6YlYc2
         FVZ3URRI+yvmK+wB7PV+71HJiQHNepwyQnPNsY1dCMexz91n4eCbNSmGolg9+6E+99Zf
         mE4VoYJGALbAqYVbituLsTdV3fy4w48bcIFH8UoPzuburZwDn83Yps4fKZCQ+EhQQaTL
         c6/3ST0HJXvx2ecCd/qRgfofSmTLyeZ8xW0KMSqB+BwUIIyHJu4zTNcEDhzOjPJuqPAt
         FGFGDilTOskmuqCSBsDc08bbFX43EcEZaGqrePs2lD4y28PEveGbmicMRrU73vPnBFUA
         hrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746799587; x=1747404387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vR3S5bFvr+HUo+LPE6J+nwHXZjEwfOX2Cga+g88x6Q=;
        b=tZCNUj3+xZlEQkVokkikcM+CIKpYX7CbCGl2dusoODPJ3P5bI+4pkHMxphSXMOC7kr
         aqMxnoIBFIR/ZzO6g77B9BQhbWia3S5cbkOpDkyPH1kTZpOAb6KAi+pnLbFpsz2K5RLw
         hDZWsdHKV0K0mYpZnt1XjgY9xva1BYlEk/0K2ngeVuD99KIx35aIOQ++kKSnlZd6OiXf
         HYtu/vqa+15fq/Ru5rlUtgIe/uHBjOS7QEbfLez9cT0rM2OmloWd0DwMb0P1EhxsKRKQ
         BgmutmC7b3YXrFTSULaXBrj4vmnomkaHfLcZxh5fgHhIAE3DJ/ODvrmbIksDM1fHoDpm
         J/MA==
X-Forwarded-Encrypted: i=1; AJvYcCXEc2VNlBrVxKV7L/myFvPsPFcScdzx0T8+ypxcnjHICCL//4edRWKrQEl1/J7jJhE1e/zrANN+ad6eM3VVeuE8@lists.infradead.org
X-Gm-Message-State: AOJu0YyoRAshm4g7qmxf3Glb6gfmWHDI6ZtMUVABBH4E+e0Tej2rKIHy
	93SA5NNLgTpWQ39PL9UgLJY6exzySS1adsvK5lhg2zFICLtVXxnO
X-Gm-Gg: ASbGncuj7aD+AmMGOHE6PDH6BTv5JnsEKMz09bYnrGUbjVVmM9SHopLJ1vcaYbtPI92
	z5ydcNarkgZzxELtVpjtce56Lycxry8ih0BokYNweEEQ4ncsYHKRzo6cBtmJ54lsLGfQa9j7cEw
	Bb1s45u0K85/GWph85Ko+ZRMg9/uU+lohQhD5KY152jYrufUebnHJrX9JJne0cK0VKNd69uYjfv
	+tmgt63syuGsc6xXMHIAWk4ZjuB8PUwzuIVn3cAQfTo2h11gg/SSpENfHsCMvPLJISC93xP+BiH
	4o80c/E1to066w7huc/6je4jNmQK
X-Google-Smtp-Source: AGHT+IFyBqJPuUpd/VkBty6rVNROepduGUENPpZDSw5zwcqT5KP0a0bpgkdNYr+JHP9i1uJjIlcABw==
X-Received: by 2002:a17:906:8474:b0:ab7:5fcd:d4db with SMTP id a640c23a62f3a-ad218f68a14mr108916866b.9.1746799586548;
        Fri, 09 May 2025 07:06:26 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192d4a1dsm158053766b.17.2025.05.09.07.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:06:25 -0700 (PDT)
Date: Fri, 9 May 2025 17:06:22 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com,
	arnd@linaro.org, andrei.stefanescu@nxp.com,
	dan.carpenter@linaro.org, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Xulin Sun <xulin.sun@windriver.com>
Subject: Re: [PATCH 03/14] spi: spi-fsl-dspi: restrict register range for
 regmap access
Message-ID: <20250509140622.n2tc3dd23ylyux72@skbuf>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-3-32bfcd2fea11@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-james-nxp-spi-v1-3-32bfcd2fea11@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_070629_387512_02FA5797 
X-CRM114-Status: GOOD (  12.63  )
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

On Fri, May 09, 2025 at 12:05:50PM +0100, James Clark wrote:
> From: Larisa Grigore <larisa.grigore@nxp.com>
> 
> DSPI registers are NOT continuous, some registers are reserved and
> accessing them from userspace will trigger external abort, add regmap
> register access table to avoid below abort:
> 
> Internal error: synchronous external abort: 96000210 1 PREEMPT SMP
> Modules linked in: fuse dummy tun hse sch_fq_codel openvswitch nsh
> nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
> CPU: 2 PID: 18231 Comm: read_all Not tainted 5.2.33-yocto-standard #1
> Hardware name: Freescale S32G275 (DT)
> pstate: 20000085 (nzCv daIf -PAN -UAO)
> pc : regmap_mmio_read32le+0x24/0x48
> lr : regmap_mmio_read+0x48/0x70
> sp : ffffff801123bb70
> x29: ffffff801123bb70 x28: ffffffc873b5c000
> x27: ffffff8010b408f0 x26: 0000000000000001
> x25: 000000000000013c x24: ffffff801123be40
> x23: 00000000000003ff x22: ffffff801123bcfc
> x21: ffffff801123bcfc x20: ffffffc873a9e500
> x19: 0000000000000024 x18: 0000000000000020
> x17: 0000000000000000 x16: 0000000000000000
> x15: ffffffc876189160 x14: 0000000000000003
> x13: ffffffc873bf73ff x12: ffffffc873bf707e
> x11: 0000000000000000 x10: 0000000000000000
> x9 : 0000000000000000 x8 : ffffffc83fca4e00
> x7 : 000000000000000f x6 : ffffffc873bf7083
> x5 : 00000000fffffff9 x4 : 0000000000000002
> x3 : ffffff801061f058 x2 : ffffff801061ee18
> x1 : 0000000000000024 x0 : ffffff8011490024

I think you can leave the register dump out, it doesn't seem of much use.

> Call trace:
> regmap_mmio_read32le+0x24/0x48
> regmap_mmio_read+0x48/0x70
> _regmap_bus_reg_read+0x38/0x48
> _regmap_read+0x68/0x1b0
> regmap_read+0x50/0x78
> regmap_read_debugfs+0x120/0x338
> regmap_map_read_file+0x44/0x58
> full_proxy_read+0x68/0x98
> __vfs_read+0x48/0x90
> vfs_read+0xb0/0x130
> ksys_read+0x7c/0x108
> __arm64_sys_read+0x24/0x30
> el0_svc_common.constprop.0+0x74/0x168
> el0_svc_handler+0x70/0x90
> el0_svc+0x8/0xc
> 
> Co-developed-by: Xulin Sun <xulin.sun@windriver.com>
> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---

Do you have a reproducer for any of the supported SoCs? On LS1028A, "cat
/sys/kernel/debug/regmap/2120000.spi/registers" runs fine and does not
crash.

