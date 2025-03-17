Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCD0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sivy2dFPDfrrWNy8pgqRVOZc7Oa4LQfVg4rx4RY+3RE=; b=t+UU3ZkFQ+6yQUwppo4DLEIny3
	EeuQDaplWQ0QEIpyYrWXFkjM2quwVhzMWdDr0AHrnylLwvGsuIbWcbKRWjdPy+vcCFL7wSdPi+t6E
	XCpFiewYt/hhBlLKt9mPPGUxXj5lzhMwdiUwltW9dq7uv94kcOrt0jY9A/PDKQ8rPfA/FmnCnZgl5
	UnjX65rN0gTw+i9o+ollwWUTQH2ihBQ2ft4Ew17lIWigYN/5irc4uz+4vn3NIY9nBYgyP6vm6OOsa
	cnV7ix2cSpOC/DqBdZblAknhb3h0pqTcmLuXCmPMJoEs42XfWpCBuMextL5PLza3e1C1W7QY2u2SV
	0u8zV2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6BS-00000001oUa-0yY8;
	Mon, 17 Mar 2025 08:50:54 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu68d-00000001ndu-2ceB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 08:48:00 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac2963dc379so707342466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742201277; x=1742806077; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sivy2dFPDfrrWNy8pgqRVOZc7Oa4LQfVg4rx4RY+3RE=;
        b=hEdwj19HK164ixyf7CYB1z89p2kGCZp6wRL4woM7GPgJ1fo+Kras99gaiIIXIrQY0l
         1iPD24RgkPddcR69ky+Tk1icasw95JvNEUiGyQWn1NZvowiQCxQE3D+w+9ysEVpf8/12
         fCYcPWP4x5kWw/oMSvjEN2KAqtiDbYRmExq6Yuc+wRQdrMEmbaJ2OtNXqLtYh4ilPZnT
         RTVg6BVIbOuJv+PT4p2rfDkeSEL8brvBV0TnIJui88zBcTHawWdzky/Idjli0x0rvhqj
         vOLskRa/P26D6h/hHAYhqGtwKYiFgstHCwBM8C6Hsn53YAvsui8wHklXw+ilkjienlQ3
         Z5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742201277; x=1742806077;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sivy2dFPDfrrWNy8pgqRVOZc7Oa4LQfVg4rx4RY+3RE=;
        b=KGbSPa94jx7TL5Th0XuXVPd/00NFzMXtZ2EdbNcf76EKqu2C++/W/v/dKStSnSz0Vy
         PA9yk/PRUdryZ8SyaTN0FQMPdFWF2aoXGr1v9c0ifrBnveF4ydseTWig2teAW6biRmUM
         3JGTjY4vcPWJhTecnamP/k+mqZSp9c7EECy8qJwyzPK7hZzOsMuE0TGrlDiAkn6S8rHA
         z+xY9dC3EyxOMIykIKOeKFYk6InkbtpvegCn2KHseR4dtecF4HgM/arpqOMGpZ2pDWXu
         sESjRvk6K0Rv29RYDCUXMYaEX0Khz69Z4kYrE86+vXZRasZFeJNMRU3UUB9ooIVJTVT5
         Fw3w==
X-Forwarded-Encrypted: i=1; AJvYcCXoGCJFM+tdTE8XuAlCK5TDuPH3FQeDmjPxyOdIarpjP/IYiqd0EpvuE16PFePnKx9Myk477LUHuHfCHfur3ieW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4XuJOx/d2Lql3fLP2Yiwiqa1EZZlLevsYYeNos7wOyRViIplZ
	PB1ONv6T8hLut17X0TQqNKOqaM9VgKn6bco99/TfLONQjEo4+pnL
X-Gm-Gg: ASbGnctIdHyVCueDng+35ssNz6nuQV67xEI0J9C1IgXYHQEPp95WpaAq4nzx2zBRXLu
	TU6kxqPRls8NmxtVGd4gQO/SOkZ5NOpcVupFu2x4ejgp7FgLsae4ns1Kp+Ae1obsutXSqiv4QdQ
	pYlN8e+EzLiLD0PV/K17zuvQeDD/uRKv8SMFaa9eVnqM17bwriV3Na9rJcAdEJvejm6Nl1r+7iH
	8utv3rMFo++A3jnPMswg9GMEDvX9QOFeQ4yag0zx5VmV5a88b+TyjIm8wRjTDcOugP98HKZXSuu
	1cT6GISDoJeCBwmTyJ5VAyx9uXs7UMhCVif+bVsO8Whpwj8DrkOrIb2injSwrOyZP8OdhE+dzmT
	R8bGwqWj77ck6HUbK9HYwOptvzfKTFG7ztaGhF+nI6u4=
X-Google-Smtp-Source: AGHT+IHWG4ioeUkKOqbyjHVa3nGcDKasGMk84coU/EEXrQ9CgoA9EeOa+Ei+KVhgfcSMQroZdbmSgQ==
X-Received: by 2002:a17:907:7296:b0:abf:6e22:cac7 with SMTP id a640c23a62f3a-ac330263c1dmr1241552766b.15.1742201277303;
        Mon, 17 Mar 2025 01:47:57 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-81-118-90-13.business.telecomitalia.it. [81.118.90.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aea41sm622028666b.28.2025.03.17.01.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 01:47:57 -0700 (PDT)
Date: Mon, 17 Mar 2025 09:47:53 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: shawnguo@kernel.org
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
Message-ID: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_014759_661976_061ADFEB 
X-CRM114-Status: UNSURE (   6.01  )
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

While playing with linux-next and imx93-11x11-evk via NFS and TFTP
I found that the dwmac-imx, nvmem-imx-ocotp-ele drivers by default are
not builtin then the I was not able to reach userland. 

The following configs were needed to reach my goal:
CONFIG_DWMAC_IMX8=y
CONFIG_STMMAC_ETH=y
CONFIG_NVMEM_IMX_OCOTP_ELE=y

is that something expected?

Regards,
Alberto

